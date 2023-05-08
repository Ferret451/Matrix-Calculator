unit clsStack;

interface

Type
  TStack<T> = class

  private type
    PStackSegment = ^TStackSegment;
    TStackSegment = record
      FValue: T;
      FNext: PStackSegment;
    end;

  private
    FTop: PStackSegment;
    FSize: Integer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Push(const AValue: T);
    function Top: T;
    function Pop: T;
    function Size: Integer;
    function IsEmpty: Boolean;

  end;

implementation

constructor TStack<T>.Create;
begin
  FTop := nil;
  FSize := 0;
end;

destructor TStack<T>.Destroy;
begin
  while not IsEmpty do
    Pop;
  inherited;
end;

procedure TStack<T>.Push (const AValue: T);
Var
  Segment: PStackSegment;
begin
  New(Segment);
  Segment.FValue := AValue;
  Segment.FNext := FTop;
  FTop := Segment;
  Inc(FSize);
end;

function TStack<T>.Top: T;
begin
  Result := FTop^.FValue;
end;

function TStack<T>.Pop: T;
Var
  Segment: PStackSegment;
begin
  Segment := FTop;
  Result := Segment.FValue;
  FTop := Segment.FNext;
  Dispose(Segment);
  Dec(FSize);
end;

function TStack<T>.Size: Integer;
begin
  Result := FSize;
end;

function TStack<T>.IsEmpty: Boolean;
begin
  if (FSize = 0) then
    Result := True
  else
    Result := False;
end;

end.



