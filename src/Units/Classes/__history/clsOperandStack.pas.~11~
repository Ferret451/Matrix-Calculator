unit clsOperandStack;

interface

uses
  clsStack, clsMatrix, untTypes;

type
  TOperandStack = class(TStack<TAnswer>)
  public
    destructor Destroy; override;

    function Pop: TAnswer; override;
  end;

implementation

destructor TOperandStack.Destroy;
begin
  inherited;
end;

function TOperandStack.Pop: TAnswer;
Var
  Segment: PStackSegment;
begin
  Segment := FTop;
  Result := Segment.FValue;
  if Segment.FValue.FIsMatrix then
    Segment.FValue.FMatrix.Destroy();
  FTop := Segment.FNext;
  Dispose(Segment);
  Dec(FSize);
end;

end.
