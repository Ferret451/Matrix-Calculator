unit ExprCalculate;

interface

uses
  System.SysUtils, Stack, Matrix;

var
  OperandStack: TStack<String>;
  OperatorStack: TStack<Char>;

implementation

Procedure OperandProcessing(var PointerPos: integer; const Expression: string; OperandStack: TStack<String>);
var
  Operand: string;
  i: integer;

begin
  i := 0;
  while Expression[PointerPos] in ['0'..'9', ','] do
  begin
    Operand[i] := Expression[PointerPos];

    inc(PointerPos);
    inc(i);
  end;

  OperandStack.Push(Operand);
end;

Function GetPriority(const Oper: string): byte;
type
  OperatorsPriority = record
    Oper: char;
    Priority: byte;
  end;

const
  Operators: array [1..6] of OperatorsPriority = (
    (Oper: '+'; Priority: 1),
    (Oper: '-'; Priority: 1),
    (Oper: '*'; Priority: 2),
    (Oper: '/'; Priority: 2),
    (Oper: '('; Priority: 0),
    (Oper: ')'; Priority: 255)
  );

var
  i: integer;

begin
  while Oper <> Operators[i].Oper do
    inc(i);

  result := Operators[i].Priority;
end;

Procedure OperatorProcessing(const NewOperator: Char; var OperandStack: TStack<String>; var OperatorStack: TStack<Char>);
var
  FirstOperand, SecondOperand: Double;

begin
  while GetPriority(NewOperator) <= GetPriority(OperatorStack.Top) do
  begin
    //днаюбхрэ опнбепйс мю рхош
    FirstOperand := StrToFloat(OperandStack.Top);
    OperandStack.Pop;
    SecondOperand := StrToFloat(OperandStack.Top);
    OperandStack.Pop;

    case (OperatorStack.Top) of
      '+' : SumMatrixes(FirstOperand, SecondOperand);

    end;
  end;
end;

Function ExprCalculation(const Expression: string): integer;
var
  i: integer;

begin
  OperandStack.Create;
  OperatorStack.Create;

  i := 0;
  while i <= length(Expression) do
  begin
    if Expression[i] in ['0'..'9', ',', 'a'..'z', 'A'..'Z'] then
      OperandProcessing(i, Expression, OperandStack);

    if Expression[i] in ['+', '-', '*', '/', '(', ')'] then
      OperatorProcessing(Expression[i], OperandStack, OperatorStack);
  end;

  OperandStack.Destroy;
  OperandStack.Destroy;
end;


end.
