unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    SaveAs1: TMenuItem;
    EdMatrixExpression: TEdit;
    LabHistory: TLabel;
    ShHistoryBorder: TShape;
    ButHistory: TButton;
    ButMatrixes: TButton;
    ButTwo: TButton;
    ButFive: TButton;
    ButThree: TButton;
    ButSix: TButton;
    ButOne: TButton;
    ButFour: TButton;
    ButEight: TButton;
    ButSeven: TButton;
    ButNine: TButton;
    ButZero: TButton;
    ButComma: TButton;
    ButBackspace: TButton;
    ButCalculate: TButton;
    ButPlus: TButton;
    ButMinus: TButton;
    ButMultiplication: TButton;
    ButDivision: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EdMatrixExpressionExit(Sender: TObject);
    procedure ButBackspaceClick(Sender: TObject);
    procedure OnCalcButtonClick(Sender: TObject);

  private
    { Private declarations }
    CursPos: Integer;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CursPos := 1;
end;

procedure TForm1.EdMatrixExpressionExit(Sender: TObject);
begin
  CursPos := EdMatrixExpression.SelStart;
end;

procedure TForm1.ButBackspaceClick(Sender: TObject);
begin
  EdMatrixExpression.Text := Copy(EdMatrixExpression.Text, 1, CursPos - 1) + Copy(EdMatrixExpression.Text, CursPos + 1);
  dec(CursPos);
end;

procedure TForm1.OnCalcButtonClick(Sender: TObject);
begin
  EdMatrixExpression.Text := Copy(EdMatrixExpression.Text, 1, CursPos) + (Sender as TButton).Caption + Copy(EdMatrixExpression.Text, CursPos + 1);
  inc(CursPos);
end;

end.
