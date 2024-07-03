unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel, Vcl.Imaging.pngimage,
  upsk.types, upsk.viewcontrol, uniImage, uniChart, Vcl.Imaging.jpeg,
  uniBasicGrid, uniDBGrid;

type
  TfrmMain = class(TUniForm)
    pnlMenu: TUniPanel;
    imgBackground: TUniImage;
    lblmnMain: TUniLabel;
    lblDeal: TUniLabel;
    lblmnSklad: TUniLabel;
    lblmnReports: TUniLabel;
    lblmnGuide: TUniLabel;
    pnlBotMinWindow: TUniPanel;
    lblDocuments: TUniLabel;
    gridMain: TUniDBGrid;
    procedure lblmnGuideClick(Sender: TObject);
    procedure lblDealClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure lblmnSkladClick(Sender: TObject);
    procedure lblDocumentsClick(Sender: TObject);
    procedure lblmnReportsClick(Sender: TObject);
    procedure lblmnMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, upsk.form.guide, upsk.datamanager,
  upsk.form.sklad, upsk.globalMetod, upsk.form.reqclac.lrsp200, unigui.helpers,
  upsk.form.documents, upsk.form.deal,upsk.form.reqclac;

function frmMain: TfrmMain;
begin
  Result := TfrmMain(UniMainModule.GetFormInstance(TfrmMain));
end;

procedure TfrmMain.lblDocumentsClick(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmDocuments)
end;

procedure TfrmMain.lblDealClick(Sender: TObject);
begin
  CreateAndShowForm(TfrmDeal);

end;

procedure TfrmMain.lblmnGuideClick(Sender: TObject);
var
  f: TfrmGuide;
begin
  f := TfrmGuide.Create(UniApplication);
  try
    if f.ShowModal() = mrOk then

  finally
    f.Free;
  end;
end;

procedure TfrmMain.lblmnMainClick(Sender: TObject);
begin
  CreateAndShowForm(TfrmReqCalc);
end;

procedure TfrmMain.lblmnReportsClick(Sender: TObject);
var
  Ld: Tdelivery;
  lo:TViewOrmControl<Tdelivery>;
  begin
 ld.deal_id:=1;
 ld.auto.id:=1;
 ld.driver.id:=2;
 ld.price:=99;
 ld.type_delivery.id:=3;
  lo.Insert(ld);
end;

procedure TfrmMain.lblmnSkladClick(Sender: TObject);
begin

  CreateAndShowForm(TfrmSklad);
end;

procedure TfrmMain.UniFormAfterShow(Sender: TObject);
begin
  ViewControl.LoginUser('root', '290522');

end;

initialization
  RegisterAppFormClass(TfrmMain);

end.

