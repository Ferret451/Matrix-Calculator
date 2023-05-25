unit frmMain;

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
    sgInputMatrix: TStringGrid;
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
    edLinesAmount: TEdit;
    edColumnsAmount: TEdit;
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    aOpenHelp: TAction;
    aOpenAbout: TAction;

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
    procedure edDimensionsChange(Sender: TObject);
    procedure aExecuteInfo(Sender: TObject);
    procedure edDimensionsExit(Sender: TObject);
    procedure sgInputMatrixSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
  private
    FCarriagePos: Integer;

    function TryStrToNatural(const ANumberSting: string; var ANumber: Integer): Boolean;
    procedure SelectSpecificCell(ACol, ARow: Integer);
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
  pbExpression.Canvas.FillRect(pbExpression.ClientRect);

  case DataManager.OperationStatement of
    ostatExpression:
    begin
      X := StartPosX;
      Y := StartPosY;

      if DataManager.CurrentExpression.FAnswer.FIsMatrix then
        MatrixPaint(X, Y, DataManager.CurrentExpression.FAnswer.FMatrix, BraceOutline,
          pbExpression)
      else
        if DataManager.CurrentExpression.FAnswer.FNumber = 1 / 0 then
          pbExpression.Canvas.TextOut(X, Y, '+ ?')
        else if DataManager.CurrentExpression.FAnswer.FNumber = -1 / 0 then
          pbExpression.Canvas.TextOut(X, Y, '- ?')
        else
          pbExpression.Canvas.TextOut(X, Y,
            FloatToStr(DataManager.CurrentExpression.FAnswer.FNumber));
    end;

    ostatDeterminant:
    begin
      DetOutline(sgInputMatrix.Left, sgInputMatrix.Top, sgInputMatrix.Height,
        sgInputMatrix.Width, pbExpression);
    end;

    ostatInverse:
    begin
      pbExpression.Canvas.TextOut(StartPosX, StartPosY, 'Lines:');
      pbExpression.Canvas.TextOut(StartPosX +
        pbExpression.Canvas.TextWidth('Lines:') + edLinesAmount.Width + 42, StartPosY,
        'Columns:');
      BraceOutline(sgInputMatrix.Left, sgInputMatrix.Top, sgInputMatrix.Height,
        sgInputMatrix.Width, pbExpression);
    end;

    ostatRank:
    begin
      pbExpression.Canvas.TextOut(StartPosX, StartPosY, 'Lines:');
      pbExpression.Canvas.TextOut(StartPosX +
        pbExpression.Canvas.TextWidth('Lines:') + edLinesAmount.Width + 42, StartPosY,
        'Columns:');
      BraceOutline(sgInputMatrix.Left, sgInputMatrix.Top, sgInputMatrix.Height,
        sgInputMatrix.Width, pbExpression);
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
  if ExprCalculation(edExpression.Text, Answer) then
  begin
    DataManager.SetAnswer(Answer, DataManager.GetCurrentOperation);
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

procedure TMainForm.butChooseClick(Sender: TObject);
begin
  edExpression.Visible := False;
  sgInputMatrix.Visible := False;
  butAddDimension.Visible := False;
  butRemoveDimension.Visible := False;
  edLinesAmount.Visible := False;
  edColumnsAmount.Visible := False;
  if TButton(Sender).Name = butExpressionChoose.Name then
  begin
    DataManager.OperationStatement := ostatExpression;
    edExpression.Visible := True;
    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Name = butDeterminantChoose.Name) then
  begin
    DataManager.OperationStatement := ostatDeterminant;
    sgInputMatrix.Visible := True;
    butAddDimension.Visible := True;
    butRemoveDimension.Visible := True;
    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Name = butInverseChoose.Name) then
  begin
    DataManager.OperationStatement := ostatInverse;
    sgInputMatrix.Visible := True;
    edLinesAmount.Visible := True;
    edColumnsAmount.Visible := True;
    DataManager.CallBack(pbExpression);
  end
  else if (TButton(Sender).Name = butRankChoose.Name) then
  begin
    DataManager.OperationStatement := ostatRank;
    sgInputMatrix.Visible := True;
    edLinesAmount.Visible := True;
    edColumnsAmount.Visible := True;
    DataManager.CallBack(pbExpression);
  end;
end;

procedure TMainForm.butAddDimensionClick(Sender: TObject);
begin
  sgInputMatrix.RowCount := sgInputMatrix.RowCount + 1;
  sgInputMatrix.ColCount := sgInputMatrix.ColCount + 1;
  sgResize(sgInputMatrix);
end;

procedure TMainForm.butRemoveDimensionClick(Sender: TObject);
begin
  if sgInputMatrix.RowCount > 1 then
  begin
    sgInputMatrix.RowCount := sgInputMatrix.RowCount - 1;
    sgInputMatrix.ColCount := sgInputMatrix.ColCount - 1;
    sgResize(sgInputMatrix);
  end;
end;

procedure TMainForm.sgInputMatrixSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
  Temp: Extended;
begin
//
end;

procedure TMainForm.SelectSpecificCell(ACol, ARow: Integer);
begin
  sgInputMatrix.Selection := TGridRect(Rect(ACol, ARow, ACol, ARow));
end;

procedure TMainForm.sgResize(Sender: TObject);
var
  LineWidth: Integer;
begin
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

procedure TMainForm.edDimensionsChange(Sender: TObject);
var
  Amount: Integer;
begin
  if TryStrToNatural(TEdit(Sender).Text, Amount) then
    if TEdit(Sender).Name = edLinesAmount.Name then
    begin
      sgInputMatrix.RowCount := Amount;
      sgResize(sgInputMatrix);
    end
    else if TEdit(Sender).Name = edColumnsAmount.Name then
    begin
      sgInputMatrix.ColCount := Amount;
      sgResize(sgInputMatrix);
    end
end;

procedure TMainForm.edDimensionsExit(Sender: TObject);
var
  Temp: Integer;
begin
  if not TryStrToNatural(TEdit(Sender).Text, Temp) then
  begin
    ShowMessage('In�orrect dimension');
    TEdit(Sender).SetFocus;
  end;
end;

end.
