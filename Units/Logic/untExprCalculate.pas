unit untExprCalculate;

interface

uses
  System.SysUtils, clsStack, clsMatrix, untConstants, clsDataManager;

var
  ElementsStack: TStack<string>;

  function ExprCalculation(const AExpression: string): string;

implementation

function GetNewPriority(const AOperator: Char): ShortInt;
begin
  case AOperator of
    'A'..'Z', 'a'..'z', '0'..'9':
      Result := 7;
    '+', '-':
      Result := 1;
    '*', '/':
      Result := 3;
    '^':
      Result := 6;
    '(':
      Result := 9;
    ')':
      Result := 0;
    else
      Result := -1;
  end;
end;

function GetStackPriority(const AOperator: Char): ShortInt;
begin
  case AOperator of
    '_', 'A'..'Z', 'a'..'z', '0'..'9':
      Result := 8;
    '+', '-':
      Result := 2;
    '*', '/':
      Result := 4;
    '^':
      Result := 5;
    '(':
      Result := 0;
    else
      Result := -1;
  end;
end;

function OperandProcessing(var APointerPos: Integer; const AExpression: string; var AElementsStack: TStack<string>): string;
var
  i: Integer;
begin
  Result := '';
  i := 1;
  while (i <= Length(AExpression)) and (AExpression[i] in Symbols) do
  begin
    Result := Result + AExpression[i];
    Inc(i);
  end;
end;

procedure Calculate(var OperandStack: TStack<string>; var OperatorStack: TStack<Char>);
var
  FirstOperand, SecondOperand: TMatrix;
begin

end;

function ExprCalculation(const AExpression: string): string;
var
  i: Integer;
  CurrentElement: string;
  IsCorrectExpression: Boolean;
begin
  ElementsStack := TStack<string>.Create;

  IsCorrectExpression := True;
  i := 1;
  while (i <= Length(AExpression)) and IsCorrectExpression do
  begin
    IsCorrectExpression := True;

    if AExpression[i] = ' ' then
      inc(i)
    else
    begin
      if AExpression[i] in Symbols then
      begin
        CurrentElement := OperandProcessing(i, AExpression, ElementsStack);
        if CurrentElement[1] in MatrixNameFirstElValidSymbols then
          IsCorrectExpression := DataManager.MatrixList.IsMatrixExist(CurrentElement);
      end;

      if IsCorrectExpression then
      begin
        if ElementsStack.IsEmpty then

      end;
    end;


  end;

  ElementsStack.Destroy;
end;


end.
