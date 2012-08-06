unit PlannedSubcontract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, Menus, dxPSCore, dxPScxCommon, DB, ADODB,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsdxStatusBarPainter, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxDBLookupComboBox, cxCurrencyEdit, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo, cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, ImageButton, ExtCtrls, dxStatusBar,
  Main, Common, SQLRoutines1, routines, TreeUnit;

type
  TPlannedSubcontractForm = class(TForm)
    MonthDS: TDataSource;
    MonthQ: TADOQuery;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    PlanMenu: TPopupMenu;
    Action11: TMenuItem;
    StageDS: TDataSource;
    StageQ: TADOQuery;
    OrganisationDS: TDataSource;
    OrganisationQ: TADOQuery;
    WorkDS: TDataSource;
    WorkQ: TADOQuery;
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
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1StageGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TotalCostPlan: TcxGridDBColumn;
    cxGrid1DBTableView1OrganisationGUID: TcxGridDBColumn;
    cxGrid1DBTableView1ContractName: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1DateByText: TcxGridDBColumn;
    cxGridDBTableView1Price: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    RightSplitter: TcxSplitter;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    cxGrid1DBTableView1StageNumber: TcxGridDBColumn;
    cxGrid1DBTableView1DateValidBefore: TcxGridDBColumn;
    cxGrid1DBTableView1TotalCostFact: TcxGridDBColumn;
    cxGrid1DBTableView1Rest: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1OldGUID: TcxGridDBColumn;
    cxGrid1DBTableView1TypeCalc: TcxGridDBColumn;
    cxGridDBTableView1CostFact: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure ImageButton3Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton8Click(Sender: TObject);
    procedure ImageButton9Click(Sender: TObject);
    procedure ImageButton10Click(Sender: TObject);
    procedure ImageButton11Click(Sender: TObject);
    procedure WorkQAfterOpen(DataSet: TDataSet);
    procedure WorkQAfterPost(DataSet: TDataSet);
    procedure WorkQBeforeInsert(DataSet: TDataSet);
    procedure WorkQBeforePost(DataSet: TDataSet);
    procedure WorkQPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure MonthQAfterPost(DataSet: TDataSet);
    procedure BudgetAllClick(Sender: TObject);
    procedure BudgetOISIClick(Sender: TObject);
    procedure BudgetNIOClick(Sender: TObject);
    procedure BudgetProClick(Sender: TObject);
    procedure BudgetOANClick(Sender: TObject);
    procedure cxGrid1DBTableView1TotalCostFactCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    QueryState: Integer;
    procedure RefreshPlan(WithSaveID: Integer);
    procedure RefreshMonths(NewItem: Boolean);
    procedure ShowPlanData(Button: TcxButton);
  public
    { Public declarations }
    RL: RecordLights;
    ButtonDownName: string;
    BudgetGUID: Variant;
    BudgetGUIDForSpr: Variant;
    PlanFormState: string;
    procedure RefreshData;
    procedure FormAccessControl;
  end;

var
  PlannedSubcontractForm: TPlannedSubcontractForm;
  function ShowPlannedSubcontract(Options: CreateOptionsGlobal): Integer;

implementation

{$R *.dfm}

procedure TPlannedSubcontractForm.BudgetAllClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedSubcontractForm.BudgetNIOClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedSubcontractForm.BudgetOANClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedSubcontractForm.BudgetOISIClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedSubcontractForm.BudgetProClick(Sender: TObject);
begin
  ShowPlanData(TcxButton(Sender));
end;

procedure TPlannedSubcontractForm.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TPlannedSubcontractForm.cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
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

procedure TPlannedSubcontractForm.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord <> nil then
    begin
      RefreshMonths(False);
    end else RefreshMonths(True);
end;

procedure TPlannedSubcontractForm.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
            MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedSubcontract';
            MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
            MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
            MainForm.Query.ExecSQL;

            RefreshPlan(0);
            MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedSubcontract', TForm(PlannedSubcontractForm));
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

procedure TPlannedSubcontractForm.cxGrid1DBTableView1TotalCostFactCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TPlannedSubcontractForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
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

procedure TPlannedSubcontractForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TPlannedSubcontractForm.FormShow(Sender: TObject);
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

procedure TPlannedSubcontractForm.FormAccessControl;
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

procedure TPlannedSubcontractForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TPlannedSubcontractForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TPlannedSubcontractForm.RefreshPlan(WithSaveID: Integer);
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
    WorkQ.SQL.Text := 'exec PlannedSubcontractShow :BudgetGUID, :CalcType';
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

procedure TPlannedSubcontractForm.WorkQAfterOpen(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedSubcontract', PlannedSubcontractForm);
end;

procedure TPlannedSubcontractForm.WorkQAfterPost(DataSet: TDataSet);
begin
  MainForm.PlanGetRecordCount(MainForm.Query, 'PlannedSubcontract', PlannedSubcontractForm);
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
  if QueryState = 0 then
    begin
      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedSubcontractFillAndCleanMonths :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.ExecSQL;
        RefreshMonths(False);
      finally
        QueryState := -1;
      end;
    end;
end;

procedure TPlannedSubcontractForm.WorkQBeforeInsert(DataSet: TDataSet);
begin
  QueryState := 0;
end;

procedure TPlannedSubcontractForm.WorkQBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
  if QueryState = 0 then
    begin
      WorkQ.FieldByName('BudgetGUID').AsVariant := GlobalBudgetGUID;
      WorkQ.FieldByName('TypeCalc').AsVariant := ButtonDownName;
    end;
end;

procedure TPlannedSubcontractForm.WorkQPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

procedure TPlannedSubcontractForm.RefreshMonths(NewItem: Boolean);
begin
  try
    if not NewItem then
      begin
        MonthQ.Close;
        MonthQ.SQL.Text := 'exec PlannedSubcontractMonthsShow :BudgetGUID, :PlannedID';
        MonthQ.Parameters.ParamByName('BudgetGUID').Value := WorkQ.FieldByName('BudgetGUID').AsVariant;
        MonthQ.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MonthQ.Open;
      end else MonthQ.Close;
  except

  end;
end;

procedure TPlannedSubcontractForm.ImageButton10Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TPlannedSubcontractForm.ImageButton11Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TPlannedSubcontractForm.ImageButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption);
end;

procedure TPlannedSubcontractForm.ImageButton3Click(Sender: TObject);
begin
  if RightSplitter.State = ssOpened then
    RightSplitter.CloseSplitter
  else
    RightSplitter.OpenSplitter;
end;

procedure TPlannedSubcontractForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TPlannedSubcontractForm.ImageButton8Click(Sender: TObject);
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

procedure TPlannedSubcontractForm.ImageButton9Click(Sender: TObject);
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

procedure TPlannedSubcontractForm.MonthQAfterPost(DataSet: TDataSet);
begin
      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec PlannedUpdateSumCounts :Plan, :PlannedID, :BudgetGUID';
        MainForm.Query.Parameters.ParamByName('Plan').Value := 'PlannedSubcontract';
        MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
        MainForm.Query.Parameters.ParamByName('PlannedID').Value := WorkQ.FieldByName('ID').AsVariant;
        MainForm.Query.Open;
        RefreshPlan(MonthQ.FieldByName('ID').AsInteger);
      finally

      end;
end;

procedure TPlannedSubcontractForm.RefreshData;
var CalcType: Variant;
begin
  try
    CalcType := ButtonDownName;
    OpenParamsQ(StageQ, 'exec StagesShow :BudgetGUID, :CalcType',[GlobalBudgetGUID, CalcType]);
    OpenParamsQ(OrganisationQ, 'exec OrganizationsShow :BudgetGUID, :FormType', [BudgetGUIDForSpr, 'Форма ввода']);
  except
  end;
end;

function ShowPlannedSubcontract(Options: CreateOptionsGlobal): Integer;
begin
  Result := -1;
  try
    Application.CreateForm(TPlannedSubcontractForm, PlannedSubcontractForm);
    PlannedSubcontractForm.Caption := Options.FormCaption;
    PlannedSubcontractForm.BudgetGUID := Options.BudgetGUID;
    PlannedSubcontractForm.BudgetGUIDForSpr := Options.BudgetGUIDForSpr;
    PlannedSubcontractForm.Show;
    Result := 1;
  except
    PlannedSubcontractForm.Free;
    PlannedSubcontractForm := nil;
  end;
end;

procedure TPlannedSubcontractForm.ShowPlanData(Button: TcxButton);
begin
    ButtonDownName := Button.Hint;
    RefreshData;
  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec plannedSubcontractShow :BudgetGUID, :CalcType';
    WorkQ.Parameters.ParamByName('BudgetGUID').Value := BudgetGUID;
    WorkQ.Parameters.ParamByName('CalcType').Value := Button.Hint;
    WorkQ.Open;
  except
  end;
  if Button.Hint = 'Все бюджеты' then           // если режим все бюджеты то нельзя вставлять новые даннные
    begin
      cxGrid1DBTableView1.OptionsData.Editing := False;
      cxGridDBTableView1.OptionsData.Editing := False;
    end else
    begin
      cxGrid1DBTableView1.OptionsData.Editing := True;
      cxGridDBTableView1.OptionsData.Editing := True;
    end;

  FormAccessControl;
end;

end.
