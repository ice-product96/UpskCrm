unit upsk.form.documents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, Data.DB, DBAccess,
  Uni, MemDS, Vcl.Menus, uniMainMenu, uniEdit, uniButton, uniLabel,
  unigui.helpers, upsk.viewcontrol, upsk.types, uniMultiItem, uniComboBox;

type
  TfrmDocuments = class(TUniForm)
    pcDoc: TUniPageControl;
    pgContract: TUniTabSheet;
    gridDoc: TUniDBGrid;
    qryDoc: TUniQuery;
    dsDoc: TUniDataSource;
    popDoc: TUniPopupMenu;
    unmntmN1: TUniMenuItem;
    unmntmN2: TUniMenuItem;
    pnlTop: TUniPanel;
    pgSpec: TUniTabSheet;
    pgAkt: TUniTabSheet;
    pgAktBack: TUniTabSheet;
    pgCashIn: TUniTabSheet;
    pgExpenseOrder: TUniTabSheet;
    lbl1: TUniLabel;
    pgOrder: TUniTabSheet;
    pgExpensPosition: TUniTabSheet;
    pgRefaundPosition: TUniTabSheet;
    cmbPart: TUniComboBox;
    gridSpec: TUniDBGrid;
    gridAkt: TUniDBGrid;
    gridAkIn: TUniDBGrid;
    gridOrder: TUniDBGrid;
    gridCashIn: TUniDBGrid;
    gridExpens: TUniDBGrid;
    gridRefaund: TUniDBGrid;
    gridCashOut: TUniDBGrid;
    popSpec: TUniPopupMenu;
    unmntmN3: TUniMenuItem;
    unmntmN4: TUniMenuItem;
    unmntmN5: TUniMenuItem;
    unmntmN6: TUniMenuItem;

    procedure UniFormAfterShow(Sender: TObject);
    procedure gridDocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure unmntmN1Click(Sender: TObject);
    procedure UpdatePartView;
    procedure cmbPartSelect(Sender: TObject);
    procedure ClearDs;
    procedure UpdateTables;
    procedure pcDocChange(Sender: TObject);
    procedure gridSpecMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    Fe: TPartEntityArr;
    FPart_id: integer;
    { Private declarations }
  public
  published
    property part_id: integer read FPart_id write FPart_id;
    { Public declarations }
  end;

function frmDocuments: TfrmDocuments;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, upsk.globalMetod,
  upsk.form.document.editContract;

function frmDocuments: TfrmDocuments;
begin
  Result := TfrmDocuments(UniMainModule.GetFormInstance(TfrmDocuments));
end;

procedure TfrmDocuments.ClearDs;
begin
  gridDoc.DataSource := nil;
  gridSpec.DataSource := nil;
  gridAkt.DataSource := nil;
  gridOrder.DataSource := nil;
  gridAkIn.DataSource := nil;
  gridOrder.DataSource := nil;
  gridExpens.DataSource := nil;
  gridRefaund.DataSource := nil;
  gridCashOut.DataSource := nil;
end;

procedure TfrmDocuments.cmbPartSelect(Sender: TObject);
begin
  UpdateTables;
end;

procedure TfrmDocuments.gridDocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
    popDoc.Popup(X, Y, gridDoc);
end;

procedure TfrmDocuments.gridSpecMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
  begin
    popSpec.Popup(X, Y, gridSpec);
  end;
end;

procedure TfrmDocuments.pcDocChange(Sender: TObject);
begin
  UpdateTables;
end;

procedure TfrmDocuments.UniFormAfterShow(Sender: TObject);
begin
  UpdatePartView;
  cmbPart.OnSelect(self);
end;

procedure TfrmDocuments.unmntmN1Click(Sender: TObject);
begin
  CreateAndShowModalForm(TfrmEditContract).SetTag(gridDoc.DataSource.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrmDocuments.UpdatePartView;
var
  lh: THelpData<Tpart_entity>;
  LOrmE: TViewOrmControl<Tpart_entity>;
begin
  Fe := LOrmE.GetObjArr;
  cmbPart.Clear;
  lh.AddDataCombox(cmbPart, fe, 'name');
  cmbPart.Text := lh.GetDataFromFieldName(Fe, 'id', FPart_id, 'name');
end;

procedure TfrmDocuments.UpdateTables;
var
  lh: THelpData<Tpart_entity>;
begin
  ClearDs;
  qryDoc.Close;
  case pcDoc.ActivePageIndex of
    0:
      begin
        gridDoc.DataSource := dsDoc;
        qryDoc.SQL.Text := 'SELECT * from contract where part_id=:part_id and part_type=:part_type and del=0';
      end;
    1:
      begin
        gridSpec.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select  s.id , s.`number` ,s.device_name  from spec s ' + 'left join document d  on d.spec_id=s.id ' + 'left join contract c on d.contract_id =c.id  ' + 'where c.part_id = :part_id and c.part_type =:part_type and s.del=0';
      end;
    2:
      begin
        gridAkt.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select  ao.id , ao.`number`  from akt_out ao left join document d  on d.akt_out_id =ao.id  ' + 'left join contract c on d.contract_id =c.id  ' + 'where c.part_id = :part_id and c.part_type =:part_type and ao.del=0';
      end;
    3:
      begin
        gridAkIn.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select  ai.id , ai.`number`  from akt_in ai left join document d  on d.akt_in_id =ai.id  ' + 'left join contract c on d.contract_id =c.id  ' + 'where c.part_id = :part_id and c.part_type =:part_type and ai.del=0';
      end;
    4:
      begin
        gridOrder.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select  o.id , c.part_name , o.`date` , sum(op.pos_count*op.pos_price) as amount from `order` o  ' + 'left join document d  on o.document_id =d.id ' + 'left join contract c on d.contract_id =c.id ' + 'left join order_pos op on op.order_id = o.id ' + 'where c.part_id = :part_id and c.part_type =:part_type and o.del=0 group by o.id ';
      end;
    5:
      begin
        gridCashIn.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select ci.id,c.part_name,ci.`date` , ci.amount,cii.name   from cash_in ci left join cash_in_items cii on ci.cash_in_items_id =cii .id left join deal d on ci.deal_id =d.id ' + 'left join document do  on d.document_id =do.id  ' + 'left join contract c on do.contract_id =c.id ' + 'where  c.part_id = :part_id and c.part_type =:part_type and ci.del=0';
      end;
    6:
      begin
        gridCashOut.DataSource := dsDoc;
        qryDoc.SQL.Text := 'select ci.id,c.part_name,ci.`date` , ci.amount,cii.name   from cash_out ci left join cash_out_items cii on ci.cash_out_items_id =cii .id left join deal d on ci.deal_id =d.id ' + 'left join document do  on d.document_id =do.id  ' + 'left join contract c on do.contract_id =c.id ' + 'where  c.part_id = :part_id and c.part_type =:part_type and ci.del=0';
      end;
    7:
      begin
        gridExpens.DataSource := dsDoc;
        qryDoc.SQL.Text := 'SELECT se.id, se.doc_date, s.number AS snumber ' + 'FROM sklad_expense se ' + 'LEFT JOIN deal dl ON se.deal_id = dl.id ' + 'LEFT JOIN document d ON dl.document_id = d.id ' + 'LEFT JOIN spec s ON d.spec_id = s.id ' + 'LEFT JOIN contract c ON d.contract_id = c.id ' + 'WHERE  c.part_id = :part_id and c.part_type =:part_type ' + 'GROUP BY se.deal_id;';
      end;
    8:
      begin
        gridRefaund.DataSource := dsDoc;
        qryDoc.SQL.Text := 'SELECT se.id, se.doc_date, s.number AS snumber ' + 'FROM sklad_arrival se ' + 'LEFT JOIN deal dl ON se.deal_id = dl.id ' + 'LEFT JOIN document d ON dl.document_id = d.id ' + 'LEFT JOIN spec s ON d.spec_id = s.id ' + 'LEFT JOIN contract c ON d.contract_id = c.id ' + 'WHERE  c.part_id = :part_id and c.part_type =:part_type ' + 'GROUP BY se.deal_id;';
      end;

  end;

  qryDoc.ParamByName('part_id').AsInteger := lh.GetDataFromFieldName(Fe, 'name', cmbPart.Text, 'id');
  qryDoc.ParamByName('part_type').AsInteger := 2;
  qryDoc.Open;
end;

end.

