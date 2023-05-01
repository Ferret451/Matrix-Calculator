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
    edLines: TEdit;
    edColumns: TEdit;
    labX: TLabel;
    butOK: TButton;
    butCancel: TButton;
    procedure butOKClick(Sender: TObject);
  private
    { Private declarations }

    function isCorrectData(const AName, ALines, AColumns: string): boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
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

  function TfNewMatrix.isCorrectData(const AName, ALines, AColumns: string): boolean;
  const
    NameValidSymbols = ['a'..'z', 'A'..'Z', '0'..'9', '_'];
  var
    i, temp: integer;
    isCorrName, isCorrLines, isCorrColumns: boolean;
  begin
    isCorrName := true;
    isCorrLines := true;
    isCorrColumns := true;
    Result := true;

    if not (AName[1] in ['a'..'z', 'A'..'Z', '_']) then
      isCorrName := false;

    i := 2;
    while (i <= length(AName)) and (isCorrName = true) do
    begin
      if not (AName[i] in NameValidSymbols) then
        isCorrName := false;

      inc(i);
    end;

    isCorrLines := TryStrToInt(ALines, temp);
    isCorrColumns := TryStrToInt(AColumns, temp);

    if not isCorrName then
      ShowMessage('Entered name is incorrect.');

    if not isCorrLines then
      ShowMessage('Entered amount of lines is incorrect.');

    if not isCorrColumns then
      ShowMessage('Entered amount of columns is incorrect.');

    if (not isCorrName) or (not isCorrLines) or (not isCorrColumns) then
      Result := false;
  end;

  procedure TfNewMatrix.butOKClick(Sender: TObject);
  begin
    if isCorrectData(edMatrixName.Text, edLines.Text, edColumns.Text) then
    begin
       (TMatrix.Create(edMatrixName.Text, StrToInt(edLines.Text), StrToInt(edColumns.Text)));

      ModalResult := mrOK;
    end;
  end;

end.
