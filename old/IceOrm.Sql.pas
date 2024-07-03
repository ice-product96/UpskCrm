unit IceOrm.Sql;

interface

uses
  Data.DB, MemDS, DBAccess, SysUtils, UniProvider, MySQLUniProvider, Uni;

type
  TTypeInfo = class
    class function TypeInfoToStr<T>(const X: T): string;
  end;

type
  TSqlParams = record
    Key: string;
    Value: Variant;
  public
  end;

  TSqlParamsArr = TArray<TSqlParams>;

function CP(aKey: string; aValue: Variant): TSqlParams;

type
  TSqlProvider = record
  private
    FConnect: TUniConnection;
    FMysqlProv: TMySQLUniProvider;
  public
    qry: TUniQuery;
    procedure Create;
    procedure Connect;
    function Connected: Boolean;
    procedure Destroy;
    function LastInsertId: Integer;
    procedure ExSql(aSqlText: string; aParams: TSqlParamsArr);
    function OpenSql(aSqlText: string; aParams: TSqlParamsArr): TUniQuery;

    function ChkCreate: Boolean;

  end;

implementation

uses
  System.TypInfo;

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

procedure TSqlProvider.Create;
begin

  FConnect := TUniConnection.Create(nil);

  FMysqlProv := TMySQLUniProvider.Create(FConnect);
  FConnect.ConnectString :=
    'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=46.48.77.43;Database=upsk;Login Prompt=False';
  //FConnect.ConnectString := 'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=127.0.0.1;Database=upsk;Login Prompt=False';
  FConnect.SpecificOptions.Values['ConnectionTimeOut'] := '20';
  FConnect.Connect;
  qry := TUniQuery.Create(FConnect);
  qry.Connection := FConnect;
end;

procedure TSqlProvider.Destroy;
begin
  //
  FConnect.Free;

  inherited;
end;

procedure TSqlProvider.ExSql(aSqlText: string; aParams: TSqlParamsArr);
var
  i: Integer;
  Lqry: TUniQuery;
begin
  // Create;
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

    with qry do
    begin
      Sql.Clear;
      Sql.Text := aSqlText;
      for i := 0 to Length(aParams) - 1 do
      begin
        ParamByName(aParams[i].Key).Value := aParams[i].Value;
      end;
      Open;
      First;
    end;
  finally

  end;
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

