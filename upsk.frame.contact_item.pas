unit upsk.frame.contact_item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame,
  uniGUIBaseClasses, uniLabel, uniPanel;

type
  TfmContact = class(TUniFrame)
    lblName: TUniLabel;
    lblPhone: TUniLabel;
    pnl: TUniPanel;
  private
    FContactName: string;
    FPhone: string;
    procedure SetContactName(const Value: string);
    procedure SetPhone(const Value: string);
    { Private declarations }
  public
    property ContactName: string read FContactName write SetContactName;
    property Phone: string read FPhone write SetPhone;
    { Public declarations }
  end;

implementation

{$R *.dfm}



{ TUniFrame1 }

procedure TfmContact.SetContactName(const Value: string);
begin
  FContactName := Value;
  lblName.Caption := 'Контакт: ' + Value;
end;

procedure TfmContact.SetPhone(const Value: string);
begin
  FPhone := Value;
  lblPhone.Caption := 'Тел.: ' + Value;
end;

end.

