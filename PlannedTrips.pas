unit PlannedTrips;

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
  cxButtonEdit, cxDBLookupComboBox, cxDropDownEdit, ImageButton, TreeUnit, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, cxRichEdit, cxMemo,
  Common, cxDBExtLookupComboBox, Main, Types;

type
  TPlannedTripsForm = class(TForm)
    WorkQ: TADOQuery;
    WorkDS: TDataSource;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DepartmentDS: TDataSource;
    DepartmentQ: TADOQuery;
    PostDS: TDataSource;
    PostQ: TADOQuery;
    TypeWorkQ: TADOQuery;
    TypeWorkDS: TDataSource;
    EmployeeQ: TADOQuery;
    EmployeeDS: TDataSource;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1EmployeeCount: TcxGridDBColumn;
    cxGrid1DBTableView1CityStartGUID: TcxGridDBColumn;
    cxGrid1DBTableView1CityFinishGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TripsCount: TcxGridDBColumn;
    cxGrid1DBTableView1DateStart: TcxGridDBColumn;
    cxGrid1DBTableView1DateFinish: TcxGridDBColumn;
    cxGrid1DBTableView1CalendarDayCount: TcxGridDBColumn;
    cxGrid1DBTableView1WorkDayCount: TcxGridDBColumn;
    cxGrid1DBTableView1TypeWorkGUID: TcxGridDBColumn;
    cxGrid1DBTableView1EmployeeGUID: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TypeTransportGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PlaceResidenceGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    CityStartQ: TADOQuery;
    CityStartDS: TDataSource;
    CityFinishQ: TADOQuery;
    CityFinishDS: TDataSource;
    TypeTransportQ: TADOQuery;
    TypeTransportDS: TDataSource;
    PlaceResidenceQ: TADOQuery;
    PlaceResidenceDS: TDataSource;
    DailyAllowanceQ: TADOQuery;
    DailyAllowanceDS: TDataSource;
    cxGrid1DBTableView1DailyAllowanceGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TotalDailyAllowance: TcxGridDBColumn;
    CostTripQ: TADOQuery;
    CostTripDS: TDataSource;
    cxGrid1DBTableView1CostTripGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TotalCostTrip: TcxGridDBColumn;
    CostResidingQ: TADOQuery;
    CostResidingDS: TDataSource;
    cxGrid1DBTableView1CostResidingGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TotalCostResiding: TcxGridDBColumn;
    StageQ: TADOQuery;
    StageDS: TDataSource;
    cxGrid1DBTableView1StageGUID: TcxGridDBColumn;
    QueryPreCalc: TADOQuery;
    MonthQ: TADOQuery;
    MonthDS: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1EmployeeCount: TcxGridDBColumn;
    cxGridDBTableView1TripsCount: TcxGridDBColumn;
    cxGridDBTableView1CalendarDayCount: TcxGridDBColumn;
    cxGridDBTableView1WorkDayCount: TcxGridDBColumn;
    cxGridDBTableView1DateByText: TcxGridDBColumn;
    RightSplitter: TcxSplitter;
    PostFilterQ: TADOQuery;
    PostFilterDS: TDataSource;
    btnAddBudgetVersion: TcxButton;
    ImageButton2: TImageButton;
    ImageButton3: TImageButton;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    PlaceResidenceFilterQ: TADOQuery;
    PlaceResidenceFilterDS: TDataSource;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    BudgetPanel: TPanel;
    BudgetAll: TcxButton;
    BudgetOISI: TcxButton;
    BudgetNIO: TcxButton;
    BudgetPro: TcxButton;
    BudgetOAN: TcxButton;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentName: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionName: TcxGridDBColumn;
    Timer: TTimer;
    PlannedName: TLabel;
    ButtonCopy: TcxButton;
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
    procedure cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure WorkQBeforeInsert(DataSet: TDataSet);
    procedure MonthQAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure CalcTypeBoxPropertiesCloseUp(Sender: TObject);
    procedure ImageButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BudgetAllClick(Sender: TObject);
    procedure BudgetOISIClick(Sender: TObject);
    procedure BudgetNIOClick(Sender: TObject);
    procedure BudgetProClick(Sender: TObject);
    procedure BudgetOANClick(Sender: TObject);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1CityFinishGUIDPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure MainFormAction1Execute(Sender: TObject);
    procedure WorkQAfterOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
   // Bookmark: TBookmark;
    QueryState: Integer;
  //  procedure ChangeFontSize(S: TcxGridTableViewStyles;
  //    SizeDifference: Integer = 0);
      procedure RefreshMonths(NewItem: Boolean);
      procedure RefreshPlan(WithSaveID: Integer);
      procedure ShowPlanData(Button: TcxButton);
      procedure PlannedUpdateSumCounts;
    { Private declarations }
  public
    { Public declarations }
    RL: RecordLights;
    ButtonDownName: string;
    ContractStart, ContractFinish: TDate;
    CityChange: Boolean;
    BudgetGUID: Variant;
    BudgetGUIDForSpr: Variant;
    PlanFormState: string;

    procedure RefreshData;
    procedure FormAccessControl;
  end;

var
  PlannedTripsForm: TPlannedTripsForm;
function ShowPlannedTrips(Options: CreateOptionsGlobal): Integer;

implementation

uses routines, cxGridDBDataDefinitions, cxVariants, XLSImportUnit, SQLRoutines1;
{$R *.dfm}

procedure TPlannedTripsForm.RefreshData;
var CalcType: Variant;
begin
  try
    CalcType := ButtonDownName;
    OpenParamsQ(CostResidingQ, 'exec CostResidingShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(CostTripQ, 'exec CostsTripShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(DailyAllowanceQ, 'exec DailyAllowancesShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(CityStartQ, 'exec CitiesShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(CityFinishQ, 'exec CitiesShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(TypeWorkQ, 'exec TypesWorkShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(PlaceResidenceQ, 'exec PlaceResidenceShow :BudgetGUID, :CityGUID, :FormType', [BudgetGUIDForSpr, Null, '����� �����']);
    OpenParamsQ(TypeTransportQ, 'exec TypesTransportShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(EmployeeQ, 'exec EmployeesShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(PostQ, 'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [BudgetGUIDForSpr, Null, '����� �����']);
    OpenParamsQ(DepartmentQ, 'exec DepartmentsShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, '����� �����']);
    OpenParamsQ(StageQ, 'exec StagesShow :BudgetGUID, :CalcType', [GlobalBudgetGUID, CalcType]);
  except
  end;
end;

function ShowPlannedTrips(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TPlannedTripsForm, PlannedTripsForm);
    PlannedTripsForm.Caption := Options.FormCaption;
    PlannedTripsForm.BudgetGUID := Options.BudgetGUID;
    PlannedTripsForm.BudgetGUIDForSpr := Options.BudgetGUIDForSpr;
    PlannedTripsForm.Show;
    Result := 1;
  except
    PlannedTripsForm.Free;
    PlannedTripsForm := nil;
  end;
end;

procedure TPlannedTripsForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TPlannedTripsForm.btnDecreaseFontClick(Sender: TObject);
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

procedure TPlannedTripsForm.btnIncreaseFontClick(Sender: TObject);
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

procedure TPlannedTripsForm.btnWordWrapClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TPlannedTripsForm.BudgetAllClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
 // Caption := TimeToStr(Now);       ������, ��� ��� ������ �������� � ������ ������� ����� caption
end;

procedure TPlannedTripsForm.BudgetNIOClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedTripsForm.BudgetOANClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedTripsForm.BudgetOISIClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedTripsForm.BudgetProClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedTripsForm.CalcTypeBoxPropertiesCloseUp(Sender: TObject);
begin
  cxGrid1.SetFocus;
end;



procedure TPlannedTripsForm.cxButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption+'_'+ButtonDownName);
    MainForm.UploadToExcel(cxGrid2, Caption+'_'+ButtonDownName);

end;

procedure TPlannedTripsForm.cxButton2Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TPlannedTripsForm.cxGrid1DBTableView1CityFinishGUIDPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  CityChange := True;
  Timer.Enabled := True;
end;

procedure TPlannedTripsForm.cxGrid1DBTableView1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TPlannedTripsForm.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var DC: TcxGridDBDataController;
begin
  DC := TcxGridDBTableView(Sender).DataController;  //���������� ������� PostGUID ���� �� ������ �����
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PostGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('DepartmentGUID').Index]);
  end;
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PlaceResidenceGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('CityFinishGUID').Index]);
  end;

end;

procedure TPlannedTripsForm.cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (WorkQ.State = dsEdit) or (WorkQ.State = dsInsert) then
        begin
          WorkQ.Post;
          cxGrid1DBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TPlannedTripsForm.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord <> nil then
    begin
      RefreshMonths(False);
    end else RefreshMonths(True);
end;

procedure TPlannedTripsForm.cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
var ItemIndex: Integer;
    ItemValue: Variant;
    DC: TcxGridDBDataController;
    LookupProperty: TcxLookupComboBoxProperties;
begin
  if AItem = cxGrid1DBTableView1PostGUID then
    begin
      DC := TcxGridDBDataController(Sender.DataController);
      ItemIndex := DC.GetItemByFieldName('DepartmentGUID').Index;
      ItemValue := DC.Values[DC.FocusedRecordIndex, ItemIndex];

      if PostFilterQ.Active then PostFilterQ.Close;

      {PostFilterQ.SQL.Text := 'exec PostsShow :BudgetGUID, :DepartmentGUID ';
      PostFilterQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PostFilterQ.Parameters.ParamByName('DepartmentGUID').Value := ItemValue;}

      OpenParamsQ(PostFilterQ, 'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [BudgetGUIDForSpr, ItemValue, '����� �����']);

      LookupProperty := TcxLookupComboBox(AEdit).Properties;
      LookupProperty.ListSource := PostFilterDS;
      PostFilterQ.Open;
    end;

  if AItem = cxGrid1DBTableView1PlaceResidenceGUID then
    begin
      DC := TcxGridDBDataController(Sender.DataController);
      ItemIndex := DC.GetItemByFieldName('CityFinishGUID').Index;
      ItemValue := DC.Values[DC.FocusedRecordIndex, ItemIndex];

      if PlaceResidenceFilterQ.Active then PlaceResidenceFilterQ.Close;

//      PlaceResidenceFilterQ.SQL.Text := 'exec PlaceResidenceShow :BudgetGUID, :CityFinishGUID ';
//      PlaceResidenceFilterQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
//      PlaceResidenceFilterQ.Parameters.ParamByName('CityFinishGUID').Value := ItemValue;

      OpenParamsQ(PlaceResidenceFilterQ, 'exec PlaceResidenceShow :BudgetGUID, :CityGUID, :FormType', [BudgetGUIDForSpr, ItemValue, '����� �����']);

      LookupProperty := TcxLookupComboBox(AEdit).Properties;
      LookupProperty.ListSource := PlaceResidenceFilterDS;
      PlaceResidenceFilterQ.Open;
    end;

end;

procedure TPlannedTripsForm.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    begin
      if WorkQ.Active then
      if WorkQ.RecordCount > 0 then
      if MessageDlg('�������?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          try
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec PlannedDelete :PlannedID, :Plan, :BudgetGUID';
            MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedTrips';
            MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
            MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
            MainForm.Query.ExecSQL;

            RefreshPlan(0);
            MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedTrips', TForm(PlannedTripsForm));
          except on E: Exception do
          end;
        end;
    end;
  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (WorkQ.State = dsEdit) or (WorkQ.State = dsInsert) then
        begin
          WorkQ.Post;
          cxGrid1DBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TPlannedTripsForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGridDBTableView1.Controller.FocusedColumnIndex = cxGridDBTableView1.VisibleColumnCount-1) then
    begin
      if (MonthQ.State = dsEdit) or (MonthQ.State = dsInsert) then
        begin
          MonthQ.Post;
          cxGridDBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TPlannedTripsForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGridDBTableView1.Controller.FocusedColumnIndex = cxGridDBTableView1.VisibleColumnCount-1) then
    begin
      if (MonthQ.State = dsEdit) or (MonthQ.State = dsInsert) then
        begin
          MonthQ.Post;
          cxGridDBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TPlannedTripsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //cxPropertiesStore1.StoreTo(true);
  // GridVewTemplateFormSource:=nil;
  Sender := nil;
end;

procedure TPlannedTripsForm.FormShow(Sender: TObject);
var Button: TcxButton;
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  ChangeKeyboardLang('Ru');
  TopSplitter.CloseSplitter;
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  RefreshData;
  try
    //RefreshPlan(0);

    MainForm.GetBudgetInfo;

    ContractStart := MainForm.Query.FieldByName('ContractDateStart').AsDateTime;
    ContractFinish := MainForm.Query.FieldByName('ContractDateFinish').AsDateTime;

    dxStatusBar1.Panels.Items[0].Text := '�������: ' + MainForm.Query.FieldByName('ContractName').AsString;
    dxStatusBar1.Panels.Items[1].Text := '������: ' + MainForm.Query.FieldByName('BudgetName').AsString;

    BudgetInfoMemo.Lines.Add('������: ' + MainForm.Query.FieldByName('BudgetName').AsString);
    BudgetInfoMemo.Lines.Add('������ �������: ' + MainForm.Query.FieldByName('Version').AsString);
    BudgetInfoMemo.Lines.Add('�������: ' + MainForm.Query.FieldByName('ContractName').AsString);
    BudgetInfoMemo.Lines.Add('��������: ' + MainForm.Query.FieldByName('OrganisationName').AsString);
    BudgetInfoMemo.Lines.Add('���� ������: ' + MainForm.Query.FieldByName('ContractDateStart').AsString);
    BudgetInfoMemo.Lines.Add('���� ���������: ' + MainForm.Query.FieldByName('ContractDateFinish').AsString);
    BudgetInfoMemo.Lines.Add('���: ' + MainForm.Query.FieldByName('FIO').AsString);
    BudgetInfoMemo.Lines.Add('�����: ' + MainForm.Query.FieldByName('ContractNumber').AsString);
    PlanFormState := MainForm.Query.FieldByName('State').AsString;
  except
  end;

  Button := TcxButton(FindComponent(MainForm.GetNameButton));
  if Button <> nil then Button.Click;

  if MainForm.ParamCode = '' then btnAddBudgetVersion.Visible := False;
end;

procedure TPlannedTripsForm.FormAccessControl;
begin
  try
    if PlanFormState = '��������. ���������' then
      begin
        cxGridDBTableView1.OptionsData.Deleting := False;
        cxGridDBTableView1.OptionsData.Inserting := False;
        cxGridDBTableView1.OptionsData.Editing := False;
        cxGrid1DBTableView1.OptionsData.Deleting := False;
        cxGrid1DBTableView1.OptionsData.Inserting := False;
        cxGrid1DBTableView1.OptionsData.Editing := False;
        cxGrid1DBTableView1.NewItemRow.Visible := False;
      end else
          begin
            cxGridDBTableView1.OptionsData.Deleting := True;
            cxGridDBTableView1.OptionsData.Inserting := True;
            cxGridDBTableView1.OptionsData.Editing := True;
            cxGrid1DBTableView1.OptionsData.Deleting := True;
            cxGrid1DBTableView1.OptionsData.Inserting := True;
            cxGrid1DBTableView1.OptionsData.Editing := True;
            cxGrid1DBTableView1.NewItemRow.Visible := True;
          end;
  finally
  end;
end;

procedure TPlannedTripsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TPlannedTripsForm.ImageButton3Click(Sender: TObject);
begin
  if RightSplitter.State = ssOpened then
    RightSplitter.CloseSplitter
  else
    RightSplitter.OpenSplitter;
end;

procedure TPlannedTripsForm.MainFormAction1Execute(Sender: TObject);
begin
 XLSImportForm.visible:=true;
 XLSImportForm.BringToFront;

end;

procedure TPlannedTripsForm.MonthQAfterPost(DataSet: TDataSet);
begin
  PlannedUpdateSumCounts;
end;

procedure TPlannedTripsForm.PlannedUpdateSumCounts;
begin
      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedUpdateSumCounts :Plan, :PlannedID, :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedTrips';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MainForm.Query.Open;
        RefreshPlan(WorkQ.FieldByName('ID').AsInteger);
      finally

      end;
end;

procedure TPlannedTripsForm.RefreshMonths(NewItem: Boolean);
begin
  try
    if not NewItem then
      begin
        MonthQ.Close;
        MonthQ.SQL.Text := 'exec plannedTripsMonthsShow :BudgetGUID, :PlannedID';
        MonthQ.Parameters.ParamByName('BudgetGUID').Value := WorkQ.FieldByName('BudgetGUID').AsVariant;
        MonthQ.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MonthQ.Open;
      end else MonthQ.Close;
  except

  end;
end;

procedure TPlannedTripsForm.WorkQAfterOpen(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedTrips', PlannedTripsForm);
end;

procedure TPlannedTripsForm.WorkQAfterPost(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedTrips', TForm(PlannedTripsForm));
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;

      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedTripsFillAndCleanMonths :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.ExecSQL;

        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedTripsMonthsCalculate :BudgetGUID, :PlannedID';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MainForm.Query.Open;

        WorkQ.Close;
        WorkQ.SQL.Text := 'exec plannedTripsShow :BudgetGUID, :CalcType';
        WorkQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        WorkQ.Parameters.ParamByName('CalcType').Value := ButtonDownName;
        WorkQ.Open;

        RefreshMonths(False);
      finally
        QueryState := -1;
      end;
  PlannedUpdateSumCounts;
end;

procedure TPlannedTripsForm.WorkQBeforeInsert(DataSet: TDataSet);
begin
  QueryState := 0;
end;

procedure TPlannedTripsForm.WorkQBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;

  if QueryState = 0 then
    begin
      WorkQ.FieldByName('BudgetGUID').AsVariant := GlobalBudgetGUID;
      WorkQ.FieldByName('TypeCalc').AsVariant := ButtonDownName;
    end;
  if (WorkQ.FieldByname('DateFinish').asDateTime <
      WorkQ.FieldByname('DateStart').asDateTime) or
     (WorkQ.FieldByname('DateStart').asDateTime < ContractStart) or
     (WorkQ.FieldByname('DateStart').asDateTime > ContractFinish) or
     (WorkQ.FieldByname('DateFinish').asDateTime < ContractStart) or
     (WorkQ.FieldByname('DateFinish').asDateTime > ContractFinish)
       then
    begin
     MessageBox(handle,pchar('�� ����� �������� ��������� ����. '+ #13 +
     '��������� ���� ����� �������, ����� ���� ��������� ���� ������ ��� ����� ���� ������ ' + #13 +
     '� �� �������� �� ������� �������� ��������.'),pchar('��������� ����'),48);
     Abort;
    end;
end;

procedure TPlannedTripsForm.WorkQPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;


procedure TPlannedTripsForm.RefreshPlan(WithSaveID: Integer);
var SavePlanID: Integer;
begin
  try
    SavePlanID := 0;
    if WorkQ.Active then
      if WorkQ.RecordCount > 0 then
        begin
          SavePlanID := WorkQ.FieldByName('ID').AsInteger
        end;

    WorkQ.Close;
    WorkQ.SQL.Text := 'exec plannedTripsShow :BudgetGUID, :CalcType';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
    WorkQ.Parameters.ParamByName('CalcType').Value := ButtonDownName;
    WorkQ.Open;

    if SavePlanID > 0 then
    if WorkQ.Active then
      if WorkQ.RecordCount > 0 then
        begin
          WorkQ.Locate('ID', SavePlanID, []);
          if WithSaveID > 0 then MonthQ.Locate('ID', WithSaveID, []);
        end;
  except

  end;
end;

procedure TPlannedTripsForm.ShowPlanData(Button: TcxButton);
begin
    ButtonDownName := Button.Hint;
    RefreshData;
  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec plannedTripsShow :BudgetGUID, :CalcType';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    WorkQ.Parameters.ParamByName('CalcType').Value := Button.Hint;
    WorkQ.Open;
  except
  end;
 if Button.Hint = '��� �������' then           // ���� ����� ��� ������� �� ������ ��������� ����� �������
    begin
      cxGrid1DBTableView1.OptionsSelection.CellSelect:=false;
      cxGridDBTableView1.OptionsSelection.CellSelect:=false;
    end
  else
    begin
      cxGrid1DBTableView1.OptionsSelection.CellSelect:=true;
      cxGridDBTableView1.OptionsSelection.CellSelect:=true;
    end;

  FormAccessControl;
end;

end.
