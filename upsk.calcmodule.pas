unit upsk.calcmodule;

interface

uses
  System.Generics.Collections, upsk.types, math;

type
  TCalc = record
  public

    function FrameCount(aPosition: TPosition; aWidth, aHeigth: Double): integer;
    function FrameLadderCount(aPosition: TPosition; aHeigth: Double): integer;
    function LinkCount(aFrames, aLadder: integer): integer;
    function WoodenBridgeCount(aSectionCount: integer): Integer;
    function SectionCount(aPosition: TPosition; aHeigth, aWidth: integer): integer;
    function BoltCount(aSectionCount: integer): integer;
    function ShoesCount(aAllCountFrameDown: Integer): integer;

  end;

implementation

{ TCalc }

function TCalc.LinkCount( aFrames, aLadder: integer): integer;
begin
//  Result := ceil(aWidth/aPosition.Width) * FrameLadderCount(aPosition, aHeigth);
//Result:=
end;

function TCalc.SectionCount(aPosition: TPosition; aHeigth, aWidth: integer): Integer;
var
  Lh, lw: Double;
begin
  Lh := FrameLadderCount(aPosition, aHeigth);
  lw := FrameCount(aPosition, aWidth, aHeigth);
  Result := ceil(lh*(ceil(aWidth/aPosition.Width)));

end;

function TCalc.ShoesCount(aAllCountFrameDown: Integer): integer;
begin
  Result := aAllCountFrameDown * 2;
end;

function TCalc.BoltCount(aSectionCount: integer): integer;
begin
  Result := aSectionCount * 2;
end;

function TCalc.WoodenBridgeCount(aSectionCount: integer): Integer;
begin
  Result := aSectionCount * 3;
end;

function TCalc.FrameCount(aPosition: TPosition; aWidth, aHeigth: Double): integer;
begin
  Result := Ceil((aWidth / aPosition.Width)) * FrameLadderCount(aPosition, aHeigth) - (FrameLadderCount(aPosition, aHeigth)) ;
end;

function TCalc.FrameLadderCount(aPosition: TPosition; aHeigth: Double): integer;
begin
  Result := Ceil(aHeigth / aPosition.Height);
end;

end.

