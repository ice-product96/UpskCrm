unit upsk.form.deal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniBasicGrid,
  uniDBGrid, uniGUIBaseClasses, uniPanel, uniSplitter, uniMultiItem, uniComboBox,
  uniLabel, uniRadioGroup, uniGroupBox, Vcl.Menus, uniMainMenu, upsk.globalMetod,
  upsk.types, Data.DB, DBAccess, Uni, MemDS, unigui.helpers, uniScrollBox,
  upsk.viewcontrol;

type
  TfrmDeal = class(TUniForm)
    pnlLeft: TUniPanel;
    gridDeal: TUniDBGrid;
    pnlClient: TUniPanel;
    gridDelivery: TUniDBGrid;
    unspltr1: TUniSplitter;
    lbl1: TUniLabel;
    cmbPart: TUniComboBox;
    grbPart: TUniRadioGroup;
    gbPartData: TUniGroupBox;
    gbContact: TUniGroupBox;
    pnlDelivery: TUniPanel;
    lbl_Inn: TUniLabel;
    lbl_ogrn: TUniLabel;
    lbl_manager: TUniLabel;
    lbl_phone: TUniLabel;
    lbl_mail: TUniLabel;
    popDeal: TUniPopupMenu;
    unmntmN1: TUniMenuItem;
    lblINN: TUniLabel;
    lblOgrn: TUniLabel;
    lblManager: TUniLabel;
    lblMail: TUniLabel;
    pnl1: TUniPanel;
    pnl2: TUniPanel;
    popDeliv: TUniPopupMenu;
    qryDeal: TUniQuery;
    dsDeal: TUniDataSource;
    qryDelivery: TUniQuery;
    dsDelivery: TUniDataSource;
    unmntmN2: TUniMenuItem;
    unmntmN3: TUniMenuItem;
    sbContact: TUniScrollBox;
    procedure unmntmN1Click(Sender: TObject);
    procedure gridDealMouseDown(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
    procedure grbPartClick(Sender: TObject);
    procedure cmbPartSelect(Sender: TObject);
    procedure gridDealCellClick(Column: TUniDBGridColumn);
    procedure unmntmN2Click(Sender: TObject);
    procedure unmntmN3Click(Sender: TObject);
    procedure gridDeliveryMouseDown(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
  private
    FPartPersone: TPartPersoneArr;
    FPartEntity: TPartEntityArr;
    FTypePart: Integer;
    FPartId: Integer;
    procedure UpdateViewPart(aPartType: Integer; apartId: Integer = 0);
    procedure SelectPart;
    procedure SetTypePart(const Value: Integer);
    procedure SetPartId(const Value: Integer);
    procedure UpdateDeliveryGridFromDealId(aDealId: integer);
    procedure ClearContact;
    { Private declarations }
  public
    { Public declarations }
    property Type_part: Integer read FTypePart write SetTypePart;
    property PartId: Integer read FPartId write SetPartId;
  end;

function frmDeal: TfrmDeal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.deal.edit,
  upsk.form.deal.editDelivery;

function frmDeal: TfrmDeal;
begin
  Result := TfrmDeal(UniMainModule.GetFormInstance(TfrmDeal));
end;

procedure TfrmDeal.ClearContact;
begin
  for var i := sbContact.ComponentCount - 1 downto 0 do
    sbContact.Components[i].FreeOnRelease;

end;

procedure TfrmDeal.cmbPartSelect(Sender: TObject);
var
  SQlPart: string;
  SQlCalc: string;
  SQlPartFilter: string;
begin
  case FTypePart of
    1:
      begin
        PartId := FPartPersone[cmbPart.ItemIndex].id;
        SQlPart := ' LEFT JOIN part_persone AS p ON calc.part_id=p.id ';
      end;
    2:
      begin
        PartId := FPartEntity[cmbPart.ItemIndex].id;
        SQlPart := ' LEFT JOIN part_entity AS p ON calc.part_id=p.id ';
      end;
  end;
  if cmbPart.Text = '' then
    SQlPartFilter := ''
  else
  begin
    SQlPartFilter := ' and p.id=' + PartId.ToString;
  end;
  qryDeal.Close;
  qryDeal.SQL.Text := 'SELECT   d.id as did,' +
    'd.id,d.date,c.number_contract,s.number,d.adress,ct.name,d.start_rental_date,d.stop_rental_date,d.chk_pay, ' +
    ' d.chk_copy_contract,d.chk_orig_contract,d.chk_device,d.chk_orig_upd,d.chk_copy_upd,d.chk_pay_deposit  ' +
    ' FROM deal AS d ' + ' LEFT JOIN calc_lrsp200 AS calc ON d.calc_id=calc.id '
    + ' left join document as doc on d.document_id=doc .id ' +
    ' LEFT JOIN spec AS s ON doc.spec_id=s.id ' + SQlPart +
    ' JOIN contract AS c ON c.part_id=p.id AND c.part_type=:typepart   ' +
    ' LEFT JOIN calc_type AS ct ON d.calc_type_id=ct.id ' +
    ' WHERE d.calc_type_id = 1  ' + SQlPartFilter + ' group by d.id';
  qryDeal.ParamByName('typepart').AsInteger := Type_part;
  qryDeal.Open;
end;

procedure TfrmDeal.grbPartClick(Sender: TObject);
begin
  Type_part := grbPart.ItemIndex + 1;
end;

procedure TfrmDeal.gridDealCellClick(Column: TUniDBGridColumn);
begin
  var LdealId := gridDeal.DataSource.DataSet.FieldByName('id').AsInteger;
  if LdealId > 0 then
  begin
    UpdateDeliveryGridFromDealId(LdealId);
  end;
end;

procedure TfrmDeal.gridDealMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popDeal.Popup(X, Y, gridDeal);
end;

procedure TfrmDeal.gridDeliveryMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popDeliv.Popup(X, Y, gridDelivery);
end;

procedure TfrmDeal.SelectPart;
begin

end;

procedure TfrmDeal.SetPartId(const Value: Integer);
var
  LIndex: Integer;
  hd: THelpData<Tpart_persone>;
  hde: THelpData<Tpart_entity>;
  LOrmA: TViewOrmControl<Tadressbook_entity>;
  LadressE: Tadressbook_entity;
begin
  FPartId := Value;
  case FTypePart of
    1:
      begin
        LIndex := hd.IndexFromField(FPartPersone, 'id', Value);
        if LIndex = -1 then
        begin
          ShowMessage('Данные по контраагенту не найдены.');
          exit;
        end;
        lbl_Inn.Caption := 'Серия: ';
        lblINN.Caption := FPartPersone[LIndex].doc_serial;

        lbl_ogrn.Caption := 'Номер: ';
        lblOgrn.Caption := FPartPersone[LIndex].doc_number;

        lbl_manager.Caption := 'Ф.И.О.: ';
        lblManager.Caption := FPartPersone[LIndex].fio;

      end;
    2:
      begin
        LIndex := hde.IndexFromField(FPartEntity, 'id', Value);
        if LIndex = -1 then
        begin
          ShowMessage('Данные по контраагенту не найдены.');
          exit;
        end;

        lblINN.Caption := FPartEntity[LIndex].inn;
        lbl_Inn.Caption := 'ИНН: ';

        lblOgrn.Caption := FPartEntity[LIndex].ogrn;
        lbl_ogrn.Caption := 'ОГРН: ';

        lblManager.Caption := FPartEntity[LIndex].fio_manager;
        lbl_manager.Caption := 'Директор: ';
        ClearContact;
        FPartEntity[LIndex].adressbook.Clear;

        FPartEntity.items[LIndex].adressbook := LOrmA.GetObjArr('part_entity_id='
          + FPartEntity[LIndex].id.ToString);
        for var c := 0 to FPartEntity[LIndex].adressbook.Count - 1 do
        begin
          ViewControl.CreateFrameContact(sbContact, FPartEntity[LIndex].adressbook
            [c].name, FPartEntity[LIndex].adressbook[c].phone);
        end;
      end;
  end;
end;

procedure TfrmDeal.SetTypePart(const Value: Integer);
begin
  FTypePart := Value;
  UpdateViewPart(FTypePart, 0);
end;

procedure TfrmDeal.unmntmN1Click(Sender: TObject);
begin
  if qryDeal.FieldByName('id').AsInteger > 0 then
    CreateAndShowModalForm(TfrmEditDeal).SetTag(qryDeal.FieldByName('id').AsInteger);
end;

procedure TfrmDeal.unmntmN2Click(Sender: TObject);
begin
  var Ldel := gridDeal.DataSource.DataSet.FieldByName('id').AsInteger;
  if Ldel > 0 then
  begin
    CreateAndShowModalForm(TfrmEditDelivery).SetValue([cp('deal_id', Ldel)]);
  end
  else
  begin
    ShowMessage('Сначала выберите сделку.');
  end;
end;

procedure TfrmDeal.unmntmN3Click(Sender: TObject);
begin
  if gridDelivery.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
    CreateAndShowModalForm(TfrmEditDelivery).SetTag(gridDelivery.DataSource.DataSet.FieldByName
      ('id').AsInteger).SetValue([CP('adress', gridDelivery.DataSource.DataSet.FieldByName
      ('adress').asstring)]);
end;

procedure TfrmDeal.UpdateDeliveryGridFromDealId(aDealId: integer);
begin
  qryDelivery.Close;
  qryDelivery.ParamByName('did').AsInteger := aDealId;
  qryDelivery.Open;
end;

procedure TfrmDeal.UpdateViewPart(aPartType, apartId: Integer);
var
  hdP: THelpData<Tpart_persone>;
  hde: THelpData<Tpart_entity>;
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
        hde.AddDataCombox(cmbPart, FPartEntity, 'name');
      end;

  end;

end;

end.

