unit untExprCalculate;

interface

uses
  System.SysUtils, Math, clsStack, clsMatrix, clsMatrixList, untConstants,
  Vcl.Dialogs, clsDataManager, clsOperandStack, untTypes;

var
  OperandStack: TOperandStack;
  OperatorStack: TStack<char>;

  function ExprCalculation(AExpressionString: string; var AAnswer: TAnswer): Boolean;

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
  const AOperandStack: TOperandStack): Boolean;
var
  OperandString: string;
  Operand: TAnswer;
begin
  Result := True;
  OperandString := '';

  while (APointerPos <= Length(AExpressionString)) and
    (AExpressionString[APointerPos] in Symbols) do
  begin
    OperandString := OperandString + AExpressionString[APointerPos];
    Inc(APointerPos);
  end;

  Operand.FMatrix := TMatrix.Create;
  if (OperandString[1] in MatrixNameFirstElValidSymbols) then
  begin
    Operand.FIsMatrix := True;

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
  const AOperandStack: TOperandStack; const AOperatorStack: TStack<Char>): Boolean;
var
  FirsTAnswer, SecondOperand, ResulTAnswer: TAnswer;
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
      FirsTAnswer := AOperandStack.Top;
      AOperandStack.Pop;

      {0 - two numbers, 1 - SecondElement is matrix
       2 - FirstElement is matrix, 3 - two numbers}
      Mask := Ord(FirsTAnswer.FIsMatrix) shl 1 or
              Ord(SecondOperand.FIsMatrix);

      try
        case Mask Of
          $0:
          begin
            ResulTAnswer.FIsMatrix := False;


              case AOperatorStack.Top of
                '+':
                  ResulTAnswer.FNumber := FirsTAnswer.FNumber + SecondOperand.FNumber;
                '-':
                  ResulTAnswer.FNumber := FirsTAnswer.FNumber - SecondOperand.FNumber;
                '*':
                  ResulTAnswer.FNumber := FirsTAnswer.FNumber * SecondOperand.FNumber;
                '/':
                  ResulTAnswer.FNumber := FirsTAnswer.FNumber / SecondOperand.FNumber;
                '^':
                  ResulTAnswer.FNumber := Power(FirsTAnswer.FNumber, SecondOperand.FNumber);
              end;
          end;

          $1:
          begin
            ResulTAnswer.FIsMatrix := True;

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
                ResulTAnswer.FMatrix :=
                  SecondOperand.FMatrix.MultConst(FirsTAnswer.FNumber);
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
            ResulTAnswer.FIsMatrix := True;

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
                ResulTAnswer.FMatrix :=
                  FirsTAnswer.FMatrix.MultConst(SecondOperand.FNumber);

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
            ResulTAnswer.FIsMatrix := True;

            case AOperatorStack.Top of
              '+':
              begin
                if (FirsTAnswer.FMatrix.LinesAmount <> SecondOperand.FMatrix.LinesAmount) or
                  (FirsTAnswer.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.ColumnsAmount) then
                begin
                  ShowMessage('Matrixes dimensions does not match when summing');
                  Result := False;
                end
                else
                  ResulTAnswer.FMatrix :=
                    FirsTAnswer.FMatrix.Add(SecondOperand.FMatrix);
              end;

              '-':
              begin
                if (FirsTAnswer.FMatrix.LinesAmount <> SecondOperand.FMatrix.LinesAmount) or
                  (FirsTAnswer.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.ColumnsAmount) then
                begin
                  ShowMessage('Matrixes dimensions does not match when subtracting');
                  Result := False;
                end
                else
                  ResulTAnswer.FMatrix :=
                    FirsTAnswer.FMatrix.Substr(SecondOperand.FMatrix);
              end;

              '*':
              begin
                if (FirsTAnswer.FMatrix.ColumnsAmount <> SecondOperand.FMatrix.LinesAmount) then
                begin
                  ShowMessage('First matrix columns does not equal to second' +
                    'matrix lines when multiplying matrixes');
                  Result := False;
                end
                else
                  ResulTAnswer.FMatrix :=
                    FirsTAnswer.FMatrix.MultMatr(SecondOperand.FMatrix);
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
        on E: Exception do
        begin
          // ��������� ����������
          ShowMessage('����������: ' + E.Message);
        end;
      end;

      if Result then
      begin
        OperatorStack.Pop;
        OperandStack.Push(ResulTAnswer);
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

function ExprCalculation(AExpressionString: string; var AAnswer: TAnswer): Boolean;
var
  i: Integer;
  CurrenTAnswer: string;
begin
  OperandStack := TOperandStack.Create;
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
