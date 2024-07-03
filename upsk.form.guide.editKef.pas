unit upsk.form.guide.editKef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniButton, uniLabel, uniMultiItem, uniComboBox, uniEdit,
  upsk.types, upsk.globalMetod, upsk.viewcontrol;

type
  TfrmEditKef = class(TUniForm)
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    edtCount: TUniNumberEdit;
    edtDay: TUniNumberEdit;
    cmbPackage: TUniComboBox;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    cmbOperDay: TUniComboBox;
    lbl4: TUniLabel;
    cmbOperCount: TUniComboBox;
    lbl41: TUniLabel;
    edtValue: TUniNumberEdit;
    lbl21: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FPackage: TpackageArr;
    procedure LoadPackage;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditKef: TfrmEditKef;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditKef: TfrmEditKef;
begin
  Result := TfrmEditKef(UniMainModule.GetFormInstance(TfrmEditKef));
end;

{ TfrmEditKef }

procedure TfrmEditKef.btnAcceptClick(Sender: TObject);
var
  lk: Tkef;
begin
  if cmbPackage.ItemIndex < 0 then
  begin
    ShowMessage('Выберите комплект из списка');
    exit;
  end;
  if cmbOperDay.ItemIndex < 0 then
  begin
    ShowMessage('Выберите знак для кол-во дней');
    exit;
  end;
  if cmbOperCount.ItemIndex < 0 then
  begin
    ShowMessage('Выберите знак для кол-во ед. изм номенклатуры');
    exit;
  end;
  lk.id := Self.Tag;
  lk.package_id := FPackage[cmbPackage.ItemIndex].id;
  lk.oper_count := cmbOperCount.Text;
  lk.count := strtoint(edtCount.text);
  lk.day := strtoint(edtDay.text);
  lk.oper_day := cmbOperDay.Text;
  lk.value := edtValue.Value;
  if Self.Tag > 0 then
  begin
    ViewControl.UpdateKef(lk);

  end
  else
  begin
    ViewControl.CreateKef(lk);
  end;
  ModalResult := mrOk;

end;

procedure TfrmEditKef.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditKef.LoadPackage;
var
  i: Integer;
begin
  FPackage := ViewControl.GetPackageArr;
  cmbPackage.Clear;
  for i := 0 to FPackage.Count - 1 do
  begin
    cmbPackage.Items.Add(FPackage[i].name);
  end;
end;

procedure TfrmEditKef.UniFormAfterShow(Sender: TObject);
var
  Lk: TKef;
  lh: THelpData<Tpackage>;
begin
  LoadPackage;
  if Self.Tag > 0 then
  begin
    Lk := ViewControl.GetKef(Self.Tag);
    edtCount.Value := Lk.count;
    edtDay.Value := Lk.day;
    cmbOperDay.Text := Lk.oper_day;
    cmbOperCount.Text := Lk.oper_count;
    edtValue.Value := Lk.value;
    if FPackage.Count > 0 then
    begin
      cmbPackage.Text := lh.GetNameFromId(Lk.package_id, FPackage);
    end;
  end;
end;

end.

