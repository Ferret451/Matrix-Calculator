﻿unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin,
  Vcl.ComCtrls, untExprCalculate, clsDoubleLinkedList, clsMatrix, clsMatrixList,
  clsDataManager, frmMatrList, frmEditMatr, Vcl.NumberBox, untConstants, untTypes,
  Vcl.Grids, frmHTML, untPainting;

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
    sgDeterminant: TStringGrid;
    panCalcChoose: TPanel;
    butExpressionChoose: TButton;
    butDeterminantChoose: TButton;
    butInverseChoose: TButton;
    butRankChoose: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    pbExpression: TPaintBox;
    butAddDimension: TButton;
    butRemoveDimension: TButton;
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    aOpenHelp: TAction;
    aOpenAbout: TAction;
    sgInverse: TStringGrid;
    sgRank: TStringGrid;
    edColumnsAmount: TEdit;
    edLinesAmount: TEdit;

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
    procedure sgResize(Sender: TObject);
    procedure butAddDimensionClick(Sender: TObject);
    procedure butRemoveDimensionClick(Sender: TObject);
    procedure butChooseClick(Sender: TObject);
    procedure aExecuteInfo(Sender: TObject);
    procedure edDimensionsExit(Sender: TObject);
    procedure sgInputMatrixAssign(Sender: TObject; const AMatrix: TMatrix<string>);
    procedure sgInputMatrixSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure sgSelectSpecificCell(ACol, ARow: Integer;
      AStringGrid: TStringGrid);
  private
    FCarriagePos: Integer;

    function TryStrToNatural(const ANumberSting: string; var ANumber: Integer): Boolean;
    function sgGetCurrent(): TStringGrid;

  public

  end;

var
  MainForm: TMainForm;

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

procedure TMainForm.aExecuteInfo(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      HTMLForm.Execute('Help');
    2:
      HTMLForm.Execute('About Program');
  end;
end;

procedure TMainForm.aViewMatrixListExecute(Sender: TObject);
begin
  MatrixListForm.Show;
end;

procedure TMainForm.pbExpressionPaint(Sender: TObject);
var
  X, Y: Integer;
begin
 // pbExpression.Canvas.FillRect(pbExpression.ClientRect);

  case DataManager.OperationStatement of
    ostatExpression:
    begin
      X := StartPosX;
      Y := StartPosY + 42 div 2;

      if DataManager.CurrentExpression.FAnswer.FIsMatrix then
      begin
        MatrixPaint(X, Y, DataManager.CurrentExpression.FAnswer.FMatrix,
          BraceOutline, pbExpression);
      end
      else
      begin
        pbExpression.Canvas.TextOut(X, Y,
          FloatToStr(DataManager.CurrentExpression.FAnswer.FNumber));
      end;
    end;

    ostatDeterminant:
    begin
      DetOutline(sgDeterminant.Left, sgDeterminant.Top, sgDeterminant.Height,
        sgDeterminant.Width, pbExpression);
      X := pbExpression.Left;
    end;

    ostatInverse:
    begin
      pbExpression.Canvas.TextOut(StartPosX, StartPosY, 'Lines:');
      pbExpression.Canvas.TextOut(StartPosX +
        pbExpression.Canvas.TextWidth('Lines:') + edLinesAmount.Width + 42, StartPosY,
        'Columns:');
      BraceOutline(sgInverse.Left, sgInverse.Top, sgInverse.Height,
        sgInverse.Width, pbExpression);
    end;

    ostatRank:
    begin
      pbExpression.Canvas.TextOut(StartPosX, StartPosY, 'Lines:');
      pbExpression.Canvas.TextOut(StartPosX +
        pbExpression.Canvas.TextWidth('Lines:') + edLinesAmount.Width + 42, StartPosY,
        'Columns:');
      BraceOutline(sgRank.Left, sgRank.Top, sgRank.Height, sgRank.Width,
        pbExpression);
    end;
  end;
end;

procedure TMainForm.edExpressionChange(Sender: TObject);
begin
  DataManager.SetStringProblem(edExpression.Text, DataManager.CurrentExpression);
end;

procedure TMainForm.edExpressionExit(Sender: TObject);
begin
  FCarriagePos := edExpression.SelStart;
end;

procedure TMainForm.butCalculateClick(Sender: TObject);
var
  Answer: TAnswer;
begin
  Answer := DataManager.CurrentAnswer;
  if ExprCalculation(edExpression.Text, Answer) then
  begin
    DataManager.CurrentAnswer := Answer;
    DataManager.CallBack(pbExpression)
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

procedure TMainForm.butChooseClick(Sender: TObject);
begin
  edExpression.Visible := False;
  sgDeterminant.Visible := False;
  sgInverse.Visible := False;
  sgRank.Visible := False;
  butAddDimension.Visible := False;
  butRemoveDimension.Visible := False;
  edLinesAmount.Visible := False;
  edColumnsAmount.Visible := False;
  if TButton(Sender).Tag = butExpressionChoose.Tag then
  begin
    DataManager.OperationStatement := ostatExpression;

    edExpression.Visible := True;
    edExpression.Text := DataManager.GetCurrentOperation.FProblemString;

    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Tag = butDeterminantChoose.Tag) then
  begin
    DataManager.OperationStatement := ostatDeterminant;

    sgDeterminant.Visible := True;
    butAddDimension.Visible := True;
    butRemoveDimension.Visible := True;
    sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);

    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Tag = butInverseChoose.Tag) then
  begin
    DataManager.OperationStatement := ostatInverse;

    sgInverse.Visible := True;
    edLinesAmount.Visible := True;
    edColumnsAmount.Visible := True;
    edLinesAmount.Text :=
      IntToStr(DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount);
    edColumnsAmount.Text :=
      IntToStr(DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount);
    sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);

    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Tag = butRankChoose.Tag) then
  begin
    DataManager.OperationStatement := ostatRank;

    sgRank.Visible := True;
    edLinesAmount.Visible := True;
    edColumnsAmount.Visible := True;
    edLinesAmount.Text :=
      IntToStr(DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount);
    edColumnsAmount.Text :=
      IntToStr(DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount);
    sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);

    DataManager.CallBack(pbExpression);
  end;
end;

procedure TMainForm.butAddDimensionClick(Sender: TObject);
begin
  DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount :=
    DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount + 1;
  DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount :=
    DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount + 1;
  DataManager.GetCurrentOperation.FProblemMatrix.MartixUpdate();
  sgResize(sgGetCurrent);
end;

procedure TMainForm.butRemoveDimensionClick(Sender: TObject);
begin
  if sgGetCurrent.RowCount > 1 then
  begin
    DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount :=
      DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount - 1;
    DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount :=
      DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount - 1;
    DataManager.GetCurrentOperation.FProblemMatrix.MartixUpdate();
    sgResize(sgGetCurrent);
  end;
end;

function TMainForm.sgGetCurrent(): TStringGrid;
begin
  case DataManager.OperationStatement of
    ostatDeterminant: Result := sgDeterminant;
    ostatInverse: Result := sgInverse;
    ostatRank: Result := sgRank;
  end;
end;

{
procedure TMainForm.sgInputMatrixExit(Sender: TObject);
var
  i, j: Integer;
  Temp: Extended;
  IsCorrectElements: Boolean;
  MatrixElements: TMatrix.TMatrixElements;
begin
  SetLength(MatrixElements, TStringGrid(Sender).RowCount);
  for i := 0 to TStringGrid(Sender).RowCount do
    SetLength(MatrixElements[i], TStringGrid(Sender).ColCount);

  IsCorrectElements := True;
  i := 0;
  while (i < TStringGrid(Sender).RowCount) and IsCorrectElements do
  begin
    j := 0;
    while (j < TStringGrid(Sender).ColCount) and IsCorrectElements do
    begin
      if not TryStrToFloat(TStringGrid(Sender).Cells[j, i], Temp) then
      begin
        ShowMessage('Incorrect matrix element found');
        SelectSpecificCell(i, j, TStringGrid(Sender));
        IsCorrectElements := False;
      end
      else
        MatrixElements[i, j] := Temp;

      inc(j);
    end;

    inc(i);
  end;

  if not IsCorrectElements then
  begin
    Matrix.Destroy();
    TStringGrid(Sender).SetFocus;
  end
  else
    DataManager.GetCurrentOperation.FProblemMatrix.SetElementsTo(MatrixElements);

  SetLength(MatrixElements, 0);
end}

procedure TMainForm.sgInputMatrixSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
  DataManager.GetCurrentOperation.FProblemMatrix.Elements[ARow, ACol] :=
    TStringGrid(Sender).Cells[ACol, ARow];
end;

procedure TMainForm.sgSelectSpecificCell(ACol, ARow: Integer;
  AStringGrid: TStringGrid);
begin
  AStringGrid.Selection := TGridRect(Rect(ACol, ARow, ACol, ARow));
end;

procedure TMainForm.sgInputMatrixAssign(Sender: TObject;
  const AMatrix: TMatrix<string>);
var
  i, j: Integer;
begin
  TStringGrid(Sender).RowCount := AMatrix.LinesAmount;
  TStringGrid(Sender).ColCount := AMatrix.ColumnsAmount;
  for i := 0 to TStringGrid(Sender).RowCount - 1 do
    for j := 0 to TStringGrid(Sender).ColCount - 1 do
      TStringGrid(Sender).Cells[j, i] := AMatrix.Elements[i, j];
end;

procedure TMainForm.sgResize(Sender: TObject);
var
  LineWidth: Integer;
begin
  sgGetCurrent.RowCount := DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount;
  sgGetCurrent.ColCount := DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount;
  sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);

  LineWidth := GetSystemMetrics(SM_CXEDGE);
  TStringGrid(Sender).Height := (TStringGrid(Sender).DefaultRowHeight +
    LineWidth) * TStringGrid(Sender).RowCount + LineWidth div 2;
  TStringGrid(Sender).Width := (TStringGrid(Sender).DefaultColWidth +
    LineWidth) * TStringGrid(Sender).ColCount + LineWidth div 2;

  DataManager.CallBack(pbExpression);
end;

function TMainForm.TryStrToNatural(const ANumberSting: string;
  var ANumber: Integer): Boolean;
var
  Temp: Integer;
begin
  Result := TryStrToInt(ANumberSting, Temp);

  if Result then
  begin
    Result := Temp > 0;
    if Result then
      ANumber := StrToInt(ANumberSting);
  end;
end;

procedure TMainForm.edDimensionsExit(Sender: TObject);
var
  Amount: Integer;
begin
  if TryStrToNatural(TEdit(Sender).Text, Amount) then
    if TEdit(Sender).Tag = edLinesAmount.Tag then
    begin
      DataManager.GetCurrentOperation.FProblemMatrix.LinesAmount := Amount;
      DataManager.GetCurrentOperation.FProblemMatrix.MartixUpdate();
      sgResize(sgGetCurrent);
    end
    else
    begin
      if TEdit(Sender).Tag = edColumnsAmount.Tag then
      begin
        DataManager.GetCurrentOperation.FProblemMatrix.ColumnsAmount := Amount;
        DataManager.GetCurrentOperation.FProblemMatrix.MartixUpdate();
        sgResize(sgGetCurrent);
      end;
    end
  else
  begin
    ShowMessage('Inсorrect dimension');
    TEdit(Sender).SetFocus;
  end;
end;

end.
