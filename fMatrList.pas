unit fMatrList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  ClMatrixList,
  fNewMatr;

type
  TfMatrixList = class(TForm)
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
    procedure aNewMatrixExecute(Sender: TObject);
    procedure aSortListAtoZExecute(Sender: TObject);
    procedure aClearListExecute(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }

    constructor Create(AOwner: TComponent);
  end;

//var
  //fMatrixList: TfMatrixList;

implementation

{$R *.dfm}

procedure TfMatrixList.aClearListExecute(Sender: TObject);
begin
//
end;

procedure TfMatrixList.aNewMatrixExecute(Sender: TObject);
begin
  fNewMatrix := TfNewMatrix.Create(Self);
  fNewMatrix.ShowModal;

  {if fNewMatrix.ModalResult = mrOk then
  begin
    Result:= True;
    AInitialStr:= Write�ase�onditions.Get�ase�onditions;
  end
  else
    Result:= False;
                             }
  fNewMatrix.Destroy;
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

  end;

end.
