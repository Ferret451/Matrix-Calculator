unit clsOperandStack;

interface

uses
  clsStack, clsMatrix, untTypes;

type
  TOperandStack = class(TStack<TOperand>)
  public
    function Pop: TOperand; override;
  end;

implementation

function TOperandStack.Pop: TOperand;
Var
  Segment: PStackSegment;
begin
  Segment := FTop;
  Result := Segment.FValue;
  //////////
  FTop := Segment.FNext;
  Dispose(Segment);
  Dec(FSize);
end;

end.
