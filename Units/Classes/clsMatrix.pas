unit clsMatrix;

interface

type
  TMatrix = class
    private
      FLinesAmount: Integer;
      FColumnsAmount: Integer;
      FName: string;
      FElements: array of array of Real;

      function GetElement(X, Y: Integer): Real;
      procedure SetElement(X, Y: Integer; const Value: Real);
    public
      constructor Create(const AName: string; const ALines, AColumns: Integer);
      destructor Destroy; override;

      function Add(const AMatr: TMatrix): TMatrix;
      function Substr(const AMatr: TMatrix): TMatrix;
      function MultConst(const ANumb: TMatrix): TMatrix;
      function MultMatr(const AMatr: TMatrix): TMatrix;

      property Lines: Integer read FLinesAmount write FLinesAmount;
      property Columns: Integer read FColumnsAmount write FColumnsAmount;
      property Name: string read FName write FName;
      property Elements[X, Y: Integer]: Real read GetElement write SetElement;
  end;

implementation

constructor TMatrix.Create(const AName: string; const ALines, AColumns: Integer);
var
  i, j: Integer;
begin
  FName := AName;
  FLinesAmount := ALines;
  FColumnsAmount := AColumns;

  SetLength(FElements, ALines);
  for i := 0 to ALines - 1 do
  begin
    SetLength(FElements[i], AColumns);
    for j := 0 to AColumns - 1 do
      FElements[i][j] := 0;
  end;
end;

destructor TMatrix.Destroy;
var
  i: Integer;
begin
  for i := 0 to High(FElements) do
    SetLength(FElements[i], 0);

  SetLength(FElements, 0);
end;

function TMatrix.GetElement(X, Y: Integer): Real;
begin
  Result := FElements[X, Y];
end;

procedure TMatrix.SetElement(X, Y: Integer; const Value: Real);
begin
  FElements[X, Y] := Value;
end;

//Procedure for summing two matrixes
function TMatrix.Add(const AMatr: TMatrix): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

  //Summing the matrixes
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := Self.FElements[i][j] + AMatr.FElements[i][j];
end;

//Procedure for substract two matrixes
function TMatrix.Substr(const AMatr: TMatrix): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

  //Substract the matrixes
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := Self.FElements[i][j] - AMatr.FElements[i][j];
end;

//Procedure for multiplying number on matrix
function TMatrix.MultConst(const ANumb: TMatrix): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

  //Myltiplying number on matrix
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := ANumb.FElements[i][j] * Self.FElements[i][j];
end;

//Procedure for multiplying matrixes
function TMatrix.MultMatr(const AMatr: TMatrix): TMatrix;
var
  i, j, k: Integer;
  //i, j, k - iterators for cycles
begin
  Result := TMatrix.Create('Res', Self.FLinesAmount, AMatr.FColumnsAmount);

  //Myltiplying the matrixes
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to AMatr.FColumnsAmount - 1 do
    begin
      Result.FElements[i][j] := 0;
      for k := 0 to Self.FColumnsAmount - 1 do
        Result.FElements[i][j] := Result.FElements[i][j] + Self.FElements[i][k] * AMatr.FElements[k][j];
    end;
end;

end.
