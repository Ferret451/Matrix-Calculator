unit untExprCalculate;

interface

uses
  System.SysUtils, Math, clsStack, clsMatrix, clsMatrixList, untConstants,
  Vcl.Dialogs, clsDataManager, untTypes;

var
  OperandStack: TStack<TOperand>;
  OperatorStack: TStack<char>;

  function ExprCalculation(AExpressionString: string; var AAnswer: TOperand): Boolean;

implementation

function GetPriority(const AOperator: Char): ShortInt;
begin
  case AOperator of
    '+', '-':
      Result := 2;
    '*', '/':
      Result := 1;
    '^':
      Result := 0;
    '(':
      Result := -1;
    ')':
      Result := 10;
  end;
end;

function OperandProcessing(var APointerPos: Integer; const AExpressionString: string;
  const AOperandStack: TStack<TOperand>): Boolean;
var
  OperandString: string;
  Operand: TOperand;
begin
  Result := True;
  OperandString := '';

  while (APointerPos <= Length(AExpressionString)) and
    (AExpressionString[APointerPos] in Symbols) do
  begin
    OperandString := OperandString + AExpressionString[APointerPos];
    Inc(APointerPos);
  end;

  if (OperandString[1] in MatrixNameFirstElValidSymbols) then
  begin
    Operand.FIsMatrix := True;
    Operand.FMatrix := TMatrix.Create;

    if not DataManager.MatrixList.TryGetMatrixFromList(OperandString, Operand.FMatrix) then
    begin
      ShowMessage('Matrix name was not found in the matrix list');
      Result := False;
    end;
  end
  else
  begin
    Operand.FIsMatrix := False;

    if not TryStrToFloat(OperandString, Operand.FNumber) then
    begin
      ShowMessage('Incorrect number found');
      Result := False;
    end;
  end;

  OperandStack.Push(Operand);
end;

function OperatorProcessing(const NewOperator: Char;
  const AOperandStack: TStack<TOperand>; const AOperatorStack: TStack<Char>): Boolean;
var
  FirstOperand, SecondOperand, ResultOperand: TOperand;
  Mask : Integer;
begin
  Result := True;

  while (GetPriority(NewOperator) >= GetPriority(AOperatorStack.Top)) and
    not ((NewOperator = '^') and (AOperatorStack.Top = '^')) and
    (AOperatorStack.Top <> '(') and Result do
  begin
    if AOperandStack.Size >= 2 then
    begin
      SecondOperand := AOperandStack.Top;
      AOperandStack.Pop;
      FirstOperand := AOperandStack.Top;
      AOperandStack.Pop;

      {0 - two numbers, 1 - SecondElement is matrix
       2 - FirstElement is matrix, 3 - two numbers}
      Mask := Ord(FirstOperand.FIsMatrix) shl 1 or
              Ord(SecondOperand.FIsMatrix);

      try
        case Mask Of
          $0:
          begin
            ResultOperand.FIsMatrix := False;


              case AOperatorStack.Top of
                '+':
                  ResultOperand.FNumber := FirstOperand.FNumber + SecondOperand.FNumber;
                '-':
                  ResultOperand.FNumber := FirstOperand.FNumber - SecondOperand.FNumber;
                '*':
                  ResultOperand.FNumber := FirstOperand.FNumber * SecondOperand.FNumber;
                '/':
                  ResultOperand.FNumber := FirstOperand.FNumber / SecondOperand.FNumber;
                '^':
                  ResultOperand.FNumber := Power(FirstOperand.FNumber, SecondOperand.FNumber);
              end;
          end;

          $1:
          begin
            ResultOperand.FIsMatrix := True;

            case AOperatorStack.Top of
              '+':
              begin
                ShowMessage('Summing of number and matrix was found');
                Result := False;
              end;

              '-':
              begin
                ShowMessage('Difference of number and matrix was found');
                Result := False;
              end;

              '*':
              begin
                ResultOperand.FMatrix :=
                  SecondOperand.FMatrix.MultConst(FirstOperand.FNumber);
              end;


              '/':
              begin
                ShowMessage('Division of number on matrix was found');
                Result := False;
              end;

              '^':
              begin
                ShowMessage('Exponentiation of number to matrix was found');
                Result := False;
              end;
            end;
          end;

          $2:
          begin
            ResultOperand.FIsMatrix := True;

            case AOperatorStack.Top of
              '+':
              begin
                ShowMessage('Summing of number and matrix was found');
                Result := False;
              end;

              '-':
              begin
                ShowMessage('Subtracting of number and matrix was found');
                Result := False;
              end;

              '*':
                ResultOperand.FMatrix :=
                  FirstOperand.FMatrix.MultConst(SecondOperand.FNumber);

              '/':
              begin
                ShowMessage('Division of number on matrix was found');
                Result := False;
              end;

              '^':
              begin
                ShowMessage('Exponentiation of number to matrix was found');
                Result := False;
              end;
            end;
          end;

          $3:
          begin
            ResultOperand.FIsMatrix := True;

            case AOperatorStack.Top of
              '+':
              begin
                if (FirstOperand.FMatrix.LinesAmount <> SecondOperand.FMatrix.LinesAmount) or
                  (FirstOperand.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.ColumnsAmount) then
                begin
                  ShowMessage('Matrixes dimensions does not match when summing');
                  Result := False;
                end
                else
                  ResultOperand.FMatrix :=
                    FirstOperand.FMatrix.Add(SecondOperand.FMatrix);
              end;

              '-':
              begin
                if (FirstOperand.FMatrix.LinesAmount <> SecondOperand.FMatrix.LinesAmount) or
                  (FirstOperand.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.ColumnsAmount) then
                begin
                  ShowMessage('Matrixes dimensions does not match when subtracting');
                  Result := False;
                end
                else
                  ResultOperand.FMatrix :=
                    FirstOperand.FMatrix.Substr(SecondOperand.FMatrix);
              end;

              '*':
              begin
                if (FirstOperand.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.LinesAmount) then
                begin
                  ShowMessage('First matrix columns does not equal to second' +
                    'matrix lines when multiplying matrixes');
                  Result := False;
                end
                else
                  ResultOperand.FMatrix :=
                    FirstOperand.FMatrix.MultMatr(SecondOperand.FMatrix);
              end;

              '/':
              begin
                ShowMessage('Division of matrixes was found');
                Result := False;
              end;

              '^':
              begin
                ShowMessage('Exponentiation of matrixes was found');
                Result := False;
              end;
            end;
          end;
        end;
      except
        on EInvalidOp do
        begin
          ShowMessage('Final or interim result is too high or too low');
          Result := False;
        end;
        on EDivByZero do
        begin
          ShowMessage('Division on zero was found');
          Result := False;
        end;
      end;

      if Result then
      begin
        OperatorStack.Pop;
        OperandStack.Push(ResultOperand);
      end;

    end
    else
    begin
      ShowMessage('Incorrect expression');
      Result := False;
    end;
  end;

  if (OperatorStack.Top = '(') and (NewOperator = ')') and Result then
    OperatorStack.Pop
  else
    OperatorStack.Push(NewOperator);
end;

function ExprCalculation(AExpressionString: string; var AAnswer: TOperand): Boolean;
var
  i: Integer;
  CurrentOperand: string;
begin
  OperandStack := TStack<TOperand>.Create;
  OperatorStack := TStack<char>.Create;

  AExpressionString := '(' + AExpressionString + ')';
  Result := True;

  i := 1;
  while (i <= Length(AExpressionString)) and Result do
  begin
    if AExpressionString[i] = ' ' then
      inc(i)
    else
      if AExpressionString[i] in Symbols then
        Result := OperandProcessing(i, AExpressionString, OperandStack)
      else if AExpressionString[i] in Operators then
      begin
        if OperatorStack.IsEmpty then
          OperatorStack.Push(AExpressionString[i])
        else
          if not OperatorProcessing(AExpressionString[i],
            OperandStack, OperatorStack) then
              Result := False;
        Inc(i);
      end
      else
      begin
        ShowMessage('Unkown symbols found');
        Result := False;
      end;
  end;

  if Result then
  begin
    if not OperandStack.IsEmpty then
      AAnswer := OperandStack.Top
    else
    begin
      ShowMessage('Incorrect expression');
      Result := False;
    end;
  end;

  OperandStack.Destroy;
  OperatorStack.Destroy;
end;

end.
