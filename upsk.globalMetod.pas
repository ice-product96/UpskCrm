unit upsk.globalMetod;

interface

uses
  System.Classes, System.SysUtils, ArrayHelper, uniGUIForm, Forms,
  uniGUIBaseClasses, Vcl.Controls, uniGUIApplication, uniComboBox, uniStringGrid,
  uniEdit, uniLabel, math, System.Rtti, frxClass, upsk.const_, System.TypInfo,
  System.Generics.Collections, upsk.types, frxExportPDF, ServerModule, frxutils,
  Num2Text, System.DateUtils;

const
  GlobalNds = 20;

type
  TResultModal = reference to procedure(AResult: Integer);

  TResultModalRes = reference to procedure(AResult: Integer; aResValue: Tvalue);

type
  THelpData<T> = record
  private
    FTArr: TArrayRecord<t>;
    FDs: TfrxUserDataSet;
    FFrxReport: TfrxReport;
    procedure dsGetValue(const VarName: string; var Value: Variant);
  public
    function GetNameFromId(aId: Integer; aArr: TArrayRecord<t>): string;
    procedure AddDataCombox(var aCombox: TUniComboBox; aArr: TArrayRecord<t>;
      aFieldName: string);
    function GetDataFromFieldName(aArr: TArrayRecord<t>; aFieldName: string;
      aFieldData: Variant; aOutFieldName: string): Variant;
    function DataFromField(aArr: TArrayRecord<t>; aFieldName: string; aFieldData:
      Variant): T;
    function IndexFromField(aArr: TArrayRecord<t>; aFieldName: string;
      aFieldData: Variant): integer;
    procedure SetPropertyValue(Obj: TObject; const PropName: string; const Value: TValue);
    procedure BuildReport(var Report: TfrxReport; aT: T; aPdf: Boolean = true);
    function WriteDataReport(var Report: TfrxReport; aT: T): TfrxReport;
    function WriteTableReport(var Report: TfrxReport; aTArr: TArrayRecord<t>): TfrxReport;
    procedure Build(var Report: TfrxReport);

    function CompareRecords(const A, B: T): Boolean;

  end;

type
  TReport = record
  private
    FSpecPos: Tspec_positionArr;
    FDsSprec: TfrxUserDataSet;
    FFrxReport: TfrxReport;
    FSum_price, FSum_rental: Double;
    FOrderPos: Torder_posArr;
    procedure dsSpecGetValue(const VarName: string; var Value: Variant);
    procedure dsAktOutGetValue(const VarName: string; var Value: Variant);
    procedure dsAktInGetValue(const VarName: string; var Value: Variant);
    procedure dsOrderGetValue(const VarName: string; var Value: Variant);
  public
    procedure BuildSpec(var Report: TfrxReport; var aDsSprec: TfrxUserDataSet;
      aSpect: Tspec; aCackKef: Tcalc_kefArr; aPdf: Boolean = true);
    procedure BuildAktOut(var Report: TfrxReport; var aDsSprec: TfrxUserDataSet;
      Document: TDocument; aPdf: Boolean = true);
    procedure BuildAktIn(var Report: TfrxReport; var aDsSprec: TfrxUserDataSet;
      Document: TDocument; aPdf: Boolean = true);
    procedure BuildOrder(var Report: TfrxReport; var aDsOrder: TfrxUserDataSet;
      aOrder: TOrder; aContract: TContract);

  end;

procedure PrepareAndShow(Report: TfrxReport; Exp: TfrxPDFExport);

procedure PrepareAndShowArr(Report: Tarray<TfrxReport>; Exp: TfrxPDFExport);

procedure DeleteRowSG(ARow: integer; Grid: TUniStringGrid);

function DatetoStrSql(aDate: TDate): string;

function FileToText(aPath: string): string;

function CreateAndShowForm(aClassFrom: TUniFormClass): TUniForm;

function CreateAndShowModalForm(aClassFrom: TUniFormClass; aCallBackProc:
  TResultModal = nil): TUniForm;

function CreateAndShowModalFormRes(aClassFrom: TUniFormClass; aCallBackProc:
  TResultModalRes = nil): TUniForm;

function CompareValueEx(aVal1, aVal2, aOper: Variant): Boolean;

function ClosestMultipleOfThree(number: Integer; divider: integer): Integer;

procedure LblEditAsInteger(aSender: TObject; aKeyEvent: TKeyPressEvent);

function RoundNumber100(value: Integer): Integer;

procedure AddCashIn(deal_id: integer; cash_items_id: Integer; amount: Double;
  comment: string);

implementation

uses
  frxVariables, MainModule, upsk.viewcontrol;

function RoundNumber100(value: Integer): Integer;
var
  lastDigit: Integer;
begin
  // Получаем последнюю цифру числа
  lastDigit := Abs(value) mod 10;

  // Округляем в соответствии с последней цифрой
  if lastDigit >= 5 then
    Result := Ceil(value / 100) * 100  // Округление в большую сторону
  else
    Result := Floor(value / 100) * 100; // Округление в меньшую сторону
end;

procedure PrepareAndShowArr(Report: Tarray<TfrxReport>; Exp: TfrxPDFExport);
var
  f: TfrxReport;
  s: TMemoryStream;
  I: Integer;
  AUrl: string;
begin
  f := TfrxReport.Create(nil);
  try
    s := TMemoryStream.Create;
    try
      for I := 1 to length(Report) - 1 do
      begin
      //  s.Clear;
       // Report[I].SaveToStream(s);
       // s.Position := 0;
       // f.LoadFromStream(s);


        Report[0].PreviewPages.AddFrom(Report[I]);

      end;

      try
        Report[0].PrintOptions.ShowDialog := False;

        Exp.ShowDialog := False;
        Exp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True);
        Exp.DefaultPath := '';

        Report[0].PreviewOptions.AllowEdit := False;

      //  Report[0].PrepareReport;
        Report[0].Export(Exp);
        UniSession.AddJS('window.open("' + AUrl + '","_blank","");');
      except
        on e: exception do
          raise Exception.Create(e.Message);
      end;

    finally
      s.Free;
    end;

  finally
    f.Free;
  end;

end;

procedure LblEditAsInteger(aSender: TObject; aKeyEvent: TKeyPressEvent);
var
  Le: TUniEdit;
begin
  if aSender is Tunilabel then
  begin
  //  (aSender as TUniLabel).Visible := false;
    Le := TUniEdit.Create((aSender as TUniLabel).Owner);
    Le.Parent := (aSender as TUniLabel).Parent;
    Le.Name := 'E' + (aSender as TUniLabel).Name;
    Le.Width := (aSender as TUniLabel).Width + 30;
    Le.Top := (aSender as TUniLabel).Top;
    Le.Left := (aSender as TUniLabel).Left;
    Le.Text := '';
    Le.Hint := (aSender as TUniLabel).Hint;
    Le.OnKeyPress := aKeyEvent;
    Le.SetFocus;
  end;

end;

function ClosestMultipleOfThree(number: Integer; divider: integer): Integer;
begin
  Result := ceil(number / divider) * divider;
end;

function CompareValueEx(aVal1, aVal2, aOper: Variant): Boolean;
begin
  Result := False;
  if aOper = '>' then
  begin
    if aVal1 > aVal2 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else if aOper = '>=' then
  begin
    if aVal1 >= aVal2 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else if aOper = '<' then
  begin
    if aVal1 < aVal2 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else if aOper = '<=' then
  begin
    if aVal1 <= aVal2 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else if aOper = '=' then
  begin
    if aVal1 = aVal2 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
end;

procedure DeleteRowSG(ARow: integer; Grid: TUniStringGrid);
var
  i, j: integer;
begin
  with Grid do
  begin
    for i := ARow + 1 to RowCount - 1 do
      for j := 0 to ColCount - 1 do
        Cells[j, i - 1] := Cells[j, i];
    for i := 0 to ColCount - 1 do
      Cells[i, RowCount - 1] := '';
    RowCount := RowCount - 1;
  end;

end;

function CreateAndShowForm(aClassFrom: TUniFormClass): TUniForm;
var
  i: Integer;
begin
  for i := 0 to UniApplication.ComponentCount - 1 do
  begin
    if (UniApplication.Components[i] is aClassFrom) then
    begin

      (UniApplication.Components[i] as aClassFrom).WindowState := TWindowState.wsMaximized;
      Exit;
    end;

  end;
  Result := aClassFrom.Create(UniApplication);
  Result.Show();

end;

function CreateAndShowModalFormRes(aClassFrom: TUniFormClass; aCallBackProc:
  TResultModalRes = nil): TUniForm;
var
  i: Integer;
begin
  for i := 0 to UniApplication.ComponentCount - 1 do
  begin
    if (UniApplication.Components[i] is aClassFrom) then
    begin

      (UniApplication.Components[i] as aClassFrom).WindowState := TWindowState.wsMaximized;
      Exit;
    end;

  end;

  Result := aClassFrom.Create(UniApplication);
  Result.ScreenMask.Enabled := true;
  Result.ScreenMask.Message := 'Загрузка данных';
  Result.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    begin
      if Assigned(aCallBackProc) then
      begin
       // aCallBackProc(AResult);
      end;
    end);
end;

function CreateAndShowModalForm(aClassFrom: TUniFormClass; aCallBackProc:
  TResultModal = nil): TUniForm;
var
  i: Integer;
begin
  for i := 0 to UniApplication.ComponentCount - 1 do
  begin
    if (UniApplication.Components[i] is aClassFrom) then
    begin

      (UniApplication.Components[i] as aClassFrom).WindowState := TWindowState.wsMaximized;
      Exit;
    end;

  end;

  Result := aClassFrom.Create(UniApplication);
  Result.ScreenMask.Enabled := true;
  Result.ScreenMask.Message := 'Загрузка данных';
  Result.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    begin
      if Assigned(aCallBackProc) then
      begin
        aCallBackProc(AResult);
      end;
    end);

end;

function FileToText(aPath: string): string;
var
  str: TStringList;
begin
  str := TStringList.Create;
  try
    str.LoadFromFile(aPath);
    Result := str.Text;

  finally
    str.Free;
  end;
end;

function DatetoStrSql(aDate: TDate): string;
begin
  Result := FormatDateTime('yyyy-MM-dd', aDate);
end;
{ THelpData<T> }

procedure AddCashIn(deal_id, cash_items_id: Integer; amount: Double; comment: string);
var
  LcashIn: Tcash_in;
  LcOrm: TViewOrmControl<Tcash_in>;
begin
  LcashIn.deal_id := deal_id;
  LcashIn.cash_in_items_id := cash_items_id;
  LcashIn.amount := amount;
  LcashIn.comment := comment;
  LcashIn.date := now;
  LcOrm.Insert(LcashIn);
end;

procedure THelpData<T>.AddDataCombox(var aCombox: TUniComboBox; aArr:
  TArrayRecord<t>; aFieldName: string);
var
  I: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
begin
  aCombox.Clear;

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) = aFieldName then
    begin
      for I := 0 to aArr.Count - 1 do
      begin

        aCombox.Items.Add(fld.GetValue(@aArr[I]).AsString);
      end;
    end;

  end;

end;

procedure THelpData<T>.BuildReport(var Report: TfrxReport; aT: T; aPdf: Boolean = true);
var
  I: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Variable: TfrxVariable;
  chk: Boolean;
  key, val: string;
  var_name: string;
  var_index: integer;
begin

  chk := False;

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    try

      Report.Variables[fld.Name] := '''' + fld.GetValue(@aT).AsVariant + '''';

    except

    end;

  end;
  if aPdf then
    PrepareAndShow(Report, UniMainModule.frxExpPdf)
  else
    Report.PrepareReport();

end;

function THelpData<T>.CompareRecords(const A, B: T): Boolean;
var
  ctx: TRttiContext;
  fieldType: TRttiType;
  field: TRttiField;
begin
  Result := True;

  ctx := TRttiContext.Create;
  try
    fieldType := ctx.GetType(TypeInfo(T));

    for field in fieldType.GetFields do
    begin
      // Проверка на совпадение значений полей

      try
        if not SameValue(field.GetValue(@A).AsVariant, field.GetValue(@B).AsVariant) then
        begin
          var tmp1 := field.GetValue(@A).AsVariant;
          var tmp2 := field.GetValue(@B).AsVariant;
          Result := False;
          Exit;
        end;
      except

      end;
    end;
  finally
    ctx.Free;
  end;
end;

procedure THelpData<T>.Build(var Report: TfrxReport);
begin
  PrepareAndShow(Report, UniMainModule.frxExpPdf);
end;

function THelpData<T>.DataFromField(aArr: TArrayRecord<t>; aFieldName: string;
  aFieldData: Variant): T;
var
  I: Integer;
  rttiContext: TRttiContext;
  fld, fldOut: TRttiField;
begin

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) = aFieldName then
    begin

      for I := 0 to aArr.Count - 1 do
      begin
        if fld.GetValue(@aArr[I]).AsVariant = aFieldData then
        begin
          Result := aArr[I];
          exit;
        end;

      end;
    end;

  end;

end;

procedure THelpData<T>.dsGetValue(const VarName: string; var Value: Variant);
var
  I: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
begin
  I := FDs.RecordCount;

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    if fld.FieldType.TypeKind <> tkrecord then
    begin
      if VarName = fld.Name then
      begin
        Value := '''' + fld.GetValue(@FTArr.Items[I]).AsVariant + '''';
        Break;
      end;
    end

  end;
end;

function THelpData<T>.GetDataFromFieldName(aArr: TArrayRecord<t>; aFieldName:
  string; aFieldData: Variant; aOutFieldName: string): Variant;
var
  I: Integer;
  rttiContext: TRttiContext;
  fld, fldOut: TRttiField;
begin
  Result := 0;
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) = aFieldName then
    begin

      for I := 0 to aArr.Count - 1 do
      begin
        if fld.GetValue(@aArr[I]).AsVariant = aFieldData then
        begin
          for fldOut in rttiContext.GetType(TypeInfo(T)).GetFields do
          begin
            if AnsiLowerCase(fldOut.Name) = aOutFieldName then
            begin
              Result := fldOut.GetValue(@aArr[I]).AsVariant;
              exit;
            end;
          end;
        end;

      end;
    end;

  end;

end;

function THelpData<T>.GetNameFromId(aId: Integer; aArr: TArrayRecord<t>): string;
var
  I: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
  Li: integer;
begin
  Li := -1;
  Result := '';
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) = 'id' then
    begin
      for I := 0 to aArr.Count - 1 do
      begin
        if fld.GetValue(@aArr[I]).AsInteger = aId then
        begin
          Li := I;
          Break;
        end;

      end;
    end;
    if Li <> -1 then
    begin
      if AnsiLowerCase(fld.Name) = 'name' then
      begin

        Result := fld.GetValue(@aArr[Li]).AsString;
        exit;
      end;
    end
    else
      Exit;
  end;
end;

function THelpData<T>.IndexFromField(aArr: TArrayRecord<t>; aFieldName: string;
  aFieldData: Variant): integer;
var
  I: Integer;
  rttiContext: TRttiContext;
  fld, fldOut: TRttiField;
  Lvar: Variant;
begin
  Result := -1;
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if AnsiLowerCase(fld.Name) = aFieldName then
    begin

      for I := 0 to aArr.Count - 1 do
      begin
        if fld.GetValue(@aArr[I]).AsVariant = aFieldData then
        begin
          Result := I;
          Exit;
        end;

      end;
    end;

  end;

end;

procedure PrepareAndShow(Report: TfrxReport; Exp: TfrxPDFExport);
var
  AUrl: string;
begin
  try
    Report.PrintOptions.ShowDialog := False;

    Exp.ShowDialog := False;
    Exp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True);
    Exp.DefaultPath := '';

    Report.PreviewOptions.AllowEdit := False;

  // Report.ShowReport();
    Report.PrepareReport;
    Report.Export(Exp);
    UniSession.AddJS('window.open("' + AUrl + '","_blank","");');
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

procedure THelpData<T>.SetPropertyValue(Obj: TObject; const PropName: string;
  const Value: TValue);
var
  ctx: TRttiContext;
  objType: TRttiType;
  prop: TRttiProperty;
begin
  ctx := TRttiContext.Create;
  try
    objType := ctx.GetType(Obj.ClassType);
    prop := objType.GetProperty(PropName);
    if Assigned(prop) and (prop.PropertyType.TypeKind = tkEnumeration) then
    begin
      prop.SetValue(Obj, Value);
    end;
  finally
    ctx.Free;
  end;

end;

function THelpData<T>.WriteDataReport(var Report: TfrxReport; aT: T): TfrxReport;
var
  I: Integer;
  rttiContext: TRttiContext;
  fld: TRttiField;
begin

  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin

    try
      if fld.FieldType.TypeKind <> tkrecord then
      begin
        Report.Variables[fld.Name] := '''' + fld.GetValue(@aT).AsVariant + '''';
      end

    except

    end;

  end;

  Result := Report;

end;

function THelpData<T>.WriteTableReport(var Report: TfrxReport; aTArr:
  TArrayRecord<t>): TfrxReport;
begin

  Result := Report;
end;

{ TReport }

procedure TReport.BuildAktIn(var Report: TfrxReport; var aDsSprec:
  TfrxUserDataSet; Document: TDocument; aPdf: Boolean);
var
  i: integer;
begin
  aDsSprec.OnGetValue := dsAktInGetValue;
  FDsSprec := aDsSprec;
  FFrxReport := Report;
  for i := 0 to Document.spec.Position.Count - 1 do
  begin
    if Document.spec.Position[i].pos_count > 0 then
      FSpecPos.Add(Document.spec.Position[i]);
  end;
  FSum_price := 0;
  FSum_rental := 0;
  Report.Variables['number'] := '''' + Document.akt_in.number.ToString + '''';
  Report.Variables['contract_number'] := '''' + Document.spec.contract_number + '''';
  Report.Variables['contract_date'] := '''' + DatetoStr(Document.spec.contract_date)
    + '''';
  Report.Variables['year'] := '''' + YearOf(now).ToString + '''';
  Report.Variables['city_name'] := '''' + Document.spec.city_name + '''';
  Report.Variables['part_fio_manager'] := '''' + Document.spec.fio_manager + '''';
  Report.Variables['organ_fio_manager'] := '''' + Document.spec.org_fio_manager + '''';
  Report.Variables['organ_name'] := '''' + Document.contract.organization.name + '''';
  Report.Variables['part_name'] := '''' + Document.contract.part_entity.name + '''';
  with aDsSprec do
  begin
    RangeEnd := reCount;
    RangeEndCount := FSpecPos.Count;
  end;
  if aPdf then
    PrepareAndShow(Report, UniMainModule.frxExpPdf)
  else
    Report.PrepareReport();

end;

procedure TReport.BuildAktOut(var Report: TfrxReport; var aDsSprec:
  TfrxUserDataSet; Document: TDocument; aPdf: Boolean = true);
var
  i: integer;
begin
  aDsSprec.OnGetValue := dsAktOutGetValue;
  FDsSprec := aDsSprec;
  FFrxReport := Report;
  FSpecPos.Clear;
  for i := 0 to Document.spec.Position.Count - 1 do
  begin
    if Document.spec.Position[i].pos_count > 0 then
      FSpecPos.Add(Document.spec.Position[i]);
  end;
  FSum_price := 0;
  FSum_rental := 0;
  Report.Variables['number'] := '''' + Document.akt_out.number.ToString + '''';
  Report.Variables['contract_number'] := '''' + Document.spec.contract_number + '''';
  Report.Variables['contract_date'] := '''' + DatetoStr(Document.spec.contract_date)
    + '''';
  Report.Variables['year'] := '''' + YearOf(now).ToString + '''';
  Report.Variables['city_name'] := '''' + Document.spec.city_name + '''';
  Report.Variables['part_fio_manager'] := '''' + Document.spec.fio_manager + '''';
  Report.Variables['organ_fio_manager'] := '''' + Document.spec.org_fio_manager + '''';
  Report.Variables['organ_name'] := '''' + Document.contract.organization.name + '''';
  Report.Variables['part_name'] := '''' + Document.contract.part_entity.name + '''';
  with aDsSprec do
  begin
    RangeEnd := reCount;
    RangeEndCount := FSpecPos.Count;
  end;

  if aPdf then
    PrepareAndShow(Report, UniMainModule.frxExpPdf)
  else
    Report.PrepareReport();
end;

procedure TReport.BuildOrder(var Report: TfrxReport; var aDsOrder:
  TfrxUserDataSet; aOrder: TOrder; aContract: TContract);
var
  I: Integer;
begin
  aDsOrder.OnGetValue := dsOrderGetValue;
  FDsSprec := aDsOrder;
  FFrxReport := Report;
  FOrderPos.SetItems(aOrder.order_pos.Items);
  Report.Variables['organ_bank_bik'] := '''' + aContract.organization.bank_bik + '''';
  Report.Variables['organ_bank_korder'] := '''' + aContract.organization.bank_korder
    + '''';
  Report.Variables['organ_bank_rorder'] := '''' + aContract.organization.bank_rorder
    + '''';
  Report.Variables['organ_bank_name'] := '''' + aContract.organization.bank_name + '''';
  Report.Variables['organ_inn'] := '''' + aContract.organization.inn + '''';
  Report.Variables['organ_kpp'] := '''' + aContract.organization.kpp + '''';
  Report.Variables['organ_name'] := '''' + aContract.organization.name + '''';
  Report.Variables['organ_en_adress'] := '''' + aContract.organization.en_adress + '''';
  Report.Variables['organ_fio_manager'] := '''' + aContract.organization.fio_manager
    + '''';

  Report.Variables['part_name'] := '''' + aContract.part_entity.name + '''';
  Report.Variables['part_en_adress'] := '''' + aContract.part_entity.en_adress + '''';
  Report.Variables['part_inn'] := '''' + aContract.part_entity.inn + '''';
  Report.Variables['part_kpp'] := '''' + aContract.part_entity.kpp + '''';

  Report.Variables['number'] := '''' + aOrder.id.ToString + '''';
  Report.Variables['date'] := '''' + DateToStr(aOrder.date) + '''';
  Report.Variables['nds'] := '''' + GlobalNds.ToString + '%' + '''';
  Report.Variables['sum_price'] := '''999''';
  Report.Variables['count_pos'] := '''' + aOrder.order_pos.Count.ToString + '''';
  var LAmount: double;
  for I := 0 to aOrder.order_pos.Count - 1 do
  begin
    LAmount := LAmount + (aOrder.order_pos[I].pos_count * aOrder.order_pos[I].pos_price);
  end;
  Report.Variables['sum_amount'] := '''' + FormatFloat('#,##0.00', LAmount) + '''';
  with aDsOrder do
  begin
    RangeEnd := reCount;
    RangeEndCount := aOrder.order_pos.Count;
  end;

  PrepareAndShow(Report, UniMainModule.frxExpPdf);
end;

procedure TReport.BuildSpec(var Report: TfrxReport; var aDsSprec:
  TfrxUserDataSet; aSpect: Tspec; aCackKef: Tcalc_kefArr; aPdf: Boolean);
var
  i: integer;
  LWarning: string;
begin
  try
//  [warning_price]

    LWarning := '';
    for i := aCackKef.Count - 1 downto 0 do
    begin
      if i = 0 then
      begin
        LWarning := LWarning + '<b>' + aCackKef[i].amount.ToString + '(' +
          FloatToText(aCackKef[i].amount, 1) + ')' +
          ' за каждые сутки аренды с учетом 20% НДС, срок аренды до ' + aCackKef
          [i].day.ToString + '</b>' + char(13) + char(10);
      end
      else
      begin
        LWarning := LWarning + aCackKef[i].amount.ToString + '(' + FloatToText(aCackKef
          [i].amount, 1) + ')' +
          ' за каждые сутки аренды с учетом 20% НДС, срок аренды до ' + aCackKef
          [i].day.ToString + char(13) + char(10);
      end;

    end;

    aDsSprec.OnGetValue := dsSpecGetValue;
    FDsSprec := aDsSprec;
    FFrxReport := Report;
    for i := 0 to aSpect.Position.Count - 1 do
    begin
      if aSpect.Position[i].pos_count > 0 then
        FSpecPos.Add(aSpect.Position[i]);
    end;
    FSum_price := 0;
    FSum_rental := 0;
    Report.Variables['sum_rental_table'] := '''' + aSpect.price_rental_day.ToString
      + '''';
    Report.Variables['warning_price'] := LWarning;
    Report.Variables['contract_number'] := '''' + aSpect.contract_number + '''';
    Report.Variables['contract_date'] := '''' + DatetoStr(aSpect.contract_date) + '''';
    Report.Variables['date'] := '''' + DateToStr(aSpect.date) + '''';
    Report.Variables['device_name'] := '''' + aSpect.device_name + '''';
    Report.Variables['all_count'] := '''' + aSpect.all_count_kv.ToString + '''';
    Report.Variables['rental_period'] := '''' + aSpect.rental_period.ToString + '''';
    Report.Variables['sum_price'] := '''' + aSpect.sum_price.ToString + '''';
    Report.Variables['sum_rental'] := '''' + aSpect.sum_rental.ToString + '''';
    Report.Variables['sum_depos'] := '''' + aSpect.sum_depos.ToString + '''';
    Report.Variables['sum_delivery'] := '''' + aSpect.sum_delivery.ToString + '''';
    Report.Variables['sum_delivery_out'] := '''' + aSpect.sum_delivery_out.ToString
      + '''';
    Report.Variables['all_amount'] := '''' + aSpect.all_amount.ToString + '''';
    Report.Variables['city_name'] := '''' + aSpect.city_name + '''';
    Report.Variables['part_fio_manager'] := '''' + aSpect.fio_manager + '''';
    Report.Variables['organ_fio_manager'] := '''' + aSpect.org_fio_manager + '''';
    if aSpect.square > 0 then
      Report.Variables['all_count'] := '''' + aSpect.square.ToString + ' м2''';

    with aDsSprec do
    begin
      RangeEnd := reCount;
      RangeEndCount := FSpecPos.Count;
    end;
 //
    if aPdf then
      PrepareAndShow(Report, UniMainModule.frxExpPdf)
    else
      Report.PrepareReport();
  except
    on e: exception do
      raise Exception.Create('Ошибка формирование спецификации ' + e.Message);

  end;
end;

procedure TReport.dsAktInGetValue(const VarName: string; var Value: Variant);
var
  r: integer;
begin
  r := FDsSprec.RecNo;
  if FSpecPos[r].pos_count > 0 then
  begin
    if SameText(VarName, 'pos_number') then
    begin
      Value := FSpecPos[r].column_num;

    end
    else if SameText(VarName, 'pos_name') then
    begin
      Value := FSpecPos[r].pos_name;
    end
    else if SameText(VarName, 'pos_count') then
    begin
      Value := FSpecPos[r].pos_count;
    end
    else if SameText(VarName, 'pos_price') then
    begin
      Value := FSpecPos[r].pos_price;
    end;
  end;
end;

procedure TReport.dsAktOutGetValue(const VarName: string; var Value: Variant);
var
  r: integer;
begin
  r := FDsSprec.RecNo;
  if FSpecPos[r].pos_count > 0 then
  begin
    if SameText(VarName, 'pos_number') then
    begin
      Value := FSpecPos[r].column_num;

    end
    else if SameText(VarName, 'pos_name') then
    begin
      Value := FSpecPos[r].pos_name;
    end
    else if SameText(VarName, 'pos_count') then
    begin
      Value := FSpecPos[r].pos_count;
    end
    else if SameText(VarName, 'pos_price') then
    begin
      Value := FSpecPos[r].pos_price;
    end
    else if SameText(VarName, 'pos_amount') then
    begin
      FSpecPos.items[r].pos_amount := Round(FSpecPos[r].pos_price * FSpecPos[r].pos_count);
      Value := FSpecPos[r].pos_amount;
      FSum_price := FSum_price + FSpecPos[r].pos_amount;
    end
    else if SameText(VarName, 'pos_price_clear') then
    begin
      Value := FSpecPos[r].position.Clear_Price;
    end
    else if SameText(VarName, 'pos_price_recovery') then
    begin
      Value := FSpecPos[r].position.Recovery_Price;
    end;

  end;

  if FSpecPos.Count - 1 = r then
    ffrxreport.Variables['sum_pos_price'] := '''' + FSum_price.ToString + '''';
end;

procedure TReport.dsOrderGetValue(const VarName: string; var Value: Variant);
var
  r: integer;
begin
  r := FDsSprec.RecNo;
  if SameText(VarName, 'pos_number') then
  begin
    Value := FOrderPos[r].Pos_number;

  end;
  if SameText(VarName, 'pos_name') then
  begin
    Value := FOrderPos[r].pos_name;

  end;
  if SameText(VarName, 'pos_count') then
  begin
    Value := FOrderPos[r].pos_count;

  end;
  if SameText(VarName, 'pos_unity') then
  begin
    Value := FOrderPos[r].pos_unity;

  end;
  if SameText(VarName, 'pos_price') then
  begin
    Value := FormatFloat('#,##0.00', FOrderPos[r].pos_price);

  end;
  if SameText(VarName, 'pos_amount') then
  begin
    Value := FormatFloat('#,##0.00', FOrderPos[r].pos_price * FOrderPos[r].pos_count);

  end;

end;

procedure TReport.dsSpecGetValue(const VarName: string; var Value: Variant);
var
  r: integer;
begin
  r := FDsSprec.RecNo;
  if SameText(VarName, 'number') then
  begin
    Value := FSpecPos[r].column_num;

  end;
  if SameText(VarName, 'pos_name') then
  begin
    Value := FSpecPos[r].pos_name;
  end;
  if SameText(VarName, 'pos_count') then
  begin
    Value := FSpecPos[r].pos_count;
  end;
  if SameText(VarName, 'pos_price') then
  begin
    Value := FSpecPos[r].pos_price;
  end;
  if SameText(VarName, 'pos_amount') then
  begin
    Value := FSpecPos[r].pos_amount;
    FSum_price := FSum_price + FSpecPos[r].pos_amount;
  end;
  if SameText(VarName, 'price_rental') then
  begin
    Value := FSpecPos[r].price_rental;

  end;
  if SameText(VarName, 'price_amount') then
  begin
    Value := FSpecPos[r].price_amount;
    FSum_rental := FSum_rental + FSpecPos[r].price_amount;
  end;

  if SameText(VarName, 'price_amount') then
  begin
    Value := FSpecPos[r].price_amount;
  end;

  if FSpecPos.Count - 1 = r then
  begin
  //  ffrxreport.Variables['sum_rental_table'] := '''' + FSum_rental.ToString + '''';
    ffrxreport.Variables['sum_price'] := '''' + FSum_price.ToString + '''';
  end;
end;

end.

