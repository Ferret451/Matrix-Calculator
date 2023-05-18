unit clsMatrix;

interface

type
  TMatrix = class
    private
      FLinesAmount: Integer;
      FColumnsAmount: Integer;
      FName: string;
      FElements: array of array of Extended;

      function GetElement(X, Y: Integer): Extended;
      procedure SetElement(X, Y: Integer; const AValue: Extended);
      function GetLinesAmount(): Integer;
      procedure SetLinesAmount(const ALines: Integer);
    public
      constructor Create(); overload;
      constructor Create(const ALines, AColumns: Integer); overload;
      constructor Create(const AName: string; const ALines, AColumns: Integer); overload;
      destructor Destroy; override;

      procedure MartixSetLength(const ALines, AColumns: Integer);
      procedure AssignTo(const AMatrix: TMatrix);

      function Add(const AMatr: TMatrix): TMatrix;
      function Substr(const AMatr: TMatrix): TMatrix;
      function MultConst(const ANumb: Extended): TMatrix;
      function DivConst(const ANumb: Extended): TMatrix;
      function MultMatr(const AMatr: TMatrix): TMatrix;

      property LinesAmount: Integer read GetLinesAmount write SetLinesAmount;
      property ColumnsAmount: Integer read FColumnsAmount write FColumnsAmount;
      property Name: string read FName write FName;
      property Elements[X, Y: Integer]: Extended read GetElement write SetElement;
  end;

implementation

constructor TMatrix.Create();
begin
  inherited;
end;

constructor TMatrix.Create(const ALines, AColumns: Integer);
begin
  FLinesAmount := ALines;
  FColumnsAmount := AColumns;

  MartixSetLength(ALines, AColumns);
end;

constructor TMatrix.Create(const AName: string; const ALines, AColumns: Integer);
begin
  FName := AName;
  FLinesAmount := ALines;
  FColumnsAmount := AColumns;

  MartixSetLength(ALines, AColumns);
end;

destructor TMatrix.Destroy;
var
  i: Integer;
begin
  for i := 0 to High(FElements) do
    SetLength(FElements[i], 0);

  SetLength(FElements, 0);
end;

procedure TMatrix.MartixSetLength(const ALines, AColumns: Integer);
var
  i, j: Integer;
begin
  SetLength(FElements, ALines);
  for i := 0 to ALines - 1 do
  begin
    SetLength(FElements[i], AColumns);
    for j := 0 to AColumns - 1 do
      FElements[i][j] := 0;
  end;
end;

procedure TMatrix.AssignTo(const AMatrix: TMatrix);
var
  i, j: Integer;
begin
  Self.Name := AMatrix.Name;
  Self.FLinesAmount := AMatrix.LinesAmount;
  Self.FColumnsAmount := AMatrix.ColumnsAmount;
  Self.MartixSetLength(FLinesAmount, FColumnsAmount);
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount -1 do
      Self.Elements[i, j] := AMatrix.Elements[i, j];
end;

function TMatrix.GetElement(X, Y: Integer): Extended;
begin
  Result := FElements[X, Y];
end;

procedure TMatrix.SetElement(X, Y: Integer; const AValue: Extended);
begin
  FElements[X, Y] := AValue;
end;

function TMatrix.GetLinesAmount(): Integer;
begin
  Result := FLinesAmount;
end;

procedure TMatrix.SetLinesAmount(const ALines: Integer);
begin
  FLinesAmount := ALines;
end;

//Function for summing two matrixes
function TMatrix.Add(const AMatr: TMatrix): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create(Self.FLinesAmount, Self.FColumnsAmount);

  //Summing the matrixes
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := Self.FElements[i][j] + AMatr.FElements[i][j];
end;

//Function for substract two matrixes
function TMatrix.Substr(const AMatr: TMatrix): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create(Self.FLinesAmount, Self.FColumnsAmount);

  //Substract the matrixes
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := Self.FElements[i][j] - AMatr.FElements[i][j];
end;

//Function for multiplying number on matrix
function TMatrix.MultConst(const ANumb: Extended): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create(Self.FLinesAmount, Self.FColumnsAmount);

  //Myltiplying number on matrix
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := ANumb * Self.FElements[i][j];
end;

//Function for division matrix on number
function TMatrix.DivConst(const ANumb: Extended): TMatrix;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix.Create(Self.FLinesAmount, Self.FColumnsAmount);

  //Myltiplying number on matrix
  for i := 0 to Self.FLinesAmount - 1 do
    for j := 0 to Self.FColumnsAmount - 1 do
      Result.FElements[i][j] := Self.FElements[i][j];
end;

//Function for multiplying matrixes
function TMatrix.MultMatr(const AMatr: TMatrix): TMatrix;
var
  i, j, k: Integer;
  //i, j, k - iterators for cycles
begin
  Result := TMatrix.Create(Self.FLinesAmount, AMatr.FColumnsAmount);

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
