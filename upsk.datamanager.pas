unit upsk.datamanager;

interface

uses
  upsk.types;

type
  TDataManager = record
  public
    PartPersone: TPartPersoneArr;
    PartEntity: TPartEntityArr;
    Position: TPositionArr;
    User:TUser;
  end;

var
  DataManager: TDataManager;

implementation

end.

