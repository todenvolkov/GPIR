unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, routines, GIFImg;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Progress: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    PageControl: TPageControl;
    DomainTab: TTabSheet;
    OtherTab: TTabSheet;
    Login: TEdit;
    Password: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    StatusLabel: TLabel;
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
    procedure Label2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowLoad;
  end;

var
  SplashForm: TSplashForm;
  MayClose: Boolean;

implementation

uses Main;
{$R *.dfm}



procedure TSplashForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MayClose;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
const
  cnMaxUserNameLen = 254;
var
  sUserName: string;
  dwUserNameLen: DWORD;
begin
  dwUserNameLen := cnMaxUserNameLen - 1;
  SetLength(sUserName, cnMaxUserNameLen);
  GetUserName(PChar(sUserName), dwUserNameLen);
  SetLength(sUserName, dwUserNameLen);
  Label3.Caption := sUserName;
  Label1.Caption:= 'Версия: ' + FileVersion(Application.ExeName);
  MainForm.WindowsAccount := sUserName;
  //ShowLoad;
end;

procedure TSplashForm.ShowLoad;
begin
  GIFImageDefaultAnimate := True;
  GIFImageDefaultTransparent := True;
  Image1.Picture.LoadFromFile('c:\loading\loading1.gif');
end;



procedure TSplashForm.Label2Click(Sender: TObject);
begin
  MainForm.Login := Login.Text;
  MainForm.Password := Password.Text;

  if PageControl.ActivePage = DomainTab then
    begin

      MainForm.LoginTrue(True)
    end else
    begin

      MainForm.LoginTrue(False);

    end;
end;

procedure TSplashForm.Label2MouseEnter(Sender: TObject);
begin
//  SplashForm.Label2Click(SplashForm.Label2);
end;

procedure TSplashForm.Label4Click(Sender: TObject);
begin
  if PageControl.ActivePage = DomainTab then
    begin
      PageControl.ActivePage := OtherTab;
      Login.SetFocus;
      TLabel(Sender).Caption := 'Назад';
    end else
    begin
      PageControl.ActivePage := DomainTab;
      TLabel(Sender).Caption := 'Это не я';
    end;
end;

procedure TSplashForm.Label5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TSplashForm.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      MainForm.Login := Login.Text;
      MainForm.Password := Password.Text;
      if PageControl.ActivePage = DomainTab then MainForm.LoginTrue(True)
        else MainForm.LoginTrue(False);
    end;
end;

procedure TSplashForm.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      MainForm.Login := Login.Text;
      MainForm.Password := Password.Text;
      if PageControl.ActivePage = DomainTab then MainForm.LoginTrue(True)
        else MainForm.LoginTrue(False);
    end;
end;

end.
