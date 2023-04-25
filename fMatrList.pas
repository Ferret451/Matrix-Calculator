unit fMatrList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfMatrixList = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
  end;

var
  fMatrixList: TfMatrixList;

implementation

{$R *.dfm}

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
