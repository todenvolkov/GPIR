unit Users;

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
  cxButtonEdit, cxDBLookupComboBox, cxCheckBox, cxDropDownEdit, ImageButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, TreeUnit,
  Common;


type
  CreateOptionsUser = record
    FormCaption: string;
end;

type
  TUsersForm = class(TForm)
    Query: TADOQuery;
    DataSource: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1GUID: TcxGridDBColumn;
    cxGridDBTableView1UserName: TcxGridDBColumn;
    cxGridDBTableView1LOGIN: TcxGridDBColumn;
    cxGridDBTableView1PASSWORD: TcxGridDBColumn;
    cxGridDBTableView1GroupName: TcxGridDBColumn;
    cxGridDBTableView1LastLoginTime: TcxGridDBColumn;
    cxGridDBTableView1WindowsAccount: TcxGridDBColumn;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    ActionToUserQ: TADOQuery;
    ActionToUserDS: TDataSource;
    cxGridDBTableView2ID: TcxGridDBColumn;
    cxGridDBTableView2GUID: TcxGridDBColumn;
    cxGridDBTableView2ActionGUID: TcxGridDBColumn;
    cxGridDBTableView2UserID: TcxGridDBColumn;
    cxGridDBTableView2Permissions: TcxGridDBColumn;
    ActionsQ: TADOQuery;
    ActionsDS: TDataSource;
    RightSplitter: TcxSplitter;
    cxGridDBTableView1CalcType: TcxGridDBColumn;
    ImageButton8: TImageButton;
    ImageButton11: TImageButton;
    ImageButton10: TImageButton;
    ImageButton4: TImageButton;
    ImageButton9: TImageButton;
    ImageButton3: TImageButton;
    ImageButton1: TImageButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxGridDBTableView1Email: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
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
    procedure ActionToUserQBeforePost(DataSet: TDataSet);
    procedure cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ActionToUserQAfterPost(DataSet: TDataSet);
    procedure ImageButton3Click(Sender: TObject);
    procedure ImageButton4Click(Sender: TObject);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    procedure ChangeFontSize(S: TcxGridTableViewStyles;
      SizeDifference: integer = 0);
    { Private declarations }
    procedure RefreshData;
  public
    { Public declarations }
    RL: RecordLights;
  end;

var
  UsersForm: TUsersForm;
function ShowUsers(Options: CreateOptionsUser): integer;

implementation

uses Main, routines;
{$R *.dfm}

function ShowUsers(Options: CreateOptionsUser): integer;
begin
  Result := -1;
  try
    Application.CreateForm(TUsersForm, UsersForm);
    UsersForm.Caption := Options.FormCaption;
    UsersForm.Show;
    Result := 1;
  except
    UsersForm.Free;
    UsersForm := nil;
  end;
end;

procedure TUsersForm.RefreshData;
begin
  try
    OpenQ(ActionsQ, 'exec ActionsShow', False);
    //OpenQ(OrganisationQ, 'exec OrganizationsShow', False);
  except
  end;
end;

procedure TUsersForm.ActionToUserQAfterPost(DataSet: TDataSet);
begin
  //MainForm.DoActualInterface;
end;

procedure TUsersForm.ActionToUserQBeforePost(DataSet: TDataSet);
begin
  ActionToUserQ.FieldByName('UserID').Value := Query.FieldByName('ID').AsInteger;
end;

procedure TUsersForm.btnColumnAutoWidthClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.ColumnAutoWidth :=
    not(cxGridDBTableView1.optionsView.ColumnAutoWidth);
end;

procedure TUsersForm.btnDecreaseFontClick(Sender: TObject);
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

procedure TUsersForm.btnIncreaseFontClick(Sender: TObject);
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

procedure TUsersForm.btnWordWrapClick(Sender: TObject);
begin
  cxGridDBTableView1.optionsView.CellAutoHeight :=
    not(cxGridDBTableView1.optionsView.CellAutoHeight);
end;

procedure TUsersForm.ChangeFontSize(S: TcxGridTableViewStyles;
  SizeDifference: integer = 0);
var
  i: integer;
begin
  for i := 0 to S.Count - 1 do
    begin
      S.Values[i].Font.size := S.Values[i].Font.size + SizeDifference;
    end;
end;

procedure TUsersForm.cxButton1Click(Sender: TObject);
begin
  MainForm.UploadToExcel(cxGrid2, Caption);
end;

procedure TUsersForm.cxButton2Click(Sender: TObject);
begin
  messagedlg('Печать', mtConfirmation, [mbYes], 0);
end;

procedure TUsersForm.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ColorRecordByState(Sender, ACanvas, AViewInfo, RL);
end;

procedure TUsersForm.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
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

procedure TUsersForm.cxGridDBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  try
    if Query.Active then
      begin
        ActionToUserQ.Close;
        ActionToUserQ.SQL.Text := 'exec UserPermissionsShow :UserID';
        ActionToUserQ.Parameters.ParseSQL(ActionToUserQ.SQL.Text, True);
        ActionToUserQ.Parameters.ParamByName('UserID').Value := Query.FieldByName('ID').AsVariant;
        ActionToUserQ.Open;
       end;
  except
  end;
end;

procedure TUsersForm.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TUsersForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TUsersForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  //PropertiesStore.StoreTo(true);
end;

procedure TUsersForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  SetPositionForm(Point(TreeForm.Width + 5, MainForm.Height + 5),TForm(Sender));
  RefreshData;
  try
    Query.Close;
    Query.SQL.Text := 'exec UsersShow';
    Query.Open;
  except

  end;
end;

procedure TUsersForm.ImageButton3Click(Sender: TObject);
begin
  if RightSplitter.State = ssOpened then
    RightSplitter.CloseSplitter
  else
    RightSplitter.OpenSplitter;
end;

procedure TUsersForm.ImageButton4Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.Preview(true);
end;

procedure TUsersForm.QueryAfterPost(DataSet: TDataSet);
begin
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
  // актуализируем спискок доступных экшенов для пользователя
  try
    MainForm.Query.Close;
    MainForm.Query.SQL.Text := 'exec UserPermissionsActualize :UserID';
    MainForm.Query.Parameters.ParamByName('UserID').Value := DataSet.FieldByName('ID').AsInteger;
    MainForm.Query.ExecSQL;
  except

  end;
end;

procedure TUsersForm.QueryBeforePost(DataSet: TDataSet);
begin
  RL.ErrorState := False;
  RL.ErrorControl := true;
end;

procedure TUsersForm.QueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.DataSource.DataSet.Close;
  DataSet.DataSource.DataSet.Open;
  RL.ErrorState := true;
end;

end.
