unit clsMatrixList;

interface

uses
  clsMatrix, clsSingleLinkedList;

type
  TMatrixList = class(TSingleLinkedList<TMatrix>)

  private

  public
    destructor Destroy(); override;
    procedure Sort();
  end;

implementation

destructor TMatrixList.Destroy();
var
  CurrNode, NextNode: PNode;
begin
  CurrNode := FHead;
  while Assigned(CurrNode) do
  begin
    NextNode := CurrNode.FNext;
    CurrNode^.FValue.Destroy();
    Dispose(CurrNode);
    CurrNode := NextNode;
  end;
end;

procedure TMatrixList.Sort();
var
  CurrNode, LastSwapNode, BarrierNode: PNode;
begin
  BarrierNode := FTail;

  while BarrierNode <> FHead do
  begin
    CurrNode := FHead;
    LastSwapNode := FHead;

    while CurrNode^.FNext <> BarrierNode do
    begin
      if CurrNode^.FValue.Name > CurrNode^.FNext^.FValue.Name then
      begin
        Self.Swap(CurrNode, CurrNode^.FNext);

        LastSwapNode := CurrNode;
      end;

      CurrNode := CurrNode^.FNext;
    end;

    BarrierNode := LastSwapNode;
  end;

end;

end.
