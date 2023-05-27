unit untMatrixCalc;

interface

uses
  clsMatrix;

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

end.
