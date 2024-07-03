unit upsk.form.guide.editPosition;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  Vcl.StdCtrls,
  uniButton,
  uniEdit,
  uniGUIBaseClasses,
  uniLabel,
  uniChart,
  uniPanel,
  uniMultiItem,
  uniComboBox,
  upsk.types;

type
  TfrmEditPosition = class(TUniForm)
    Label2: TUniLabel;
    EditName: TUniEdit;
    Label3: TUniLabel;
    EditDescription: TUniEdit;
    Label4: TUniLabel;
    Label5: TUniLabel;
    EditLength: TUniEdit;
    Label6: TUniLabel;
    EditWidth: TUniEdit;
    Label7: TUniLabel;
    EditHeight: TUniEdit;
    Label8: TUniLabel;
    EditWeight: TUniEdit;
    Label9: TUniLabel;
    EditBasePrice: TUniEdit;
    Label10: TUniLabel;
    EditReleasePrice: TUniEdit;
    Label11: TUniLabel;
    EditRecoveryPrice: TUniEdit;
    Label12: TUniLabel;
    EditClearPrice: TUniEdit;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    chrBasePrice: TUniChart;
    srlPrice: TUniLineSeries;
    cmbUnit: TUniComboBox;
    procedure btnAcceptClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FUnits: TUnitArr;
    FBasePrice: Double;
    procedure LoadPosition;
    procedure LoadViewUnit;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditPosition: TfrmEditPosition;

implementation

{$R *.dfm}

uses
  MainModule,
  uniGUIApplication,
  upsk.datamanager;

procedure TfrmEditPosition.btnAcceptClick(Sender: TObject);
var
  Position: TPosition;
  bp: TPosition_Base_Price;
begin

  Position.Name := EditName.Text;
  Position.Description := EditDescription.Text;
  Position.Unit__Id := FUnits[cmbUnit.ItemIndex].Id;
  Position.Length := StrToFloat(EditLength.Text);
  Position.Width := StrToFloat(EditWidth.Text);
  Position.Height := StrToFloat(EditHeight.Text);
  Position.Weight := StrToFloat(EditWeight.Text);
  Position.Base_Price := StrToFloat(EditBasePrice.Text);
  Position.Release_Price := StrToFloat(EditReleasePrice.Text);
  Position.Recovery_Price := StrToFloat(EditRecoveryPrice.Text);
  Position.Clear_Price := StrToFloat(EditClearPrice.Text);
  if Self.Tag = 0 then
  begin
    Position.Id := ViewControl.CreatePosition(Position);
  end
  else
  begin
    Position.Id := Self.Tag;
    ViewControl.UpdatePosition(Position);
  end;
  if FBasePrice <> Position.Base_Price then
  begin
    with bp do
    begin
      Position_Id := Position.Id;
      Price := Position.Base_Price;
      User_Id := DataManager.User.id;
      DateTime := Now;
    end;

    ViewControl.CreateBasePricePosition(bp);
  end;

  ModalResult := mrOk;
end;

function frmEditPosition: TfrmEditPosition;
begin
  Result := TfrmEditPosition(UniMainModule.GetFormInstance(TfrmEditPosition));
end;

procedure TfrmEditPosition.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditPosition.LoadPosition;
var
  LP: TPosition;
  I: Integer;
begin
  LP := ViewControl.GetPosition(Self.Tag);
  if LP.Id < 0 then
  begin
    ShowMessage('Ошибка загрузки данных');
    Exit;
  end;

  EditName.Text := LP.Name;
  EditDescription.Text := LP.Description;
  EditLength.Text := LP.Length.ToString;
  EditWidth.Text := LP.Width.ToString;
  EditHeight.Text := LP.Height.ToString;
  EditWeight.Text := LP.Weight.ToString;
  EditBasePrice.Text := LP.Base_Price.ToString;
  EditReleasePrice.Text := LP.Release_Price.ToString;
  EditRecoveryPrice.Text := LP.Recovery_Price.ToString;
  EditClearPrice.Text := LP.Clear_Price.ToString;
  FBasePrice := LP.Base_Price;
  for I := 0 to FUnits.Count - 1 do
  begin
    if FUnits[I].Id = LP.unit__id then
      cmbUnit.ItemIndex := I;
  end;
  srlPrice.Clear;
  for I := 0 to LP.BasePriceArr.Count - 1 do
  begin
    srlPrice.Add(LP.BasePriceArr[I].Price, DateToStr(LP.BasePriceArr[I].DateTime));
  end;
end;

procedure TfrmEditPosition.LoadViewUnit;
var
  I: Integer;
begin
  cmbUnit.Clear;

  FUnits := ViewControl.GetUnits;
  for I := 0 to FUnits.Count - 1 do
    cmbUnit.Items.Add(FUnits[I].Name);
end;

procedure TfrmEditPosition.UniFormAfterShow(Sender: TObject);
begin
  LoadViewUnit;
  if Self.Tag > 0 then
  begin
    LoadPosition;
  end
  else
  begin

  end;
end;

end.

