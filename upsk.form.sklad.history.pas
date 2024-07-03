unit upsk.form.sklad.history;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, Data.DB,
  DBAccess, Uni, MemDS, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, Vcl.Menus,
  uniMainMenu;

type
  TfrmSkladHistory = class(TUniForm)
    gridHistory: TUniDBGrid;
    qryHistory: TUniQuery;
    dsHistory: TUniDataSource;
    popHistory: TUniPopupMenu;
    miN1: TUniMenuItem;
    procedure UniFormAfterShow(Sender: TObject);
    procedure gridHistoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure miN1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Sklad_id: Integer;
    { Public declarations }
  end;

function frmSkladHistory: TfrmSkladHistory;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.globalMetod, upsk.form.sklad.arrival,
  upsk.form.sklad.expense, unigui.helpers;

function frmSkladHistory: TfrmSkladHistory;
begin
  Result := TfrmSkladHistory(UniMainModule.GetFormInstance(TfrmSkladHistory));
end;

procedure TfrmSkladHistory.gridHistoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
  begin
    popHistory.Popup(X, Y, gridHistory);
  end;
end;

procedure TfrmSkladHistory.miN1Click(Sender: TObject);
begin
  if gridHistory.DataSource.DataSet.FieldByName('it').AsInteger = 1 then
  begin
    (CreateAndShowForm(TfrmArrival).settag(gridHistory.DataSource.DataSet.FieldByName('id').AsInteger) as TfrmArrival).Sklad_id := Sklad_id;
  end
  else if gridHistory.DataSource.DataSet.FieldByName('it').AsInteger = 2 then
  begin
    (CreateAndShowForm(TfrmExpense).settag(gridHistory.DataSource.DataSet.FieldByName('id').AsInteger) as TfrmExpense).Sklad_id := Sklad_id;
  end;
end;

procedure TfrmSkladHistory.UniFormAfterShow(Sender: TObject);
begin
  qryHistory.Close;
  qryHistory.ParamByName('sid').AsInteger := Sklad_id;
  qryHistory.ParamByName('pid').AsInteger := Self.Tag;
  qryHistory.Open;
end;

end.

