unit upsk.form.guide.editSklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniEdit, uniButton, uniLabel, upsk.types;

type
  TfrmEditSklad = class(TUniForm)
    edtName: TUniEdit;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    lbl1: TUniLabel;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditSklad: TfrmEditSklad;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditSklad: TfrmEditSklad;
begin
  Result := TfrmEditSklad(UniMainModule.GetFormInstance(TfrmEditSklad));
end;

procedure TfrmEditSklad.btnAcceptClick(Sender: TObject);
var
  Ls: TSklad;
begin
  Ls.name := edtName.Text;
  if Self.Tag = 0 then
  begin
    ViewControl.CreateSklad(Ls);

  end
  else
  begin
    ViewControl.UpdateSklad(Ls);
  end;
  ModalResult := mrOk;

end;

procedure TfrmEditSklad.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

