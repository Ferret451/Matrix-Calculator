program Project;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  ExprCalculate in 'ExprCalculate.pas',
  Stack in 'Stack.pas',
  Matrix in 'Matrix.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
