unit upsk.form.guide.editPartPersone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniMultiItem,
  uniListBox, uniLabel, uniGroupBox, uniEdit, uniDateTimePicker,
  uniGUIBaseClasses, uniButton, upsk.types, ArrayHelper;

type
  TfrmEditPart = class(TUniForm)
    btnAddPhone: TUniButton;
    dtBirthday: TUniDateTimePicker;
    edtFio: TUniEdit;
    edtPhone: TUniEdit;
    edtPLaceBirth: TUniEdit;
    gbPassport: TUniGroupBox;
    edtPassNum: TUniEdit;
    edtPassSer: TUniEdit;
    lbl111: TUniLabel;
    lbl112: TUniLabel;
    edtIssued: TUniEdit;
    UniLabel1: TUniLabel;
    edtAdressReg: TUniEdit;
    UniLabel2: TUniLabel;
    lbl1: TUniLabel;
    lbl11: TUniLabel;
    lbl2: TUniLabel;
    lbPhone: TUniListBox;
    UniLabel3: TUniLabel;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    edtName: TUniEdit;
    lbl3: TUniLabel;
    edtInFace: TUniEdit;
    lbl12: TUniLabel;
    edtFioR: TUniEdit;
    lbl13: TUniLabel;
    edtFioIO: TUniEdit;
    lbl131: TUniLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAddPhoneClick(Sender: TObject);
  private
    FAdressBook: TArrayRecord<Tadressbook_persone>;
    procedure CreatePersone;
    procedure LoadPersone;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditPart: TfrmEditPart;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditPart: TfrmEditPart;
begin
  Result := TfrmEditPart(UniMainModule.GetFormInstance(TfrmEditPart));
end;

procedure TfrmEditPart.btnAcceptClick(Sender: TObject);
var
  LPersone: Tpart_persone;
  Ladress: Tadressbook_persone;
  I: Integer;
begin
  with LPersone do
  begin
    InFace := edtInFace.Text;
    fio := edtFio.Text;
    date_birthday := dtBirthday.DateTime;
    place_birth := edtPLaceBirth.Text;
    doc_serial := edtPassSer.Text;
    doc_number := edtPassNum.Text;
    doc_issued := edtIssued.Text;
    doc_reg := edtAdressReg.Text;
    fioR := edtFioR.Text;
    fioIO := edtFioIO.Text;
  end;
  LPersone.adressbook.SetItems(FAdressBook.Items);
  if Self.Tag = 0 then
  begin
    LPersone.id := 0;
    ViewControl.CreatePersone(LPersone);
  end
  else
  begin
    LPersone.id := Self.Tag;
    ViewControl.UpdatePersone(LPersone);
  end;
  ModalResult := mrOk;
end;

procedure TfrmEditPart.btnAddPhoneClick(Sender: TObject);
var
  Ladr: Tadressbook_persone;
begin
  Ladr.name := edtName.Text;
  Ladr.phone := edtPhone.Text;
  FAdressBook.Add(Ladr);
  lbPhone.Items.Add(Ladr.name + '=' + Ladr.phone);
  edtPhone.Text := '';
  edtName.Text := '';
end;

procedure TfrmEditPart.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditPart.CreatePersone;
var
  LPersone: Tpart_persone;
  Ladress: Tadressbook_persone;
  I: Integer;
begin
  with LPersone do
  begin
    id := 0;
    fio := edtFio.Text;
    date_birthday := dtBirthday.DateTime;
    place_birth := edtPLaceBirth.Text;
    doc_serial := edtPassSer.Text;
    doc_number := edtPassNum.Text;
    doc_issued := edtIssued.Text;
    doc_reg := edtAdressReg.Text;
    InFace := edtInFace.Text;
  end;
  LPersone.adressbook.SetItems(FAdressBook.Items);
end;

procedure TfrmEditPart.LoadPersone;
var
  Lpersone: Tpart_persone;
  i: Integer;
begin
  FAdressBook.Clear;
  Lpersone := ViewControl.GetPersone(Self.Tag);
  FAdressBook.SetItems(Lpersone.adressbook.Items);
  for i := 0 to FAdressBook.Count - 1 do
  begin
    lbPhone.Items.Add(FAdressBook.Items[i].Name + '=' + FAdressBook.Items[i].phone);
  end;
  edtFio.Text := Lpersone.fio;
  edtPLaceBirth.Text := Lpersone.place_birth;
  edtPassNum.Text := Lpersone.doc_number;
  edtPassSer.Text := Lpersone.doc_serial;
  edtIssued.Text := Lpersone.doc_issued;
  edtAdressReg.Text := Lpersone.doc_reg;
  edtInFace.Text := Lpersone.InFace;
end;

procedure TfrmEditPart.UniFormAfterShow(Sender: TObject);
begin
  if Self.Tag <> 0 then
  begin
    LoadPersone;
  end;
end;

end.

