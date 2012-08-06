unit Files;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxDBExtLookupComboBox,
  cxDBLookupComboBox, cxCurrencyEdit, cxContainer, cxRichEdit, cxTextEdit, cxMemo, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ImageButton, ExtCtrls, ADODB, PlatformDefaultStyleActnCtrls, ActnPopup, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPScxCommon;

type
  TFilesForm = class(TForm)
    Panel1: TPanel;
    ImageButton1: TImageButton;
    ImageButton4: TImageButton;
    ImageButton8: TImageButton;
    ImageButton9: TImageButton;
    ImageButton10: TImageButton;
    ImageButton11: TImageButton;
    BudgetPanel: TPanel;
    FilesAll: TcxButton;
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
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    UploadFile: TcxButton;
    WorkDS: TDataSource;
    WorkQ: TADOQuery;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1FileName: TcxGridDBColumn;
    cxGrid1DBTableView1FileExt: TcxGridDBColumn;
    cxGrid1DBTableView1FileType: TcxGridDBColumn;
    cxGrid1DBTableView1FileSize: TcxGridDBColumn;
    cxGrid1DBTableView1DateChange: TcxGridDBColumn;
    cxGrid1DBTableView1UserChangeID: TcxGridDBColumn;
    cxGrid1DBTableView1ContractID: TcxGridDBColumn;
    DownloadFile: TcxButton;
    DropDownMenu: TPopupActionBar;
    N12: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    N1: TMenuItem;
    FilesAccounting: TcxButton;
    sprMenu: TPopupActionBar;
    N2: TMenuItem;
    N11: TMenuItem;
    FilesKAS1: TMenuItem;
    FilesKAS2: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FilesAllClick(Sender: TObject);
    procedure UploadFileClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ImageButton11Click(Sender: TObject);
    procedure ImageButton10Click(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure ImageButton1Click(Sender: TObject);
    procedure ImageButton8Click(Sender: TObject);
    procedure ImageButton9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ButtonDownName: string;
    procedure RefreshData;
    procedure ShowFiles(Caption: string);
    procedure FileToBase(FileName, FileType: string);
    procedure FileFromBase;
    function SizeFile(s: string): int64;
  end;

var
  FilesForm: TFilesForm;

implementation
 uses Main, routines, XLS1CImport, XLSImportUnit;
{$R *.dfm}

procedure TFilesForm.FilesAllClick(Sender: TObject);
begin
    ShowFiles(TcxButton(Sender).Caption);
end;

procedure TFilesForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TFilesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TFilesForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  FilesAll.Click;
  TopSplitter.CloseSplitter;
end;

procedure TFilesForm.ImageButton10Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView1.optionsView.CellAutoHeight);
end;

procedure TFilesForm.ImageButton11Click(Sender: TObject);
begin
  cxGrid1DBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TFilesForm.ImageButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid1, Caption);
end;

procedure TFilesForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TFilesForm.ImageButton8Click(Sender: TObject);
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

procedure TFilesForm.ImageButton9Click(Sender: TObject);
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

procedure TFilesForm.N11Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.N12Click(Sender: TObject);
begin
  XLS1CImportForm.Operation := '1C';
  XLS1CImportForm.Show;
  XLS1CImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N13Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.N14Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.N15Click(Sender: TObject);
begin
  XLS1CImportForm.Operation := '1CTotal';
  XLS1CImportForm.Show;
  XLS1CImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N16Click(Sender: TObject);
begin
  XLS1CImportForm.Operation := 'KASTotal';
  XLS1CImportForm.Show;
  XLS1CImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N1Click(Sender: TObject);
begin
  XLSImportForm.Show;
  XLSImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N2Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.N3Click(Sender: TObject);
begin
  XLS1CImportForm.Operation := 'KASAccepted';
  XLS1CImportForm.Show;
  XLS1CImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N4Click(Sender: TObject);
begin
  XLS1CImportForm.Operation := 'KASRealized';
  XLS1CImportForm.Show;
  XLS1CImportForm.OpenBtn.Click;
end;

procedure TFilesForm.N5Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.N6Click(Sender: TObject);
begin
  ShowFiles(TMenuItem(Sender).Caption);
end;

procedure TFilesForm.RefreshData;
begin
  try
//
//    OpenQ(DepartmentQ, 'exec DepartmentsShow ' + VariantAsString(GlobalBudgetGUID), False);
//    OpenQ(UnitMeasureQ, 'exec UnitsMeasureShow ' + VariantAsString(GlobalBudgetGUID), False);
//    OpenQ(StageQ, 'exec StagesShow ' + IntToStr(GlobalContractID), False);
//    OpenQ(TypesWorkQ, 'exec TypesWorkShow ' + VariantAsString(GlobalBudgetGUID), False);
//    OpenQ(OrganisationQ, 'exec OrganizationsShow ' + VariantAsString(GlobalBudgetGUID), False);
  except
  end;
end;

procedure TFilesForm.ShowFiles(Caption: string);
begin
    ButtonDownName := Caption;
    RefreshData;
  try
    WorkQ.Close;
    WorkQ.SQL.Text := 'exec FilesShow :ContractID, :FileType';
    WorkQ.Parameters.ParamByName('ContractID').Value := Null;
    WorkQ.Parameters.ParamByName('FileType').Value := Caption;
    WorkQ.Open;
  except
  end;
end;

procedure TFilesForm.UploadFileClick(Sender: TObject);
begin
  FileFromBase;
end;


function TFilesForm.SizeFile(s: string): int64;
var
  SearchRec : _WIN32_FIND_DATAW;
begin
  if FileExists(s) then begin
      FindFirstFile(pchar(s), SearchRec);
      result := SearchRec.nFileSizeHigh;
      result := result shl 32;
      result := result + SearchRec.nFileSizeLow
  end
  else
    result := -1;
end;

procedure TFilesForm.FileToBase(FileName, FileType: string);
var ShortName, Ext: string;
    FileSizeInBytes: Integer;
begin
  try
    if FileName <> '' then
      if FileExists(FileName) then
        begin
          try
            FileSizeInBytes := SizeFile(FileName);
          except
            FileSizeInBytes := 0;
          end;

          ShortName := Copy(ExtractFileName(FileName),1,(LastDelimiter(Chr(46),
                             ExtractFileName(FileName))-1));
          Ext := ExtractFileExt(ExtractFileName(FileName));

          MainForm.Query.SQL.Text := 'exec FilesAdd :FILENAME, :FileExt, :FileType, :FileSize, :FileBody, :DateChange, :UserChangeID, :ContractID';
          MainForm.Query.Parameters.ParamByName('FILENAME').Value := ShortName;
          MainForm.Query.Parameters.ParamByName('FileExt').Value := Ext;
          MainForm.Query.Parameters.ParamByName('FileType').Value := FileType;
          MainForm.Query.Parameters.ParamByName('FileSize').Value := FileSizeInBytes;
          MainForm.Query.Parameters.ParamByName('FileBody').LoadFromFile(FileName, ftBlob);
          MainForm.Query.Parameters.ParamByName('DateChange').Value := Null;
          MainForm.Query.Parameters.ParamByName('UserChangeID').Value := MainForm.UserID;
          MainForm.Query.Parameters.ParamByName('ContractID').Value := Null;
          MainForm.Query.ExecSQL;
        end;
  except

  end;
end;

procedure TFilesForm.FileFromBase;
var BlobStream: TADOBlobStream;
    CurDir: string;
begin
  try
    MainForm.Query.SQL.Text := 'exec FilesGetFile :FileID';
    MainForm.Query.Parameters.ParamByName('FileID').Value := WorkQ.FieldByName('ID').AsInteger;
    MainForm.Query.Open;

    BlobStream := TADOBlobStream.Create(TBlobField(MainForm.Query.FieldByName('FileBody')), bmRead);
    try
      CurDir := GetCurrentDir;
      BlobStream.SaveToFile(CurDir + '\' + MainForm.Query.FieldByName('FileName').AsString + MainForm.Query.FieldByName('FileExt').AsString);
    finally
      BlobStream.Free;
    end;
  except
  end;
end;

end.
