unit frmEditMatr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Vcl.ExtCtrls, Vcl.Grids,
  clsMatrix, clsMatrixList, untConstants;

type
  TEditMatrixForm = class(TForm)
    panMatrixMainInfo: TPanel;
    labMatrixName: TLabel;
    labDimensions: TLabel;
    labX: TLabel;
    edMatrixName: TEdit;
    edMatrixLines: TEdit;
    edMatrixColumns: TEdit;
    butOK: TButton;
    butCancel: TButton;
    sgMatrixElements: TStringGrid;
    procedure butOKClick(Sender: TObject);
    procedure sgMatrixElementsMouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    function isCorrectMainData(): Boolean;
    function isCorrectMatrixElements(): Boolean;
  public
    constructor Create(AOwner: TComponent);
    procedure TryGetMatrix(var AEditingMatrix: TMatrix;
      const AisNewMatrix: Boolean = True);

  end;

var
  EditMatrixForm: TEditMatrixForm;


implementation

{$R *.dfm}

constructor TEditMatrixForm.Create(AOwner: TComponent);
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

procedure TEditMatrixForm.butOKClick(Sender: TObject);
begin
  if isCorrectMainData() and isCorrectMatrixElements() then
    ModalResult := mrOK;
end;

function TEditMatrixForm.isCorrectMatrixElements(): Boolean;
var
  i, j: Integer;
  TempValue: Extended;
  isCorrectElements: Boolean;
begin
  isCorrectElements := True;
  i := 0;
  j := 0;

  while (i < StrToInt(edMatrixLines.Text)) and (isCorrectElements) do
  begin
    while (j < StrToInt(edMatrixColumns.Text)) and (isCorrectElements) do
    begin
      if not TryStrToFloat(sgMatrixElements.Cells[i, j], TempValue) then
      begin
        ShowMessage('Entered elements must be real numbers');

        isCorrectElements := False;
        Result := False;
      end;

      inc(j);
    end;

    inc(i);
  end;


end;

function TEditMatrixForm.isCorrectMainData(): Boolean;
var
  i, TempValue: Integer;
  IsCorrectName, IsCorrectLines, IsCorrectColumns: Boolean;
begin
  IsCorrectName := true;
  IsCorrectLines := true;
  IsCorrectColumns := true;
  Result := true;

  if length(edMatrixName.Text) >= 1 then
  begin
    if not (edMatrixName.Text[1] in MatrixNameFirstElValidSymbols) then
      IsCorrectName := false
  end
  else
    IsCorrectName := false;

  i := 2;
  while (i <= length(edMatrixName.Text)) and (IsCorrectName = true) do
  begin
    if not (edMatrixName.Text[i] in MatrixNameValidSymbols) then
      IsCorrectName := false;

    inc(i);
  end;

  IsCorrectLines := TryStrToInt(edMatrixLines.Text, TempValue);

  if IsCorrectLines then
  begin
    TempValue := StrToInt(edMatrixLines.Text);
    if TempValue <= 0 then
      IsCorrectLines := False;
  end;

  IsCorrectColumns := TryStrToInt(edMatrixColumns.Text, TempValue);

  if IsCorrectColumns then
  begin
    TempValue := StrToInt(edMatrixColumns.Text);
    if TempValue <= 0 then
      IsCorrectColumns := False;
  end;

  if not IsCorrectName then
    ShowMessage('Entered name is incorrect');

  if not IsCorrectLines then
    ShowMessage('Entered amount of lines is incorrect');

  if not IsCorrectColumns then
    ShowMessage('Entered amount of columns is incorrect');

  if (not IsCorrectName) or (not IsCorrectLines) or (not IsCorrectColumns) then
    Result := false;
end;

procedure TEditMatrixForm.sgMatrixElementsMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
var
  i, j: Integer;
begin
  if isCorrectMainData() then
  begin
    if StrToInt(edMatrixLines.Text) < sgMatrixElements.RowCount then
    begin
      for i := StrToInt(edMatrixLines.Text) to sgMatrixElements.RowCount - 1 do
        for j := 0 to sgMatrixElements.ColCount - 1 do
          sgMatrixElements.Cells[j, i] := ''
    end;
    sgMatrixElements.RowCount := StrToInt(edMatrixLines.Text);

    if StrToInt(edMatrixColumns.Text) < sgMatrixElements.ColCount then
    begin
      for i := 0 to sgMatrixElements.RowCount - 1 do
        for j := StrToInt(edMatrixColumns.Text) to sgMatrixElements.ColCount - 1 do
          sgMatrixElements.Cells[j, i] := ''
    end;
    sgMatrixElements.ColCount := StrToInt(edMatrixColumns.Text);
  end;
end;

procedure TEditMatrixForm.TryGetMatrix(var AEditingMatrix: TMatrix;
  const AisNewMatrix: Boolean = True);
var
  i, j: Integer;
begin
  if AisNewMatrix then
  begin
    edMatrixName.Text := '';
    edMatrixLines.Text := '';
    edMatrixColumns.Text := '';

    for i := 0 to sgMatrixElements.RowCount - 1 do
      for j := 0 to sgMatrixElements.ColCount - 1 do
        sgMatrixElements.Cells[i, j] := '';

    sgMatrixElements.RowCount := 1;
    sgMatrixElements.ColCount := 1;
  end
  else
  begin
    edMatrixName.Text := AEditingMatrix.Name;
    edMatrixLines.Text := IntToStr(AEditingMatrix.Lines);
    edMatrixColumns.Text := IntToStr(AEditingMatrix.Columns);

    sgMatrixElements.RowCount := StrToInt(edMatrixLines.Text);
    sgMatrixElements.ColCount := StrToInt(edMatrixColumns.Text);

    for i := 0 to sgMatrixElements.RowCount - 1 do
      for j := 0 to sgMatrixElements.ColCount - 1 do
        sgMatrixElements.Cells[i, j] :=
          FloatToStr(AEditingMatrix.Elements[i, j]);
  end;

  ShowModal;

  if ModalResult = mrOK then
  begin
    AEditingMatrix := TMatrix.Create(edMatrixName.Text,
      StrToInt(edMatrixLines.Text), StrToInt(edMatrixColumns.Text));
    for i := 0 to AEditingMatrix.Lines - 1 do
      for j := 0 to AEditingMatrix.Columns - 1 do
        AEditingMatrix.Elements[i, j] :=
          StrToFloat(sgMatrixElements.Cells[i, j]);
  end
  else
    if AisNewMatrix then
      AEditingMatrix := nil;
end;

end.
