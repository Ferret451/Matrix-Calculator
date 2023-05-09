unit untExprCalculate;

interface

uses
  System.SysUtils, clsStack,clsMatrix;

var
  OperandStack: TStack<string>;
  OperatorStack: TStack<Char>;

  function ExprCalculation(const Expression: string): string;

implementation

procedure OperandProcessing(var PointerPos: Integer; const Expression: string; var OperandStack: TStack<string>);
var
  Operand: string;

begin
  while Expression[PointerPos] in ['0'..'9', ','] do
  begin
    Operand := Operand + Expression[PointerPos];

    inc(PointerPos);
  end;

  OperandStack.Push(Operand);
end;

function GetPriority(const AOper: char): Byte;
type
  OperatorsPriority = record
    FOper: char;
    FPriority: byte;
  end;

const
  Operators: Array [1..6] of OperatorsPriority = (
    (FOper: '+'; FPriority: 1),
    (FOper: '-'; FPriority: 1),
    (FOper: '*'; FPriority: 2),
    (FOper: '/'; FPriority: 2),
    (FOper: '('; FPriority: 0),
    (FOper: ')'; FPriority: 255)
  );

var
  i: Integer;

begin
  i := 1;
  while AOper <> Operators[i].FOper do
    inc(i);

  result := Operators[i].FPriority;
end;

procedure OperatorProcessing(var OperandStack: TStack<string>; var OperatorStack: TStack<Char>);
var
  FirstOperand, SecondOperand: TMatrix;

begin
  //�������� �������� �� ����
  SecondOperand := TMatrix.Create('SecondOper', 1, 1);
  SecondOperand.Elements[0, 0] := StrToFloat(OperandStack.Top);
  OperandStack.Pop;

  FirstOperand := TMatrix.Create('FirstOper', 1, 1);
  FirstOperand.Elements[0, 0] := StrToFloat(OperandStack.Top);
  OperandStack.Pop;

  case (OperatorStack.Top) of
    '+':  OperandStack.Push(FloatToStr(FirstOperand.Add(SecondOperand).Elements[0, 0]));
    '-':  OperandStack.Push(FloatToStr(FirstOperand.Substr(SecondOperand).Elements[0, 0]));
    '*':  OperandStack.Push(FloatToStr(FirstOperand.MultConst(SecondOperand).Elements[0, 0]));
  end;

  OperatorStack.Pop();

  FirstOperand.Destroy();
  SecondOperand.Destroy();
end;

function ExprCalculation(const Expression: string): string;
const
  Symbols = ['0'..'9', ',', 'a'..'z', 'A'..'Z'];
  Operators = ['+', '-', '*', '/', '(', ')'];

var
  i: Integer;


begin
  OperandStack := TStack<string>.Create;
  OperatorStack := TStack<Char>.Create;

  i := 1;
  while i <= length(Expression) do
  begin
    if Expression[i] in Symbols then
      OperandProcessing(i, Expression, OperandStack);

    if Expression[i] in Operators then
      if OperatorStack.IsEmpty then
        OperatorStack.Push(Expression[i])
      else
      begin
        while (not OperatorStack.IsEmpty) and
          (GetPriority(Expression[i]) <= GetPriority(OperatorStack.Top)) do
          OperatorProcessing(OperandStack, OperatorStack);

        OperatorStack.Push(Expression[i]);
      end;

    inc(i);
  end;

  while not OperatorStack.isEmpty do
  begin
    OperatorProcessing(OperandStack, OperatorStack);
  end;

  Result := OperandStack.Top;

  OperandStack.Destroy;
  OperatorStack.Destroy;
end;


end.