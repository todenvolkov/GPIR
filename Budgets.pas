unit Budgets;

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
  cxButtonEdit, cxCurrencyEdit, ImageButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, routines, TreeUnit, cxGridExportLink, ShellAPI, Common,
  PlatformDefaultStyleActnCtrls, ActnPopup;

type
  CreateOptionsBudgets = record
    FormCaption: string;
end;

type
  TBudgetsForm = class(TForm)
    BudgetsQ: TADOQuery;
    BudgetsDS: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    LeftSplitter: TcxSplitter;
    btnAddBudgetVersion: TcxButton;
    ContractsDS: TDataSource;
    ContractsQ: TADOQuery;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    ContractName: TcxGridDBColumn;
    ContractCode: TcxGridDBColumn;
    BudgetName: TcxGridDBColumn;
    Version: TcxGridDBColumn;
    DateChange: TcxGridDBColumn;
    UsernameChange: TcxGridDBColumn;
    ID: TcxGridDBColumn;
    cxGrid1DBTableView1Comment: TcxGridDBColumn;
    cxGrid1DBTableView1Price: TcxGridDBColumn;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxButton4: TcxButton;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1CodeNumber: TcxGridDBColumn;
    cxGrid1DBTableView1CounterpartName: TcxGridDBColumn;
    cxGrid1DBTableView1DateStart: TcxGridDBColumn;
    cxGrid1DBTableView1DateFinish: TcxGridDBColumn;
    ImageButton2: TImageButton;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxButton1: TcxButton;
    cxGrid1DBTableView1State: TcxGridDBColumn;
    BudgetMenu: TPopupActionBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cxButton2: TcxButton;
    N4: TMenuItem;
    cxGrid1DBTableView1NumbersContractsExt: TcxGridDBColumn;
    cxGrid1DBTableView1Nomenclature1C: TcxGridDBColumn;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure btnRightColumnToggleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid3DBTableView1FocusedRecordChanged
      (Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure BudgetsQBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnIncreaseFontClick(Sender: TObject);
    procedure btnDecreaseFontClick(Sender: TObject);
    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BudgetsQAfterPost(DataSet: TDataSet);
    procedure BudgetsQPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BudgetsQAfterInsert(DataSet: TDataSet);
    procedure BudgetsQAfterEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImageButton2Click(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: integer = 0);

    { Private declarations }
  public
    { Public declarations }
    State: Integer;
    RL: RecordLights;
    Bookmark: TBookmark;
  end;

var
  BudgetsForm: TBudgetsForm;
function ShowBudgets(Options: CreateOptionsBudgets; WithContractID, WithBudgetID: Integer): integer;

implementation

uses Main, ArticleToBudget;
{$R *.dfm}

function ShowBudgets(Options: CreateOptionsBudgets; WithContractID, WithBudgetID: Integer): integer;
begin
  Result := -1;
  try
    Application.CreateForm(TBudgetsForm, BudgetsForm);
    BudgetsForm.Caption := Options.FormCaption;
    BudgetsForm.Show;
    if (WithContractID > 0) and (WithBudgetID > 0) then
      begin
        BudgetsForm.ContractsQ.Locate('ID', WithContractID, [loCaseInsensitive]);
        BudgetsForm.BudgetsQ.Locate('ID', WithBudgetID, [loCaseInsensitive]);
      end;
    Result := 1;
  except
    BudgetsForm.Free;
    BudgetsForm := nil;
  end;
end;

procedure TBudgetsForm.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: integer = 0);
var
  i: integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TBudgetsForm.cxButton3Click(Sender: TObject);
begin
  messagedlg('Печать', mtConfirmation, [mbYes], 0);
end;

procedure TBudgetsForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TBudgetsForm.cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (BudgetsQ.State = dsEdit) or (BudgetsQ.State = dsInsert) then
        begin
          BudgetsQ.Post;
          cxGrid1DBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TBudgetsForm.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    begin
      if BudgetsQ.Active then
      if BudgetsQ.RecordCount > 0 then
      if MessageDlg('Удалить?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          try
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec BudgetDelete :BudgetGUID';
            MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
            MainForm.Query.ExecSQL;
            if ContractsQ.Active then
              begin
                BudgetsQ.Close;
                BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
                BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value :=
                ContractsQ.FieldByName('ID').AsInteger;
                BudgetsQ.Open;
              end;
          except on E: Exception do
          end;
        end;
    end;

  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (BudgetsQ.State = dsEdit) or (BudgetsQ.State = dsInsert) then
        begin
          BudgetsQ.Post;
          cxGrid1DBTableView1.Controller.GoToNext(False);
        end;
    end;

end;

procedure TBudgetsForm.cxGrid3DBTableView1FocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  try
    if ContractsQ.Active then
      begin
        BudgetsQ.Close;
        BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
        BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value :=
          ContractsQ.FieldByName('ID').AsInteger;
        BudgetsQ.Open;
      end;
  except
  end;
end;

procedure TBudgetsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TBudgetsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //PropertiesStore.StoreTo(true);
end;

procedure TBudgetsForm.FormCreate(Sender: TObject);
begin

  ContractsQ.Open;
  BudgetsQ.Open;
end;

procedure TBudgetsForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));

end;

procedure TBudgetsForm.ImageButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption);
end;

procedure TBudgetsForm.ImageButton2Click(Sender: TObject);
begin
  if LeftSplitter.State = ssOpened then
    LeftSplitter.CloseSplitter
  else
    LeftSplitter.OpenSplitter;
end;

procedure TBudgetsForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TBudgetsForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
  cxGrid3DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid3DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TBudgetsForm.btnDecreaseFontClick(Sender: TObject);
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

procedure TBudgetsForm.btnIncreaseFontClick(Sender: TObject);
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

procedure TBudgetsForm.btnRightColumnToggleClick(Sender: TObject);
begin
  if LeftSplitter.State = ssOpened then
    LeftSplitter.CloseSplitter
  else
    LeftSplitter.OpenSplitter;
end;

procedure TBudgetsForm.btnWordWrapClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
  cxGrid3DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid3DBTableView1.optionsView.CellAutoHeight);
end;

procedure TBudgetsForm.BudgetsQAfterEdit(DataSet: TDataSet);
begin
  State := 1;
end;

procedure TBudgetsForm.BudgetsQAfterInsert(DataSet: TDataSet);
begin
  State := 0;
end;

procedure TBudgetsForm.BudgetsQAfterPost(DataSet: TDataSet);
begin

  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;

      try
        if State = 0 then
        if ContractsQ.Active then
          begin
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec BudgetsLastAddSetVersion :ContractID';
            MainForm.Query.Parameters.ParamByName('ContractID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsVariant;
            MainForm.Query.ExecSQL;
          end;
        if BudgetsForm.ContractsQ.Active then
          begin
           BudgetsForm.BudgetsQ.Close;
           BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
           BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
           BudgetsForm.BudgetsQ.Open;

           BudgetsForm.RL.RecordControlID := MainForm.Query.Fields[0].AsInteger;
           BudgetsForm.RL.ErrorControl := True;
        end;

      except
      end;

end;

procedure TBudgetsForm.BudgetsQBeforePost(DataSet: TDataSet);
begin
      if ContractsQ.Active then
        begin
          BudgetsQ.FieldByName('NumbersContractsID').Value := ContractsQ.FieldByName('ID').AsInteger;
          BudgetsQ.FieldByName('Price').Value := 0;
          BudgetsQ.FieldByName('State').Value := 'Открыт';
        end;
  RL.ErrorState := False;
  RL.ErrorControl := True;

  if VarIsNull(BudgetName.EditValue) then
    begin

      Abort;
    end;


end;

procedure TBudgetsForm.BudgetsQPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

end.
