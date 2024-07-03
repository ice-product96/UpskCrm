unit upsk.database;

interface

uses
  IceOrm.sql, System.Generics.Collections, ArrayHelper, System.Classes,
  System.Rtti, System.SysUtils, System.TypInfo, System.Variants, upsk.types;

const
  twAnd = ' AND ';
  twOr = ' OR ';
  twNone = '';

type
  TOrmData<T> = record
  private

    FSQl: TSqlProvider;
    FSqlText, FSqlField, FSqlLeftJoin, FSqlwhere, FSQLMin: string;
    function GetPropCount: Integer;
    function GetPropNameEx(aPropName: string): string;
    function ParsTable: string; overload;
    function ParsTable(aT: T): string; overload;
    function ParsUpdate(aNested: boolean = False): string;
    function ParsHide: string;
    function ParsDelete: string;
    function ParsInsert(aNested: boolean = False): string;
    function DatetoStrSql(aDate: TDate): string;
    function SelectSub(aFldArr: TRttiField; aTableName: string; aWhere: string): TArrayRecord<T>;
    function LastInsertId: Integer;
    procedure MyTypeInfo(const AValue: TValue; out ATypeName, AParentName: string);
    function SubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; aT: T): t;
    function SubSubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; var aT: Tvalue): Tvalue;

  public
    procedure Init;
    function ProcessNestedField(ParentField: TRttiField; ParentValue: TValue; qry: TSqlProvider; tbl: string; var at: T): T;
    function SelectNestedFields(const ParentField: TRttiField; const ParentTable: string): string;
    function SelectArr(aWhere: string): TArrayRecord<T>;
    function Select(aWhere: string): T; overload;
    function Select(aSql: string; aParams: TSqlParamsArr): T; overload;
    function Min(aFieldName: string): TOrmData<T>;
    function Select: TOrmData<T>; overload;
    function Join(aFldArr: TRttiField; aTableName: string): TOrmData<T>;
    function Where(const aField1, aField2: Variant; aOperator: string = '='): TOrmData<T>; overload;
    function Where(const aWhereStr: string): TOrmData<T>; overload;
    function ExcArr: TArrayRecord<T>;
    function Exc: T;
    function ExCount: integer;
    procedure Update(aT: T; aNested: boolean = False);
    function Insert(aT: T; aNested: boolean = False): Integer;
    procedure Hide(aId: Integer);
    procedure Delete_(aId: Integer);
    procedure dest;
  end;

implementation

{ TOrmData<T> }

function TOrmData<T>.ExCount: integer;
var
  Ltable: string;
begin
  Ltable := ParsTable;
  with FSQl do
  begin
    if FSqlwhere <> '' then
    begin
      Ltable := Ltable + ' ' + FSqlwhere;
    end;
    OpenSql('select count(id) as count from ' + Ltable, []);
    qry.Open;

    qry.First;
    Result := qry.FieldByName('count').AsInteger;

  end;
end;

function TOrmData<T>.DatetoStrSql(aDate: TDate): string;
begin
  Result := FormatDateTime('yyyy-MM-dd', aDate);
end;

procedure TOrmData<T>.Delete_(aId: Integer);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
begin
  LSql := ParsDelete;
  SetLength(LParmArr, 1);
  LParmArr[0].Key := 'id';
  LParmArr[0].value := aId;

  FSQl.ExSql(LSql, LParmArr);

end;

procedure TOrmData<T>.dest;
begin
  FSQl.Destroy;
end;

function TOrmData<T>.ProcessNestedField(ParentField: TRttiField; ParentValue: TValue; qry: TSqlProvider; tbl: string; var at: T): T;
var
  NestedFld: TRttiField;
  NestedValue: TValue;
  NestedRecordType: TRttiRecordType;
  chkInProp: Boolean;
  rttiContext: TRttiContext;
  attr: TCustomAttribute;
  nestedData: T;
begin
  chkInProp := False;
  var Arr := ParentField.GetValue(@at);
  for NestedFld in rttiContext.GetType(Arr.TypeInfo).GetFields do
  begin

    for attr in NestedFld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;
    if not chkInProp then
    begin

      if NestedFld.FieldType.TypeKind = tkRecord then
      begin

        NestedRecordType := NestedFld.FieldType.AsRecord;

        if NestedFld.Name <> 'Items' then
        begin
           // ProcessNestedField(NestedFld, TValue.From(@nestedData), qry, tbl, nestedData);
        end;
      end
      else
      begin

        if NestedFld.Name <> 'Items' then
        begin
          if not qry.qry.FieldByName(ParentField.Name + NestedFld.Name).IsNull then
          begin

            NestedValue := TValue.FromVariant(qry.qry.FieldByName(ParentField.Name + NestedFld.Name).AsVariant);
            NestedFld.SetValue(TObject(Arr.GetReferenceToRawData), NestedValue);
          end;
        end;
      end;

    end
    else
      chkInProp := False;

  end;

  ParentField.SetValue(@at, Arr);
  //  ParentField.SetValue(ParentValue.GetReferenceToRawData, Arr);
  Result := at;
end;

function TOrmData<T>.Exc: T;
var
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  Ltbl: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  Lt: T;
begin
  chkInProp := False;
  FillChar(Lt, SizeOf(Lt), 0);
  Ltbl := ParsTable;
  with FSQl do
  begin

    FSqlText := FSqlText + FSqlField + ' FROM ' + Ltbl + ' ' + FSqlLeftJoin + ' ' + FSqlwhere;
    OpenSql(FSqlText, []);
    qry.Open;

    qry.Last;
    if qry.RecordCount > 0 then
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin
        for attr in fld.GetAttributes do
        begin
          if attr is alias then
            if Alias(attr).Name = InProp then
            begin
              chkInProp := True;
              Break;
            end;
        end;
        if not chkInProp then
        begin
          if fld.FieldType.TypeKind <> tkRecord then
          begin

            if not qry.FieldByName(Ltbl + fld.Name).IsNull then
            begin
              var Val := TValue.FromVariant(qry.FieldByName(Ltbl + fld.Name).AsVariant);
              fld.SetValue(@Lt, Val);
            end;

          end
          else
          begin
            if fld.Name <> 'Items' then
            begin
              for attr in fld.GetAttributes do
              begin
                if attr is alias then
                  if Alias(attr).Name = InProp then
                  begin
                    chkInProp := True;
                    Break;
                  end;
              end;
              if not chkInProp then
              begin
                Lt := ProcessNestedField(fld, TValue.From(@Lt), FSQl, Ltbl, Lt);

              end;
            end;

          end;
        end
        else
          chkInProp := False;
      end;
    end;
  end;
  Result := Lt;

end;

function TOrmData<T>.ExcArr: TArrayRecord<T>;
var
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  Ltbl: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  Lt: T;
begin

  chkInProp := False;
  Result.Clear;
  Ltbl := ParsTable;
  with FSQl do
  begin
    FSqlText := FSqlText + FSqlField + ' FROM ' + Ltbl + ' ' + FSqlLeftJoin + ' ' + FSqlwhere;
    OpenSql(FSqlText, []);
    qry.Open;

    qry.First;
    while not qry.Eof do
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin
        if fld.FieldType.TypeKind <> tkRecord then
        begin
          for attr in fld.GetAttributes do
          begin
            if attr is alias then
              if Alias(attr).Name = InProp then
              begin
                chkInProp := True;
                Break;
              end;
          end;
          if not chkInProp then
          begin
            if fld.Name <> 'Items' then
            begin
              var Val := TValue.FromVariant(qry.FieldByName(Ltbl + fld.Name).AsVariant);
              fld.SetValue(@Lt, Val);
            end;
          end
          else
            chkInProp := False;
        end
        else
        begin
          if fld.Name <> 'Items' then
          begin
          // ResVal.from();
            Lt := SubGetData(fld, FSQl, Lt);
          end;

        end;

      end;
      Result.Add(Lt);
      qry.Next;
    end;
  end;

end;

function TOrmData<T>.GetPropCount: Integer;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
begin
  Result := 0;
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    Inc(Result);
end;

function TOrmData<T>.GetPropNameEx(aPropName: string): string;
var
  PropInfo: PPropInfo;
  PropName: string;
begin
  PropInfo := GetPropInfo(TypeInfo(T), aPropName); // получаем информацию о первом поле в записи
  if PropInfo <> nil then // провер€ем, что поле найдено
  begin
    PropName := PropInfo^.Name; // получаем им€ пол€
  end;
end;

procedure TOrmData<T>.Hide(aId: Integer);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
begin
  LSql := ParsHide;
  SetLength(LParmArr, 2);
  LParmArr[0].Key := 'del';
  LParmArr[0].value := 1;

  LParmArr[1].Key := 'id';
  LParmArr[1].value := aId;

  FSQl.ExSql(LSql, LParmArr);
end;

procedure TOrmData<T>.Init;
begin
  FSQl.Create;
end;

function TOrmData<T>.Insert(aT: T; aNested: boolean = False): Integer;
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext, rttiContextInsert: TRttiContext;
  fld, fldArr, fldInsert: TRttiField;
  I: Integer;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  arr: TValue;
  Ltbl: string;
begin
  chkInProp := False;
  LSql := ParsInsert(aNested);
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;

    if not chkInProp then
    begin
      if fld.FieldType.TypeKind <> tkRecord then
      begin
        if AnsiLowerCase(fld.Name) <> 'id' then
        begin

          SetLength(LParmArr, Length(LParmArr) + 1);

          LParmArr[Length(LParmArr) - 1].Key := fld.Name;
          LParmArr[Length(LParmArr) - 1].value := fld.GetValue(@aT).AsVariant;

        end;

      end
      else
      begin
        if aNested then
        begin
          arr := fld.GetValue(@aT);

        // ѕолучаем RTTI дл€ вложенной записи


          for fldInsert in rttiContextInsert.GetType(arr.TypeInfo).GetFields do
          begin
          // »щем поле "id" во вложенной записи
            if AnsiLowerCase(fldInsert.Name) = 'id' then
            begin

              SetLength(LParmArr, Length(LParmArr) + 1);

              LParmArr[Length(LParmArr) - 1].Key := fld.Name + '_id';
              var tmp := fldInsert.GetValue(arr.GetReferenceToRawData).AsVariant;
              LParmArr[Length(LParmArr) - 1].value := tmp;

            end;
          end;
        end;

      end;
    end
    else
      chkInProp := False;
  end;

  FSQl.ExSql(LSql, LParmArr);
  Result := LastInsertId;
end;

function TOrmData<T>.Join(aFldArr: TRttiField; aTableName: string): TOrmData<T>;
var
  Lres: T;
  fldJoin: TRttiField;
  rttiContextJoin: TRttiContext;
  Ltbl: string;
  arr: TValue;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  i: integer;
begin
  chkInProp := False;
  FillChar(Lres, SizeOf(Lres), 0);
  arr := aFldArr.GetValue(@Lres);
  Ltbl := arr.TypeInfo.Name;
  Ltbl := StringReplace(arr.TypeInfo.Name, 'TArrayRecord<upsk.types.', '', [rfReplaceAll]);
  Ltbl := StringReplace(Ltbl, '>', '', [rfReplaceAll]);
  Delete(Ltbl, 1, 1);
  for fldJoin in rttiContextJoin.GetType(arr.TypeInfo).GetFields do
  begin
    for attr in fldJoin.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;

    if not chkInProp then
    begin
      chkInProp := False;
      if fldJoin.FieldType.TypeKind = tkRecord then
      begin
        Self.Join(fldJoin, Ltbl);
      end
      else
      begin
        if fldJoin.Name <> 'Items' then
        begin

          if pos(fldJoin.Name, FSqlField) = 0 then
          begin
            if Length(FSqlField) = 0 then
            begin
              FSqlField := Ltbl + '.' + fldJoin.Name + ' as ' + Ltbl + fldJoin.Name;
            end
            else
              FSqlField := FSqlField + ',' + Ltbl + '.' + fldJoin.Name + ' as ' + Ltbl + fldJoin.Name;
          end;

        end
        else
        begin
          exit;
        end;

      end;
    end
    else
      chkInProp := False;
  end;
  if pos('LEFT JOIN ' + Ltbl, FSqlLeftJoin) = 0 then
    FSqlLeftJoin := ' LEFT JOIN ' + Ltbl + ' ON ' + aTableName + '.' + Ltbl + '_id=' + Ltbl + '.id ' + FSqlLeftJoin;
  for fldJoin in rttiContextJoin.GetType(arr.TypeInfo).GetFields do
  begin
    if fldJoin.FieldType.TypeKind = tkRecord then
    begin
      for attr in fldJoin.GetAttributes do
      begin
        if attr is alias then
          if Alias(attr).Name = InProp then
          begin
            chkInProp := True;
            Break;
          end;
      end;
      if not chkInProp then
        self.Join(fldJoin, Ltbl)
      else
        chkInProp := False;
    end;
  end;

  Result := Self;

end;

function TOrmData<T>.LastInsertId: Integer;
begin
  Result := 0;
  FSQl.OpenSql('SELECT LAST_INSERT_ID() AS lid', []);
  Result := FSQl.qry.FieldByName('lid').AsInteger;
end;

function TOrmData<T>.Min(aFieldName: string): TOrmData<T>;
begin
  FSQLMin := 'MIN(' + aFieldName + ')';
  if FSqlField <> '' then
    FSqlField := FSqlField+',' + FSQLMin + ' '
  else
    FSqlField := ' ' + FSQLMin + ' ';
  Result := Self;
end;

procedure TOrmData<T>.MyTypeInfo(const AValue: TValue; out ATypeName, AParentName: string);
var
  ctx: TRttiContext;
  typ: TRttiType;
begin
  typ := ctx.GetType(AValue.TypeInfo);
  ATypeName := typ.Name;
  AParentName := '';
  if Assigned(typ.BaseType) then
    AParentName := typ.BaseType.Name;

end;

function TOrmData<T>.ParsDelete: string;
var
  LTblNm: string;
begin
  LTblNm := ParsTable;
  Result := 'Delete from `' + LTblNm + '`';

  Result := Result + ' WHERE `id`=:id';

end;

function TOrmData<T>.ParsHide: string;
var
  LTblNm: string;
begin
  LTblNm := ParsTable;
  Result := 'UPDATE `' + LTblNm + '` SET `del`=:del';

  Result := Result + ' WHERE `id`=:id';
end;

function TOrmData<T>.ParsInsert(aNested: boolean = False): string;
var
  rttiContext: TRttiContext;
  fld, fldArr: TRttiField;
  LTblNm: string;
  arr: TValue;
  Ltbl: string;
begin
  LTblNm := ParsTable;
  Result := 'INSERT INTO `' + LTblNm + '`(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) <> 'id' then
      if fld.FieldType.TypeKind <> tkRecord then
      begin
        Result := Result + '`' + fld.Name + '`' + ',';
      end
      else
      begin
        if aNested then
        begin
          Ltbl := fld.Name;

          Result := Result + '`' + Ltbl + '_id' + '`' + ',';
        end;
      end;
  end;
  Delete(Result, Length(Result), 1);
  Result := Result + ') values(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) <> 'id' then
      if fld.FieldType.TypeKind <> tkRecord then
      begin
        Result := Result + ':' + fld.Name + ',';
      end
      else
      begin
        if aNested then
        begin
          Ltbl := fld.Name;
          Result := Result + ':' + Ltbl + '_id' + ',';
        end;
      end;
  end;
  Delete(Result, Length(Result), 1);
  Result := Result + ')';
end;

function TOrmData<T>.ParsTable(aT: T): string;
var
  LTypeInfo: PTypeInfo;
begin
 // LTypeInfo := TypeInfo(System.TypInfo.get(aT));
  Result := LTypeInfo.Name;
  Delete(Result, 1, 1);

end;

function TOrmData<T>.ParsTable: string;
var
  LTypeInfo: PTypeInfo;
begin
  LTypeInfo := TypeInfo(T);
  Result := LTypeInfo.Name;
  Delete(Result, 1, 1);
end;

function TOrmData<T>.ParsUpdate(aNested: boolean = False): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  LTblNm: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  LTblNm := ParsTable;
  Result := 'UPDATE `' + LTblNm + '` SET ';
  chkInProp := false;
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;
    if not chkInProp then
    begin
      if fld.FieldType.TypeKind <> tkRecord then
      begin
        if AnsiLowerCase(fld.Name) <> 'id' then
        begin
          Result := Result + '`' + fld.Name + '`' + '=:' + fld.Name + ',';
        end;
      end
      else
      begin
        if aNested then
          Result := Result + '`' + fld.Name + '_id`' + '=:' + fld.Name + '_id,';
      end;
    end
    else
      chkInProp := false;

  end;
  Delete(Result, Length(Result), 1);
  Result := Result + ' WHERE id=:id';
end;

function TOrmData<T>.Select(aWhere: string): T;
var
  Lt: T;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  Ltable: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  Ltable := ParsTable;
  with FSQl do
  begin
    if aWhere <> '' then
    begin
      OpenSql('select * from ' + Ltable + ' where ' + aWhere, []);
    end
    else
      OpenSql('select * from ' + Ltable, []);
    qry.Open;

    qry.First;
    if qry.RecordCount > 0 then
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin

        for i := 0 to qry.Fields.Count - 1 do
        begin
          if fld.FieldType.TypeKind <> tkRecord then
          begin

            if AnsiLowerCase(fld.Name) = AnsiLowerCase(qry.Fields[i].FieldName) then
            begin

              var Val := TValue.FromVariant(qry.Fields[i].AsVariant);
              fld.SetValue(@Lt, Val);
              if qry.Fields[i].FieldName = 'id' then
              begin
                Lid := qry.Fields[i].AsInteger;
              end;

              Break;
            end;
          end
          else
          begin

          end;
        end;
      end;
      Result := Lt;
    end;
  end;
end;

function TOrmData<T>.SelectArr(aWhere: string): TArrayRecord<T>;
var
  Lt: T;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  Result.Clear;
  with FSQl do
  begin
    if aWhere <> '' then
    begin
      OpenSql('select * from ' + ParsTable + ' where ' + aWhere, []);
    end
    else
      OpenSql('select * from ' + ParsTable, []);
    qry.Open;

    qry.First;
    while not qry.Eof do
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin

        for i := 0 to qry.Fields.Count - 1 do
        begin
          if fld.FieldType.TypeKind <> tkRecord then
          begin

            if AnsiLowerCase(fld.Name) = AnsiLowerCase(qry.Fields[i].FieldName) then
            begin

              var Val := TValue.FromVariant(qry.Fields[i].AsVariant);
              fld.SetValue(@Lt, Val);
              if qry.Fields[i].FieldName = 'id' then
              begin
                Lid := qry.Fields[i].AsInteger;
              end;

              Break;
            end;
          end
          else
          begin

          end;
        end;
      end;
      Result.Add(Lt);
      qry.Next;
    end;
  end;
end;

function TOrmData<T>.SelectNestedFields(const ParentField: TRttiField; const ParentTable: string): string;
var
  nestedFld: TRttiField;
  nestedAttr: TCustomAttribute;
  nestedTable: string;
  nestedFields: string;
  rttiContext: TRttiContext;
  chkInProp: Boolean;
  attr: TCustomAttribute;
begin
  chkInProp := false;
  nestedTable := ParentField.Name;
  nestedFields := '';

  for nestedFld in rttiContext.GetType(ParentField.FieldType.Handle).GetFields do
  begin
    for attr in nestedFld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;
    if not chkInProp then
    begin

      if nestedFld.FieldType.TypeKind <> tkRecord then
      begin

        if nestedFld.Name <> 'Items' then
          nestedFields := nestedFields + nestedTable + '.' + nestedFld.Name + ' as ' + nestedTable + nestedFld.Name + ' ,';

      end
      else
      begin
        nestedFields := nestedFields + SelectNestedFields(nestedFld, nestedTable);
      end;
    end
    else
    begin
      chkInProp := false;
    end;
  end;

  Result := nestedFields;

end;

function TOrmData<T>.Select: TOrmData<T>;
var
  LTable: string;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld, Field: TRttiField;
  LsubField: Tarray<TRttiField>;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  NestedFieldType: TRttiType;
begin
  chkInProp := False;
  FSqlwhere := '';
  FSqlField := '';
  FSqlLeftJoin := '';
  LTable := ParsTable;
  FSqlText := 'SELECT  ';

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;
    if not chkInProp then
    begin
      chkInProp := False;
      if fld.FieldType.TypeKind <> tkRecord then
      begin

        FSqlField := FSqlField + LTable + '.' + fld.Name + ' as ' + LTable + fld.Name + ' ,';

      end
      else
      begin
        FSqlField := FSqlField + SelectNestedFields(fld, LTable);
      end;
    end
    else
      chkInProp := False;
  end;
  Delete(FSqlField, length(FSqlField), 1);

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
 //for i:=length(rttiContext.GetType(TypeInfo(T)).GetFields)-1 downto 0 do
  begin
    // fld:=rttiContext.GetType(TypeInfo(T)).GetFields[i];

    if fld.FieldType.TypeKind = tkRecord then
    begin
      for attr in fld.GetAttributes do
      begin
        if attr is alias then
          if Alias(attr).Name = InProp then
          begin
            chkInProp := True;
            Break;
          end;
      end;
      if not chkInProp then
      begin

        Self.Join(fld, LTable);
      end;
    end;
  end;
  Result := Self;
end;

function TOrmData<T>.Select(aSql: string; aParams: TSqlParamsArr): T;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lt: T;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  FSQl.OpenSql(aSql, aParams);
  with FSQl do
  begin
    qry.Open;
    qry.First;
    if qry.RecordCount > 0 then
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin

        if fld.FieldType.TypeKind <> tkRecord then
        begin
          for attr in fld.GetAttributes do
          begin
            if attr is alias then
              if Alias(attr).Name = InProp then
              begin
                chkInProp := True;
                Break;
              end;
          end;
          if not chkInProp then
          begin
            var Val := TValue.FromVariant(qry.FieldByName(fld.Name).AsVariant);
            fld.SetValue(@Lt, Val);
          end
          else
            chkInProp := false;

        end
        else
        begin

        end;

      end;
      Result := Lt;
    end;
  end;

end;

function TOrmData<T>.SelectSub(aFldArr: TRttiField; aTableName, aWhere: string): TArrayRecord<T>;
var
  Lres: T;
  fldJoin: TRttiField;
  fldItems: TRttiField;
  LTmp: string;
  len: LongInt;
  Li: Integer;
  rttiContextJoin: TRttiContext;
  rttiContextItems: TRttiContext;
  sql: TSqlProvider;
  LTypeInfo: PTypeInfo;
  i: Integer;
  valVar: Variant;
  Ltbl: string;
begin
  sql.Create;
  with sql do
  begin
    Result.Clear;
    var Arr := aFldArr.GetValue(@Lres);
    Ltbl := StringReplace(Arr.TypeInfo.Name, 'TArrayRecord<upsk.types.T', '', [rfReplaceAll]);
    Ltbl := StringReplace(Ltbl, '>', '', [rfReplaceAll]);

    OpenSql('select * from ' + Ltbl + ' where ' + aWhere, []);
    while not qry.Eof do
    begin
      for fldJoin in rttiContextJoin.GetType(Arr.TypeInfo).GetFields do
      begin
        LTmp := fldJoin.Name;
        var valItems := fldJoin.GetValue(@Lres);
        if valItems.GetArrayLength <= 0 then
        begin
          len := 1;
          DynArraySetLength(PPointer(valItems.GetReferenceToRawData)^, valItems.TypeInfo, 1, @len);
        end;
        Li := valItems.GetArrayLength;
        if valItems.GetArrayLength > 0 then
        begin

          var valArr := valItems.GetArrayElement(0);
          for fldItems in rttiContextItems.GetType(valArr.TypeInfo).GetFields do
          begin
            if fldItems.Name = qry.Fields[i].FieldName then
            begin

              var Val := TValue.FromVariant(qry.Fields[i].AsVariant);

              fldItems.SetValue(@Lres, Val);

              Break;
            end;
          end;
        end;
      end;
      Result.Add(Lres);
      qry.Next;
    end;
  end;
end;

function TOrmData<T>.SubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; aT: T): t;
var
  LField, LsubField: TRttiField;
  LValue: TValue;
  rttiContextJoin: TRttiContext;
  Ltbl: string;
  asd: string;
  LRes: TValue;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  var Arr := aFldArr.GetValue(@aT);
  Ltbl := Arr.TypeInfo.Name;
  Ltbl := StringReplace(Arr.TypeInfo.Name, 'TArrayRecord<upsk.types.', '', [rfReplaceAll]);
  Ltbl := StringReplace(Ltbl, '>', '', [rfReplaceAll]);
  Delete(Ltbl, 1, 1);

  for LField in rttiContextJoin.GetType(Arr.TypeInfo).GetFields do
  begin
    if LField.FieldType.TypeKind <> tkRecord then
    begin
      if LField.Name <> 'Items' then
      begin
        for attr in LField.GetAttributes do
        begin
          if attr is alias then
            if Alias(attr).Name = InProp then
            begin
              chkInProp := True;
              Break;
            end;
        end;
        if not chkInProp then
        begin
          if not aQry.qry.FieldByName(Ltbl + LField.Name).IsNull then
          begin
            asd := aQry.qry.FieldByName(Ltbl + LField.Name).AsVariant;
            LValue := Tvalue.FromVariant(aQry.qry.FieldByName(Ltbl + LField.Name).AsVariant);
            LField.SetValue(TObject(Arr.GetReferenceToRawData), LValue);
          end;
        end
        else
          chkInProp := False;
      end;
    end
    else
    begin
      if LField.Name <> 'Items' then
      begin
        if LField.Name <> 'BasePriceArr' then
        begin
          for attr in LField.GetAttributes do
          begin
            if attr is alias then
              if Alias(attr).Name = InProp then
              begin
                chkInProp := True;
                Break;
              end;
          end;
          if not chkInProp then
          begin

            //var SubRecord := LField.GetValue(TObject(Arr.GetReferenceToRawData)); // «амените TYourRecordType на фактический тип вашей записи
//            for LsubField in rttiContextJoin.GetType(TypeInfo(t)).GetFields do
//            begin
//              if LsubField.FieldType.TypeKind <> tkRecord then
//              begin
//                if LsubField.Name <> 'Items' then
//                begin
//                  for attr in LsubField.GetAttributes do
//                  begin
//                    if attr is alias then
//                      if Alias(attr).Name = InProp then
//                      begin
//                        chkInProp := True;
//                        Break;
//                      end;
//                  end;
//                  if not chkInProp then
//                  begin
//                    if not aQry.qry.FieldByName(Ltbl + LsubField.Name).IsNull then
//                    begin
//                      asd := aQry.qry.FieldByName(Ltbl + LsubField.Name).AsVariant;
//                      LValue := Tvalue.FromVariant(aQry.qry.FieldByName(Ltbl + LsubField.Name).AsVariant);
//                      LsubField.SetValue(TObject(Arr.GetReferenceToRawData), LValue);
//                    end;
//                  end
//                  else
//                    chkInProp := False;
//                end;
//              end
//            end;
            var Arrr := LField.GetValue(@Arr);
            var art := SubSubGetData(LField, aQry, Arrr);
            LField.SetValue(TObject(Arr.GetReferenceToRawData), art);
          end;
        end
        else
          chkInProp := False;
      end;

    end;
  end;
  aFldArr.SetValue(Pointer(@aT), Arr);
  Result := aT;
end;

function TOrmData<T>.SubSubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; var aT: Tvalue): Tvalue;
var
  LField: TRttiField;
  LValue: TValue;
  rttiContextJoin: TRttiContext;
  Ltbl: string;
  asd: string;
  LRes: TValue;
  lt: t;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  FillChar(lt, SizeOf(lt), 0);
//  var Arr := aFldArr.GetValue(@lt);
  Ltbl := aT.TypeInfo.Name;
  Ltbl := StringReplace(aT.TypeInfo.Name, 'TArrayRecord<upsk.types.', '', [rfReplaceAll]);
  Ltbl := StringReplace(Ltbl, '>', '', [rfReplaceAll]);
  Delete(Ltbl, 1, 1);

  for LField in rttiContextJoin.GetType(aT.TypeInfo).GetFields do
  begin
    if LField.FieldType.TypeKind <> tkRecord then
    begin
      if LField.Name <> 'Items' then
      begin
        for attr in LField.GetAttributes do
        begin
          if attr is alias then
            if Alias(attr).Name = InProp then
            begin
              chkInProp := True;
              Break;
            end;
        end;
        if not chkInProp then
        begin
          asd := aQry.qry.FieldByName(Ltbl + LField.Name).AsVariant;
          LValue := Tvalue.FromVariant(aQry.qry.FieldByName(Ltbl + LField.Name).AsVariant);
          LField.SetValue(TObject(aT.GetReferenceToRawData), LValue);
        end
        else
          chkInProp := False;
      end;
    end
    else
    begin

     // result := SubGetData(LField, aQry,at);
    end;
  end;

  Result := aT;

end;

procedure TOrmData<T>.Update(aT: T; aNested: boolean = False);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext, rttiContextUpd: TRttiContext;
  fld: TRttiField;
  I: Integer;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  arr: TValue;
  fldUpd: TRttiField;
begin
  chkInProp := False;
  LSql := ParsUpdate(aNested);
  SetLength(LParmArr, 0);
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    for attr in fld.GetAttributes do
    begin
      if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
    end;

    if not chkInProp then
    begin
      if fld.FieldType.TypeKind <> tkRecord then
      begin

        SetLength(LParmArr, Length(LParmArr) + 1);
        LParmArr[Length(LParmArr) - 1].Key := fld.Name;
        LParmArr[Length(LParmArr) - 1].value := fld.GetValue(@aT).AsVariant;

      end
      else
      begin
        if aNested then
        begin
          arr := fld.GetValue(@aT);

        // ѕолучаем RTTI дл€ вложенной записи


          for fldUpd in rttiContextUpd.GetType(arr.TypeInfo).GetFields do
          begin
          // »щем поле "id" во вложенной записи
            if AnsiLowerCase(fldUpd.Name) = 'id' then
            begin

              SetLength(LParmArr, Length(LParmArr) + 1);

              LParmArr[Length(LParmArr) - 1].Key := fld.Name + '_id';
              var tmp := fldUpd.GetValue(arr.GetReferenceToRawData).AsVariant;
              LParmArr[Length(LParmArr) - 1].value := tmp;

            end;
          end;
        end;
      end;
    end
    else
    begin
      chkInProp := false;
    end;
  end;

  FSQl.ExSql(LSql, LParmArr);
end;

function TOrmData<T>.Where(const aWhereStr: string): TOrmData<T>;
var
  Lp, Lc: string;
begin
  if Pos('WHERE', FSqlwhere) <= 0 then
  begin
    FSqlwhere := FSqlwhere + ' WHERE ';
  end;
  FSqlwhere := FSqlwhere + aWhereStr;
  Result := Self;

end;

function TOrmData<T>.Where(const aField1, aField2: Variant; aOperator: string): TOrmData<T>;
var
  Lp, Lc: string;
begin
  if Pos('WHERE', FSqlwhere) <= 0 then
  begin
    FSqlwhere := FSqlwhere + ' WHERE ';
  end;
  FSqlwhere := FSqlwhere + aField1 + '=' + VarToStr(aField2);
  Result := Self;

end;

{ TWhere<T> }

end.

