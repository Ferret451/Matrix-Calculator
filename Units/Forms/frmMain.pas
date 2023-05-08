unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls,
  untExprCalculate, clsSingleLinkedList, clsMatrix, clsMatrixList, clsDataManager,
  frmMatrList, frmEditMatr;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    SaveAs1: TMenuItem;
    edMatrixExpression: TEdit;
    Panel1: TPanel;
    butTwo: TButton;
    butFive: TButton;
    butThree: TButton;
    butSix: TButton;
    butOne: TButton;
    butFour: TButton;
    butEight: TButton;
    butSeven: TButton;
    butNine: TButton;
    butZero: TButton;
    butComma: TButton;
    butDelete: TButton;
    butCalculate: TButton;
    butPlus: TButton;
    butMinus: TButton;
    butMultiplication: TButton;
    butDivision: TButton;
    butOpenBrace: TButton;
    butCloseBrace: TButton;
    butClear: TButton;
    ToolBar: TToolBar;
    alToolBar: TActionList;
    ilToolBar: TImageList;
    New1: TMenuItem;
    Exit1: TMenuItem;
    aNewFile: TAction;
    tbSaveFileAs: TToolButton;
    aSaveFileAs: TAction;
    aSaveFile: TAction;
    tbSaveFile: TToolButton;
    tbNewFile: TToolButton;
    aOpenFile: TAction;
    tbOpenFile: TToolButton;
    N1: TMenuItem;
    aExit: TAction;
    Matrix: TMenuItem;
    ViewList1: TMenuItem;
    aViewMatrixList: TAction;
    tbViewMatrixList: TToolButton;
    Clearlist1: TMenuItem;
    tbSeparator1: TToolButton;
    shHistoryBorder: TShape;

    procedure OnFormCreate(Sender: TObject);
    procedure OnFormDestroy(Sender: TObject);
    procedure edMatrixExpressionExit(Sender: TObject);
    procedure butCalculateClick(Sender: TObject);
    procedure butInputClick(Sender: TObject);
    procedure butDeleteClick(Sender: TObject);
    procedure butClearClick(Sender: TObject);
    procedure aSaveFileAsExecute(Sender: TObject);
    procedure aSaveFileExecute(Sender: TObject);
    procedure aNewFileExecute(Sender: TObject);
    procedure aOpenFileExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aViewMatrixListExecute(Sender: TObject);
    procedure aClearMatrixListExecute(Sender: TObject);

  private
    CursPos: Integer;


  public

  end;

var
  MainForm: TMainForm;
  MatrixListForm: TMatrixListForm;

implementation

{$R *.dfm}

procedure TMainForm.OnFormCreate(Sender: TObject);
begin
  DataManager := TDataManager.Create();

  CursPos := 1;
end;

procedure TMainForm.OnFormDestroy(Sender: TObject);
begin
  DataManager.Destroy();
end;

procedure TMainForm.edMatrixExpressionExit(Sender: TObject);
begin
  CursPos := edMatrixExpression.SelStart;
end;

procedure TMainForm.butDeleteClick(Sender: TObject);
begin
  if CursPos >= 1 then
  begin
    edMatrixExpression.Text := Copy(EdMatrixExpression.Text, 1, CursPos - 1) + Copy(EdMatrixExpression.Text, CursPos + 1);
    dec(CursPos);
  end;

  EdMatrixExpression.SetFocus;
  EdMatrixExpression.SelStart := CursPos;
end;

procedure TMainForm.aClearMatrixListExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aExitExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aNewFileExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aOpenFileExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aSaveFileAsExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aSaveFileExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.aViewMatrixListExecute(Sender: TObject);
begin
  MatrixListForm := TMatrixListForm.Create(Self);
  MatrixListForm.Show;
end;

//��� ������, ����� �� ������� ������ �� ������������!!!

procedure TMainForm.butCalculateClick(Sender: TObject);
begin
  EdMatrixExpression.Text := ExprCalculation(EdMatrixExpression.Text);
end;

procedure TMainForm.butClearClick(Sender: TObject);
begin
  EdMatrixExpression.Text := '';
  CursPos := 1;

  EdMatrixExpression.SetFocus;
  EdMatrixExpression.SelStart := CursPos;
end;

procedure TMainForm.butInputClick(Sender: TObject);
begin
  EdMatrixExpression.Text := Copy(EdMatrixExpression.Text, 1, CursPos) + (Sender as TButton).Caption + Copy(EdMatrixExpression.Text, CursPos + 1);
  inc(CursPos);

  EdMatrixExpression.SetFocus;
  EdMatrixExpression.SelStart := CursPos;
end;

end.
