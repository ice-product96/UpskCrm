unit upsk.form.sklad.arrival;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniLabel,
  uniGUIBaseClasses, uniMultiItem, uniComboBox, uniButton, uniEdit,
  uniDateTimePicker, uniMemo, upsk.types, upsk.datamanager;

type
  TfrmArrival = class(TUniForm)
    cmbPosition: TUniComboBox;
    lbl1: TUniLabel;
    btnOpenPos: TUniButton;
    btnAddPos: TUniButton;
    cmbItemsArrival: TUniComboBox;
    lbl11: TUniLabel;
    edtDocNumber: TUniEdit;
    lbl12: TUniLabel;
    edtCount: TUniNumberEdit;
    lbl13: TUniLabel;
    edtUnit: TUniEdit;
    lbl121: TUniLabel;
    dtDoc: TUniDateTimePicker;
    lbl14: TUniLabel;
    mmoComment: TUniMemo;
    lbl15: TUniLabel;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    procedure UniFormAfterShow(Sender: TObject);
    procedure cmbPositionSelect(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOpenPosClick(Sender: TObject);
    procedure btnAddPosClick(Sender: TObject);
  private
    FSklad_id: integer;
    FPosition: TPositionArr;
    Fitems_arrival: Titems_arrivalArr;
    FOldPositionId: integer;
    FDeal_id: integer;
    procedure UpdateViewPosition;
    procedure UpdateViewItemsArrival;
    procedure SetViewPosition;
    procedure LoadSkladArrival(aSkladArrivalId: integer);

    { Private declarations }
  public
    Sklad_id: integer;
    { Public declarations }
  end;

function frmArrival: TfrmArrival;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.guide.editPosition, upsk.globalMetod,
  unigui.helpers;

function frmArrival: TfrmArrival;
begin
  Result := TfrmArrival(UniMainModule.GetFormInstance(TfrmArrival));
end;

{ TfrmArrival }

procedure TfrmArrival.btnAcceptClick(Sender: TObject);
var
  ls: TSklad_Arrival;
begin
  ls.sklad_id := Sklad_id;
  ls.position_id := FPosition[cmbPosition.ItemIndex].id;
  ls.count := edtCount.Value;
  ls.items_arrival_id := Fitems_arrival[cmbItemsArrival.ItemIndex].id;
  ls.datetime := Now;
  ls.doc_number := edtDocNumber.Text;
  ls.doc_date := dtDoc.DateTime;
  ls.comment := mmoComment.Text;
  ls.user_id := DataManager.User.id;
  ls.deal_id := FDeal_id;
  if Self.Tag = 0 then
  begin
    ls.id := 0;
    ViewControl.InsertSkladArrival(ls);
  end
  else
  begin
    ls.id := self.tag;
    ViewControl.UpdateSkladArrival(ls);
  end;
  ModalResult := mrOk;
end;

procedure TfrmArrival.btnAddPosClick(Sender: TObject);
begin
  (CreateAndShowForm(TfrmEditPosition));
end;

procedure TfrmArrival.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TfrmArrival.btnOpenPosClick(Sender: TObject);
var
  p: THelpData<TPosition>;
begin
  FOldPositionId := FPosition[cmbPosition.ItemIndex].id;
  (CreateAndShowModalForm(TfrmEditPosition,
  procedure(aRes: integer)
  begin
    UpdateViewPosition;

    cmbPosition.Text := p.GetNameFromId(FOldPositionId, FPosition);
    SetViewPosition;
  end).SetTag(FPosition[cmbPosition.ItemIndex].id));

end;

procedure TfrmArrival.cmbPositionSelect(Sender: TObject);
begin
  SetViewPosition;
end;

procedure TfrmArrival.LoadSkladArrival(aSkladArrivalId: integer);
var
  Ls: TSklad_Arrival;
begin
  Ls := ViewControl.GetSkladArrival(aSkladArrivalId);
  if Ls.id <> 0 then
  begin
    cmbPosition.Text := Ls.position.name;
    edtCount.Value := Ls.count;
    edtUnit.Text := Ls.position.Unit_.name;
    cmbItemsArrival.Text := Ls.items_arrival.name;
    edtDocNumber.Text := Ls.doc_number;
    dtDoc.DateTime := Ls.datetime;
    mmoComment.Text := Ls.comment;
    FDeal_id := Ls.deal_id;
  end;
end;

procedure TfrmArrival.SetViewPosition;
begin
  if cmbPosition.ItemIndex >= 0 then
  begin
    edtUnit.Text := FPosition[cmbPosition.ItemIndex].Unit_.name;
  end;
end;

procedure TfrmArrival.UniFormAfterShow(Sender: TObject);
begin

  UpdateViewPosition;
  UpdateViewItemsArrival;
  if Self.Tag > 0 then
  begin
    LoadSkladArrival(self.tag);
  end;
end;

procedure TfrmArrival.UpdateViewItemsArrival;
var
  I: Integer;
begin
  cmbItemsArrival.Clear;
  Fitems_arrival := ViewControl.GetItemsArrival;
  for I := 0 to Fitems_arrival.Count - 1 do
  begin
    cmbItemsArrival.Items.Add(Fitems_arrival[I].name);
  end;
end;

procedure TfrmArrival.UpdateViewPosition;
var
  I: Integer;
begin
  FPosition := ViewControl.GetPositionArr;
  cmbPosition.Clear;
  for I := 0 to FPosition.Count - 1 do
  begin
    cmbPosition.Items.Add(FPosition[I].name);
  end;
end;

end.

