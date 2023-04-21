unit Stack;

interface

Type
  TStack<T> = class

  Private
  Type
  PStackSegment = ^TStackSegment;
  TStackSegment = record
    FValue: T;
    FNext: PStackSegment;
  end;

  Private
    FTop: PStackSegment;
    FSize: Integer;

  Public
    Constructor Create;
    Destructor Destroy; override;
    Procedure Push(const AValue: T);
    Function Top: T;
    Function Pop: T;
    Function Size: Integer;
    Function IsEmpty: Boolean;

  end;

implementation
  Constructor TStack<T>.Create;
  begin
    FTop := nil;
    FSize := 0;
  end;

  Destructor TStack<T>.Destroy;
  begin
    while not IsEmpty do
      Pop;
    inherited;
  end;

  Procedure TStack<T>.Push (const AValue: T);
  Var
    Segment: PStackSegment;
  begin
    New(Segment);
    Segment.FValue := AValue;
    Segment.FNext := FTop;
    FTop := Segment;
    Inc(FSize);
  end;

  Function TStack<T>.Top: T;
  begin
    Result := FTop^.FValue;
  end;

  Function TStack<T>.Pop: T;
  Var
    Segment: PStackSegment;
  begin
    Segment := FTop;
    Result := Segment.FValue;
    FTop := Segment.FNext;
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



