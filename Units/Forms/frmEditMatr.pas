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
    procedure edMatrixNameExit(Sender: TObject);
    procedure edMatrixLinesExit(Sender: TObject);
    procedure edMatrixColumnsExit(Sender: TObject);
    procedure sgMatrixElementsEnter(Sender: TObject);
  private
    function isCorrectName(): Boolean;
    function isCorrectLinesAmount(): Boolean;
    function isCorrectColumnsAmount(): Boolean;
    function isCorrectMatrixElements(): Boolean;
    procedure sgMatrixElementsClear(Sender: TObject);
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

procedure TEditMatrixForm.edMatrixColumnsExit(Sender: TObject);
begin
  if not isCorrectColumnsAmount then
  begin
    ShowMessage('Entered amount of columns is incorrect');
    edMatrixColumns.SetFocus;
  end;
end;

procedure TEditMatrixForm.edMatrixLinesExit(Sender: TObject);
begin
  if not isCorrectLinesAmount then
  begin
    ShowMessage('Entered amount of lines is incorrect');
    edMatrixLines.SetFocus;
  end;
end;

procedure TEditMatrixForm.edMatrixNameExit(Sender: TObject);
begin
  if not isCorrectName then
  begin
    ShowMessage('Entered name is incorrect');
    edMatrixName.SetFocus;
  end;
end;

procedure TEditMatrixForm.butOKClick(Sender: TObject);
begin
  if isCorrectName() and isCorrectLinesAmount() and isCorrectcolumnsAmount() and isCorrectMatrixElements() then
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

  while (i < StrToInt(edMatrixLines.Text)) and (isCorrectElements) do
  begin
    j := 0;

    while (j < StrToInt(edMatrixColumns.Text)) and (isCorrectElements) do
    begin
      if not TryStrToFloat(sgMatrixElements.Cells[j, i], TempValue) then
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

function TEditMatrixForm.isCorrectName(): Boolean;
var
  i: Integer;
begin
  Result := True;

  if length(edMatrixName.Text) >= 1 then
  begin
    if not (edMatrixName.Text[1] in MatrixNameFirstElValidSymbols) then
      Result := False
  end
  else
    Result := False;

  if Result then
  begin
    i := 2;
    while (i <= length(edMatrixName.Text)) and (Result = true) do
    begin
      if not (edMatrixName.Text[i] in MatrixNameValidSymbols) then
        Result := False;
      inc(i);
    end;
  end;
end;

function TEditMatrixForm.isCorrectLinesAmount(): Boolean;
var
  TempValue: Integer;
begin
  Result := True;

  Result := TryStrToInt(edMatrixLines.Text, TempValue);

  if Result then
  begin
    TempValue := StrToInt(edMatrixLines.Text);
    if TempValue <= 0 then
      Result := False;
  end;
end;

function TEditMatrixForm.isCorrectColumnsAmount(): Boolean;
var
  TempValue: Integer;
begin
  Result := True;

  Result := TryStrToInt(edMatrixColumns.Text, TempValue);

  if Result then
  begin
    TempValue := StrToInt(edMatrixColumns.Text);
    if TempValue <= 0 then
      Result := False;
  end;
end;

procedure TEditMatrixForm.sgMatrixElementsEnter(Sender: TObject);
var
  i, j: Integer;
begin
  if isCorrectName and isCorrectLinesAmount and isCorrectColumnsAmount then
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

procedure TEditMatrixForm.sgMatrixElementsClear(Sender: TObject);
var
  i, j: Integer;
begin
  for i := 0 to sgMatrixElements.RowCount - 1 do
    for j := 0 to sgMatrixElements.ColCount - 1 do
      TStringGrid(Sender).Cells[j, i] := '';
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

    sgMatrixElementsClear(sgMatrixElements);

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
          StrToFloat(sgMatrixElements.Cells[j, i]);
  end
  else
    if AisNewMatrix then
      AEditingMatrix := nil;
end;

end.