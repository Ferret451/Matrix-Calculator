program Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMainForm},
  ExprCalculate in 'ExprCalculate.pas',
  Stack in 'Stack.pas',
  Matrix in 'Matrix.pas',
  SingleLinkedList in 'SingleLinkedList.pas',
  fMatrList in 'fMatrList.pas' {fMatrixList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMainForm, fMainForm);
  Application.CreateForm(TfMatrixList, fMatrixList);
  Application.Run;
end.
