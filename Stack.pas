unit Stack;

interface



Type
  TStack<T> = class

  Private Type
  PStackSegment = ^TStackSegment;
  TStackSegment = record
    Value: T;
    Next: PStackSegment;
  end;

  Private
    FTop: PStackSegment;
    FSize: integer;

  Public
    Constructor Create;
    Destructor Destroy; override;
    Procedure Push(const Value: T);
    Function Top: T;
    Function Pop: T;
    Function Size: Integer;
    Function IsEmpty: Boolean;

  end;

implementation
  Constructor TStack<T>.Create;
  begin
    FSize := 0;
    FTop := nil;
  end;

  Destructor TStack<T>.Destroy;
  begin
    while not IsEmpty do
      Pop;
    inherited;
  end;

  Procedure TStack<T>.Push (const Value: T);
  Var
    Segment: PStackSegment;
  begin
    New(Segment);
    Segment.Value := Value;
    Segment.Next := FTop;
    FTop := Segment;
    Inc(FSize);
  end;

  Function TStack<T>.Top: T;
  begin
    Result := FTop.value;
  end;

  Function TStack<T>.Pop: T;
  Var
    Segment: PStackSegment;
  begin
    Segment := FTop;
    Result := Segment.Value;
    FTop := Segment.Next;
    Dispose(Segment);
    Dec(FSize);
  end;

  Function TStack<T>.Size: integer;
  begin
    Result := FSize;
  end;

  Function TStack<T>.IsEmpty: boolean;
  begin
    if (FSize = 0) then
      Result := True
    else
      Result := False;
  end;
end.



