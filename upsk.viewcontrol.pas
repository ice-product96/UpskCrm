unit upsk.viewcontrol;

interface

uses
  upsk.form.guide, upsk.globalMetod, System.Classes, uniGUIApplication,
  uniGUIBaseClasses, uniGUIClasses, upsk.database, upsk.types, upsk.datamanager,
  IceOrm.Sql, System.SysUtils, DateUtils, uniComboBox, System.TypInfo, Math,
  upsk.frame.contact_item, System.Rtti, ArrayHelper, vcl.Controls;

type
  TViewOrmControl<T> = record
  public
    function Insert(aT: T; aNested: boolean = False): integer;
    procedure InsertArr(atArr: TArrayRecord<t>; aNested: boolean = False);
    procedure Update(aT: T; aNested: boolean = False);
    function GetObjFromId(aTId: Integer): T;
    function GetObjArr(aWhere: string = ''): TArrayRecord<t>;
    procedure Del(aTId: integer);
    procedure GetPart(aPartType, aPartId: integer; var aT: T);
  end;

type
  TIceORM<T> = class
    class function Insert(aT: T; aNested: boolean = False): integer;
    class function GetObjFromId(aTId: Integer): T;
    class procedure Update(aT: T; aNested: boolean = False);
    class function GetObjArr(aWhere: string = ''): TArrayRecord<t>;
  end;

type
  TViewControl = record
  public
    procedure OpenGuide;
    procedure test;

    function CreatePersone(aPersone: Tpart_persone): Integer;
    procedure UpdatePersone(aPersone: Tpart_persone);
    procedure DeletePersone(aPersoneId: Integer);
    function GetPersone(aPersoneId: Integer): Tpart_persone;
    function GetPersones: TPartPersoneArr;

    function CreateEntity(aEntity: Tpart_entity): Integer;
    procedure UpdateEntity(aEntity: Tpart_entity);
    procedure DeleteEntity(aEntityId: Integer);
    function GetEntity(aEntityId: Integer): Tpart_entity;
    function GetEntitys: TPartEntityArr;

    function CreatePosition(aPosition: TPosition): Integer;
    procedure UpdatePosition(aPosition: TPosition);
    procedure DeletePosition(aPositionId: Integer);
    function GetPosition(aPositionId: Integer): TPosition;
    function GetUnits: TUnitArr;
    function GetPositionArr: TPositionArr;
    procedure CreateBasePricePosition(aBasePricePos: TPosition_Base_Price);

    function LoginUser(aLogin, aPass: string): Boolean;
    function GetRegions: TRegionArr;
    function CreateRegion(aRegion: TRegion): Integer;
    procedure UpdateRegion(aRegion: TRegion);
    procedure DeleteRegion(aRegionId: Integer);
    function GetRegion(aRegionId: Integer): TRegion;

    function CreateSklad(aSklad: TSklad): integer;
    procedure UpdateSklad(aSklad: TSklad);
    procedure DeleteSklad(aSkladId: Integer);
    function GetSklad(aSkladId: integer): TSklad;

    function CreateUser(aUser: TUser): integer;
    procedure UpdateUser(aUSer: TUser);
    procedure DeleteUser(aUserId: integer);
    function GetUser(aUserId: integer): TUser;
    function GetPriorityGroup: Tpriority_groupArr;

    function CreateKef(aKef: TKef): Integer;
    procedure UpdateKef(aKef: TKef);
    procedure DeleteKef(aKefId: Integer);
    function GetKef(aKefId: Integer): Tkef;
    function GetKefs: TKefArr;

    function GetSkladArr: TSkladArr;
    function GetItemsArrival: Titems_arrivalArr;

    function GetSkladArrival(aSkladArivalId: Integer): TSklad_Arrival;
    function InsertSkladArrival(aSkladArrival: TSklad_Arrival): integer;
    procedure UpdateSkladArrival(aSkladArrival: TSklad_Arrival);
    procedure DeleteSkladArrival(aSkladArrivalId: integer);

    function GetItemsExpense: Titems_expenseArr;
    function GetSkladExpense(aSkladExpenseId: Integer): TSklad_Expense;
    function InsertSkladExpense(aSkladExpense: TSklad_Expense): integer;
    procedure UpdateSkladExpense(aSkladArrival: TSklad_Expense);
    procedure DeleteSkladExpense(aSkladExpenseId: integer);

    function GetPackageArr: TpackageArr;
    function GetPackage(aPackageId: integer): Tpackage;
    function InsertPackage(aPackage: Tpackage): integer;
    procedure Updatepackage(aPackage: Tpackage);
    procedure DeletePackage(aPackageId: Integer);
    procedure DeletePackageBuild(aPackageBuildId: Integer);
    function GetPackageBuildArr(aPackageId: Integer): Tpackage_buildArr;

    function GetOrganization(aOrganId: Integer): Torganization;
    function InsertOrganization(aOrgan: Torganization): integer;
    procedure UpdateOrganization(aOrgan: Torganization);
    procedure DeleteOrgan(aOrganId: Integer);
    function GetOrganizations: TOrganArr;

    function GetDiscount(aDiscountId: integer): TDiscount;
    function InsertDiscount(aDiscount: TDiscount): integer;
    procedure UpdateDiscount(aDiscount: TDiscount);
    procedure DeleteDiscount(aDiscountId: integer);
    function GetDiscounts: TDiscountArr;

    function GetTypeParts: TType_partArr;

    function GetRemainsPosition(aPositionId, aSkladId: Integer): TRemains_position;
    function GetPayBack(aDayCount: integer): TPayBack;

    function CreateCalcLspr200(aCalc: Tcalc_lrsp200): integer;
    function GetCalcLsrp200(aId: Integer): Tcalc_lrsp200;
    function GetCalcLsrp200PositionArr(aCalcId: Integer): Tcalc_lrsp200_positionArr;
    procedure UpdateCalcLspr200(aCalc: Tcalc_lrsp200);

    function LastNumberContractFromDate(aDate: TDate): integer;
    function ContractNumber: string;

    function InsertContract(aContract: TContract): Integer;
    procedure UpdateContract(aContract: TContract);
    function GetContract(aId: integer): TContract;
    function GetContractForPart(aPartId: Integer; aTypePart: integer): TContract;

    function GetDeal(aDealId: integer): TDeal;
    function InsertDeal(aDeal: TDeal): integer;
    procedure UpdateDeal(aDeal: TDeal);

    function GetCalcType(aId: integer): Tcalc_type;

    function GetLastSpecNumber(aContractNumber: string): integer;
    function GetSpectPosition(aSpecId: integer): Tspec_positionArr;
    function GetLastAtkOutNumber(aSpecId: Integer): integer;
    function GetLastAtkInNumber(aSpecId: Integer): integer;
    procedure CreateFrameContact(AOwner: Twincontrol; aName, aPhone: string);
  end;

implementation

{ TViewControl }

function TViewControl.ContractNumber: string;
begin

  Result := FormatDateTime('dd/MM-A(yy)', now);
  var Lcount := LastNumberContractFromDate(now);
  if Lcount = 0 then
  begin
    Lcount := 1;
  end;
  Result := Result + '-' + Lcount.ToString;
end;

procedure TViewControl.CreateBasePricePosition(aBasePricePos: TPosition_Base_Price);
var
  Lp: TOrmData<TPosition_Base_Price>;
begin
  Lp.Init;
  try
    Lp.Insert(aBasePricePos);
  finally
    Lp.dest;
  end;
end;

function TViewControl.CreateCalcLspr200(aCalc: Tcalc_lrsp200): integer;
var
  Lc: TOrmData<Tcalc_lrsp200>;
  Ls: TOrmData<Tcalc_lrsp200_section>;
  Lp: TOrmData<Tcalc_lrsp200_position>;
  I: Integer;
begin
  Lc.Init;
  try
    Ls.Init;
    try
      Lp.Init;
      try

        Result := Lc.Insert(aCalc);
        for I := 0 to aCalc.Section.Count - 1 do
        begin
          aCalc.Section.Items[I].calc_lrsp200_id := Result;
          Ls.Insert(aCalc.Section[I]);
        end;
        for I := 0 to aCalc.Position.Count - 1 do
        begin
          aCalc.Position.items[I].calc_lrsp200_id := Result;
          Lp.Insert(aCalc.Position[I]);
        end;

      finally
        Lp.dest;
      end;
    finally
      Ls.dest;
    end;
  finally
    Lc.dest;
  end;
end;

function TViewControl.CreateEntity(aEntity: Tpart_entity): Integer;
var
  LManEn: TOrmData<Tpart_entity>;
  Ladrr: TOrmData<Tadressbook_entity>;
  lid, i: Integer;
begin
  LManEn.Init;
  try
    Ladrr.Init;
    try
      lid := LManEn.Insert(aEntity);
      for i := 0 to aEntity.adressbook.Count - 1 do
      begin
        aEntity.adressbook.items[i].part_entity_id := lid;
        Ladrr.Insert(aEntity.adressbook[i]);
      end;
    finally
      Ladrr.dest;
    end;
  finally
    LManEn.dest;
  end;
end;

procedure TViewControl.CreateFrameContact(AOwner: Twincontrol; aName, aPhone: string);
var
  fm: TfmContact;
begin
  try
    fm := TfmContact.Create(AOwner);
    fm.Parent := AOwner;
    fm.AlignWithMargins := True;
    fm.Align := alTop;
    fm.ContactName := aName;
    fm.Phone := aPhone;
    fm.name := aName + aPhone
  except

  end;
end;

function TViewControl.CreateKef(aKef: TKef): Integer;
var
  Lk: TOrmData<TKef>;
begin
  Lk.Init;
  try
    Result := Lk.Insert(aKef);
  finally
    Lk.dest;
  end;

end;

function TViewControl.CreatePersone(aPersone: Tpart_persone): Integer;
var
  LManagerPersone: TOrmData<Tpart_persone>;
  LAdressManager: TOrmData<Tadressbook_persone>;
  lid: Integer;
  i: Integer;
begin

  LManagerPersone.Init;
  try
    LAdressManager.Init;
    try
      lid := LManagerPersone.Insert(aPersone);
      for i := 0 to aPersone.adressbook.Count - 1 do
      begin
        aPersone.adressbook.items[i].part_persone_id := lid;
        LAdressManager.Insert(aPersone.adressbook[i]);
      end;
      Result := lid;
    finally
      LAdressManager.dest;
    end;
  finally
    LManagerPersone.dest;
  end;
end;

function TViewControl.CreatePosition(aPosition: TPosition): Integer;
var
  LmanPos: TOrmData<TPosition>;
  lid: Integer;
begin
  LmanPos.Init;
  try
    Result := LmanPos.Insert(aPosition);

  finally
    LmanPos.dest;
  end;
end;

function TViewControl.CreateRegion(aRegion: TRegion): Integer;
var
  LReg: TOrmData<TRegion>;
begin
  LReg.Init;
  try
    Result := LReg.Insert(aRegion);
  finally
    LReg.dest;
  end;

end;

function TViewControl.CreateSklad(aSklad: TSklad): integer;
var
  LSklad: TOrmData<TSklad>;
begin
  LSklad.Init;
  try
    result := LSklad.Insert(aSklad);

  finally
    LSklad.dest;
  end;

end;

function TViewControl.CreateUser(aUser: TUser): integer;
var
  Lu: TOrmData<TUser>;
begin
  Lu.Init;
  try
    Result := Lu.Insert(aUser);
  finally
    Lu.dest;
  end;

end;

procedure TViewControl.DeleteDiscount(aDiscountId: integer);
var
  Ld: TOrmData<TDiscount>;
begin
  Ld.Init;
  try
    Ld.Hide(aDiscountId);
  finally
    Ld.dest;
  end;

end;

procedure TViewControl.DeleteEntity(aEntityId: Integer);
var
  LManEn: TOrmData<Tpart_entity>;
begin
  LManEn.Init;
  try
    LManEn.Hide(aEntityId);
  finally
    LManEn.dest;
  end;
end;

procedure TViewControl.DeleteKef(aKefId: Integer);
var
  Lk: TOrmData<TKef>;
begin
  Lk.Init;
  try
    Lk.Hide(aKefId);
  finally
    Lk.dest;
  end;
end;

procedure TViewControl.DeleteOrgan(aOrganId: Integer);
var
  Lo: TOrmData<Torganization>;
begin
  Lo.Init;
  try
    Lo.Hide(aOrganId);
  finally
    Lo.dest;
  end;
end;

procedure TViewControl.DeletePackage(aPackageId: Integer);
var
  Lp: TOrmData<Tpackage>;
begin
  Lp.Init;
  try
    Lp.Hide(aPackageId);

  finally
    Lp.dest;
  end;
end;

procedure TViewControl.DeletePackageBuild(aPackageBuildId: Integer);
var
  Lpb: TOrmData<Tpackage_build>;
begin
  Lpb.Init;
  try
    Lpb.Delete_(aPackageBuildId);
  finally
    Lpb.dest;
  end;

end;

procedure TViewControl.DeletePersone(aPersoneId: Integer);
var
  LManPersone: TOrmData<Tpart_persone>;
begin
  LManPersone.Init;
  try
    LManPersone.Hide(aPersoneId);
  finally
    LManPersone.dest;
  end;
end;

procedure TViewControl.DeletePosition(aPositionId: Integer);
var
  LPos: TOrmData<TPosition>;
begin
  LPos.Init;
  try
    var p := LPos.Select.Where('position.id', aPositionId).Exc;
    if p.not_delete = 1 then
      raise Exception.Create('Данную позицию удалять запрещено.');

    LPos.Hide(aPositionId);
  finally
    LPos.dest;
  end;
end;

procedure TViewControl.DeleteRegion(aRegionId: Integer);
var
  LReg: TOrmData<TRegion>;
begin
  LReg.Init;
  try
    LReg.Hide(aRegionId);
  finally
    LReg.dest;
  end;

end;

procedure TViewControl.DeleteSklad(aSkladId: Integer);
var
  LSklad: TOrmData<TSklad>;
begin
  LSklad.Init;
  try
    LSklad.Hide(aSkladId);

  finally
    LSklad.dest;
  end;
end;

procedure TViewControl.DeleteSkladArrival(aSkladArrivalId: integer);
var
  Ls: TOrmData<TSklad_Arrival>;
begin
  Ls.Init;
  try
    Ls.hide(aSkladArrivalId);
  finally
    Ls.dest;
  end;

end;

procedure TViewControl.DeleteSkladExpense(aSkladExpenseId: integer);
var
  Ls: TOrmData<TSklad_Expense>;
begin
  Ls.Init;
  try
    Ls.hide(aSkladExpenseId);
  finally
    Ls.dest;
  end;

end;

procedure TViewControl.DeleteUser(aUserId: integer);
var
  Lu: TOrmData<TUser>;
begin
  Lu.Init;
  try
    Lu.Hide(aUserId);
  finally
    Lu.dest;
  end;

end;

function TViewControl.GetCalcLsrp200(aId: Integer): Tcalc_lrsp200;
var
  Lc: TOrmData<Tcalc_lrsp200>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('calc_lrsp200.id', aId).Exc;
    Result.Position := GetCalcLsrp200PositionArr(aId);
  finally
    Lc.dest;
  end;

end;

function TViewControl.GetCalcLsrp200PositionArr(aCalcId: Integer):
  Tcalc_lrsp200_positionArr;
var
  Lc: TOrmData<Tcalc_lrsp200_position>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('calc_lrsp200_id', aCalcId).ExcArr;

  finally
    Lc.dest;
  end;

end;

function TViewControl.GetCalcType(aId: integer): Tcalc_type;
var
  Lc: TOrmData<Tcalc_type>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('calc_type.id', aId).Exc;
  finally
    Lc.dest;
  end;

end;

function TViewControl.GetContract(aId: integer): TContract;
var
  Lc: TOrmData<TContract>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('contract.id', aId).Exc;
  finally
    Lc.dest;
  end;

end;

function TViewControl.GetContractForPart(aPartId, aTypePart: integer): TContract;
var
  Lc: TOrmData<TContract>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('contract.part_id=' + aPartId.ToString +
      ' and contract.part_type=' + aTypePart.ToString).Exc;
  finally
    Lc.dest;
  end;

end;

function TViewControl.GetDeal(aDealId: integer): TDeal;
var
  Ld: TOrmData<TDeal>;
begin
  Ld.Init;
  try
    Result := Ld.Select.Where('deal.id', aDealId).Exc;

  finally
    Ld.dest;
  end;

end;

function TViewControl.GetDiscount(aDiscountId: integer): TDiscount;
var
  Ld: TOrmData<TDiscount>;
begin
  Ld.Init;
  try
    Result := Ld.Select.Where('id', aDiscountId).Exc;
  finally
    Ld.dest;
  end;

end;

function TViewControl.GetDiscounts: TDiscountArr;
var
  Ld: TOrmData<TDiscount>;
begin
  Ld.Init;
  try
    Result := Ld.Select.ExcArr;
  finally
    Ld.dest;
  end;

end;

function TViewControl.GetEntity(aEntityId: Integer): Tpart_entity;
var
  Manager: TOrmData<Tpart_entity>;
  Lent: Tpart_entity;
  adress: TOrmData<Tadressbook_entity>;
  i: Integer;
begin
  Manager.Init;
  try
    adress.Init;
    try

      Lent := Manager.Select('id=' + aEntityId.ToString);

      Lent.adressbook := adress.SelectArr('part_entity_id=' + Lent.id.ToString);

      Result := Lent;
    finally
      adress.dest;
    end;
  finally
    Manager.dest;
  end;
end;

function TViewControl.GetEntitys: TPartEntityArr;
var
  Lp: TOrmData<Tpart_entity>;
begin
  Lp.Init;
  try
    Result := Lp.Select.ExcArr;
  finally
    Lp.dest;
  end;

end;

function TViewControl.GetItemsArrival: Titems_arrivalArr;
var
  Li: TOrmData<Titems_arrival>;
begin
  Li.Init;
  try
    Result := Li.Select.ExcArr;
  finally
    Li.dest;
  end;

end;

function TViewControl.GetItemsExpense: Titems_expenseArr;
var
  Li: TOrmData<Titems_expense>;
begin
  Li.Init;
  try
    Result := Li.Select.ExcArr;
  finally
    Li.dest;
  end;

end;

function TViewControl.GetKef(aKefId: Integer): Tkef;
var
  Lk: TOrmData<TKef>;
begin
  Lk.Init;
  try
    Result := Lk.Select('id=' + aKefId.ToString);
  finally
    Lk.dest;
  end;

end;

function TViewControl.GetKefs: TKefArr;
var
  Lk: TOrmData<TKef>;
begin
  Lk.Init;
  try
    Result := Lk.Select.Where('kef.del=0').ExcArr;
  finally
    Lk.dest;
  end;

end;

function TViewControl.GetLastAtkInNumber(aSpecId: Integer): integer;
var
  La: TOrmData<Takt_in>;
begin
  La.Init;
  try
    Result := La.Select.Where('spec_id', '''' + aSpecId.ToString + '''').ExCount + 1;
  finally
    La.dest;
  end;

end;

function TViewControl.GetLastAtkOutNumber(aSpecId: Integer): integer;
var
  La: TOrmData<Takt_out>;
begin
  La.Init;
  try
    Result := La.Select.Where('spec_id', '''' + aSpecId.ToString + '''').ExCount + 1;

  finally
    La.dest;
  end;
end;

function TViewControl.GetLastSpecNumber(aContractNumber: string): integer;
var
  Lc: TOrmData<Tspec>;
begin
  Lc.Init;
  try
    Result := Lc.Select.Where('contract_number', '''' + aContractNumber + '''').ExCount
      + 1;

  finally
    Lc.dest;
  end;
//
end;

function TViewControl.GetOrganization(aOrganId: Integer): Torganization;
var
  Lo: TOrmData<Torganization>;
begin
  Lo.Init;
  try
    Result := Lo.Select.Where('id', aOrganId).Exc;
  finally
    Lo.dest;
  end;

end;

function TViewControl.GetOrganizations: TOrganArr;
var
  Lo: TOrmData<Torganization>;
begin
  Lo.Init;
  try
    Result := Lo.Select.ExcArr;
  finally
    Lo.dest;
  end;

end;

function TViewControl.GetPackage(aPackageId: integer): Tpackage;
var
  LP: TOrmData<Tpackage>;
  Lpb: TOrmData<Tpackage_build>;
begin
  LP.Init;
  try
    Result := LP.Select.where('id', aPackageId).Exc;
    Lpb.Init;
    try
      Result.packageBuildArr := Lpb.Select.where('package_id', aPackageId).ExcArr;
    finally
      Lpb.dest;
    end;
  finally
    LP.dest;
  end;

end;

function TViewControl.GetPackageArr: TpackageArr;
var
  Lp: TOrmData<Tpackage>;
begin
  Lp.Init;
  try
    Result := Lp.Select.ExcArr;
  finally
    Lp.dest;
  end;

end;

function TViewControl.GetPackageBuildArr(aPackageId: Integer): Tpackage_buildArr;
var
  Lpb: TOrmData<Tpackage_build>;
begin
  Lpb.Init;
  try
    Result := Lpb.Select.where('package_id', aPackageId).ExcArr;
  finally
    Lpb.dest;
  end;

end;

function TViewControl.GetPayBack(aDayCount: integer): TPayBack;
var
  LP: TOrmData<TPayBack>;
begin
  LP.Init;
  try
    Result := LP.Select('day<=' + aDayCount.ToString + ' order by id desc limit 1');
    if Result.id = 0 then
    begin
      Result := LP.Select.Min('count').Exc;

    end;
  finally
    LP.dest;
  end;

end;

function TViewControl.GetPersone(aPersoneId: Integer): Tpart_persone;
var
  Manager: TOrmData<Tpart_persone>;
  LPersone: Tpart_persone;
  adress: TOrmData<Tadressbook_persone>;
  i: Integer;
begin
  Manager.Init;
  try
    adress.Init;
    try

      LPersone := Manager.Select('id=' + aPersoneId.ToString);

      LPersone.adressbook := adress.SelectArr('part_persone_id=' + LPersone.id.ToString);

      Result := LPersone;
    finally
      adress.dest;
    end;
  finally
    Manager.dest;
  end;
end;

function TViewControl.GetPersones: TPartPersoneArr;
var
  Lp: TViewOrmControl<Tpart_persone>;
begin

  Result := Lp.GetObjArr();

end;

function TViewControl.GetPosition(aPositionId: Integer): TPosition;
var
  LPos: TOrmData<TPosition>;
  LPrice: TOrmData<TPosition_Base_Price>;
begin
  LPos.Init;
  try
    LPrice.Init;
    try
      Result := LPos.Select('id=' + aPositionId.ToString);
      Result.BasePriceArr := LPrice.SelectArr('position_id=' + aPositionId.ToString);
    finally
      LPrice.dest;
    end;
  finally
    LPos.dest;
  end;
end;

function TViewControl.GetPositionArr: TPositionArr;
var
  LPos: TOrmData<TPosition>;
  LPrice: TOrmData<TPosition_Base_Price>;
begin
  LPos.Init;
  try

    Result := LPos.Select.ExcArr;

  finally
    LPos.dest;
  end;

end;

function TViewControl.GetPriorityGroup: Tpriority_groupArr;
var
  Lp: TOrmData<Tpriority_group>;
begin
  Lp.Init;
  try
    Result := Lp.SelectArr('');
  finally
    Lp.dest;
  end;

end;

function TViewControl.GetRegion(aRegionId: Integer): TRegion;
var
  LReg: TOrmData<TRegion>;
begin
  LReg.Init;
  try
    Result := LReg.Select('id=' + aRegionId.ToString);
  finally
    LReg.dest;
  end;

end;

function TViewControl.GetRegions: TRegionArr;
var
  Lr: TOrmData<TRegion>;
begin
  Lr.Init;
  try
    result := Lr.SelectArr('');
  finally
    Lr.dest;
  end;

end;

function TViewControl.GetRemainsPosition(aPositionId, aSkladId: Integer):
  TRemains_position;
var
  LR: TOrmData<TRemains_position>;
begin
  LR.Init;
  try
    Result := LR.Select('SELECT p.id as position_id,ifnull((SELECT SUM(sa.count) FROM sklad_arrival AS sa WHERE sa.position_id=p.id AND sa.sklad_id=:sid and items_arrival_id<>3 ),0)  '
      + ' - ifnull((SELECT SUM(se.count) FROM sklad_expense AS se WHERE se.position_id=p.id AND se.sklad_id=:sid),0) AS count FROM position AS p '
      + ' LEFT JOIN unit_ AS u ON p.unit__id=u.id where p.id=:pid', [cp('pid',
      aPositionId), cp('sid', aSkladId)]);
  finally
    LR.dest;
  end;
end;

function TViewControl.GetSklad(aSkladId: integer): TSklad;
var
  LSklad: TOrmData<TSklad>;
begin
  LSklad.Init;
  try
    Result := LSklad.Select('id=' + aSkladId.ToString);

  finally
    LSklad.dest;
  end;

end;

function TViewControl.GetSkladArr: TSkladArr;
var
  Ls: TOrmData<TSklad>;
begin
  Ls.Init;
  try
    result := Ls.SelectArr('');
  finally
    Ls.dest;
  end;

end;

function TViewControl.GetSkladArrival(aSkladArivalId: Integer): TSklad_Arrival;
var
  Ls: TOrmData<TSklad_Arrival>;
begin
  Ls.Init;
  try
    Result := Ls.Select.where('sklad_arrival.id', aSkladArivalId).Exc;

  finally
    Ls.dest;
  end;

end;

function TViewControl.GetSkladExpense(aSkladExpenseId: Integer): TSklad_Expense;
var
  Ls: TOrmData<TSklad_Expense>;
begin
  Ls.Init;
  try
    Result := Ls.Select.where('sklad_expense.id', aSkladExpenseId).Exc;

  finally
    Ls.dest;
  end;

end;

function TViewControl.GetSpectPosition(aSpecId: integer): Tspec_positionArr;
var
  Lp: TOrmData<Tspec_position>;
  i: integer;
begin
  Lp.init;
  try
    Result := Lp.SelectArr('spec_position.spec_id=' + aSpecId.ToString);
    for i := 0 to Result.Count - 1 do
    begin
      Result.Items[i].position := GetPosition(Result.Items[i].position_id);
    end;

  finally
    Lp.dest;
  end;

end;

function TViewControl.GetTypeParts: TType_partArr;
var
  LU: TOrmData<TType_part>;
begin
  LU.Init;
  try
    Result := LU.Select.ExcArr;
  finally
    LU.dest;
  end;
end;

function TViewControl.GetUnits: TUnitArr;
var
  LU: TOrmData<TUnit_>;
begin
  LU.Init;
  try
    Result := LU.SelectArr('');
  finally
    LU.dest;
  end;
end;

function TViewControl.GetUser(aUserId: integer): TUser;
var
  Lu: TOrmData<TUser>;
begin
  Lu.Init;
  try
    Result := Lu.Select('id=' + aUserId.ToString);
  finally
    Lu.dest;
  end;

end;

function TViewControl.InsertContract(aContract: TContract): Integer;
var
  Lc: TOrmData<TContract>;
begin
  Lc.Init;
  try
    Result := Lc.Insert(aContract);

  finally
    Lc.dest;
  end;
end;

function TViewControl.InsertDeal(aDeal: TDeal): integer;
var
  Ld: TOrmData<TDeal>;
begin
  Ld.Init;
  try
    Result := Ld.Insert(aDeal);

  finally
    Ld.dest;
  end;

end;

function TViewControl.InsertDiscount(aDiscount: TDiscount): integer;
var
  Ld: TOrmData<TDiscount>;
begin
  Ld.Init;
  try
    Result := Ld.Insert(aDiscount);
  finally
    Ld.dest;
  end;

end;

function TViewControl.InsertOrganization(aOrgan: Torganization): integer;
var
  Lo: TOrmData<Torganization>;
begin
  Lo.Init;
  try
    Result := Lo.Insert(aOrgan);
  finally
    Lo.dest;
  end;

end;

function TViewControl.InsertPackage(aPackage: Tpackage): integer;
var
  Lp: TOrmData<Tpackage>;
  Lpb: TOrmData<Tpackage_build>;
  I: Integer;
begin
  Lp.Init;
  try
    Result := Lp.Insert(aPackage);
    Lpb.init;
    try
      for I := 0 to aPackage.packageBuildArr.Count - 1 do
      begin
        aPackage.packageBuildArr.Items[I].package_id := Result;
        Lpb.Insert(aPackage.packageBuildArr[I]);
      end;
    finally
      Lpb.dest;
    end;

  finally
    Lp.dest;
  end;

end;

function TViewControl.InsertSkladArrival(aSkladArrival: TSklad_Arrival): Integer;
var
  Ls: TOrmData<TSklad_Arrival>;
begin
  Ls.Init;
  try
    Result := Ls.Insert(aSkladArrival);
  finally
    Ls.dest;
  end;

end;

function TViewControl.InsertSkladExpense(aSkladExpense: TSklad_Expense): integer;
var
  Ls: TOrmData<TSklad_Expense>;
begin
  Ls.Init;
  try
    Result := Ls.Insert(aSkladExpense);
  finally
    Ls.dest;
  end;
end;

function TViewControl.LastNumberContractFromDate(aDate: TDate): integer;
var
  LC: TOrmData<TContract>;
begin
  LC.Init;
  try
    Result := LC.Where('date', '''' + FormatDateTime('yyyy-MM-dd', now) + '''').ExCount;
  finally
    LC.dest;
  end;

end;

function TViewControl.LoginUser(aLogin, aPass: string): Boolean;
var
  LU: TOrmData<TUser>;
begin
  LU.Init;
  try
    Result := False;
    datamanager.User := LU.Select('login=''' + aLogin + ''' and pass=''' + aPass + '''');
    if datamanager.User.id > 0 then
      Result := True;
  finally
    LU.dest;
  end;
end;

procedure TViewControl.OpenGuide;
var
  f: TfrmGuide;
begin
  f := TfrmGuide.Create(UniApplication);
  f.Show();
end;

procedure TViewControl.test;
var
  Manager: TOrmData<Tpart_persone>;
  LPersone: Tpart_persone;
  adress: TOrmData<Tadressbook_persone>;
  i: Integer;
begin
  Manager.Init;
  adress.Init;
  // with  LPersone do
  // begin
  // fio:='test';
  // date_birthday:=now();
  // place_birth:='this';
  // doc_serial:='33333333';
  // doc_number:='4444444';
  // doc_reg:='qwewqeqwe';
  //
  // end;
  // Manager.Insert(LPersone);
  datamanager.PartPersone := Manager.SelectArr('');
  for i := 0 to datamanager.PartPersone.Count - 1 do
  begin
    datamanager.PartPersone.items[i].adressbook := adress.SelectArr('part_persone_id='
      + datamanager.PartPersone.items[i].id.ToString);
  end;
  Manager.dest;
end;

procedure TViewControl.UpdateCalcLspr200(aCalc: Tcalc_lrsp200);
var
  Lc: TOrmData<Tcalc_lrsp200>;
  Ls: TOrmData<Tcalc_lrsp200_section>;
  Lp: TOrmData<Tcalc_lrsp200_position>;
  I: Integer;
begin
  Lc.Init;
  try
    Ls.Init;
    try
      Lp.Init;
      try

        Lc.Update(aCalc);
        for I := 0 to aCalc.Section.Count - 1 do
        begin

          Ls.Update(aCalc.Section[I]);
        end;
        for I := 0 to aCalc.Position.Count - 1 do
        begin

          Lp.Update(aCalc.Position[I]);
        end;

      finally
        Lp.dest;
      end;
    finally
      Ls.dest;
    end;
  finally
    Lc.dest;
  end;

end;

procedure TViewControl.UpdateContract(aContract: TContract);
var
  Lc: TOrmData<TContract>;
begin
  Lc.init;
  try
    Lc.Update(aContract);
  finally
    Lc.dest;
  end;

end;

procedure TViewControl.UpdateDeal(aDeal: TDeal);
var
  Ld: TOrmData<TDeal>;
begin
  Ld.Init;
  try
    Ld.Update(aDeal);
  finally
    Ld.dest;
  end;

end;

procedure TViewControl.UpdateDiscount(aDiscount: TDiscount);
var
  Ld: TOrmData<TDiscount>;
begin
  Ld.Init;
  try
    Ld.Update(aDiscount);
  finally
    Ld.dest;
  end;
end;

procedure TViewControl.UpdateEntity(aEntity: Tpart_entity);
var
  LManEn: TOrmData<Tpart_entity>;
  Ladrr: TOrmData<Tadressbook_entity>;
  i: Integer;
begin
  LManEn.Init;
  try
    Ladrr.Init;
    try
      LManEn.Update(aEntity);
      for i := 0 to aEntity.adressbook.Count - 1 do
      begin
        Ladrr.Update(aEntity.adressbook[i]);
      end;
    finally
      Ladrr.dest;
    end;
  finally
    LManEn.dest;
  end;
end;

procedure TViewControl.UpdateKef(aKef: TKef);
var
  Lk: TOrmData<TKef>;
begin
  Lk.Init;
  try
    Lk.Update(aKef);
  finally
    Lk.dest;
  end;

end;

procedure TViewControl.UpdateOrganization(aOrgan: Torganization);
var
  Lo: TOrmData<Torganization>;
begin
  Lo.Init;
  try
    Lo.Update(aOrgan);
  finally
    Lo.dest;
  end;

end;

procedure TViewControl.Updatepackage(aPackage: Tpackage);
var
  Lp: TOrmData<Tpackage>;
  Lpb: TOrmData<Tpackage_build>;
  I: Integer;
begin
  Lp.Init;
  try
    Lp.Update(aPackage);
    Lpb.Init;
    try
      for I := 0 to aPackage.packageBuildArr.Count - 1 do
      begin
        if aPackage.packageBuildArr[I].id = 0 then
        begin
          Lpb.Insert(aPackage.packageBuildArr[I]);
        end
        else
        begin
          Lpb.Update(aPackage.packageBuildArr[I]);
        end;

      end;

    finally
      Lpb.dest;
    end;
  finally
    Lp.dest;
  end;

end;

procedure TViewControl.UpdatePersone(aPersone: Tpart_persone);
var
  LManagerPersone: TOrmData<Tpart_persone>;
  LAdressManager: TOrmData<Tadressbook_persone>;
  i: Integer;
begin
  LManagerPersone.Init;
  try
    LAdressManager.Init;
    try
      LManagerPersone.Update(aPersone);
      for i := 0 to aPersone.adressbook.Count - 1 do
      begin
        LAdressManager.Update(aPersone.adressbook[i]);
      end;
    finally
      LAdressManager.dest;
    end;
  finally
    LManagerPersone.dest;
  end;
end;

procedure TViewControl.UpdatePosition(aPosition: TPosition);
var
  LPos: TOrmData<TPosition>;
begin
  LPos.Init;
  try
    LPos.Update(aPosition);
  finally
    LPos.dest;
  end;
end;

procedure TViewControl.UpdateRegion(aRegion: TRegion);
var
  LReg: TOrmData<TRegion>;
begin
  LReg.Init;
  try
    LReg.Update(aRegion);
  finally
    LReg.dest;
  end;

end;

procedure TViewControl.UpdateSklad(aSklad: TSklad);
var
  LSklad: TOrmData<TSklad>;
begin
  LSklad.Init;
  try
    LSklad.Update(aSklad);

  finally
    LSklad.dest;
  end;

end;

procedure TViewControl.UpdateSkladArrival(aSkladArrival: TSklad_Arrival);
var
  Ls: TOrmData<TSklad_Arrival>;
begin
  Ls.Init;
  try
    Ls.Update(aSkladArrival);
  finally
    Ls.dest;
  end;

end;

procedure TViewControl.UpdateSkladExpense(aSkladArrival: TSklad_Expense);
var
  Ls: TOrmData<TSklad_Expense>;
begin
  Ls.Init;
  try
    Ls.Update(aSkladArrival);
  finally
    Ls.dest;
  end;

end;

procedure TViewControl.UpdateUser(aUSer: TUser);
var
  Lu: TOrmData<TUser>;
begin
  Lu.Init;
  try
    Lu.Update(aUSer);
  finally
    Lu.dest;
  end;

end;

{ TViewOrmContral<T> }

procedure TViewOrmControl<T>.Del(aTId: integer);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    LOrm.Hide(aTId);
  finally
    LOrm.dest;
  end;

end;

function TViewOrmControl<T>.GetObjArr(aWhere: string = ''): TArrayRecord<t>;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    if aWhere = '' then
    begin
      Result := LOrm.Select.ExcArr;
    end
    else
    begin
      Result := LOrm.Select.Where(aWhere).ExcArr;
    end;
  finally
    LOrm.dest;
  end;

end;

function TViewOrmControl<T>.GetObjFromId(aTId: Integer): T;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    Result := LOrm.Select.Where(LtblStr + '.id', aTId).Exc;
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.GetPart(aPartType, aPartId: integer; var aT: T);
var
  PartProperty: string;
  rttiContext: TRttiContext;
  fld: TRttiField;
begin
  case aPartType of
    2:
      begin
        PartProperty := 'Tpart_entity';
      end;
    1:
      PartProperty := 'Tpart_persone';
  end;
  for fld in rttiContext.GetType(TypeInfo(T)).GetFields do
  begin
    if fld.FieldType.ToString = PartProperty then
    begin
      case aPartType of
        2:
          begin
            var Le: Tpart_entity;
            var LOrmE: TViewOrmControl<Tpart_entity>;
            Le := LOrmE.GetObjFromId(aPartId);
            fld.SetValue(@aT, TValue.From<Tpart_entity>(Le));

          end;
        1:
          begin
            var Le: Tpart_persone;
            var LOrmE: TViewOrmControl<Tpart_persone>;
            Le := LOrmE.GetObjFromId(aPartId);
            fld.SetValue(@aT, TValue.From<Tpart_persone>(Le));

          end;

      end;
      exit;
    end;
  end;
end;

function TViewOrmControl<T>.insert(aT: T; aNested: boolean = False): integer;
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    Result := LOrm.Insert(aT, aNested);
  finally
    LOrm.dest;
  end;
end;

procedure TViewOrmControl<T>.InsertArr(atArr: TArrayRecord<t>; aNested: boolean = False);
var
  LOrm: TOrmData<T>;
  i: integer;
begin
  LOrm.Init;
  try
    for i := 0 to atArr.Count - 1 do
      LOrm.Insert(atArr[i], aNested);
  finally
    LOrm.dest;
  end;

end;

procedure TViewOrmControl<T>.Update(aT: T; aNested: boolean = False);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    LOrm.Update(aT, aNested);
  finally
    LOrm.dest;
  end;

end;

{ TORM<T> }

class function TIceORM<T>.GetObjArr(aWhere: string): TArrayRecord<t>;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    if aWhere = '' then
    begin
      Result := LOrm.Select.ExcArr;
    end
    else
    begin
      Result := LOrm.Select.Where(aWhere).ExcArr;
    end;
  finally
    LOrm.dest;
  end;

end;

class function TIceORM<T>.GetObjFromId(aTId: Integer): T;
var
  LOrm: TOrmData<T>;
  LTypeInfo: PTypeInfo;
  LtblStr: string;
begin
  LTypeInfo := TypeInfo(T);
  LtblStr := LTypeInfo.Name;
  Delete(LtblStr, 1, 1);
  LOrm.Init;
  try
    Result := LOrm.Select.Where(LtblStr + '.id', aTId).Exc;
  finally
    LOrm.dest;
  end;

end;

class function TIceORM<T>.Insert(aT: T; aNested: boolean): integer;
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    Result := LOrm.Insert(aT, aNested);
  finally
    LOrm.dest;
  end;

end;

class procedure TIceORM<T>.Update(aT: T; aNested: boolean);
var
  LOrm: TOrmData<T>;
begin
  LOrm.Init;
  try
    LOrm.Update(aT, aNested);
  finally
    LOrm.dest;
  end;

end;

end.

