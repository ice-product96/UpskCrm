unit upsk.form.sklad.expense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniMemo,
  uniDateTimePicker, uniEdit, uniButton, uniLabel, uniGUIBaseClasses, upsk.types,
  uniMultiItem, uniComboBox;

type
  TfrmExpense = class(TUniForm)
    cmbPosition: TUniComboBox;
    lbl1: TUniLabel;
    btnOpenPos: TUniButton;
    btnAddPos: TUniButton;
    cmbItemsExpense: TUniComboBox;
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
    procedure btnAcceptClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure SetViewPosition;
    procedure LoadSkladAExpense(aSkladExpenseId: integer);
    procedure btnOpenPosClick(Sender: TObject);
    procedure btnAddPosClick(Sender: TObject);
    procedure cmbPositionSelect(Sender: TObject);
  private
    FSklad_id: integer;
    FPosition: TPositionArr;
    Fitems_expens: Titems_expenseArr;
    FOldPositionId: integer;
    FDeal_id: integer;
    procedure UpdateViewPosition;
    procedure UpdateViewItemsExpense;
    { Private declarations }
  public
    Sklad_id: integer;
    { Public declarations }
  end;

function frmExpense: TfrmExpense;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.guide.editPosition, upsk.globalMetod,
  unigui.helpers, upsk.datamanager;

function frmExpense: TfrmExpense;
begin
  Result := TfrmExpense(UniMainModule.GetFormInstance(TfrmExpense));
end;

procedure TfrmExpense.btnAcceptClick(Sender: TObject);
var
  ls: TSklad_Expense;
begin
  ls.sklad_id := Sklad_id;
  ls.position_id := FPosition[cmbPosition.ItemIndex].id;
  ls.count := edtCount.Value;
  ls.items_expense_id := Fitems_expens[cmbItemsExpense.ItemIndex].id;
  ls.datetime := Now;
  ls.doc_number := edtDocNumber.Text;
  ls.doc_date := dtDoc.DateTime;
  ls.comment := mmoComment.Text;
  ls.user_id := DataManager.User.id;
  ls.deal_id := FDeal_id;
  if Self.Tag = 0 then
  begin
    ls.id := 0;
    ViewControl.InsertSkladExpense(ls);
  end
  else
  begin
    ls.id := self.tag;
    ViewControl.InsertSkladExpense(ls);
  end;
  ModalResult := mrOk;

end;

procedure TfrmExpense.btnAddPosClick(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditPosition));
end;

procedure TfrmExpense.btnOpenPosClick(Sender: TObject);
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

procedure TfrmExpense.cmbPositionSelect(Sender: TObject);
begin
  SetViewPosition;
end;

procedure TfrmExpense.LoadSkladAExpense(aSkladExpenseId: integer);
var
  Ls: TSklad_Expense;
begin
  Ls := ViewControl.GetSkladExpense(aSkladExpenseId);
  if Ls.id <> 0 then
  begin
    cmbPosition.Text := Ls.position.name;
    edtCount.Value := Ls.count;
    edtUnit.Text := Ls.position.Unit_.name;
    cmbItemsExpense.Text := Ls.items_expense.name;
    edtDocNumber.Text := Ls.doc_number;
    dtDoc.DateTime := Ls.datetime;
    mmoComment.Text := Ls.comment;
    FDeal_id := Ls.deal_id;
  end;

end;

procedure TfrmExpense.SetViewPosition;
begin
  if cmbPosition.ItemIndex >= 0 then
  begin
    edtUnit.Text := FPosition[cmbPosition.ItemIndex].Unit_.name;
  end;
end;

procedure TfrmExpense.UniFormAfterShow(Sender: TObject);
begin
  UpdateViewPosition;
  UpdateViewItemsExpense;
  if Self.Tag > 0 then
  begin
    LoadSkladAExpense(self.tag);
  end;
end;

procedure TfrmExpense.UpdateViewItemsExpense;
var
  I: Integer;
begin
  cmbItemsExpense.Clear;
  Fitems_expens := ViewControl.GetItemsExpense;
  for I := 0 to Fitems_expens.Count - 1 do
  begin
    cmbItemsExpense.Items.Add(Fitems_expens[I].name);
  end;

end;

procedure TfrmExpense.UpdateViewPosition;
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

