unit untTypes;

interface

uses
  clsMatrix;

type
  TAnswer = record
    FMatrix: TMatrix<Extended>;
    FNumber: Extended;
    FIsMatrix: Boolean;
  end;

  TFullOperation = record
    FProblemString: string;
    FProblemMatrix: TMatrix<string>;
    FAnswer: TAnswer;
  end;

  TOperationStatement = (
    ostatExpression = 0,
    ostatDeterminant = 1,
    ostatInverse = 2,
    ostatRank = 3
  );

implementation

end.
