unit upsk.form.document.editorder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniCheckBox,
  uniGUIBaseClasses, uniGroupBox, upsk.types, uniButton, uniLabel, uniEdit,
  upsk.globalMetod;

type
  TfrmOrder = class(TUniForm)
    btnSave: TUniButton;
    chkDelivery: TUniCheckBox;
    chkDepos: TUniCheckBox;
    chkRental: TUniCheckBox;
    lbl: TUniLabel;
    edtCountPeriod: TUniNumberEdit;
    chkDeliveryOut: TUniCheckBox;
    procedure edtCountPeriodChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    FOrder: Torder;
    Fdocument_id: integer;
    FCountPeriod: integer;
    FPrice: Integer;
    FDepos: Integer;
    FDelivery_out: Integer;
    FDelivery: integer;
    procedure SetPeriod(const Value: Integer);

    { Private declarations }
  public
    { Public declarations }
  published
    property Order: TOrder read FOrder write FOrder;
    property document_id: integer read Fdocument_id write Fdocument_id;
    property Count_period: Integer read FCountPeriod write SetPeriod;
    property Rental_Price: Integer read FPrice write Fprice;
    property Depos: Integer read FDepos write FDepos;
    property Delivery: integer read FDelivery write Fdelivery;
    property Delivery_out: Integer read FDelivery_out write FDelivery_out;
  end;

function frmOrder: TfrmOrder;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.viewcontrol;

function frmOrder: TfrmOrder;
begin
  Result := TfrmOrder(UniMainModule.GetFormInstance(TfrmOrder));
end;

{ TfrmOrder }

procedure TfrmOrder.btnSaveClick(Sender: TObject);
var
  LPos: TOrder_pos;
  LpArr: Torder_posArr;
  pos: integer;
  Ldoc: Tdocument;
begin
  LpArr.clear;
  var rep: TReport;
  pos := 0;
  var Lo: TViewOrmControl<TOrder>;
  FOrder.document_id := document_id;
  var LorderId := Lo.Insert(Order);
  Forder.id := LorderId;
  var Ld: TViewOrmControl<Tdocument>;
  Ldoc := Ld.GetObjFromId(document_id);
  var lc: TViewOrmControl<TContract>;
  lc.GetPart(Ldoc.contract.part_type, Ldoc.contract.part_id, Ldoc.contract);
  Ldoc.contract.organization := ViewControl.GetOrganization(Ldoc.contract.organization_id);
  if chkRental.Checked then
  begin
    FOrder.chk_rental := 1;
    inc(pos);
    LPos.order_id := LorderId;
    LPos.Pos_number := pos;
    LPos.pos_name := 'Оплата по договору №' + Ldoc.contract.number_contract + ' от ' + DatetoStr(Ldoc.contract.date);
    LPos.pos_count := FCountPeriod;
    LPos.pos_unity := 'сутки';
    LPos.pos_price := Rental_Price;
    LpArr.Add(LPos);
  end;
  if chkDepos.Checked then
  begin
    FOrder.chk_depos := 1;
    inc(pos);
    LPos.order_id := LorderId;
    LPos.Pos_number := pos;
    LPos.pos_name := 'Залоговая стоимость оборудования';
    LPos.pos_count := 1;
    LPos.pos_unity := 'шт';
    LPos.pos_price := depos;
    LpArr.Add(LPos);
  end;
  if chkDelivery.Checked then
  begin
    if Delivery > 0 then
    begin
      FOrder.chk_delivery := 1;
      inc(pos);
      LPos.order_id := LorderId;
      LPos.Pos_number := pos;
      LPos.pos_name := 'Доставка';
      LPos.pos_count := 1;
      LPos.pos_unity := 'шт';
      LPos.pos_price := Delivery;

      LpArr.Add(LPos);
    end;
  end;

  if chkDeliveryOut.Checked then
  begin
    if Delivery_out > 0 then
    begin
      inc(pos);
      FOrder.chk_delivery_out := 1;
      LPos.order_id := LorderId;
      LPos.Pos_number := pos;
      LPos.pos_name := 'Вывоз';
      LPos.pos_count := 1;
      LPos.pos_unity := 'шт';
      LPos.pos_price := Delivery_out;
      LpArr.Add(LPos);
    end;

  end;
  Order.order_pos.SetItems(LpArr.Items);
  Lo.Update(Order);
  var LoP: TViewOrmControl<TOrder_pos>;
  LoP.InsertArr(Order.order_pos);
  rep.BuildOrder(UniMainModule.frxOrder, UniMainModule.frxdsOrder, order, Ldoc.contract)
end;

procedure TfrmOrder.edtCountPeriodChange(Sender: TObject);
begin
  FCountPeriod := Round(edtCountPeriod.Value);
end;

procedure TfrmOrder.SetPeriod(const Value: Integer);
begin
  FCountPeriod := Value;
  edtCountPeriod.Value := Value;
end;

procedure TfrmOrder.UniFormAfterShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
    FOrder.date := Now;
    FOrder.create_datetime := Now;
    FOrder.count_period := Count_period;

  end;
end;

end.

