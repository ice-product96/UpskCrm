unit upsk.form.guide.edtDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniButton,
  uniGUIBaseClasses, uniEdit, uniLabel, upsk.types;

type
  TfrmEditDriver = class(TUniForm)
    edtFio: TUniEdit;
    btnAcceprt: TUniButton;
    lbl1: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceprtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditDriver: TfrmEditDriver;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,upsk.viewcontrol;

function frmEditDriver: TfrmEditDriver;
begin
  Result := TfrmEditDriver(UniMainModule.GetFormInstance(TfrmEditDriver));
end;

procedure TfrmEditDriver.btnAcceprtClick(Sender: TObject);
var
  Ld: TViewOrmControl<TDriver>;
  LDriver: TDriver;
begin
  LDriver.FIO := edtFio.Text;
  if Self.Tag > 0 then
  begin
    Ld.Update(LDriver);
  end
  else
  begin
    Ld.Insert(LDriver);
  end;
  ModalResult := mrOk;
end;

procedure TfrmEditDriver.UniFormAfterShow(Sender: TObject);
var
  Ld: TViewOrmControl<TDriver>;
begin
  if Self.Tag > 0 then
  begin
    var LDriver := Ld.GetObjFromId(self.Tag);
    edtFio.Text := LDriver.FIO;
  end;

end;

end.

