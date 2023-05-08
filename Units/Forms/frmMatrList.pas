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


  private

  public
    constructor Create(AOwner: TComponent);
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

  if EditingMatrix <> nil then
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
end;


procedure TMatrixListForm.pbMatrixListPaint(Sender: TObject);
var
  CurrNode: TMatrixList.PNode;
  CurrMatrixPosX, CurrMatrixPosY: Integer;
begin
  pbMatrixList.Canvas.Font.Name := DefaultFontName;
  pbMatrixList.Canvas.Font.Size := DefaultFontSize;

  CurrMatrixPosX := 10;
  CurrMatrixPosY := 10;
  CurrNode := DataManager.MatrixList.Head;

  while CurrNode <> nil do
  begin
    pbMatrixList.Canvas.TextOut(CurrMatrixPosX, CurrMatrixPosY, '������ ������');

    CurrMatrixPosY := CurrMatrixPosY + 14;
    CurrNode := CurrNode^.FNext;
  end;
end;

end.
