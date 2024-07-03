unit IceOrm.database;

interface

uses
  IceOrm.sql, System.Generics.Collections, ArrayHelper, System.Classes,
  System.Rtti, System.SysUtils, System.TypInfo, System.Variants, IceOrm.types,
  Data.DB;

const
  twAnd = ' AND ';
  twOr = ' OR ';
  twNone = '';

type
  TOrmData<T> = record
  private
    FSQl: TSqlProvider;
    FSqlText, FSqlField, FSqlLeftJoin, FSqlwhere, FSQLMin: string;
    FDb: string;
    function GetPropCount: Integer;
    function GetPropNameEx(aPropName: string): string;
    function ParsTable: string; overload;
    function ParsTable(aT: T): string; overload;
    function ParsUpdate: string;
    function ParsHide: string;
    function ParsDelete: string;
    function ParsInsert(aIgnore: Boolean = false): string;
    function DatetoStrSql(aDate: TDate): string;
    function SelectSub(aFldArr: TRttiField; aTableName: string; aWhere: string):
      TArrayRecord<T>;

    procedure MyTypeInfo(const AValue: TValue; out ATypeName, AParentName: string);
    function SubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; aT: T;
      aTableName: string): t;
    function SubSubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; var aT:
      Tvalue; aTableName: string): Tvalue;
    procedure SetDb(const Value: string);
    procedure CreateTblForNestedType(aTypeInfo: PTypeInfo);

  public
    procedure Init;
    procedure CreateTbl;
    procedure Migrate;
    function LastInsertId: Integer;
    function SelectArr(aWhere: string): TArrayRecord<T>;
    function Select(aWhere: string): T; overload;
    function Select(aSql: string; aParams: TSqlParamsArr): T; overload;
    function Select: TOrmData<T>; overload;
    function Join(aFldArr: TRttiField; aTableName: string): TOrmData<T>;
    function Where(const aField1, aField2: Variant; aOperator: string = '='):
      TOrmData<T>; overload;
    function Where(const aWhereStr: string): TOrmData<T>; overload;
    function Where(const aWherePrmArr: TSqlParamsArr): TOrmData<T>; overload;
    function ExcArr: TArrayRecord<T>;
    function Exc: T;
    function ExCount: integer;
    function ExSumToInt(aFieldName: string): integer;
    function ExSumToFloat(aFieldName: string): integer;
    function ExcToJson: string;
    procedure Update(aT: T);
    function Insert(aT: T; aIgnore: Boolean = false): Integer;
    procedure Hide(aId: Integer);
    procedure Delete_(aId: Integer); overload;
    procedure Delete_(aWhere: string); overload;
    procedure dest;
    property Db: string read FDb write SetDb;
    function Min(aFieldName: string): TOrmData<T>;
  end;

type
  TViewOrmControl<T> = record
  private
    FDb: string;
    procedure SetDb(const Value: string);

  public
    property Db: string read FDb write SetDb;
    function Insert(aT: T; aIgnore: Boolean = false; aNested: boolean = False): integer;
    procedure InsertArr(atArr: TArrayRecord<t>; aIgnore: Boolean = false;
      aNested: boolean = False);
    procedure Update(aT: T; aNested: boolean = False);
    function GetObjFromId(aTId: Integer): T;
    function GetObjFromWhere(aWhere: string = ''): T;
    function GetObjArr(aWhere: string = ''): TArrayRecord<t>;
    procedure DeleteFromId(aId: Integer);
    procedure Del(aTId: integer);
    function Sum(atArr: TArrayRecord<t>; aFieldName: string): TArrayRecord<t>;
    procedure CreateTable;
  end;

type
  TJoinOrmControl<T> = record
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

function TOrmData<T>.ExcToJson: string;
var
  Lt: T;
begin
  Lt := Self.Exc;
  Result := '';
end;

function TOrmData<T>.ExSumToFloat(aFieldName: string): integer;
begin

end;

function TOrmData<T>.ExSumToInt(aFieldName: string): integer;
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
    OpenSql('select sum(' + aFieldName + ') as FieldSum from ' + Ltable, []);
    qry.Open;

    qry.First;
    Result := qry.FieldByName('FieldSum').AsInteger;

  end;
end;

procedure TOrmData<T>.CreateTbl;
var
  LSqlStr: string;
  LT: T;
  rttiContext: TRttiContext;
  fld: TRttiField;
  asd: string;
  LTblNm: string;
  LTypeName: string;
  LIndexKey: string;
  Lconstr: string;
  PrimeLey: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  try
    chkInProp := false;

    LTblNm := ParsTable;
    LSqlStr := 'CREATE TABLE IF NOT EXISTS `' + LTblNm + '` (';
    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin
      for attr in fld.GetAttributes do
      begin
      //if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
      end;
      if not chkInProp then
      begin
        case fld.FieldType.TypeKind of
          tkInteger:
            begin
              if AnsiLowerCase(fld.Name) <> 'id' then
                LSqlStr := LSqlStr + ' `' + fld.Name + '` INT(11) NOT NULL,'
              else
              begin
                LSqlStr := LSqlStr + ' `' + fld.Name + '` INT(11) NOT NULL  AUTO_INCREMENT,'
              end;
            end;
          tkString, tkUString:
            LSqlStr := LSqlStr + ' `' + fld.Name +
              '`  VARCHAR(2500) NULL DEFAULT '''' COLLATE ''cp1251_general_cs'',';
          tkFloat:
            begin
              LTypeName := fld.FieldType.ToString;
              if SameText(LTypeName, 'TDateTime') then
              begin
                LSqlStr := LSqlStr + ' `' + fld.Name + '`  DATETIME NULL,';
              end;

            end;
          tkRecord:
            begin
              LIndexKey := LIndexKey + 'INDEX ' + ' `' + fld.Name + '_id` (`' +
                fld.Name + '_id`) USING BTREE,';
//         Lconstr := Lconstr + '	CONSTRAINT `' + fld.Name +
//            '_id` FOREIGN KEY (`' + fld.Name + '_id`) REFERENCES `' + fld.Name +
//            '` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,';

              CreateTblForNestedType(fld.FieldType.Handle);
              LSqlStr := LSqlStr + ' `' + fld.Name + '_id` INT(11) NOT NULL,';

            end;
        end;

      end
      else
        chkInProp := false;
    end;
    PrimeLey := ',PRIMARY KEY (`id`) USING BTREE, ';
    if LIndexKey = '' then
    begin
      PrimeLey := ',PRIMARY KEY (`id`) USING BTREE ';
    end;

    Delete(LSqlStr, length(LSqlStr), 1);
    Delete(LIndexKey, length(LIndexKey), 1);
//  if Lconstr = '' then
//  begin
//    PrimeLey := ',PRIMARY KEY (`id`) USING BTREE ';
//  end;
    LSqlStr := LSqlStr + PrimeLey + LIndexKey + ');';
    FSQl.ExSql(LSqlStr, nil);
  except
    on e: exception do
      raise Exception.Create(e.Message);

  end;

end;

procedure TOrmData<T>.CreateTblForNestedType(aTypeInfo: PTypeInfo);
var
  LSqlStr: string;
  LT: T;
  rttiContext: TRttiContext;
  fld: TRttiField;
  asd: string;
  LTblNm: string;
  LTypeName: string;
  LTypeInfo: PTypeInfo;
  LIndexKey: string;
  Lconstr: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := false;
  LTblNm := aTypeInfo.Name;
  Delete(LTblNm, 1, 1);

  LSqlStr := 'CREATE TABLE IF NOT EXISTS `' + LTblNm + '` (';
  for fld in rttiContext.GetType(aTypeInfo).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
    //  if attr is alias then
      if Alias(attr).Name = InProp then
      begin
        chkInProp := True;
        Break;
      end;
    end;
    if not chkInProp then
    begin
      case fld.FieldType.TypeKind of
        tkInteger:
          begin
            if AnsiLowerCase(fld.Name) <> 'id' then
              LSqlStr := LSqlStr + ' `' + fld.Name + '` INT(11) NOT NULL,'
            else
            begin
              LSqlStr := LSqlStr + ' `' + fld.Name + '` INT(11) NOT NULL  AUTO_INCREMENT,'
            end;
          end;
        tkString, tkUString:
          LSqlStr := LSqlStr + ' `' + fld.Name +
            '`  VARCHAR(2500) NULL DEFAULT '''' COLLATE ''cp1251_general_cs'',';
        tkFloat:
          begin
            LTypeName := fld.FieldType.ToString;
            if SameText(LTypeName, 'TDateTime') then
            begin
              LSqlStr := LSqlStr + ' `' + fld.Name + '`  DATETIME NULL,';
            end;

          end;
        tkRecord:
          begin
            LIndexKey := LIndexKey + 'INDEX ' + ' `' + fld.Name + '_id` (`' +
              fld.Name + '_id`) USING BTREE,';
            Lconstr := '	CONSTRAINT `' + fld.Name + '_id` FOREIGN KEY (`' + fld.Name
              + '_id`) REFERENCES `' + fld.Name +
              '` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,';

            CreateTblForNestedType(fld.FieldType.Handle);
            LSqlStr := LSqlStr + ' `' + fld.Name + '_id` INT(11) NOT NULL,'
          end;
      end;

    end
    else
      chkInProp := false;
  end;
  Delete(LSqlStr, length(LSqlStr), 1);
  LSqlStr := LSqlStr + ',PRIMARY KEY (`id`) USING BTREE);';
  FSQl.ExSql(LSqlStr, nil);

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
  LSql := LSql + ' id=:id';
  SetLength(LParmArr, 1);
  LParmArr[0].Key := 'id';
  LParmArr[0].value := aId;

  FSQl.ExSql(LSql, LParmArr);

end;

procedure TOrmData<T>.Delete_(aWhere: string);
var
  LSql: string;
  rttiContext: TRttiContext;
  fld: TRttiField;
begin
  LSql := ParsDelete;

  FSQl.ExSql(LSql + aWhere, nil);

end;

procedure TOrmData<T>.dest;
begin
  FSQl.Destroy;
end;

function TOrmData<T>.Exc: T;
var
  Lt: T;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  Ltbl: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  FillChar(Lt, SizeOf(Lt), 0);
  Ltbl := ParsTable;
  with FSQl do
  begin
    FSqlText := FSqlText + FSqlField + ' FROM ' + Ltbl + ' ' + FSqlLeftJoin +
      ' ' + FSqlwhere;
    OpenSql(FSqlText, []);
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
            var Val := TValue.FromVariant(qry.FieldByName(Ltbl + fld.Name).AsVariant);
            fld.SetValue(@Lt, Val);
          end
          else
            chkInProp := False;
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
              Lt := SubGetData(fld, FSQl, Lt, Ltbl);
            end;
          end;

        end;

      end;
    end;
  end;
  Result := Lt;

end;

function TOrmData<T>.ExcArr: TArrayRecord<T>;
var
  Lt: T;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lid: Integer;
  Ltbl: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  try
    chkInProp := False;
    Result.Clear;
    Ltbl := ParsTable;
    with FSQl do
    begin
      FSqlText := FSqlText + FSqlField + ' FROM ' + Ltbl + ' ' + FSqlLeftJoin +
        ' ' + FSqlwhere;
      OpenSql(FSqlText, []);
      qry.Open;

      qry.First;
      while not qry.Eof do
      begin
        for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
        begin
          if fld.FieldType.TypeKind <> tkRecord then
          begin
            var atrrs := fld.GetAttributes;
            if Assigned(atrrs) then
              for attr in atrrs do
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
              var Val := TValue.FromVariant(qry.FieldByName(Ltbl + fld.Name).AsVariant);
              fld.SetValue(@Lt, Val);
            end
            else
              chkInProp := False;
          end
          else
          begin
            if fld.Name <> 'Items' then
            begin
              for attr in fld.GetAttributes do
              begin
              //  if attr is alias then
                if Alias(attr).Name = InProp then
                begin
                  chkInProp := True;
                  Break;
                end;
              end;
              if not chkInProp then
              begin
                Lt := SubGetData(fld, FSQl, Lt, Ltbl);
              end
              else
                chkInProp := False;
            end;
          end;

        end;
        Result.Add(Lt);
        qry.Next;
      end;
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);

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
  if PropInfo <> nil then // проверяем, что поле найдено
  begin
    PropName := PropInfo^.Name; // получаем имя поля
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
  FSQl.Create('');
end;

function TOrmData<T>.Insert(aT: T; aIgnore: Boolean = false): Integer;
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld, fld_child: TRttiField;
  I: Integer;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
try
  chkInProp := False;
  LSql := ParsInsert(aIgnore);
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
     // if attr is alias then
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
        setLength(LParmArr, Length(LParmArr) + 1);
        LParmArr[Length(LParmArr) - 1].Key := fld.Name + '_id';
        var fieldValue := fld.GetValue(@aT);
        for fld_child in rttiContext.GetType(fld.FieldType.Handle).GetFields do
        begin
          if fld_child.Name = 'id' then
          begin
            LParmArr[Length(LParmArr) - 1].Value := fld_child.GetValue(fieldValue.GetReferenceToRawData).AsVariant;
            Break;
          end;
        end;

      end;
    end
    else
      chkInProp := False;

  end;

  FSQl.ExSql(LSql, LParmArr);
  Result := LastInsertId;
except on e:Exception do
raise Exception.Create(e.Message);

end;
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
    if fldJoin.FieldType.TypeKind = tkRecord then
    begin

    end
    else
    begin
      if fldJoin.Name <> 'Items' then
      begin
        for attr in fldJoin.GetAttributes do
        begin
        //  if attr is alias then
          if Alias(attr).Name = InProp then
          begin
            chkInProp := True;
            Break;
          end;
        end;
        if not chkInProp then
          FSqlField := FSqlField + ',' + aTableName + '_' + Ltbl + '.' + fldJoin.Name
            + ' as ' + aTableName + '_' + Ltbl + fldJoin.Name;
        chkInProp := False;
      end
      else
      begin
        exit;
      end;

    end;
  end;
  FSqlLeftJoin := FSqlLeftJoin + ' JOIN ' + Ltbl + ' as ' + aTableName + '_' +
    Ltbl + ' ON ' + aTableName + '.' + Ltbl + '_id=' + aTableName + '_' + Ltbl + '.id';
  for fldJoin in rttiContextJoin.GetType(arr.TypeInfo).GetFields do
  begin
    if fldJoin.FieldType.TypeKind = tkRecord then
    begin

      self.Join(fldJoin, aTableName + '_' + Ltbl);
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

procedure TOrmData<T>.Migrate;
var
  LTblNm: string;
  rttiContext: TRttiContext;
  fld, fld_child: TRttiField;
  chk: Boolean;
  chkAttr: Boolean;
  attr: TCustomAttribute;
  LFldName: string;
begin
  try
    chk := false;
    chkAttr := false;
    LTblNm := ParsTable;
    FSQl.OpenSql('SELECT * FROM ' + LTblNm, []);
    with FSQl do
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin
        for attr in fld.GetAttributes do
        begin
          if Alias(attr).Name = InProp then
          begin
            chkAttr := true;
            Break;
          end;
        end;

        if (not chkAttr) and (fld.Name <> 'id') then
        begin
          if (fld.FieldType.TypeKind = tkrecord) then
          begin
            LFldName := fld.Name + '_id';
          end
          else
          begin
            LFldName := fld.Name;
          end;
          for var I := 0 to qry.Fields.Count - 1 do
          begin
            if LFldName = qry.Fields[I].FieldName then
            begin
              chk := True;
              Break
//            case qry.Fields[I].DataType of
//              ftString:
//                ;
//              ftInteger:
//                ;
//              ftFloat:
//                ;
//              ftDateTime:
//                ;
//              ftDate:
//                ;
//              ftTime:
//                ;
//
//            end;
            end;

          end;

          if not chk then
          begin
            if (fld.FieldType.TypeKind <> tkrecord) then
            begin
              FSQl.AddNewColumn(LTblNm, fld.Name, fld.FieldType);

            end
            else if fld.FieldType.TypeKind = tkRecord then
            begin

              FSQl.AddNewColumn(LTblNm, fld.Name, nil);
              chkAttr := false;
            end;

          end
          else
            chk := false;

        end
        else
          chkAttr := false;

      end;

    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);

  end;
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

procedure TOrmData<T>.MyTypeInfo(const AValue: TValue; out ATypeName,
  AParentName: string);
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

  Result := Result + ' WHERE ';

end;

function TOrmData<T>.ParsHide: string;
var
  LTblNm: string;
begin
  LTblNm := ParsTable;
  Result := 'UPDATE `' + LTblNm + '` SET `del`=:del';

  Result := Result + ' WHERE `id`=:id';
end;

function TOrmData<T>.ParsInsert(aIgnore: Boolean = false): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  LTblNm: string;
  chkInProp: Boolean;
  attr: TCustomAttribute;
begin
  LTblNm := ParsTable;
  chkInProp := false;
  if aIgnore then
    Result := 'INSERT IGNORE INTO `' + LTblNm + '`('
  else
    Result := 'INSERT INTO `' + LTblNm + '`(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
    //  if attr is alias then
      if Alias(attr).Name = InProp then
      begin
        chkInProp := True;
        Break;
      end;
    end;
    if not chkInProp then
    begin
      if AnsiLowerCase(fld.Name) <> 'id' then
        if fld.FieldType.TypeKind <> tkRecord then
          Result := Result + '`' + fld.Name + '`' + ','
        else
          Result := Result + '`' + fld.Name + '_id`' + ',';
      chkInProp := false;
    end
    else
      chkInProp := False;

  end;
  Delete(Result, Length(Result), 1);
  Result := Result + ') values(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
     // if attr is alias then
      if Alias(attr).Name = InProp then
      begin
        chkInProp := True;
        Break;
      end;
    end;
    if not chkInProp then
    begin
      if AnsiLowerCase(fld.Name) <> 'id' then
        if fld.FieldType.TypeKind <> tkRecord then
          Result := Result + ':' + fld.Name + ','
        else
          Result := Result + ':' + fld.Name + '_id,';
      chkInProp := false;
    end
    else
      chkInProp := False;

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

function TOrmData<T>.ParsUpdate: string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  LTblNm: string;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := false;
  LTblNm := ParsTable;
  Result := 'UPDATE `' + LTblNm + '` SET ';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
     // if attr is alias then
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
        Result := Result + '`' + fld.Name + '_id`' + '=:' + fld.Name + '_id,';
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

    end
    else
    begin
      for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
      begin
        if fld.FieldType.TypeKind <> tkRecord then
        begin

          if AnsiLowerCase(fld.Name) = 'id' then
          begin
            var Val := 0;
            fld.SetValue(@Lt, Val);
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

function TOrmData<T>.Select: TOrmData<T>;
var
  LTable: string;
  i, j: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  attr: TCustomAttribute;
  chkInProp: Boolean;
  Lt: t;
begin
  chkInProp := False;
  FSqlwhere := '';
  FSqlField := '';
  FSqlLeftJoin := '';
  LTable := ParsTable;
  FSqlText := 'SELECT  ';

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    if fld.FieldType.TypeKind <> tkRecord then
    begin
      for attr in fld.GetAttributes do
      begin
       // if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
      end;
      if not chkInProp then
        FSqlField := FSqlField + LTable + '.' + fld.Name + ' as ' + LTable + fld.Name
          + ' ,';
      chkInProp := False;
    end;
  end;
  Delete(FSqlField, length(FSqlField), 1);

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    if fld.FieldType.TypeKind = tkRecord then
    begin
      for attr in fld.GetAttributes do
      begin
      //  if attr is alias then
        if Alias(attr).Name = InProp then
        begin
          chkInProp := True;
          Break;
        end;
      end;
      if not chkInProp then
        Self.Join(fld, LTable);
      chkInProp := False;
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

function TOrmData<T>.SelectSub(aFldArr: TRttiField; aTableName, aWhere: string):
  TArrayRecord<T>;
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
          DynArraySetLength(PPointer(valItems.GetReferenceToRawData)^, valItems.TypeInfo,
            1, @len);
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

procedure TOrmData<T>.SetDb(const Value: string);
begin
  FDb := Value;
  Self.FSQl.Db := FDb;
end;

function TOrmData<T>.SubGetData(aFldArr: TRttiField; var aQry: TSqlProvider; aT:
  T; aTableName: string): t;
var
  LField: TRttiField;
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
  Ltbl := StringReplace(Arr.TypeInfo.Name, 'TArrayRecord<module.types.', '', [rfReplaceAll]);
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
          asd := aQry.qry.FieldByName(aTableName + '_' + Ltbl + LField.Name).AsVariant;
          LValue := Tvalue.FromVariant(aQry.qry.FieldByName(aTableName + '_' +
            Ltbl + LField.Name).AsVariant);
          LField.SetValue(TObject(Arr.GetReferenceToRawData), LValue);
        end
        else
          chkInProp := False;
      end;
    end
    else
    begin
      if LField.Name <> 'Items' then
      begin

        var Arrr := LField.GetValue(TObject(Arr.GetReferenceToRawData));
        var art := SubSubGetData(LField, aQry, Arrr, aTableName + '_' + aFldArr.Name);
        LField.SetValue(TObject(Arr.GetReferenceToRawData), art);

      end;

    end;
  end;
  aFldArr.SetValue(Pointer(@aT), Arr);
  Result := aT;
end;

function TOrmData<T>.SubSubGetData(aFldArr: TRttiField; var aQry: TSqlProvider;
  var aT: Tvalue; aTableName: string): Tvalue;
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
          asd := aQry.qry.FieldByName(aTableName + '_' + Ltbl + LField.Name).AsVariant;
          LValue := Tvalue.FromVariant(aQry.qry.FieldByName(aTableName + '_' +
            Ltbl + LField.Name).AsVariant);
          LField.SetValue(TObject(aT.GetReferenceToRawData), LValue);
        end
        else
          chkInProp := False;
      end;
    end
    else
    begin

    //  result := SubGetData(LField, aQry,at);
    end;
  end;

  Result := aT;

end;

procedure TOrmData<T>.Update(aT: T);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld, fld_child: TRttiField;
  I: Integer;
  attr: TCustomAttribute;
  chkInProp: Boolean;
begin
  chkInProp := False;
  LSql := ParsUpdate;
  SetLength(LParmArr, 0);
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    for attr in fld.GetAttributes do
    begin
   //   if Alias(attr).Name = InProp then
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
        LParmArr[Length(LParmArr) - 1].Value := fld.GetValue(@aT).AsVariant;
      end
      else
      begin
        setLength(LParmArr, Length(LParmArr) + 1);
        LParmArr[Length(LParmArr) - 1].Key := fld.Name + '_id';
        var fieldValue := fld.GetValue(@aT);
        for fld_child in rttiContext.GetType(fld.FieldType.Handle).GetFields do
        begin
          if fld_child.Name = 'id' then
          begin
            LParmArr[Length(LParmArr) - 1].Value := fld_child.GetValue(fieldValue.GetReferenceToRawData).AsVariant;
            Break;
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

function TOrmData<T>.Where(const aWherePrmArr: TSqlParamsArr): TOrmData<T>;
var
  i: integer;
begin
  if Length(aWherePrmArr) > 0 then
  begin
    if Pos('WHERE', FSqlwhere) <= 0 then
    begin
      FSqlwhere := FSqlwhere + ' WHERE ';
    end;
    for i := 0 to Length(aWherePrmArr) - 1 do
    begin
      if aWherePrmArr[i].oper = '' then
        aWherePrmArr[i].oper := '=';
      if i = 0 then
        FSqlwhere := FSqlwhere + aWherePrmArr[i].Key + aWherePrmArr[i].oper +
          aWherePrmArr[i].Value
      else
        FSqlwhere := FSqlwhere + ' and ' + aWherePrmArr[i].Key + aWherePrmArr[i].oper
          + aWherePrmArr[i].Value;
    end;

    Result := Self;
  end;
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

function TOrmData<T>.Where(const aField1, aField2: Variant; aOperator: string):
  TOrmData<T>;
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

{ TViewOrmControl<T> }

procedure TViewOrmControl<T>.CreateTable;
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    LOrm.CreateTbl;
    LOrm.Migrate;
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.Del(aTId: integer);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    LOrm.Hide(aTId);
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.DeleteFromId(aId: Integer);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    LOrm.Delete_(aId);
  finally
    LOrm.dest;
  end;
end;

function TViewOrmControl<T>.GetObjArr(aWhere: string): TArrayRecord<t>;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    if aWhere = '' then
    begin
      Result := LOrm.Select.ExcArr;
    end
    else
    begin
      Result := LOrm.Select.Where(aWhere).ExcArr;
    end;
  finally
    LOrm.dest;
  end;
end;

function TViewOrmControl<T>.GetObjFromId(aTId: Integer): T;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    Result := LOrm.Select.Where(LtblStr + '.id', aTId).Exc;
  finally
    LOrm.dest;
  end;

end;

function TViewOrmControl<T>.GetObjFromWhere(aWhere: string): T;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
  LresArr: TArrayRecord<t>;
begin
  Result := Default(T);
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    if aWhere = '' then
    begin
      LresArr := LOrm.Select.ExcArr;
      if LresArr.Count > 0 then
        Result := LresArr[0];
    end
    else
    begin
      LresArr := LOrm.Select.Where(aWhere).ExcArr;
      if LresArr.Count > 0 then
        Result := LresArr[0];
    end;
  finally
    LOrm.dest;
  end;

end;

function TViewOrmControl<T>.Insert(aT: T; aIgnore: Boolean = false; aNested:
  boolean = false): integer;
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    Result := LOrm.Insert(aT, aIgnore);
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.InsertArr(atArr: TArrayRecord<t>; aIgnore: Boolean
  = false; aNested: boolean = false);
var
  LOrm: TOrmData<T>;
  i: integer;
begin
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    for i := 0 to atArr.Count - 1 do
      LOrm.Insert(atArr[i], aIgnore);
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.SetDb(const Value: string);
begin
  FDb := Value;

end;

function TViewOrmControl<T>.Sum(atArr: TArrayRecord<t>; aFieldName: string):
  TArrayRecord<t>;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  Lt: t;
begin
  for fld in rttiContext.GetType(TypeInfo(t)).GetFields do
  begin
    for var I := 0 to atArr.count - 1 do
    begin
      if AnsiLowerCase(fld.Name) = AnsiLowerCase(aFieldName) then
      begin
        var Val := TValue.FromVariant(fld.GetValue(@atArr[I]).AsVariant);
        for var j := 0 to Result.Count - 1 do
        begin
         // if Result[j] then

        end;
        fld.SetValue(@Lt, Val);

      end;
    end

  end;

end;

procedure TViewOrmControl<T>.Update(aT: T; aNested: boolean);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    if Db <> EmptyStr then
      LOrm.Db := Db;
    LOrm.Update(aT);
  finally
    LOrm.dest;
  end;

end;

end.

