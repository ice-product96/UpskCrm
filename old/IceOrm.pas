unit IceOrm;

interface

uses
  system.Generics.Collections, ArrayHelper, system.Classes, system.Rtti,
  system.SysUtils, IceOrm.Sql, system.TypInfo, Uni;

type
  TIceOrm<T> = record
  private
    FSQl: TSqlProvider;
    function ParsTableName: string;
    function GetTableName(aRecName: string): string;
    function ParsSelect(var aT: T; aWhere: string = ''): string;
    function ParsSelectArr(var aT: TArrayRecord<T>;
      aWhere: string = ''): string;
    function ParsInsert(var aT: T): string;
    function ParsUpdate(var aT: T): string;
  public
    procedure Init;
    function CreateTbl: Boolean;
    function OpenSql(aSql: string; aParams: TSqlParamsArr): T;
    function OpenSqlArr(aSql: string; aParams: TSqlParamsArr): TArrayRecord<T>;
    procedure ExSql(aSqlText: string; aParams: TSqlParamsArr);
    procedure GetData(var aT: T; aWhere: string = '');
    procedure GetDataArr(var aTArr: TArrayRecord<T>; aWhere: string = '');
    procedure InsertSqlArr(aTArr: TArrayRecord<T>);
    procedure UpdateSqlArr(aTArr: TArrayRecord<T>);
  end;

implementation

{ TIceOrm<T> }

function TIceOrm<T>.CreateTbl: Boolean;
var
  LSqlStr: string;
  LT: T;
  rttiContext: TRttiContext;
  fld: TRttiField;
  asd: string;
  LTblNm: string;
  LTypeName: string;
begin
  Result := False;
  try
    LTblNm := ParsTableName;
    LSqlStr := 'CREATE TABLE `' + LTblNm + '` (';
    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin

      case fld.FieldType.TypeKind of
        tkInteger:
          LSqlStr := LSqlStr + ' `' + fld.Name + '` INT(11) NOT NULL,';
        tkString, tkUString:
          LSqlStr := LSqlStr + ' `' + fld.Name +
            '`  VARCHAR(2500) NULL DEFAULT NULL COLLATE ''cp1251_general_cs'',';
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

          end;
      end;

    end;
    Delete(LSqlStr, length(LSqlStr), 1);
    LSqlStr := LSqlStr + ');';
    ExSql(LSqlStr, nil);
    Result := true;
  except
    Result := False;

  end;

end;

procedure TIceOrm<T>.ExSql(aSqlText: string; aParams: TSqlParamsArr);
begin

  FSQl.ExSql(aSqlText, aParams);

end;

procedure TIceOrm<T>.GetDataArr(var aTArr: TArrayRecord<T>; aWhere: string);
var
  LSql: string;
begin

  LSql := ParsSelectArr(aTArr, aWhere);
  aTArr := OpenSqlArr(LSql, nil);

end;

function TIceOrm<T>.GetTableName(aRecName: string): string;
begin
  Delete(aRecName, 1, 2);
  Result := aRecName;
end;

procedure TIceOrm<T>.GetData(var aT: T; aWhere: string = '');
var
  LSql: string;
begin
  LSql := ParsSelect(aT, aWhere);
  aT := OpenSql(LSql, nil);
end;

procedure TIceOrm<T>.Init;
begin
  if not FSQl.ChkCreate then
  begin
    FSQl.Create;
  end;
end;

procedure TIceOrm<T>.InsertSqlArr(aTArr: TArrayRecord<T>);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
begin

  LSql := ParsInsert(aTArr.Items[0]);
  for I := 0 to aTArr.Count - 1 do
  begin
    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin
      if fld.Name <> 'id' then
      begin
        SetLength(LParmArr, length(LParmArr) + 1);
        LParmArr[length(LParmArr) - 1].Key := fld.Name;
        LParmArr[length(LParmArr) - 1].Value := fld.GetValue(@aTArr.Items[I])
          .AsVariant;
      end;
    end;
  end;
  ExSql(LSql, LParmArr);
end;

function TIceOrm<T>.OpenSql(aSql: string; aParams: TSqlParamsArr): T;
var
  qry: TUniQuery;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
  val: TValue;
  valVar: Variant;
begin
  qry := FSQl.OpenSql(aSql, aParams);
  try
    qry.Open;

    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin
      qry.First;
      while not qry.Eof do
      begin
        for I := 0 to qry.Fields.Count - 1 do
        begin
          if fld.Name = qry.Fields[I].FieldName then
          begin

            valVar := qry.Fields[I].AsVariant;
            val := TValue.FromVariant(valVar);
            fld.SetValue(@Result, val);

            break;
          end;
        end;

        qry.Next;

      end;

    end;
  finally
    FSQl.Destroy;
    qry.Free;
  end;
end;

function TIceOrm<T>.OpenSqlArr(aSql: string; aParams: TSqlParamsArr)
  : TArrayRecord<T>;
var
  qry: TUniQuery;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
  val: TValue;
  valVar: Variant;
  LRes: T;
  rttiContextJoin: TRttiContext;
  fldJoin: TRttiField;
  LTmp: string;
  valItemsArr: TArray<TValue>;
  len: Longint;
  rttiContextItems: TRttiContext;
  fldItems: TRttiField;
  Li: Integer;
begin
  qry := FSQl.OpenSql(aSql, aParams);
  try
    qry.Open;

    qry.First;
    while not qry.Eof do
    begin
      for I := 0 to qry.Fields.Count - 1 do
      begin
        for fld in rttiContext.GetType(typeInfo(T)).GetFields do
        begin
          if fld.FieldType.TypeKind = tkRecord then
          begin
            var
            Arr := fld.GetValue(@lres);

            for fldJoin in rttiContextJoin.GetType(Arr.TypeInfo).GetFields do
            begin
              LTmp := fldJoin.Name;
              var
              valItems := fldJoin.GetValue(@lres);
              if valItems.GetArrayLength <= 0 then
              begin
                len := 1;
                DynArraySetLength(PPointer(valItems.GetReferenceToRawData)^,
                  valItems.TypeInfo, 1, @len);
              end;
              Li := valItems.GetArrayLength;
              if valItems.GetArrayLength > 0 then
              begin

                var valArr := valItems.GetArrayElement(0);
                for fldItems in rttiContextItems.GetType(valArr.TypeInfo)
                  .GetFields do
                begin
                  if fldItems.Name = qry.Fields[I].FieldName then
                  begin

                    valVar := qry.Fields[I].AsVariant;
                    val := TValue.FromVariant(valVar);

                    fldItems.SetValue(@lres, val);

                    break;
                  end;
                end;
              end;

            end;

          end
          else
          begin
            if fld.Name = qry.Fields[I].FieldName then
            begin

              valVar := qry.Fields[I].AsVariant;
              val := TValue.FromVariant(valVar);

              fld.SetValue(@Lres, val);

              break;
            end;
          end;
        end;
      end;
       Result.Add(LRes);
      qry.Next;
    end;

  finally
    FSQl.Destroy;
    qry.Free;
  end;

end;

function TIceOrm<T>.ParsInsert(var aT: T): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  LTblNm: string;
begin
  LTblNm := ParsTableName;
  Result := 'INSERT INTO ' + LTblNm + '(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    Result := Result + fld.Name + ',';
  end;
  Delete(Result, length(Result), 1);
  Result := Result + ') values(';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    Result := Result + ':' + fld.Name + ',';
  end;
  Delete(Result, length(Result), 1);
  Result := Result + ')';
end;

function TIceOrm<T>.ParsSelect(var aT: T; aWhere: string): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  rttiContextJoin: TRttiContext;
  fldJoin: TRttiField;
  LRttiTypes: TRttiType;
  LTblNm: string;
  LChkJoin: Boolean;
  LTblJoinName: string;
  LJoinSql: string;
  LTmp: string;
  flds: TArray<TRttiField>;
  rttiT: TRttiRecordType;
  fldsT: TArray<TRttiField>;
  lval: TValue;
begin
  LChkJoin := False;
  LTblNm := ParsTableName;
  LJoinSql := '';
  Result := 'SELECT ';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if fld.FieldType.TypeKind <> tkRecord then
    begin
      Result := Result + LTblNm + '.' + fld.Name + ',';

    end
    else
    begin
      LChkJoin := true;
    end;

  end;

  if LChkJoin then
  begin

    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin
      if fld.FieldType.TypeKind = tkRecord then
      begin

        lval := fld.GetValue(@aT);
        for fldJoin in rttiContext.GetType(fld.FieldType.Handle).GetFields do
        begin
          LTmp := fldJoin.Name;
          rttiT := fldJoin.FieldType.AsRecord;
          flds := rttiT.GetFields;
          LTblNm := fldsT[0].Name;

        end;

        if fldJoin.Name = 'id' then
        begin
          LTblJoinName := GetTableName(fld.FieldType.ToString);
          LJoinSql := LJoinSql + ' JOIN ' + LTblJoinName + ' ON ' + LTblNm + '.'
            + LTblJoinName + '_id=' + LTblJoinName + '.id';
        end
        else
        begin
          Result := Result + LTblJoinName + '.' + fld.Name + ',';
        end;

      end;

    end;
  end;

  Delete(Result, length(Result), 1);
  Result := Result + ' FROM ' + LTblNm;
  Result := Result + ' ' + LJoinSql;
  if aWhere <> '' then
  begin
    Result := Result + ' WHERE ' + aWhere;
  end;
end;

function TIceOrm<T>.ParsSelectArr(var aT: TArrayRecord<T>;
  aWhere: string): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  rttiContextJoin: TRttiContext;
  fldJoin: TRttiField;
  rttiContextItems: TRttiContext;
  fldItems: TRttiField;
  LTblNm: string;
  LChkJoin: Boolean;
  LTblJoinName: string;
  LJoinSql: string;
  LTmp: string;
  lval: TValue;
  k: Integer;
begin
  LChkJoin := False;
  LTblNm := ParsTableName;
  LJoinSql := '';
  Result := 'SELECT ';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if fld.FieldType.TypeKind <> tkRecord then
    begin
      Result := Result + LTblNm + '.' + fld.Name + ',';

    end
    else
    begin
      LChkJoin := true;
    end;

  end;

  if LChkJoin then
  begin

    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin
      if fld.FieldType.TypeKind = tkRecord then
      begin

        var
        Arr := fld.GetValue(@aT);
        for fldJoin in rttiContextJoin.GetType(Arr.TypeInfo).GetFields do
        begin
          LTmp := fldJoin.Name;
          var
          valItems := fldJoin.GetValue(@aT);
          if valItems.GetArrayLength > 0 then
          begin
            var
            valArr := valItems.GetArrayElement(0);
            for fldItems in rttiContextItems.GetType(valArr.TypeInfo)
              .GetFields do
            begin

              if fldItems.Name = 'id' then
              begin
                LTblJoinName := GetTableName(valArr.TypeInfo.NameFld.ToString);
                LJoinSql := LJoinSql + ' JOIN ' + LTblJoinName + ' ON ' + LTblNm
                  + '.' + LTblJoinName + '_id=' + LTblJoinName + '.id';
                Result := Result + LTblJoinName + '.' + fldItems.Name + ',';
              end
              else
              begin
                Result := Result + LTblJoinName + '.' + fldItems.Name + ',';
              end;

            end;
          end;

        end;

      end;

    end;
  end;

  Delete(Result, length(Result), 1);
  Result := Result + ' FROM ' + LTblNm;
  Result := Result + ' ' + LJoinSql;
  if aWhere <> '' then
  begin
    Result := Result + ' WHERE ' + aWhere;
  end;

end;

function TIceOrm<T>.ParsTableName: string;
var
  LTypeInfo: PTypeInfo;
begin
  LTypeInfo := TypeInfo(T);
  Result := LTypeInfo.Name;
  Delete(Result, 1, 2);
end;

function TIceOrm<T>.ParsUpdate(var aT: T): string;
var
  rttiContext: TRttiContext;
  fld: TRttiField;
  LTblNm: string;
begin
  LTblNm := ParsTableName;
  Result := 'UPDATE ' + LTblNm + ' SET ';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if fld.Name <> 'id' then
    begin
      Result := Result + fld.Name + '=:' + fld.Name + ',';
    end;
  end;
  Delete(Result, length(Result), 1);
  Result := Result + ' WHERE id=:id';

end;

procedure TIceOrm<T>.UpdateSqlArr(aTArr: TArrayRecord<T>);
var
  LSql: string;
  LParmArr: TSqlParamsArr;
  rttiContext: TRttiContext;
  fld: TRttiField;
  I: Integer;
begin
  LSql := ParsUpdate(aTArr.Items[0]);
  for I := 0 to aTArr.Count - 1 do
  begin
    for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
    begin

      SetLength(LParmArr, length(LParmArr) + 1);
      LParmArr[length(LParmArr) - 1].Key := fld.Name;
      LParmArr[length(LParmArr) - 1].Value := fld.GetValue(@aTArr.Items[I])
        .AsVariant;

    end;
  end;
  ExSql(LSql, LParmArr);
end;

end.
