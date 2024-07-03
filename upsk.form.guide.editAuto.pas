unit upsk.form.guide.editAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniLabel,
  upsk.types, uniButton, uniGUIBaseClasses, uniEdit;

type
  TfrmEditAuto = class(TUniForm)
    edtAuto: TUniEdit;
    btnAccept: TUniButton;
    lbl1: TUniLabel;
    procedure btnAcceptClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditAuto: TfrmEditAuto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,upsk.viewcontrol;

function frmEditAuto: TfrmEditAuto;
begin
  Result := TfrmEditAuto(UniMainModule.GetFormInstance(TfrmEditAuto));
end;

procedure TfrmEditAuto.btnAcceptClick(Sender: TObject);
var
  Ld: TViewOrmControl<TAuto>;
  LAuto: TAuto;
begin
  LAuto.name := edtAuto.Text;
  if Self.Tag > 0 then
  begin
    Ld.Update(LAuto);
  end
  else
  begin
    Ld.Insert(LAuto);
  end;

  ModalResult := mrOk;
end;

procedure TfrmEditAuto.UniFormAfterShow(Sender: TObject);
var
  Ld: TViewOrmControl<TAuto>;
begin
  if Self.Tag > 0 then
  begin
    var LAuto := Ld.GetObjFromId(self.Tag);
    edtAuto.Text := LAuto.name;
  end;

end;

end.

