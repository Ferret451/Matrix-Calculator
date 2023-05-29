unit clsMatrixList;

interface

uses
  clsMatrix, clsDoubleLinkedList;

type
  TMatrixList<T> = class(TDoubleLinkedList<TMatrix<T>>)

  private

  public
    destructor Destroy(); override;
    procedure Clear(); override;

    procedure Sort();
    function TryGetMatrixFromList(const AMatrixName: string): Boolean; overload;
    function TryGetMatrixFromList(const AMatrixName: string;
      const AMatrix: TMatrix<T>): Boolean; overload;
  end;

implementation

destructor TMatrixList<T>.Destroy();

begin
  Clear();

  inherited;
end;

procedure TMatrixList<T>.Clear();
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

procedure TMatrixList<T>.Sort();
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

function TMatrixList<T>.TryGetMatrixFromList(const AMatrixName: string): Boolean;
var
  CurrNode: PNode;
begin
  CurrNode := FHead;
  Result := False;

  while (Assigned(CurrNode)) and not Result do
  begin
    if CurrNode^.FValue.Name = AMatrixName then
      Result := True;
    CurrNode := CurrNode^.FNext;
  end;
end;

function TMatrixList<T>.TryGetMatrixFromList(const AMatrixName: string;
  const AMatrix: TMatrix<T>): Boolean;
var
  CurrNode: PNode;
begin
  CurrNode := FHead;
  Result := False;

  while (Assigned(CurrNode)) and not Result do
  begin
    if CurrNode^.FValue.Name = AMatrixName then
    begin
      Result := True;
      AMatrix.AssignTo(CurrNode^.FValue);
    end;
    CurrNode := CurrNode^.FNext;
  end;
end;

end.
