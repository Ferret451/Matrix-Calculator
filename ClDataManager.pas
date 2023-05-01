unit ClDataManager;

interface

uses ClMatrixList;

type
  TDataManager = class

    private
      FListOfMatrixes: TMatrixList;
    published
      property ListOfMatrixes: TMatrixList read FListOfMatrixes write FListOfMatrixes;
      constructor Create();
  end;

var
  DataManager: TDataManager;

implementation



constructor TDataManager.Create();
begin
  FListOfMatrixes.Create();
end;

end.
