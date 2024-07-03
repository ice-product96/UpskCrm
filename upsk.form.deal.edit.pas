unit upsk.form.deal.edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniLabel, uniDateTimePicker, uniEdit, uniGroupBox,
  uniCheckBox, uniButton, Vcl.Menus, uniMainMenu, upsk.types, upsk.viewcontrol,
  upsk.globalMetod, unigui.helpers, uniGUIDialogs, System.DateUtils, System.Math;

type
  TfrmEditDeal = class(TUniForm)
    lbl1: TUniLabel;
    dtDateDeal: TUniDateTimePicker;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    edtContract: TUniEdit;
    edtSpec: TUniEdit;
    lbl31: TUniLabel;
    edtAdress: TUniEdit;
    lbl32: TUniLabel;
    edtReqCalcType: TUniEdit;
    dtRentalStart: TUniDateTimePicker;
    lbl11: TUniLabel;
    dtRentalStop: TUniDateTimePicker;
    lbl12: TUniLabel;
    gbChk: TUniGroupBox;
    chkPay: TUniCheckBox;
    chkCopyContract: TUniCheckBox;
    chkOrigContract: TUniCheckBox;
    chkDevice: TUniCheckBox;
    chkUpd: TUniCheckBox;
    chkOrigUpd: TUniCheckBox;
    chkPayDeposit: TUniCheckBox;
    btnSaveDeal: TUniButton;
    btnMenu: TUniButton;
    popMenu: TUniPopupMenu;
    unmntmN3: TUniMenuItem;
    unmntmN1: TUniMenuItem;
    unmntmN2: TUniMenuItem;
    unmntmN4: TUniMenuItem;
    N1: TUniMenuItem;
    unmntmN6: TUniMenuItem;
    unmntmN7: TUniMenuItem;
    unmntmN8: TUniMenuItem;
    unmntmN9: TUniMenuItem;
    unmntmN10: TUniMenuItem;
    unmntmN11: TUniMenuItem;
    unmntmN12: TUniMenuItem;
    unmntmN13: TUniMenuItem;
    edtAkt: TUniEdit;
    lbl33: TUniLabel;
    edtAktBack: TUniEdit;
    lbl331: TUniLabel;
    unmntmN14: TUniMenuItem;
    unmntmN15: TUniMenuItem;
    unmntmN16: TUniMenuItem;
    unmntmN17: TUniMenuItem;
    unmntmN18: TUniMenuItem;
    unmntmN19: TUniMenuItem;
    unmntmN20: TUniMenuItem;
    unmntmN21: TUniMenuItem;
    unmntmN22: TUniMenuItem;
    btnGetDoc: TUniButton;
    unmntmN5: TUniMenuItem;
    unmntmN23: TUniMenuItem;
    btnDocumets: TUniButton;
    gbSklad: TUniGroupBox;
    btnArrivalPos: TUniButton;
    btnExpensePos: TUniButton;
    lblAmount: TUniLabel;
    lblAmountIn: TUniLabel;
    btnArrival: TUniButton;
    btnExpense: TUniButton;
    lblAmount1: TUniLabel;
    lblAmountDeal: TUniLabel;
    lbld2: TUniLabel;
    lblPayDay: TUniLabel;
    btnEndDeal: TUniButton;
    procedure btnMenuClick(Sender: TObject);
    procedure unmntmN3Click(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure unmntmN22Click(Sender: TObject);
    procedure btnSaveDealClick(Sender: TObject);
    procedure unmntmN2Click(Sender: TObject);
    procedure edtAdressChange(Sender: TObject);
    procedure dtRentalStartChange(Sender: TObject);
    procedure dtRentalStopChange(Sender: TObject);
    procedure unmntmN4Click(Sender: TObject);
    procedure unmntmN7Click(Sender: TObject);
    procedure unmntmN11Click(Sender: TObject);
    procedure unmntmN9Click(Sender: TObject);
    procedure unmntmN13Click(Sender: TObject);
    procedure btnGetDocClick(Sender: TObject);
    procedure btnDocumetsClick(Sender: TObject);
    procedure unmntmN23Click(Sender: TObject);
    procedure btnExpensePosClick(Sender: TObject);
    procedure btnArrivalPosClick(Sender: TObject);
    procedure unmntmN15Click(Sender: TObject);
    procedure unmntmN19Click(Sender: TObject);
    procedure btnArrivalClick(Sender: TObject);
    procedure btnEndDealClick(Sender: TObject);
  private
    FCalcId: Integer;
    FCalcType: integer;
    FCalcLrsp200: Tcalc_lrsp200;
    FOrgan: Torganization;
   // FContract: TContract;
    FPartEntity: Tpart_entity;
    FPartPersone: Tpart_persone;
    FContractId: integer;
    FPartId, FPartType: integer;
    FSpec: Tspec;
    Fdel: TDeal;
    FCountPeriod: Integer;
    FAmountIn: Double;
    procedure SetCalcId(const Value: Integer);
    procedure SetCalcType(const Value: integer);
    { Private declarations }
    procedure LoadNewDeal;
    procedure SetContractId(const Value: integer);
    function NewContract: TContract;
    procedure OpenEditContract(aContr: TContract);
    function CalcTypeName(aCalcTypeId: integer): string;
    procedure SetSpec(const Value: Tspec);
    procedure UpdateDeal;
    procedure LoadDeal(aId: Integer);
    procedure SetAmountIn(const Value: Double);
    procedure UpdateAmountIn;
    procedure UpdateAmountdeal;
    procedure BuildAktOut;
  public
    { Public declarations }

 //   property ContractId: integer read FContractId write SetContractId;
  published
    property Calc_id: Integer read FCalcId write SetCalcId;
    property Calc_type: integer read FCalcType write SetCalcType;
    property Spec: Tspec read FSpec write SetSpec;
    property AmountIn: Double read FAmountIn write SetAmountIn;
  end;

function frmEditDeal: TfrmEditDeal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.document.editContract, System.Rtti,
  upsk.form.documents.editSpec, upsk.form.documents,
  upsk.form.document.editorder, upsk.form.deal.editDelivery,
  upsk.form.deal.edtSkladpas, upsk.datamanager, upsk.form.deal.editCash, IceOrm;

function frmEditDeal: TfrmEditDeal;
begin
  Result := TfrmEditDeal(UniMainModule.GetFormInstance(TfrmEditDeal));
end;

procedure TfrmEditDeal.btnArrivalClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditCash,
    procedure(ares: Integer)
    begin
      UpdateAmountIn;
    end).SetValue([cp('deal_id', fdel.id), cp('Type_oper', 0)]);
end;

procedure TfrmEditDeal.btnArrivalPosClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditPosSklad).SetValue([cp('Spec_id', Fdel.document.Spec.id),
    cp('Deal_id', Fdel.id), cp('Region_id', fdel.region_id), cp('Type_edit', 2)]);
end;

procedure TfrmEditDeal.btnDocumetsClick(Sender: TObject);
var
  lv: TViewOrmControl<Tspec>;
begin
  CreateAndShowModalForm(TfrmDocuments).SetValue([CP('part_id', FPartId)]);

end;

procedure TfrmEditDeal.btnEndDealClick(Sender: TObject);
begin
  if self.Tag > 0 then
  begin
    Fdel.end_deal := 1;
    Fdel.stop_rental_date := dtRentalStop.DateTime;
    ViewControl.UpdateDeal(Fdel);
  end;
end;

procedure TfrmEditDeal.btnExpensePosClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditPosSklad,
    procedure(res: Integer)
    begin
      if res = 1 then
      begin
        LoadDeal(Self.Tag);
      end;
    end).SetValue([cp('Spec_id', Fdel.document.Spec.id), cp('Deal_id', Fdel.id),
      cp('Region_id', fdel.region_id), cp('Type_edit', 1)]);
end;

procedure TfrmEditDeal.btnGetDocClick(Sender: TObject);
begin
  if Fdel.id <= 0 then
  begin
    ShowMessage('Для начала необходимо сохранить сделку.');
    exit;
  end;
  if Fdel.document.Spec.id <= 0 then
  begin
    ShowMessage('Спецификация не создана.');
    exit;
  end;
  if Fdel.document.akt_Out.id <= 0 then
  begin
    ShowMessage('Акт приема-передачи не создан.');
    exit;
  end;
  if Fdel.document.contract.id <= 0 then
  begin
    ShowMessage('Договор не найден.');
    exit;
  end;
  var rep: TReport;
  var orm: TViewOrmControl<Tcalc_kef>;
  var LCKArr := orm.GetObjArr('calc_id=' + Fdel.calc_id.ToString);
  var hd: THelpData<TContract>;

  hd.BuildReport(UniMainModule.frxDoc, Fdel.document.contract, false);

  rep.BuildSpec(UniMainModule.frxSpec, UniMainModule.dsSpec, Fdel.document.Spec,
    LCKArr, false);
  rep.BuildAktOut(UniMainModule.frxAktOut, UniMainModule.dsAktOut, Fdel.document, false);
  //rep.BuildAktIn(UniMainModule.frxAktIn, UniMainModule.frxdsAktIn, Fdel.document, false);
  PrepareAndShowArr([UniMainModule.frxDoc, UniMainModule.frxSpec, UniMainModule.frxAktOut],
    UniMainModule.frxExpPdf);

end;

procedure TfrmEditDeal.btnMenuClick(Sender: TObject);
begin
  popMenu.Popup(btnMenu.Left, btnMenu.Top);
end;

procedure TfrmEditDeal.btnSaveDealClick(Sender: TObject);
var
  Ld: TViewOrmControl<Tdocument>;
begin
  Fdel.id := Self.Tag;
  Fdel.date := dtDateDeal.DateTime;
  Fdel.calc_id := FCalcId;
  Fdel.calc_type_id := FCalcType;
  Fdel.adress := edtAdress.Text;
  Fdel.start_rental_date := dtRentalStart.DateTime;
  Fdel.stop_rental_date := dtRentalStop.DateTime;
  Fdel.chk_pay := chkPay.Checked.ToInteger;
  Fdel.chk_copy_contract := chkCopyContract.Checked.ToInteger;
  Fdel.chk_orig_contract := chkOrigContract.Checked.ToInteger;
  Fdel.chk_device := chkDevice.Checked.ToInteger;
  Fdel.chk_orig_upd := chkOrigUpd.Checked.ToInteger;
  Fdel.chk_copy_upd := chkUpd.Checked.ToInteger;
  Fdel.chk_pay_deposit := chkPayDeposit.Checked.ToInteger;
  if Self.Tag = 0 then
  begin
    Fdel.document_id := Ld.Insert(Fdel.document, true);
    ViewControl.InsertDeal(Fdel);

    if FCalcType = 1 then
    begin
//      if FCalcLrsp200.delivery > 0 then
//      begin
//        if MessageDlg('В сделке присутствует сумма доставки, оформить доставку?', TMsgDlgType.mtWarning, [mbYes, mbNo]) = mryes then
//        begin
//          CreateAndShowModalForm(TfrmEditDelivery,
//            procedure(aRes: integer)
//            begin
//              if FCalcLrsp200.delivery_out > 0 then
//              begin
//                if MessageDlg('В сделке присутствует сумма  вывоза, оформить вывоз?', TMsgDlgType.mtWarning, [mbYes, mbNo]) = mryes then
//                begin
//                  CreateAndShowModalForm(TfrmEditDelivery).SetValue([cp('deal_id', fdel.id), cp('price', FCalcLrsp200.delivery_out), cp('type_delivery', 2), cp('adress', Fdel.adress)]);
//                end;
//              end;
//            end).SetValue([cp('deal_id', fdel.id), cp('price', FCalcLrsp200.delivery), cp('type_delivery', 1), cp('adress', Fdel.adress)]);
//        end;
//      end
//      else if FCalcLrsp200.delivery_out > 0 then
//      begin
//        if MessageDlg('В сделке присутствует сумма  вывоза, оформить вывоз?', TMsgDlgType.mtWarning, [mbYes, mbNo]) = mryes then
//        begin
//          CreateAndShowModalForm(TfrmEditDelivery).SetValue([cp('deal_id', fdel.id), cp('price', FCalcLrsp200.delivery_out), cp('type_delivery', 2)]);
//        end;
//      end;
    end;
  end
  else
  begin
    ViewControl.UpdateDeal(Fdel);
  end;

  ModalResult := mrOk;
end;

procedure TfrmEditDeal.BuildAktOut;
var
  la: TViewOrmControl<Takt_out>;
begin
  var AktNumber := ViewControl.GetLastAtkOutNumber(Fdel.document.Spec.id);
  var LAkt: Takt_out;

  LAkt.number := AktNumber;
  LAkt.create_datetime := now;
  LAkt.User_id := DataManager.User.id;
  LAkt.spec_id := Fdel.document.Spec.id;
  LAkt.id := la.Insert(LAkt);
  Fdel.document.akt_Out := LAkt;

//  var Lrep: TReport;
//  Lrep.BuildAktOut(UniMainModule.frxAktOut, UniMainModule.dsAktOut, Fdel.document);
end;

function TfrmEditDeal.CalcTypeName(aCalcTypeId: integer): string;
begin
  var Lc := ViewControl.GetCalcType(aCalcTypeId);
  Result := Lc.name;
end;

procedure TfrmEditDeal.dtRentalStartChange(Sender: TObject);
begin
  Fdel.start_rental_date := dtRentalStart.DateTime;
  dtRentalStop.DateTime := incday(dtRentalStart.DateTime, FCalcLrsp200.rental_period);
end;

procedure TfrmEditDeal.dtRentalStopChange(Sender: TObject);
begin
  Fdel.stop_rental_date := dtRentalStop.DateTime;
end;

procedure TfrmEditDeal.edtAdressChange(Sender: TObject);
begin
  Fdel.adress := edtContract.Text;
end;

procedure TfrmEditDeal.LoadDeal(aId: Integer);
var
  Lo: TViewOrmControl<Tspec>;
  Ld: TViewOrmControl<TDocument>;
  la: TViewOrmControl<Takt_out>;
begin

  begin
    Fdel := ViewControl.GetDeal(aId);
    Self.Caption := 'Сделака №' + Fdel.id.ToString;
    Fdel.document := Ld.GetObjFromId(Fdel.document_id);
    Fdel.document.Spec := Lo.GetObjFromId(Fdel.document.Spec.id);
    Fdel.document.Spec.Position := ViewControl.GetSpectPosition(Fdel.document.Spec.id);
//     Fdel.document.akt_Out :=la.GetObjFromId();
    Calc_type := Fdel.calc_type_id;
    FCalcId := Fdel.calc_id;
    FCalcType := Fdel.calc_type_id;
    Self.Tag := Fdel.id;
   //  Spec:=Lo.GetObjFromId(Fdel.s)
    dtDateDeal.DateTime := Fdel.date;
    edtSpec.Text := Fdel.document.spec.number.ToString;
    edtContract.Text := Fdel.document.contract.number_contract;
    edtAdress.Text := Fdel.adress;
    dtRentalStart.DateTime := Fdel.start_rental_date;
    dtRentalStop.DateTime := Fdel.stop_rental_date;
    chkPay.Checked := Fdel.chk_pay.ToBoolean;
    chkCopyContract.Checked := Fdel.chk_copy_contract.ToBoolean;
    chkOrigContract.Checked := Fdel.chk_orig_contract.ToBoolean;
    chkDevice.Checked := Fdel.chk_device.ToBoolean;
    chkOrigUpd.Checked := Fdel.chk_orig_upd.ToBoolean;
    chkUpd.Checked := Fdel.chk_copy_upd.ToBoolean;
    chkPayDeposit.Checked := Fdel.chk_pay_deposit.ToBoolean;
    edtAkt.Text := Fdel.document.akt_Out.number.ToString;
    UpdateAmountdeal;
    UpdateAmountIn;
  end;

end;

procedure TfrmEditDeal.LoadNewDeal;
begin

  if Fdel.document.contract.id = 0 then
  begin
    if MessageDlg('Договор с контрагентом не найден. Создать?', TMsgDlgType.mtWarning,
      [mbYes, mbNo]) = mryes then
    begin
      Fdel.document.contract := NewContract;

    end;

  end
  else
  begin
    edtContract.Text := Fdel.document.contract.number_contract;
  end;

end;

function TfrmEditDeal.NewContract: TContract;
var
  Lc: TContract;
  hdp: THelpData<Tpart_persone>;
  hde: THelpData<Tpart_entity>;
  f: TUniForm;
begin
  Result.id := 0;
  Lc.part_id := FCalclrsp200.part_id;
  Lc.organization_id := FCalclrsp200.organization_id;
  Lc.part_type := FCalclrsp200.type_part;
  case Lc.part_type of
    1:
      begin
        Lc.part_persone := FPartPersone;
      end;
    2:
      begin
        Lc.part_entity := FPartEntity;
      end;
  end;
  Lc.organization := FOrgan;
  Lc.number_contract := ViewControl.ContractNumber;
  OpenEditContract(Lc);

end;

procedure TfrmEditDeal.OpenEditContract(aContr: TContract);
begin
  CreateAndShowModalForm(TfrmEditContract,
    procedure(aRes: integer)
    begin
      Fdel.document.contract := ViewControl.GetContract(aRes);
      edtContract.Text := Fdel.document.contract.number_contract;
    end).SetValue([cp('Contract', Tvalue.From<TContract>(aContr))]);
end;

procedure TfrmEditDeal.SetAmountIn(const Value: Double);
begin
  FAmountIn := Value;
  lblAmountIn.Caption := Value.ToString + ' руб.';
end;

procedure TfrmEditDeal.SetCalcId(const Value: Integer);
begin
  FCalcId := Value;
end;

procedure TfrmEditDeal.SetCalcType(const Value: integer);
begin
  FCalcType := Value;
  edtReqCalcType.Text := CalcTypeName(Value);
end;

procedure TfrmEditDeal.SetContractId(const Value: integer);
begin
  FContractId := Value;
end;

procedure TfrmEditDeal.SetSpec(const Value: Tspec);
begin
  FSpec := Value;
  edtSpec.Text := FSpec.number.ToString;
  Fdel.document.Spec := Value;
  edtAkt.Text := Fdel.document.akt_Out.number.ToString;
  UpdateDeal;
  UniFormAfterShow(self);
end;

procedure TfrmEditDeal.UniFormAfterShow(Sender: TObject);
var
  Lo: TViewOrmControl<Tspec>;
  Ld: TViewOrmControl<TDocument>;
  la: TViewOrmControl<Takt_out>;
begin
  if Self.Tag > 0 then
  begin
    LoadDeal(self.Tag);
  end;

  case Calc_type of
    1:
      begin
        FCalcLrsp200 := ViewControl.GetCalcLsrp200(Calc_id);
        FPartId := FCalcLrsp200.part_id;
        FPartType := FCalcLrsp200.type_part;
        if Self.Tag = 0 then
        begin
          Fdel.adress := FCalcLrsp200.adress_object;
          edtAdress.Text := Fdel.adress;
          Fdel.region_id := FCalcLrsp200.region_id;
        end;
      end;
  end;

  case FPartType of
    1:
      begin
        FPartPersone := ViewControl.GetPersone(FPartId);
        Fdel.document.contract.part_persone := FPartPersone;
      end;
    2:
      begin
        FPartEntity := ViewControl.GetEntity(FPartId);
        Fdel.document.contract.part_entity := FPartEntity;
      end;
  end;

  Fdel.document.contract := ViewControl.GetContractForPart(fPartId, fPartType);
  if Fdel.document.contract.id > 0 then
  begin
    edtContract.Text := Fdel.document.contract.number_contract;

  end;
  FOrgan := ViewControl.GetOrganization(FCalcLrsp200.organization_id);
  Fdel.document.contract.organization := FOrgan;
  if Self.Tag = 0 then
  begin
    LoadNewDeal;
  end;
end;

procedure TfrmEditDeal.unmntmN11Click(Sender: TObject);
var
  la: TViewOrmControl<Takt_in>;
begin
  if Fdel.document.spec.id = 0 then
  begin
    ShowMessage('Для начала необходимо создать спецификацию.');
    exit;

  end;

  var AktNumber := ViewControl.GetLastAtkInNumber(Fdel.document.Spec.id);
  var LAkt: Takt_in;
  LAkt.number := AktNumber;
  LAkt.create_datetime := now;
  LAkt.User_id := DataManager.User.id;
  LAkt.spec_id := Fdel.document.Spec.id;
  LAkt.id := la.Insert(LAkt);
  Fdel.document.akt_in := LAkt;
  var Lrep: TReport;

  Lrep.BuildAktIn(UniMainModule.frxAktIn, UniMainModule.frxdsAktIn, Fdel.document);
end;

procedure TfrmEditDeal.unmntmN13Click(Sender: TObject);
begin
  if Fdel.document.spec.id = 0 then
  begin
    ShowMessage('Для начала необходимо создать спецификацию.');
    exit;

  end;
  var Lrep: TReport;

  Lrep.BuildAktIn(UniMainModule.frxAktIn, UniMainModule.frxdsAktIn, Fdel.document);
end;

procedure TfrmEditDeal.unmntmN15Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditCash,
    procedure(ares: Integer)
    begin

    end).SetValue([cp('deal_id', fdel.id), cp('Type_oper', 0)]);
end;

procedure TfrmEditDeal.unmntmN19Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditCash,
    procedure(ares: Integer)
    begin
      UpdateAmountIn;
    end).SetValue([cp('deal_id', fdel.id), cp('Type_oper', 1)]);
end;

procedure TfrmEditDeal.unmntmN22Click(Sender: TObject);
begin

  if MessageDlg('Вы уверены что хотите создать новый договор?', TMsgDlgType.mtWarning,
    [mbYes, mbNo]) = mryes then
  begin
    Fdel.document.contract := NewContract;

  end;

end;

procedure TfrmEditDeal.unmntmN23Click(Sender: TObject);
var
  RentalPrice, rentalPeriod: Double;
begin
  case Calc_type of
    1:
      begin
        RentalPrice := FCalcLrsp200.price_rental_day;
        rentalPeriod := FCalcLrsp200.rental_period;
      end;
  end;
  CreateAndShowModalForm(TfrmOrder).SetValue([CP('document_id', Fdel.document.id),
    cp('Count_period', rentalPeriod), cp('Rental_Price', RentalPrice), cp('depos',
    FCalcLrsp200.depos)]);
end;

procedure TfrmEditDeal.unmntmN2Click(Sender: TObject);
begin
  if Fdel.document.spec.id > 0 then
  begin
    if MessageDlg('Вы уверены что хотите создать новую спецификацию?',
      TMsgDlgType.mtWarning, [mbYes, mbNo]) = mrNo then
    begin
      exit;
    end;
  end;
  CreateAndShowModalForm(TfrmEditSpec,
    procedure(aRes: integer)
    begin
      if aRes > 0 then
      begin
        var Lv: TViewOrmControl<Tspec>;
        BuildAktOut;
        Spec := Lv.GetObjFromId(aRes);

      end;
    end).SetValue([CP('Contract', Tvalue.From<TContract>(Fdel.document.contract)),
      cp('Deal', Tvalue.From<TDeal>(fdel))]);
end;

procedure TfrmEditDeal.unmntmN3Click(Sender: TObject);
var
  hd: THelpData<TContract>;
begin
  if Fdel.document.contract.id <= 0 then
  begin
    ShowMessage('Договор не найден.');
    exit;
  end;
 /// CreateAndShowModalForm(TfrmEditContract).SetTag(ContractId);
  try
    hd.BuildReport(UniMainModule.frxDoc, Fdel.document.contract);
  except
    on e: exception do
      ShowMessage(e.Message)

  end;

end;

procedure TfrmEditDeal.unmntmN4Click(Sender: TObject);
begin
  if Fdel.document.spec.id = 0 then
  begin
    ShowMessage('Спецификация не найдена.');
    exit;

  end;
//  CreateAndShowModalForm(TfrmEditSpec,
//    procedure(aRes: integer)
//    begin
//      if aRes > 0 then
//      begin
//        var Lv: TViewOrmControl<Tspec>;
//        Spec := Lv.GetObjFromId(aRes);
//      end;
//    end).SetValue([CP('Contract', Tvalue.From<TContract>(FContract)), cp('Deal', Tvalue.From<TDeal>(fdel))]).SetTag(Fdel.document.spec.id);

  var rep: TReport;
  var orm: TViewOrmControl<Tcalc_kef>;
  var LCKArr := orm.GetObjArr('calc_id=' + Fdel.calc_id.ToString);
  rep.BuildSpec(UniMainModule.frxSpec, UniMainModule.dsSpec, Fdel.document.Spec,
    LCKArr, true);
end;

procedure TfrmEditDeal.unmntmN7Click(Sender: TObject);
begin
  if Fdel.document.spec.id = 0 then
  begin
    ShowMessage('Для начала необходимо создать спецификацию.');
    exit;

  end;

  BuildAktOut;
end;

procedure TfrmEditDeal.unmntmN9Click(Sender: TObject);
begin
  if Fdel.document.spec.id = 0 then
  begin
    ShowMessage('Для начала необходимо создать спецификацию.');
    exit;

  end;
  var Lrep: TReport;

  Lrep.BuildAktOut(UniMainModule.frxAktOut, UniMainModule.dsAktOut, Fdel.document);
end;

procedure TfrmEditDeal.UpdateAmountdeal;
begin
  var LSum := Fdel.document.Spec.sum_rental + Fdel.document.Spec.sum_depos +
    Fdel.document.Spec.sum_delivery + Fdel.document.Spec.sum_delivery_out;
  lblAmountDeal.Caption := LSum.ToString + ' руб.';
end;

procedure TfrmEditDeal.UpdateAmountIn;
var
  LOrmI: TViewOrmControl<Tcash_in>;
  Li, LiRent: Tcash_inArr;
begin
  Li := LOrmI.GetObjArr('deal_id=' + Fdel.id.ToString);
  AmountIn := Li.SumField('amount');
  LiRent := LOrmI.GetObjArr('deal_id=' + Fdel.id.ToString + ' and cash_in_items_id=2');
  var PaySumRent := LiRent.SumField('amount');
  var LrenPay := Floor(PaySumRent / Fdel.document.Spec.price_rental_day);
  lblPayDay.Caption := LrenPay.ToString + ' из ' + Fdel.document.Spec.rental_period.ToString;
end;

procedure TfrmEditDeal.UpdateDeal;
var
  Lo: TViewOrmControl<TDeal>;
  Ld: TViewOrmControl<TDocument>;
begin
  Lo.Update(Fdel);

  Ld.Update(Fdel.document, true);
end;

end.

