unit Tasks;

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
  cxButtonEdit, cxDBLookupComboBox, Tabs, cxCalendar, ImageButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, TreeUnit,
  Common, SQLRoutines1, cxColorComboBox, cxLabel, cxImageComboBox, cxDropDownEdit, PlatformDefaultStyleActnCtrls,
  ActnPopup;

type
  CreateOptionsTask = record
    FormCaption: string;
  end;


type
  TTasksForm = class(TForm)
    Query: TADOQuery;
    DataSource: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    UserSetQ: TADOQuery;
    UserSetDS: TDataSource;
    ActionQ: TADOQuery;
    ActionDS: TDataSource;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1GUID: TcxGridDBColumn;
    cxGridDBTableView1ActionGUID: TcxGridDBColumn;
    cxGridDBTableView1DateStart: TcxGridDBColumn;
    cxGridDBTableView1DateFinish: TcxGridDBColumn;
    cxGridDBTableView1DateComplete: TcxGridDBColumn;
    cxGridDBTableView1Priority: TcxGridDBColumn;
    cxGridDBTableView1Comment: TcxGridDBColumn;
    cxGridDBTableView1UserSetterID: TcxGridDBColumn;
    cxGridDBTableView1UserGetterID: TcxGridDBColumn;
    UserGetQ: TADOQuery;
    UserGetDS: TDataSource;
    TabSet1: TTabSet;
    cxGridDBTableView1BudgetGUID: TcxGridDBColumn;
    BudgetQ: TADOQuery;
    BudgetDS: TDataSource;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxButton2: TcxButton;
    SendMailButton: TcxButton;
    cxGridDBTableView1StateOptionIndex: TcxGridDBColumn;
    StatusImages: TcxImageList;
    NewTaskBtn: TcxButton;
    FilterBtn: TcxButton;
    FilterMenu: TPopupActionBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure cxButton1Click(Sender: TObject);
    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QueryAfterPost(DataSet: TDataSet);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure QueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton8Click(Sender: TObject);
    procedure ImageButton9Click(Sender: TObject);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure SendMailButtonClick(Sender: TObject);
    procedure NewTaskBtnClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: integer = 0);
      procedure TabChange(NewTab: Integer);
    { Private declarations }

    procedure CheckAccess;

    procedure ColorTaskRecord(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; RL: RecordLights);
  public
    { Public declarations }
    RL: RecordLights;
    procedure RefreshData;
    procedure SendMail;
    procedure FilterActivate(FilterText: string);
  end;

var
  TasksForm: TTasksForm;
function ShowTasks(Options: CreateOptionsTask; WithID: Integer): integer;

implementation

uses Main, routines, NewTask;
{$R *.dfm}

procedure TTasksForm.RefreshData;
begin
  try
    OpenQ(UserSetQ, 'exec UsersShow ', False);
    OpenQ(UserGetQ, 'exec UsersShow ', False);
    OpenQ(ActionQ, 'exec ActionsShow 0', False);
    OpenQ(BudgetQ, 'exec BudgetsToContractShow ', False);
  except
  end;
end;

procedure TTasksForm.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  TabChange(NewTab);
end;

procedure TTasksForm.TabChange(NewTab: Integer);
begin
  if NewTab = 0 then
    begin
      RefreshData;
      try
        Query.Close;
        Query.SQL.Text := 'exec TasksShow :UserID, 1';
        Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
        Query.Open;

        cxGridDBTableView1BudgetGUID.Options.Editing := False;
        cxGridDBTableView1ActionGUID.Options.Editing := False;
        cxGridDBTableView1DateStart.Options.Editing := False;
        cxGridDBTableView1DateFinish.Options.Editing := False;
        cxGridDBTableView1Priority.Options.Editing := False;
        cxGridDBTableView1Comment.Options.Editing := False;
        cxGridDBTableView1UserGetterID.Visible := False;
        cxGridDBTableView1UserGetterID.VisibleForCustomization := False;
        cxGridDBTableView1UserSetterID.Options.Editing := False;
        cxGridDBTableView1DateComplete.Options.Editing := True;
        cxGridDBTableView1UserSetterID.Visible := True;
        cxGridDBTableView1UserSetterID.VisibleForCustomization := True;
        cxGridDBTableView1.OptionsData.Deleting := False;
        cxGridDBTableView1.OptionsData.Inserting := False;
        cxGridDBTableView1.OptionsData.Editing := False;
        cxGridDBTableView1.NewItemRow.Visible := False;
        SendMailButton.Visible := False;
        NewTaskBtn.Visible := False;

      except
      end;
    end else
        begin
      RefreshData;
      try
        Query.Close;
        Query.SQL.Text := 'exec TasksShow :UserID, 0';
        Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
        Query.Open;

        cxGridDBTableView1BudgetGUID.Options.Editing := True;
        cxGridDBTableView1ActionGUID.Options.Editing := True;
        cxGridDBTableView1DateStart.Options.Editing := True;
        cxGridDBTableView1DateFinish.Options.Editing := True;
        cxGridDBTableView1Priority.Options.Editing := True;
        cxGridDBTableView1Comment.Options.Editing := True;
        cxGridDBTableView1UserSetterID.Visible := False;
        cxGridDBTableView1UserSetterID.VisibleForCustomization := False;
        cxGridDBTableView1UserGetterID.Visible := True;
        cxGridDBTableView1UserGetterID.VisibleForCustomization := True;
        cxGridDBTableView1UserGetterID.Options.Editing := True;
        cxGridDBTableView1DateComplete.Options.Editing := False;
        cxGridDBTableView1.OptionsData.Deleting := True;
        cxGridDBTableView1.OptionsData.Inserting := True;
        cxGridDBTableView1.OptionsData.Editing := False;
        cxGridDBTableView1.NewItemRow.Visible := False;
        SendMailButton.Visible := True;
        NewTaskBtn.Visible := True;
      except
      end;
        end;
  if FilterBtn.Caption = 'Все' then
    begin
      FilterActivate('');
    end;
  if FilterBtn.Caption = 'Новые' then
    begin
      FilterActivate('StateOptionIndex = 3 or StateOptionIndex = 5 or StateOptionIndex = 7');
    end;
  if FilterBtn.Caption = 'Не вып-ые' then
    begin
      FilterActivate('StateOptionIndex <> 2');
    end;
end;

function ShowTasks(Options: CreateOptionsTask; WithID: Integer): integer;
begin
  Result := -1;
  try
    if TasksForm = nil then
      begin
        Application.CreateForm(TTasksForm, TasksForm);
        TasksForm.Caption := Options.FormCaption;
      end;
    TasksForm.Show;
    if WithID > 0 then
      begin
        TasksForm.TabSet1.TabIndex := 0;
        TasksForm.Query.Locate('ID', WithID, [loCaseInsensitive]);
      end;
    Result := 1;
  except
    TasksForm.Free;
    TasksForm := nil;
  end;
end;

procedure TTasksForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGridDBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TTasksForm.btnWordWrapClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.CellAutoHeight :=
    not(cxGridDBTableView1.optionsView.CellAutoHeight);
end;

procedure TTasksForm.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: integer = 0);
var
  i: integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TTasksForm.cxButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid2, Caption);
end;

procedure TTasksForm.cxButton2Click(Sender: TObject);
begin
  if Query.RecordCount > 0 then
    if not VarIsNull(Query.FieldByName('GUID').AsVariant) then
      begin
        MainForm.StartWithParamCode('', Query.FieldByName('GUID').AsString);
        MainForm.TaskGUID := Query.FieldByName('GUID').AsString;
      end;
end;

procedure TTasksForm.ColorTaskRecord(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; RL: RecordLights);
begin
      if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 3) or
         (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 5) or
         (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 7)
      then
        begin
          ACanvas.Font.Style := [fsBold];
        end;
      if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 2) or
         (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 4) or
         (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 6) or
         (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('StateOptionIndex').Index] = 8)
      then
        begin
          ACanvas.Font.Style := [];
        end;
  ACanvas.FillRect(AViewInfo.Bounds);
end;

procedure TTasksForm.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
  ColorTaskRecord(Sender, ACanvas, AViewInfo, RL);
end;

procedure TTasksForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGridDBTableView1.Controller.FocusedColumnIndex = cxGridDBTableView1.VisibleColumnCount-1) then
    begin
      if (Query.State = dsEdit) or (Query.State = dsInsert) then
        begin
          Query.Post;
          cxGridDBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TTasksForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGridDBTableView1.Controller.FocusedColumnIndex = cxGridDBTableView1.VisibleColumnCount-1) then
    begin
      if (Query.State = dsEdit) or (Query.State = dsInsert) then
        begin
          Query.Post;
          cxGridDBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TTasksForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TTasksForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TTasksForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  TabChange(0);
  CheckAccess;
end;

procedure TTasksForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TTasksForm.ImageButton8Click(Sender: TObject);
begin
  cxGridDBTableView1.BeginUpdate;
  with cxGridDBTableView1.Styles do
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
  cxGridDBTableView1.EndUpdate;
end;

procedure TTasksForm.ImageButton9Click(Sender: TObject);
begin
  cxGridDBTableView1.BeginUpdate;
  with cxGridDBTableView1.Styles do
    begin
      with cxGridDBTableView1.Styles do
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
  cxGridDBTableView1.EndUpdate;
end;

procedure TTasksForm.FilterActivate(FilterText: string);
begin
   Query.Filtered := False;
   if FilterText <> '' then
     begin
       Query.Filter := FilterText;
       Query.Filtered := True;
     end;
end;

procedure TTasksForm.N1Click(Sender: TObject);
begin
  FilterBtn.Caption := 'Все';
  FilterActivate('');
end;

procedure TTasksForm.N2Click(Sender: TObject);
begin
  FilterBtn.Caption := 'Новые';
  FilterActivate('StateOptionIndex = 3 or StateOptionIndex = 5 or StateOptionIndex = 7');
end;

procedure TTasksForm.N3Click(Sender: TObject);
begin
  FilterBtn.Caption := 'Не вып-ые';
  FilterActivate('StateOptionIndex <> 2');
end;

procedure TTasksForm.NewTaskBtnClick(Sender: TObject);
begin
  NewTaskForm.ShowModal;
end;

procedure TTasksForm.SendMail;
begin
  try
    OpenParamsQ(MainForm.Query, 'exec SendTaskToMail :TaskID', [Query.FieldByName('ID').AsInteger]);
    if MainForm.Query.Fields[0].AsString <> '' then
      MessageDlg(MainForm.Query.Fields[0].AsString, mtWarning, [mbOK], 0);
  except
  end;
end;

procedure TTasksForm.SendMailButtonClick(Sender: TObject);
begin
  SendMail;
end;

procedure TTasksForm.QueryAfterPost(DataSet: TDataSet);
begin
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
end;

procedure TTasksForm.QueryBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
  Query.FieldByName('UserSetterID').AsVariant := MainForm.UserID;
end;

procedure TTasksForm.QueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

procedure TTasksForm.CheckAccess;
begin
  try
    MainForm.PermQ.Filtered := False;
    MainForm.PermQ.Filter := 'ActionName = ' + #39 + 'ActTaskOut' + #39;
    MainForm.PermQ.Filtered := True;
    if MainForm.PermQ.RecordCount > 0 then
      if MainForm.PermQ.FieldByName('Permissions').AsString = 'True' then
        begin
          //TabSet1.Tabs.Delete(1);
        end else
        begin
          TabSet1.Tabs.Delete(1);
        end;

    MainForm.PermQ.Filtered := False;
    MainForm.PermQ.Filter := 'ActionName = ' + #39 + 'ActExecuteTask' + #39;
    MainForm.PermQ.Filtered := True;
    if MainForm.PermQ.RecordCount > 0 then
      begin
        if MainForm.PermQ.FieldByName('Permissions').AsString = 'True' then
          begin
            MainForm.ActExecuteTask.Visible := True;
          end else
          begin
            MainForm.ActExecuteTask.Visible := False;
          end;
      end else MainForm.ActExecuteTask.Visible := False;
  except
  end;
end;

end.
