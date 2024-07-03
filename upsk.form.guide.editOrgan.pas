unit upsk.form.guide.editOrgan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniLabel,
  uniGUIBaseClasses, uniEdit, uniButton, upsk.types;

type
  TfrmEditOrgan = class(TUniForm)
    edtName: TUniEdit;
    lbl1: TUniLabel;
    btnCancel: TUniButton;
    btnAccept: TUniButton;
    lblNds: TUniLabel;
    edtNds: TUniNumberEdit;
    edtInFace: TUniEdit;
    lbl11: TUniLabel;
    edtFioManager: TUniEdit;
    lbl111: TUniLabel;
    edten_adress: TUniEdit;
    lbl1111: TUniLabel;
    edtInn: TUniEdit;
    lbl11111: TUniLabel;
    edtKPP: TUniEdit;
    lbl111111: TUniLabel;
    edtOgrn: TUniEdit;
    lbl1111111: TUniLabel;
    edtMailAdress: TUniEdit;
    lbl11112: TUniLabel;
    edtBankName: TUniEdit;
    lbl111112: TUniLabel;
    edtBankBik: TUniEdit;
    lbl1111112: TUniLabel;
    edtRorder: TUniEdit;
    lbl1111121: TUniLabel;
    edtKordder: TUniEdit;
    lbl11111121: TUniLabel;
    edtEmail: TUniEdit;
    lbl11111211: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditOrgan: TfrmEditOrgan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditOrgan: TfrmEditOrgan;
begin
  Result := TfrmEditOrgan(UniMainModule.GetFormInstance(TfrmEditOrgan));
end;

procedure TfrmEditOrgan.btnAcceptClick(Sender: TObject);
var
  Lo: Torganization;
begin

  Lo.name := edtName.Text;
  Lo.nds := round(edtNds.Value);
  Lo.in_face := edtInFace.Text;
  Lo.fio_manager := edtFioManager.Text;
  Lo.en_adress := edten_adress.Text;
  Lo.inn := edtInn.Text;
  Lo.kpp := edtKPP.Text;
  Lo.ogrn := edtOgrn.Text;
  Lo.mail_adress := edtMailAdress.Text;
  Lo.bank_name := edtBankName.Text;
  Lo.bank_bik := edtBankBik.Text;
  Lo.bank_rorder := edtRorder.Text;
  Lo.bank_korder := edtKordder.Text;
  Lo.email := edtEmail.Text;
  Lo.id := Self.Tag;
  if Lo.id > 0 then
    ViewControl.UpdateOrganization(Lo)
  else
    ViewControl.InsertOrganization(Lo);
  ModalResult := mrOk;
end;

procedure TfrmEditOrgan.UniFormAfterShow(Sender: TObject);
var
  Lo: Torganization;
begin
  if Self.Tag > 0 then
  begin
    Lo := ViewControl.GetOrganization(Self.Tag);
    edtEmail.Text := Lo.email;
    edtName.Text := Lo.name;
    edtNds.Value := Lo.nds;
    edtInFace.Text := Lo.in_face;
    edtFioManager.Text := Lo.fio_manager;
    edten_adress.Text := Lo.en_adress;
    edtInn.Text := Lo.inn;
    edtKPP.Text := Lo.kpp;
    edtOgrn.Text := Lo.ogrn;
    edtMailAdress.Text := Lo.mail_adress;
    edtBankName.Text := Lo.bank_name;
    edtBankBik.Text := Lo.bank_bik;
    edtRorder.Text := Lo.bank_rorder;
    edtKordder.Text := Lo.bank_korder;

  end;

end;

end.

