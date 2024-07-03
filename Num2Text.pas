{ **** UBPFD *********** by delphibase.endimus.com ****
>> Функция, представляющая вещественные числа словами

Набор функций, преобразующих целые и вещественные числа в текстовое
представление (с единицами измерения и без).

function FloatToText(R: Double; Precision: Integer): string;
Преобразует вещественное число в текстовое представление с точностью
до Precision <= 4 знаков после запятой.

function AmountOfUnits(AUnit: TRusWord; R: Double; Precision: Integer;
Options: TNumberToTextOptions): string;
То же, что и FloatToText, но с учётом единицы измерения и опциями:
ntoExplicitZero: "ноль целых"
ntoMinus, ntoPlus: "минус", "плюс".
ntoNotReduceFrac: "пятьдесят сотых" вместо "пяти десятых".

function CountOfUnits(AUnit: TRusWord; N: Int64;
Options: TNumberToTextOptions): string;
То же для целых чисел. Все функции модуля реализованы через неё.

function CurrencyToText(ASum: Currency): string;
ещё одна реализация суммы прописью.

Зависимости: SysUtils
Автор:       reonid, reonid@yahoo.com, ICQ:104985721, Москва
Copyright:   Елисеев Леонид
Дата:        15 июля 2002 г.
***************************************************** }

unit Num2Text;

interface

type

  TNumberToTextOptions = set of (ntoExplicitZero, ntoMinus, ntoPlus, ntoDigits,
    ntoNotReduceFrac);

  TGender = (genNeuter, genMasculine, genFeminine);
  // Род: нейтральный, мужской, женский

  TRusWord = record
    Gender: TGender;
    Base: string;
    End1: string;
    End2: string;
    End5: string;
  end;

const

  MaxPrecision = 4; // до десятитысячных

  WD_EMPTY: TRusWord = (
    Gender: genMasculine;
    Base: '';
    End1: '';
    End2: '';
    End5: '';
    );

  {разряды}

  WD_THOUSEND: TRusWord = (
    Gender: genFeminine;
    Base: 'тысяч';
    End1: 'а';
    End2: 'и';
    End5: '';
    );

  WD_MILLION: TRusWord = (
    Gender: genMasculine;
    Base: 'миллион';
    End1: '';
    End2: 'а';
    End5: 'ов';
    );

  WD_MILLIARD: TRusWord = (
    Gender: genMasculine;
    Base: 'миллиард';
    End1: '';
    End2: 'а';
    End5: 'ов';
    );

  {Дробная часть}

  WD_INT: TRusWord = (
    Gender: genFeminine;
    Base: 'цел';
    End1: 'ая';
    End2: 'ых';
    End5: 'ых';
    );

  WD_FRAC: array[1..4] of TRusWord = (
    (Gender: genFeminine;
    Base: 'десят';
    End1: 'ая';
    End2: 'ых';
    End5: 'ых'; ),

    (Gender: genFeminine;
    Base: 'coт';
    End1: 'ая';
    End2: 'ых';
    End5: 'ых'; ),

    (Gender: genFeminine;
    Base: 'тысячн';
    End1: 'ая';
    End2: 'ых';
    End5: 'ых'; ),

    (Gender: genFeminine;
    Base: 'десятитысячн';
    End1: 'ая';
    End2: 'ых';
    End5: 'ых'; )
    );

  {Рубли, копейки}

  WD_RUBLE: TRusWord = (
    Gender: genMasculine;
    Base: 'рубл';
    End1: 'ь';
    End2: 'я';
    End5: 'ей';
    );

  WD_KOPECK: TRusWord = (
    Gender: genFeminine;
    Base: 'копе';
    End1: 'йка';
    End2: 'йки';
    End5: 'ек';
    );

function CurrencyToText(ASum: Currency): string;
function FloatToText(R: Double; Precision: Integer): string;

function CountOfUnits(AUnit: TRusWord; N: Int64;
  Options: TNumberToTextOptions): string;
function AmountOfUnits(AUnit: TRusWord; R: Double; Precision: Integer;
  Options: TNumberToTextOptions): string;

implementation

uses
  SysUtils;

const
  TenIn: array[1..4] of Integer = (10, 100, 1000, 10000);

type

  {------------------------------------------------------------------------------}

  TNumberAnalyser = class
  private
    FUnitWord: TRusWord;
    FNumber: Integer;
    FFirstLevel: Integer;
    FSecondLevel: Integer;
    FThirdLevel: Integer;
    function GetLevels(I: Integer): Integer;
    procedure SetNumber(AValue: Integer);
    function GetNumberInWord(N, Level: Integer): string;
    function GetGender: TGender;
    function Convert: string;
  public
    property Gender: TGender read GetGender;
    property Levels[I: Integer]: Integer read GetLevels;
    property Number: Integer read FNumber write SetNumber;
    property UnitWord: TRusWord read FUnitWord write FUnitWord;

    function UnitWordInRightForm: string;
    function ConvertToText(AUnit: TRusWord; ANumber: Integer): string;
  end;

var
  NumberAnalyser: TNumberAnalyser;

  {------------------------------------------------------------------------------}

function CurrencyToText(ASum: Currency): string;
var
  RubSum, KopSum: Int64;
  s: string;
begin
  RubSum := Trunc(ASum);
  KopSum := Round(Frac(ASum) * 100);

  Result := CountOfUnits(WD_RUBLE, RubSum, [{ntoExplicitZero, ntoMinus}]) + ' '
    + CountOfUnits(WD_KOPECK, KopSum, [ntoDigits]); // Копейки в цифрах

  if Result <> '' then
    Result[1] := AnsiUpperCase(Result[1])[1]; // С большой буквы
end;

{------------------------------------------------------------------------------}

function FloatToText(R: Double; Precision: Integer): string;
begin
  Result := AmountOfUnits(WD_EMPTY, R, Precision, [ntoExplicitZero, ntoMinus]);
end;

{------------------------------------------------------------------------------}

function AmountOfUnits(AUnit: TRusWord; R: Double; Precision: Integer;
  Options: TNumberToTextOptions): string;
var
  n_int, n_frac: Integer;
begin
  // опция ntoDigits не используется за ненадобностью

  // Количество цифр после запятой
  if Precision < 0 then
    Precision := 0;
  if Precision > MaxPrecision then
    Precision := MaxPrecision;

  if (R > 0) and (ntoPlus in Options) then
    Result := 'плюс ';
  if (R < 0) and (ntoMinus in Options) then
    Result := 'минус ';

  R := Abs(R);

  // Если Precision = 0, т.е. без дробной части, округляется в большую сторону
  if Precision > 0 then
    n_int := Trunc(R)
  else
    n_int := Round(R);

  // Дробная часть
  n_frac := Round((R - n_int) * TenIn[Precision]);

  // Отбрасывание нулей в дробной части
  // опция ntoNotReduceFrac не работает при n_frac = 0 (т.е. не будет "ноль сотых")
  if not (ntoNotReduceFrac in Options) then
    while (n_frac mod 10 = 0) and (Precision > 0) do
    begin
      n_frac := n_frac div 10;
      Dec(Precision);
    end;

  // Явная запись нуля
  if n_int = 0 then
    if n_frac = 0 then
    begin
      // При отсутствии дробной части "ноль" добавляется вне зависимости от опции ntoExplicitZero
      Result := {Result +} 'ноль ' + AUnit.Base + AUnit.End5;
      // "Result +" отброшено, чтобы избежать "минус ноль"
      // при очень маленькой дробной части за пределами точности
      Exit;
    end
    else if (ntoExplicitZero in Options) then
      Result := Result + 'ноль целых ';

  if {Precision = 0}  n_frac = 0 then
    Result := Result + CountOfUnits(AUnit, n_int, []) // N единиц
  else
    Result := Result + CountOfUnits(WD_INT, n_int, []); // столько-то целых

  if {(Precision = 0)}(n_frac = 0) then
    Exit;

  Result := Result + CountOfUnits(WD_FRAC[Precision], n_frac, []);
    // N десятых, сотых...
  Result := Result + AUnit.Base + AUnit.End2;
end;

{------------------------------------------------------------------------------}

function CountOfUnits(AUnit: TRusWord; N: Int64;
  Options: TNumberToTextOptions): string;
var
  Mrd, Mil, Th, Un: Integer;
begin
  Result := '';

  if (N = 0) and not (ntoExplicitZero in Options) then
    Exit;

  if not (ntoDigits in Options) then
  begin
    if (N < 0) and (ntoMinus in Options) then
      Result := 'минус '
    else if (N > 0) and (ntoPlus in Options) then
      Result := 'плюс '
    else if (N = 0) then
    begin
      Result := 'ноль ' + AUnit.Base + AUnit.End5;
      Exit;
    end;
  end
  else
  begin
    if (N < 0) and (ntoMinus in Options) then
      Result := '-'
    else if (N > 0) and (ntoPlus in Options) then
      Result := '+';
  end;

  N := Abs(N);

  if ntoDigits in Options then
  begin
    NumberAnalyser.Number := N;
    NumberAnalyser.UnitWord := AUnit;
    Result := Result + Format('%d %s', [N, NumberAnalyser.UnitWordInRightForm]);
  end
  else
  begin
    with NumberAnalyser do
    begin
      Mrd := (N div 1000000000) mod 1000;
      Mil := (N div 1000000) mod 1000;
      Th := (N div 1000) mod 1000;
      Un := (N) mod 1000;

      Result := Result
        + ConvertToText(WD_MILLIARD, Mrd)
        + ConvertToText(WD_MILLION, Mil)
        + ConvertToText(WD_THOUSEND, Th);

      if Un > 0 then
        Result := Result + ConvertToText(AUnit, Un)
      else
        Result := Result + AUnit.Base + AUnit.End5;
    end;
  end;
end;

{------------------- TNumberAnalyser ------------------------------------------}

function TNumberAnalyser.GetLevels(I: Integer): Integer;
begin
  case I of
    1: Result := FFirstLevel;
    2: Result := FSecondLevel;
    3: Result := FThirdLevel;
  end;
end;

procedure TNumberAnalyser.SetNumber(AValue: Integer);
begin
  if FNumber <> AValue then
  begin
    FNumber := AValue;
    FFirstLevel := FNumber mod 10;
    FSecondLevel := (FNumber div 10) mod 10;
    FThirdLevel := (FNumber div 100) mod 10;
    if FSecondLevel = 1 then
    begin
      FFirstLevel := FFirstLevel + 10;
      FSecondLevel := 0;
    end;
  end;
end;

function TNumberAnalyser.GetGender: TGender;
begin
  Result := FUnitWord.Gender;
end;

function TNumberAnalyser.GetNumberInWord(N, Level: Integer): string;
begin
  if Level = 1 then
    case N of
      0: Result := '';
      1: if Gender = genMasculine then
          Result := 'один'
        else if Gender = genFeminine then
          Result := 'одна'
        else if Gender = genNeuter then
          Result := 'одно';
      2: if Gender = genMasculine then
          Result := 'два'
        else if Gender = genFeminine then
          Result := 'две'
        else if Gender = genNeuter then
          Result := 'два';
      3: Result := 'три';
      4: Result := 'четыре';
      5: Result := 'пять';
      6: Result := 'шесть';
      7: Result := 'семь';
      8: Result := 'восемь';
      9: Result := 'девять';
      10: Result := 'десять';
      11: Result := 'одиннадцать';
      12: Result := 'двенадцать';
      13: Result := 'тринадцать';
      14: Result := 'четырнадцать';
      15: Result := 'пятнадцать';
      16: Result := 'шестнадцать';
      17: Result := 'семнадцать';
      18: Result := 'восемнадцать';
      19: Result := 'девятнадцать';
    end
  else if Level = 2 then
    case N of
      0: Result := '';
      1: Result := 'десять';
      2: Result := 'двадцать';
      3: Result := 'тридцать';
      4: Result := 'сорок';
      5: Result := 'пятьдесят';
      6: Result := 'шестьдесят';
      7: Result := 'семьдесят';
      8: Result := 'восемьдесят';
      9: Result := 'девяносто';
    end
  else if Level = 3 then
    case N of
      0: Result := '';
      1: Result := 'сто';
      2: Result := 'двести';
      3: Result := 'триста';
      4: Result := 'четыреста';
      5: Result := 'пятьсот';
      6: Result := 'шестьсот';
      7: Result := 'семьсот';
      8: Result := 'восемьсот';
      9: Result := 'девятьсот';
    end;
end;

function TNumberAnalyser.UnitWordInRightForm: string;
begin
  Result := UnitWord.Base;
  case Levels[1] of
    0, 5..19: Result := Result + UnitWord.End5;
    1: Result := Result + UnitWord.End1;
    2..4: Result := Result + UnitWord.End2;
  end;
end;

function TNumberAnalyser.Convert: string;
var
  i: Integer;
  s: string;
begin
  if FNumber = 0 then
    Result := ''
  else
  begin
    Result := '';
    for i := 3 downto 1 do
    begin
      s := GetNumberInWord(Levels[i], i);
      if s <> '' then
        Result := Result + s + ' ';
    end;
    Result := Result + UnitWordInRightForm + ' ';
  end;
end;

function TNumberAnalyser.ConvertToText(AUnit: TRusWord;
  ANumber: Integer): string;
begin
  UnitWord := AUnit;
  Number := ANumber;
  Result := Convert;
end;

{------------------------------------------------------------------------------}

initialization
  NumberAnalyser := TNumberAnalyser.Create;
finalization
  NumberAnalyser.Free;
end.
