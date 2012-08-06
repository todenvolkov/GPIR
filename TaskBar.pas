unit TaskBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TTaskBarForm = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TaskBarForm: TTaskBarForm;

implementation

uses Main;
{$R *.dfm}

procedure TTaskBarForm.FormCreate(Sender: TObject);
begin
  Top := { GetSize.X; } MainForm.Height + 5;
  Left := 5;
  Height := GetSize.Y - Top - 100;
end;

end.
