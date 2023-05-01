unit fNewMatr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  ClMatrix,
  ClMatrixList;

type
  TfNewMatrix = class(TForm)
    labMatrixName: TLabel;
    labDimensions: TLabel;
    edMatrixName: TEdit;
    edMatrixLines: TEdit;
    edMatrixColumns: TEdit;
    labX: TLabel;
    butOK: TButton;
    butCancel: TButton;
    procedure butOKClick(Sender: TObject);
  private
    { Private declarations }

    function isCorrectData(): boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function TryGetMatrix(): TMatrix;
  end;

var
  fNewMatrix: TfNewMatrix;


implementation

{$R *.dfm}

procedure TfNewMatrix.butOKClick(Sender: TObject);
begin
  if isCorrectData() then
    ModalResult := mrOK;
end;

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

  if not (edMatrixName.Text[1] in ['a'..'z', 'A'..'Z', '_']) then
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
  //
  ShowModal;

  if ModalResult = mrOK then
  begin
    Result := TMatrix.Create(edMatrixName.Text, StrToInt(edMatrixLines.Text), StrToInt(edMatrixColumns.Text));
  end
  else
    Result := nil;
end;

end.
