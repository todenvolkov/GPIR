unit Sessions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxDropDownEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  cxGrid, Main, ExtCtrls, ADODB, Menus, StdCtrls, cxButtons;

type
  TSessionsForm = class(TForm)
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1UserName: TcxGridDBColumn;
    cxGridDBTableView1GroupName: TcxGridDBColumn;
    cxGridDBTableView1CalcType: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TimerSessionActivityList: TTimer;
    QuerySessionActivity: TADOQuery;
    SessionActivityDS: TDataSource;
    cxGridDBTableView1UserID: TcxGridDBColumn;
    ExModeBtn: TcxButton;
    ExModeName: TLabel;
    MessageBtn: TcxButton;
    procedure TimerSessionActivityListTimer(Sender: TObject);
    procedure ExModeBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MessageBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SessionsForm: TSessionsForm;
  function ShowSessions(Options: CreateOptionsGlobal): integer;

implementation

{$R *.dfm}

function ShowSessions(Options: CreateOptionsGlobal): integer;
begin
  Result := -1;
  try
    Application.CreateForm(TSessionsForm, SessionsForm);
    SessionsForm.Caption := Options.FormCaption;
    SessionsForm.Show;
    Result := 1;
  except
    SessionsForm.Free;
    SessionsForm := nil;
  end;
end;

procedure TSessionsForm.ExModeBtnClick(Sender: TObject);
begin
  try
    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec ExclusiveModeSet :UserID, :Mode';
    MainForm.Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
    if ExModeBtn.Down then MainForm.Query.Parameters.ParamByName('Mode').Value := 1
                      else MainForm.Query.Parameters.ParamByName('Mode').Value := 0;
    MainForm.Query.ExecSQL;

    if ExModeBtn.Down then   //снимаем уведомление пользователей о том что нужно закрыть программу
      begin
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec CloseRequestSet :UserID, :Request';
        MainForm.Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
        MainForm.Query.Parameters.ParamByName('Request').Value := 0;
        MainForm.Query.ExecSQL;
      end;

    if ExModeBtn.Down then
      begin
        MainForm.ExclusiveMode := True;
        ExModeName.Caption := 'Включен';
      end else
      begin
        MainForm.ExclusiveMode := False;
        ExModeName.Caption := 'Выключен';
      end;
  except
  end;
end;

procedure TSessionsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TSessionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TSessionsForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  if MainForm.ExclusiveMode then
    begin
      ExModeBtn.Down := True;
      ExModeName.Caption := 'Включен';
    end else
    begin
      ExModeBtn.Down := False;
      ExModeName.Caption := 'Выключен';
    end;
end;

procedure TSessionsForm.MessageBtnClick(Sender: TObject);
begin
  try
    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec CloseRequestSet :UserID, :Mode';
    MainForm.Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
    MainForm.Query.Parameters.ParamByName('Mode').Value := 1;
    MainForm.Query.ExecSQL;
  except
  end;
end;

procedure TSessionsForm.TimerSessionActivityListTimer(Sender: TObject);
begin
  try
    QuerySessionActivity.Close;
    QuerySessionActivity.SQL.Text := 'exec SessionsListShow';
    QuerySessionActivity.Open;
    if QuerySessionActivity.RecordCount = 1 then
      begin
        ExModeBtn.Enabled := True;
        MessageBtn.Enabled := False;
      end else
          begin
            ExModeBtn.Enabled := False;
            MessageBtn.Enabled := True;
          end;

  except
  end;

end;

end.
