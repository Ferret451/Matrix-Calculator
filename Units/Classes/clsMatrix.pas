unit clsMatrix;

interface

type
  TMatrix<T> = class
    public type
      TMatrixElements = array of array of T;

    private
      FLinesAmount: Integer;
      FColumnsAmount: Integer;
      FName: string;
      FElements: TMatrixElements;

      function GetElement(X, Y: Integer): T;
      procedure SetElement(X, Y: Integer; const AValue: T);
      function GetLinesAmount(): Integer;
      procedure SetLinesAmount(const ALines: Integer);
    public
      constructor Create(); overload;
      constructor Create(const ALines, AColumns: Integer); overload;
      constructor Create(const AName: string; const ALines, AColumns: Integer); overload;
      destructor Destroy; override;

      procedure MartixUpdate();
      procedure AssignTo(const AMatrix: TMatrix<T>);
      procedure SetElementsTo(const AElements: TMatrixElements);

      property LinesAmount: Integer read GetLinesAmount write SetLinesAmount;
      property ColumnsAmount: Integer read FColumnsAmount write FColumnsAmount;
      property Name: string read FName write FName;
      property Elements: TMatrixElements read FElements;
      property Element[X, Y: Integer]: T read GetElement write SetElement;
  end;

implementation

constructor TMatrix<T>.Create();
begin
  inherited;
end;

constructor TMatrix<T>.Create(const ALines, AColumns: Integer);
begin
  FLinesAmount := ALines;
  FColumnsAmount := AColumns;

  MartixUpdate();
end;

constructor TMatrix<T>.Create(const AName: string; const ALines, AColumns: Integer);
begin
  FName := AName;
  FLinesAmount := ALines;
  FColumnsAmount := AColumns;

  MartixUpdate();
end;

destructor TMatrix<T>.Destroy;
var
  i: Integer;
begin
  SetLength(FElements, 0);
  inherited;
end;

procedure TMatrix<T>.MartixUpdate();
var
  i, j: Integer;
begin
  SetLength(FElements, FLinesAmount);
  for i := 0 to FLinesAmount - 1 do
    SetLength(FElements[i], FColumnsAmount);
end;

procedure TMatrix<T>.AssignTo(const AMatrix: TMatrix<T>);
var
  i, j: Integer;
begin
  Self.Name := AMatrix.Name;
  Self.FLinesAmount := AMatrix.LinesAmount;
  Self.FColumnsAmount := AMatrix.ColumnsAmount;
  Self.MartixUpdate();
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount -1 do
      Self.Element[i, j] := AMatrix.Element[i, j];
end;

procedure TMatrix<T>.SetElementsTo(const AElements: TMatrixElements);
var
  i, j: Integer;
begin
  i := 0;
  while i < Self.FLinesAmount do
  begin
    j := 0;
    while j < Self.FColumnsAmount do
    begin
      Self.FElements[i, j] := AElements[i, j];

      inc(j);
    end;

    inc(i);
  end;
end;

function TMatrix<T>.GetElement(X, Y: Integer): T;
begin
  Result := FElements[X, Y];
end;

procedure TMatrix<T>.SetElement(X, Y: Integer; const AValue: T);
begin
  FElements[X, Y] := AValue;
end;

function TMatrix<T>.GetLinesAmount(): Integer;
begin
  Result := FLinesAmount;
end;

procedure TMatrix<T>.SetLinesAmount(const ALines: Integer);
begin
  FLinesAmount := ALines;
end;

end.
