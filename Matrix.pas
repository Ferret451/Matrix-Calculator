unit Matrix;

interface

type
  TMatrix = class
    private
      Lines: Integer;
      Columns: Integer;
    public

      Elements: array of array of Real;
      Constructor Create(const Lines, Columns: Integer);
      Destructor Destroy; override;
  end;

  Function NumbToMatr(const Numb: Real): TMatrix;

  Function SumMatrixes(const FirstMatr, SecondMatr: TMatrix): TMatrix;
  Function SubMatrixes (const FirstMatr, SecondMatr: TMatrix): TMatrix;
  Function MultConstMatrix(const Numb: Integer; const FirstMatr: TMatrix): TMatrix;
  Function MultMatrixes(const FirstMatr, SecondMatr: TMatrix): TMatrix;


implementation
  Constructor TMatrix.Create(const Lines, Columns: Integer);
  var
    i: integer;
  begin
    Self.Lines := Lines;
    Self.Columns := Columns;

    SetLength(Elements, Lines + 10);
    for i := 1 to Lines + 10 do
      SetLength(Elements[i], Columns + 10);
  end;

  Destructor TMatrix.Destroy;
  var
    i: integer;
  begin
    for i := 1 to Lines + 10 do
      SetLength(Elements[i], 0);
    SetLength(Elements, 0);

    Lines := 0;
    Columns := 0;
  end;

  Function NumbToMatr(const Numb: Real): TMatrix;
  begin
    Result.Lines := 1;
    Result.Columns := 1;

    Result.Elements[0][0] := Numb;
  end;

  //Procedure for summing two m  atrixes
  Function SumMatrixes(const FirstMatr, SecondMatr: TMatrix): TMatrix;
  var
    i, j: byte;
    //i, j - iterators for cycles
  Begin
    //Summing the matrixes
    for i := 1 to 3 do
      for j := 1 to 3 do
        Result.Elements[i][j] := FirstMatr.Elements[i][j] + SecondMatr.Elements[i][j];
  End;

  //Procedure for substract two matrixes
  Function SubMatrixes (const FirstMatr, SecondMatr: TMatrix): TMatrix;
  var
    i, j: byte;
    //i, j - iterators for cycles
  Begin
    //Substract the matrixes
    for i := 1 to 3 do
      for j := 1 to 3 do
        Result.Elements[i][j] := FirstMatr.Elements[i][j] - SecondMatr.Elements[i][j];
  End;

  //Procedure for multiplying number on matrix
  Function MultConstMatrix(const Numb: integer; const FirstMatr: TMatrix): TMatrix;
  var
    i, j: byte;
    //i, j - iterators for cycles
  Begin
    //Myltiplying number on matrix
    for i := 1 to 3 do
      for j := 1 to 3 do
        Result.Elements[i][j] := Numb * FirstMatr.Elements[i][j];
  End;

  //Procedure for multiplying matrixes
  Function MultMatrixes(const FirstMatr, SecondMatr: TMatrix): TMatrix;
  var
    i, j, k: byte;
    //i, j, k - iterators for cycles
  Begin
    //Myltiplying the matrixes
    for i := 1 to 3 do
      for j := 1 to 3 do
      begin
        Result.Elements[i][j] := 0;
        for k := 1 to 3 do
          Result.Elements[i][j] := Result.Elements[i][j] + FirstMatr.Elements[i][k] * SecondMatr.Elements[k][j];
      end;
  End;
end.
