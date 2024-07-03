unit IceOrm.Sql;

interface

uses
  Data.DB, MemDS, DBAccess, SysUtils, UniProvider, MySQLUniProvider, Uni,
  u_wCodeTrace, system.TypInfo, Rtti, System.Classes;

type
  TTypeInfo = class
    class function TypeInfoToStr<T>(const X: T): string;
  end;

type
  TSqlParams = record
    Key: string;
    Value: Variant;
    oper: string;
  public
  end;

  TSqlParamsArr = TArray<TSqlParams>;

function CP(aKey: string; aValue: Variant): TSqlParams;

type
  TSqlProvider = record
  private
    FConnect: TUniConnection;
    FMysqlProv: TMySQLUniProvider;
    FDb: string;
    FWcode: TCodeTraceManager;
    procedure SetDb(const Value: string);
  public
    qry: TUniQuery;
    procedure Create(aSettingsStr: string = '');
    procedure Connect;
    function Connected: Boolean;
    procedure Destroy;
    function LastInsertId: Integer;
    procedure ExSql(aSqlText: string; aParams: TSqlParamsArr);
    function OpenSql(aSqlText: string; aParams: TSqlParamsArr): TUniQuery;
    property Db: string read FDb write SetDb;
    function ChkCreate: Boolean;
    procedure AddNewColumn(aTableName, aColumnName: string; aType: TRttiType);

  end;

implementation

procedure TSqlProvider.AddNewColumn(aTableName, aColumnName: string; aType: TRttiType);
var
  Ltype, Lid: string;
  Lqry: TUniQuery;
begin
  Lid := '';
  Lqry := TUniQuery.Create(nil);
  try
    Lqry.Connection := FConnect;
    var LTblNm := aTableName;
    if aType <> nil then
    begin
      case aType.TypeKind of

        tkString, tkUString:
          Ltype := 'VARCHAR(2500) NULL DEFAULT '''' COLLATE ''cp1251_general_cs''';
        tkInteger:
          Ltype := 'INT(11) NOT NULL';
        tkFloat:
          begin
            var LTypeName := aType.ToString;
            if SameText(LTypeName, 'TDateTime') then
            begin
              Ltype := 'DATETIME NULL';
            end
            else if SameText(LTypeName, 'TDate') then
            begin
              Ltype := 'DATE NULL';
            end
            else if SameText(LTypeName, 'TTime') then
            begin
              Ltype := 'TIME NULL';
            end
            else
            begin
              Ltype := 'DOUBLE NULL DEFAULT ''0''';
            end;

          end;
//       ftWideString:
//        Ltype := 'VARCHAR(2500) NULL DEFAULT '''' COLLATE ''cp1251_general_cs''';
//      ftLargeint:
//        Ltype := '';
//      ftVariant:
//        Ltype := '';
//      ftShortint:
//        Ltype := '';
      end;
    end
    else
    begin
      Lid := '_id';
      Ltype := 'INT(11) NULL, ADD INDEX `' + aColumnName + '_id` (`' +
        aColumnName + '_id`)';
    end;
    var LSqlStr := 'ALTER TABLE `' + LTblNm + '` ADD COLUMN `' + aColumnName +Lid+
      '` ' + Ltype;
    Lqry.SQL.Clear;

    Lqry.SQL.Text := LSqlStr;
    Lqry.ExecSQL;
  finally
    Lqry.Free;
  end;
end;

function TSqlProvider.ChkCreate: Boolean;
begin
  Result := Assigned(FConnect);
end;

procedure TSqlProvider.Connect;
begin
  if FConnect.Connected = False then
    FConnect.Connect;
end;

function TSqlProvider.Connected: Boolean;
begin
  Result := FConnect.Connected;
end;

function CP(aKey: string; aValue: Variant): TSqlParams;
begin
  Result.Key := aKey;
  Result.Value := aValue;
end;

procedure TSqlProvider.Create(aSettingsStr: string = '');
begin
  try
    FWcode := TCodeTraceManager.Create(0);
    FWcode.wLog('i', 'Start OrmObject');
    FConnect := TUniConnection.Create(nil);
    FMysqlProv := TMySQLUniProvider.Create(FConnect);
   // FConnect.ConnectString := 'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=192.168.1.34;Database=gf_ceh_rer;Login Prompt=False';
    FConnect.ConnectString :=
      'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=46.48.77.43;Database=upsk;Login Prompt=False';

    FConnect.Connect;
    qry := TUniQuery.Create(FConnect);
    qry.Connection := FConnect;
  except
    on e: Exception do
      FWcode.wLog('e', ' TSqlProvider.Create - ' + e.Message + '|' + e.ClassName);

  end;
end;

procedure TSqlProvider.Destroy;
begin
  //
  FConnect.Free;
  FWcode.Free;
  inherited;
end;

procedure TSqlProvider.ExSql(aSqlText: string; aParams: TSqlParamsArr);
var
  i: Integer;
  Lqry: TUniQuery;
begin
  // Create;
  try
    try
      Lqry := TUniQuery.Create(nil);
      try
        Lqry.Connection := FConnect;
        with Lqry do
        begin
          Sql.Clear;
          Sql.Text := aSqlText;
          for i := 0 to Length(aParams) - 1 do
          begin
            if Pos('date', aParams[i].Key) > 0 then
            begin
              ParamByName(aParams[i].Key).AsDateTime := aParams[i].Value;
            end
            else
            begin
              ParamByName(aParams[i].Key).Value := aParams[i].Value;
            end;
          end;
          ExecSQL;
        end;
      finally
        Lqry.Free;
      end;
    finally
    // Destroy;
    end;
  except
    on e: exception do
      raise Exception.Create('ORM ERROR execSql ' + e.Message + '|' + e.ClassName);

  end;
end;

function TSqlProvider.LastInsertId: Integer;
begin

  qry := OpenSql('SELECT LAST_INSERT_ID() AS lid', []);
  try
    with qry do
    begin
      Open;
      First;
      Result := FieldByName('lid').AsInteger;
    end;
  finally

  end;
end;

function TSqlProvider.OpenSql(aSqlText: string; aParams: TSqlParamsArr): TUniQuery;
var
  i: Integer;
begin

  if not Assigned(qry) then
  begin
    qry := TUniQuery.Create(nil);
    qry.Connection := FConnect;
  end;

  try
    try
      with qry do
      begin
        qry.Close;
        Sql.Clear;
        Sql.Text := aSqlText;
        for i := 0 to Length(aParams) - 1 do
        begin
          ParamByName(aParams[i].Key).Value := aParams[i].Value;
        end;
        Open;
        First;
      end;
    except
      on e: exception do
        raise Exception.Create('ORM ERROR OpenSql ' + e.Message + '|' + e.ClassName);

    end;
  finally

  end;

end;

procedure TSqlProvider.SetDb(const Value: string);
begin
  FDb := Value;
  FConnect.Database := FDb;

end;

{ TTypeInfo }

class function TTypeInfo.TypeInfoToStr<T>(const X: T): string;
var
  LTypeInfo: PTypeInfo;
begin

end;

initialization

finalization

end.

