unit ClMatrix;

interface

type
  TMatrix = class
    private
      FLinesAmount: Integer;
      FColumnsAmount: Integer;
      FName: String;
      FElements: array of array of Real;
      function GetElement(X, Y: Integer): Real;
      procedure SetElement(X, Y: Integer; const Value: Real);
    public
      property Name: String read FName write FName;
      property Elements[X, Y: Integer]: Real read GetElement write SetElement;
      constructor Create(const AName: String; const ALines, AColumns: Integer);
      destructor Destroy; override;
      function Add(const AMatr: TMatrix): TMatrix;
      function Substr(const AMatr: TMatrix): TMatrix;
      function MultConst(const ANumb: TMatrix): TMatrix;
      function MultMatr(const AMatr: TMatrix): TMatrix;
  end;

implementation
  Constructor TMatrix.Create(const AName: String; const ALines, AColumns: Integer);
  var
    I, J: Integer;
  begin
    FName := AName;
    FLinesAmount := ALines;
    FColumnsAmount := AColumns;

    SetLength(FElements, ALines);
    for I := 0 to ALines - 1 do
    begin
      SetLength(FElements[i], AColumns);
      for J := 0 to AColumns - 1 do
        FElements[I][J] := 0;
    end;
  end;

  Destructor TMatrix.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to High(FElements) do
      SetLength(FElements[I], 0);

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
  Function TMatrix.Add(const AMatr: TMatrix): TMatrix;
  var
    i, j: integer;
    //i, j - iterators for cycles
  Begin
    Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

    //Summing the matrixes
    for i := 0 to Self.FLinesAmount - 1 do
      for j := 0 to Self.FColumnsAmount - 1 do
        Result.FElements[i][j] := Self.FElements[i][j] + AMatr.FElements[i][j];
  End;

  //Procedure for substract two matrixes
  Function TMatrix.Substr(const AMatr: TMatrix): TMatrix;
  var
    i, j: integer;
    //i, j - iterators for cycles
  Begin
    Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

    //Substract the matrixes
    for i := 0 to Self.FLinesAmount - 1 do
      for j := 0 to Self.FColumnsAmount - 1 do
        Result.FElements[i][j] := Self.FElements[i][j] - AMatr.FElements[i][j];
  End;

  //Procedure for multiplying number on matrix
  Function TMatrix.MultConst(const ANumb: TMatrix): TMatrix;
  var
    i, j: integer;
    //i, j - iterators for cycles
  Begin
    Result := TMatrix.Create('Res', Self.FLinesAmount, Self.FColumnsAmount);

    //Myltiplying number on matrix
    for i := 0 to Self.FLinesAmount - 1 do
      for j := 0 to Self.FColumnsAmount - 1 do
        Result.FElements[i][j] := ANumb.FElements[i][j] * Self.FElements[i][j];
  End;

  //Procedure for multiplying matrixes
  Function TMatrix.MultMatr(const AMatr: TMatrix): TMatrix;
  var
    i, j, k: integer;
    //i, j, k - iterators for cycles
  Begin
    Result := TMatrix.Create('Res', Self.FLinesAmount, AMatr.FColumnsAmount);

    //Myltiplying the matrixes
    for i := 0 to Self.FLinesAmount - 1 do
      for j := 0 to AMatr.FColumnsAmount - 1 do
      begin
        Result.FElements[i][j] := 0;
        for k := 0 to Self.FColumnsAmount - 1 do
          Result.FElements[i][j] := Result.FElements[i][j] + Self.FElements[i][k] * AMatr.FElements[k][j];
      end;
  End;
end.