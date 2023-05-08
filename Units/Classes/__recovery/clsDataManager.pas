unit clsDataManager;

interface

uses
  Vcl.ExtCtrls, clsMatrixList, clsMatrix;

type
  TDataManager = class
  private
    FMatrixList: TMatrixList;

    IsMatrixListChanged: Boolean;


    function GetMatrixList(): TMatrixList;
    procedure SetMatrixList(const AMAtrixList: TMatrixList);
  public
    constructor Create();
    destructor Destroy(); override;

    procedure CallBack(AComponentToRedraw: TObject);

    property MatrixList: TMatrixList read GetMatrixList write SetMatrixList;
  end;

var
  DataManager: TDataManager;

implementation

constructor TDataManager.Create();
begin
  FMatrixList := TMatrixList.Create();

  IsMatrixListChanged := False;
end;

destructor TDataManager.Destroy();
begin
  FMatrixList.Destroy();

  inherited;
end;

function TDataManager.GetMatrixList(): TMatrixList;
begin
  Result := FMatrixList;
end;

procedure TDataManager.SetMatrixList(const AMAtrixList: TMatrixList);
begin
  FMatrixList := AMatrixList;

  IsMatrixListChanged := True;
end;

procedure TDataManager.CallBack(AComponentToRedraw: TObject);
begin
  if IsMatrixListChanged then
  begin
    (AComponentToRedraw as TPaintBox).OnPaint

    IsMatrixListChanged := False;
  end;
end;

end.
