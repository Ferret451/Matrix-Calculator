unit untTypes;

interface

uses
  clsMatrix;

type
  TOperand = record
    FMatrix: TMatrix;
    FNumber: Extended;
    FIsMatrix: Boolean;
  end;

  TFullExpression = record
    FProblemString: string;
    FProbelemMatrix: TMatrix;
    FAnswer: TOperand;
  end;

  TOperationStatement = (
    ostatExpression = 0,
    ostatDeterminant = 1,
    ostatInverse = 2,
    ostatRank = 3
  );

implementation

end.
