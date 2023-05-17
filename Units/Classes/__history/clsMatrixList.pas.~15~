unit clsMatrixList;

interface

uses
  clsMatrix, clsDoubleLinkedList;

type
  TMatrixList = class(TDoubleLinkedList<TMatrix>)

  private

  public
    destructor Destroy(); override;
    procedure Clear(); override;

    procedure Sort();
    function IsMatrixExist(const AMatrixName: string): Boolean;
  end;

implementation

destructor TMatrixList.Destroy();

begin
  Clear();

  inherited;
end;

procedure TMatrixList.Clear();
var
  CurrNode, NextNode: PNode;
begin
  CurrNode := FHead;
  while Assigned(CurrNode) do
  begin
    NextNode := CurrNode.FNext;
    CurrNode^.FValue.Destroy();
    CurrNode := NextNode;
  end;

  inherited;
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

function TMatrixList.IsMatrixExist(const AMatrixName: string): Boolean;
var
  CurrNode: PNode;
begin
  CurrNode := FHead;
  Result := False;

  while (Assigned(CurrNode)) and not Result do
  begin
    if CurrNode^.FValue.Name = AMatrixName then
      Result := True;
  end;
end;

end.
