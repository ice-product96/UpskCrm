unit upsk.form.reqclac.lrsp200;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniButton, uniMemo, uniPanel, uniBasicGrid, uniDBGrid,
  uniRadioGroup, uniRadioButton, uniEdit, uniDateTimePicker, uniLabel,
  uniMultiItem, uniComboBox, uniGroupBox, uniStringGrid, Vcl.Menus, uniMainMenu,
  Data.DB, DBAccess, Uni, Datasnap.DBClient, upsk.types, upsk.globalMetod,
  unigui.helpers, upsk.datamanager, upsk.calcmodule, IceOrm.database;

type
  TResultAllSectionSize = record
    Width, heigth: integer;
  end;

type
  TfrmReqCalcLrsp200 = class(TUniForm)
    gridPosition: TUniDBGrid;
    pnlBot: TUniPanel;
    rgPart: TUniRadioGroup;
    cmbPart: TUniComboBox;
    lbl1: TUniLabel;
    dtReq: TUniDateTimePicker;
    edtNumberReq: TUniEdit;
    cmbOrgan: TUniComboBox;
    lbl11: TUniLabel;
    pnlTop: TUniPanel;
    lbl2: TUniLabel;
    lblDtReq: TUniLabel;
    lbl3: TUniLabel;
    edtClientPhone: TUniEdit;
    mmoComment: TUniMemo;
    lbl4: TUniLabel;
    gbSection: TUniGroupBox;
    pnlSection: TUniPanel;
    btnAddSection: TUniButton;
    btnDelSection: TUniButton;
    lbl5: TUniLabel;
    popPosition: TUniPopupMenu;
    miN1: TUniMenuItem;
    miN2: TUniMenuItem;
    btnAddPos: TUniButton;
    btnDelPos: TUniButton;
    clPosition: TClientDataSet;
    dsPosition: TUniDataSource;
    lbl31: TUniLabel;
    edtRentalPeriod: TUniEdit;
    cmbDiscount: TUniComboBox;
    lbl32: TUniLabel;
    gbHelpReq: TUniGroupBox;
    gbCalcResult: TUniGroupBox;
    lbl6: TUniLabel;
    lbl7: TUniLabel;
    lbl8: TUniLabel;
    lbl9: TUniLabel;
    lbl10: TUniLabel;
    lbl12: TUniLabel;
    lblSquare: TUniLabel;
    lblWeigth: TUniLabel;
    lblFlooring: TUniLabel;
    lblShoes: TUniLabel;
    lblCalcOne: TUniLabel;
    lblCalcFlooring: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    lblRent: TUniLabel;
    lblAmountPeriod: TUniLabel;
    lblCollateralValue: TUniLabel;
    lblShiping: TUniLabel;
    lblAmount: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lblPrice: TUniLabel;
    lblProc: TUniLabel;
    cmbPackage: TUniComboBox;
    btnAddBackage: TUniButton;
    lbl13: TUniLabel;
    fldPositionid: TIntegerField;
    fldPositionPositionName: TStringField;
    fltfldPositionremains: TFloatField;
    fltfldPositioncalc_count: TFloatField;
    fltfldPositionadd_count: TFloatField;
    fltfldPositionall_count: TFloatField;
    fltfldPositionprice_unit: TFloatField;
    fltfldPositionamount: TFloatField;
    fldPositionposition_id: TIntegerField;
    lblВ: TUniLabel;
    lblPosAmount: TUniLabel;
    unhdnpnl1: TUniHiddenPanel;
    cmbPosition: TUniComboBox;
    lbl311: TUniLabel;
    cmbRegion: TUniComboBox;
    lbl14: TUniLabel;
    gridSection: TUniDBGrid;
    dsSection: TUniDataSource;
    clSection: TClientDataSet;
    intgrfldSectionnumber: TIntegerField;
    fltfldSectionWidth: TFloatField;
    fltfldSectionHeigth: TFloatField;
    edtDelivary: TUniNumberEdit;
    clSectioninfo: TStringField;
    edtCountFlooring: TUniNumberEdit;
    unlbl11: TUniLabel;
    gbDiscount: TUniGroupBox;
    unlbl2: TUniLabel;
    unlbl3: TUniLabel;
    unlbl4: TUniLabel;
    unlbl5: TUniLabel;
    lblAddPriceOneKv: TUniLabel;
    lblAddRental: TUniLabel;
    lblAddDepos: TUniLabel;
    lblAddFlooring: TUniLabel;
    pnlBtn: TUniPanel;
    btnSave: TUniButton;
    btnSaveAndCreate: TUniButton;
    btnEditOrg: TUniButton;
    btnAddOrg: TUniButton;
    btnEditPart: TUniButton;
    btnAddPart: TUniButton;
    edtAdressObject: TUniEdit;
    lbl33: TUniLabel;
    lbl15: TUniLabel;
    lblDeliveryOut: TUniLabel;
    edtDelivaryOut: TUniNumberEdit;
    lbl3111: TUniLabel;
    clPositionrow_id: TIntegerField;
    lblAddPrecent: TUniLabel;
    lbl16: TUniLabel;
    strngfldSectionAll: TStringField;
    lbl17: TUniLabel;
    edtCountLadder: TUniNumberEdit;
    procedure gridPositionMouseDown(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
    procedure btnAddBackageClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure cmbPackageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAddPosClick(Sender: TObject);
    procedure gridPositionSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure btnDelPosClick(Sender: TObject);
    procedure SetDefaultRegion;
    procedure SetDefaultPart;
    procedure btnAddSectionClick(Sender: TObject);
    procedure UpdateNumberRowSection;
    procedure btnDelSectionClick(Sender: TObject);
    procedure gridSectionSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure SetSectionInfoRow;
    procedure edtRentalPeriodChange(Sender: TObject);
    procedure cmbDiscountChange(Sender: TObject);
    procedure edtDelivaryChange(Sender: TObject);
    procedure edtCountFlooringChange(Sender: TObject);
    procedure SetDataPosGrid(aPos_id: Integer; aFieldName: string; aData: Variant);
    function GetDataPosGrid(aPos_id: Integer; aFieldName: string): Variant;
    procedure lblShoesClick(Sender: TObject);
    procedure lblProcClick(Sender: TObject);
    procedure lblAddPriceOneKvClick(Sender: TObject);
    procedure lblAddRentalClick(Sender: TObject);
    procedure lblAddDeposClick(Sender: TObject);
    procedure lblAddFlooringClick(Sender: TObject);
    procedure lblFlooringClick(Sender: TObject);
    procedure rgPartChangeValue(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSaveAndCreateClick(Sender: TObject);
    procedure rgPartClick(Sender: TObject);
    procedure btnAddOrgClick(Sender: TObject);
    procedure btnEditOrgClick(Sender: TObject);
    procedure btnAddPartClick(Sender: TObject);
    procedure btnEditPartClick(Sender: TObject);
    procedure edtDelivaryOutChange(Sender: TObject);
    procedure UpdateAllCalc(aCalcPos: Boolean = true; aRecalcKef: Boolean = true);
    procedure lbl311Click(Sender: TObject);
    procedure cmbOrganChange(Sender: TObject);
    function LoadProcentColleteral: Integer;
    procedure lblAddPrecentClick(Sender: TObject);
    procedure edtCountLadderChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    FClose: Boolean;
    FcompareCalc: Tcalc_lrsp200;
    FPackage: TpackageArr;
    FuserEdit: Boolean;
    FGridPosition: TPositionArr;
    FRegion: TRegionArr;
    FCalc: TCalc;
    FAllFlooring: integer;
    FKefs: TKefArr;
    FAmountDoc: Double;
    FDiscount: TDiscountArr;
    FPriceOneKv: Double;
    Ftypepart: TType_partArr;
    FType_partId: integer;
    FPriceFlooring: Double;
    FRentDay: integer;
    FPeriodRent: Integer;
    FDelivery: Double;
    FCollateral: Integer;
    FRecomendPriceOneKv: Double;
    FAllPrice: Double;
    FShoes: Integer;
    FPayBack: Integer;
    FManualEditPayback: Boolean;
    FPartPersone: TPartPersoneArr;
    FPartEntity: TPartEntityArr;
    FOrgan: TOrganArr;
    FCalclrsp200: Tcalc_lrsp200;
    FPriceAmountPeriod: double;
    FDeliveryOut: Double;
    FLadderFrame: Integer;
    FAllFrame: Integer;
    FallSquare: Integer;
    FallWeigth: Integer;
    FAllSectionWidth: Integer;
    FAllSectionHeigth: Integer;
    FCalcFlooring: integer;
    FAddPriceFlooring: Double;
    FAddPriceOneKv: Double;
    FOrganization: Torganization;
    FPrecentColleteral: integer;
    FcalcKef: Tcalc_kefarr;
    procedure EditKeyPressPayback(Sender: TObject; var Key: Char);
    procedure EditKeyAddPriceOneKv(Sender: TObject; var Key: Char);
    procedure EditKeyAddPrecent(Sender: TObject; var Key: Char);
    procedure EditKeyAddPriceRental(Sender: TObject; var Key: Char);
    procedure EditKeyAddDepos(Sender: TObject; var Key: Char);
    procedure EditKeyAddFlooring(Sender: TObject; var Key: Char);
    procedure UpdateviewPackage;
    procedure UpdateAmountDoc;
    procedure UpdateGridPosition;
    procedure UpdateViewRegion;
    procedure UpdateViewPart(aPartType: Integer; apartId: integer = 0);
    procedure UpdateViewOrgan(aId: Integer = 0);
    procedure updateViewDisount;
    procedure LoadDefaultPos(aPackageId: Integer);
    procedure AddRowFromName(aName: string);
    procedure UpdateNumPos;
    procedure CalcReq;
    function AmountSquare: Double;
    function AmountWiegth: Double;
    function PriceOneKvM(aRecalcKef: Boolean = true): Double;
    function PriceFlooring: Double;
    function CountFlooring: Double;
    procedure CalcCountPosition;
    procedure SetAmountDoc(const Value: Double);
    procedure CalcInfoAllPrice;
    procedure SetPriceOneKv(const Value: Double);
    procedure SetTypyPart(const Value: integer);
    procedure SetPriceFlooring(const Value: Double);
    procedure SetRentDay(const Value: integer);
    procedure SetPeriodRent(const Value: Integer);
    procedure SetDelivery(const Value: Double);
    procedure SetCollateral(const Value: Integer);
    procedure SetRecomendPriceOneKv(const Value: Double);
    procedure SetAllPrice(const Value: Double);
    procedure SetCountFlooring(const Value: integer);
    procedure SetShoes(const Value: Integer);
    procedure SetPayback(const Value: Integer);
    procedure calcPaybackAndRecomendPrice;
    procedure SaveCalc(aSendBd: Boolean = True);
    procedure SetPriceAmountPeriod(const Value: double);
    procedure SetDeliveryOut(const Value: Double);
    procedure LoadReq(aId: Integer);
    function AllWidthSection: TResultAllSectionSize;
    procedure SetallSquare(const Value: Integer);
    procedure SetallWeigth(const Value: Integer);
    procedure SetCalcFlooring(const Value: integer);
    procedure SetAddPriceFlooring(const Value: Double);
    procedure SetAddPriceOneKv(const Value: Double);
    procedure SetPrecentColleteral(const Value: integer);

    { Private declarations }
  public
    { Public declarations }
    property AmountDoc: Double read FAmountDoc write SetAmountDoc;
    property allSquare: Integer read FallSquare write SetallSquare;
    property allWeigth: Integer read FallWeigth write SetallWeigth;
    property PriceOneKvProp: Double read FPriceOneKv write SetPriceOneKv;
    property AddPriceOneKv: Double read FAddPriceOneKv write SetAddPriceOneKv;
    property Type_partId: integer read FType_partId write SetTypyPart;
    property PriceFlooringProp: Double read FPriceFlooring write SetPriceFlooring;
    property AddPriceFlooring: Double read FAddPriceFlooring write SetAddPriceFlooring;
    property PriceRentDay: Integer read FRentDay write SetRentDay;
    property PeriodRent: Integer read FPeriodRent write SetPeriodRent;
    property Delivery: Double read FDelivery write SetDelivery;
    property Delivery_out: Double read FDeliveryOut write SetDeliveryOut;
    property Collateral: Integer read FCollateral write SetCollateral;
    property RecomendPriceOneKv: Double read FRecomendPriceOneKv write
      SetRecomendPriceOneKv;
    property AllPrice: Double read FAllPrice write SetAllPrice;
    property Flooring: integer read FAllFlooring write SetCountFlooring;
    property CalcFlooring: integer read FCalcFlooring write SetCalcFlooring;
    property Shoes: Integer read FShoes write SetShoes;
    property payback: Integer read FPayBack write SetPayback;
    property PriceAmountPeriod: double read FPriceAmountPeriod write SetPriceAmountPeriod;
    property Frame: Integer read FAllFrame write FAllFrame;
    property LadderFrame: Integer read FLadderFrame write FLadderFrame;
    property AllSectionWidth: Integer read FAllSectionWidth write FAllSectionWidth;
    property AllSectionHeigth: Integer read FAllSectionHeigth write FAllSectionHeigth;
    property Organization: Torganization read FOrganization write FOrganization;
    property PrecentColleteral: integer read FPrecentColleteral write
      SetPrecentColleteral;
  end;

const
  DelW = 3;
  Delh = 2;
  calc_type = 1;

function frmReqCalcLrsp200: TfrmReqCalcLrsp200;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, System.Math, upsk.form.document.editContract,
  System.Rtti, upsk.form.guide.editPartEntity, upsk.form.guide.editPartPersone,
  upsk.form.guide.editOrgan, upsk.form.deal.edit, upsk.viewcontrol;

function frmReqCalcLrsp200: TfrmReqCalcLrsp200;
begin
  Result := TfrmReqCalcLrsp200(UniMainModule.GetFormInstance(TfrmReqCalcLrsp200));
end;

procedure TfrmReqCalcLrsp200.AddRowFromName(aName: string);
var
  P: TPosition;
  hd: THelpData<TPosition>;
begin

  P := ViewControl.GetPosition(hd.GetDataFromFieldName(FGridPosition, 'name',
    aName, 'id'));
  if P.id > 0 then
  begin
    if not (gridPosition.DataSource.DataSet.State in [dsEdit, dsInsert]) then
      gridPosition.DataSource.DataSet.Edit;

    gridPosition.DataSource.DataSet.FieldByName('positionname').AsString := P.name;
    gridPosition.DataSource.DataSet.FieldByName('remains').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('calc_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('add_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('all_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('price_unit').AsFloat := P.Release_Price;
    gridPosition.DataSource.DataSet.FieldByName('amount').asinteger := 0;
  end;
end;

function TfrmReqCalcLrsp200.AllWidthSection: TResultAllSectionSize;
begin
  with gridSection.DataSource.DataSet do
  begin
    first;
    var Lw := 0;
    var Lh := 0;
    while not eof do
    begin
      Lw := Lw + FieldByName('Width').AsInteger;
      Lh := Lh + FieldByName('Heigth').AsInteger;
      next;
    end;
    Result.Width := Lw;
    Result.heigth := Lh;
  end;

end;

function TfrmReqCalcLrsp200.AmountSquare: Double;
var
  I: Integer;
  Lw, Lh: Double;
begin
  Result := 0;
  with gridSection.DataSource.DataSet do
  begin
    first;
    while not eof do
    begin
      Result := Result + (FieldByName('width').AsFloat * FieldByName('heigth').AsFloat);
      next;
    end;
  end;
end;

function TfrmReqCalcLrsp200.AmountWiegth: Double;
var
  hd: THelpData<TPosition>;
begin
  Result := 0;
  with gridPosition.DataSource.DataSet do
  begin
    first;
    while not eof do
    begin
      Result := Result + hd.GetDataFromFieldName(FGridPosition, 'id',
        FieldByName('position_id').asinteger, 'weight') * FieldByName('all_count').asinteger;
      next;
    end;

  end;
end;

procedure TfrmReqCalcLrsp200.btnAddBackageClick(Sender: TObject);
var
  I: Integer;
begin
  if cmbPackage.ItemIndex >= 0 then
  begin
    FPackage[cmbPackage.ItemIndex] := ViewControl.GetPackage(FPackage[cmbPackage.ItemIndex].id);
    gridPosition.DataSource.DataSet.Edit;
    for I := 0 to FPackage[cmbPackage.ItemIndex].packageBuildArr.Count - 1 do
    begin
      gridPosition.DataSource.DataSet.Append;
      gridPosition.DataSource.DataSet.FieldByName('positionname').AsString :=
        FPackage[cmbPackage.ItemIndex].packageBuildArr[I].Position.name;
      gridPosition.DataSource.DataSet.FieldByName('remains').asinteger := 0;
      gridPosition.DataSource.DataSet.FieldByName('calc_count').asinteger := 0;
      gridPosition.DataSource.DataSet.FieldByName('add_count').asinteger := 0;
      gridPosition.DataSource.DataSet.FieldByName('all_count').asinteger := 0;
      gridPosition.DataSource.DataSet.FieldByName('price_unit').AsFloat :=
        FPackage[cmbPackage.ItemIndex].packageBuildArr[I].Position.Release_Price;
      gridPosition.DataSource.DataSet.FieldByName('amount').asinteger := 0;
    end;
    gridPosition.DataSource.DataSet.Post;
  end;

end;

procedure TfrmReqCalcLrsp200.btnAddOrgClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditEntity).SetValue([CP('Organ', true)]);
end;

procedure TfrmReqCalcLrsp200.btnAddPartClick(Sender: TObject);
begin

  case Type_partId of
    1:
      begin
        CreateAndShowModalForm(TfrmEditPart,
          procedure(aRes: integer)
          begin
            UpdateViewPart(Type_partId)
          end);
      end;
    2:
      begin
        CreateAndShowModalForm(TfrmEditEntity,
          procedure(aRes: integer)
          begin
            UpdateViewPart(Type_partId)
          end);
      end;
  end;
end;

procedure TfrmReqCalcLrsp200.btnAddPosClick(Sender: TObject);
begin
  gridPosition.DataSource.DataSet.Edit;
  gridPosition.DataSource.DataSet.Append;
  gridPosition.DataSource.DataSet.Post;
end;

procedure TfrmReqCalcLrsp200.btnAddSectionClick(Sender: TObject);
begin
  gridSection.DataSource.DataSet.Append;
  gridSection.DataSource.DataSet.Post;
  UpdateNumberRowSection;
end;

procedure TfrmReqCalcLrsp200.btnCloseClick(Sender: TObject);
var
  hd: THelpData<Tcalc_lrsp200>;
begin

end;

procedure TfrmReqCalcLrsp200.btnDelPosClick(Sender: TObject);
begin
  with gridPosition.DataSource.DataSet do
  begin

    Delete;

  end;
end;

procedure TfrmReqCalcLrsp200.btnDelSectionClick(Sender: TObject);
begin
  gridSection.DataSource.DataSet.Delete;
  UpdateNumberRowSection;
end;

procedure TfrmReqCalcLrsp200.btnEditOrgClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditOrgan,
    procedure(ares: integer)
    begin
      UpdateViewOrgan(FOrgan[cmbOrgan.ItemIndex].id);
    end).SetTag(FOrgan[cmbOrgan.ItemIndex].id);
end;

procedure TfrmReqCalcLrsp200.btnEditPartClick(Sender: TObject);
begin
  if cmbPart.Text <> '' then
  begin
    case Type_partId of
      1:
        begin
          CreateAndShowModalForm(TfrmEditPart,
            procedure(aRes: integer)
            begin
              UpdateViewPart(FCalclrsp200.type_part);
            end).SetTag(FPartPersone[cmbPart.ItemIndex].id);
        end;
      2:
        begin
          CreateAndShowModalForm(TfrmEditEntity,
            procedure(aRes: integer)
            begin
              UpdateViewPart(FCalclrsp200.type_part);
            end).SetTag(FPartEntity[cmbPart.ItemIndex].id);
        end;
    end;
  end;
end;

procedure TfrmReqCalcLrsp200.btnSaveAndCreateClick(Sender: TObject);
var
  Lc: TContract;
begin
  try
    btnSave.Enabled := false;
    SaveCalc;
//  Lc.part_id := FCalclrsp200.part_id;
//  Lc.organ_id := FCalclrsp200.organization_id;
//  Lc.part_type := FCalclrsp200.type_part;
//  case Lc.part_type of
//    1:
//      begin
//        Lc.part_persone := FPartPersone[cmbPart.ItemIndex];
//      end;
//    2:
//      begin
//        Lc.part_entity := FPartEntity[cmbPart.ItemIndex];
//      end;
//  end;
//  Lc.organ := FOrgan[cmbOrgan.ItemIndex];
//  Lc.number_contract := ViewControl.ContractNumber;
//  CreateAndShowModalForm(TfrmEditContract, nil).SetValue('Contract', Tvalue.From<TContract>(Lc));
    if FCalclrsp200.id <= 0 then
    begin
      ShowMessage('Расчет не сохранен, создать сделку невозможно.');
      exit;
    end;
    CreateAndShowModalForm(TfrmEditDeal, nil).SetValue([CP('Calc_id', Tvalue.FromVariant
      (FCalclrsp200.id)), cp('Calc_type', Tvalue.FromVariant(calc_type))]);
  except
    btnSave.Enabled := True;

  end;
end;

procedure TfrmReqCalcLrsp200.btnSaveClick(Sender: TObject);
begin
  try
    btnSave.Enabled := false;
    SaveCalc;
    FClose := True;
    ModalResult := mrOk;
  except
    btnSave.Enabled := True;

  end;
end;

procedure TfrmReqCalcLrsp200.CalcCountPosition;
var
  Lp: TPosition;
  hd: THelpData<TPosition>;
  LAllWidth, LAllHeigth: Integer;
  I: Integer;
  ltmp: Integer;
  LSection: Integer;
  Lshoes: Integer;
  LLadderCount: integer;
  LRamsCount: integer;
begin
  LAllWidth := 0;
  LAllHeigth := 0;
  LSection := 0;
  Lshoes := 0;
  LLadderCount := 0;
  LRamsCount := 0;
  Lp := hd.DataFromField(FGridPosition, 'id', 5);
  Shoes := 0;
  gridPosition.DataSource.DataSet.first;
  while not gridPosition.DataSource.DataSet.eof do
  begin
    gridPosition.DataSource.DataSet.Edit;
    gridPosition.DataSource.DataSet.FieldByName('calc_count').asinteger := 0;
    gridPosition.DataSource.DataSet.Post;
    gridPosition.DataSource.DataSet.next;
  end;

  gridSection.DataSource.DataSet.first;
  while not gridSection.DataSource.DataSet.eof do
  begin
    LAllWidth := gridSection.DataSource.DataSet.FieldByName('width').asinteger;

    LAllHeigth := gridSection.DataSource.DataSet.FieldByName('heigth').asinteger;

    with gridPosition.DataSource.DataSet do
    begin
      first;

      while not eof do
      begin
        Edit;
        Lp := hd.DataFromField(FGridPosition, 'id', FieldByName('position_id').asinteger);

        case FieldByName('position_id').asinteger of
          5:
            begin
              FieldByName('calc_count').asinteger := Frame;
              LRamsCount := FieldByName('calc_count').asinteger;
            end;
          6:
            begin
              FieldByName('calc_count').asinteger := LadderFrame;
              LLadderCount := FieldByName('calc_count').asinteger;
            end;
          7:
            FieldByName('calc_count').asinteger := Frame;
          8:
            FieldByName('calc_count').asinteger := Frame;

          9:
            begin

            end;

        end;

        FieldByName('all_count').AsFloat := FieldByName('calc_count').AsFloat +
          FieldByName('add_count').AsFloat;
        FieldByName('amount').AsFloat := FieldByName('all_count').AsFloat *
          FieldByName('price_unit').AsFloat;
        var Li := hd.IndexFromField(FGridPosition, 'id', FieldByName('position_id').asinteger);
        FGridPosition.items[Li].Count := FieldByName('calc_count').AsFloat +
          FieldByName('add_count').AsFloat;
        Post;
        next;
      end;

      Shoes := Shoes + Ceil((LAllWidth / DelW) + 1) * 2;
      gridSection.DataSource.DataSet.next;
    end;

  end;
  //Flooring := AllSectionWidth * AllSectionHeigth;
  UpdateAmountDoc;
end;

procedure TfrmReqCalcLrsp200.CalcInfoAllPrice;
var
  LRentDay: Integer;
  LKefPart: Double;
  hd: THelpData<TType_part>;
begin
  LKefPart := hd.GetDataFromFieldName(Ftypepart, 'id', Type_partId, 'kef');
  if LKefPart <= 0 then
    LKefPart := 1;

  PriceRentDay := Ceil((AmountSquare * (PriceOneKvProp + StrToInt(lblAddPriceOneKv.Caption))
    + (PriceFlooringProp * CountFlooring)) * LKefPart + StrToInt(lblAddRental.Caption));

  Collateral := Ceil(((AmountDoc / 100) * 10) + StrToInt(lblAddDepos.Caption));
  AllPrice := (PeriodRent * PriceRentDay) + Collateral + Delivery + Delivery_out;

end;

procedure TfrmReqCalcLrsp200.calcPaybackAndRecomendPrice;
begin
  if not FManualEditPayback then
    payback := ViewControl.GetPayBack(Round(FPeriodRent)).Count;
  if PeriodRent > 0 then
  begin
    RecomendPriceOneKv := ceil((AmountDoc / 100 * payback) / PeriodRent);
  end;

end;

procedure TfrmReqCalcLrsp200.CalcReq;
begin
  lblSquare.Caption := FloatToStr(AmountSquare) + ' кв.м.';
  CalcCountPosition;
  // lblFlooring.Caption := FloatToStr(FAllFlooring) + ' шт.'; //Берется из CalcCountPosition
  lblCalcOne.Caption := FloatToStr(PriceOneKvM + StrToInt(lblAddPriceOneKv.Caption))
    + ' руб./сутки';
  lblWeigth.Caption := FloatToStr(AmountWiegth) + ' кг.';
  PriceFlooringProp := PriceFlooring;

end;

procedure TfrmReqCalcLrsp200.cmbDiscountChange(Sender: TObject);
begin
  CalcInfoAllPrice;
end;

procedure TfrmReqCalcLrsp200.cmbOrganChange(Sender: TObject);
var
  hd: THelpData<Torganization>;
begin
  Organization := hd.DataFromField(FOrgan, 'name', cmbOrgan.Text);
  UpdateAllCalc(false);
end;

procedure TfrmReqCalcLrsp200.cmbPackageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnAddSection.Click;
  end;
end;

function TfrmReqCalcLrsp200.CountFlooring: Double;
var
  hd: THelpData<TPosition>;
begin
  Result := hd.GetDataFromFieldName(FGridPosition, 'id', 9, 'count') / 3;
end;

procedure TfrmReqCalcLrsp200.EditKeyAddDepos(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: integer;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          if TryStrToInt((Sender as TUniEdit).Text, Li) then
          begin
            Lbl.Caption := Li.ToString;
            UpdateAllCalc(false);
          end
          else
          begin
            ShowMessage('Ожидается целое число');
            exit;
          end;
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.EditKeyAddFlooring(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: integer;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          if TryStrToInt((Sender as TUniEdit).Text, Li) then
          begin
           // PriceFlooringProp := PriceFlooringProp - (StrToInt(lblAddFlooring.Caption)) + Li;
            AddPriceFlooring := Li;
            Lbl.Caption := Li.ToString;
            UpdateAllCalc(false);
          end
          else
          begin
            ShowMessage('Ожидается целое число');
            exit;
          end;
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.EditKeyAddPrecent(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: integer;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          (Sender as TUniEdit).Text := StringReplace((Sender as TUniEdit).Text,
            '.', ',', [rfReplaceAll]);
          if TryStrToint((Sender as TUniEdit).Text, Li) then
          begin

            PrecentColleteral := Li;

            UpdateAllCalc(false);
          end
          else
          begin
            ShowMessage('Ожидается целое число');
            exit;
          end;
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.EditKeyAddPriceOneKv(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: Double;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          (Sender as TUniEdit).Text := StringReplace((Sender as TUniEdit).Text,
            '.', ',', [rfReplaceAll]);
          if TryStrTofloat((Sender as TUniEdit).Text, Li) then
          begin

           // PriceOneKvProp := (PriceOneKvProp - StrTofloat(lblAddPriceOneKv.Caption)) + Li;
            AddPriceOneKv := Li;
            Lbl.Caption := Li.ToString;
            UpdateAllCalc(false);
          end
          else
          begin
            ShowMessage('Ожидается число');
            exit;
          end;
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.EditKeyAddPriceRental(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: integer;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          if TryStrToInt((Sender as TUniEdit).Text, Li) then
          begin
           // PriceRentDay := PriceRentDay - (StrToInt(Lbl.Caption)) + Li;
            Lbl.Caption := Li.ToString;
            UpdateAllCalc(false);
          end
          else
          begin
            ShowMessage('Ожидается целое число');
            exit;
          end;
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.EditKeyPressPayback(Sender: TObject; var Key: Char);
var
  Lbl: TUniLabel;
  lblname: string;
  hd: THelpData<TfrmReqCalcLrsp200>;
  Li: integer;
begin
  Lbl := nil;
  if Key = #13 then // Проверяем, нажата ли клавиша Enter
  begin
    if Sender is TUniEdit then
    begin

      lblname := (Sender as TUniEdit).name;
      Delete(lblname, 1, 1);
      Lbl := TUniLabel((Sender as TUniEdit).Owner.FindComponent(lblname));
      if Assigned(Lbl) then
      begin
        if ((Sender as TUniEdit).Text <> '') then
        begin
          if TryStrToInt((Sender as TUniEdit).Text, Li) then
            payback := Li
          else
          begin
            ShowMessage('Ожидается целое число');
            exit;
          end;
          FManualEditPayback := True;
          UpdateAllCalc(false);
        end;
        Lbl.Visible := True;
      end;

      (Sender as TUniEdit).Free;
    end;
  end;

end;

procedure TfrmReqCalcLrsp200.edtCountFlooringChange(Sender: TObject);
var
  hd: THelpData<TPosition>;
  Lcount: real;
begin
  if edtCountFlooring.Value < 0 then
    Lcount := 0
  else
  begin
    Lcount := edtCountFlooring.Value;
  end;

  Flooring := Round(Lcount);
  SetDataPosGrid(9, 'calc_count', Lcount * 3);
  SetDataPosGrid(10, 'calc_count', Lcount * 2);
 // UpdateAllCalc;
end;

procedure TfrmReqCalcLrsp200.edtCountLadderChange(Sender: TObject);
begin

  var LCountLadder: Integer := 0;
  var Lcount: Integer := 0;

  SetDataPosGrid(6, 'add_count', edtCountLadder.Value);
  SetDataPosGrid(5, 'add_count', -edtCountLadder.Value);
end;

procedure TfrmReqCalcLrsp200.edtDelivaryChange(Sender: TObject);
begin
  Delivery := edtDelivary.Value;
  UpdateAllCalc(false);
end;

procedure TfrmReqCalcLrsp200.edtDelivaryOutChange(Sender: TObject);
begin
  Delivery_out := edtDelivaryOut.Value;
  UpdateAllCalc(false);
end;

procedure TfrmReqCalcLrsp200.edtRentalPeriodChange(Sender: TObject);
var
  Lp: Integer;
begin
  if TryStrToInt(edtRentalPeriod.Text, Lp) then
  begin
    PeriodRent := Lp;
    UpdateAllCalc(False);

  end;
end;

function TfrmReqCalcLrsp200.GetDataPosGrid(aPos_id: Integer; aFieldName: string): Variant;
begin
  Result := 0;
  with gridPosition.DataSource.DataSet do
  begin
    first;
    while not Eof do
    begin
      if FieldByName('id').AsInteger = aPos_id then
      begin
        result := FieldByName(aFieldName).AsVariant;
        Exit;
      end;
      next;
    end;
  end;
end;

procedure TfrmReqCalcLrsp200.gridPositionMouseDown(Sender: TObject; Button:
  TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popPosition.Popup(X, Y, gridPosition);
end;

procedure TfrmReqCalcLrsp200.gridPositionSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
var
  Li, lp: integer;
  hd: THelpData<TPosition>;
  Lbook: TBookmark;
begin
  if not (gridPosition.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    gridPosition.DataSource.DataSet.Edit;
  lp := gridPosition.DataSource.DataSet.FieldByName('position_id').asinteger;
  Li := hd.IndexFromField(FGridPosition, 'id', lp);
  Lbook := gridPosition.DataSource.DataSet.Bookmark;
  with gridPosition.DataSource.DataSet do
  begin

    if AField.FieldName = 'calc_count' then
    begin
      FieldByName(AField.FieldName).AsVariant := Value;

    end
    else if AField.FieldName = 'add_count' then
    begin
      FieldByName(AField.FieldName).AsVariant := Value;
    end
    else if AField.FieldName = 'price_unit' then
    begin
      FieldByName(AField.FieldName).AsVariant := Value;

      if Li >= 0 then
      begin
        FGridPosition.items[Li].Release_Price := FieldByName('price_unit').AsFloat;
      end;
    end
    else if AField.FieldName = 'PositionName' then
    begin
      AddRowFromName(Value);
    end;

    FieldByName('all_count').AsFloat := FieldByName('calc_count').AsFloat +
      FieldByName('add_count').AsFloat;
    FieldByName('amount').AsFloat := FieldByName('all_count').AsFloat *
      FieldByName('price_unit').AsFloat;
    FGridPosition.items[Li].Count := FieldByName('calc_count').AsFloat +
      FieldByName('add_count').AsFloat;
    Post;
  end;
  UpdateAmountDoc;
  UpdateAllCalc(False);
  gridPosition.DataSource.DataSet.Bookmark := Lbook
 // CalcInfoAllPrice;
end;

procedure TfrmReqCalcLrsp200.gridSectionSetCellValue(Sender: TObject; ACol, ARow:
  Integer; AField: TField; var Value: Variant);
var
  I: Integer;
begin

  if not TryStrToInt(Value, I) then
  begin
    ShowMessage('Ожидается целое число');
    exit;
  end;
  if not (gridSection.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    gridSection.DataSource.DataSet.Edit;
  if AField.FieldName = 'Width' then
  begin
    if I mod DelW > 0 then
    begin
      ShowMessage('Необходимо ввести число кратное 3 метром, рекомендуем ' +
        inttostr(ClosestMultipleOfThree(I, DelW)));
      exit;
    end;

    gridSection.DataSource.DataSet.FieldByName('width').AsVariant := Value;
    if gridSection.DataSource.DataSet.FieldByName('heigth').asinteger > 0 then
    begin
      //UpdateAllCalc;

    end;
  end
  else if AField.FieldName = 'Heigth' then
  begin
    if I mod Delh > 0 then
    begin
      ShowMessage('Необходимо ввести число кратное 2 метром, рекомендуем ' +
        inttostr(ClosestMultipleOfThree(I, Delh)));
      exit;
    end;
    gridSection.DataSource.DataSet.FieldByName('heigth').AsVariant := Value;
    if gridSection.DataSource.DataSet.FieldByName('width').asinteger > 0 then
    begin
    //  UpdateAllCalc;

    end;
  end;
  SetSectionInfoRow;
  if (gridSection.DataSource.DataSet.FieldByName('width').asinteger > 0) and (gridSection.DataSource.DataSet.FieldByName
    ('heigth').asinteger > 0) then
  begin
    CalcCountPosition;
    UpdateAmountDoc;
    UpdateAllCalc(false);

  end;
  // gridSection.DataSource.DataSet.Post;

end;

procedure TfrmReqCalcLrsp200.lbl311Click(Sender: TObject);
begin
  edtDelivaryOut.Value := edtDelivary.Value;
  Delivery_out := edtDelivaryOut.Value;
  UpdateAllCalc(false);
end;

procedure TfrmReqCalcLrsp200.lblAddDeposClick(Sender: TObject);
begin
  LblEditAsInteger(Sender, EditKeyAddDepos);
end;

procedure TfrmReqCalcLrsp200.lblAddFlooringClick(Sender: TObject);
begin
  LblEditAsInteger(Sender, EditKeyAddFlooring);
end;

procedure TfrmReqCalcLrsp200.lblAddPrecentClick(Sender: TObject);
begin

  LblEditAsInteger(Sender, EditKeyAddPrecent);
end;

procedure TfrmReqCalcLrsp200.lblAddPriceOneKvClick(Sender: TObject);
begin
  LblEditAsInteger(Sender, EditKeyAddPriceOneKv);
end;

procedure TfrmReqCalcLrsp200.lblAddRentalClick(Sender: TObject);
begin
  LblEditAsInteger(Sender, EditKeyAddPriceRental);
end;

procedure TfrmReqCalcLrsp200.lblFlooringClick(Sender: TObject);
begin
  edtCountFlooring.Value := CalcFlooring;

  var Lcount := edtCountFlooring.Value;

  Flooring := Round(Lcount);

  SetDataPosGrid(9, 'calc_count', Lcount * 3);
  SetDataPosGrid(10, 'calc_count', Lcount * 2);
end;

procedure TfrmReqCalcLrsp200.lblProcClick(Sender: TObject);
begin
  LblEditAsInteger(Sender, EditKeyPressPayback);
end;

procedure TfrmReqCalcLrsp200.lblShoesClick(Sender: TObject);
begin
  SetDataPosGrid(12, 'add_count', Shoes);

end;

procedure TfrmReqCalcLrsp200.LoadDefaultPos(aPackageId: Integer);
var
  I: Integer;
  Lp: Tpackage;
  Lr: TRemains_position;
begin

  Lp := ViewControl.GetPackage(aPackageId);
  gridPosition.DataSource.DataSet.Edit;
  for I := 0 to Lp.packageBuildArr.Count - 1 do
  begin
    gridPosition.DataSource.DataSet.Append;
    gridPosition.DataSource.DataSet.FieldByName('positionname').AsString := Lp.packageBuildArr
      [I].Position.name;
    gridPosition.DataSource.DataSet.FieldByName('calc_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('add_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('all_count').asinteger := 0;
    gridPosition.DataSource.DataSet.FieldByName('price_unit').AsFloat := Lp.packageBuildArr
      [I].Position.Release_Price;
    gridPosition.DataSource.DataSet.FieldByName('amount').asinteger := 0;
    Lr := ViewControl.GetRemainsPosition(Lp.packageBuildArr[I].Position.id,
      FRegion[cmbRegion.ItemIndex].sklad_id);
    gridPosition.DataSource.DataSet.FieldByName('remains').AsFloat := Lr.Count;
    gridPosition.DataSource.DataSet.FieldByName('position_id').AsFloat := Lp.packageBuildArr
      [I].Position.id;
  end;
  gridPosition.DataSource.DataSet.Post;
  UpdateNumPos;
end;

function TfrmReqCalcLrsp200.LoadProcentColleteral: Integer;
var
  ormPrec: TViewOrmControl<TSettings>;
  LSet: TSettings;
begin
  Result := 0;
  LSet := ormPrec.GetObjFromId(1);
  Result := LSet.value.ToInteger;
end;

procedure TfrmReqCalcLrsp200.LoadReq(aId: Integer);
var
  Lor: TViewOrmControl<Tcalc_lrsp200>;
  LorS: TViewOrmControl<Tcalc_lrsp200_section>;
  LorP: TViewOrmControl<Tcalc_lrsp200_position>;
  LorO: TViewOrmControl<Torganization>;
  LorE: TViewOrmControl<Tpart_entity>;
  LorPP: TViewOrmControl<Tpart_persone>;
  Lc: Tcalc_lrsp200;
  Lcount: Variant;
  LOrg: Torganization;
  LEntr: Tpart_entity;
  LPers: Tpart_persone;
  i: integer;
begin
  Lc := Lor.GetObjFromId(self.tag);
  Lc.Section := LorS.GetObjArr('calc_lrsp200_id=' + Self.Tag.ToString);
  Lc.Position := LorP.GetObjArr('calc_lrsp200_id=' + Self.Tag.ToString);
  rgPart.ItemIndex := Lc.type_part - 1;
  LOrg := LorO.GetObjFromId(Lc.organization_id);
  Organization := LOrg;
  cmbOrgan.Text := LOrg.name;
  Type_partId := Lc.type_part;
  case Lc.type_part of
    1:
      begin
        LPers := LorPP.GetObjFromId(Lc.part_id);
        cmbPart.Text := LPers.fio;
      end;
    2:
      begin
        LEntr := LorE.GetObjFromId(Lc.part_id);
        cmbPart.Text := LEntr.name;
      end;

  end;

  for i := 0 to Lc.Section.Count - 1 do
  begin
    gridSection.DataSource.DataSet.Append;
    gridSection.DataSource.DataSet.FieldByName('width').AsInteger := Lc.Section[i].width;
    gridSection.DataSource.DataSet.FieldByName('heigth').AsInteger := Lc.Section[i].hegth;
    gridSection.DataSource.DataSet.Post;
    SetSectionInfoRow;
  end;
  UpdateNumberRowSection;

  with gridPosition.DataSource.DataSet do
  begin
    for i := 0 to Lc.Position.Count - 1 do
    begin
      first;
      while not Eof do
      begin
        if FieldByName('position_id').AsInteger = Lc.Position[i].position_id then
        begin
          Lcount := Lc.Position[i].calc_count;
          gridPositionSetCellValue(Self, 0, 0, FieldByName('calc_count'), Lcount);
          Lcount := Lc.Position[i].add_calc_count;
          gridPositionSetCellValue(Self, 0, 0, FieldByName('add_count'), Lcount);
          Lcount := Lc.Position[i].price;
          gridPositionSetCellValue(Self, 0, 0, FieldByName('price_unit'), Lcount);
          Lcount := Lc.Position[i].id;
          gridPositionSetCellValue(Self, 0, 0, FieldByName('row_id'), Lcount);
//          edit;
//          FieldByName('calc_count').asinteger := Lc.Position[I].calc_count;
//          FieldByName('add_count').asinteger := Lc.Position[I].calc_count;
        end;
        Next;
      end;
    end;
  end;

  //cmbOrgan.Text:=lc.
  PrecentColleteral := Lc.precent_colleteral;
  edtClientPhone.Text := Lc.phone;
  edtAdressObject.Text := Lc.adress_object;
  mmoComment.Text := Lc.comment;
  edtRentalPeriod.Text := Lc.rental_period.ToString;
  edtDelivary.Text := Lc.delivery.ToString;
  edtDelivaryOut.Text := Lc.delivery_out.ToString;
  edtCountFlooring.Text := Lc.count_flooring.ToString;
  lblAddPriceOneKv.Caption := Lc.add_OneKv.ToString;
  lblAddRental.Caption := Lc.add_rental.ToString;
  lblAddDepos.Caption := Lc.add_depos.ToString;
  lblAddFlooring.Caption := Lc.add_flooring.ToString;
  dtReq.DateTime := Lc.datatime;
  self.PeriodRent := Lc.rental_period;
  self.Delivery := Lc.Delivery;
  Self.Delivery_out := Lc.delivery_out;
  Self.Flooring := Lc.count_flooring;
  payback := Lc.payback;
  Collateral := Round(Lc.depos);
  AllPrice := Lc.price_amount_calc;
  PriceAmountPeriod := Lc.price_amount_period;
  edtCountLadder.Value := Lc.add_count_ladder;

  PriceRentDay := round(Lc.price_rental_day);
  UpdateAllCalc(False);
  edtCountFlooringChange(edtCountFlooring);
  edtCountLadderChange(edtCountLadder);
  FcompareCalc := Lc;
end;

function TfrmReqCalcLrsp200.PriceFlooring: Double;
var
  I: Integer;
begin

  for I := 0 to FKefs.Count - 1 do
  begin
    if (FKefs[I].package_id = 3) and (CompareValueEx(PeriodRent, FKefs[I].day,
      FKefs[I].oper_day)) then
    begin
      Result := FKefs[I].Value;

      exit;
    end;

  end;

end;

function TfrmReqCalcLrsp200.PriceOneKvM(aRecalcKef: Boolean = true): Double;
var
  Ls: Double;
  Lday: Integer;
  I: Integer;
  Ladd: Double;
  Lck: Tcalc_kef;
  LLastDay: integer;
begin
  Ls := AmountSquare;
  if aRecalcKef then
  begin
    FcalcKef.Clear;
  end;
  for I := 0 to FKefs.Count - 1 do
  begin
    if (FKefs[I].package_id = 1) and (CompareValueEx(Ls, FKefs[I].Count, FKefs[I].oper_count))
      and (CompareValueEx(PeriodRent, FKefs[I].day, FKefs[I].oper_day)) then
    begin
      Result := FKefs[I].Value;
      LLastDay := PeriodRent - 2;
      if aRecalcKef then
      begin
        Lck.day := FKefs[i].day;
        LLastDay := Lck.day - 2;
        Lck.price := FKefs[i].Value;
        FcalcKef.Add(Lck);
        for var j := I - 1 downto 0 do
        begin
          if (FKefs[j].package_id = 1) and (CompareValueEx(Ls, FKefs[j].Count,
            '>=')) and (CompareValueEx(LLastDay, FKefs[j].day, '>')) then
          begin
            begin
              Lck.day := FKefs[j].day;
              LLastDay := Lck.day - 2;
              Lck.price := FKefs[j].Value;
              FcalcKef.Add(Lck);
              if FcalcKef.Count = 3 then
                exit;
            end;
          end;
        end;
      end;
      exit;
    end;

  end;

end;

procedure TfrmReqCalcLrsp200.rgPartChangeValue(Sender: TObject);
begin
  UpdateViewPart(rgPart.ItemIndex + 1);

end;

procedure TfrmReqCalcLrsp200.rgPartClick(Sender: TObject);
begin
  Type_partId := rgPart.ItemIndex + 1;
 // CalcInfoAllPrice;
  UpdateAllCalc(false);
end;

procedure TfrmReqCalcLrsp200.SaveCalc(aSendBd: Boolean = True);
var
  LC: Tcalc_lrsp200;
  hdR: THelpData<TRegion>;
  hdO: THelpData<Torganization>;
  hdP: THelpData<Tpart_persone>;
  hdPE: THelpData<Tpart_entity>;
  Ls: Tcalc_lrsp200_section;
  LsArr: Tcalc_lrsp200_sectionArr;
  Lp: Tcalc_lrsp200_position;
  LpArr: Tcalc_lrsp200_positionArr;
  tmp, Lper: integer;
  LckArr: Tcalc_kefArr;
  ormCK: IceOrm.database.TViewOrmControl<Tcalc_kef>;
begin
  LsArr.Clear;
  LC.id := Self.Tag;
  LC.datatime := dtReq.DateTime;
  LC.type_part := Type_partId;
  LC.amount_square := round(AmountSquare);
  LC.adress_object := edtAdressObject.Text;
  LC.delivery_out := edtDelivaryOut.Value;
  LC.add_count_ladder := Round(edtCountLadder.Value);
  LC.region_id := hdR.GetDataFromFieldName(FRegion, 'name', cmbRegion.Text, 'id');
  case LC.type_part of
    1:
      begin
        LC.part_id := hdP.GetDataFromFieldName(FPartPersone, 'fio', cmbPart.Text, 'id');
      end;
    2:
      begin
        LC.part_id := hdPE.GetDataFromFieldName(FPartEntity, 'name', cmbPart.Text, 'id');
      end;
  end;
  LC.organization_id := hdO.GetDataFromFieldName(FOrgan, 'name', cmbOrgan.Text, 'id');
  gridSection.DataSource.DataSet.First;
  while not gridSection.DataSource.DataSet.Eof do
  begin
    Ls.width := gridSection.DataSource.DataSet.FieldByName('width').AsInteger;
    Ls.hegth := gridSection.DataSource.DataSet.FieldByName('heigth').AsInteger;
    LsArr.Add(Ls);
    gridSection.DataSource.DataSet.Next;
  end;
  LC.Section.SetItems(LsArr.Items);
  LpArr.Clear;
  gridPosition.DataSource.DataSet.First;
  while not gridPosition.DataSource.DataSet.Eof do
  begin
    Lp.id := gridPosition.DataSource.DataSet.FieldByName('row_id').AsInteger;
    Lp.position_id := gridPosition.DataSource.DataSet.FieldByName('position_id').AsInteger;
    Lp.calc_count := gridPosition.DataSource.DataSet.FieldByName('calc_count').AsInteger;
    Lp.add_calc_count := gridPosition.DataSource.DataSet.FieldByName('add_count').AsInteger;
    Lp.price := gridPosition.DataSource.DataSet.FieldByName('price_unit').AsInteger;
    LpArr.Add(Lp);
    gridPosition.DataSource.DataSet.Next;

  end;
  LC.Position.SetItems(LpArr.Items);
  LC.phone := edtClientPhone.Text;
  LC.comment := mmoComment.Text;
  LC.rental_period := self.PeriodRent;
  LC.Delivery := self.Delivery;
  LC.count_flooring := round(edtCountFlooring.Value);
  LC.payback := payback;
  LC.depos := Collateral;
  LC.price_amount_calc := AllPrice;
  LC.price_amount_period := PriceAmountPeriod;
  LC.price_rental_day := PriceRentDay;
  LC.precent_colleteral := PrecentColleteral;
  tmp := 0;
  if not TryStrToInt(lblAddPriceOneKv.Caption, tmp) then
  begin

  end;
  LC.add_OneKv := tmp;

  tmp := 0;
  if not TryStrToInt(lblAddRental.Caption, tmp) then
  begin

  end;
  LC.add_rental := tmp;

  tmp := 0;
  if not TryStrToInt(lblAddDepos.Caption, tmp) then
  begin

  end;
  LC.add_depos := tmp;

  tmp := 0;
  if not TryStrToInt(lblAddFlooring.Caption, tmp) then
  begin

  end;
  LC.add_flooring := tmp;
  if aSendBd then
  begin
    if LC.id = 0 then
    begin
      LC.id := ViewControl.CreateCalcLspr200(LC);
    end
    else
    begin
      ViewControl.UpdateCalcLspr200(LC);
    end;
  end;
  LckArr := ormCK.GetObjArr('calc_id=' + LC.id.ToString);
  for var j := 0 to LckArr.Count - 1 do
    ormCK.DeleteFromId(LckArr[j].id);
  LckArr.Clear;
  for var j := 0 to FcalcKef.Count - 1 do
  begin
    edtRentalPeriod.Text := FcalcKef[j].day.ToString;
    if TryStrToInt(edtRentalPeriod.Text, Lper) then
    begin
      PeriodRent := Lper;
      UpdateAllCalc(False, false);

    end;
    FcalcKef.items[j].amount := PriceRentDay;
    FcalcKef.Items[j].calc_id := LC.id;
  end;
  ormCK.InsertArr(FcalcKef);
  FCalclrsp200 := LC;

end;

procedure TfrmReqCalcLrsp200.SetAddPriceFlooring(const Value: Double);
begin
  FAddPriceFlooring := Value;
end;

procedure TfrmReqCalcLrsp200.SetAddPriceOneKv(const Value: Double);
begin
  FAddPriceOneKv := Value;
end;

procedure TfrmReqCalcLrsp200.SetAllPrice(const Value: Double);
begin
  FAllPrice := Value;
  lblAmount.Caption := FloatToStr(Value) + ' руб';
end;

procedure TfrmReqCalcLrsp200.SetallSquare(const Value: Integer);
begin
  FallSquare := Value;
  lblSquare.Caption := IntToStr(FallSquare) + ' кв.м.';
end;

procedure TfrmReqCalcLrsp200.SetallWeigth(const Value: Integer);
begin
  FallWeigth := Value;
  lblWeigth.Caption := IntToStr(FallWeigth) + ' кг.';
end;

procedure TfrmReqCalcLrsp200.SetAmountDoc(const Value: Double);
begin
  FAmountDoc := Value;
  lblPosAmount.Caption := FloatToStr(FAmountDoc);
end;

procedure TfrmReqCalcLrsp200.SetCalcFlooring(const Value: integer);
begin
  FCalcFlooring := Value;
  lblFlooring.Caption := FloatToStr(Value) + ' шт.';
end;

procedure TfrmReqCalcLrsp200.SetCollateral(const Value: integer);
begin
  FCollateral := round(Value div 100 * 100);

  lblCollateralValue.Caption := round(Value div 100 * 100).ToString + ' руб';
end;

procedure TfrmReqCalcLrsp200.SetCountFlooring(const Value: integer);
begin
  FAllFlooring := Value;

end;

procedure TfrmReqCalcLrsp200.SetDataPosGrid(aPos_id: Integer; aFieldName: string;
  aData: Variant);
begin
  with gridPosition.DataSource.DataSet do
  begin
    first;
    while not eof do
    begin
      if FieldByName('position_id').asinteger = aPos_id then
      begin
        if not (gridPosition.DataSource.DataSet.State in [dsEdit, dsInsert]) then
          gridPosition.DataSource.DataSet.Edit;
        FieldByName(aFieldName).AsVariant := aData;
        Post;
        gridPositionSetCellValue(gridPosition, FieldByName(aFieldName).Index,
          RecNo, FieldByName(aFieldName), aData);
        exit;
      end;
      next;
    end;
  end;
end;

procedure TfrmReqCalcLrsp200.SetDefaultPart;
begin
  rgPart.ItemIndex := 0;
  Type_partId := 1;
end;

procedure TfrmReqCalcLrsp200.SetDefaultRegion;
var
  hd: THelpData<TRegion>;
begin
  cmbRegion.Text := hd.GetDataFromFieldName(FRegion, 'id', datamanager.User.region_id,
    'name');
end;

procedure TfrmReqCalcLrsp200.SetDelivery(const Value: Double);
begin
  FDelivery := Value;
  lblShiping.Caption := FloatToStr(Value) + ' руб';
end;

procedure TfrmReqCalcLrsp200.SetDeliveryOut(const Value: Double);
begin
  FDeliveryOut := Value;
  lblDeliveryOut.Caption := FloatToStr(Value) + ' руб';
end;

procedure TfrmReqCalcLrsp200.SetPayback(const Value: Integer);
begin
  FPayBack := Value;
  lblProc.Caption := inttostr(Value);
end;

procedure TfrmReqCalcLrsp200.SetPeriodRent(const Value: Integer);
begin
  FPeriodRent := Value;
 // CalcInfoAllPrice;
end;

procedure TfrmReqCalcLrsp200.SetPrecentColleteral(const Value: integer);
begin
  FPrecentColleteral := Value;
  lblAddPrecent.Caption := FPrecentColleteral.ToString;
end;

procedure TfrmReqCalcLrsp200.SetPriceAmountPeriod(const Value: double);
begin
  FPriceAmountPeriod := Value;
  lblAmountPeriod.Caption := Value.ToString + ' руб';
end;

procedure TfrmReqCalcLrsp200.SetPriceFlooring(const Value: Double);
begin
  FPriceFlooring := Value;
  lblCalcFlooring.Caption := FloatToStr(Value) + ' руб/сутки';
end;

procedure TfrmReqCalcLrsp200.SetPriceOneKv(const Value: Double);
begin
  FPriceOneKv := Value;
  lblCalcOne.Caption := FloatToStr(Value) + ' руб/сутки';
end;

procedure TfrmReqCalcLrsp200.SetRecomendPriceOneKv(const Value: Double);
begin
  FRecomendPriceOneKv := Value;
  lblPrice.Caption := FloatToStr(Value) + ' руб/сутки';
end;

procedure TfrmReqCalcLrsp200.SetRentDay(const Value: integer);
begin
  FRentDay := Value div 10 * 10;
  lblRent.Caption := FloatToStr(FRentDay) + ' руб/сутки';
 // PriceAmountPeriod := round((FPeriodRent * PriceRentDay));
end;

procedure TfrmReqCalcLrsp200.SetSectionInfoRow;
var
  Lw, Lh: integer;
  Ld, Lv: Double;
begin
  Frame := 0;
  LadderFrame := 0;
  Lw := 0;
  Lh := 0;
  Flooring := 0;
  if (gridSection.DataSource.DataSet.FieldByName('width').asinteger > 0) and (gridSection.DataSource.DataSet.FieldByName
    ('heigth').asinteger > 0) then
  begin
    Ld := gridSection.DataSource.DataSet.FieldByName('width').asinteger / DelW;
    Lv := gridSection.DataSource.DataSet.FieldByName('Heigth').asinteger / Delh;
    if not (gridSection.DataSource.DataSet.State in [dsEdit, dsInsert]) then
      gridSection.DataSource.DataSet.Edit;
    gridSection.DataSource.DataSet.FieldByName('info').AsString := 'Д-' +
      FloatToStr(Ld) + 'шт. В-' + FloatToStr(Lv) + 'шт. ';
    gridSection.DataSource.DataSet.FieldByName('all').AsString := floattostr(Ld
      * Lv) + 'шт.';

    gridSection.DataSource.DataSet.Post;
    with gridSection.DataSource.DataSet do
    begin
      first;
      while not eof do
      begin
        Lw := Lw + round(gridSection.DataSource.DataSet.FieldByName('width').asinteger
          / DelW);
        Lh := Lh + Round(gridSection.DataSource.DataSet.FieldByName('Heigth').asinteger
          / Delh);
        Flooring := Round(Flooring + ((gridSection.DataSource.DataSet.FieldByName
          ('width').asinteger / Delw) * (gridSection.DataSource.DataSet.FieldByName
          ('Heigth').asinteger / Delh)));
        CalcFlooring := Flooring;
        Frame := frame + Round((gridSection.DataSource.DataSet.FieldByName('width').asinteger
          / DelW) * (gridSection.DataSource.DataSet.FieldByName('Heigth').asinteger
          / Delh));
        LadderFrame := LadderFrame + round(gridSection.DataSource.DataSet.FieldByName
          ('Heigth').asinteger / Delh);
        Next;
      end;
    end;

  end;
  AllSectionWidth := Lw;
  AllSectionHeigth := Lh;
end;

procedure TfrmReqCalcLrsp200.SetShoes(const Value: Integer);
begin
  FShoes := Value;
  lblShoes.Caption := inttostr(Value) + 'шт.';

end;

procedure TfrmReqCalcLrsp200.SetTypyPart(const Value: integer);
begin
  FType_partId := Value;

end;

procedure TfrmReqCalcLrsp200.UniFormAfterShow(Sender: TObject);
begin
  // UpdateviewPackage;
  dtReq.DateTime := Now;
  FManualEditPayback := False;
  FKefs := ViewControl.GetKefs;
  PrecentColleteral := LoadProcentColleteral;
  Ftypepart := ViewControl.GetTypeParts;

  UpdateViewOrgan;
  UpdateViewRegion;
  SetDefaultRegion;
  SetDefaultPart;
  LoadDefaultPos(1);
  FuserEdit := false;
  UpdateGridPosition;
  updateViewDisount;

  if Self.Tag > 0 then
    LoadReq(self.Tag);
end;

procedure TfrmReqCalcLrsp200.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FClose then
  begin

    Action := TCloseAction.caNone;
    MessageDlg('Сохранить изменения если они были?', mtWarning, [mbyes, mbNo, mbCancel],
      procedure(Sender: TComponent; Res: Integer)
      begin
        if mrYes = Res then
        begin
          btnSave.OnClick(Self);
          FClose := True;
          close;

        end
        else if mrno = Res then
        begin
          FClose := True;
          Close;
        end
        else
          exit;

      end);

  end
  else
  begin

  end;
end;

procedure TfrmReqCalcLrsp200.UpdateAllCalc(aCalcPos: Boolean = true; aRecalcKef:
  Boolean = true);
var
  LSquaer: Double;
  LPriceOne: Double;
  LKefPart: Double;
  hd: THelpData<TType_part>;
  LKefRam: Double;
  LDay: integer;
begin
  if aCalcPos then
    CalcCountPosition;

  UpdateAmountDoc;
  LKefPart := hd.GetDataFromFieldName(Ftypepart, 'id', Type_partId, 'kef');
  if LKefPart <= 0 then
    LKefPart := 1;

  if Frame <= LadderFrame then
    LKefRam := 1.7
  else
    LKefRam := 1;

  PriceOneKvProp := PriceOneKvM(aRecalcKef) + AddPriceOneKv;

  PriceFlooringProp := PriceFlooring + FAddPriceFlooring;
  LSquaer := AmountSquare;
  allSquare := Round(LSquaer);
  allWeigth := Round(AmountWiegth);
  LPriceOne := (PriceOneKvProp * LSquaer * LKefPart * LKefRam) + StrToInt(lblAddRental.Caption)
    + (PriceFlooringProp * CountFlooring);
  if Organization.nds > 0 then
  begin
    LPriceOne := round((Organization.nds / 100) * LPriceOne + LPriceOne);
  end;
  LPriceOne := SimpleRoundTo(Round(LPriceOne), 1);

  calcPaybackAndRecomendPrice;
  PriceRentDay := round(LPriceOne);

  if TryStrToInt(edtRentalPeriod.Text, LDay) then
    PriceAmountPeriod := LPriceOne * LDay;
  Collateral := Ceil(((AmountDoc / 100) * PrecentColleteral) + StrToInt(lblAddDepos.Caption));
  AllPrice := PriceAmountPeriod + Delivery + Delivery_out + Collateral;

end;

procedure TfrmReqCalcLrsp200.UpdateAmountDoc;
var
  LAmount: Double;
begin
  LAmount := 0;
  with gridPosition.DataSource.DataSet do
  begin

    first;
    while not eof do
    begin
      LAmount := LAmount + FieldByName('amount').AsFloat;
      next;
    end;
  end;

  AmountDoc := LAmount;
end;

procedure TfrmReqCalcLrsp200.UpdateGridPosition;
var
  hd: THelpData<TPosition>;
begin
  FGridPosition := ViewControl.GetPositionArr;
  hd.AddDataCombox(cmbPosition, FGridPosition, 'name');
end;

procedure TfrmReqCalcLrsp200.UpdateNumberRowSection;
var
  I: Integer;
begin
  I := 1;
  with gridSection.DataSource.DataSet do
  begin
    first;
    while not eof do
    begin
      if not (gridSection.DataSource.DataSet.State in [dsEdit, dsInsert]) then
        gridSection.DataSource.DataSet.Edit;
      FieldByName('number').asinteger := I;
      Post;
      inc(I);
      next;
    end;

  end;
end;

procedure TfrmReqCalcLrsp200.UpdateNumPos;
begin
  with gridPosition.DataSource.DataSet do
  begin

    first;
    while not eof do
    begin
      Edit;
      FieldByName('id').asinteger := RecNo;
      Post;
      next;
    end;

  end;
end;

procedure TfrmReqCalcLrsp200.updateViewDisount;
var
  hd: THelpData<TDiscount>;
begin
  FDiscount := ViewControl.GetDiscounts;
  hd.AddDataCombox(cmbDiscount, FDiscount, 'name');
end;

procedure TfrmReqCalcLrsp200.UpdateViewOrgan(aId: Integer = 0);
var
  hd: THelpData<Torganization>;
begin
  FOrgan.Clear;
  FOrgan := ViewControl.GetOrganizations;
  hd.AddDataCombox(cmbOrgan, FOrgan, 'name');
  if aId <> 0 then
  begin
    cmbOrgan.Text := hd.GetNameFromId(aId, FOrgan);
  end;
end;

procedure TfrmReqCalcLrsp200.UpdateviewPackage;
var
  hd: THelpData<Tpackage>;
begin
  FPackage := ViewControl.GetPackageArr;
  hd.AddDataCombox(cmbPackage, FPackage, 'name');
end;

procedure TfrmReqCalcLrsp200.UpdateViewPart(aPartType: Integer; apartId: integer = 0);
var
  hdP: THelpData<Tpart_persone>;
  hdE: THelpData<Tpart_entity>;
begin
  case aPartType of
    1:
      begin
        FPartPersone := ViewControl.GetPersones;
        hdP.AddDataCombox(cmbPart, FPartPersone, 'fio');
      end;
    2:
      begin
        FPartEntity := ViewControl.GetEntitys;
        hdE.AddDataCombox(cmbPart, FPartEntity, 'name');
      end;

  end;

end;

procedure TfrmReqCalcLrsp200.UpdateViewRegion;
var
  hd: THelpData<TRegion>;
begin
  FRegion := ViewControl.GetRegions;
  hd.AddDataCombox(cmbRegion, FRegion, 'name');
end;

end.

