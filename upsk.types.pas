unit upsk.types;

interface

uses
  ArrayHelper, System.Rtti;

const
  InProp = 'inprop';
  NoReprot = 'noreport';
  InTable = 'intable';
  NoInsertUpdate = 'noinsertupdate';

type
  Tcalc_kef = record
    id: integer;
    calc_id: integer;
    day: Integer;
    price: Double;
    amount: integer;
  end;

  Tcalc_kefArr = TArrayRecord<Tcalc_kef>;

  TSettings = record
    id: integer;
    field_name: string;
    value: string;
  end;

type
  Tcash_out_items = record
    id: integer;
    name: string;
  end;

  TTcash_out_itemsArr = TArrayRecord<Tcash_out_items>;

type
  Tcash_in_items = record
    id: integer;
    name: string;
  end;

  TTcash_in_itemsArr = TArrayRecord<Tcash_in_items>;

type
  Tcash_in = record
    id: integer;
    deal_id: integer;
    cash_in_items: Tcash_in_items;
    cash_in_items_id:integer;
    amount: Double;
    comment: string;
    date: TDate;
  end;

  Tcash_inArr = TArrayRecord<Tcash_in>;

type
  Tcash_out = record
    id: integer;
    deal_id: integer;
    cash_out_items: Tcash_out_items;
    amount: Double;
    comment: string;
    date: TDate;
  end;

  Tcash_outArr = TArrayRecord<Tcash_out>;

type
  Ttype_delivery = record
    id: integer;
    name: string;
  end;

  Ttype_deliveryArr = TArrayRecord<Ttype_delivery>;

type
  TDriver = record
    id: integer;
    FIO: string;
  end;

  TDriverArr = TArrayRecord<Tdriver>;

type
  TAuto = record
    id: integer;
    name: string;
  end;

  TAutoArr = TArrayRecord<TAuto>;

type
  Tdelivery = record
    id: integer;
    deal_id: integer;
    auto: TAuto;
    driver: TDriver;
    date: TDate;
    price: integer;
    type_delivery: Ttype_delivery;
    adress: string;
  end;

  TdeliveryArr = TArrayRecord<Tdelivery>;

type
  TPayBack = record
    id: integer;
    day: integer;
    count: integer;
  end;

type
  Alias = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName write FName;
  end;

type
  TPriority = record
    id: Integer;
    discription: string;
    class_name: string;
    operation: string;
    priority_group_id: Integer;
  end;

  TPriorityArr = TArrayRecord<TPriority>;

type
  Tpriority_group = record
    id: integer;
    name: string;
  end;

  Tpriority_groupArr = TArrayRecord<Tpriority_group>;

type
  TUser = record
    id: integer;
    fio: string;
    login: string;
    pass: string;
    post: string;
    region_id: integer;
    priority_group_id: integer;
    priority: TPriorityArr
  end;

type
  TSklad = record
    id: integer;
    name: string;
  end;

  TSkladArr = TArrayRecord<TSklad>;

type
  TRegion = record
    id: integer;
    name: string;
    kef: Double;
    sklad_id: integer;
  end;

  TRegionArr = TArrayRecord<TRegion>;

type
  Tadressbook_persone = record
    id: integer;
    part_persone_id: integer;
    name: string;
    phone: string;
  end;

type
  Tpart_persone = record
    id: integer;
    fio, fioR, fioIO: string;
    InFace: string;
    date_birthday: TDate;
    place_birth: string;
    doc_serial: string;
    doc_number: string;
    doc_issued: string;
    doc_reg: string;
    adressbook: TArrayRecord<Tadressbook_persone>;
  end;

  TPartPersoneArr = TArrayRecord<Tpart_persone>;

type
  Tadressbook_entity = record
    id: integer;
    part_entity_id: integer;
    name: string;
    phone: string;
  end;

  Tadressbook_entityArr = TArrayRecord<Tadressbook_entity>;

type
  Tpart_entity = record
    id: integer;
    name, in_face, fio_manager, base_contract, en_adress, mail_adress,
      fio_managerR, fio_managerIO, conract_number, inn, kpp, ogrn, email,
      bank_name, bank_rorder, bank_korder, bank_bik, Attorney: string;
    nds: integer;
   // adressbook: TArrayRecord<Tadressbook_entity>;
    adressbook: Tadressbook_entityArr
  end;

  TPartEntityArr = TArrayRecord<Tpart_entity>;

type
  TPosition_Base_Price = record
    id: integer;
    Position_Id: integer;
    Price: Double;
    User_Id: integer;
    DateTime: TDateTime;
  end;

type
  TUnit_ = record
    id: integer;
    Full_Name: string;
    name: string;
    Unit_Id: integer;
    Base_Value: integer;
  end;

  TUnitArr = TArrayRecord<TUnit_>;

type
  TPosition = record
    id: integer;
    name: string;
    Description: string;
    Unit__Id: integer;
    Unit_: TUnit_;
    Length: Double;
    Width: Double;
    Height: Double;
    Weight: Double;
    Base_Price: Double;
    Release_Price: Double;
    Recovery_Price: Double;
    Clear_Price: Double;
    BasePriceArr: TArrayRecord<TPosition_Base_Price>;
    [Alias(InProp)] //для внутреннего использования
    Count: Double;
    not_delete: integer;
  end;

  TPositionArr = TArrayRecord<TPosition>;

type
  TKef = record
    id: integer;
    package_id: integer;
    oper_count: string;
    count: integer;
    oper_day: string;
    day: integer;
    value: Double;
  end;

  TKefArr = TArrayRecord<TKef>;

type
  Titems_arrival = record
    id: integer;
    name: string;
  end;

  Titems_arrivalArr = TArrayRecord<Titems_arrival>;

type
  Titems_expense = record
    id: integer;
    name: string;
  end;

  Titems_expenseArr = TArrayRecord<Titems_expense>;

type
  TSklad_Expense = record
    id: integer;
    sklad_id: integer;
    position_id: Integer;
    count: Double;
    items_expense_id: integer;
    user_id: Integer;
    datetime: TDateTime;
    comment: string;
    doc_number: string;
    doc_date: TDate;
    items_expense: Titems_expense;
    position: TPosition;
    deal_id: integer;
  end;

  TSklad_ExpenseArr = TArrayRecord<TSklad_Expense>;

type
  TSklad_Arrival = record
    id: integer;
    sklad_id: integer;
    position_id: Integer;
    count: Double;
    items_arrival_id: integer;
    user_id: Integer;
    datetime: TDateTime;
    comment: string;
    doc_number: string;
    doc_date: TDate;
    items_arrival: Titems_arrival;
    position: TPosition;
    deal_id: integer;
  end;

  TSklad_ArrivalArr = TArrayRecord<TSklad_Arrival>;

type
  TRemains_position = record
    Position_id: integer;
    Count: Double;
  end;

  TRemains_positionArr = TArrayRecord<TRemains_position>;

type
  Tpackage_build = record
    id: integer;
    package_id: integer;
    position_id: integer;
    Position: TPosition;
  end;

  Tpackage_buildArr = TArrayRecord<Tpackage_build>;

type
  Tpackage = record
    id: integer;
    name: string;
    packageBuildArr: Tpackage_buildArr;
  end;

  TpackageArr = TArrayRecord<Tpackage>;

  Torganization = record
    id: integer;
    name, in_face, fio_manager, fio_managerR, fio_managerIO, base_contract,
      en_adress, mail_adress, conract_number, inn, kpp, ogrn, email, bank_name,
      bank_rorder, bank_korder, bank_bik, Attorney: string;
    nds: integer;

  end;

  TOrganArr = TArrayRecord<Torganization>;

type
  TDiscount = record
    id: integer;
    name: string;
    price_square: Double;
    price_rental: Double;
    price_collateral: Double;
    price_flooring: Double;
  end;

  TDiscountArr = TArrayRecord<TDiscount>;

type
  TType_part = record
    id: integer;
    name: string;
    kef: Double;
  end;

  TType_partArr = TArrayRecord<TType_part>;

type
  Tcalc_lrsp200_section = record
    id: integer;
    calc_lrsp200_id: integer;
    width: integer;
    hegth: integer;
  end;

  Tcalc_lrsp200_sectionArr = TArrayRecord<Tcalc_lrsp200_section>;

type
  Tcalc_lrsp200_position = record
    id: Integer;
    calc_lrsp200_id: integer;
    position_id: Integer;
    calc_count: Integer;
    add_calc_count: Integer;
    price: Integer;
  end;

  Tcalc_lrsp200_positionArr = TArrayRecord<Tcalc_lrsp200_position>;

type
  Tcalc_lrsp200 = record
    id: Integer;
    Section: Tcalc_lrsp200_sectionArr;
    Position: Tcalc_lrsp200_positionArr;
    datatime: TDateTime;
    type_part: Integer;
    region_id: Integer;
    part_id: Integer;
    organization_id: Integer;
    phone: string;
    comment: string;
    rental_period: Integer;
    delivery: double;
    delivery_out: double;
    count_flooring: Integer;
    discount_id: Integer;
    payback: Integer;
    depos: double;
    add_OneKv: double;
    add_rental: double;
    add_depos: double;
    add_flooring: integer;
    price_amount_period: double;
    price_amount_calc: double;
    amount_square: integer;
    adress_object: string;
    price_rental_day: double;
    precent_colleteral: integer;
    add_count_ladder: integer;

  end;

  Tcalc_lrsp200Arr = TArrayRecord<Tcalc_lrsp200>;

type
  TContract = record
    id: Integer;
    part_id: Integer;
    [Alias(InProp)] //для внутреннего использования
    part_persone: Tpart_persone;
    [Alias(InProp)] //для внутреннего использования
    part_entity: Tpart_entity;
    part_type: Integer;
    organization_id: Integer;
    [Alias(InProp)]
    organization: Torganization;

    date: TDate;
    number_contract: string;
    p1_2: string;
    organ_name: string;
    organ_in_face: string;
    organ_en_adress: string;
    organ_mail_adress: string;
    organ_inn_kpp: string;
    organ_bank_rorder: string;
    organ_bank_korder: string;
    organ_bank_name: string;
    organ_bank_bik: string;
    organ_email: string;
    organ_ogrn: string;
    organ_fio_manager, organ_fio_managerR, organ_fio_managerIO: string;
    part_fio_managerR, part_fio_managerIO: string;
    part_name: string;
    part_in_face: string;
    part_en_adress: string;
    part_inn_kpp: string;
    part_mail_adress: string;
    part_bank_rorder: string;
    part_bank_korder: string;
    part_bank_name: string;
    part_bank_bik: string;
    part_email: string;
    part_ogrn: string;
    part_fio_manager: string;
    active: integer;
  end;

type
  Tspec_position = record
    id: Integer;
    spec_id: Integer;
    column_num: Integer;
    position_id: Integer;
    position: TPosition;
    pos_name: string;
    pos_count: Integer;
    pos_price: Double;
    pos_amount: Double;
    price_rental: Double;
    price_amount: Double;
  end;

  Tspec_positionArr = TArrayRecord<Tspec_position>;

type
  Tspec = record
    id: Integer;
    date: TDate;
    Position: Tspec_positionArr;
    contract_number: string;
    contract_date: tdate;
    number: integer;
    device_name: string;
    square: Integer;
    city_name: string;
    fio_manager: string;
    org_fio_manager: string;
    sum_rental: Double;
    sum_depos: Double;
    sum_delivery, sum_delivery_out: Double;
    sum_price: Double;
    rental_period: Integer;
    all_amount: Double;
    all_count_kv: integer;
    warning_price: string;
    price_rental_day:integer;
  end;

  Tcalc_type = record
    id: integer;
    name: string;
    descript: string;
  end;

  Tcalc_typeArr = TArrayRecord<Tcalc_type>;

type
  TOrder_pos = record
    id: integer;
    order_id: integer;
    Pos_number: integer;
    pos_name: string;
    pos_count: integer;
    pos_unity: string;
    pos_price: Double;

  end;

  Torder_posArr = TArrayRecord<TOrder_pos>;

type
  TOrder = record
    id: integer;
    date: TDate;
    create_datetime: TDateTime;
    User_id: integer;
    count_period: Integer;
    rental_price: Integer;
    document_id: integer;
    chk_rental: integer;
    chk_depos: integer;
    chk_delivery: integer;
    chk_delivery_out: integer;
    order_pos: Torder_posArr;
  end;

type
  Takt_in = record
    id: integer;
    number: integer;
    create_datetime: TDateTime;
    User_id: integer;
    spec_id: integer;
//    [Alias(InProp)] //для внутреннего использования
//    part_persone: Tpart_persone;
//    [Alias(InProp)] //для внутреннего использования
//    part_entity: Tpart_entity;
  end;

type
  Takt_out = record
    id: integer;
    number: integer;
    create_datetime: TDateTime;
    User_id: integer;
    spec_id: integer;
//    [Alias(InProp)] //для внутреннего использования
//    part_persone: Tpart_persone;
//    [Alias(InProp)] //для внутреннего использования
//    part_entity: Tpart_entity;
  end;

type
  Tdocument = record
    id: integer;
   // contract_id: Integer;
    spec_id: integer;
   // akt_out_id: integer;
    //akt_in_id: integer;
    contract: TContract;
    Spec: Tspec;
    akt_Out: Takt_out;
    akt_in: Takt_in;
  end;

type
  TDeal = record
    id: Integer;
    date: TDate;
    calc_id: Integer;
    calc_type_id: integer;
    calc_type: Tcalc_type;
    document_id: Integer;
    //[Alias(InProp)]
    document: TDocument;
    adress: string;
    start_rental_date: TDate;
    stop_rental_date: TDate;
    chk_pay: Integer;
    chk_copy_contract: Integer;
    chk_orig_contract: Integer;
    chk_device: Integer;
    chk_orig_upd: Integer;
    chk_copy_upd: Integer;
    chk_pay_deposit: Integer;
    region_id: integer;
    end_deal:integer;
  end;

  TDealArr = TArrayRecord<TDeal>;

implementation

{ Alias }

constructor Alias.Create(const Name: string);
begin
  FName := Name;
end;

end.

