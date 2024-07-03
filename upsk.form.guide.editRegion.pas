unit upsk.form.guide.editRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniButton, uniEdit, uniLabel;

type
  TfrmEditRegion = class(TUniForm)
    btnCancel: TUniButton;
    btnAccept: TUniButton;
    edtName: TUniEdit;
    edtKef: TUniNumberEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    procedure btnAcceptClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditRegion: TfrmEditRegion;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.types, upsk.viewcontrol;

function frmEditRegion: TfrmEditRegion;
begin
  Result := TfrmEditRegion(UniMainModule.GetFormInstance(TfrmEditRegion));
end;

procedure TfrmEditRegion.btnAcceptClick(Sender: TObject);
var
  Lr: TRegion;
begin
  Lr.name := edtName.Text;
  Lr.kef := edtKef.Value;
  if Self.Tag = 0 then
  begin
    viewcontrol.CreateRegion(Lr);
  end
  else
  begin
    Lr.id := Self.Tag;
    viewcontrol.UpdateRegion(Lr);
  end;
  ModalResult := mrOk;
end;

procedure TfrmEditRegion.UniFormAfterShow(Sender: TObject);
var
  lr: TRegion;
begin
  if Self.Tag > 0 then
  begin
    lr := viewcontrol.GetRegion(Self.tag);
    edtName.Text := lr.name;
    edtKef.Value := lr.kef;
  end;

end;

end.

