﻿unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin,
  Vcl.ComCtrls, untExprCalculate, clsDoubleLinkedList, clsMatrix, clsMatrixList,
  clsDataManager, frmMatrList, frmEditMatr, Vcl.NumberBox, untConstants, untTypes,
  Vcl.Grids, frmHTML, untPainting, untMatrixCalc;

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
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    aOpenHelp: TAction;
    aOpenAbout: TAction;
    sgInverse: TStringGrid;
    sgRank: TStringGrid;
    edColumnsAmount: TEdit;
    edLinesAmount: TEdit;
    butAddDimension: TButton;
    butRemoveDimension: TButton;
    labX: TLabel;

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
    procedure sbExpressionClick(Sender: TObject);
    procedure sbExpressionMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    FCarriagePos: Integer;
    FsgLeft: Integer;
    FsgTop: Integer;

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
  TextToOut: string;
begin
  case DataManager.OperationStatement of
    ostatExpression:
    begin
      X := StartPosX;
      Y := StartPosY + 42 shr 1;

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
      X := FsgLeft;
      Y := FsgTop;

      DetOutline(X, Y, sgDeterminant.Height,
        sgDeterminant.Width, pbExpression);

      X := X + sgDeterminant.Width + ColumnInterval shl 1;
      TextToOut := ' = ' +
        FloatToStr(DataManager.CurrentDeterminant.FAnswer.FNumber);
      MidMatrixTextPrint(X, Y, sgDeterminant.Height, TextToOut, pbExpression);

      pbExpression.Width := FsgLeft + sgDeterminant.Width + ColumnInterval shl 1 + X;
      pbExpression.Height := FsgTop + sgDeterminant.Height + LineInterval shl 1;
    end;

    ostatInverse:
    begin
      X := FsgLeft;
      Y := FsgTop;

      BraceOutline(X, Y, sgInverse.Height,
        sgInverse.Width, pbExpression);

      pbExpression.Width := FsgLeft + sgInverse.Width + ColumnInterval shl 1;
      pbExpression.Height := FsgTop + sgInverse.Height + LineInterval shl 1;
    end;

    ostatRank:
    begin
      X := FsgLeft;
      Y := FsgTop;

      BraceOutline(X, Y, sgRank.Height, sgRank.Width,
        pbExpression);

      pbExpression.Width := FsgLeft + sgRank.Width + ColumnInterval shl 1;
      pbExpression.Height := FsgTop + sgRank.Height + LineInterval shl 1;
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
  Matrix: TExtendedMatrixElements;
begin
  Answer := DataManager.CurrentAnswer;

  case DataManager.OperationStatement of
    ostatExpression:
      if ExprCalculation(edExpression.Text, Answer) then
        DataManager.CurrentAnswer := Answer;


    ostatDeterminant:
    begin
      sgResize(sgGetCurrent);
      SetLength(Matrix, DataManager.CurrentDeterminant.FProblemMatrix.LinesAmount,
        DataManager.CurrentDeterminant.FProblemMatrix.ColumnsAmount);
      if DataManager.TryProblemMatrixToExtended(DataManager.CurrentDeterminant.FProblemMatrix,
        Matrix) then
      begin
        Answer.FIsMatrix := False;
        Answer.FNumber := FindDeterminant(Matrix);
        DataManager.CurrentAnswer := Answer;
      end
      else
        ShowMessage('Incorrect matrix element was found');
      SetLength(Matrix, 0, 0);
    end;

    ostatInverse:
    begin
      sgResize(sgGetCurrent);
    end;

    ostatRank:
    begin
      sgResize(sgGetCurrent);
    end;
  end;

  DataManager.CallBack(pbExpression);
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
  labX.Visible := False;
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
    FsgLeft := sgGetCurrent.Left;
    FsgTop := sgGetCurrent.Top;

    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Tag = butInverseChoose.Tag) then
  begin
    DataManager.OperationStatement := ostatInverse;

    sgInverse.Visible := True;
    butAddDimension.Visible := True;
    butRemoveDimension.Visible := True;
    sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);
    FsgLeft := sgGetCurrent.Left;
    FsgTop := sgGetCurrent.Top;

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
     labX.Visible := True;
    sgInputMatrixAssign(sgGetCurrent, DataManager.GetCurrentOperation.FProblemMatrix);
    FsgLeft := sgGetCurrent.Left;
    FsgTop := sgGetCurrent.Top;

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

procedure TMainForm.sbExpressionClick(Sender: TObject);
begin
  sbExpression.SetFocus;
end;

procedure TMainForm.sbExpressionMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  // Check if Shift key is pressed
  if ssShift in Shift then
  begin
    // Scroll horizontally based on the WheelDelta value
    if WheelDelta > 0 then
      sbExpression.HorzScrollBar.Position := sbExpression.HorzScrollBar.Position - ScrollStep
    else
      sbExpression.HorzScrollBar.Position := sbExpression.HorzScrollBar.Position + ScrollStep;
  end
  else
  begin
    // Scroll vertically based on the WheelDelta value
    if WheelDelta > 0 then
      sbExpression.VertScrollBar.Position := sbExpression.VertScrollBar.Position - ScrollStep
    else
      sbExpression.VertScrollBar.Position := sbExpression.VertScrollBar.Position + ScrollStep;
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
