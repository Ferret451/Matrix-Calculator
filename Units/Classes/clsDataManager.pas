unit clsDataManager;

interface

uses
  Vcl.ExtCtrls, clsMatrixList, clsMatrix, untTypes;

type
  TDataManager = class
  private
    FCurrentExpression: TExpression;
    FMatrixList: TMatrixList;

    function GetCurrentExpressionString(): string;
    procedure SetCurrentExpressionString(const ACurrentExpressionString: string);
    function GetCurrentExpressionAnswer(): TOperand;
    procedure SetCurrentExpressionAnswer(const ACurrentExpressionAnswer: TOperand);
  public
    constructor Create();
    destructor Destroy(); override;

    procedure CallBack(Sender: TObject);

    property MatrixList: TMatrixList read FMatrixList;
    property CurrentExpressionString: string read GetCurrentExpressionString
      write SetCurrentExpressionString;
    property CurrentExspressionAnswer: TOperand read GetCurrentExpressionAnswer
      write SetCurrentExpressionAnswer;
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

function TDataManager.GetCurrentExpressionString(): string;
begin
  Result := FCurrentExpression.FExpressionString;
end;

procedure TDataManager.SetCurrentExpressionString(const ACurrentExpressionString: string);
begin
  FCurrentExpression.FExpressionString := ACurrentExpressionString;
end;

function TDataManager.GetCurrentExpressionAnswer(): TOperand;
begin
  Result := FCurrentExpression.FAnswer;
end;

procedure TDataManager.SetCurrentExpressionAnswer(const ACurrentExpressionAnswer: TOperand);
begin
  FCurrentExpression.FAnswer := ACurrentExpressionAnswer;
end;

procedure TDataManager.CallBack(Sender: TObject);
begin
  TPaintBox(Sender).OnPaint(TPaintBox(Sender));
end;

end.
