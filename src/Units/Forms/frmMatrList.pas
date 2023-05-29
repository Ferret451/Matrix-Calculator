unit frmMatrList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ExtCtrls,
  clsMatrixList, clsMatrix, clsDataManager, untConstants, frmEditMatr, untPainting,
  untStatistics;

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
    procedure sbMatrixListMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure aSortListZtoAExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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
  end;

var
  MatrixListForm: TMatrixListForm;

implementation

{$R *.dfm}

destructor TMatrixListForm.Destroy();
begin
  // Clearing memory
  SetLength(FMatrixesBorders, 0);

  inherited;
end;

procedure TMatrixListForm.FormCreate(Sender: TObject);
begin
  //Making min size for form
  Self.Constraints.MinWidth := MinListFormWidth;
  Self.Constraints.MinHeight := MinListFormHeight;
end;

procedure TMatrixListForm.FormShow(Sender: TObject);
begin
  // Placing form in the middle of the screen
  Left:= (Screen.Width - Width) shr 1;
  Top:= (Screen.Height - Width) shr 1;
end;

procedure TMatrixListForm.aClearListExecute(Sender: TObject);
var
  Answer: Integer;
begin
  // Checking if the list is fulled with something
  if DataManager.MatrixList.Size > 0 then
  begin
    // Showing message to confirm deleting
    Answer := MessageDlg(msMatrListDelete, mtInformation, [mbOK, mbCancel], 0);

    // Deleting list if ok pressed
    if Answer = mrOK then
    begin
      SetLength(FMatrixesBorders, 0);
      DataManager.MatrixList.Clear();
      DataManager.CallBack(pbMatrixList)
    end;
  end;
end;

procedure TMatrixListForm.aNewMatrixExecute(Sender: TObject);
var
  EditingMatrix: TMatrix<Extended>;
begin
  // Getting new matrix if it was created
  EditMatrixForm.TryGetMatrix(EditingMatrix);

  // Cheking that matrix was created
  if Assigned(EditingMatrix) then
  begin
    // Adding new matrix to the list
    DataManager.MatrixList.Add(EditingMatrix);
    DataManager.CallBack(pbMatrixList);
  end;
end;

procedure TMatrixListForm.pbMatrixListDblClick(Sender: TObject);
var
  i: Integer;
  EditingMatrix: TMatrix<Extended>;
begin
  // Cheking if the click was inside one of the matrixes
  for i := Low(FMatrixesBorders) to High(FMatrixesBorders) do
    if (FCursorPos.FX >= FMatrixesBorders[i].FLeft) and
      (FCursorPos.FX <= FMatrixesBorders[i].FRight) and
      (FCursorPos.FY >= FMatrixesBorders[i].FTop) and
      (FCursorPos.FY <= FMatrixesBorders[i].FBottom) then
    begin
      // Getting matrix from list
      EditingMatrix := DataManager.MatrixList.GetValue(i);

      // Getting edited or not matrix
      EditMatrixForm.TryGetMatrix(EditingMatrix, False);

      // Setting edited matrix to the list
      DataManager.MatrixList.SetValue(i, EditingMatrix);

      DataManager.CallBack(pbMatrixList);
    end;
end;

// Updating cursor position
procedure TMatrixListForm.pbMatrixListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FCursorPos.FX := X;
  FCursorPos.FY := Y;
end;

// Sorting in ascending order
procedure TMatrixListForm.aSortListAtoZExecute(Sender: TObject);
begin
  DataManager.MatrixList.Sort(Ascending);
  DataManager.CallBack(pbMatrixList);
end;

// Sorting in descending order
procedure TMatrixListForm.aSortListZtoAExecute(Sender: TObject);
begin
  DataManager.MatrixList.Sort(Descending);
  DataManager.CallBack(pbMatrixList);
end;

procedure TMatrixListForm.pbMatrixListPaint(Sender: TObject);
var
  CurrNode: TMatrixList<Extended>.PNode;
  X, Y, CurrMatrixPosX, CurrMatrixPosY, CurrMatrixHeight, MaxMatrixWidth: Integer;
begin
  // Setting start pos
  CurrMatrixPosX := StartPosX;
  CurrMatrixPosY := StartPosY;

  // Updeting matrixes borders
  SetLength(FMatrixesBorders, DataManager.MatrixList.Size);

  // Assigning starting values
  MaxMatrixWidth := 0;
  CurrNode := DataManager.MatrixList.Head;
  while Assigned(CurrNode) do
  begin
    // Setting x and y for current matrix
    X := CurrMatrixPosX;
    Y := CurrMatrixPosY;

    // Remembering top and left coords of current matrix
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FLeft := X;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FTop := Y;

    // Getting height of current matrix
    CurrMatrixHeight := GetMatrixHeight(CurrNode^.FValue, Sender);

    // Printing name with equals before the matrix
    Y := Y + LineInterval;
    MidMatrixTextPrint(X, Y, CurrMatrixHeight, CurrNode^.FValue.Name +
      ' = ', Sender);

    // Printing matrix elements with brace outline
    Y := CurrMatrixPosY;
    MatrixPaint(X, Y, CurrNode^.FValue, BraceOutline, Sender);

    // Setting value to bottom right pos of current matrix and remembering it
    X := X + 2 * ColumnInterval;
    Y := Y + 2 * LineInterval;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FRight := X;
    FMatrixesBorders[Length(FMatrixesBorders) - 1].FBottom := Y;

    // Setting pos for next matrix
    CurrMatrixPosY := Y + LineInterval;

    // Remembering width for dynamic extension of paint box
    if X > MaxMatrixWidth then
      MaxMatrixWidth := X;

    CurrNode := CurrNode^.FNext;
  end;

  // Dynamic extension of paint box
  pbMatrixList.Height := CurrMatrixPosY;
  pbMatrixList.Width := MaxMatrixWidth + ColumnInterval;
end;

procedure TMatrixListForm.sbMatrixListMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  // Check if Shift key is pressed
  if ssShift in Shift then
  begin
    // Scroll horizontally based on the WheelDelta value
    if WheelDelta > 0 then
      sbMatrixList.HorzScrollBar.Position := sbMatrixList.HorzScrollBar.Position - ScrollStep
    else
      sbMatrixList.HorzScrollBar.Position := sbMatrixList.HorzScrollBar.Position + ScrollStep;
  end
  else
  begin
    // Scroll vertically based on the WheelDelta value
    if WheelDelta > 0 then
      sbMatrixList.VertScrollBar.Position := sbMatrixList.VertScrollBar.Position - ScrollStep
    else
      sbMatrixList.VertScrollBar.Position := sbMatrixList.VertScrollBar.Position + ScrollStep;
  end;
end;

end.
