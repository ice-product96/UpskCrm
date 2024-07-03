unit upsk.form.guide.editPartEntity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniListBox,
  uniLabel, uniGroupBox, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses,
  uniButton, uniCheckBox, upsk.types, ArrayHelper;

type
  TfrmEditEntity = class(TUniForm)
    btnAddPhoneEn: TUniButton;
    cmbBasesContract: TUniComboBox;
    cmbInFace: TUniComboBox;
    edtAdress: TUniEdit;
    edtAdressMail: TUniEdit;
    edtContractNumber: TUniEdit;
    edtEmail: TUniEdit;
    edtFioManager: TUniEdit;
    edtInn: TUniEdit;
    edtKpp: TUniEdit;
    edtOgrn: TUniEdit;
    edtPartnerName: TUniEdit;
    edtPhoneEn: TUniEdit;
    gbPartnerBank: TUniGroupBox;
    edtBankName: TUniEdit;
    lbl12114: TUniLabel;
    edtPaymentAcc: TUniEdit;
    lbl121141: TUniLabel;
    edtCorrAcc: TUniEdit;
    lbl1211411: TUniLabel;
    edtBik: TUniEdit;
    lbl12114111: TUniLabel;
    lbl12: TUniLabel;
    lbl121: TUniLabel;
    lbl1211: TUniLabel;
    lbl12111: TUniLabel;
    lbl12112: TUniLabel;
    lbl12113: TUniLabel;
    lbl121131: TUniLabel;
    lbl121132: TUniLabel;
    lbl1211321: TUniLabel;
    lbl13: TUniLabel;
    lbl131: TUniLabel;
    lblPhone: TUniLabel;
    lbPhoneEn: TUniListBox;
    edtName: TUniEdit;
    lblName: TUniLabel;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    edtAttorney: TUniEdit;
    UniLabel1: TUniLabel;
    chkNds: TUniCheckBox;
    edtFioR: TUniEdit;
    lbl1212: TUniLabel;
    edtFioIO: TUniEdit;
    lbl12121: TUniLabel;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnAddPhoneEnClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);

  private
    FAdressBook: TArrayRecord<Tadressbook_entity>;
  private
    FOrgan: Boolean;
    procedure SetOrgan(const Value: Boolean);
  published
    property Organ: Boolean read FOrgan write SetOrgan;
    { Private declarations }
  public
    { Public declarations }

  end;

function frmEditEntity: TfrmEditEntity;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditEntity: TfrmEditEntity;
begin
  Result := TfrmEditEntity(UniMainModule.GetFormInstance(TfrmEditEntity));
end;

procedure TfrmEditEntity.btnAcceptClick(Sender: TObject);
begin

  if not Organ then
  begin
    var Lp: Tpart_entity;
    Lp.id := Self.Tag;
    Lp.name := edtPartnerName.Text;
    Lp.in_face := cmbInFace.Text;
    Lp.fio_manager := edtFioManager.Text;
    Lp.base_contract := cmbBasesContract.Text;
    Lp.en_adress := edtAdress.Text;
    Lp.mail_adress := edtAdressMail.Text;
    Lp.conract_number := edtContractNumber.Text;
    Lp.inn := edtInn.Text;
    Lp.kpp := edtKpp.Text;
    Lp.ogrn := edtOgrn.Text;
    Lp.email := edtEmail.Text;
    Lp.bank_name := edtBankName.Text;
    Lp.bank_rorder := edtPaymentAcc.Text;
    Lp.bank_korder := edtCorrAcc.Text;
    Lp.bank_bik := edtBik.Text;
    Lp.adressbook.SetItems(FAdressBook.Items);
    Lp.nds := chkNds.Checked.ToInteger;
    Lp.fio_managerR := edtFioR.Text;
    Lp.fio_managerIO := edtFioIO.Text;
    if Lp.id = 0 then
    begin
      ViewControl.CreateEntity(Lp);
    end
    else
    begin
      ViewControl.UpdateEntity(Lp);
    end;
  end
  else
  begin
    var Lp: Torganization;
    Lp.id := Self.Tag;
    Lp.name := edtPartnerName.Text;
    Lp.in_face := cmbInFace.Text;
    Lp.fio_manager := edtFioManager.Text;
    Lp.base_contract := cmbBasesContract.Text;
    Lp.en_adress := edtAdress.Text;
    Lp.mail_adress := edtAdressMail.Text;
    Lp.conract_number := edtContractNumber.Text;
    Lp.inn := edtInn.Text;
    Lp.kpp := edtKpp.Text;
    Lp.ogrn := edtOgrn.Text;
    Lp.email := edtEmail.Text;
    Lp.bank_name := edtBankName.Text;
    Lp.bank_rorder := edtPaymentAcc.Text;
    Lp.bank_korder := edtCorrAcc.Text;
    Lp.bank_bik := edtBik.Text;
    Lp.fio_managerR := edtFioR.Text;
    Lp.fio_managerIO := edtFioIO.Text;
    if Lp.id = 0 then
    begin
      ViewControl.InsertOrganization(Lp);
    end
    else
    begin
      ViewControl.UpdateOrganization(Lp);
    end;
  end;
  ModalResult := mrOk;
end;

procedure TfrmEditEntity.btnAddPhoneEnClick(Sender: TObject);
var
  Ladr: Tadressbook_entity;
begin
  Ladr.name := edtName.Text;
  Ladr.phone := edtPhoneEn.Text;
  FAdressBook.Add(Ladr);
  lbPhoneEn.Items.Add(Ladr.name + '=' + Ladr.phone);
  edtPhoneEn.Text := '';
  edtName.Text := '';

end;

procedure TfrmEditEntity.SetOrgan(const Value: Boolean);
begin
  FOrgan := Value;
  if Value then
  begin
    Self.Caption := 'Организация';
    self.lbPhoneEn.Visible := False;
    Self.edtPhoneEn.Visible := False;
    Self.edtName.Visible := False;
    lblName.Visible := False;
    lblPhone.Visible := False;
    btnAddPhoneEn.Visible := False;
  end;
end;

procedure TfrmEditEntity.UniFormAfterShow(Sender: TObject);
begin
  if Self.Tag > 0 then
  begin
    if not Organ then
    begin
      var Lp: Tpart_entity;
      Lp := ViewControl.GetEntity(self.Tag);
      edtPartnerName.Text := Lp.name;
      cmbInFace.Text := Lp.in_face;
      edtFioManager.Text := Lp.fio_manager;
      cmbBasesContract.Text := Lp.base_contract;
      edtAdress.Text := Lp.en_adress;
      edtAdressMail.Text := Lp.mail_adress;
      edtContractNumber.Text := Lp.conract_number;
      edtInn.Text := Lp.inn;
      edtKpp.Text := Lp.kpp;
      edtOgrn.Text := Lp.ogrn;
      edtEmail.Text := Lp.email;
      edtBankName.Text := Lp.bank_name;
      edtPaymentAcc.Text := Lp.bank_rorder;
      edtCorrAcc.Text := Lp.bank_korder;
      edtBik.Text := Lp.bank_bik;
      chkNds.Checked := Lp.nds.ToBoolean;
      edtFioR.Text := Lp.fio_managerR;
      edtFioIO.Text := Lp.fio_managerIO;
    end
    else
    begin
      var Lp: Torganization;
      Lp := ViewControl.GetOrganization(self.Tag);
      edtPartnerName.Text := Lp.name;
      cmbInFace.Text := Lp.in_face;
      edtFioManager.Text := Lp.fio_manager;
      cmbBasesContract.Text := Lp.base_contract;
      edtAdress.Text := Lp.en_adress;
      edtAdressMail.Text := Lp.mail_adress;
      edtContractNumber.Text := Lp.conract_number;
      edtInn.Text := Lp.inn;
      edtKpp.Text := Lp.kpp;
      edtOgrn.Text := Lp.ogrn;
      edtEmail.Text := Lp.email;
      edtBankName.Text := Lp.bank_name;
      edtPaymentAcc.Text := Lp.bank_rorder;
      edtCorrAcc.Text := Lp.bank_korder;
      edtBik.Text := Lp.bank_bik;
      edtFioR.Text := Lp.fio_managerR;
      edtFioIO.Text := Lp.fio_managerIO;
    end;
  end;
end;

end.

