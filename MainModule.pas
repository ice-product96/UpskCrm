unit MainModule;

interface

uses
  uniGUIMainModule,
  SysUtils,
  Classes,
  Data.DB,
  DBAccess,

  MemDS,upsk.viewcontrol, Uni, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet,upsk.globalMetod;

type
  TUniMainModule = class(TUniGUIMainModule)
    dbUpsk: TUniConnection;
    frxDoc: TfrxReport;
    frxExpPdf: TfrxPDFExport;
    frxSpec: TfrxReport;
    dsSpec: TfrxUserDataSet;
    frxAktOut: TfrxReport;
    dsAktOut: TfrxUserDataSet;
    frxAktIn: TfrxReport;
    frxdsAktIn: TfrxUserDataSet;
    frxOrder: TfrxReport;
    frxdsOrder: TfrxUserDataSet;
    procedure UniGUIMainModuleCreate(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewControl: TViewControl;


function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  uniGUIVars,
  ServerModule,
  uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin

dbUpsk.ConnectString := 'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=46.48.77.43;Database=upsk;Login Prompt=False';
//dbUpsk.ConnectString := 'Provider name=MySql;User ID=root;Password=Xspider43;Data Source=127.0.0.1;Database=upsk;Login Prompt=False';
end;

initialization
  RegisterMainModuleClass(TUniMainModule);

end.

