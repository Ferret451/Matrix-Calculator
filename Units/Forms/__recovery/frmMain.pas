unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls,
  untExprCalculate, clsDoubleLinkedList, clsMatrix, clsMatrixList, clsDataManager,
  frmMatrList, frmEditMatr, Vcl.NumberBox, untConstants, untTypes;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    SaveAs1: TMenuItem;
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
    sbHistory: TScrollBox;
    pbHistory: TPaintBox;
    panCalculationsPart: TPanel;
    sbExpression: TScrollBox;
    pbExpression: TPaintBox;
    panCalculatorButtons: TPanel;
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
    splMain: TSplitter;
    butExponentaition: TButton;
    edExpression: TEdit;

    procedure edExpressionExit(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pbExpressionPaint(Sender: TObject);
    procedure edExpressionChange(Sender: TObject);
  private
    FCarriagePos: Integer;
  public

  end;

var
  MainForm: TMainForm;
  MatrixListForm: TMatrixListForm;

implementation

{$R *.dfm}



procedure TMainForm.FormCreate(Sender: TObject);
begin
  DataManager := TDataManager.Create();
  FCarriagePos := 1;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DataManager.Destroy();
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

procedure TMainForm.pbExpressionPaint(Sender: TObject);
var
  X, Y: Integer;
begin
  pbExpression.Canvas.FillRect(pbExpression.ClientRect);
  X := StartPosX;
  Y := StartPosY;

  if DataManager.CurrentExspressionAnswer.FIsMatrix then
    MatrixListForm.MatrixPaint(X, Y,
      DataManager.CurrentExspressionAnswer.FMatrix, pbExpression)
  else
    TPaintBox(Sender).Canvas.TextOut(X, Y,
      FloatToStr(DataManager.CurrentExspressionAnswer.FNumber));
end;

procedure TMainForm.edExpressionChange(Sender: TObject);
begin
  DataManager.CurrentExpressionString := edExpression.Text;
end;

procedure TMainForm.edExpressionExit(Sender: TObject);
begin
  FCarriagePos := edExpression.SelStart;
end;

procedure TMainForm.butCalculateClick(Sender: TObject);
var
  Answer: TOperand;
begin
  if ExprCalculation(edExpression.Text, Answer) then
  begin
    DataManager.CurrentExspressionAnswer := Answer;
    DataManager.CallBack(pbExpression);
  end;
end;

procedure TMainForm.butClearClick(Sender: TObject);
begin
  edExpression.Text := '';
  FCarriagePos := 1;

  edExpression.SetFocus;
  edExpression.SelStart := FCarriagePos;
end;

procedure TMainForm.butInputClick(Sender: TObject);
begin
  edExpression.Text := Copy(edExpression.Text, 1, FCarriagePos) + (Sender as TButton).Caption + Copy(edExpression.Text, FCarriagePos + 1);
  inc(FCarriagePos);

  edExpression.SetFocus;
  edExpression.SelStart := FCarriagePos;
end;

procedure TMainForm.butDeleteClick(Sender: TObject);
begin
  if FCarriagePos >= 1 then
  begin
    edExpression.Text := Copy(edExpression.Text, 1, FCarriagePos - 1) + Copy(edExpression.Text, FCarriagePos + 1);
    dec(FCarriagePos);
  end;

  edExpression.SetFocus;
  edExpression.SelStart := FCarriagePos;
end;

end.