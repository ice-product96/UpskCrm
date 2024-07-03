unit upsk.form.deal.edtSkladpas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniButton,
  uniPanel, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, Data.DB, DBAccess, Uni,
  upsk.viewcontrol, upsk.types, MemDS, Datasnap.DBClient, upsk.datamanager,dateutils,
  System.Generics.Defaults, uniDateTimePicker, uniCheckBox, upsk.globalMetod,
  uniLabel, uniMemo, uniRadioGroup;

type
  TfrmEditPosSklad = class(TUniForm)
    gridPos: TUniDBGrid;
    pnlBot: TUniPanel;
    btnAccept: TUniButton;
    cdPosition: TClientDataSet;
    intgrfldPositionid: TIntegerField;
    strngfldPositionPositionName: TStringField;
    fltfldPositionremains: TFloatField;
    fltfldPositioncalc_count: TFloatField;
    intgrfldPositionposition_id: TIntegerField;
    dsPosition: TUniDataSource;
    dtOper: TUniDateTimePicker;
    chkAktOut: TUniCheckBox;
    mmoComment: TUniMemo;
    lbl1: TUniLabel;
    rgDoc: TUniRadioGroup;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure chkAktOutChange(Sender: TObject);
  private
    FDealId: integer;
    FSpecId: integer;
    FRegionId: Integer;
    FTypeEdit: integer;
    FRegion: TRegion;
    procedure Expense(aItemsId:integer);
    procedure Arrival(aItemsId:integer);
    procedure NotRefaund;
    procedure LoadPosExpens;
    procedure LoadPosArrival;
    { Private declarations }
  public
    procedure BuildAktIn;
    procedure updateStartRentalPeriod;
    { Public declarations }
  published
    property Spec_id: integer read FSpecId write FSpecId;
    property Deal_id: integer read FDealId write FDealId;
    property Region_id: Integer read FRegionId write FRegionId;
    property Type_edit: integer read FTypeEdit write FTypeEdit; //1-отшрузка 2- возврат
  end;

function frmEditPosSklad: TfrmEditPosSklad;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditPosSklad: TfrmEditPosSklad;
begin
  Result := TfrmEditPosSklad(UniMainModule.GetFormInstance(TfrmEditPosSklad));
end;

procedure TfrmEditPosSklad.Arrival(aItemsId:integer);
var
  LeArr: TSklad_ArrivalArr;
  le: TSklad_Arrival;
  ls: TSklad_Expense;
begin

  LeArr.Clear;
  gridPos.DataSource.DataSet.First;
  while not gridPos.DataSource.DataSet.Eof do
  begin
    le.sklad_id := FRegion.sklad_id;
    le.position_id := gridPos.DataSource.DataSet.FieldByName('position_id').AsInteger;
    le.count := gridPos.DataSource.DataSet.FieldByName('count').AsFloat;
    le.items_arrival_id := aItemsId;
    le.user_id := DataManager.User.id;
    le.datetime := dtOper.DateTime;
    le.deal_id := Deal_id;
    LeArr.Add(le);
    gridPos.DataSource.DataSet.Next;
  end;
  var LOrmE: TViewOrmControl<TSklad_Arrival>;
  LOrmE.InsertArr(LeArr);

end;

procedure TfrmEditPosSklad.btnAcceptClick(Sender: TObject);
begin
  case Type_edit of
    1:
    begin
      Expense(1);
      updateStartRentalPeriod;
    end;
    2:
      begin
        if chkAktOut.Checked then
        begin

          case rgDoc.ItemIndex of
            0:
              begin
                Arrival(1);
                BuildAktIn;
              end;
            1: Arrival(3)
              ;
            2:
              ;
          end;
        end
        else
        begin
          Arrival(1);
        end;

      end;

  end;
  ModalResult := 1;
end;

procedure TfrmEditPosSklad.BuildAktIn;
var
  la: TViewOrmControl<Takt_in>;
  Ldel: TDeal;
begin
  Ldel := TIceOrm<TDeal>.GetObjFromId(Deal_id);
  Ldel.document := TIceOrm<Tdocument>.GetObjFromId(Ldel.document_id);
  Ldel.document.Spec := TIceOrm<Tspec>.GetObjFromId(Ldel.document.Spec.id);
  if Ldel.document.spec.id = 0 then
  begin
    ShowMessage('Для начала необходимо создать спецификацию.');
    exit;

  end;

  var AktNumber := ViewControl.GetLastAtkInNumber(Ldel.document.Spec.id);
  var LAkt: Takt_in;
  LAkt.number := AktNumber;
  LAkt.create_datetime := now;
  LAkt.User_id := DataManager.User.id;
  LAkt.spec_id := Ldel.document.Spec.id;
  LAkt.id := la.Insert(LAkt);
  Ldel.document.akt_in := LAkt;
  var Lrep: TReport;

  Lrep.BuildAktIn(UniMainModule.frxAktIn, UniMainModule.frxdsAktIn, Ldel.document);
end;

procedure TfrmEditPosSklad.chkAktOutChange(Sender: TObject);
begin
  mmoComment.Enabled := chkAktOut.Checked;
  rgDoc.Enabled := chkAktOut.Checked;
end;

procedure TfrmEditPosSklad.Expense(aItemsId:integer);
var
  LeArr: TSklad_ExpenseArr;
  le: TSklad_Expense;
begin
  LeArr.Clear;
  gridPos.DataSource.DataSet.First;
  while not gridPos.DataSource.DataSet.Eof do
  begin
    if gridPos.DataSource.DataSet.FieldByName('count').AsFloat > gridPos.DataSource.DataSet.FieldByName
      ('remains').AsFloat then
    begin
      ShowMessage(gridPos.DataSource.DataSet.FieldByName('name').AsString +
        ' невозможно отгрузить, нехватает остатков на складе.');
      exit;
    end;
    le.sklad_id := FRegion.sklad_id;
    le.position_id := gridPos.DataSource.DataSet.FieldByName('position_id').AsInteger;
    le.count := gridPos.DataSource.DataSet.FieldByName('count').AsFloat;
    le.items_expense_id := aItemsId;
    le.user_id := DataManager.User.id;
    le.datetime := dtOper.DateTime;
    le.deal_id := Deal_id;
    LeArr.Add(le);
    gridPos.DataSource.DataSet.Next;
  end;
  var LOrmE: TViewOrmControl<TSklad_Expense>;
  LOrmE.InsertArr(LeArr);
end;

procedure TfrmEditPosSklad.LoadPosArrival;
var
  Lpos: TSklad_ExpenseArr;
  LodlArrival: TSklad_ArrivalArr;
  I, j: Integer;
  Lr: TRemains_position;
  LOrmE: TViewOrmControl<TSklad_Expense>;
  LOrmA: TViewOrmControl<TSklad_Arrival>;
  LPosGropArr: TSklad_ExpenseArr;
  LPg: TSklad_Expense;
  Index: integer;
var
  Comparer: IComparer<TSklad_Expense>;
begin
  Comparer := TComparer<TSklad_Expense>.Construct(
    function(const Left, Right: TSklad_Expense): Integer
    begin
      Result := TComparer<Integer>.Default.Compare(Left.position_id, Right.position_id);
    end);
  Lpos := LOrmE.GetObjArr('deal_id=' + Deal_id.ToString+' ');
  FRegion := ViewControl.GetRegion(Region_id);

  LodlArrival := LOrmA.GetObjArr('deal_id=' + Deal_id.ToString);
  LPosGropArr.Clear;
  for I := Lpos.Count - 1 downto 0 do
  begin
    Index := Lpos.IndexOf(Lpos[I], Comparer);
    if Index < I then
    begin
      Lpos.items[I].count := Lpos[I].count + Lpos[Index].count;
      Lpos.Delete(Index);
    end;
  end;
  for I := 0 to Lpos.Count - 1 do
  begin
    for j := 0 to LodlArrival.Count - 1 do
    begin
      if LodlArrival[j].position_id = Lpos[I].position_id then
      begin
        Lpos.Items[I].count := Lpos[I].count - LodlArrival[j].count;
      end;
    end;

    gridPos.DataSource.DataSet.Append;
    gridPos.DataSource.DataSet.FieldByName('name').AsString := Lpos[I].position.name;
    Lr := ViewControl.GetRemainsPosition(Lpos[I].position.id, FRegion.sklad_id);
    gridPos.DataSource.DataSet.FieldByName('remains').AsString := Lr.Count.ToString;
    gridPos.DataSource.DataSet.FieldByName('count').AsString := Lpos[I].count.ToString;
    gridPos.DataSource.DataSet.FieldByName('position_id').AsInteger := Lpos[I].position_id;

    gridPos.DataSource.DataSet.Post;

  end;

end;

procedure TfrmEditPosSklad.LoadPosExpens;
var
  Lpos: Tspec_positionArr;
  I, j: Integer;
  Lr: TRemains_position;
  Le: TSklad_ExpenseArr;
  LOrmE: TViewOrmControl<TSklad_Expense>;
begin
  Lpos := ViewControl.GetSpectPosition(Spec_id);
  FRegion := ViewControl.GetRegion(Region_id);
  Le := LOrmE.GetObjArr('deal_id=' + Deal_id.ToString);
  for I := 0 to Lpos.Count - 1 do
  begin
    for j := 0 to Le.Count - 1 do
    begin
      if Le[j].position_id = Lpos[I].position_id then
      begin
        Lpos.items[I].pos_count := Lpos[I].pos_count - round(Le[j].count);
      end;
    end;
    if Lpos.items[I].pos_count > 0 then
    begin
      gridPos.DataSource.DataSet.Append;
      gridPos.DataSource.DataSet.FieldByName('name').AsString := Lpos[I].position.name;
      Lr := ViewControl.GetRemainsPosition(Lpos[I].position.id, FRegion.sklad_id);
      gridPos.DataSource.DataSet.FieldByName('remains').AsString := Lr.Count.ToString;
      gridPos.DataSource.DataSet.FieldByName('count').AsString := Lpos[I].pos_count.ToString;
      gridPos.DataSource.DataSet.FieldByName('position_id').AsInteger := Lpos[I].position_id;

      gridPos.DataSource.DataSet.Post;
    end;
  end;
end;

procedure TfrmEditPosSklad.NotRefaund;
var
  LeArr: TSklad_ExpenseArr;
  ls: TSklad_Expense;
begin

  LeArr.Clear;
  gridPos.DataSource.DataSet.First;
  while not gridPos.DataSource.DataSet.Eof do
  begin
    ls.sklad_id := FRegion.sklad_id;
    ls.position_id := gridPos.DataSource.DataSet.FieldByName('position_id').AsInteger;
    ls.count := gridPos.DataSource.DataSet.FieldByName('count').AsFloat;
    ls.items_expense_id := 3;
    ls.user_id := DataManager.User.id;
    ls.datetime := dtOper.DateTime;
    ls.deal_id := Deal_id;
    LeArr.Add(ls);
    gridPos.DataSource.DataSet.Next;
  end;
  var LOrmE: TViewOrmControl<TSklad_Expense>;
  LOrmE.InsertArr(LeArr);

end;

procedure TfrmEditPosSklad.UniFormAfterShow(Sender: TObject);
begin
  case Type_edit of
    1:
      begin
        LoadPosExpens;
        gridPos.ColumnByName('count').Title.Caption := 'Кол-во на отгрузку';
      end;
    2:
      begin
        LoadPosArrival;
        gridPos.ColumnByName('count').Title.Caption := 'Кол-во на возврат';
      end;
  end;

end;

procedure TfrmEditPosSklad.updateStartRentalPeriod;
begin
var deal:=TIceORM<TDeal>.GetObjFromId(Deal_id);
deal.start_rental_date:=dtOper.DateTime;
 var spec:=TIceORM<Tspec>.GetObjFromId(Spec_id);
 deal.stop_rental_date:=IncDay(dtOper.DateTime,spec.rental_period);
TIceORM<Tdeal>.Update(deal);
end;

end.

