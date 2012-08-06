unit PlannedRentSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ADODB,
  dxLayoutContainer, dxLayoutControl, ImgList, cxPropertiesStore,
  dxSkinsdxStatusBarPainter, dxRibbonSkins, dxSkinsdxBarPainter, dxBar,
  dxRibbon, dxStatusBar, dxSkinsdxNavBarPainter, cxTL, cxTextEdit,
  cxTLdxBarBuiltInMenu, dxSkinsdxDockControlPainter, cxPC, dxDockControl,
  dxDockPanel, cxInplaceContainer, dxNavBarCollns, dxNavBarBase, dxNavBar,
  ToolWin, ActnMan, ActnCtrls, cxSplitter, ExtCtrls, Buttons, StdCtrls,
  cxContainer, Menus, cxButtons, cxSpinEdit, cxSpinButton, cxMaskEdit,
  cxButtonEdit, cxDBLookupComboBox, cxCurrencyEdit, cxVGrid, cxDBVGrid,
  Main, TreeUnit;
type
  RecordLights = record
    // структура для подсветки строки в таблице на insert/edit
    ErrorState: Boolean;
    ErrorControl: Boolean;
    RecordControlID: Integer;
  end;

type
  TPlannedRentSelectForm = class(TForm)
    WorkQ: TADOQuery;
    WorkDS: TDataSource;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BudgetArticlesDS: TDataSource;
    BudgetArticlesQ: TADOQuery;
    DepartmentDS: TDataSource;
    DepartmentQ: TADOQuery;
    UnitMeasureQ: TADOQuery;
    UnitMeasureDS: TDataSource;
    TypesWorkQ: TADOQuery;
    TypesWorkDS: TDataSource;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView1UnitMeasureGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1Counterpart: TcxGridDBColumn;
    cxGrid1DBTableView1ContractSubject: TcxGridDBColumn;
    cxGrid1DBTableView1TypeWorkGUID: TcxGridDBColumn;
    cxGrid1DBTableView1UnitCount: TcxGridDBColumn;
    cxGrid1DBTableView1Price: TcxGridDBColumn;
    cxGrid1DBTableView1Total: TcxGridDBColumn;
    StageQ: TADOQuery;
    StageDS: TDataSource;
    cxGrid1DBTableView1StageGUID: TcxGridDBColumn;
    btnAddRecord: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    btnIncreaseFont: TcxButton;
    btnDecreaseFont: TcxButton;
    btnColumnAutoWidth: TcxButton;
    btnWordWrap: TcxButton;
    QueryPreCalc: TADOQuery;
    BudgetsQ: TADOQuery;
    BudgetsDS: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1GUID: TcxGridDBColumn;
    cxGridDBTableView1NumbersContractsID: TcxGridDBColumn;
    cxGridDBTableView1Name: TcxGridDBColumn;
    cxGridDBTableView1BudgetName: TcxGridDBColumn;
    cxGridDBTableView1Version: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WorkQAfterPost(DataSet: TDataSet);
    procedure WorkQBeforePost(DataSet: TDataSet);
    procedure WorkQPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnIncreaseFontClick(Sender: TObject);
    procedure btnDecreaseFontClick(Sender: TObject);
    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure btnAddRecordClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Bookmark: TBookmark;
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: Integer = 0);
    { Private declarations }
  public
    { Public declarations }
    RL: RecordLights;
    procedure RefreshData;
  end;

var
  PlannedRentSelectForm: TPlannedRentSelectForm;
function ShowPlannedRentSelect(Options: CreateOptionsGlobal): Integer;

implementation

uses routines;
{$R *.dfm}

procedure TPlannedRentSelectForm.RefreshData;
var BudgetGUID: Variant;
    ContractID: Integer;
begin
  try
    BudgetGUID := BudgetsQ.FieldByName('GUID').AsVariant;
    ContractID := BudgetsQ.FieldByName('NumbersContractsID').AsInteger;
    OpenQ(BudgetArticlesQ, 'exec BudgetArticlesShow ' + VariantAsString(BudgetGUID), False);
    OpenQ(DepartmentQ, 'exec DepartmentsShow ' + VariantAsString(BudgetGUID), False);
    OpenQ(UnitMeasureQ, 'exec UnitsMeasureShow ' + VariantAsString(BudgetGUID), False);
    OpenQ(StageQ, 'exec StagesShow ' + IntToStr(ContractID), False);
  except
  end;
end;

function ShowPlannedRentSelect(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TPlannedRentSelectForm, PlannedRentSelectForm);
    PlannedRentSelectForm.Caption := Options.FormCaption;
    PlannedRentSelectForm.Show;
    Result := 1;
  except
    PlannedRentSelectForm.Free;
    PlannedRentSelectForm := nil;
  end;
end;

procedure TPlannedRentSelectForm.btnAddRecordClick(Sender: TObject);
begin
  try
    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec BudgetCopy 0, :BudgetGUID, 0, :BudgetSourceGUID, :FormName';
    MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
    MainForm.Query.Parameters.ParamByName('BudgetSourceGUID').Value := BudgetsQ.FieldByName('GUID').AsVariant;
    MainForm.Query.Parameters.ParamByName('FormName').Value := 'PlannedRent';
    MainForm.Query.ExecSQL;
  except

  end;
end;

procedure TPlannedRentSelectForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TPlannedRentSelectForm.btnDecreaseFontClick(Sender: TObject);
begin
  cxGrid1DBTableView1.BeginUpdate;
  with cxGrid1DBTableView1.Styles do
    begin
      if (content <> nil) then
        content.Font.size := content.Font.size - 1;
      if (background <> nil) then
        background.Font.size := background.Font.size - 1;
      if (ContentEven <> nil) then
        ContentEven.Font.size := ContentEven.Font.size - 1;
      if (ContentOdd <> nil) then
        ContentOdd.Font.size := ContentOdd.Font.size - 1;
      if (FilterBox <> nil) then
        FilterBox.Font.size := FilterBox.Font.size - 1;
      if (FilterRowInfotext <> nil) then
        FilterRowInfotext.Font.size := FilterRowInfotext.Font.size - 1;
      if (footer <> nil) then
        footer.Font.size := footer.Font.size - 1;
      if (group <> nil) then
        group.Font.size := group.Font.size - 1;
      if (GroupByBox <> nil) then
        GroupByBox.Font.size := GroupByBox.Font.size - 1;
      if (GroupFooterSortedSummary <> nil) then
        GroupFooterSortedSummary.Font.size :=
          GroupFooterSortedSummary.Font.size - 1;
      if (GroupSortedSummary <> nil) then
        GroupSortedSummary.Font.size := GroupSortedSummary.Font.size - 1;
      if (GroupSummary <> nil) then
        GroupSummary.Font.size := GroupSummary.Font.size - 1;
      if (Header <> nil) then
        Header.Font.size := Header.Font.size - 1;
      if (Inactive <> nil) then
        Inactive.Font.size := Inactive.Font.size - 1;
      if (incSearch <> nil) then
        incSearch.Font.size := incSearch.Font.size - 1;
      if (Indicator <> nil) then
        Indicator.Font.size := Indicator.Font.size - 1;
      if (Navigator <> nil) then
        Navigator.Font.size := Navigator.Font.size - 1;
      if (NewItemRowInfoText <> nil) then
        NewItemRowInfoText.Font.size := NewItemRowInfoText.Font.size - 1;
      if (Preview <> nil) then
        Preview.Font.size := Preview.Font.size - 1;
      if (Selection <> nil) then
        Selection.Font.size := Selection.Font.size - 1;
    end;
  cxGrid1DBTableView1.EndUpdate;
end;

procedure TPlannedRentSelectForm.btnIncreaseFontClick(Sender: TObject);
begin
  cxGrid1DBTableView1.BeginUpdate;
  with cxGrid1DBTableView1.Styles do
    begin
      with cxGrid1DBTableView1.Styles do
        begin
          if (content <> nil) then
            content.Font.size := content.Font.size + 1;
          if (background <> nil) then
            background.Font.size := background.Font.size + 1;
          if (ContentEven <> nil) then
            ContentEven.Font.size := ContentEven.Font.size + 1;
          if (ContentOdd <> nil) then
            ContentOdd.Font.size := ContentOdd.Font.size + 1;
          if (FilterBox <> nil) then
            FilterBox.Font.size := FilterBox.Font.size + 1;
          if (FilterRowInfotext <> nil) then
            FilterRowInfotext.Font.size := FilterRowInfotext.Font.size + 1;
          if (footer <> nil) then
            footer.Font.size := footer.Font.size + 1;
          if (group <> nil) then
            group.Font.size := group.Font.size + 1;
          if (GroupByBox <> nil) then
            GroupByBox.Font.size := GroupByBox.Font.size + 1;
          if (GroupFooterSortedSummary <> nil) then
            GroupFooterSortedSummary.Font.size :=
              GroupFooterSortedSummary.Font.size + 1;
          if (GroupSortedSummary <> nil) then
            GroupSortedSummary.Font.size := GroupSortedSummary.Font.size + 1;
          if (GroupSummary <> nil) then
            GroupSummary.Font.size := GroupSummary.Font.size + 1;
          if (Header <> nil) then
            Header.Font.size := Header.Font.size + 1;
          if (Inactive <> nil) then
            Inactive.Font.size := Inactive.Font.size + 1;
          if (incSearch <> nil) then
            incSearch.Font.size := incSearch.Font.size + 1;
          if (Indicator <> nil) then
            Indicator.Font.size := Indicator.Font.size + 1;
          if (Navigator <> nil) then
            Navigator.Font.size := Navigator.Font.size + 1;
          if (NewItemRowInfoText <> nil) then
            NewItemRowInfoText.Font.size := NewItemRowInfoText.Font.size + 1;
          if (Preview <> nil) then
            Preview.Font.size := Preview.Font.size + 1;
          if (Selection <> nil) then
            Selection.Font.size := Selection.Font.size + 1;
        end;
    end;
  cxGrid1DBTableView1.EndUpdate;
end;

procedure TPlannedRentSelectForm.btnWordWrapClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TPlannedRentSelectForm.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: Integer = 0);
var
  i: Integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TPlannedRentSelectForm.cxButton1Click(Sender: TObject);
begin
  messagedlg('Экспорт в Excel', mtConfirmation, [mbYes], 0);
end;

procedure TPlannedRentSelectForm.cxButton2Click(Sender: TObject);
begin
  messagedlg('Печать', mtConfirmation, [mbYes], 0);
end;

procedure TPlannedRentSelectForm.cxGrid1DBTableView1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if RL.ErrorControl then
    begin
      if AViewInfo.GridRecord.Values
        [cxGrid1DBTableView1.GetColumnByFieldName('ID').Index]
        = RL.RecordControlID then
        begin
          if not RL.ErrorState then
            ACanvas.Brush.Color := clLime
          else
            ACanvas.Brush.Color := clRed;
        end;
    end;
  ACanvas.FillRect(AViewInfo.Bounds);
end;

procedure TPlannedRentSelectForm.cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshData;
  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec plannedRentShow :BudgetGUID';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetsQ.FieldByName('GUID').AsVariant;
    WorkQ.Open;
    MainForm.GetBudgetInfo;
    dxStatusBar1.Panels.Items[0].Text := 'Договор: ' +
      MainForm.Query.FieldByName('ContractName').AsString;
    dxStatusBar1.Panels.Items[1].Text := 'Бюджет: ' + MainForm.Query.FieldByName
      ('BudgetName').AsString;
  except
  end;
end;

procedure TPlannedRentSelectForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TPlannedRentSelectForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //cxPropertiesStore1.StoreTo(true);
  // GridVewTemplateFormSource:=nil;
  Sender := nil;
end;

procedure TPlannedRentSelectForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  BudgetsQ.Close;
  BudgetsQ.Open;
end;

procedure TPlannedRentSelectForm.WorkQAfterPost(DataSet: TDataSet);
begin
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
  QueryPreCalc.Close;
  QueryPreCalc.SQL.Text := 'exec PlannedRentPreCalc :ID, :BudgetGUID';
  QueryPreCalc.Parameters.ParamByName('ID').Value := DataSet.FieldByName('ID').AsVariant;
  QueryPreCalc.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
  QueryPreCalc.Open;
    {WorkQ.Close;
    WorkQ.SQL.Text := 'exec plannedRentShow :BudgetGUID';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
    WorkQ.Open;}
  //WorkQ.GotoBookmark(Bookmark);
end;

procedure TPlannedRentSelectForm.WorkQBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
  WorkQ.FieldByName('BudgetGUID').AsVariant := GlobalBudgetGUID;
  //Bookmark := WorkQ.GetBookmark;
end;

procedure TPlannedRentSelectForm.WorkQPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

end.
