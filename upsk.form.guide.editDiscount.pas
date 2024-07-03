unit upsk.form.guide.editDiscount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniEdit, uniLabel, uniButton, upsk.types;

type
  TfrmEditDiscount = class(TUniForm)
    edtName: TUniEdit;
    lbl1: TUniLabel;
    edtPriceSquare: TUniNumberEdit;
    lbl2: TUniLabel;
    edtPriceRentalPeriod: TUniNumberEdit;
    lbl21: TUniLabel;
    edtPriceCollateral: TUniNumberEdit;
    lbl22: TUniLabel;
    edtPriceFlooring: TUniNumberEdit;
    lbl23: TUniLabel;
    btnCancel: TUniButton;
    btnAccept: TUniButton;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEditDiscount: TfrmEditDiscount;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEditDiscount: TfrmEditDiscount;
begin
  Result := TfrmEditDiscount(UniMainModule.GetFormInstance(TfrmEditDiscount));
end;

procedure TfrmEditDiscount.btnAcceptClick(Sender: TObject);
var
  ld: Tdiscount;
begin
  ld.id := Self.Tag;
  ld.name := edtName.Text;
  ld.price_square := edtPriceSquare.Value;
  ld.price_rental := edtPriceRentalPeriod.Value;
  ld.price_collateral := edtPriceCollateral.Value;
  ld.price_flooring := edtPriceFlooring.Value;

  if ld.id > 0 then
    ViewControl.UpdateDiscount(ld)
  else
    ViewControl.InsertDiscount(ld);

  ModalResult := mrOk;
end;

procedure TfrmEditDiscount.UniFormAfterShow(Sender: TObject);
var
  ld: Tdiscount;
begin
  if Self.Tag > 0 then
  begin
    ld := ViewControl.GetDiscount(Self.Tag);
    edtName.Text := ld.name;
    edtPriceSquare.Value := ld.price_square;
    edtPriceRentalPeriod.Value := ld.price_rental;
    edtPriceCollateral.Value := ld.price_collateral;
    edtPriceFlooring.Value := ld.price_flooring;

  end;
end;

end.

