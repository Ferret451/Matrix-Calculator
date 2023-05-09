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
    aEditMatrix: TAction;
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
    procedure aEditMatrixExecute(Sender: TObject);
    procedure aSortListAtoZExecute(Sender: TObject);
    procedure aClearListExecute(Sender: TObject);
    procedure pbMatrixListPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public
    constructor Create(AOwner: TComponent); override;

    procedure MatrixNamePrint(const AMatrixHeight: Integer;
      var AX, AY: Integer; const AMatrixName: string; Sender: TObject);
    procedure PaintLeftBrace(const AMatrixHeight: Integer; var AX, AY: Integer;
      Sender: TObject);
    procedure PaintRightBrace(const AMatrixHeight: Integer; var AX, AY: Integer;
      Sender: TObject);
    procedure MatrixElementsPrint(var AX, AY: Integer; AMatrix: TMatrix;
      Sender: TObject);
  end;

var
  MatrixListForm: TMatrixListForm;

implementation

{$R *.dfm}



procedure TMatrixListForm.aClearListExecute(Sender: TObject);
begin
//
end;

procedure TMatrixListForm.aEditMatrixExecute(Sender: TObject);
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

procedure TMatrixListForm.aSortListAtoZExecute(Sender: TObject);
begin
//
end;

constructor TMatrixListForm.Create(AOwner: TComponent);
var
  OwnerControl: TControl;
begin
  inherited;

  if AOwner is TControl then
  begin
    OwnerControl := TControl(AOwner);
    Left := OwnerControl.Left + (OwnerControl.Width - Width) shr 1;
    Top := OwnerControl.Top + (OwnerControl.Height - Height) shr 1;
  end
  else
  begin
    Left := (Screen.Width - Width) shr 1;
    Top := (Screen.Height - Height) shr 1;
  end;

  pbMatrixList.Canvas.Font.Name := DefaultFontName;
  pbMatrixList.Canvas.Font.Size := DefaultFontSize;
  pbMatrixListPaint(pbMatrixList);
end;

procedure TMatrixListForm.FormCreate(Sender: TObject);
var
  OwnerControl: TControl;
begin
  inherited;

  if Sender is TControl then
  begin
    OwnerControl := TControl(Sender);
    Left := OwnerControl.Left + (OwnerControl.Width - Width) shr 1;
    Top := OwnerControl.Top + (OwnerControl.Height - Height) shr 1;
  end
  else
  begin
    Left := (Screen.Width - Width) shr 1;
    Top := (Screen.Height - Height) shr 1;
  end;
end;

procedure TMatrixListForm.MatrixNamePrint(const AMatrixHeight: Integer;
  var AX, AY: Integer; const AMatrixName: string; Sender: TObject);
var
  TextToOut: string;
begin
  TextToOut := AMatrixName + ' = ';

  TPaintBox(Sender).Canvas.TextOut(AX, (AY + AMatrixHeight) div 2, TextToOut);

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

  for i := 0 to AMatrix.Lines - 1 do
  begin
    CurrColumnMaxLength := -MaxInt - 1;

    for j := 0 to AMatrix.Columns - 1 do
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

procedure TMatrixListForm.pbMatrixListPaint(Sender: TObject);
var
  CurrNode: TMatrixList.PNode;
  X, Y, CurrMatrixPosX, CurrMatrixPosY, CurrMatrixHeight, LineHeight: Integer;
begin
  TPaintBox(Sender).Canvas.Font.Name := DefaultFontName;
  TPaintBox(Sender).Canvas.Font.Size := DefaultFontSize;

  LineHeight := TPaintBox(Sender).Canvas.TextHeight(ExampleText);

  CurrMatrixPosX := MatrixListStartPosX;
  CurrMatrixPosY := MatrixListStartPosY;
  CurrNode := DataManager.MatrixList.Head;
  while Assigned(CurrNode) do
  begin
    X := CurrMatrixPosX;
    Y := CurrMatrixPosY;
    CurrMatrixHeight := CurrNode^.FValue.Lines * (LineHeight + LineInterval)
      + LineInterval;

    MatrixNamePrint(CurrMatrixHeight, X, Y, CurrNode^.FValue.Name, pbMatrixList);

    X := X + TopBottomBraceLinesLength;
    Y := CurrMatrixPosY;
    PaintLeftBrace(CurrMatrixHeight, X, Y, pbMatrixList);

    Y := CurrMatrixPosY + LineInterval;
    MatrixElementsPrint(X, Y, CurrNode^.FValue, pbMatrixList);

    Y := CurrMatrixPosY;
    PaintRightBrace(CurrMatrixHeight, X, Y, pbMatrixList);

    CurrMatrixPosY := CurrMatrixPosY + CurrMatrixHeight + LineInterval;
    CurrNode := CurrNode^.FNext;
  end;
end;

end.
