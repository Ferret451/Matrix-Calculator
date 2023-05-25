unit untPainting;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, untConstants, clsMatrix;

type
  TSideProc = function(A, B: Integer): Integer;
  TOutline = procedure(const ALeft, ATop, AHeight, AWidth: Integer;
    Sender: TObject);

function GetMatrixHeight(const AMatrix: TMatrix; Sender: TObject): Integer;
procedure MatrixNamePrint(var AX, AY: Integer; AMatrix: TMatrix; Sender: TObject);
procedure MatrixPaint(var AX, AY: Integer; const AMatrix: TMatrix;
  AOutline: TOutline; Sender: TObject);
procedure BraceOutline(const ALeft, ATop, AHeight, AWidth: Integer;
  Sender: TObject);
procedure DetOutline(const ALeft, ATop, AHeight, AWidth: Integer;
  Sender: TObject);

implementation

function GetMatrixHeight(const AMatrix: TMatrix; Sender: TObject): Integer;
var
  LineHeight: Integer;
begin
  LineHeight := TPaintBox(Sender).Canvas.TextHeight(ExampleText);
  Result := AMatrix.LinesAmount * (LineHeight + LineInterval)
    - LineInterval;
end;

procedure MatrixNamePrint(var AX, AY: Integer; AMatrix: TMatrix; Sender: TObject);
var
  TextToOut: string;
  LineHeight, MatrixHeight: Integer;
begin
  TextToOut := AMatrix.Name + ' = ';
  MatrixHeight := GetMatrixHeight(AMatrix, Sender);

  LineHeight := TPaintBox(Sender).Canvas.TextHeight(TextToOut);

  TPaintBox(Sender).Canvas.TextOut(AX, (AY + AY + MatrixHeight + 2 * LineInterval
    - LineHeight) div 2, TextToOut);

  AX := AX + TPaintBox(Sender).Canvas.TextWidth(TextToOut);
end;

function Left(A, B: Integer): Integer;
begin
  Result := A - B;
end;

function Right(A, B: Integer): Integer;
begin
  Result := A + B;
end;

procedure BraceOutline(const ALeft, ATop, AHeight, AWidth: Integer;
  Sender: TObject);
var
  X, Y: Integer;

procedure BracePaint(AX, AY, AHeight: Integer; ASideProc: TSideProc;
  Sender: TObject);
begin
  AY := AY - LineInterval;
  TPaintBox(Sender).Canvas.MoveTo(AX, AY);
  TPaintBox(Sender).Canvas.LineTo(ASideProc(AX, ColumnInterval), AY);

  AY := AY + AHeight + 2 * LineInterval;
  TPaintBox(Sender).Canvas.MoveTo(AX, AY);
  TPaintBox(Sender).Canvas.LineTo(ASideProc(AX, ColumnInterval), AY);

  AX := ASideProc(AX, ColumnInterval);
  TPaintBox(Sender).Canvas.LineTo(AX, AY - AHeight - 2 * LineInterval);
end;

begin
  BracePaint(ALeft, ATop, AHeight, Left, Sender);
  BracePaint(ALeft + AWidth, ATop, AHeight, Right, Sender);
end;

procedure DetOutline(const ALeft, ATop, AHeight, AWidth: Integer;
  Sender: TObject);
var
  X, Y: Integer;

procedure DetBracePaint(AX, AY, AHeight: Integer; ASideProc: TSideProc;
  Sender: TObject);
begin
  AX := ASideProc(AX, ColumnInterval);
  AY := AY - LineInterval;
  TPaintBox(Sender).Canvas.MoveTo(AX, AY);
  TPaintBox(Sender).Canvas.LineTo(AX, AY + AHeight + 2 * LineInterval);
end;

begin
  DetBracePaint(ALeft, ATop, AHeight, Left, Sender);
  DetBracePaint(ALeft + AWidth, ATop, AHeight, Right, Sender);
end;

procedure MatrixElementsPrint(var AX, AY, AMatrixWidth: Integer; AMatrix: TMatrix;
  Sender: TObject);
var
  i, j, TopY, CurrColumnMaxLength, Buf: integer;
  CurrElString, CurrColumnMaxLengthString: string;
begin
  Buf := AX;
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
  AMatrixWidth := AX - Buf;
end;

procedure MatrixPaint(var AX, AY: Integer; const AMatrix: TMatrix;
  AOutline: TOutline; Sender: TObject);
var
  X, Y, MatrixHeight, MatrixWidth: Integer;
begin
  MatrixHeight := GetMatrixHeight(AMatrix, Sender);

  X := AX + ColumnInterval;
  Y := AY + LineInterval;
  MatrixElementsPrint(X, Y, MatrixWidth, AMatrix, Sender);

  AOutline(AX + ColumnInterval, AY + LineInterval,
    MatrixHeight, MatrixWidth, Sender);

  AX := AX + MatrixWidth + 2 * ColumnInterval;
  AY := AY + MatrixHeight + 2 * LineInterval;
end;

end.
