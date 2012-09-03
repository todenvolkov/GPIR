unit Roles;

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
  cxCurrencyEdit, cxSplitter, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, ExtCtrls, ADODB, Menus, StdCtrls, cxButtons;

type
  TRolesForm = class(TForm)
    RolesQ: TADOQuery;
    RolesDS: TDataSource;
    TrueActionsQ: TADOQuery;
    TrueActionsDS: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    LeftSplitter: TcxSplitter;
    Panel1: TPanel;
    UpAll: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1RoleName: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    FalseActionsQ: TADOQuery;
    FalseActionDS: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    DownAll: TcxButton;
    UpBtn: TcxButton;
    DownBtn: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView2EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView2FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure UpAllClick(Sender: TObject);
    procedure DownAllClick(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;
    procedure RefreshPermList;
  end;

var
  RolesForm: TRolesForm;

implementation
 uses Main, routines, SQLRoutines1;
{$R *.dfm}

procedure TRolesForm.cxGridDBTableView2EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGridDBTableView2.Controller.FocusedColumnIndex = cxGridDBTableView2.VisibleColumnCount-1) then
    begin
      if (RolesQ.State = dsEdit) or (RolesQ.State = dsInsert) then
        begin
          RolesQ.Post;
        end;
    end;
end;

procedure TRolesForm.cxGridDBTableView2FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  try
    if RolesQ.Active then
      begin
        RefreshPermList;
      end;
  except
  end;
end;

procedure TRolesForm.DownAllClick(Sender: TObject);
begin
  try
    if RolesQ.Active then
      begin
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := ' exec RolesPermissionsNone :RoleID';
        MainForm.Query.Parameters.ParamByName('RoleID').Value := RolesQ.FieldByName('ID').AsInteger;
        MainForm.Query.ExecSQL;
        RefreshPermList;
      end;
  except
  end;
end;

procedure TRolesForm.DownBtnClick(Sender: TObject);
begin
  try
    if RolesQ.Active then
      begin
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := ' exec RolesPermissionsDelete :RoleID, :ActionGUID';
        MainForm.Query.Parameters.ParamByName('RoleID').Value := RolesQ.FieldByName('ID').AsInteger;
        MainForm.Query.Parameters.ParamByName('ActionGUID').Value := TrueActionsQ.FieldByName('GUID').AsVariant;
        MainForm.Query.ExecSQL;
        RefreshPermList;
      end;
  except
  end;
end;

procedure TRolesForm.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TRolesForm.RefreshData;
begin
  try
    OpenQ(RolesQ, 'exec RolesShow', False);
  except
  end;
end;

procedure TRolesForm.RefreshPermList;
begin
  OpenParamsQ(TrueActionsQ, 'exec RolesShowTrue :RoleID', [RolesQ.FieldByName('ID').AsInteger]);
  OpenParamsQ(FalseActionsQ, 'exec RolesShowFalse :RoleID', [RolesQ.FieldByName('ID').AsInteger]);

  cxGrid1DBTableView1Column2.Caption := 'Разрешено ' + IntToStr(TrueActionsQ.RecordCount);
  cxGridDBTableView1Column2.Caption := 'Запрещено ' + IntToStr(FalseActionsQ.RecordCount);
end;

procedure TRolesForm.UpAllClick(Sender: TObject);
begin
  try
    if RolesQ.Active then
      begin
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := ' exec RolesPermissionsAll :RoleID';
        MainForm.Query.Parameters.ParamByName('RoleID').Value := RolesQ.FieldByName('ID').AsInteger;
        MainForm.Query.ExecSQL;
        RefreshPermList;
      end;
  except
  end;
end;

procedure TRolesForm.UpBtnClick(Sender: TObject);
begin
  try
    if RolesQ.Active then
      begin
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := ' exec RolesPermissionsAdd :RoleID, :ActionGUID';
        MainForm.Query.Parameters.ParamByName('RoleID').Value := RolesQ.FieldByName('ID').AsInteger;
        MainForm.Query.Parameters.ParamByName('ActionGUID').Value := FalseActionsQ.FieldByName('GUID').AsVariant;
        MainForm.Query.ExecSQL;
        RefreshPermList;
      end;
  except
  end;
end;

end.
