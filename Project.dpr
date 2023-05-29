program Project;

{$R 'HTML.res' 'HTML.rc'}

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
  clsDataManager in 'Units\Classes\clsDataManager.pas',
  clsOperandStack in 'Units\Classes\clsOperandStack.pas',
  untTypes in 'Units\Additional\untTypes.pas',
  untPainting in 'Units\Logic\untPainting.pas',
  frmHTML in 'Units\Forms\frmHTML.pas' {HTMLForm},
  untMatrixCalc in 'Units\Logic\untMatrixCalc.pas',
  untStatistics in 'Units\File\untStatistics.pas',
  untSaveLoad in 'Units\File\untSaveLoad.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMatrixListForm, MatrixListForm);
  Application.CreateForm(TEditMatrixForm, EditMatrixForm);
  Application.CreateForm(THTMLForm, HTMLForm);
  Application.Run;
end.
