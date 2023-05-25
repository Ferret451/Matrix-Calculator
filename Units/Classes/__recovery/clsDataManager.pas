unit clsDataManager;

interface

uses
  Vcl.ExtCtrls, clsMatrixList, clsMatrix, untTypes;

type
  TPaintProc = procedure(Sender: TObject);

  TDataManager = class
  private
    FCurrentExpression: TFullOperation;
    FCurrentDeterminant: TFullOperation;
    FCurrentInverse: TFullOperation;
    FCurrentRank: TFullOperation;
    FOperationStatement: TOperationStatement;

    FMatrixList: TMatrixList;
  public
    constructor Create();
    destructor Destroy(); override;

    procedure CallBack(Sender: TObject);
    function GetCurrentOperation(): TFullOperation;
    procedure SetStringProblem(const AProblemString: string;
      const AOperation: TFullOperation);
    procedure SetMatrixProblem(const AProblemMatrix: TMatrix;
      const AOperation: TFullOperation);
    procedure SetAnswer(const AAnswer: TAnswer;
      const AOperation: TFullOperation);

    property MatrixList: TMatrixList read FMatrixList;
    property CurrentExpression: TFullOperation read FCurrentExpression;
    property CurrentDeterminant: TFullOperation read FCurrentDeterminant;
    property CurrentInverse: TFullOperation read FCurrentInverse;
    property CurrentRank: TFullOperation read FCurrentRank;
    property OperationStatement: TOperationStatement read FOperationStatement
      write FOperationStatement;
  end;

var
  DataManager: TDataManager;

implementation

constructor TDataManager.Create();
begin
  FMatrixList := TMatrixList.Create();
end;

destructor TDataManager.Destroy();
begin
  FMatrixList.Destroy();

  inherited;
end;

function TDataManager.GetCurrentOperation(): TFullOperation;
begin
  case FOperationStatement of
    ostatExpression: Result := CurrentExpression;
    ostatDeterminant: Result := CurrentDeterminant;
    ostatInverse: Result := CurrentInverse;
    ostatRank: Result := CurrentRank;
  end;
end;

procedure TDataManager.CallBack(Sender: TObject);
begin
  TPaintBox(Sender).OnPaint(TPaintBox(Sender));;
end;

procedure TDataManager.SetStringProblem(const AProblemString: string;
  const AOperation: TFullOperation);
begin
  FCurrentExpression.FProblemString := AProblemString;
end;

procedure TDataManager.SetMatrixProblem(const AProblemMatrix: TMatrix;
  const AOperation: TFullOperation);
begin
  FCurrentExpression.FProblemMatrix := AProblemMatrix;
end;

procedure TDataManager.SetAnswer(const AAnswer: TAnswer;
  const AOperation: TFullOperation);
begin
  FCurrentExpression.FAnswer := AAnswer;
end;

end.
