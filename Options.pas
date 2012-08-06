unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, routines, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel, Menus, StdCtrls, cxButtons;

type
  TOptionsForm = class(TForm)
    Panel3: TPanel;
    SprValueHide: TcxLabel;
    SprHideValueCombo: TcxComboBox;
    Accept: TcxButton;
    CloseBtn: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure AcceptClick(Sender: TObject);
    procedure SprHideValueComboPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BudgetGUID: Variant;
    BudgetGUIDForSpr: Variant;
    procedure CheckOptions;
  end;

var
  OptionsForm: TOptionsForm;
  function ShowOptions(Options: CreateOptionsGlobal): Integer;

implementation

{$R *.dfm}

function ShowOptions(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TOptionsForm, OptionsForm);
    OptionsForm.Caption := Options.FormCaption;
    OptionsForm.BudgetGUID := Options.BudgetGUID;
    OptionsForm.BudgetGUIDForSpr := Options.BudgetGUIDForSpr;
    OptionsForm.Show;
    Result := 1;
  except
    OptionsForm.Free;
    OptionsForm := nil;
  end;
end;

procedure TOptionsForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TOptionsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  Sender := nil;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  CheckOptions;
end;

procedure TOptionsForm.SprHideValueComboPropertiesChange(Sender: TObject);
begin
  Accept.Enabled := True;
end;

procedure TOptionsForm.AcceptClick(Sender: TObject);
begin
  try

    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec OptionsSet :SystemName, :Value';
    MainForm.Query.Parameters.ParamByName('SystemName').Value := 'SprValueHide';
    MainForm.Query.Parameters.ParamByName('Value').Value := IntToStr(SprHideValueCombo.ItemIndex);
    MainForm.Query.ExecSQL;

    Accept.Enabled := False;
  except
    Accept.Enabled := False;
  end;
end;

procedure TOptionsForm.CheckOptions;
begin
  try
    Panel3.Visible := False;

    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec OptionsShow';
    MainForm.Query.Open;

    if MainForm.Query.RecordCount > 0 then
      begin
        MainForm.Query.Filter := 'SystemName = ' + #39 + 'SprValueHide' + #39;
        MainForm.Query.Filtered := True;
        SprValueHide.Caption := MainForm.Query.FieldByName('VisibleName').AsString;
        SprHideValueCombo.ItemIndex := MainForm.Query.FieldByName('Value').AsInteger;


        Panel3.Visible := True;
      end;

  except

  end;
end;

end.
