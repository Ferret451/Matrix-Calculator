unit frmMatrList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ExtCtrls,
  clsMatrixList, clsMatrix, clsDataManager, untConstants, frmEditMatr;

type
  TMatrixListForm = class(TForm)

    alMatrixList: TActionList;
    ilMatrixList: TImageList;
    aNewMatrix: TAction;
    aSortListAtoZ: TAction;
    tbMatrixList: TToolBar;
    tbNewMatrix: TToolButton;
    ToolButton1: TToolButton;
    aClearList: TAction;
    tbClearList: TToolButton;
    aSortListZtoA: TAction;
    tbClear: TToolButton;
    sbMatrixList: TScrollBox;
    pbMatrixList: TPaintBox;
    procedure aNewMatrixExecute(Sender: TObject);
    procedure aSortListAtoZExecute(Sender: TObject);
    procedure pbMatrixListPaint(Sender: TObject);
    procedure aClearListExecute(Sender: TObject);
    procedure pbMatrixListDblClick(Sender: TObject);
    procedure pbMatrixListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);

  private type
    TMatrixBorders = record
      FTop, FBottom, FLeft, FRight: Integer;
    end;
    TPos = record
      FX, FY: Integer;
    end;

  private
    FMatrixesBorders: array of TMatrixBorders;
    FCursorPos: TPos;
  public
    destructor Destroy(); override;

    procedure MatrixPaint(var AX, AY: Integer; const AMatrix: TMatrix; Sender: TObject);
    procedure MatrixNamePrint(const AMatrixHeight: Integer;
      var AX, AY: Integer; const AMatrixName: string; Sender: TObject);
    procedure PaintLeftBrace(const AMatrixHeight: Integer; var AX, AY: Integer;
      Sender: TObject);
    procedure PaintRightBrace(const AMatrixHeight: Integer; var AX, AY: Integer;
      Sender: TObject);
    procedure MatrixElementsPrint(var AX, AY: Integer; AMatrix: TMatrix;
      Sender: TObject);
    function GetMatrixHeight(const AMatrix: TMatrix; Sender: TObject): Integer;
  end;

var
  MatrixListForm: TMatrixListForm;

implementation

{$R *.dfm}

destructor TMatrixListForm.Destroy();
begin
  SetLength(FMatrixesBorders, 0);

  inherited;
end;

procedure TMatrixListForm.FormShow(Sender: TObject);
begin
  Left:= (Screen.Width - Width) shr 1;
  Top:= (Screen.Height - Width) shr 1;
end;

procedure TMatrixListForm.aClearListExecute(Sender: TObject);
begin
  SetLength(FMatrixesBorders, 0);
  DataManager.MatrixList.Clear();
  DataManager.CallBack(pbMatrixList);
end;

procedure TMatrixListForm.aNewMatrixExecute(Sender: TObject);
var
  EditingMatrix: TMatrix;
begin
  EditMatrixForm.TryGetMatrix(EditingMatrix);

  if Assigned(EditingMatrix) then
  begin
    DataManager.MatrixList.Add(EditingMatrix);
    DataManager.CallBack(pbMatrixList);
  end;
end;

procedure TMatrixListForm.pbMatrixListDblClick(Sender: TObject);
var
  i: Integer;
  EditingMatrix: TMatrix;
begin
  for i := Low(FMatrixesBorders) to High(FMatrixesBorders) do
    if (FCursorPos.FX >= FMatrixesBorders[i].FLeft) and
      (FCursorPos.FX <= FMatrixesBorders[i].FRight) and
      (FCursorPos.FY >= FMatrixesBorders[i].FTop) and
      (FCursorPos.FY <= FMatrixesBorders[i].FBottom) then
    begin
      EditingMatrix := DataManager.MatrixList.GetValue(i);
      EditMatrixForm.TryGetMatrix(EditingMatrix, False);
      DataManager.MatrixList.SetValue(i, EditingMatrix);
      DataManager.CallBack(pbMatrixList);
    end;
end;

procedure TMatrixListForm.pbMatrixListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FCursorPos.FX := X;
  FCursorPos.FY := Y;
end;

procedure TMatrixListForm.aSortListAtoZExecute(Sender: TObject);
begin
//
end;

procedure TMatrixListForm.MatrixNamePrint(const AMatrixHeight: Integer;
  var AX, AY: Integer; const AMatrixName: string; Sender: TObject);
var
  TextToOut: string;
  LineHeight: Integer;
begin
  TextToOut := AMatrixName + ' = ';

  LineHeight := TPaintBox(Sender).Canvas.TextHeight(TextToOut);

  TPaintBox(Sender).Canvas.TextOut(AX, (AY + AY + AMatrixHeight) div 2 -
    LineHeight div 2, TextToOut);

  AX := AX + TPaintBox(Sender).Canvas.TextWidth(TextToOut);
  AY := AY + TPaintBox(Sender).Canvas.TextHeight(TextToOut);
end;

procedure TMatrixListForm.PaintLeftBrace(const AMatrixHeight: Integer;
  var AX, AY: Integer; Sender: TObject);
begin
  TPaintBox(Sender).Canvas.MoveTo(AX, AY);

  AX := AX - TopBottomBraceLinesLength;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);

  AY := AY + AMatrixHeight;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);

  AX := AX + TopBottomBraceLinesLength;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);
end;

procedure TMatrixListForm.PaintRightBrace(const AMatrixHeight: Integer;
  var AX, AY: Integer; Sender: TObject);
begin
  TPaintBox(Sender).Canvas.MoveTo(AX, AY);

  AX := AX + TopBottomBraceLinesLength;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);

  AY := AY + AMatrixHeight;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);

  AX := AX - TopBottomBraceLinesLength;
  TPaintBox(Sender).Canvas.LineTo(AX, AY);
end;

procedure TMatrixListForm.MatrixElementsPrint(var AX, AY: Integer;
  AMatrix: TMatrix; Sender: TObject);
var
  i, j, TopY, CurrColumnMaxLength: integer;
  CurrElString, CurrColumnMaxLengthString: string;
begin
  TopY := AY;

  for j := 0 to AMatrix.ColumnsAmount - 1 do
  begin
    CurrColumnMaxLength := -MaxInt - 1;

    for i := 0 to AMatrix.LinesAmount - 1 do
    begin
      CurrElString := FloatToStr(AMatrix.Elements[i, j]);

      TPaintBox(Sender).Canvas.TextOut(AX, AY, CurrElString);

      if Length(CurrElString) > CurrColumnMaxLength then
      begin
        CurrColumnMaxLength := Length(CurrElString);
        CurrColumnMaxLengthString := CurrElString;
      end;

      AY := AY + TPaintBox(Sender).Canvas.TextHeight(CurrElString) + LineInterval;
    end;

    AX := AX + TPaintBox(Sender).Canvas.TextWidth(CurrColumnMaxLengthString)
      + ColumnInterval;
    AY := TopY;
  end;

  AX := AX - ColumnInterval;
end;

function TMatrixListForm.GetMatrixHeight(const AMatrix: TMatrix;
   Sender: TObject): Integer;
var
  LineHeight: Integer;
begin
  LineHeight := TPaintBox(Sender).Canvas.TextHeight(ExampleText);
  Result := AMatrix.LinesAmount * (LineHeight + LineInterval)
    + LineInterval;
end;

procedure TMatrixListForm.MatrixPaint(var AX, AY: Integer; const AMatrix: TMatrix;
  Sender: TObject);
var
  MatrixHeight, StartX, StartY: Integer;
begin
  StartX := AX;
  StartY := AY;

  MatrixHeight := GetMatrixHeight(AMatrix, Sender);

  if AMatrix.Name <> '' then
    MatrixNamePrint(MatrixHeight, AX, AY, AMatrix.Name, Sender);

  AX := AX + TopBottomBraceLinesLength;
  AY := StartY;
  PaintLeftBrace(MatrixHeight,AX, AY, Sender);

  AY := StartY + LineInterval;
  MatrixElementsPrint(AX, AY, AMatrix, Sender);

  AY := StartY;
  PaintRightBrace(MatrixHeight, AX, AY, Sender);
end;

procedure TMatrixListForm.pbMatrixListPaint(Sender: TObject);
var
  CurrNode: TMatrixList.PNode;
  X, Y, CurrMatrixPosX, CurrMatrixPosY: Integer;
begin
  TPaintBox(pbMatrixList).Canvas.FillRect(TPaintBox(pbMatrixList).ClientRect);

  CurrMatrixPosX := StartPosX;
  CurrMatrixPosY := StartPosY;

  SetLength(FMatrixesBorders, 0);
  CurrNode := DataManager.MatrixList.Head;
  while Assigned(CurrNode) do
  begin
    SetLength(FMatrixesBorders, Length(FMatrixesBorders) + 1);
    X := CurrMatrixPosX;
    Y := CurrMatrixPosY;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FLeft := X;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FTop := Y;

    MatrixPaint(X, Y, CurrNode^.FValue, Sender);

    X := X + TopBottomBraceLinesLength;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FRight := X;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FBottom := Y;
    CurrMatrixPosY := CurrMatrixPosY + GetMatrixHeight(CurrNode^.FValue, Sender) +
      LineInterval;
    CurrNode := CurrNode^.FNext;
  end;
end;

end.
