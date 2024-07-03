{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  UPSK;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {frmMain: TUniForm},
  upsk.form.guide in 'upsk.form.guide.pas' {frmGuide: TUniForm},
  upsk.viewcontrol in 'upsk.viewcontrol.pas',
  upsk.form.guide.editPartPersone in 'upsk.form.guide.editPartPersone.pas' {frmEditPart: TUniForm},
  upsk.form.guide.editPartEntity in 'upsk.form.guide.editPartEntity.pas' {frmEditEntity: TUniForm},
  upsk.types in 'upsk.types.pas',
  upsk.datamanager in 'upsk.datamanager.pas',
  upsk.globalMetod in 'upsk.globalMetod.pas',
  upsk.form.guide.editPosition in 'upsk.form.guide.editPosition.pas' {frmEditPosition: TUniForm},
  upsk.form.guide.editRegion in 'upsk.form.guide.editRegion.pas' {frmEditRegion: TUniForm},
  upsk.form.guide.editSklad in 'upsk.form.guide.editSklad.pas' {frmEditSklad: TUniForm},
  upsk.form.guide.editUser in 'upsk.form.guide.editUser.pas' {frmEditUser: TUniForm},
  upsk.form.sklad in 'upsk.form.sklad.pas' {frmSklad: TUniForm},
  upsk.form.reqclac.lrsp200 in 'upsk.form.reqclac.lrsp200.pas' {frmReqCalcLrsp200: TUniForm},
  unigui.helpers in '..\tools\unigui.helpers.pas',
  ArrayHelper in '..\IceNet\ArrayHelper.pas',
  upsk.form.sklad.arrival in 'upsk.form.sklad.arrival.pas' {frmArrival: TUniForm},
  upsk.form.sklad.expense in 'upsk.form.sklad.expense.pas' {frmExpense: TUniForm},
  upsk.form.sklad.history in 'upsk.form.sklad.history.pas' {frmSkladHistory: TUniForm},
  upsk.form.guide.editPackage in 'upsk.form.guide.editPackage.pas' {frmEditPackage: TUniForm},
  upsk.form.guide.editOrgan in 'upsk.form.guide.editOrgan.pas' {frmEditOrgan: TUniForm},
  upsk.form.guide.editDiscount in 'upsk.form.guide.editDiscount.pas' {frmEditDiscount: TUniForm},
  upsk.form.document.editContract in 'upsk.form.document.editContract.pas' {frmEditContract: TUniForm},
  upsk.const_ in 'upsk.const_.pas',
  upsk.form.documents in 'upsk.form.documents.pas' {frmDocuments: TUniForm},
  upsk.form.deal in 'upsk.form.deal.pas' {frmDeal: TUniForm},
  upsk.form.deal.edit in 'upsk.form.deal.edit.pas' {frmEditDeal: TUniForm},
  upsk.frame.contact_item in 'upsk.frame.contact_item.pas' {fmContact: TUniFrame},
  upsk.form.documents.editSpec in 'upsk.form.documents.editSpec.pas' {frmEditSpec: TUniForm},
  upsk.form.document.editorder in 'upsk.form.document.editorder.pas' {frmOrder: TUniForm},
  upsk.form.guide.edtDriver in 'upsk.form.guide.edtDriver.pas' {frmEditDriver: TUniForm},
  upsk.form.guide.editAuto in 'upsk.form.guide.editAuto.pas' {frmEditAuto: TUniForm},
  upsk.form.deal.editDelivery in 'upsk.form.deal.editDelivery.pas' {frmEditDelivery: TUniForm},
  upsk.form.deal.edtSkladpas in 'upsk.form.deal.edtSkladpas.pas' {frmEditPosSklad: TUniForm},
  upsk.form.deal.editCash in 'upsk.form.deal.editCash.pas' {frmEditCash: TUniForm},
  upsk.form.reqclac in 'upsk.form.reqclac.pas' {UniForm1: TUniForm},
  Num2Text in 'Num2Text.pas',
  IceOrm.Sql in 'ORM_2\IceOrm.Sql.pas',
  u_wCodeTrace in '..\tools\cTraceManager-main\Common\u_wCodeTrace.pas',
  IceOrm.database in 'ORM_2\IceOrm.database.pas',
  IceOrm in 'ORM_2\IceOrm.pas',
  IceOrm.types in 'ORM_2\IceOrm.types.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
