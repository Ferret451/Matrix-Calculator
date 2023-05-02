unit fMatrList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ExtCtrls,
  ClMatrixList,
  CLMatrix,
  Constants,
  fEditMatr;

type
  TfMatrixList = class(TForm)
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
    { Private declarations }
    FListOfMatrixes: TMatrixList;

  public
    { Public declarations }

    constructor Create(AOwner: TComponent);
  end;

var
  fMatrixList: TfMatrixList;

implementation

{$R *.dfm}



procedure TfMatrixList.aClearListExecute(Sender: TObject);
begin
//
end;

procedure TfMatrixList.aEditMatrixExecute(Sender: TObject);
var
  EditingMatrix: TMatrix;
begin
  EditingMatrix := fNewMatrix.TryGetMatrix();

  if EditingMatrix <> nil then
  begin
    FListOfMatrixes.Add(EditingMatrix);
    pbMatrixListPaint(pbMatrixList);
  end;
end;

procedure TfMatrixList.aSortListAtoZExecute(Sender: TObject);
begin
//
end;

constructor TfMatrixList.Create(AOwner: TComponent);
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

  FListOfMatrixes := TMatrixList.Create();
end;

procedure TfMatrixList.pbMatrixListPaint(Sender: TObject);
var
  CurrNode: TMatrixList.PNode;
  CurrMatrixPosX, CurrMatrixPosY: Integer;
begin
  pbMatrixList.Canvas.Font.Name := DefaultFontName;
  pbMatrixList.Canvas.Font.Size := DefaultFontSize;

  CurrMatrixPosX := 10;
  CurrMatrixPosY := 10;
  CurrNode := FListOfMatrixes.Head;

  while CurrNode <> nil do
  begin
    pbMatrixList.Canvas.TextOut(CurrMatrixPosX, CurrMatrixPosY, '������ ������');

    CurrMatrixPosY := CurrMatrixPosY + 14;
    CurrNode := CurrNode^.FNext;
  end;

end;

end.
