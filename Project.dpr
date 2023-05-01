program Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMainForm},
  ExprCalculate in 'ExprCalculate.pas',
  ClStack in 'ClStack.pas',
  ClMatrix in 'ClMatrix.pas',
  ClSingleLinkedList in 'ClSingleLinkedList.pas',
  fMatrList in 'fMatrList.pas' {fMatrixList},
  fNewMatr in 'fNewMatr.pas' {fNewMatrix},
  ClMatrixList in 'ClMatrixList.pas',
  ClDataManager in 'ClDataManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMainForm, fMainForm);
  Application.CreateForm(TfMatrixList, fMatrixList);
  Application.CreateForm(TfNewMatrix, fNewMatrix);
  Application.Run;
end.
