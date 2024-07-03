unit upsk.form.deal.editCash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniRadioGroup, uniLabel, uniEdit, upsk.viewcontrol, uniMemo,
  uniButton, uniMultiItem, uniComboBox, upsk.globalMetod, upsk.types,
  uniDateTimePicker;

type
  TfrmEditCash = class(TUniForm)
    edtAmount: TUniNumberEdit;
    lbl1: TUniLabel;
    btnAccept: TUniButton;
    mmoComment: TUniMemo;
    lbl3: TUniLabel;
    dtOper: TUniDateTimePicker;
    lbl4: TUniLabel;
    lbl5: TUniLabel;
    lbl6: TUniLabel;
    lbl7: TUniLabel;
    lbl8: TUniLabel;
    edtRental: TUniNumberEdit;
    edtPledge: TUniNumberEdit;
    edtDelivery: TUniNumberEdit;
    edtDeliveryOut: TUniNumberEdit;
    lblRenatal: TUniLabel;
    lblPledge: TUniLabel;
    lblDelivery: TUniLabel;
    lblDeliveryOut: TUniLabel;
    procedure btnAcceptClick(Sender: TObject);
    procedure UpdateCashItems;
    procedure UniFormAfterShow(Sender: TObject);
    procedure edtRentalChange(Sender: TObject);
    procedure lblRenatalClick(Sender: TObject);
    procedure lblPledgeClick(Sender: TObject);
    procedure lblDeliveryClick(Sender: TObject);
    procedure lblDeliveryOutClick(Sender: TObject);
  private
    Fdeal_id: integer;
    FType_oper: integer;
    FciArr: TTcash_in_itemsArr;
    FcoArr: TTcash_out_itemsArr;
    procedure SetTypeOper(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
  published
    property deal_id: integer read Fdeal_id write Fdeal_id;
    property Type_oper: integer read FType_oper write SetTypeOper;
  end;

function frmEditCash: TfrmEditCash;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditCash: TfrmEditCash;
begin
  Result := TfrmEditCash(UniMainModule.GetFormInstance(TfrmEditCash));
end;

procedure TfrmEditCash.btnAcceptClick(Sender: TObject);
begin

  if edtRental.Value > 0 then
    AddCashIn(deal_id, 2, edtRental.Value, mmoComment.Text);

  if edtPledge.Value > 0 then
    AddCashIn(deal_id, 5, edtPledge.Value, mmoComment.Text);

  if edtDelivery.Value > 0 then
    AddCashIn(deal_id, 3, edtDelivery.Value, mmoComment.Text);

  if edtDeliveryOut.Value > 0 then
    AddCashIn(deal_id, 4, edtDeliveryOut.Value, mmoComment.Text);
  ModalResult := mrOk;
end;

procedure TfrmEditCash.edtRentalChange(Sender: TObject);
begin
  var LSum := edtRental.Value + edtPledge.Value + edtDelivery.Value +
    edtDeliveryOut.Value;
  edtAmount.Value := LSum;
end;

procedure TfrmEditCash.lblDeliveryClick(Sender: TObject);
begin
  edtDelivery.Text := lblDelivery.Caption;
end;

procedure TfrmEditCash.lblDeliveryOutClick(Sender: TObject);
begin
  edtDeliveryOut.Text := lblDeliveryOut.Caption;
end;

procedure TfrmEditCash.lblPledgeClick(Sender: TObject);
begin
  edtPledge.Text := lblPledge.Caption;
end;

procedure TfrmEditCash.lblRenatalClick(Sender: TObject);
begin
  edtRental.Text := lblRenatal.Caption;
end;

procedure TfrmEditCash.SetTypeOper(const Value: integer);
begin
  FType_oper := Value;

end;

procedure TfrmEditCash.UniFormAfterShow(Sender: TObject);
var
  LOrmCi: TViewOrmControl<Tcash_in>;
  LOrmCo: TViewOrmControl<Tcash_out>;
  Lci: Tcash_in;
  Lco: Tcash_out;
  LDeal: TDeal;
  LdOrm: TViewOrmControl<TDeal>;
  LDocOrm: TViewOrmControl<Tdocument>;
begin
 // UpdateCashItems;
  dtOper.DateTime := now;
  LDeal := LdOrm.GetObjFromId(deal_id);
  var LDoc := LDocOrm.GetObjFromId(LDeal.document_id);
  var LsOrm: TViewOrmControl<Tspec>;
  var LSpec := LsOrm.GetObjFromId(LDoc.spec_id);
  lblRenatal.Caption := LSpec.sum_rental.ToString;
  lblPledge.Caption := LSpec.sum_depos.ToString;
  lblDelivery.Caption := LSpec.sum_delivery.ToString;
  lblDeliveryOut.Caption := LSpec.sum_delivery_out.ToString;
end;

procedure TfrmEditCash.UpdateCashItems;
var
  LOrmCi: TViewOrmControl<Tcash_in_items>;
  LOrmCo: TViewOrmControl<Tcash_out_items>;
  lhi: THelpData<Tcash_in_items>;
  lho: THelpData<Tcash_out_items>;
begin
//  cmbItems.Clear;
//  case Type_oper of
//    0:
//      begin
//        FcoArr := LOrmCo.GetObjArr;
//        lho.AddDataCombox(cmbItems, fcoArr, 'name');
//      end;
//    1:
//      begin
//        FciArr := LOrmCi.GetObjArr;
//        lhi.AddDataCombox(cmbItems, fciArr, 'name');
//      end;
//  end;
end;

end.

