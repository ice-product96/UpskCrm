unit upsk.form.guide.editPackage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniButton,
  uniBasicGrid, uniStringGrid, uniGUIBaseClasses, uniEdit, uniLabel, uniDBGrid,
  Data.DB, MemDS, DBAccess, Uni, uniMultiItem, uniComboBox, uniPanel, upsk.types,
  upsk.globalMetod, Datasnap.DBClient;

type
  TfrmEditPackage = class(TUniForm)
    edtName: TUniEdit;
    btnAdd: TUniButton;
    btnDelete: TUniButton;
    btnAccept: TUniButton;
    btnCancel: TUniButton;
    gridPackage: TUniDBGrid;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    dsPackage: TUniDataSource;
    unhdnpnl1: TUniHiddenPanel;
    cmbPosition: TUniComboBox;
    clPackage: TClientDataSet;
    fldPackageposition_id: TIntegerField;
    fldPackageposition_name: TStringField;
    fldPackageid: TIntegerField;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure gridPackageSetCellValue(Sender: TObject; ACol, ARow: Integer; AField: TField; var Value: Variant);
    procedure UniFormAfterShow(Sender: TObject);

  private
    FPostionArr: TPositionArr;
    procedure UpdateViewGridPosition;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditPackage: TfrmEditPackage;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditPackage: TfrmEditPackage;
begin
  Result := TfrmEditPackage(UniMainModule.GetFormInstance(TfrmEditPackage));
end;

procedure TfrmEditPackage.btnAcceptClick(Sender: TObject);
var
  Lp: Tpackage;
  Lpb: Tpackage_build;
begin
  Lp.id := Self.Tag;
  Lp.name := edtName.Text;
  gridPackage.DataSource.DataSet.First;
  Lp.packageBuildArr.Clear;

  while not gridPackage.DataSource.DataSet.Eof do
  begin
    Lpb.id := gridPackage.DataSource.DataSet.FieldByName('id').AsInteger;
    Lpb.package_id := Lp.id;
    Lpb.position_id := gridPackage.DataSource.DataSet.FieldByName('position_id').AsInteger;
    Lp.packageBuildArr.Add(Lpb);
    gridPackage.DataSource.DataSet.Next;
  end;

  if Lp.id = 0 then
  begin
    ViewControl.InsertPackage(Lp);
  end
  else
  begin
    ViewControl.Updatepackage(Lp);
  end;

  ModalResult := mrOk;
end;

procedure TfrmEditPackage.btnAddClick(Sender: TObject);
begin
  gridPackage.DataSource.DataSet.Edit;
  gridPackage.DataSource.DataSet.Append;
end;

procedure TfrmEditPackage.btnDeleteClick(Sender: TObject);
begin
  ViewControl.DeletePackageBuild(gridPackage.DataSource.DataSet.FieldByName('id').AsInteger);
  gridPackage.DataSource.DataSet.Delete;

end;

procedure TfrmEditPackage.gridPackageSetCellValue(Sender: TObject; ACol, ARow: Integer; AField: TField; var Value: Variant);
var
  Ldata: THelpData<TPosition>;
begin
  gridPackage.DataSource.DataSet.Edit;
  gridPackage.DataSource.DataSet.FieldByName('position_id').AsInteger := Ldata.GetDataFromFieldName(FPostionArr, 'name', Value, 'id');
  gridPackage.DataSource.DataSet.FieldByName('position_name').AsString := Value;
  gridPackage.DataSource.DataSet.Post;

end;

procedure TfrmEditPackage.UniFormAfterShow(Sender: TObject);
var
  Lp: Tpackage;
  I: Integer;
begin
  UpdateViewGridPosition;
  if Self.Tag > 0 then
  begin
    Lp := ViewControl.GetPackage(self.tag);
    edtName.Text := Lp.name;
    gridPackage.DataSource.DataSet.Edit;
    for I := 0 to Lp.packageBuildArr.Count - 1 do
    begin
      gridPackage.DataSource.DataSet.Append;
      gridPackage.DataSource.DataSet.FieldByName('position_id').AsInteger := Lp.packageBuildArr[I].Position.id;
      gridPackage.DataSource.DataSet.FieldByName('position_name').AsString := Lp.packageBuildArr[I].Position.name;
      gridPackage.DataSource.DataSet.FieldByName('id').AsInteger := Lp.packageBuildArr[I].id;
    end;
    gridPackage.DataSource.DataSet.Post;
  end;
end;

procedure TfrmEditPackage.UpdateViewGridPosition;
var
  I: Integer;
  LData: THelpData<TPosition>;
begin
  FPostionArr := ViewControl.GetPositionArr;
//  cmbPosition.Clear;
//  for I := 0 to pred(FPostionArr.Count) do
//  begin
//    cmbPosition.Items.Add(FPostionArr[I].name);
//  end;
  LData.AddDataCombox(cmbPosition, FPostionArr, 'name');
end;

end.

