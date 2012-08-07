unit Stages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPScxCommon, ADODB, cxRichEdit, cxTextEdit, cxMemo,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxButtons, ImageButton, ExtCtrls, dxStatusBar, Main, Common, cxDBLookupComboBox,
  cxGridDBDataDefinitions, cxVariants, cxCurrencyEdit, Budgets, types;

type
  TStagesForm = class(TForm)
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    ImageButton2: TImageButton;
    ImageButton3: TImageButton;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    PlannedName: TLabel;
    btnAddBudgetVersion: TcxButton;
    BudgetPanel: TPanel;
    BudgetAll: TcxButton;
    BudgetOISI: TcxButton;
    BudgetNIO: TcxButton;
    BudgetPro: TcxButton;
    BudgetOAN: TcxButton;
    ButtonCopy: TcxButton;
    Panel2: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentName: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionName: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1DateByText: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    RightSplitter: TcxSplitter;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    MonthQ: TADOQuery;
    MonthDS: TDataSource;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    TypeWorkDS: TDataSource;
    TypeWorkQ: TADOQuery;
    QueryPreCalc: TADOQuery;
    WorkDS: TDataSource;
    WorkQ: TADOQuery;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1NumbersContractsID: TcxGridDBColumn;
    cxGrid1DBTableView1StageName: TcxGridDBColumn;
    cxGrid1DBTableView1StageRegNumber: TcxGridDBColumn;
    cxGrid1DBTableView1Cost: TcxGridDBColumn;
    cxGrid1DBTableView1CostFact: TcxGridDBColumn;
    cxGrid1DBTableView1CostPlan: TcxGridDBColumn;
    cxGrid1DBTableView1CalcType: TcxGridDBColumn;
    cxGrid1DBTableView1TypesWorkGUID: TcxGridDBColumn;
    cxGrid1DBTableView1DateStart: TcxGridDBColumn;
    cxGrid1DBTableView1DateFinish: TcxGridDBColumn;
    cxGrid1DBTableView1DateStageClose: TcxGridDBColumn;
    cxGrid1DBTableView1DateStageRealize: TcxGridDBColumn;
    cxGrid1DBTableView1CloseState: TcxGridDBColumn;
    cxGridDBTableView1CostPlan: TcxGridDBColumn;
    cxGridDBTableView1CostFact: TcxGridDBColumn;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure WorkQAfterOpen(DataSet: TDataSet);
    procedure WorkQAfterPost(DataSet: TDataSet);
    procedure WorkQBeforeInsert(DataSet: TDataSet);
    procedure WorkQBeforePost(DataSet: TDataSet);
    procedure WorkQPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImageButton3Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton8Click(Sender: TObject);
    procedure ImageButton9Click(Sender: TObject);
    procedure ImageButton10Click(Sender: TObject);
    procedure ImageButton11Click(Sender: TObject);
    procedure BudgetOISIClick(Sender: TObject);
    procedure BudgetAllClick(Sender: TObject);
    procedure BudgetNIOClick(Sender: TObject);
    procedure BudgetProClick(Sender: TObject);
    procedure BudgetOANClick(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure MonthQAfterPost(DataSet: TDataSet);
    procedure cxButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  //  Bookmark: TBookmark;
    QueryState: Integer;
  public
    { Public declarations }
    RL: RecordLights;
    ButtonDownName: string;
    ContractID: Integer;
    BudgetGUID: Variant;
    BudgetGUIDForSpr: Variant;
    ContractStart, ContractFinish: TDate;
    PlanFormState: string;
    procedure RefreshData;
    procedure RefreshPlan(WithSaveID: Integer);
    procedure RefreshMonths(NewItem: Boolean);
    procedure ShowPlanData(Button: TcxButton);
    procedure PlannedUpdateSumCounts;
    procedure FormAccessControl;
  end;

var
  StagesForm: TStagesForm;
  function ShowPlannedStage(Options: CreateOptionsGlobal): Integer;

implementation
  uses routines, TreeUnit, SQLRoutines1;
{$R *.dfm}

function ShowPlannedStage(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TStagesForm, StagesForm);
    StagesForm.Caption := Options.FormCaption;
    StagesForm.ContractID := Options.ContractID;
    StagesForm.BudgetGUID := Options.BudgetGUID;
    StagesForm.BudgetGUIDForSpr := Options.BudgetGUIDForSpr;
    StagesForm.Show;
    Result := 1;
  except
    StagesForm.Free;
    StagesForm := nil;
  end;
end;

procedure TStagesForm.RefreshData;
begin
  try
    OpenParamsQ(TypeWorkQ, 'exec TypesWorkShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, 'Форма ввода']);
  except
  end;
end;

procedure TStagesForm.BudgetAllClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TStagesForm.BudgetNIOClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TStagesForm.BudgetOANClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TStagesForm.BudgetOISIClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TStagesForm.BudgetProClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TStagesForm.cxButton2Click(Sender: TObject);
var
  Options: CreateOptionsBudgets;
begin
  Options.FormCaption := 'Бюджеты';
  ShowBudgets(Options, 0, 0);
end;

procedure TStagesForm.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TStagesForm.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var DC: TcxGridDBDataController;
begin
  DC := TcxGridDBTableView(Sender).DataController;  //блокировка колонки PostGUID пока не выбран отдел
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PostGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('DepartmentGUID').Index]);
  end;
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PlaceResidenceGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('CityFinishGUID').Index]);
  end;
end;

procedure TStagesForm.cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
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

procedure TStagesForm.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord <> nil then
    begin
      RefreshMonths(False);
    end else RefreshMonths(True);
end;

procedure TStagesForm.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    begin
      if WorkQ.Active then
      if WorkQ.RecordCount > 0 then
      if MessageDlg('Удалить?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          try
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec PlannedDelete :PlannedID, :Plan, :BudgetGUID';
            MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedStages';
            MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
            MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
            MainForm.Query.ExecSQL;

            RefreshPlan(0);
            MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedStages', TForm(StagesForm));
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

procedure TStagesForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
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

procedure TStagesForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TStagesForm.FormShow(Sender: TObject);
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

    dxStatusBar1.Panels.Items[0].Text := 'Договор: ' + MainForm.Query.FieldByName('ContractName').AsString;
    dxStatusBar1.Panels.Items[1].Text := 'Бюджет: ' + MainForm.Query.FieldByName('BudgetName').AsString;

    BudgetInfoMemo.Lines.Add('Бюджет: ' + MainForm.Query.FieldByName('BudgetName').AsString);
    BudgetInfoMemo.Lines.Add('Версия бюджета: ' + MainForm.Query.FieldByName('Version').AsString);
    BudgetInfoMemo.Lines.Add('Договор: ' + MainForm.Query.FieldByName('ContractName').AsString);
    BudgetInfoMemo.Lines.Add('Заказчик: ' + MainForm.Query.FieldByName('OrganisationName').AsString);
    BudgetInfoMemo.Lines.Add('Дата начала: ' + MainForm.Query.FieldByName('ContractDateStart').AsString);
    BudgetInfoMemo.Lines.Add('Дата окончания: ' + MainForm.Query.FieldByName('ContractDateFinish').AsString);
    BudgetInfoMemo.Lines.Add('ГИП: ' + MainForm.Query.FieldByName('FIO').AsString);
    BudgetInfoMemo.Lines.Add('Номер: ' + MainForm.Query.FieldByName('ContractNumber').AsString);
    PlanFormState := MainForm.Query.FieldByName('State').AsString;
  except
  end;
  Button := TcxButton(FindComponent(MainForm.GetNameButton));
  if Button <> nil then Button.Click;
  if MainForm.ParamCode = '' then btnAddBudgetVersion.Visible := False;
end;

procedure TStagesForm.FormAccessControl;
begin
  try
    if PlanFormState = 'Доступен. Утвержден' then
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

procedure TStagesForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TStagesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TStagesForm.ImageButton10Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TStagesForm.ImageButton11Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TStagesForm.ImageButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption+'_'+ButtonDownName);
    MainForm.UploadToExcel(cxGrid1, Caption+'_'+ButtonDownName);
end;

procedure TStagesForm.ImageButton3Click(Sender: TObject);
begin
  if RightSplitter.State = ssOpened then
    RightSplitter.CloseSplitter
  else
    RightSplitter.OpenSplitter;
end;

procedure TStagesForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TStagesForm.ImageButton8Click(Sender: TObject);
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

procedure TStagesForm.ImageButton9Click(Sender: TObject);
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

procedure TStagesForm.MonthQAfterPost(DataSet: TDataSet);
begin
  PlannedUpdateSumCounts;
end;

procedure TStagesForm.RefreshPlan(WithSaveID: Integer);
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
    WorkQ.SQL.Text := 'exec PlannedStagesShow :BudgetGUID, :CalcType';
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

procedure TStagesForm.WorkQAfterOpen(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedStages', StagesForm);
end;

procedure TStagesForm.WorkQAfterPost(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedStages', TForm(StagesForm));
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;

      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedStageFillAndCleanMonths :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.ExecSQL;

//        MainForm.Query.Close;
//        MainForm.Query.SQL.Text := 'exec PlannedStageMonthsCalculate :BudgetGUID, :PlannedID';
//        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
//        MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
//        MainForm.Query.Open;

        WorkQ.Close;
        WorkQ.SQL.Text := 'exec PlannedStagesShow :BudgetGUID, :CalcType';
        WorkQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        WorkQ.Parameters.ParamByName('CalcType').Value := ButtonDownName;
        WorkQ.Open;

        RefreshMonths(False);
      finally
        QueryState := -1;
      end;
  PlannedUpdateSumCounts;
end;

procedure TStagesForm.PlannedUpdateSumCounts;
begin
      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedUpdateSumCounts :Plan, :PlannedID, :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedStage';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MainForm.Query.Open;
        RefreshPlan(WorkQ.FieldByName('ID').AsInteger);
      finally

      end;
end;

procedure TStagesForm.WorkQBeforeInsert(DataSet: TDataSet);
begin
  QueryState := 0;
end;

procedure TStagesForm.WorkQBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;

  if QueryState = 0 then
    begin
      WorkQ.FieldByName('BudgetGUID').AsVariant := GlobalBudgetGUID;

      WorkQ.FieldByName('NumbersContractsID').AsVariant := GlobalContractID;
      WorkQ.FieldByName('CalcType').AsVariant := ButtonDownName;
    end;
  if (WorkQ.FieldByname('DateFinish').asDateTime <
      WorkQ.FieldByname('DateStart').asDateTime) or
     (WorkQ.FieldByname('DateStart').asDateTime < ContractStart) or
     (WorkQ.FieldByname('DateStart').asDateTime > ContractFinish) or
     (WorkQ.FieldByname('DateFinish').asDateTime < ContractStart) or
     (WorkQ.FieldByname('DateFinish').asDateTime > ContractFinish)
       then
    begin
     MessageBox(handle,pchar('Вы ввели неверные сочетания даты. '+ #13 +
     'Исправьте даты таким образом, чтобы дата Окончания была больше или равна дате Начала ' + #13 +
     'и не выходила за пределы действия договора.'),pchar('Исправьте даты'),48);
     Abort;
    end;
end;

procedure TStagesForm.WorkQPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

procedure TStagesForm.RefreshMonths(NewItem: Boolean);
begin
  try
      if not NewItem then
      begin
    MonthQ.Close;
    MonthQ.SQL.Text := 'exec plannedStagesMonthsShow :BudgetGUID, :PlannedID';
    MonthQ.Parameters.ParamByName('BudgetGUID').Value := WorkQ.FieldByName('BudgetGUID').AsVariant;
    MonthQ.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
    MonthQ.Open;
      end else MonthQ.Close;
  except

  end;
end;

procedure TStagesForm.ShowPlanData(Button: TcxButton);
begin
    ButtonDownName := Button.Hint;
    RefreshData;
  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec PlannedStagesShow :BudgetGUID, :CalcType';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    WorkQ.Parameters.ParamByName('CalcType').Value := Button.Hint;
    WorkQ.Open;
  except
  end;
 if Button.Hint = 'Все бюджеты' then           // если режим все бюджеты то нельзя вставлять новые даннные
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
