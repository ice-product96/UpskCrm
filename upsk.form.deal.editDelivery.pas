unit upsk.form.deal.editDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniLabel,
  uniDateTimePicker, uniEdit, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  upsk.types, uniButton, upsk.globalMetod;

type
  TfrmEditDelivery = class(TUniForm)
    cmbDriver: TUniComboBox;
    cmbAuto: TUniComboBox;
    edtPrice: TUniNumberEdit;
    dtDelivery: TUniDateTimePicker;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    lbl4: TUniLabel;
    cmbType: TUniComboBox;
    lbl5: TUniLabel;
    btnAccept: TUniButton;
    edtAdress: TUniEdit;
    lbl6: TUniLabel;
    procedure edtPriceChange(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    FDeal_id: integer;
    FPrice: Integer;
    FDriver: TDriverArr;
    FAuto: TAutoArr;
    FTD: Ttype_deliveryArr;
    Ftype_delivery: integer;
    FAdress: string;
    procedure SetPrice(const Value: Integer);
    procedure UpdateDriver;
    procedure UpdateAuto;
    procedure UpdateTypeDelivery;
    procedure LoadDelivery;
    procedure SetAdress(const Value: string);
    { Private declarations }
  public
    { Public declarations }
  published
    property deal_id: integer read FDeal_id write FDeal_id;
    property price: Integer read FPrice write SetPrice;
    property type_delivery: integer read Ftype_delivery write Ftype_delivery;
    property adress: string read FAdress write SetAdress;
  end;

function frmEditDelivery: TfrmEditDelivery;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.viewcontrol;

function frmEditDelivery: TfrmEditDelivery;
begin
  Result := TfrmEditDelivery(UniMainModule.GetFormInstance(TfrmEditDelivery));
end;

{ TfrmEditDelivery }

procedure TfrmEditDelivery.btnAcceptClick(Sender: TObject);
var
  Ld: TViewOrmControl<Tdelivery>;
  del: Tdelivery;
  lha: THelpData<TAuto>;
  lhd: THelpData<TDriver>;
  lht: THelpData<Ttype_delivery>;
begin
  del.deal_id := deal_id;
  del.auto.id := lha.DataFromField(FAuto, 'name', cmbAuto.Text).id;
  del.driver.id := lhd.DataFromField(FDriver, 'fio', cmbDriver.Text).id;
  del.type_delivery.id := lht.DataFromField(FTD, 'name', cmbType.Text).id;
  del.price := round(edtPrice.Value);
  del.date := dtDelivery.DateTime;
  del.adress := edtAdress.Text;
  if Self.Tag = 0 then
  begin
    Ld.Insert(del, true);
  end
  else
  begin
    Ld.Update(del, true);
  end;
  ModalResult := mrok;
end;

procedure TfrmEditDelivery.edtPriceChange(Sender: TObject);
begin
  FPrice := Round(edtPrice.Value);
end;

procedure TfrmEditDelivery.LoadDelivery;
var
  Ld: TViewOrmControl<Tdelivery>;
  del: Tdelivery;
begin
  del := Ld.GetObjFromId(Self.tag);
  if del.auto.id > 0 then
  begin
    cmbAuto.Text := del.auto.name;
  end;
  if del.driver.id > 0 then
  begin
    cmbDriver.Text := del.driver.FIO;
  end;
  edtPrice.Value := del.price;
  cmbType.Text := del.type_delivery.name;
  dtDelivery.DateTime := del.date;
  edtAdress.Text := del.adress;
end;

procedure TfrmEditDelivery.SetAdress(const Value: string);
begin
  FAdress := Value;
  edtAdress.Text := Value;
end;

procedure TfrmEditDelivery.SetPrice(const Value: Integer);
begin
  FPrice := Value;
  edtPrice.Value := Value;
end;

procedure TfrmEditDelivery.UniFormAfterShow(Sender: TObject);
begin
  UpdateDriver;
  UpdateAuto;
  UpdateTypeDelivery;
  dtDelivery.DateTime := now;
  if Self.Tag > 0 then
  begin
    LoadDelivery;
  end;
end;

procedure TfrmEditDelivery.UpdateAuto;
var
  Ld: TViewOrmControl<TAuto>;
  Lhd: THelpData<TAuto>;
begin
  FAuto := Ld.GetObjArr;
  cmbAuto.Clear;
  Lhd.AddDataCombox(cmbAuto, FAuto, 'name');

end;

procedure TfrmEditDelivery.UpdateDriver;
var
  Ld: TViewOrmControl<TDriver>;
  Lhd: THelpData<TDriver>;
begin
  FDriver := Ld.GetObjArr;
  cmbDriver.Clear;
  Lhd.AddDataCombox(cmbDriver, FDriver, 'fio');

end;

procedure TfrmEditDelivery.UpdateTypeDelivery;
var
  Ld: TViewOrmControl<Ttype_delivery>;
  Lhd: THelpData<Ttype_delivery>;
begin
  FTD := Ld.GetObjArr;
  cmbType.Clear;
  Lhd.AddDataCombox(cmbType, FTD, 'name');
  if type_delivery > 0 then
  begin
    cmbType.Text := Lhd.GetDataFromFieldName(FTD, 'id', type_delivery, 'name');
  end;

end;

end.

