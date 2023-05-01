unit ClSingleLinkedList;

interface

uses
  System.SysUtils, System.Generics.Defaults;

type

  TSingleLinkedList<T> = class

  protected
  type
    PNode = ^TNode;
    TNode = record
      FValue: T;
      FNext: PNode;
    end;

  protected
    FHead: PNode;
    FTail: PNode;
    FSize: Integer;

  public
    constructor Create();
    destructor Destroy(); override;

    procedure Add(const AValue: T);
    procedure Remove(const AValue: T);
    procedure Swap(out ARefFirst, ARefSecond: PNode);
    //procedure SwapValues(const AFirstIndex, ASecondIndex: Integer);
  end;

implementation

  constructor TSingleLinkedList<T>.Create();
  begin
    inherited;
    FHead := nil;
    FTail := nil;
    FSize := 0;
  end;

  destructor TSingleLinkedList<T>.Destroy();
  var
    Node, NextNode: PNode;
  begin
    Node := FHead;
    while Assigned(Node) do
      begin
        NextNode := Node.FNext;
        Dispose(Node);
        Node := NextNode;
      end;
    inherited;
  end;

  procedure TSingleLinkedList<T>.Add(const AValue: T);
  var
    NewNode: PNode;
  begin

    New(NewNode);

    with NewNode^ do
    begin
      FValue := AValue;
      FNext := nil;
    end;

    if FTail <> nil then
      FTail^.FNext := NewNode
    else
      FHead := NewNode;

    FTail := NewNode;

    Inc(FSize);
  end;

  procedure TSingleLinkedList<T>.Remove(const AValue: T);
  var
    PrevNode, CurrNode: PNode;
    Comparer: IEqualityComparer<T>;
  begin
    Comparer := TEqualityComparer<T>.Default;
    CurrNode := FHead;
    PrevNode := nil;

    while Assigned(CurrNode) and not Comparer.Equals(CurrNode^.FValue, AValue) do
    begin
      PrevNode := CurrNode;
      CurrNode := CurrNode^.FNext;
    end;

    if Assigned(CurrNode) then
    begin
      if Assigned(PrevNode) then
        PrevNode^.FNext := CurrNode^.FNext
      else
        FHead := CurrNode^.FNext;
      if not Assigned(CurrNode^.FNext) then
        FTail := PrevNode;
      Dispose(CurrNode);
      Dec(FSize);
    end;
  end;

  procedure TSingleLinkedList<T>.Swap(out ARefFirst, ARefSecond: PNode);
  var
    buf: T;
  begin
    buf := ARefFirst^.FValue;
    ARefFirst^.FValue := ARefSecond^.FValue;
    ARefSecond^.FValue := buf;
  end;
end.
