unit upsk.form.sklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniLabel, uniMultiItem,
  uniComboBox, uniPanel, Data.DB, DBAccess, Uni, MemDS, upsk.form.sklad.arrival,
  upsk.form.sklad.expense, Vcl.Menus, uniMainMenu, System.Rtti, upsk.types,
  TypInfo;

type
  TfrmSklad = class(TUniForm)
    gridRemains: TUniDBGrid;
    pnlSklad: TUniPanel;
    cmbSklad: TUniComboBox;
    lblSklad: TUniLabel;
    qryRemains: TUniQuery;
    dsRemains: TUniDataSource;
    popSklad: TUniPopupMenu;
    miHistory: TUniMenuItem;
    miN1: TUniMenuItem;
    miN2: TUniMenuItem;
    miN3: TUniMenuItem;
    miN4: TUniMenuItem;
    miN5: TUniMenuItem;
    cmbFilterPackage: TUniComboBox;
    lblFilterPackage: TUniLabel;
    procedure miN2Click(Sender: TObject);
    procedure gridRemainsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure miN3Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure miN4Click(Sender: TObject);
    procedure cmbSkladSelect(Sender: TObject);
    procedure miHistoryClick(Sender: TObject);
    procedure cmbFilterPackageSelect(Sender: TObject);
  private
    FSklad: TSkladArr;
    Fpackage: TpackageArr;
    procedure ChkSelectSklad;
    procedure UpdateViewSklad;
    procedure UpdateGridRemains;
    procedure UpdateViewPackage;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSklad: TfrmSklad;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.globalMetod, unigui.helpers,
  upsk.form.sklad.history;

function frmSklad: TfrmSklad;
begin
  Result := TfrmSklad(UniMainModule.GetFormInstance(TfrmSklad));
end;

procedure TfrmSklad.ChkSelectSklad;
begin
  if cmbSklad.ItemIndex <= -1 then
  begin
    ShowMessage('Выберите склад');
    exit;
  end;

end;

procedure TfrmSklad.cmbFilterPackageSelect(Sender: TObject);
var
  I: Integer;
begin
  if cmbFilterPackage.Text = '' then
  begin
    qryRemains.Filtered := False;
    qryRemains.Filter := '';
  end
  else
  begin
    for I := 0 to Fpackage[cmbFilterPackage.ItemIndex].packageBuildArr.Count - 1 do
    begin
      if qryRemains.Filter <> '' then
      begin
        qryRemains.Filter := qryRemains.Filter + ' or ';
      end;
      qryRemains.Filter := qryRemains.Filter + 'pname='''+Fpackage[cmbFilterPackage.ItemIndex].packageBuildArr[I].Position.name+'''';
    end;
     qryRemains.Filtered := true;
  end;
end;

procedure TfrmSklad.cmbSkladSelect(Sender: TObject);
begin
  UpdateGridRemains;
end;

procedure TfrmSklad.gridRemainsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popSklad.Popup(X, Y, gridRemains);
end;

procedure TfrmSklad.miHistoryClick(Sender: TObject);
begin
  (CreateAndShowForm(TfrmSkladHistory).SetTag(gridRemains.DataSource.DataSet.FieldByName('id').AsInteger) as TfrmSkladHistory).Sklad_id := FSklad[cmbSklad.ItemIndex].id;
  gridRemains.DataSource.DataSet.Refresh;
end;

procedure TfrmSklad.miN2Click(Sender: TObject);
var
  LPosId: integer;
begin
  if cmbSklad.ItemIndex < 0 then
  begin
    ShowMessage('Выберите склад');
    exit;
  end;
  LPosId := 0;
  (CreateAndShowForm(TfrmArrival).SetTag(LPosId) as TfrmArrival).Sklad_id := FSklad[cmbSklad.ItemIndex].id;

end;

procedure TfrmSklad.miN3Click(Sender: TObject);
var
  LPosId: integer;
begin
  if cmbSklad.ItemIndex < 0 then
  begin
    ShowMessage('Выберите склад');
    exit;
  end;
  LPosId := gridRemains.DataSource.DataSet.FieldByName('id').AsInteger;
  (CreateAndShowForm(TfrmExpense).SetTag(LPosId) as TfrmExpense).Sklad_id := FSklad[cmbSklad.ItemIndex].id;
end;

procedure TfrmSklad.miN4Click(Sender: TObject);
begin
  UpdateGridRemains;
end;

procedure TfrmSklad.UniFormAfterShow(Sender: TObject);
begin
  UpdateViewSklad;
  UpdateViewPackage;
end;

procedure TfrmSklad.UniFormShow(Sender: TObject);
begin
  FSklad := ViewControl.GetSkladArr;
end;

procedure TfrmSklad.UpdateGridRemains;
begin
  qryRemains.Close;
  ChkSelectSklad;
  qryRemains.ParamByName('sid').AsInteger := FSklad[cmbSklad.ItemIndex].id;
  qryRemains.Open;
end;

procedure TfrmSklad.UpdateViewPackage;
var
  LData: THelpData<Tpackage>;
  I: Integer;
begin
  Fpackage := ViewControl.GetPackageArr;
  for I := 0 to Fpackage.Count - 1 do
  begin
    Fpackage.items[I].packageBuildArr := ViewControl.GetPackageBuildArr(Fpackage[I].id);
  end;
  LData.AddDataCombox(cmbFilterPackage, Fpackage, 'name');
end;

procedure TfrmSklad.UpdateViewSklad;
var
  I: Integer;
begin
  cmbSklad.Clear;
  for I := 0 to FSklad.Count - 1 do
  begin
    cmbSklad.Items.Add(FSklad[I].name);
  end;
end;

end.

