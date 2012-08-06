unit ArticleToBudgetExt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsdxStatusBarPainter, Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ImageButton, ExtCtrls, dxStatusBar, ADODB, dxPSCore,
  dxPScxCommon, cxCustomPivotGrid, cxDBPivotGrid, cxExportPivotGridLink, ShellAPI, dxPScxPivotGridLnk, cxContainer,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TArticleToBudgetExtForm = class(TForm)
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    Work1DS: TDataSource;
    Work1Q: TADOQuery;
    WorkDS: TDataSource;
    WorkQ: TADOQuery;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    BudgetPanel: TPanel;
    BudgetAll: TcxButton;
    BudgetOISI: TcxButton;
    BudgetNIO: TcxButton;
    BudgetPro: TcxButton;
    BudgetOAN: TcxButton;
    OrgFlowBtn: TcxButton;
    Panel2: TPanel;
    Panel5: TPanel;
    cxDBPivotGrid1: TcxDBPivotGrid;
    cxDBPivotGrid1Field1: TcxDBPivotGridField;
    cxDBPivotGrid1Field2: TcxDBPivotGridField;
    cxDBPivotGrid1Field3: TcxDBPivotGridField;
    cxDBPivotGrid1Field4: TcxDBPivotGridField;
    cxDBPivotGrid1Field5: TcxDBPivotGridField;
    cxDBPivotGrid1Field6: TcxDBPivotGridField;
    cxDBPivotGrid1Field7: TcxDBPivotGridField;
    cxDBPivotGrid1Field8: TcxDBPivotGridField;
    cxLabel1: TcxLabel;
    BudgetsQ: TADOQuery;
    BudgetsDS: TDataSource;
    cxLookupComboBox1: TcxLookupComboBox;
    Work2Q: TADOQuery;
    cxDBPivotGrid1Field9: TcxDBPivotGridField;
    Work3Q: TADOQuery;
    procedure BudgetAllClick(Sender: TObject);
    procedure BudgetOISIClick(Sender: TObject);
    procedure BudgetNIOClick(Sender: TObject);
    procedure BudgetProClick(Sender: TObject);
    procedure BudgetOANClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBPivotGrid1CustomDrawCell(Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
      AViewInfo: TcxPivotGridDataCellViewInfo; var ADone: Boolean);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ShowPlanData(Button: TcxButton);
    procedure ComboAction;
  public
    { Public declarations }
    BudgetGUID: Variant;
    ButtonDownName: string;
  end;

var
  ArticleToBudgetExtForm: TArticleToBudgetExtForm;

  APivotGridReportLink: TBasedxReportLink;
function ShowArticleToBudgetExt(Options: CreateOptionsGlobal): Integer;

implementation
    uses  routines, TreeUnit;
{$R *.dfm}

function ShowArticleToBudgetExt(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TArticleToBudgetExtForm, ArticleToBudgetExtForm);
    ArticleToBudgetExtForm.Caption := Options.FormCaption;
    ArticleToBudgetExtForm.BudgetGUID := Options.BudgetGUID;
    ArticleToBudgetExtForm.Show;
    Result := 1;
  except
    ArticleToBudgetExtForm.Free;
    ArticleToBudgetExtForm := nil;
  end;
end;

procedure TArticleToBudgetExtForm.BudgetAllClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TArticleToBudgetExtForm.BudgetNIOClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TArticleToBudgetExtForm.BudgetOANClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TArticleToBudgetExtForm.BudgetOISIClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TArticleToBudgetExtForm.BudgetProClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TArticleToBudgetExtForm.cxDBPivotGrid1CustomDrawCell(Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridDataCellViewInfo; var ADone: Boolean);
begin
//  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1.GetColumnByFieldName('BudgetArticleNumber').Index] = '110') or
//     (AViewInfo.GridRecord.Values[cxGrid1DBTableView1.GetColumnByFieldName('BudgetArticleNumber').Index] = '370') then
//    begin
//      ACanvas.Brush.Color := 9500108;
//      ACanvas.Font.Style := [fsBold];
//    end;
//
//  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1.GetColumnByFieldName('BudgetArticleNumber').Index] = '380')then
//    begin
//      ACanvas.Brush.Color := 15579641;
//      ACanvas.Font.Style := [fsBold];
//    end;
//
//  if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1.GetColumnByFieldName('BudgetArticleNumber').Index] = '400') then
//    begin
//      ACanvas.Brush.Color := 4049657;
//      ACanvas.Font.Style := [fsBold];
//    end;

//  if AViewInfo. then
//    begin
//      ACanvas.Brush.Color := 9500108;
//      ACanvas.Font.Style := [fsBold];
//    end;
//
//  ACanvas.FillRect(AViewInfo.Bounds);
end;

procedure TArticleToBudgetExtForm.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
  ComboAction;
end;

procedure TArticleToBudgetExtForm.ComboAction;
begin
  if not VarIsNull(cxLookupComboBox1.EditValue) then
    begin
      WorkQ.Close;
      WorkQ.SQL.Text := 'exec BudgetCalcCompare :CalcType, :BudgetGUID, :BudgetGUID1';
      WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
      WorkQ.Parameters.ParamByName('BudgetGUID1').Value := BudgetsQ.FieldByName('GUID').AsVariant;
      WorkQ.Parameters.ParamByName('CalcType').Value := ButtonDownName;
      WorkQ.Open;

      cxDBPivotGrid1Field7.Visible := True;
      cxDBPivotGrid1Field8.Visible := True;
      cxDBPivotGrid1Field7.Caption := BudgetsQ.FieldByName('BudgetNameMod').AsString + '[план]';
      cxDBPivotGrid1Field8.Caption := BudgetsQ.FieldByName('BudgetNameMod').AsString + '[факт]';
    end else
        begin
          cxDBPivotGrid1Field7.Visible := False;
          cxDBPivotGrid1Field8.Visible := False;
        end;
end;

procedure TArticleToBudgetExtForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TArticleToBudgetExtForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TArticleToBudgetExtForm.FormCreate(Sender: TObject);

begin
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
end;

procedure TArticleToBudgetExtForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  BudgetsQ.Close;
  BudgetsQ.SQL.Text := 'exec BudgetsShowWithoutSelf :BudgetGUID';
  BudgetsQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
  BudgetsQ.Open;

  BudgetAll.Click;
  BudgetAll.SetFocus;
end;

procedure TArticleToBudgetExtForm.ImageButton1Click(Sender: TObject);
var filename: string;
begin
  FileName := RndFileName;
  FileName := filename + '_' + FormatDateTime('dd-mm-yyyy-hh-nn-ss',now);
  cxExportPivotGridToExcel(filename,cxDBPivotGrid1,true,true,'xls');
//   ShellExecute(Handle,
//                  'OPEN',
//                  PChar('explorer.exe'),
//                  PChar('/select, "' + GetCurrentDir+'\'+FileName+'.xls'+ '"'),
//                  nil,
//                  SW_NORMAL) ;

end;

procedure TArticleToBudgetExtForm.ImageButton4Click(Sender: TObject);
begin
//  dxComponentPrinter1Link1.Preview(true);
  APivotGridReportLink := dxComponentPrinter1.AddLink(cxDBPivotGrid1);
  dxComponentPrinter1.Preview(True, APivotGridReportLink);
end;

procedure TArticleToBudgetExtForm.ShowPlanData(Button: TcxButton);
begin
    ButtonDownName := Button.Hint;

  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec BudgetCalcCompare :CalcType, :BudgetGUID, :BudgetGUID1';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    WorkQ.Parameters.ParamByName('BudgetGUID1').Value := BudgetsQ.FieldByName('GUID').AsVariant;
    WorkQ.Parameters.ParamByName('CalcType').Value := Button.Hint;
    WorkQ.Open;

    dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + '0' + '%';
    dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + '0' + 'р.';
    dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: 0р.';
    if WorkQ.RecordCount = 0 then Exit;
    
    Work1Q.Close;
    Work1Q.SQL.Text := 'exec ArticleToBudgetExtPartShow :BudgetGUID';
    Work1Q.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    Work1Q.Open;

    Work2Q.Close;
    Work2Q.SQL.Text := 'exec ArticleToBudgetExtRevenueShow :BudgetGUID';
    Work2Q.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    Work2Q.Open;

    Work3Q.Close;
    Work3Q.SQL.Text := 'exec ArticleToBudgetExtFinancialShow :BudgetGUID';
    Work3Q.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    Work3Q.Open;

    if ButtonDownName = 'Все бюджеты' then
      begin
        Work1Q.Locate('CalcType', ButtonDownName, []);
        Work3Q.Locate('CalcType', ButtonDownName, []);
        dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + Work1Q.FieldByName('CalcValue').AsString + '%';
        dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + Work2Q.FieldByName('BudgetAll').AsString + 'р.';
        dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: ' + Work3Q.FieldByName('CalcValue').AsString + 'р.';
      end;

    if ButtonDownName = 'Бюджет ОИСИ' then
      begin
        Work1Q.Locate('CalcType', ButtonDownName, []);
        Work3Q.Locate('CalcType', ButtonDownName, []);
        dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + Work1Q.FieldByName('CalcValue').AsString + '%';
        dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + Work2Q.FieldByName('BudgetOISI').AsString + 'р.';
        dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: ' + Work3Q.FieldByName('CalcValue').AsString + 'р.';
      end;

    if ButtonDownName = 'Бюджет НИО' then
      begin
        Work1Q.Locate('CalcType', ButtonDownName, []);
        Work3Q.Locate('CalcType', ButtonDownName, []);
        dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + Work1Q.FieldByName('CalcValue').AsString + '%';
        dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + Work2Q.FieldByName('BudgetNIO').AsString + 'р.';
        dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: ' + Work3Q.FieldByName('CalcValue').AsString + 'р.';
      end;

    if ButtonDownName = 'Бюджет Проектировщики' then
      begin
        Work1Q.Locate('CalcType', ButtonDownName, []);
        Work3Q.Locate('CalcType', ButtonDownName, []);
        dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + Work1Q.FieldByName('CalcValue').AsString + '%';
        dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + Work2Q.FieldByName('BudgetPro').AsString + 'р.';
        dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: ' + Work3Q.FieldByName('CalcValue').AsString + 'р.';
      end;

    if ButtonDownName = 'Бюджет ОАН' then
      begin
        Work1Q.Locate('CalcType', ButtonDownName, []);
        Work3Q.Locate('CalcType', ButtonDownName, []);
        dxStatusBar1.Panels.Items[0].Text := 'Рентабельность: ' + Work1Q.FieldByName('CalcValue').AsString + '%';
        dxStatusBar1.Panels.Items[1].Text := 'Выручка: ' + Work2Q.FieldByName('BudgetOAN').AsString + 'р.';
        dxStatusBar1.Panels.Items[2].Text := 'Финансовый результат: ' + Work3Q.FieldByName('CalcValue').AsString + 'р.';
      end;

  except
  end;
end;

end.
