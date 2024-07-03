unit upsk.form.documents.editSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniDateTimePicker, uniGUIBaseClasses, uniEdit, upsk.types, upsk.globalMetod,
  unigui.helpers, uniButton, uniPanel, uniLabel, math, upsk.viewcontrol,
  Num2Text;

type
  TfrmEditSpec = class(TUniForm)
    edtNumber: TUniEdit;
    dtDate: TUniDateTimePicker;
    pnlBtn: TUniPanel;
    btnSave: TUniButton;
    btnViewContract: TUniButton;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    procedure btnViewContractClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FSpec: Tspec;
    Fcontract: TContract;
    FSave: Boolean;
    FDeal: TDeal;
    FCalc: Tcalc_lrsp200;
    FPartEntity: Tpart_entity;
    FPartPersone: Tpart_persone;
    FOrg: Torganization;
    procedure SetSpec(const Value: Tspec);
    procedure NewSpec;
    { Private declarations }
  published
    property Spec: Tspec read FSpec write SetSpec;
    property Contract: TContract read Fcontract write FContract;
    property Deal: TDeal read FDeal write Fdeal;

    { Public declarations }
  end;

function frmEditSpec: TfrmEditSpec;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditSpec: TfrmEditSpec;
begin
  Result := TfrmEditSpec(UniMainModule.GetFormInstance(TfrmEditSpec));
end;

{ TUniForm1 }

procedure TfrmEditSpec.btnSaveClick(Sender: TObject);
var
  Lo: TViewOrmControl<Tspec>;
  Lp: TViewOrmControl<Tspec_position>;
  lSpecId: integer;
  i: integer;
begin

  if Self.Tag = 0 then
  begin

    lSpecId := Lo.Insert(FSpec);
    for i := 0 to Spec.Position.Count - 1 do
    begin
      Spec.Position.Items[i].spec_id := lSpecId;
      Lp.Insert(Spec.Position.Items[i]);
    end;

    ModalResult := lSpecId;

  end
  else
  begin
    Lo.Update(FSpec);
    ModalResult := FSpec.id;
  end;
end;

procedure TfrmEditSpec.btnViewContractClick(Sender: TObject);
var
  orm: TViewOrmControl<Tcalc_kef>;
begin
  var Lrep: TReport;
  var LCKArr := orm.GetObjArr('calc_id=' + Deal.calc_id.ToString);
  Lrep.BuildSpec(UniMainModule.frxSpec, UniMainModule.dsSpec, Spec, LCKArr);
end;

procedure TfrmEditSpec.NewSpec;
var
  LS: Tspec;
  i: integer;
begin
  with LS do
  begin
    id := 0;
    date := dtDate.DateTime;
    contract_number := Fcontract.number_contract;
    contract_date := Fcontract.date;
    number := ViewControl.GetLastSpecNumber(Fcontract.number_contract);
    device_name := Deal.calc_type.descript;
    square := FCalc.amount_square;
    rental_period := FCalc.rental_period;
    case fcalc.type_part of
      1:
        begin
          FPartPersone := ViewControl.GetPersone(FCalc.part_id);
          fio_manager := FPartPersone.fioIO;
        end;
      2:
        begin
          FPartEntity := ViewControl.GetEntity(FCalc.part_id);
          fio_manager := FPartEntity.fio_managerIO;
        end;
    end;
    FOrg := ViewControl.GetOrganization(FCalc.organization_id);
    LS.org_fio_manager := forg.fio_managerIO;
    city_name := ViewControl.GetRegion(FCalc.region_id).name;
    sum_depos := FCalc.depos;
    sum_delivery := FCalc.delivery;
    sum_delivery_out := FCalc.delivery_out;
    sum_rental := FCalc.price_amount_period;
    all_amount := FCalc.price_amount_calc;
    LS.price_rental_day := round(FCalc.price_rental_day);
    Spec.Position.Clear;
    var LAmountPack: integer := 0;
    for i := 0 to FCalc.Position.Count - 1 do
    begin
      LAmountPack := LAmountPack + round(FCalc.Position[i].price * (FCalc.Position
        [i].calc_count + FCalc.Position[i].add_calc_count));
    end;
    for i := 0 to FCalc.Position.Count - 1 do
    begin
      if FCalc.Position[i].calc_count + FCalc.Position[i].add_calc_count > 0 then
      begin
        var LSpecPos: Tspec_position;
        LSpecPos.column_num := i + 1;
        LSpecPos.position_id := FCalc.Position[i].position_id;
        var lp: TPosition;
        lp := ViewControl.GetPosition(FCalc.Position[i].position_id);
        LSpecPos.pos_name := lp.name;
        LSpecPos.pos_count := FCalc.Position[i].calc_count + FCalc.Position[i].add_calc_count;
        LSpecPos.pos_price := FCalc.Position[i].price;
        LSpecPos.pos_amount := FCalc.Position[i].price * (FCalc.Position[i].calc_count
          + FCalc.Position[i].add_calc_count);
        var LProcRow := LSpecPos.pos_amount * 100 / LAmountPack;
        var LDayProcRow := FCalc.price_rental_day / 100 * LProcRow;

        LSpecPos.price_rental := SimpleRoundTo(LDayProcRow / LSpecPos.pos_count, -1);
    //  LSpecPos.price_rental := roundto(FCalc.Position[i].price / FCalc.rental_period, -2);
        LSpecPos.price_amount := SimpleRoundTo(LSpecPos.price_rental * LSpecPos.pos_count,
          -1);
        LS.Position.Add(LSpecPos);
      end;

    end;
  end;
  Spec := LS;
end;

procedure TfrmEditSpec.SetSpec(const Value: Tspec);
begin
  FSpec := Value;
  edtNumber.Text := FSpec.number.ToString;
  dtDate.DateTime := FSpec.date;
end;

procedure TfrmEditSpec.UniFormAfterShow(Sender: TObject);
var
  Lo: TViewOrmControl<Tspec>;
begin

  if Self.Tag = 0 then
  begin
    dtDate.DateTime := Now;
    FCalc := ViewControl.GetCalcLsrp200(Deal.calc_id);
    NewSpec;
  end
  else
  begin
    FSpec := Lo.GetObjFromId(Self.Tag);
  end;
end;

end.

