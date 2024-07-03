unit IceOrm.types;

interface
const
  InProp = 'inprop';

type
  Alias = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName write FName;
  end;

implementation

{ Alias }

constructor Alias.Create(const Name: string);
begin
    FName := Name;
end;

end.

