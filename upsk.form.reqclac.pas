unit upsk.form.reqclac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, Data.DB, DBAccess,
  Uni, MemDS, uniDateTimePicker, uniEdit, Vcl.Menus, uniMainMenu;

type
  TfrmReqCalc = class(TUniForm)
    pcReq: TUniPageControl;
    pgLrsp200: TUniTabSheet;
    gridLrsp200: TUniDBGrid;
    qryLrsp: TUniQuery;
    dsLrsp: TUniDataSource;
    popCl: TUniPopupMenu;
    hpFilter: TUniHiddenPanel;
    edtFilterKagent: TUniEdit;
    edtFilterId: TUniNumberEdit;
    edtFilterPhone: TUniEdit;
    edtFilterAdress: TUniEdit;
    edtFilterComment: TUniEdit;
    edtFilterAmount: TUniNumberEdit;
    dtFilterDate: TUniDateTimePicker;
    unmntmN1: TUniMenuItem;
    unmntmN2: TUniMenuItem;
    unmntmN3: TUniMenuItem;
    procedure gridLrsp200ColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
    procedure unmntmN1Click(Sender: TObject);
    procedure unmntmN2Click(Sender: TObject);
    procedure unmntmN3Click(Sender: TObject);
    procedure gridLrsp200MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pcReqChangeValue(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    Fqry: TUniQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReqCalc: TfrmReqCalc;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.reqclac.lrsp200, upsk.globalMetod,
  upsk.viewcontrol, upsk.types, unigui.helpers;

function frmReqCalc: TfrmReqCalc;
begin
  Result := TfrmReqCalc(UniMainModule.GetFormInstance(TfrmReqCalc));
end;

procedure TfrmReqCalc.gridLrsp200ColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
var
  LValue: Variant;
begin
  LValue := Value;
  if Sender.DataSource.DataSet.Active then
  begin
    if (Column.FieldName = 'id') or (Column.FieldName = 'price_amount_calc') then
      if Value = -1 then
        LValue := '';
    if Column.FieldName = 'datetime' then
    begin

    end;

    (Sender.DataSource.DataSet as TUniQuery).Params.ParamValues[Column.FieldName] := '%' + LValue + '%';
    Sender.DataSource.DataSet.Refresh;
  end;

end;

procedure TfrmReqCalc.gridLrsp200MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popCl.Popup(X, Y, gridLrsp200);
end;

procedure TfrmReqCalc.pcReqChangeValue(Sender: TObject);
begin
  if Fqry <> nil then
  begin
    Fqry.Close;
  end;
  case pcReq.ActivePageIndex of
    0:
      Fqry := qryLrsp;

  end;
  Fqry.Connection := uniMainModule.dbUpsk;
  Fqry.Open;
end;

procedure TfrmReqCalc.UniFormAfterShow(Sender: TObject);
begin
  if Fqry <> nil then
  begin
    Fqry.Close;
  end;

  Fqry := qryLrsp;
  pcReq.ActivePageIndex := 0;
  Fqry.Connection := uniMainModule.dbUpsk;
  Fqry.Open;
end;

procedure TfrmReqCalc.unmntmN1Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmReqCalcLrsp200,
    procedure(aRes: Integer)
    begin
      gridLrsp200.DataSource.DataSet.Refresh;
    end);
end;

procedure TfrmReqCalc.unmntmN2Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmReqCalcLrsp200,
    procedure(aRes: Integer)
    begin
      gridLrsp200.DataSource.DataSet.Refresh;
    end).SetTag(gridLrsp200.DataSource.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrmReqCalc.unmntmN3Click(Sender: TObject);
var
  LCacl: TViewOrmControl<Tcalc_lrsp200>;
begin
  MessageDlg('Удалить расчет номер ' + gridLrsp200.DataSource.DataSet.FieldByName('id').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            LCacl.Del(gridLrsp200.DataSource.DataSet.FieldByName('id').AsInteger);
            gridLrsp200.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

end.

