unit fEditMatr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Vcl.ExtCtrls,
  ClMatrix,
  ClMatrixList,
  Constants;

type
  TfNewMatrix = class(TForm)
    panMatrixMainInfo: TPanel;
    labMatrixName: TLabel;
    labDimensions: TLabel;
    labX: TLabel;
    edMatrixName: TEdit;
    edMatrixLines: TEdit;
    edMatrixColumns: TEdit;
    butOK: TButton;
    butCancel: TButton;
    sbMatrixElements: TScrollBox;
    pbMatrixElements: TPaintBox;
    procedure butOKClick(Sender: TObject);
    procedure pbMatrixElementsPaint(Sender: TObject);
    procedure sbMatrixElementsMouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }

    function isCorrectData(): boolean;
    procedure PaintLeftBrace();
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function TryGetMatrix(): TMatrix;

  end;

var
  fNewMatrix: TfNewMatrix;


implementation

{$R *.dfm}

constructor TfNewMatrix.Create(AOwner: TComponent);
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


end;

procedure TfNewMatrix.PaintLeftBrace();
begin
  pbMatrixElements.Canvas.MoveTo(EditMatrixLeftBraceStartingX, EditMatrixLeftBraceStartingY);
  pbMatrixElements.Canvas.LineTo(EditMatrixLeftBraceStartingX - 10, EditMatrixLeftBraceStartingY);
  pbMatrixElements.Canvas.LineTo(EditMatrixLeftBraceStartingX - 10, EditMatrixLeftBraceStartingY + (VerticalElementInterval + ElementHeight) * StrToInt(edMatrixColumns.Text) + VerticalElementInterval);
  pbMatrixElements.Canvas.LineTo(EditMatrixLeftBraceStartingX, EditMatrixLeftBraceStartingY + (VerticalElementInterval + ElementHeight) * StrToInt(edMatrixColumns.Text) + VerticalElementInterval);
end;

procedure TfNewMatrix.pbMatrixElementsPaint(Sender: TObject);
begin
  //pbMatrixElements.Canvas.;
  pbMatrixElements.Canvas.Pen.Width := DefaulePenWidth;
  pbMatrixElements.Canvas.Font.Name := DefaultFontName;
  pbMatrixElements.Canvas.Font.Size := DefaultFontSize;

  PaintLeftBrace();
  pbMatrixElements.Canvas.TextOut(20, 20, '123.321');
  pbMatrixElements.Canvas.TextOut(20, 50, '222222');
end;

procedure TfNewMatrix.sbMatrixElementsMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  if isCorrectData() then
    pbMatrixElementsPaint(pbMatrixElements);
end;

procedure TfNewMatrix.butOKClick(Sender: TObject);
begin
  if isCorrectData() then
    ModalResult := mrOK;
end;

function TfNewMatrix.isCorrectData(): boolean;
const
  NameFirstElValidSymbols = ['a'..'z', 'A'..'Z', '_'];
  NameValidSymbols = ['a'..'z', 'A'..'Z', '_', '0'..'9'];

var
  i, temp: integer;
  isCorrName, isCorrLines, isCorrColumns: boolean;
begin
  isCorrName := true;
  isCorrLines := true;
  isCorrColumns := true;
  Result := true;

  if length(edMatrixName.Text) >= 1 then
  begin
    if not (edMatrixName.Text[1] in NameFirstElValidSymbols) then
      isCorrName := false
  end
  else
    isCorrName := false;

  i := 2;
  while (i <= length(edMatrixName.Text)) and (isCorrName = true) do
  begin
    if not (edMatrixName.Text[i] in NameValidSymbols) then
      isCorrName := false;

    inc(i);
  end;

  isCorrLines := TryStrToInt(edMatrixLines.Text, temp);
  isCorrColumns := TryStrToInt(edMatrixColumns.Text, temp);

  if not isCorrName then
    ShowMessage('Entered name is incorrect.');

  if not isCorrLines then
    ShowMessage('Entered amount of lines is incorrect.');

  if not isCorrColumns then
    ShowMessage('Entered amount of columns is incorrect.');

  if (not isCorrName) or (not isCorrLines) or (not isCorrColumns) then
    Result := false;
end;


function TfNewMatrix.TryGetMatrix(): TMatrix;
begin
  edMatrixName.Text := '';
  edMatrixLines.Text := '';
  edMatrixColumns.Text := '';

  pbMatrixElements.ControlStyle := pbMatrixElements.ControlStyle - [csNoDesignVisible];
  ShowModal;

  if ModalResult = mrOK then
  begin
    Result := TMatrix.Create(edMatrixName.Text, StrToInt(edMatrixLines.Text), StrToInt(edMatrixColumns.Text));
  end
  else
    Result := nil;
end;

end.
