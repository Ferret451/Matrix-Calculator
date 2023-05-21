unit frmHTML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  THTMLForm = class(TForm)
    wbHTML: TWebBrowser;
  private
  public
    procedure Execute(AName: WideString);
  end;

var
  HTMLForm: THTMLForm;

implementation

{$R *.dfm}

procedure THTMLForm.Execute(AName: WideString);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  Caption := AName;

  wbHTML.Navigate('res://' + Application.ExeName + '/' + AName,
                       Flags, TargetFrameName, PostData, Headers);
  ShowModal;
end;

end.
