unit clsDoubleLinkedList;

interface

uses
  System.SysUtils, System.Generics.Defaults;

type

  TDoubleLinkedList<T> = class

  public type
    PNode = ^TNode;
    TNode = record
      FValue: T;
      FNext: PNode;
      FPrev: PNode;
    end;

  protected
    FHead: PNode;
    FTail: PNode;
    FSize: Integer;

    procedure Swap(out ARefFirst, ARefSecond: PNode);
  public
    constructor Create;
    destructor Destroy(); override;

    procedure Add(const AValue: T);
    procedure Remove(const AValue: T);
    function GetValue(const AIndex: Integer): T;
    procedure SetValue(const AIndex: Integer; const AValue: T);
    procedure Clear(); virtual;

    property Head: PNode read FHead;
  end;

implementation

constructor TDoubleLinkedList<T>.Create;
begin
  FHead := nil;
  FTail := nil;
  FSize := 0;
end;

destructor TDoubleLinkedList<T>.Destroy();
begin
  Clear();

  inherited;
end;

function TDoubleLinkedList<T>.GetValue(const AIndex: Integer): T;
var
  i: Integer;
  CurrNode: PNode;
  IsFound: Boolean;
begin
  IsFound := False;
  CurrNode := FHead;
  i := 0;

  if (AIndex < 0) or (AIndex > FSize - 1) then
    raise Exception.Create('Index out of bound');

  while Assigned(CurrNode) and not IsFound do
  begin
    if (i = AIndex) then
    begin
      IsFound := True;
      Result := CurrNode^.FValue;
    end
    else
    begin
      CurrNode := CurrNode^.FNext;
      inc(i);
    end;
  end;
end;

procedure TDoubleLinkedList<T>.SetValue(const AIndex: Integer; const AValue: T);
var
  i: Integer;
  CurrNode: PNode;
  IsFound: Boolean;
begin
  IsFound := False;
  CurrNode := FHead;
  i := 0;

  if (AIndex < 0) or (AIndex > FSize - 1) then
    raise Exception.Create('Index out of bound');

  while Assigned(CurrNode) and not IsFound do
  begin
    if (i = AIndex) then
    begin
      IsFound := True;
      CurrNode^.FValue := AValue;
    end
    else
    begin
      CurrNode := CurrNode^.FNext;
      inc(i);
    end;
  end;
end;

procedure TDoubleLinkedList<T>.Clear();
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

  FHead := nil;
  FTail := nil;
  FSize := 0;
end;

procedure TDoubleLinkedList<T>.Add(const AValue: T);
var
  NewNode: PNode;
begin

  New(NewNode);

  with NewNode^ do
  begin
    FValue := AValue;
    FNext := nil;
    if FSize >= 1 then
      FPrev := FTail
    else
      FPrev := nil;
  end;

  if Assigned(FTail) then
    FTail^.FNext := NewNode
  else
    FHead := NewNode;

  FTail := NewNode;

  Inc(FSize);
end;

procedure TDoubleLinkedList<T>.Remove(const AValue: T);
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
    if Assigned(PrevNode) and Assigned(CurrNode^.FNext) then
    begin
      PrevNode^.FNext := CurrNode^.FNext;
      CurrNode^.FNext^.FPrev := PrevNode;
    end
    else if Assigned(PrevNode) then
    begin
      PrevNode^.FNext := nil;
      FTail := PrevNode;
    end
    else if Assigned(CurrNode^.FNext) then
    begin
      CurrNode^.FNext^.FPrev := nil;
      FHead := CurrNode^.FNext;
    end;

    Dispose(CurrNode);
    Dec(FSize);
  end;
end;

procedure TDoubleLinkedList<T>.Swap(out ARefFirst, ARefSecond: PNode);
var
  buf: T;
begin
  buf := ARefFirst^.FValue;
  ARefFirst^.FValue := ARefSecond^.FValue;
  ARefSecond^.FValue := buf;
end;

end.
