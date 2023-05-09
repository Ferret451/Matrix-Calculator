program Project;

uses
  Vcl.Forms,
  frmMain in 'Units\Forms\frmMain.pas' {MainForm},
  clsStack in 'Units\Classes\clsStack.pas',
  clsMatrix in 'Units\Classes\clsMatrix.pas',
  clsDoubleLinkedList in 'Units\Classes\clsDoubleLinkedList.pas',
  frmMatrList in 'Units\Forms\frmMatrList.pas' {MatrixListForm},
  frmEditMatr in 'Units\Forms\frmEditMatr.pas' {EditMatrixForm},
  clsMatrixList in 'Units\Classes\clsMatrixList.pas',
  untConstants in 'Units\Additional\untConstants.pas',
  untExprCalculate in 'Units\Logic\untExprCalculate.pas',
  clsDataManager in 'Units\Classes\clsDataManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMatrixListForm, MatrixListForm);
  Application.CreateForm(TEditMatrixForm, EditMatrixForm);
  Application.Run;
end.
