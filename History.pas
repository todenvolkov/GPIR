unit History;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer,
  cxRichEdit, cxTextEdit, cxMemo, cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, ImageButton, ExtCtrls, ADODB, Menus, PlatformDefaultStyleActnCtrls, ActnPopup,
  dxPSCore, dxPScxCommon, StdCtrls, cxButtons;

type
  THistoryForm = class(TForm)
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    DropDownMenu: TPopupActionBar;
    N12: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    WorkDS: TDataSource;
    WorkQ: TADOQuery;
    Panel1: TPanel;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    BudgetPanel: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1DateChange: TcxGridDBColumn;
    cxGrid1DBTableView1UserChangeID: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentName: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionName: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    cxGrid1DBTableView1HistoryID: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView1Version: TcxGridDBColumn;
    cxGrid1DBTableView1ObjectName: TcxGridDBColumn;
    cxGrid1DBTableView1Charact: TcxGridDBColumn;
    cxGrid1DBTableView1IntelliRecordState: TcxGridDBColumn;
    Search: TcxTextEdit;
    SearchBtn: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure ImageButton8Click(Sender: TObject);
    procedure ImageButton9Click(Sender: TObject);
    procedure ImageButton10Click(Sender: TObject);
    procedure ImageButton11Click(Sender: TObject);
    procedure SearchDblClick(Sender: TObject);
    procedure SearchKeyPress(Sender: TObject; var Key: Char);
    procedure SearchBtnClick(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoryForm: THistoryForm;

implementation
   uses Main, routines, TreeUnit;
{$R *.dfm}

procedure THistoryForm.cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
begin
  Caption := 'Журнал ' + '(Кол-во записей: ' + IntToStr(cxGrid1DBTableView1.ViewData.RecordCount) + ')';
end;

procedure THistoryForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure THistoryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure THistoryForm.FormShow(Sender: TObject);
begin
  try
   MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
   SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
   TopSplitter.CloseSplitter;
   WorkQ.Close;
   WorkQ.SQL.Text := 'exec HistoryShow';
   WorkQ.Open;
   Caption := 'Журнал ' + '(Кол-во записей: ' + IntToStr(cxGrid1DBTableView1.ViewData.RecordCount) + ')'
  except
  end;
end;

procedure THistoryForm.ImageButton10Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure THistoryForm.ImageButton11Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure THistoryForm.ImageButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption);
end;

procedure THistoryForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure THistoryForm.ImageButton8Click(Sender: TObject);
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

procedure THistoryForm.ImageButton9Click(Sender: TObject);
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

procedure THistoryForm.SearchBtnClick(Sender: TObject);
begin
  MainForm.SetFilter(cxGrid1DBTableView1, Search.Text);
end;

procedure THistoryForm.SearchDblClick(Sender: TObject);
begin
  if Search.Text <> '' then MainForm.SetFilter(cxGrid1DBTableView1, Search.Text);
end;

procedure THistoryForm.SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  if Search.Text <> '' then MainForm.SetFilter(cxGrid1DBTableView1, Search.Text);
end;

end.
