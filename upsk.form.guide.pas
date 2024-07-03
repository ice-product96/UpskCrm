unit upsk.form.guide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniPanel, uniLabel, uniTabControl, uniPageControl, uniEdit,
  uniDateTimePicker, uniGroupBox, uniButton, uniMultiItem, uniListBox,
  uniComboBox, Vcl.Menus, uniMainMenu, uniBasicGrid, uniDBGrid, Data.DB, MemDS,
  DBAccess, upsk.form.guide.editPartPersone, upsk.form.guide.editPartEntity,
  upsk.form.guide.editPosition, Uni, upsk.form.guide.editRegion,
  upsk.form.guide.editSklad, upsk.globalMetod, upsk.types,
  upsk.form.guide.edtDriver, upsk.form.guide.editAuto;

type
  TfrmGuide = class(TUniForm)
    pnlMenu: TUniPanel;
    lblPartEntity: TUniLabel;
    lblPartPerson: TUniLabel;
    lblUsers: TUniLabel;
    lblRegions: TUniLabel;
    lblSklad: TUniLabel;
    pcPages: TUniPageControl;
    pgPartPerson: TUniTabSheet;
    pgPartEntity: TUniTabSheet;
    pgRegion: TUniTabSheet;
    pgSklad: TUniTabSheet;
    pgUsers: TUniTabSheet;
    gridPersone: TUniDBGrid;
    gridEntyti: TUniDBGrid;
    popPersone: TUniPopupMenu;
    unmntmN1: TUniMenuItem;
    unmntmN2: TUniMenuItem;
    unmntmN3: TUniMenuItem;
    popEntity: TUniPopupMenu;
    unmntmN11: TUniMenuItem;
    unmntmN21: TUniMenuItem;
    unmntmN31: TUniMenuItem;
    qryPersone: TUniQuery;
    qryEntity: TUniQuery;
    UniHiddenPanel1: TUniHiddenPanel;
    dsEntity: TUniDataSource;
    dsPersone: TUniDataSource;
    gridUsers: TUniDBGrid;
    gridRegion: TUniDBGrid;
    gridSklad: TUniDBGrid;
    lblPosition: TUniLabel;
    pgPosition: TUniTabSheet;
    gridPosition: TUniDBGrid;
    lblKef: TUniLabel;
    qryPosition: TUniQuery;
    dsPosition: TUniDataSource;
    popPosition: TUniPopupMenu;
    unmntmN12: TUniMenuItem;
    unmntmN22: TUniMenuItem;
    unmntmN32: TUniMenuItem;
    qryRegion: TUniQuery;
    dsRegion: TUniDataSource;
    popRegion: TUniPopupMenu;
    unmntmN121: TUniMenuItem;
    unmntmN221: TUniMenuItem;
    unmntmN321: TUniMenuItem;
    popSklad: TUniPopupMenu;
    mn1: TUniMenuItem;
    mn2: TUniMenuItem;
    mn3: TUniMenuItem;
    qrySklad: TUniQuery;
    dsSklad: TUniDataSource;
    popUser: TUniPopupMenu;
    mn11: TUniMenuItem;
    mn21: TUniMenuItem;
    mn31: TUniMenuItem;
    qryUser: TUniQuery;
    dsUser: TUniDataSource;
    pgKef: TUniTabSheet;
    popKef: TUniPopupMenu;
    mn111: TUniMenuItem;
    mn211: TUniMenuItem;
    mn311: TUniMenuItem;
    qryKef: TUniQuery;
    dsKef: TUniDataSource;
    gridKef: TUniDBGrid;
    edtFilterFio: TUniEdit;
    edtFilterSerial: TUniEdit;
    lblPackage: TUniLabel;
    pgPackage: TUniTabSheet;
    popPackage: TUniPopupMenu;
    mi1: TUniMenuItem;
    mi2: TUniMenuItem;
    mi3: TUniMenuItem;
    qryPackage: TUniQuery;
    dsPackage: TUniDataSource;
    gridPackage: TUniDBGrid;
    lblOrgan: TUniLabel;
    lblDiscount: TUniLabel;
    pgOrgan: TUniTabSheet;
    pgDiscount: TUniTabSheet;
    gridOrgan: TUniDBGrid;
    popOrgan: TUniPopupMenu;
    mi11: TUniMenuItem;
    mi21: TUniMenuItem;
    mi31: TUniMenuItem;
    qryOrgan: TUniQuery;
    dsOrgan: TUniDataSource;
    popDiscount: TUniPopupMenu;
    mi111: TUniMenuItem;
    mi211: TUniMenuItem;
    mi311: TUniMenuItem;
    qryDiscount: TUniQuery;
    dsDiscount: TUniDataSource;
    gridDiscount: TUniDBGrid;
    lblDriver: TUniLabel;
    pgDriver: TUniTabSheet;
    gridDriver: TUniDBGrid;
    popDriver: TUniPopupMenu;
    unmntm1: TUniMenuItem;
    unmntm2: TUniMenuItem;
    unmntm3: TUniMenuItem;
    qryDriver: TUniQuery;
    dsDriver: TUniDataSource;
    pgAuto: TUniTabSheet;
    lblAuto: TUniLabel;
    popAuto: TUniPopupMenu;
    unmntm11: TUniMenuItem;
    unmntm21: TUniMenuItem;
    unmntm31: TUniMenuItem;
    qryAuto: TUniQuery;
    dsAuto: TUniDataSource;
    gridAuto: TUniDBGrid;
    procedure lblUsersClick(Sender: TObject);
    procedure lblPartPersonClick(Sender: TObject);
    procedure lblPartEntityClick(Sender: TObject);
    procedure lblRegionsClick(Sender: TObject);
    procedure lblSkladClick(Sender: TObject);
    procedure gridPersoneMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridEntytiMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure unmntmN1Click(Sender: TObject);
    procedure unmntmN11Click(Sender: TObject);
    procedure unmntmN2Click(Sender: TObject);
    procedure unmntmN3Click(Sender: TObject);
    procedure unmntmN21Click(Sender: TObject);
    procedure unmntmN31Click(Sender: TObject);
    procedure lblPositionClick(Sender: TObject);
    procedure gridPositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure unmntmN12Click(Sender: TObject);
    procedure unmntmN22Click(Sender: TObject);
    procedure unmntmN32Click(Sender: TObject);
    procedure gridRegionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure unmntmN121Click(Sender: TObject);
    procedure unmntmN221Click(Sender: TObject);
    procedure unmntmN321Click(Sender: TObject);
    procedure mn1Click(Sender: TObject);
    procedure mn2Click(Sender: TObject);
    procedure mn3Click(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure pcPagesChangeValue(Sender: TObject);
    procedure mn11Click(Sender: TObject);
    procedure mn21Click(Sender: TObject);
    procedure mn31Click(Sender: TObject);
    procedure gridUsersMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lblKefClick(Sender: TObject);
    procedure gridKefMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mn111Click(Sender: TObject);
    procedure mn211Click(Sender: TObject);
    procedure mn311Clic(Sender: TObject);
    procedure gridSkladMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
    procedure lblPackageClick(Sender: TObject);
    procedure mi1Click(Sender: TObject);
    procedure mi2Click(Sender: TObject);
    procedure gridPackageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mi3Click(Sender: TObject);
    procedure mi11Click(Sender: TObject);
    procedure mi21Click(Sender: TObject);
    procedure mi31Click(Sender: TObject);
    procedure gridOrganMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridDiscountMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mi111Click(Sender: TObject);
    procedure mi211Click(Sender: TObject);
    procedure mi311Click(Sender: TObject);
    procedure lblOrganClick(Sender: TObject);
    procedure lblDiscountClick(Sender: TObject);
    procedure lblDriverClick(Sender: TObject);
    procedure lblAutoClick(Sender: TObject);
    procedure unmntm2Click(Sender: TObject);
    procedure unmntm1Click(Sender: TObject);
    procedure unmntm3Click(Sender: TObject);
    procedure unmntm11Click(Sender: TObject);
    procedure unmntm21Click(Sender: TObject);
    procedure unmntm31Click(Sender: TObject);
    procedure gridAutoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridDriverMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    Fqry: TUniQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

function frmGuide: TfrmGuide;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.form.guide.editUser,
  upsk.form.guide.editKef, upsk.form.guide.editPackage, unigui.helpers,
  upsk.form.guide.editOrgan, upsk.form.guide.editDiscount, upsk.viewcontrol;

function frmGuide: TfrmGuide;
begin
  Result := TfrmGuide(UniMainModule.GetFormInstance(TfrmGuide));
end;

procedure TfrmGuide.gridDiscountMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popDiscount.Popup(X, Y, gridDiscount);
end;

procedure TfrmGuide.gridDriverMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popDriver.Popup(X, Y, gridDriver);
end;

procedure TfrmGuide.gridEntytiMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    popEntity.Popup(X, Y, gridEntyti);
  end;
end;

procedure TfrmGuide.gridKefMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popKef.Popup(X, Y, gridKef);
end;

procedure TfrmGuide.gridOrganMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popOrgan.Popup(X, Y, gridOrgan);
end;

procedure TfrmGuide.gridAutoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popAuto.Popup(X, Y, gridAuto);
end;

procedure TfrmGuide.gridColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
  if Sender.DataSource.DataSet.Active then
  begin

    (Sender.DataSource.DataSet as TUniQuery).Params.ParamValues[Column.FieldName] := '%' + AnsiLowerCase(Value) + '%';
    Sender.DataSource.DataSet.Refresh;
  end;

end;

procedure TfrmGuide.gridPackageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popPackage.Popup(X, Y, gridPackage);
end;

procedure TfrmGuide.gridPersoneMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    popPersone.Popup(X, Y, gridPersone);
  end;
end;

procedure TfrmGuide.gridPositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    popPosition.Popup(X, Y, gridPosition);
end;

procedure TfrmGuide.gridRegionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
  begin
    popRegion.Popup(X, Y, gridRegion);
  end;
end;

procedure TfrmGuide.gridSkladMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popSklad.Popup(X, Y, gridSklad);
end;

procedure TfrmGuide.gridUsersMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popUser.Popup(X, Y, gridUsers);
end;

procedure TfrmGuide.lblAutoClick(Sender: TObject);
begin
  pcPages.ActivePage := pgAuto;
end;

procedure TfrmGuide.lblDiscountClick(Sender: TObject);
begin
  pcPages.ActivePage := pgDiscount;
end;

procedure TfrmGuide.lblDriverClick(Sender: TObject);
begin
  pcPages.ActivePage := pgDriver;
end;

procedure TfrmGuide.lblKefClick(Sender: TObject);
begin
  pcPages.ActivePage := pgKef;
end;

procedure TfrmGuide.lblOrganClick(Sender: TObject);
begin
  pcPages.ActivePage := pgOrgan;
end;

procedure TfrmGuide.lblPackageClick(Sender: TObject);
begin
  pcPages.ActivePage := pgPackage;
end;

procedure TfrmGuide.lblPartEntityClick(Sender: TObject);
begin
  pcPages.ActivePage := pgPartEntity;

end;

procedure TfrmGuide.lblPartPersonClick(Sender: TObject);
begin
  pcPages.ActivePage := pgPartPerson;

end;

procedure TfrmGuide.lblPositionClick(Sender: TObject);
begin
  pcPages.ActivePage := pgPosition;

end;

procedure TfrmGuide.lblRegionsClick(Sender: TObject);
begin
  pcPages.ActivePage := pgRegion;
end;

procedure TfrmGuide.lblSkladClick(Sender: TObject);
begin
  pcPages.ActivePage := pgSklad;
end;

procedure TfrmGuide.lblUsersClick(Sender: TObject);
begin
  pcPages.ActivePage := pgUsers;
end;

procedure TfrmGuide.mi111Click(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditDiscount,
  procedure(ares: integer)
  begin
    gridDiscount.DataSource.DataSet.Refresh;
  end));
end;

procedure TfrmGuide.mi11Click(Sender: TObject);
begin

  CreateAndShowModalForm(TfrmEditEntity,
    procedure(ares: integer)
    begin
      gridOrgan.DataSource.DataSet.Refresh;
    end).SetValue([cp('Organ', true)]);

end;

procedure TfrmGuide.mi1Click(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditPackage,
  procedure(aRes: integer)
  begin
    gridPackage.DataSource.DataSet.Refresh;
  end).SetTag(0));

end;

procedure TfrmGuide.mi211Click(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditDiscount,
  procedure(ares: integer)
  begin
    gridDiscount.DataSource.DataSet.Refresh;
  end).SetTag(gridDiscount.DataSource.DataSet.FieldByName('id').AsInteger));
end;

procedure TfrmGuide.mi21Click(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditOrgan,
  procedure(ares: integer)
  begin
    gridOrgan.DataSource.DataSet.Refresh;
  end).SetTag(gridOrgan.DataSource.DataSet.FieldByName('id').AsInteger));
end;

procedure TfrmGuide.mi2Click(Sender: TObject);
begin
  (CreateAndShowModalForm(TfrmEditPackage,
  procedure(aRes: integer)
  begin
    gridPackage.DataSource.DataSet.Refresh;
  end).SetTag(gridPackage.DataSource.DataSet.FieldByName('id').AsInteger));

end;

procedure TfrmGuide.mi311Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridDiscount.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteDiscount(gridDiscount.DataSource.DataSet.FieldByName('id').AsInteger);
            gridDiscount.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.mi31Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridOrgan.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteOrgan(gridOrgan.DataSource.DataSet.FieldByName('id').AsInteger);
            gridOrgan.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.mi3Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridPackage.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeletePackage(gridPackage.DataSource.DataSet.FieldByName('id').AsInteger);
            gridPackage.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.mn111Click(Sender: TObject);
var
  f: TfrmEditKef;
begin
  f := TfrmEditKef.Create(UniApplication);
  try
    f.ShowModal();
    gridKef.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;
end;

procedure TfrmGuide.mn11Click(Sender: TObject);
var
  f: TfrmEditUser;
begin
  f := TfrmEditUser.Create(UniApplication);
  try
    f.ShowModal();
    gridUsers.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;
end;

procedure TfrmGuide.mn1Click(Sender: TObject);
var
  f: TfrmEditSklad;
begin
  f := TfrmEditSklad.Create(UniApplication);
  try
    f.ShowModal();
    gridSklad.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;
end;

procedure TfrmGuide.mn211Click(Sender: TObject);
var
  f: TfrmEditKef;
begin
  f := TfrmEditKef.Create(UniApplication);
  try
    f.Tag := gridKef.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridKef.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;
end;

procedure TfrmGuide.mn21Click(Sender: TObject);
var
  f: TfrmEditUser;
begin
  f := TfrmEditUser.Create(UniApplication);
  try
    f.Tag := gridUsers.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridUsers.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;

end;

procedure TfrmGuide.mn2Click(Sender: TObject);
var
  f: TfrmEditSklad;
begin
  f := TfrmEditSklad.Create(UniApplication);
  try
    f.Tag := gridSklad.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridSklad.DataSource.DataSet.Refresh;

  finally
    f.Free;
  end;

end;

procedure TfrmGuide.mn311Clic(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridKef.DataSource.DataSet.FieldByName('id').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteKef(gridKef.DataSource.DataSet.FieldByName('id').AsInteger);
            gridKef.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.mn31Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridUsers.DataSource.DataSet.FieldByName('fio').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteUser(gridUsers.DataSource.DataSet.FieldByName('id').AsInteger);
            gridUsers.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.mn3Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridSklad.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteSklad(gridSklad.DataSource.DataSet.FieldByName('id').AsInteger);
            gridSklad.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.pcPagesChangeValue(Sender: TObject);
begin
  if Fqry <> nil then
  begin
    Fqry.Close;
  end;
  case pcPages.ActivePageIndex of
    0:
      Fqry := qryPersone;
    1:
      Fqry := qryEntity;
    2:
      Fqry := qryRegion;
    3:
      Fqry := qrySklad;
    4:
      Fqry := qryUser;
    5:
      Fqry := qryPosition;
    6:
      Fqry := qrykef;
    7:
      Fqry := qryPackage;
    8:
      Fqry := qryOrgan;
    9:
      Fqry := qryDiscount;
    10:
      Fqry := qryDriver;
    11:
      Fqry := qryAuto;
  end;
  Fqry.Connection := uniMainModule.dbUpsk;
  Fqry.Open;

end;

procedure TfrmGuide.UniFormAfterShow(Sender: TObject);
begin
  Fqry := nil;
  pcPages.OnChangeValue(Sender);
end;

procedure TfrmGuide.unmntm11Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditAuto,
    procedure(aRes: integer)
    begin
      gridAuto.DataSource.DataSet.Refresh;

    end).SetTag(0);
end;

procedure TfrmGuide.unmntm1Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditDriver,
    procedure(aRes: integer)
    begin
      gridDriver.DataSource.DataSet.Refresh;

    end).SetTag(0);
end;

procedure TfrmGuide.unmntm21Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditAuto,
    procedure(aRes: integer)
    begin
      gridAuto.DataSource.DataSet.Refresh;

    end).SetTag(gridAuto.DataSource.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrmGuide.unmntm2Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditDriver,
    procedure(aRes: integer)
    begin
      gridDriver.DataSource.DataSet.Refresh;

    end).SetTag(gridDriver.DataSource.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrmGuide.unmntm31Click(Sender: TObject);
var
  Ld: TViewOrmControl<TAuto>;
begin
  Ld.Del(gridAuto.DataSource.DataSet.FieldByName('id').AsInteger);
  gridAuto.DataSource.DataSet.Refresh;
end;

procedure TfrmGuide.unmntm3Click(Sender: TObject);
var
  Ld: TViewOrmControl<TDriver>;
begin
  Ld.Del(gridDriver.DataSource.DataSet.FieldByName('id').AsInteger);
  gridDriver.DataSource.DataSet.Refresh;
end;

procedure TfrmGuide.unmntmN11Click(Sender: TObject);
var
  f: TfrmEditEntity;
begin
  f := TfrmEditEntity.Create(UniApplication);
  try
    f.ShowModal();
    gridEntyti.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN121Click(Sender: TObject);
var
  f: TfrmEditRegion;
begin
  f := TfrmEditRegion.Create(UniApplication);
  try
    f.ShowModal();
    gridRegion.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;

end;

procedure TfrmGuide.unmntmN12Click(Sender: TObject);
var
  f: TfrmEditPosition;
begin
  f := TfrmEditPosition.Create(UniApplication);
  try
    f.ShowModal();
    gridPosition.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN1Click(Sender: TObject);
var
  f: TfrmEditPart;
begin
  f := TfrmEditPart.Create(UniApplication);
  try
    if f.ShowModal() = mrOk then
    begin

    end;
    gridPersone.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN21Click(Sender: TObject);
var
  f: TfrmEditEntity;
begin
  f := TfrmEditEntity.Create(UniApplication);
  try
    f.Tag := gridEntyti.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridEntyti.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN221Click(Sender: TObject);
var
  f: TfrmEditRegion;
begin
  f := TfrmEditRegion.Create(UniApplication);
  try
    f.Tag := gridRegion.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridRegion.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;

end;

procedure TfrmGuide.unmntmN22Click(Sender: TObject);
var
  f: TfrmEditPosition;
begin
  f := TfrmEditPosition.Create(UniApplication);
  try
    f.Tag := gridPosition.DataSource.DataSet.FieldByName('id').AsInteger;
    f.ShowModal();
    gridPosition.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN2Click(Sender: TObject);
var
  f: TfrmEditPart;
begin
  f := TfrmEditPart.Create(UniApplication);
  try
    f.Tag := gridPersone.DataSource.DataSet.FieldByName('id').AsInteger;
    if f.ShowModal() = mrOk then
    begin

    end;
    gridPersone.DataSource.DataSet.Refresh;
  finally
    f.Free;
  end;
end;

procedure TfrmGuide.unmntmN31Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridEntyti.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteEntity(gridEntyti.DataSource.DataSet.FieldByName('id').AsInteger);
            gridEntyti.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.unmntmN321Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridRegion.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeleteRegion(gridRegion.DataSource.DataSet.FieldByName('id').AsInteger);
            gridRegion.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);

end;

procedure TfrmGuide.unmntmN32Click(Sender: TObject);
begin
  MessageDlg('Удалить ' + gridPosition.DataSource.DataSet.FieldByName('name').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeletePosition(gridPosition.DataSource.DataSet.FieldByName('id').AsInteger);
            gridPosition.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

procedure TfrmGuide.unmntmN3Click(Sender: TObject);
begin

  MessageDlg('Удалить ' + gridPersone.DataSource.DataSet.FieldByName('fio').AsString + '?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            ViewControl.DeletePersone(gridPersone.DataSource.DataSet.FieldByName('id').AsInteger);
            gridPersone.DataSource.DataSet.Refresh;
          end;
        mrNo:


      end;
    end);
end;

end.

