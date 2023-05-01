unit ClMatrixList;

interface

uses
  ClMatrix, ClSingleLinkedList;

type
  TMatrixList = class(TSingleLinkedList<TMatrix>)

  private

  public
    procedure Sort();
  end;

implementation

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
      if CurrNode^.FValue.FName > CurrNode^.FNext^.FValue.FName then
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
