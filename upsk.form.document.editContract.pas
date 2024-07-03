unit upsk.form.document.editContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel,
  uniGUIBaseClasses, uniGroupBox, uniEdit, uniLabel, uniButton, upsk.const_,
  uniDateTimePicker, upsk.types, upsk.globalMetod;

type
  TfrmEditContract = class(TUniForm)
    gbOrgan: TUniGroupBox;
    gbPart: TUniGroupBox;
    pnlBot: TUniPanel;
    pnlBtn: TUniPanel;
    lblNNNNN: TUniLabel;
    edtOrganInFace: TUniEdit;
    edtOrganEnAdress: TUniEdit;
    lblEnAdress: TUniLabel;
    edtOrganInnKpp: TUniEdit;
    UniLabel2: TUniLabel;
    edtOrganEmail: TUniEdit;
    UniLabel3: TUniLabel;
    edtOrganOgrn: TUniEdit;
    UniLabel4: TUniLabel;
    edtOrganFioManager: TUniEdit;
    UniLabel5: TUniLabel;
    edtOrganBankRorder: TUniEdit;
    UniLabel6: TUniLabel;
    edtOrganBankKorder: TUniEdit;
    UniLabel7: TUniLabel;
    edtOrganBankName: TUniEdit;
    UniLabel8: TUniLabel;
    UniLabel1: TUniLabel;
    edtOrganBankBik: TUniEdit;
    UniLabel9: TUniLabel;
    edtPartInFace: TUniEdit;
    edtPartEnAdress: TUniEdit;
    UniLabel10: TUniLabel;
    edtPartInnKpp: TUniEdit;
    UniLabel11: TUniLabel;
    edtPartEmail: TUniEdit;
    UniLabel12: TUniLabel;
    edtPartOgrn: TUniEdit;
    UniLabel13: TUniLabel;
    edtPartFioManager: TUniEdit;
    UniLabel14: TUniLabel;
    edtPartBankRorder: TUniEdit;
    UniLabel15: TUniLabel;
    edtPartBankKorder: TUniEdit;
    UniLabel16: TUniLabel;
    edtPartBankName: TUniEdit;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    edtPartBankBikBank: TUniEdit;
    btnSave: TUniButton;
    edtP12: TUniEdit;
    UniLabel19: TUniLabel;
    edtNumberContract: TUniEdit;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    dtContract: TUniDateTimePicker;
    btnViewContract: TUniButton;
    procedure LoadDefaultData;
    procedure LoadData;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnViewContractClick(Sender: TObject);
  private
    FContract: TContract;
    procedure SetContract(const Value: TContract);
    procedure UpdateData;
    { Private declarations }
  public
  published
    property Contract: TContract read FContract write SetContract;
    { Public declarations }
  end;

function frmEditContract: TfrmEditContract;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditContract: TfrmEditContract;
begin
  Result := TfrmEditContract(UniMainModule.GetFormInstance(TfrmEditContract));
end;

{ TfrmEditContract }

procedure TfrmEditContract.btnSaveClick(Sender: TObject);
begin
  UpdateData;
  if Self.Tag = 0 then
  begin
    ModalResult := ViewControl.InsertContract(FContract);
  end
  else
  begin
    ViewControl.UpdateContract(FContract);
    ModalResult := FContract.id;
  end;
//  ModalResult := mrOk;
end;

procedure TfrmEditContract.btnViewContractClick(Sender: TObject);
var
  hd: THelpData<TContract>;
begin
  UpdateData;
  hd.BuildReport(UniMainModule.frxDoc, FContract);
end;

procedure TfrmEditContract.LoadData;
begin
  FContract.organ_name := FContract.organ_name;
  FContract.organ_mail_adress := FContract.organ_mail_adress;
  edtOrganInFace.Text := FContract.organ_in_face;
  edtOrganEnAdress.Text := FContract.organ_en_adress;
  edtOrganInnKpp.Text := FContract.organ_inn_kpp;
  edtOrganOgrn.Text := FContract.organ_ogrn;
  edtOrganEmail.Text := FContract.organ_email;
  edtOrganFioManager.Text := FContract.organ_fio_manager;
  edtOrganBankRorder.Text := FContract.organ_bank_rorder;
  edtOrganBankKorder.Text := FContract.organ_bank_korder;
  edtOrganBankName.Text := FContract.organ_bank_name;
  edtOrganBankBik.Text := FContract.organ_bank_bik;
  dtContract.DateTime := FContract.date;
  FContract.part_name := FContract.part_name;
  FContract.part_mail_adress := FContract.part_mail_adress;

  edtPartInFace.Text := FContract.part_in_face;
  edtPartEnAdress.Text := FContract.part_en_adress;
  edtPartInnKpp.Text := FContract.part_inn_kpp;
  edtPartOgrn.Text := FContract.part_ogrn;
  edtPartEmail.Text := FContract.part_email;
  edtPartFioManager.Text := FContract.part_fio_manager;
  edtPartBankRorder.Text := FContract.part_bank_rorder;
  edtPartBankKorder.Text := FContract.part_bank_korder;
  edtPartBankName.Text := FContract.part_bank_name;
  edtPartBankBikBank.Text := FContract.part_bank_bik;

  edtNumberContract.Text := FContract.number_contract;
  edtP12.Text := FContract.p1_2;
end;

procedure TfrmEditContract.LoadDefaultData;
begin
  FContract.organ_name := FContract.organization.name;
  FContract.organ_mail_adress := FContract.organization.mail_adress;
  edtOrganInFace.Text := FContract.organization.in_face;
  edtOrganEnAdress.Text := FContract.organization.en_adress;
  edtOrganInnKpp.Text := FContract.organization.inn + '/' + FContract.organization.kpp;
  edtOrganOgrn.Text := FContract.organization.ogrn;
  edtOrganEmail.Text := FContract.organization.email;
  edtOrganFioManager.Text := FContract.organization.fio_manager;
  edtOrganBankRorder.Text := FContract.organization.bank_rorder;
  edtOrganBankKorder.Text := FContract.organization.bank_korder;
  edtOrganBankName.Text := FContract.organization.bank_name;
  edtOrganBankBik.Text := FContract.organization.bank_bik;
  dtContract.DateTime := now;

  case FContract.part_type of
    1:
      begin
        edtPartInFace.Text := FContract.part_persone.InFace;
        edtPartEnAdress.Text := FContract.part_persone.doc_reg;
        edtPartInnKpp.Text := FContract.part_persone.doc_serial + '/' +
          FContract.part_persone.doc_number;
        edtPartOgrn.Text := ''; // FContract.part_persone.ogrn;
        edtPartEmail.Text := ''; // FContract.part_persone.adressbook.;
        edtPartFioManager.Text := FContract.part_persone.fio;
       // edtPartBankRorder.Text := FContract.part_persone.bank_rorder;
      //  edtPartBankKorder.Text := FContract.part_persone.bank_korder;
      //  edtPartBankName.Text := FContract.part_persone.bank_name;
     //   edtPartBankBikBank.Text := FContract.part_persone.bank_bik;


      end;
    2:
      begin

        edtPartInFace.Text := FContract.Part_entity.in_face;
        edtPartEnAdress.Text := FContract.Part_entity.en_adress;
        edtPartInnKpp.Text := FContract.Part_entity.inn + '/' + FContract.Part_entity.kpp;
        edtPartOgrn.Text := FContract.Part_entity.ogrn;
        edtPartEmail.Text := FContract.Part_entity.email;
        edtPartFioManager.Text := FContract.Part_entity.fio_manager;
        edtPartBankRorder.Text := FContract.Part_entity.bank_rorder;
        edtPartBankKorder.Text := FContract.Part_entity.bank_korder;
        edtPartBankName.Text := FContract.Part_entity.bank_name;
        edtPartBankBikBank.Text := FContract.Part_entity.bank_bik;
        FContract.part_name := FContract.part_entity.name;
        FContract.part_mail_adress := FContract.part_entity.mail_adress;
      end;
  end;

  edtNumberContract.Text := FContract.number_contract;
  edtP12.Text := FContract.p1_2;
end;

procedure TfrmEditContract.SetContract(const Value: TContract);
begin
  FContract := Value;

end;

procedure TfrmEditContract.UniFormAfterShow(Sender: TObject);
begin
  if self.Tag = 0 then
  begin

    case FContract.part_type of
      1:
        FContract.p1_2 :=
          '1.2. Арендуемое имущество передается Арендатору для личных нужд.';
      2:
        FContract.p1_2 :=
          '1.2. Арендуемое имущество передается Арендатору для осуществления предпринимательской деятельности.';

    end;

    LoadDefaultData;
  end
  else
  begin
    FContract := ViewControl.GetContract(Self.Tag);
    LoadData;
  end;

end;

procedure TfrmEditContract.UpdateData;
begin
  FContract.organ_in_face := edtOrganInFace.Text;
  FContract.organ_en_adress := edtOrganEnAdress.Text;
  FContract.organ_inn_kpp := edtOrganInnKpp.Text;
  FContract.organ_ogrn := edtOrganOgrn.Text;
  FContract.organ_email := edtOrganEmail.Text;
  FContract.organ_fio_manager := edtOrganFioManager.Text;
  FContract.organ_bank_rorder := edtOrganBankRorder.Text;
  FContract.organ_bank_korder := edtOrganBankKorder.Text;
  FContract.organ_bank_name := edtOrganBankName.Text;
  FContract.organ_bank_bik := edtOrganBankBik.Text;

  FContract.Part_in_face := edtPartInFace.Text;
  FContract.Part_en_adress := edtPartEnAdress.Text;
  FContract.Part_inn_kpp := edtPartInnKpp.Text;
  FContract.Part_ogrn := edtPartOgrn.Text;
  FContract.Part_email := edtPartEmail.Text;
  FContract.Part_fio_manager := edtPartFioManager.Text;
  FContract.Part_bank_rorder := edtPartBankRorder.Text;
  FContract.Part_bank_korder := edtPartBankKorder.Text;
  FContract.Part_bank_name := edtPartBankName.Text;
  FContract.Part_bank_bik := edtPartBankBikBank.Text;
  FContract.date := dtContract.DateTime;
  FContract.number_contract := edtNumberContract.Text;
  FContract.p1_2 := edtP12.Text;
end;

end.

