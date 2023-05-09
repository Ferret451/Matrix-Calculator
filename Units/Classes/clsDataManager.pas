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
  public
    constructor Create();
    destructor Destroy(); override;

    procedure CallBack(Sender: TObject);

    property MatrixList: TMatrixList read GetMatrixList;
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

  IsMatrixListChanged := True;
end;

procedure TDataManager.CallBack(Sender: TObject);
begin
  if IsMatrixListChanged then
  begin
    TPaintBox(Sender).OnPaint(TPaintBox(Sender));

    IsMatrixListChanged := False;
  end;
end;

end.
