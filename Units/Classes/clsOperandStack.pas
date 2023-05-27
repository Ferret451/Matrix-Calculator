unit clsOperandStack;

interface

uses
  clsStack, clsMatrix, untTypes;

type
  TOperandStack = class(TStack<TAnswer>)
  public
    destructor Destroy; override;
  end;

implementation

destructor TOperandStack.Destroy;
begin
  while not IsEmpty do
  begin
    if FTop.FValue.FIsMatrix then
      FTop.FValue.FMatrix.Destroy();
    Pop;
  end;
end;

end.
