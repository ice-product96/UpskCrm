unit upsk.form.guide.editUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniEdit, uniButton, upsk.types,
  upsk.globalMetod;

type
  TfrmEditUser = class(TUniForm)
    edtFIO: TUniEdit;
    lbl1: TUniLabel;
    edtLogin: TUniEdit;
    lbl11: TUniLabel;
    edtPass: TUniEdit;
    lbl111: TUniLabel;
    edtPost: TUniEdit;
    lbl12: TUniLabel;
    cmbPriority: TUniComboBox;
    lbl13: TUniLabel;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    FpriorGroup: Tpriority_groupArr;
    procedure LoadPriorityGroup;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditUser: TfrmEditUser;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditUser: TfrmEditUser;
begin
  Result := TfrmEditUser(UniMainModule.GetFormInstance(TfrmEditUser));
end;

procedure TfrmEditUser.btnAcceptClick(Sender: TObject);
var
  Lu: TUser;
begin
  if cmbPriority.ItemIndex < 0 then
  begin
    ShowMessage('Выберете уровень доступа');
    exit;
  end;
  Lu.id := Self.Tag;
  Lu.fio := edtFIO.Text;
  Lu.login := edtLogin.Text;
  Lu.pass := edtPass.Text;
  Lu.post := edtPost.Text;
  Lu.priority_group_id := FpriorGroup[cmbPriority.ItemIndex].id;
  if Self.Tag = 0 then
  begin
    ViewControl.CreateUser(Lu);
  end
  else
  begin
    ViewControl.UpdateUser(Lu);
  end;

  ModalResult := mrOk;
end;

procedure TfrmEditUser.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditUser.LoadPriorityGroup;
var
  I: Integer;
begin
  FpriorGroup := ViewControl.GetPriorityGroup;
  cmbPriority.Clear;
  for I := 0 to FpriorGroup.Count - 1 do
  begin
    cmbPriority.Items.Add(FpriorGroup[I].name);
  end;
end;

procedure TfrmEditUser.UniFormAfterShow(Sender: TObject);
var
  Lu: TUser;
  lh: THelpData<Tpriority_group>;
begin
  LoadPriorityGroup;
  if Self.Tag > 0 then
  begin
    Lu := ViewControl.GetUser(Self.Tag);
    edtFIO.Text := Lu.fio;
    edtLogin.Text := Lu.login;
    edtPass.Text := Lu.pass;
    edtPost.Text := Lu.post;
    if Lu.priority_group_id <> 0 then
    begin
      cmbPriority.Text := lh.GetNameFromId(Lu.priority_group_id, FpriorGroup);
    end;

  end;

end;

end.

