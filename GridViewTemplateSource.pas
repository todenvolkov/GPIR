unit GridViewTemplateSource;

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
  cxButtonEdit, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, cxDBLookupComboBox, cxDropDownEdit, cxGridExportLink ,ShellApi, ImageButton,
  cxGridDBDataDefinitions, cxVariants, cxLookupDBGrid, cxRichEdit, cxMemo, Common;
  //cxExport, cxXLSExport, dxXLSXExport

type
  TGridVewTemplateFormSource = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    LeftSplitter: TcxSplitter;
    RightSplitter: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1TABLE_NAME: TcxGridDBColumn;
    cxGrid3DBTableView1TABLE_DESCRIPTION: TcxGridDBColumn;
    cxGrid3DBTableView1CorrespondingForm: TcxGridDBColumn;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxStyleRepository1: TcxStyleRepository;
    dxGridReportLinkStyleSheet1: TdxGridReportLinkStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton6: TImageButton;
    ImageButton7: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    Panel6: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    ImageButton2: TImageButton;

    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnDecreaseFontClick(Sender: TObject);
    procedure btnIncreaseFontClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure btnRightColumnToggleClick(Sender: TObject);
    procedure btnLeftColumnToggleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
      procedure Appmessage(var Msg: TMsg; var Handled: Boolean);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImageButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: Integer = 0);
      function GetTrueCaption(C: string): string;
      procedure CheckAccess;
    { Private declarations }
  public
    { Public declarations }
    RL: RecordLights;
    ContractStart, ContractFinish: TDate;
    HistoryShow: Boolean;
  end;

var
  GridVewTemplateFormSource: TGridVewTemplateFormSource;

implementation

uses Main, routines, TreeUnit, Budgets;

{$R *.dfm}
procedure TGridVewTemplateFormSource.Appmessage(var Msg: TMsg; var Handled: Boolean);
begin
 if (MSg.message=WM_MOUSEWHEEL) then    // Отключаем прокрутку колесом в выпадающих списках
   begin
      if (Screen.ActiveControl is TcxCustomComboboxInnerEdit) then
          Handled := true
      else
          handled:=false;
   end;

end;


procedure TGridVewTemplateFormSource.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: Integer = 0);
var
  i: Integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TGridVewTemplateFormSource.cxButton1Click(Sender: TObject);
var filename:string;
begin
  FileName:=RndFileName;
  FileName:=filename+'_'+FormatDateTime('dd-mm-yyyy-hh-nn-ss',now);
  ExportGridToExcel(filename,cxGrid1,true,true,true,'xls');
   ShellExecute(Handle,
                  'OPEN',
                  PChar('explorer.exe'),
                  PChar('/select, "' + GetCurrentDir+'\'+FileName+'.xls'+ '"'),
                  nil,
                  SW_NORMAL) ;



end;

procedure TGridVewTemplateFormSource.cxButton2Click(Sender: TObject);
begin
   dxComponentPrinter1Link1.Preview(true);

end;

procedure TGridVewTemplateFormSource.cxGrid1DBTableView1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TGridVewTemplateFormSource.cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (ADOQuery1.State = dsEdit) or (ADOQuery1.State = dsInsert) then
        begin
          ADOQuery1.Post;
          cxGrid1DBTableView1.Controller.GoToNext(False);
        end;
    end;
end;

procedure TGridVewTemplateFormSource.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1.VisibleColumnCount-1) then
    begin
      if (ADOQuery1.State = dsEdit) or (ADOQuery1.State = dsInsert) then ADOQuery1.Post;
    end;
end;

procedure TGridVewTemplateFormSource.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TGridVewTemplateFormSource.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //cxPropertiesStore1.StoreTo(true);
  GridVewTemplateFormSource := nil;
  Sender := nil;
end;

procedure TGridVewTemplateFormSource.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  LeftSplitter.CloseSplitter;
  RightSplitter.CloseSplitter;
//  self.Top:=MainForm.top+MainForm.Height+5;
//  self.Height:=Screen.Height-20-self.Top;
//  self.Left:=TreeForm.Left+TreeForm.Width;
//  self.Width:=Screen.Width-self.Left-5;
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  for I := 0 to cxGrid1DBTableView1.ColumnCount-1 do  // Пройдемся по всем колонкам основного грида
    begin
        if cxGrid1DBTableView1.Columns[i].PropertiesClassName='TcxLookupComboBoxProperties'  then   // Если это выпадашка - то установим ее параметры
          begin
             cxGrid1DBTableView1.Columns[i].BestFitMaxWidth:=400;
             with   (cxGrid1DBTableView1.Columns[i].Properties as TcxLookupComboBoxProperties) do
              begin
                DropDownSizeable:=true;
                DropDownListStyle:=lsFixedList;
                DropDownWidth:=400;
                PostPopupValueOnTab:=true;
                ShowHint:=true;
                //DropDownAutoSize:=true;

            end;
           end;
    end;

  Application.OnMessage := AppMessage;
  HistoryShow := False;
end;

procedure TGridVewTemplateFormSource.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  CheckAccess;
  ChangeKeyboardLang('Ru');
  TopSplitter.CloseSplitter;
  MainForm.GetBudgetInfo;
  if not(MainForm.Query.Active) then
    MainForm.Query.Open;
  if MainForm.Query.Active then
    begin
      ContractStart := MainForm.Query.FieldByName('ContractDateStart').AsDateTime;
      ContractFinish := MainForm.Query.FieldByName('ContractDateFinish').AsDateTime;

    dxStatusBar1.Panels.Items[0].Text := 'Договор: ' + MainForm.Query.FieldByName('ContractName').AsString;
    dxStatusBar1.Panels.Items[1].Text := 'Бюджет: ' + MainForm.Query.FieldByName('BudgetName').AsString;

    BudgetInfoMemo.Lines.Clear;
    BudgetInfoMemo.Lines.Add('Бюджет: ' + MainForm.Query.FieldByName('BudgetName').AsString);
    BudgetInfoMemo.Lines.Add('Версия бюджета: ' + MainForm.Query.FieldByName('Version').AsString);
    BudgetInfoMemo.Lines.Add('Договор: ' + MainForm.Query.FieldByName('ContractName').AsString);
    BudgetInfoMemo.Lines.Add('Заказчик: ' + MainForm.Query.FieldByName('OrganisationName').AsString);
    BudgetInfoMemo.Lines.Add('Дата начала: ' + MainForm.Query.FieldByName('ContractDateStart').AsString);
    BudgetInfoMemo.Lines.Add('Дата окончания: ' + MainForm.Query.FieldByName('ContractDateFinish').AsString);
    BudgetInfoMemo.Lines.Add('ГИП: ' + MainForm.Query.FieldByName('FIO').AsString);
    BudgetInfoMemo.Lines.Add('Номер: ' + MainForm.Query.FieldByName('ContractNumber').AsString);

    end
  else begin
      dxStatusBar1.Panels.Items[0].Text := 'Не определено';

      dxStatusBar1.Panels.Items[1].Text := 'Не определено';


    end;
  if not VarIsNull(GlobalBudgetGUID) then
    begin
      Caption := GetTrueCaption(Caption) + '.Локальный';
    end else Caption := GetTrueCaption(Caption) + '.Глобальный';
end;

function TGridVewTemplateFormSource.GetTrueCaption(C: string): string;
var i: Integer;
begin
  i := Pos('.',C);
  if i = 0 then Result := C
    else
    begin
      Result := Copy(C,1,i-1);
    end;
end;

procedure TGridVewTemplateFormSource.ImageButton2Click(Sender: TObject);
begin
  if HistoryShow then HistoryShow := False else HistoryShow := True;  
end;

procedure TGridVewTemplateFormSource.btnRightColumnToggleClick(Sender: TObject);
begin
  if LeftSplitter.State = ssOpened then
    LeftSplitter.CloseSplitter
  else
    LeftSplitter.OpenSplitter;
end;

procedure TGridVewTemplateFormSource.ADOQuery1AfterPost(DataSet: TDataSet);
begin
   RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;

   // говорим всем версиям бюджетов, что их нужно пересчитывать
   MainForm.Query.Close;
   MainForm.Query.SQL.Text := 'exec BudgetsSetNeedCalcUpdate :BudgetGUID';
   MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := Null;
   MainForm.Query.ExecSQL;
end;

procedure TGridVewTemplateFormSource.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
  if GlobalBudgetGUID<>Null then

  ADOQuery1.FieldByName('BudgetGUID').AsVariant := GlobalBudgetGUID;
end;

procedure TGridVewTemplateFormSource.ADOQuery1PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   DataSet.DataSource.DataSet.Close;
   DataSet.DataSource.DataSet.open;

   RL.ErrorState := True;
end;

procedure TGridVewTemplateFormSource.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TGridVewTemplateFormSource.btnDecreaseFontClick(Sender: TObject);
var
  i: Integer;
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

procedure TGridVewTemplateFormSource.btnIncreaseFontClick(Sender: TObject);
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

procedure TGridVewTemplateFormSource.btnLeftColumnToggleClick(Sender: TObject);
begin
  if RightSplitter.State = ssOpened then
    RightSplitter.CloseSplitter
  else
    RightSplitter.OpenSplitter;
end;

procedure TGridVewTemplateFormSource.btnWordWrapClick(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TGridVewTemplateFormSource.CheckAccess;
begin
  try
    MainForm.PermQ.Filtered := False;
    MainForm.PermQ.Filter := 'ActionName = ' + #39 + 'ActGlobalSprEdit' + #39;
    MainForm.PermQ.Filtered := True;
    if MainForm.PermQ.RecordCount > 0 then
      begin
        if MainForm.PermQ.FieldByName('Permissions').AsString = 'True' then
          begin
            cxGrid1DBTableView1.OptionsData.Editing := True;
          end else
          begin
            cxGrid1DBTableView1.OptionsData.Editing := False;
          end;
      end else cxGrid1DBTableView1.OptionsData.Editing := False;
  except
  end;
end;

end.
