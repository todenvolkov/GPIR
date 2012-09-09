unit NumbersContracts;

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
  cxButtonEdit, cxDBLookupComboBox, ImageButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, TreeUnit, Common, cxCurrencyEdit, cxDropDownEdit, cxCheckBox;

type
  CreateOptions = record
    FormCaption: string;
  end;

type
  TNumbersContractsForm = class(TForm)
    Query: TADOQuery;
    DataSource: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    EmployeeQ: TADOQuery;
    EmployeeDS: TDataSource;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1Name: TcxGridDBColumn;
    cxGridDBTableView1CodeNumber: TcxGridDBColumn;
    cxGridDBTableView1Number: TcxGridDBColumn;
    cxGridDBTableView1CodeNumber1C: TcxGridDBColumn;
    cxGridDBTableView1CounterpartName: TcxGridDBColumn;
    cxGridDBTableView1EmployeeGUID: TcxGridDBColumn;
    cxGridDBTableView1DateFinish: TcxGridDBColumn;
    cxGridDBTableView1DateStart: TcxGridDBColumn;
    OrganisationQ: TADOQuery;
    OrganisationDS: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ImageButton3: TImageButton;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxGridDBTableView1Cost: TcxGridDBColumn;
    cxGridDBTableView1CostFact: TcxGridDBColumn;
    ToArcBtn: TcxButton;
    FromArcBtn: TcxButton;
    CheckView: TcxCheckBox;
    cxGridDBTableView1RecordState: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure btnIncreaseFontClick(Sender: TObject);
    procedure btnDecreaseFontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QueryAfterPost(DataSet: TDataSet);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure QueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOQuery3BeforePost(DataSet: TDataSet);
    procedure cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ImageButton4Click(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure ADOQuery3AfterPost(DataSet: TDataSet);
    procedure CheckViewPropertiesChange(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: integer = 0);
    { Private declarations }
    procedure RefreshData;
    procedure RefreshContracts(WithSaveID: Integer);
    procedure FilterActual;
    procedure RefreshStages;
  public
    { Public declarations }
    RL: RecordLights;
  end;

var
  NumbersContractsForm: TNumbersContractsForm;
function ShowNumbersContracts(Options: CreateOptions): integer;

implementation

uses Main, routines, SQLRoutines1;
{$R *.dfm}

procedure TNumbersContractsForm.RefreshData;
begin
  try
    OpenParamsQ(EmployeeQ, 'exec EmployeesShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);
    OpenParamsQ(OrganisationQ, 'exec OrganizationsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);
  except
  end;
end;

procedure TNumbersContractsForm.RefreshContracts(WithSaveID: Integer);
var SavePlanID: Integer;
begin
  try
    SavePlanID := 0;
    if Query.Active then
      if Query.RecordCount > 0 then
        begin
          SavePlanID := Query.FieldByName('ID').AsInteger
        end;

    Query.Close;
    Query.SQL.Text := 'exec NumberContractsShow';
    Query.Open;

    if SavePlanID > 0 then
    if Query.Active then
      if Query.RecordCount > 0 then
        begin
          Query.Locate('ID', SavePlanID, []);
          if WithSaveID > 0 then ADOQuery3.Locate('ID', WithSaveID, []);
        end;
  except

  end;
end;

function ShowNumbersContracts(Options: CreateOptions): integer;
begin
  Result := -1;
  try
    Application.CreateForm(TNumbersContractsForm, NumbersContractsForm);
    NumbersContractsForm.Caption := Options.FormCaption;
    NumbersContractsForm.Show;
    Result := 1;
  except
    NumbersContractsForm.Free;
    NumbersContractsForm := nil;
  end;
end;

procedure TNumbersContractsForm.ADOQuery3AfterPost(DataSet: TDataSet);
begin
      try
        MainForm.Query.Close;
        MainForm.Query.SQL.Text := 'exec ContractUpdateSumCounts :ID';
        MainForm.Query.Parameters.ParamByName('ID').Value := ADOQuery3.FieldByName('NumbersContractsID').AsVariant;
        MainForm.Query.ExecSQL;
        RefreshContracts(ADOQuery3.FieldByName('ID').AsInteger);
      finally

      end;
end;

procedure TNumbersContractsForm.ADOQuery3BeforePost(DataSet: TDataSet);
begin
  if Query.Active = True then
    if Query.RecordCount > 0 then
      begin
        ADOQuery3.FieldByName('NumbersContractsID').AsVariant := Query.FieldByName('ID').AsVariant;
      end;
end;

procedure TNumbersContractsForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGridDBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TNumbersContractsForm.btnDecreaseFontClick(Sender: TObject);
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

procedure TNumbersContractsForm.btnIncreaseFontClick(Sender: TObject);
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

procedure TNumbersContractsForm.btnWordWrapClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.CellAutoHeight :=
    not(cxGridDBTableView1.optionsView.CellAutoHeight);
end;

procedure TNumbersContractsForm.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: integer = 0);
var
  i: integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TNumbersContractsForm.CheckViewPropertiesChange(Sender: TObject);
begin
  FilterActual;
end;

procedure TNumbersContractsForm.FilterActual;
begin
  if CheckView.Checked then
    begin
      Query.Filtered := False;
    end else
        begin
          Query.Filter := 'RecordState = ' + #39 + 'Доступен' + #39;
          Query.Filtered := True;
        end;
end;

procedure TNumbersContractsForm.cxButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid2, Caption);
end;

procedure TNumbersContractsForm.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TNumbersContractsForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
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

procedure TNumbersContractsForm.cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
   RefreshStages;
end;

procedure TNumbersContractsForm.RefreshStages;
begin
//  try
//      if Query.Active = True then
//      if Query.RecordCount > 0 then
//        begin
//          OpenParamsQ(ADOQuery3, 'exec StagesShow :ContractID ', [Query.FieldByName('ID').AsVariant]);
//        end else ADOQuery3.Close;
//  except
//  end;
end;

procedure TNumbersContractsForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    begin
      if Query.Active then
      if Query.RecordCount > 0 then
      if MessageDlg('Удалить?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          try
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec ContractDelete :ContractID';
            MainForm.Query.Parameters.ParamByName('ContractID').Value := Query.FieldByName('ID').AsInteger;
            MainForm.Query.ExecSQL;

            Query.Close;
            Query.SQL.Text := 'exec NumberContractsShow';
            Query.Open;

            FilterActual;

          except on E: Exception do
          end;
        end;
    end;
  if (Key = 13) and (cxGridDBTableView1.Controller.FocusedColumnIndex = cxGridDBTableView1.VisibleColumnCount-1) then
    begin
      if (Query.State = dsEdit) or (Query.State = dsInsert) then
        begin
          Query.Post;
          cxGridDBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TNumbersContractsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TNumbersContractsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //PropertiesStore.StoreTo(true);
end;

procedure TNumbersContractsForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  Query.Close;
  Query.Open;
  RefreshData;
end;

procedure TNumbersContractsForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TNumbersContractsForm.QueryAfterOpen(DataSet: TDataSet);
begin
  FilterActual;
  RefreshStages;
end;

procedure TNumbersContractsForm.QueryAfterPost(DataSet: TDataSet);
begin
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
 // Не вызываем пересчет дат (создание месяцев) так как оно делается в триггере
end;

procedure TNumbersContractsForm.QueryBeforePost(DataSet: TDataSet);
var exb:word;
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
   if Query.FieldByname('DateFinish').asDateTime<Query.FieldByname('DateStart').asDateTime then
     ExB:=MessageBox(handle,pchar('Вы ввели неверные даты. '+#13+
     ' Исправьте даты таким образом, чтобы дата Окончания была больше или равна дате Начала.'),pchar('Исправьте даты'),48);

end;

procedure TNumbersContractsForm.QueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

end.
