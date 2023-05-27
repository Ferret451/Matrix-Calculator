unit untMatrixCalc;

interface

uses
  clsMatrix, untTypes;

function SumMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
function SubstrMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
function MultMatrixConst(const AMatr: TMatrix<Extended>;
  const ANumb: Extended): TMatrix<Extended>;
function DivMatrixConst(const AMatr: TMatrix<Extended>;
  const ANumb: Extended): TMatrix<Extended>;
function MultMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
function FindDeterminant(const AMatr: TExtendedMatrixElements): Extended;

implementation

//Function for summing two matrixes
function SumMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AFirstMatr.LinesAmount,
    AFirstMatr.ColumnsAmount);

  for i := 0 to AFirstMatr.LinesAmount - 1 do
    for j := 0 to AFirstMatr.ColumnsAmount - 1 do
      Result.Elements[i, j] := AFirstMatr.Elements[i, j] +
        ASecondMatr.Elements[i, j];
end;

//Function for substract two matrixes
function SubstrMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AFirstMatr.LinesAmount,
    AFirstMatr.ColumnsAmount);

  for i := 0 to AFirstMatr.LinesAmount - 1 do
    for j := 0 to AFirstMatr.ColumnsAmount - 1 do
      Result.Elements[i, j] := AFirstMatr.Elements[i, j] -
        ASecondMatr.Elements[i, j];
end;

//Function for multiplying number on matrix
function MultMatrixConst(const AMatr: TMatrix<Extended>;
  const ANumb: Extended): TMatrix<Extended>;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AMatr.LinesAmount, AMatr.ColumnsAmount);

  for i := 0 to AMatr.LinesAmount - 1 do
    for j := 0 to AMatr.ColumnsAmount - 1 do
      Result.Elements[i, j] := ANumb * AMatr.Elements[i, j];
end;

//Function for dividing matrix on number
function DivMatrixConst(const AMatr: TMatrix<Extended>;
  const ANumb: Extended): TMatrix<Extended>;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AMatr.LinesAmount, AMatr.ColumnsAmount);

  for i := 0 to AMatr.LinesAmount - 1 do
    for j := 0 to AMatr.ColumnsAmount - 1 do
      Result.Elements[i, j] := AMatr.Elements[i, j] / ANumb;
end;

//Function for multiplying matrixes
function MultMatrixes(const AFirstMatr, ASecondMatr: TMatrix<Extended>):
  TMatrix<Extended>;
var
  i, j, k: Integer;
  //i, j, k - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AFirstMatr.LinesAmount,
    ASecondMatr.ColumnsAmount);

  for i := 0 to AFirstMatr.LinesAmount - 1 do
    for j := 0 to ASecondMatr.ColumnsAmount - 1 do
    begin
      Result.Elements[i, j] := 0;
      for k := 0 to AFirstMatr.ColumnsAmount - 1 do
        Result.Elements[i, j] := Result.Elements[i, j] + AFirstMatr.Elements[i, k] *
          ASecondMatr.Elements[k, j];
    end;
end;

//Function for tanspose
function TransposeMatrix(const AMatr: TMatrix<Extended>):
  TMatrix<Extended>;
var
  i, j: Integer;
  //i, j - iterators for cycles
begin
  Result := TMatrix<Extended>.Create(AMatr.LinesAmount, AMatr.ColumnsAmount);

  for i := 0 to AMatr.LinesAmount - 1 do
    for j := 0 to AMatr.ColumnsAmount - 1 do
      Result.Elements[i, j] := AMatr.Elements[j, i];
end;

function FindDeterminant(const AMatr: TExtendedMatrixElements): Extended;
var
  i, j, SwapAmount: Integer;
  IsDetFound: Boolean;
  Matr: TExtendedMatrixElements;

procedure SwapLines(const AMatr: TExtendedMatrixElements; const AFirstIndex, ASecondIndex: Integer);
var
  Temp: Extended;
  j: Integer;
begin
  for j := Low(AMatr[0]) to High(AMatr[0]) do
  begin
    Temp := AMatr[AFirstIndex][j];
    AMatr[AFirstIndex][j] := AMatr[ASecondIndex][j];
    AMatr[ASecondIndex][j] := Temp;
  end;
end;

procedure SubstrLineOnNumbFromLine(const AMatr: TExtendedMatrixElements; const ALineIndex,
  ALineIndexFrom: Integer; ANumb: Extended);
var
  j: Integer;
begin
  for j := Low(AMatr[0]) to High(AMatr[0]) do
    AMatr[ALineIndexFrom][j] := AMatr[ALineIndexFrom][j] -
      AMatr[ALineIndex][j] * ANumb;
end;

begin
  SetLength(Matr, High(AMatr), High(AMatr[0]));
  for i := Low(AMatr) to High(AMatr) do
    for j := Low(AMatr[0]) to High(AMatr[0]) do
      Matr[i][j] := AMatr[i][j];

  IsDetFound := False;
  Result := 1;
  SwapAmount := 0;

  j := 0;
  while (j <= High(Matr[0])) and not IsDetFound do
  begin
    i := j;
    if Matr[i, j] = 0 then
    begin
      while (i <= High(Matr)) and (Matr[i, j] = 0) do
        inc(i);
      if i = High(Matr) + 1 then
      begin
        Result := 0;
        IsDetFound := True;
      end
      else
      begin
        SwapLines(Matr, i, j);
        inc(SwapAmount);
      end;
    end;
    i := j + 1;
    while (i <= High(Matr)) and not IsDetFound do
    begin
      SubstrLineOnNumbFromLine(Matr, j, i, Matr[i, j] / Matr[j, j]);
      inc(i);
    end;

    inc(j);
  end;

  for i := Low(Matr) to High(Matr) do
    Result := Result * AMatr[i, i];

  if SwapAmount mod 2 = 1 then
    Result := Result * (-1);
end;

function FindMinor(const AMatr: TExtendedMatrixElements;
  const ALine, AColumn: Integer): Extended;
var
  i, j, im, jm: Integer;
  MinorMatrix: TExtendedMatrixElements;
begin
  if High(AMatr) = 1 then
    Result := 0
  else
  begin
    SetLength(MinorMatrix, High(AMatr) - 1, High(AMatr[0]) - 1);
    i := 0;
    im := 0;
    while i <= High(AMatr) do
    begin
      if i <> ALine then
      begin
        j := 0;
        jm := 0;
        while j <= High(AMatr[0]) do
        begin
          if j <> AColumn then
          begin
            MinorMatrix[im][jm] := AMatr[i][j];
            inc(jm);
          end;
          inc(j);
        end;
        inc(im);
      end;
      inc(i);
    end;

    Result := FindDeterminant(MinorMatrix);
    SetLength(MinorMatrix, 0, 0);
  end;
end;

procedure FindAdjoint(const AMatr, AInverseMatr: TExtendedMatrixElements);
var
  i, j: Integer;
begin

end;

procedure FindInverse(const AMatr, AInverseMatr: TExtendedMatrixElements);
var
  Adjont: TExtendedMatrixElements;
begin
  SetLength(Adjont, High(AMatr), High(AMatr[0])) ;

  AInverseMatr
end;

end.
