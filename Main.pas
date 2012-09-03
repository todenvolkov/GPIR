unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, PlatformDefaultStyleActnCtrls, ActnList,
  ActnMan, ComCtrls, ToolWin, DB, ADODB, ImgList, ActnCtrls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxPropertiesStore, cxLookAndFeels, cxStyles, cxGridTableView, cxClasses,
  cxGraphics, XPStyleActnCtrls, ActnMenus,
   Menus, IniFiles, cxLocalization, sprUnitOrganizations, cxButtons, ShellAPI, ActiveX, cxControls,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxGrid, cxGridExportLink, cxMemo,
  cxRichEdit, Common, ImageButton, cxGridDBTableView, cxFilter, Registry, cxTL, Tabs;

type TTabObject = class(TObject)
        FormLink: TForm;
        TabType: Integer;
        constructor Create(Link: TForm;TType: Integer);
        destructor Destroy;
end;

type
  DOSString = type AnsiString(866);

type
  CreateOptionsGlobal = record
    FormCaption: string;
    BudgetGUID: Variant;
    BudgetGUIDForSpr: Variant;
    ContractID: Integer;
  end;

type
  TNewThread = class(TThread)
  private
    { Private declarations }

  protected
    procedure Execute; override;
end;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    ActionManager: TActionManager;
    MainConnection: TADOConnection;
    ImageList: TImageList;
    Query: TADOQuery;
    ActFirstTest: TAction;
    ActArticleToBudget: TAction;
    Action2: TAction;
    cxImageList1: TcxImageList;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle14: TcxStyle;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    SprFormAccountingHoursShow: TAction;
    Action3: TAction;
    cxLocalizer1: TcxLocalizer;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    ActBudgets: TAction;
    ActPlannedWork: TAction;
    ActPlannedWorkOISI: TAction;
    ActPlannedRent: TAction;
    ActPlannedTransport: TAction;
    ActPlannedDailyAllowance: TAction;
    ActPlannedManualValue: TAction;
    ActPlannedTrips: TAction;
    ActPlannedTripsShift: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Action4: TAction;
    Action8: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    TypesWorkAction: TAction;
    BudgetArticlesAction: TAction;
    ActBudgetCopy: TAction;
    OrgAcrtio: TAction;
    MonthAction: TAction;
    ActBudgetCalc: TAction;
    ActUsers: TAction;
    ActTasks: TAction;
    ActPlannedWorkSelect: TAction;
    ActPlannedWorkOISISelect: TAction;
    ActBudgetNew: TAction;
    ActPlannedRentSelect: TAction;
    ActPlannedTransportSelect: TAction;
    ActPlannedManualValueSelect: TAction;
    ActPlannedTripsSelect: TAction;
    ActPlannedTripsShiftSelect: TAction;
    PermQ: TADOQuery;
    ActTaskOut: TAction;
    ActExecuteTask: TAction;
    ActExit: TAction;
    ActChangeUser: TAction;
    ActTaskComplete: TAction;
    Timer1: TTimer;
    XLSImport: TAction;
    ActFiles: TAction;
    Action1: TAction;
    ActArticleToBudgetExt: TAction;
    ActPlanItemCopy: TAction;
    ActNavigator: TAction;
    ActBudgetClose: TAction;
    ActGlobalSprEdit: TAction;
    ActOptions: TAction;
    TimerSessionActivity: TTimer;
    QuerySessionActivity: TADOQuery;
    ActSessions: TAction;
    ActToArchive: TAction;
    ActFromArchive: TAction;
    ADOQuery1: TADOQuery;
    ActHistory: TAction;
    ActPlannedStages: TAction;
    ActStageXLSImport: TAction;
    ActPlannedSubcontract: TAction;
    ActReports: TAction;
    ActTasksSpecial: TAction;
    ActBudgetNext: TAction;
    ActBudgetConfirmed: TAction;
    ActBudgetNotConfirmed: TAction;
    TabSet: TTabSet;
    TabMenu: TPopupMenu;
    N1: TMenuItem;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    procedure SprFormAccountingHoursShowExecute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure ActNumberContractsExecute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure ActBudgetsExecute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure ActPlannedWorkExecute(Sender: TObject);
    procedure ActPlannedWorkOISIExecute(Sender: TObject);
    procedure ActPlannedRentExecute(Sender: TObject);
    procedure ActPlannedTransportExecute(Sender: TObject);
    procedure ActPlannedDailyAllowanceExecute(Sender: TObject);
    procedure ActPlannedManualValueExecute(Sender: TObject);
    procedure ActPlannedTripsExecute(Sender: TObject);
    procedure ActPlannedTripsShiftExecute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure Action17Execute(Sender: TObject);
    procedure Action18Execute(Sender: TObject);
    procedure Action19Execute(Sender: TObject);
    procedure Action20Execute(Sender: TObject);
    procedure Action21Execute(Sender: TObject);
    procedure Action22Execute(Sender: TObject);
    procedure Action23Execute(Sender: TObject);
    procedure Action24Execute(Sender: TObject);
    procedure SprConformityActionExecute(Sender: TObject);
    procedure sprCitiesActionExecute(Sender: TObject);
    procedure sprBudgetArticlesActionExecute(Sender: TObject);
    procedure sprAccountingHoursActionsExecute(Sender: TObject);
    procedure TypesWorkActionExecute(Sender: TObject);
    procedure BudgetArticlesActionExecute(Sender: TObject);
    procedure OrgAcrtioExecute(Sender: TObject);
    procedure MonthActionExecute(Sender: TObject);
    procedure ActBudgetCalcExecute(Sender: TObject);
    procedure ActUsersExecute(Sender: TObject);
    procedure ActTasksExecute(Sender: TObject);
    procedure ActPlannedWorkSelectExecute(Sender: TObject);
    procedure ActPlannedWorkOISISelectExecute(Sender: TObject);
    procedure ActPlannedRentSelectExecute(Sender: TObject);
    procedure ActPlannedTransportSelectExecute(Sender: TObject);
    procedure ActPlannedManualValueSelectExecute(Sender: TObject);
    procedure ActPlannedTripsSelectExecute(Sender: TObject);
    procedure ActPlannedTripsShiftSelectExecute(Sender: TObject);
    procedure ActTaskCompleteExecute(Sender: TObject);
    procedure ActChangeUserExecute(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure ActArticleToBudgetExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ImageButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActFilesExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ActArticleToBudgetExtExecute(Sender: TObject);
    procedure ActPlanItemCopyExecute(Sender: TObject);
    procedure ActNavigatorExecute(Sender: TObject);
    procedure ActBudgetCloseExecute(Sender: TObject);
    procedure ActGlobalSprEditExecute(Sender: TObject);
    procedure ActOptionsExecute(Sender: TObject);
    procedure TimerSessionActivityTimer(Sender: TObject);
    procedure ActSessionsExecute(Sender: TObject);
    procedure ActToArchiveExecute(Sender: TObject);
    procedure ActFromArchiveExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure ActPlannedStagesExecute(Sender: TObject);
    procedure ActStageXLSImportExecute(Sender: TObject);
    procedure ActPlannedSubcontractExecute(Sender: TObject);
    procedure ActSubcontractXLSImportExecute(Sender: TObject);
    procedure ActReportsExecute(Sender: TObject);
    procedure ActTasksSpecialExecute(Sender: TObject);
    procedure ActBudgetNextExecute(Sender: TObject);
    procedure ActBudgetCopyExecute(Sender: TObject);
    procedure ActBudgetConfirmedExecute(Sender: TObject);
    procedure ActBudgetNotConfirmedExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TabSetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function ActionsActual: Integer;
    procedure AppException(Sender: TObject; E: Exception);
    procedure ReadINIConfig(Path: string);

  public
    { Public declarations }
    WindowsAccount: Variant;
    Login: Variant;
    Password: Variant;
    UserID: Variant;
    TypeCalc: Variant;
    ParamCode: string;
    TaskGUID: Variant;
    Search: string;
    ExclusiveMode: Boolean;
    GetCloseRequest: Boolean;
    AltAuthorized: Boolean;
    procedure LoginTrue(WinAuth: Boolean);
    procedure GetBudgetInfo;
    procedure DoActualInterface;
    procedure StartWithParamCode(FilePath, Code: string);
    function GetIndexForComboBox: Integer;
    function GetNameButton: string;
    procedure Update;
    procedure DoUpdate;
    procedure UploadToExcel(Grid: TcxGrid; FirstName: string);
    procedure PlanGetRecordCount(Query: TADOQuery; Plan: string; PlanForm: TForm);
    procedure SessionsListDoActivity;
    procedure SetFilter(DocsTable: TcxGridDBTableView; SearchText: string);
    Procedure RegisterFileType(prefix:String; exepfad:String);
    procedure BudgetCopyNewNext(Sender: TObject);
    Function SendString(TargetWnd, SourceWnd: THandle; N: Integer; Const S: String): Integer;
    Procedure WMCopyData(Var Msg: TWMCopyData); Message WM_COPYDATA;

    procedure AddTab(Tab: TTabSet; TabObject: TObject);
    procedure DeleteTab(Tab: TTabSet; Form: TForm);
    procedure ActivateTab(Tab: TTabSet; Form: TForm);
  end;


const AppID = '{63A8D710-1526-4CA4-A876-58AE61AC5E49}';

var
  MainForm: TMainForm;
  GlobalBudgetGUID: Variant;
  GlobalContractID: Integer;
  GlobalBudgetGUIDForSpr: Variant;

  NewThread: TNewThread;
  UpdateFlag, CloseAppByTime: Boolean;

  CalcExecuteStatus: Boolean;

  FileMapping: Integer;
  GlobalTabIndex: Integer;

function GetSize: TPoint;

implementation

uses Splash, TaskBar, sprUnitAccountingHours, sprUnitAccountingHourValues,
  NumbersContracts,
  sprUnitBudgetArticles, spUnitCities, spUnitConformityArticles, Budgets,
  PlannedWork, PlannedWorkOISI, PlannedRent, PlannedTransport,
  PlannedFieldContentment, PlannedManualValue, PlannedTrips, PlannedTripsShift,
  sprUnitDivisions, sprUnitEmployees, sprUnitFieldContentment, sprUnitGroups,
  sprUnitContracts, sprUnitPosts,
  sprUnitMeasures, sprUnitConformityPosts, sprUnitCostResiding, sprUnitCostTrip,
  sprUnitDirections,
  sprUnitPlaceResidense, sprUnitSectors, sprUnitTypesTransport,
  sprUnitTypesWork, spUnitDailyAllowances,
  spUnitDepartments, Users, Tasks, PlannedWorkSelect, PlannedWorkOISISelect,
  ArticleToBudget, PlannedRentSelect, PlannedTransportSelect, PlannedManualValueSelect,
  PlannedTripsSelect, PlannedTripsShiftSelect, TreeUnit, routines, XLSImportUnit,
  BudgetOrgFlow, Files, ArticleToBudgetExt, Options, Sessions, History, Stages, StageXLSImport,
  PlannedSubcontract, Reports;
{$R *.dfm}


procedure TMainForm.ReadINIConfig(Path: string);
var
  s: string;
  ini: TIniFile;
begin
  try
    ini := TIniFile.Create(Path + '\options.ini');
    MainConnection.Close;

    // Строка подключения для базы данных
    s := '';
    s := s + 'Provider=' + ini.ReadString('Connection', 'Provider', '') + '; ';
    s := s + 'Password=' + ini.ReadString('Connection', 'Password', '') + '; ';
    s := s + 'Persist Security Info=' + ini.ReadString('Connection',
      'Persist Security Info', '') + '; ';
    s := s + 'User ID=' + ini.ReadString('Connection', 'User ID', '') + '; ';
    s := s + 'Initial Catalog=' + ini.ReadString('Connection',
      'Initial Catalog', '') + '; ';
    s := s + 'Data Source=' + ini.ReadString('Connection', 'Data Source',
      '') + '; ';
    s := s + 'Use Procedure for Prepare=' + ini.ReadString('Connection',
      'Use Procedure for Prepare', '') + '; ';
    s := s + 'Auto Translate=' + ini.ReadString('Connection', 'Auto Translate',
      '') + '; ';
    s := s + 'Packet Size=' + ini.ReadString('Connection', 'Packet Size',
      '') + '; ';
    s := s + 'Workstation ID=' + ini.ReadString('Connection', 'Workstation ID',
      '') + '; ';
    s := s + 'Use Encryption for Data=' + ini.ReadString('Connection',
      'Use Encryption for Data', '') + '; ';
    s := s + 'Tag with column collation when possible=' +
      ini.ReadString('Connection',
      'Tag with column collation when possible', '');
    MainConnection.ConnectionString := s;
    Search :=  ini.ReadString('App', 'Search', '');
    if ini.ReadString('App', 'AltAuthorize', '0') = '' then
      begin
       AltAuthorized := False;
      end else
          begin
            if ini.ReadString('App', 'AltAuthorize', '0') = '1' then
              begin
                AltAuthorized := True;
              end else
                  begin
                    AltAuthorized := False;
                  end;
          end;

    ini.WriteString('App','WorkPath', GetCurrentDir);
  finally
    ini.Free;
  end;
end;

procedure TMainForm.GetBudgetInfo;
begin
  try
    Query.Close;
    if not varisnull(GlobalBudgetGUID) then
      Query.SQL.Text := 'exec BudgetInfoGet ' + #39 + GlobalBudgetGUID + #39
    else
      begin
        Query.SQL.Text := 'exec BudgetInfoGet ';
      end;
    Query.Open;
  except
  end;
end;

// получить разрешение экрана
function GetSize: TPoint;
var
  DesctopHandle: HWND;
  DesctopDC: HDC;
begin
  DesctopHandle := GetDesktopWindow;
  DesctopDC := GetDC(DesctopHandle);
  try
    // Разрешение в пикселах по горизонтали.
    Result.X := GetDeviceCaps(DesctopDC, HORZRES);
    // Разрешение в пикселах по вертикали.
    Result.Y := GetDeviceCaps(DesctopDC, VERTRES);
  finally
    if ReleaseDC(DesctopHandle, DesctopDC) = 0 then
      RaiseLastOSError;
  end;
end;

function TMainForm.SendString(TargetWnd, SourceWnd: THandle; N: Integer; Const S: String): Integer;
Var CD: TCopyDataStruct;
Begin
  CD.dwData := N;
  CD.cbData := Length(S);
  If CD.cbData = 0 Then CD.lpData := NIL
                   Else CD.lpData := @S[1];
  Result := SendMessage(TargetWnd, WM_COPYDATA, SourceWnd, Integer(@CD));
End;

Procedure TMainForm.WMCopyData(var Msg: TWMCopyData);
Var S: String;
    N: Integer;
Begin
  If (Msg.CopyDataStruct^).lpData = NIL Then S := '';
  SetLength(S,Msg.CopyDataStruct^.cbData);
  S := String((Msg.CopyDataStruct^).lpData);
  N := (Msg.CopyDataStruct^).dwData;
  ShowMessage('Принял');
End;

procedure TMainForm.FormCreate(Sender: TObject);
var Han: THandle;
begin
  Application.OnException := AppException;
  UpdateFlag := True;
  CloseAppByTime := False;
  ParamCode := ParamStr(1);

  MainForm.Width := GetSize.X;
  GlobalBudgetGUID := Null;
  GlobalContractID := 0;
  ReadINIConfig(ExtractFileDir(Application.ExeName));
  RegisterFileType('taskx7', ExtractFileDir(Application.ExeName) + '\ProjectX7.exe');

  if DirectoryExists(PChar(GetDirUp(Application.ExeName) + 'Temp')) then
    begin
      Sleep(1000);
      DelDir(PChar(GetDirUp(Application.ExeName) + 'Temp'));
    end;

//  FileMapping := CreateFileMapping($FFFFFFFF, Nil, PAGE_READONLY, 0, 1, AppID);
//  If GetLastError = ERROR_ALREADY_EXISTS then
//    begin
//      ShowMessage('Работу в нескольких копиях программа не поддерживает!');
//      Halt;
//   end;

end;

procedure TMainForm.ActPlannedWorkExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  try
    Options.FormCaption := (Sender as TAction).Caption;
    Options.BudgetGUID := GlobalBudgetGUID;
    Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
    ShowPlannedWork(Options);
  except
  end;
end;

procedure TMainForm.ActPlannedWorkOISIExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := (Sender as TAction).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      ShowPlannedWorkOISI(Options);

end;

procedure TMainForm.ActPlannedWorkOISISelectExecute(Sender: TObject);
var Options: CreateOptionsPlannedWorkOISISelect;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedWorkOISISelect(Options);
end;

procedure TMainForm.ActPlannedWorkSelectExecute(Sender: TObject);
var Options: CreateOptionsPlannedWorkSelect;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedWorkSelect(Options);
end;

procedure TMainForm.ActReportsExecute(Sender: TObject);
begin
  ReportsForm.Visible := True;
  ReportsForm.BringToFront;
end;

procedure TMainForm.ActSessionsExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowSessions(Options);
end;

procedure TMainForm.ActStageXLSImportExecute(Sender: TObject);
begin
  StageXLSImportForm.BudgetGUID := TStagesForm(TComponent(TAction(Sender).ActionComponent).Owner).BudgetGUID;
  StageXLSImportForm.ContractID := TStagesForm(TComponent(TAction(Sender).ActionComponent).Owner).ContractID;
  StageXLSImportForm.Visible := True;
  StageXLSImportForm.BringToFront;
end;

procedure TMainForm.ActSubcontractXLSImportExecute(Sender: TObject);
begin
  StageXLSImportForm.BudgetGUID := TStagesForm(TComponent(TAction(Sender).ActionComponent).Owner).BudgetGUID;
  StageXLSImportForm.ContractID := TStagesForm(TComponent(TAction(Sender).ActionComponent).Owner).ContractID;
  StageXLSImportForm.Visible := True;
  StageXLSImportForm.BringToFront;
end;

procedure TMainForm.ActTaskCompleteExecute(Sender: TObject);
begin
   if not VarIsNull(TaskGUID) then
     begin
       Query.Close;
       Query.SQL.Text := 'exec TasksComplete :TaskGUID';
       Query.Parameters.ParamByName('TaskGUID').Value := TaskGUID;
       Query.ExecSQL;
       TaskGUID := Null;
       TForm(TComponent(TAction(Sender).ActionComponent).Owner).Close;
     end;
end;

procedure TMainForm.ActTasksExecute(Sender: TObject);
var Options: CreateOptionsTask;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowTasks(Options, 0);
end;

procedure TMainForm.ActTasksSpecialExecute(Sender: TObject);
var Options: CreateOptionsTask;
    ID: string;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ID := TAction(Sender).Hint;
  if ID <> '' then
    ShowTasks(Options, StrToInt(ID));
end;

procedure TMainForm.ActToArchiveExecute(Sender: TObject);
var Que: TADOQuery;
begin
  try
    if ExclusiveMode then
      begin
        Que := TADOQuery(TForm(TComponent(TAction(Sender).ActionComponent).Owner).FindComponent('Query'));
        if Que <> nil then
          if Que.FieldByName('RecordState').AsString = 'Доступен' then
            begin
              Query.Close;
              Query.SQL.Text := 'exec NumbersContractsStateSet :ContractID, :RecordState';
              Query.Parameters.ParamByName('ContractID').Value := Que.FieldByName('ID').AsInteger;
              Query.Parameters.ParamByName('RecordState').Value := 'В архиве';
              Query.ExecSQL;

              Que.Close;
              Que.Open;
            end;
      end else MessageDlg('Вы не в монопольном режиме!', mtError, [mbOk], 0);
  except
  end;
end;

procedure TMainForm.ActUsersExecute(Sender: TObject);
var Options: CreateOptionsUser;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowUsers(Options);
end;

procedure TMainForm.ActPlannedRentExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := (Sender as TAction).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      ShowPlannedRent(Options);

end;

procedure TMainForm.ActPlannedRentSelectExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedRentSelect(Options);
end;

procedure TMainForm.ActPlannedStagesExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      Options.ContractID := GlobalContractID;
      ShowPlannedStage(Options);
end;

procedure TMainForm.ActPlannedSubcontractExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      Options.ContractID := GlobalContractID;
      ShowPlannedSubcontract(Options);

end;

procedure TMainForm.ActPlannedTransportExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      ShowPlannedTransport(Options);

end;

procedure TMainForm.ActPlannedTransportSelectExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedTransportSelect(Options);
end;

procedure TMainForm.ActPlanItemCopyExecute(Sender: TObject);
var PlanName: string;
    PlanGUID: Variant;
    Que: TADOQuery;
begin
  try
    PlanName := TLabel(TForm(TComponent(TAction(Sender).ActionComponent).Owner).FindComponent('PlannedName')).Caption;
    Que := TADOQuery(TForm(TComponent(TAction(Sender).ActionComponent).Owner).FindComponent('WorkQ'));
    PlanGUID := Que.FieldByName('GUID').AsVariant;
    Query.Close;
    Query.sql.Text := 'exec PlannedItemCopy :Plan, :PlanGUID, :BudgetGUID';
    Query.Parameters.ParamByName('Plan').Value := PlanName;
    Query.Parameters.ParamByName('PlanGUID').Value := PlanGUID;
    Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
    Query.ExecSQL;

    Que.Close;
    Que.Open;

  except
  end;
end;

procedure TMainForm.ActPlannedDailyAllowanceExecute(Sender: TObject);
var
  Options: CreateOptionsPlannedFieldContentment;
begin
  if not varisnull(GlobalBudgetGUID) then
    begin
      Options.FormCaption := TAction(Sender).Caption;
      ShowPlannedFieldContentment(Options);
    end
  else
    MessageDlg('Не зафиксирован бюджет.', mtError, [mbOk], 0);
end;

procedure TMainForm.ActPlannedManualValueExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      ShowPlannedManualValue(Options);

end;

procedure TMainForm.ActPlannedManualValueSelectExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedManualValueSelect(Options);
end;

procedure TMainForm.ActPlannedTripsExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := GlobalBudgetGUIDForSpr;
      ShowPlannedTrips(Options);

end;

procedure TMainForm.ActPlannedTripsSelectExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedTripsSelect(Options);
end;

procedure TMainForm.ActPlannedTripsShiftExecute(Sender: TObject);
var
  Options: CreateOptionsGlobal;
begin

      Options.FormCaption := TAction(Sender).Caption;
      Options.BudgetGUID := GlobalBudgetGUID;
      Options.BudgetGUIDForSpr := Null;//GlobalBudgetGUIDForSpr;
      ShowPlannedTripsShift(Options);

end;

procedure TMainForm.ActPlannedTripsShiftSelectExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  Options.FormCaption := TAction(Sender).Caption;
  ShowPlannedTripsShiftSelect(Options);
end;

procedure TMainForm.Action3Execute(Sender: TObject);
begin
  sprUnitAccountingHourValues.InitWithBudgetGUID;
end;

procedure TMainForm.ActNavigatorExecute(Sender: TObject);
begin
 if TreeForm.Showing then
   begin
     TreeForm.Close;
   end else
   begin
     TreeForm.Show;
   end;
end;

procedure TMainForm.ActBudgetNotConfirmedExecute(Sender: TObject);
begin
  if BudgetsForm.BudgetsQ.RecordCount > 0 then
  if BudgetsForm.BudgetsQ.FieldByName('State').AsString = 'Доступен. Утвержден' then
    begin
      try
        Query.Close;
        Query.SQL.Text := 'exec BudgetConfirmedState :BudgetGUID, :State';
        Query.Parameters.ParamByName('BudgetGUID').Value := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
        Query.Parameters.ParamByName('State').Value := 'Открыт';
        Query.ExecSQL;

        try
          if BudgetsForm.ContractsQ.Active then
            begin
              BudgetsForm.RL.RecordControlID := BudgetsForm.BudgetsQ.FieldByName('ID').AsInteger;
              BudgetsForm.RL.ErrorControl := True;

              BudgetsForm.BudgetsQ.Close;
              BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
              BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
              BudgetsForm.BudgetsQ.Open;
              BudgetsForm.BudgetsQ.Locate('ID', BudgetsForm.RL.RecordControlID, []);
            end;
        except
        end;
      except
      end;
    end else
        begin
          MessageDlg('Бюджет не был утвержден', mtError, [mbOk], 0);
        end;
end;

procedure TMainForm.ActNumberContractsExecute(Sender: TObject);
var
  Options: CreateOptions;
begin
  Options.FormCaption := (Sender as TAction).Caption;
  ShowNumbersContracts(Options);
end;

procedure TMainForm.ActOptionsExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  try
          Options.FormCaption := 'Настройки';
          Options.BudgetGUID := Null;
          ShowOptions(Options);
  except
  end;
end;

procedure TMainForm.Action5Execute(Sender: TObject);
begin
  sprUnitBudgetArticles.InitWithBudgetGUID;
end;

procedure TMainForm.Action6Execute(Sender: TObject);
begin
  spUnitCities.InitWithBudgetGUID;
end;

procedure TMainForm.Action7Execute(Sender: TObject);
begin
  spUnitConformityArticles.InitWithBudgetGUID;
end;

procedure TMainForm.ActArticleToBudgetExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  try
    if BudgetsForm <> nil then
      if BudgetsForm.BudgetsQ.RecordCount > 0 then
        begin
          Options.FormCaption := 'Суммы по статьям';
          Options.BudgetGUID := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
          ShowArticleToBudget(Options);
        end;
  except
  end;
end;

procedure TMainForm.ActArticleToBudgetExtExecute(Sender: TObject);
var Options: CreateOptionsGlobal;
begin
  try
    if BudgetsForm <> nil then
      if BudgetsForm.BudgetsQ.RecordCount > 0 then
        begin
          Options.FormCaption := 'Суммы по статьям';
          Options.BudgetGUID := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
          ShowArticleToBudgetExt(Options);
        end;
  except
  end;
end;

procedure TMainForm.ActBudgetCalcExecute(Sender: TObject);
begin

   if (BudgetsForm.BudgetsQ.RecordCount > 0) and (CalcExecuteStatus = False) then
   if BudgetsForm.BudgetsQ.FieldByName('State').AsString = 'Открыт' then

   begin

   try
     TAction(Sender).Caption := 'Идет расчет...';
     CalcExecuteStatus := True;
     Screen.Cursor := crHourGlass;
     BudgetsForm.cxButton2.GroupIndex := 2;
     BudgetsForm.cxButton2.Down := True;
     Application.ProcessMessages;

     BudgetsForm.Bookmark := BudgetsForm.BudgetsQ.GetBookmark;
     Query.Close;
     Query.SQL.Text := 'exec BudgetCalc :BudgetGUID';
     Query.Parameters.ParamByName('BudgetGUID').Value := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
     Query.ExecSQL;
     Application.ProcessMessages;
     try
       if BudgetsForm.ContractsQ.Active then
         begin
           BudgetsForm.BudgetsQ.Close;
           BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
           BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value :=
           BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
           BudgetsForm.BudgetsQ.Open;
           BudgetsForm.BudgetsQ.GotoBookmark(BudgetsForm.Bookmark);
           TAction(Sender).Caption := 'Расчет';
           CalcExecuteStatus := False;
           BudgetsForm.cxButton2.Down := False;
           BudgetsForm.cxButton2.GroupIndex := 0;
           Screen.Cursor := crDefault;
        end;
    except
      TAction(Sender).Caption := 'Расчет';
      CalcExecuteStatus := False;
      BudgetsForm.cxButton2.Down := False;
      BudgetsForm.cxButton2.GroupIndex := 0;
      Screen.Cursor := crDefault;
    end;
   except
     TAction(Sender).Caption := 'Расчет';
     CalcExecuteStatus := False;
     BudgetsForm.cxButton2.Down := False;
     BudgetsForm.cxButton2.GroupIndex := 0;
     Screen.Cursor := crDefault;
   end;
   end else
        begin
          MessageDlg('Нельзя считать закрытый бюджет', mtError, [mbOk], 0);
        end;
end;

procedure TMainForm.ActBudgetCloseExecute(Sender: TObject);

begin
  if BudgetsForm.BudgetsQ.RecordCount > 0 then
  if BudgetsForm.BudgetsQ.FieldByName('State').AsString = 'Открыт' then
    begin
      try
        TAction(Sender).Caption := 'Закрытие...';
        CalcExecuteStatus := True;
        Screen.Cursor := crHourGlass;
        BudgetsForm.cxButton1.GroupIndex := 2;
        BudgetsForm.cxButton1.Down := True;
        Application.ProcessMessages;


        Query.Close;
        Query.SQL.Text := 'exec BudgetClose :BudgetGUID';
        Query.Parameters.ParamByName('BudgetGUID').Value := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
        Query.ExecSQL;

        try
          if BudgetsForm.ContractsQ.Active then
            begin
              BudgetsForm.RL.RecordControlID := BudgetsForm.BudgetsQ.FieldByName('ID').AsInteger;
              BudgetsForm.RL.ErrorControl := True;

              BudgetsForm.BudgetsQ.Close;
              BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
              BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
              BudgetsForm.BudgetsQ.Open;
              BudgetsForm.BudgetsQ.Locate('ID', BudgetsForm.RL.RecordControlID, []);

              TAction(Sender).Caption := 'Закрыть бюджет';
              BudgetsForm.cxButton1.Down := False;
              BudgetsForm.cxButton1.GroupIndex := 0;
              Screen.Cursor := crDefault;
            end;
        except
              TAction(Sender).Caption := 'Закрыть бюджет';
              BudgetsForm.cxButton1.Down := False;
              BudgetsForm.cxButton1.GroupIndex := 0;
              Screen.Cursor := crDefault;
        end;
      except
              TAction(Sender).Caption := 'Закрыть бюджет';
              BudgetsForm.cxButton1.Down := False;
              BudgetsForm.cxButton1.GroupIndex := 0;
              Screen.Cursor := crDefault;
      end;
    end else
        begin
          MessageDlg('Нельзя закрыть уже закрытый бюджет', mtError, [mbOk], 0);
        end;
end;

procedure TMainForm.ActBudgetCopyExecute(Sender: TObject);
begin
  BudgetCopyNewNext(Sender);
end;

procedure TMainForm.BudgetCopyNewNext(Sender: TObject);
var Context: string;
    BudgetGUID: Variant;
    ContractID: Integer;
    AComponent: TComponent;
begin
    try
      Context := TForm(TComponent(TAction(Sender).ActionComponent).Owner).Name;
      if Copy(Context, 1, 11) = 'BudgetsForm' then
        begin
          BudgetGUID := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
        end;
      if Copy(Context, 1, 10) = 'StagesForm' then         // какой-то странный нейм, вычислен методом отладки
        begin
          BudgetGUID := StagesForm.BudgetGUID;
          ContractID := StagesForm.ContractID;
        end;

        Query.Close;
        Query.SQL.Text := 'exec BudgetCopy :BudgetGUIDSource, :CopyPlan';
        Query.Parameters.ParamByName('BudgetGUIDSource').Value := BudgetGUID;
        Query.Parameters.ParamByName('CopyPlan').Value := 1;
        Query.Open;

        if Query.Fields[0].AsInteger = -1 then
          begin
            MessageDlg(Query.Fields[1]. AsString, mtError, [mbOk], 0);
            Exit;
          end;

      try
       if Copy(Context, 1, 11) = 'BudgetsForm' then
       if BudgetsForm.ContractsQ.Active then
         begin
           BudgetsForm.BudgetsQ.Close;
           BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
           BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
           BudgetsForm.BudgetsQ.Open;

           BudgetsForm.RL.RecordControlID := Query.Fields[0].AsInteger;
           BudgetsForm.RL.ErrorControl := True;

           BudgetsForm.BudgetsQ.Locate('ID', BudgetsForm.RL.RecordControlID, []);
        end;

        if Copy(Context, 1, 10) = 'StagesForm' then
          begin
            TForm(TComponent(TAction(Sender).ActionComponent).Owner).Close;   //закрываем форму этапов старой версии

            AComponent := mainform.FindComponent('ActPlannedStages');   //открываем форму этапов новой версии
            if Assigned(AComponent) then
              if AComponent is TCustomAction then
                begin
                  GlobalBudgetGUID := Query.Fields[2].AsVariant;  //подставляем guid только что созданного бюджета
                  GlobalContractID := ContractID;
                  GlobalBudgetGUIDForSpr := Null;
                  TCustomAction(AComponent).execute;
                end;
          end;

      except
      end;
   except
   end;
end;

procedure TMainForm.ActBudgetNextExecute(Sender: TObject);
begin
  BudgetCopyNewNext(Sender);
end;

procedure TMainForm.ActBudgetsExecute(Sender: TObject);
var
  Options: CreateOptionsBudgets;
begin
  Options.FormCaption := 'Бюджеты';
  ShowBudgets(Options, 0, 0);
end;

procedure TMainForm.ActChangeUserExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
  Close;
end;

procedure TMainForm.ActBudgetConfirmedExecute(Sender: TObject);
begin
  if BudgetsForm.BudgetsQ.RecordCount > 0 then
  if BudgetsForm.BudgetsQ.FieldByName('State').AsString = 'Открыт' then
    begin
      try
        Query.Close;
        Query.SQL.Text := 'exec BudgetConfirmedState :BudgetGUID, :State';
        Query.Parameters.ParamByName('BudgetGUID').Value := BudgetsForm.BudgetsQ.FieldByName('GUID').AsVariant;
        Query.Parameters.ParamByName('State').Value := 'Доступен. Утвержден';
        Query.ExecSQL;

        try
          if BudgetsForm.ContractsQ.Active then
            begin
              BudgetsForm.RL.RecordControlID := BudgetsForm.BudgetsQ.FieldByName('ID').AsInteger;
              BudgetsForm.RL.ErrorControl := True;

              BudgetsForm.BudgetsQ.Close;
              BudgetsForm.BudgetsQ.SQL.Text := 'exec BudgetsToContractShow :NumbersContactsID';
              BudgetsForm.BudgetsQ.Parameters.ParamByName('NumbersContactsID').Value := BudgetsForm.ContractsQ.FieldByName('ID').AsInteger;
              BudgetsForm.BudgetsQ.Open;
              BudgetsForm.BudgetsQ.Locate('ID', BudgetsForm.RL.RecordControlID, []);
            end;
        except
        end;
      except
      end;
    end else
        begin
          MessageDlg('Нельзя утвердить закрытый бюджет', mtError, [mbOk], 0);
        end;
end;

procedure TMainForm.ActExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ActFilesExecute(Sender: TObject);
begin
  FilesForm.Show;
end;

procedure TMainForm.ActFromArchiveExecute(Sender: TObject);
var Que: TADOQuery;
begin
  try
    Que := TADOQuery(TForm(TComponent(TAction(Sender).ActionComponent).Owner).FindComponent('Query'));
    if Que <> nil then
      if Que.FieldByName('RecordState').AsString = 'В архиве' then
        begin
          Query.Close;
          Query.SQL.Text := 'exec NumbersContractsStateSet :ContractID, :RecordState';
          Query.Parameters.ParamByName('ContractID').Value := Que.FieldByName('ID').AsInteger;
          Query.Parameters.ParamByName('RecordState').Value := 'Доступен';
          Query.ExecSQL;

          Que.Close;
          Que.Open;
        end;
  except
  end;
end;

procedure TMainForm.ActGlobalSprEditExecute(Sender: TObject);
begin
   //
end;

procedure TMainForm.ActHistoryExecute(Sender: TObject);
begin
  HistoryForm.Show;
end;

procedure TMainForm.Action10Execute(Sender: TObject);
begin
  sprUnitCostResiding.InitWithBudgetGUID;
end;

procedure TMainForm.Action11Execute(Sender: TObject);
begin
  sprUnitCostTrip.InitWithBudgetGUID;
end;

procedure TMainForm.Action12Execute(Sender: TObject);
begin
  sprUnitTypesTransport.InitWithBudgetGUID;
end;

procedure TMainForm.Action13Execute(Sender: TObject);
begin
  sprUnitSectors.InitWithBudgetGUID;
end;

procedure TMainForm.Action14Execute(Sender: TObject);
begin
  sprUnitConformityPosts.InitWithBudgetGUID;
end;

procedure TMainForm.Action15Execute(Sender: TObject);
begin
  spUnitDailyAllowances.InitWithBudgetGUID;
end;

procedure TMainForm.Action16Execute(Sender: TObject);
begin
  spUnitDepartments.InitWithBudgetGUID;
end;

procedure TMainForm.Action17Execute(Sender: TObject);
begin
  sprUnitDirections.InitWithBudgetGUID;
end;

procedure TMainForm.Action18Execute(Sender: TObject);
begin
  sprUnitDivisions.InitWithBudgetGUID;
end;

procedure TMainForm.Action19Execute(Sender: TObject);
begin
  sprUnitEmployees.InitWithBudgetGUID;
end;

procedure TMainForm.Action1Execute(Sender: TObject);
begin
  Caption := TMenuItem(TAction(Sender).ActionComponent).Parent.ClassName;
end;

procedure TMainForm.Action20Execute(Sender: TObject);
begin
  sprUnitFieldContentment.InitWithBudgetGUID;
end;

procedure TMainForm.Action21Execute(Sender: TObject);
begin
  sprUnitGroups.InitWithBudgetGUID;
end;

procedure TMainForm.Action22Execute(Sender: TObject);
begin
  sprUnitContracts.InitWithBudgetGUID;
end;

procedure TMainForm.Action23Execute(Sender: TObject);
begin
  sprUnitPosts.InitWithBudgetGUID;
end;

procedure TMainForm.Action24Execute(Sender: TObject);
begin
  sprUnitMeasures.InitWithBudgetGUID;
end;

procedure TMainForm.Action4Execute(Sender: TObject);
var
  Options: CreateOptions;
begin
  Options.FormCaption := (Sender as TAction).Caption;
  ShowNumbersContracts(Options);
end;

procedure TMainForm.Action8Execute(Sender: TObject);
var
  Options: CreateOptionsBudgets;
begin
  Options.FormCaption := (Sender as TAction).Caption;
  ShowBudgets(Options, 0, 0);
end;

procedure TMainForm.Action9Execute(Sender: TObject);
begin
  sprUnitPlaceResidense.InitWithBudgetGUID;
end;

function TMainForm.ActionsActual: Integer;
var
  i: Integer;
begin
  Result := 1;
  try
    for i := 0 to ActionManager.ActionCount - 1 do
      begin
        try
          Query.Close;
          Query.SQL.Text := 'exec ActionsActual :ActionName, :ActionCaption';
          Query.Parameters.ParamByName('ActionName').Value :=
            TAction(ActionManager.Actions[i]).Name;
          Query.Parameters.ParamByName('ActionCaption').Value :=
            TAction(ActionManager.Actions[i]).Caption;
          Query.Open;
          if Query.FieldByName('Error').AsInteger = 1 then
            begin
              MessageDlg(Query.FieldByName('ErrorText').AsString, mtError,
                [mbOk], 0);
            end;
        except
          Result := -1;
        end;
      end;
  except
    Result := -1;
  end;
end;

// инициализация приложения, чтение настроек, проверка акаунта и т.п.
procedure TMainForm.LoginTrue(WinAuth: Boolean);

begin
  try
    try
      SplashForm.Progress.Position := 10;
      SplashForm.StatusLabel.Caption := 'Подключение к базе данных, ожидайте...';
      Application.ProcessMessages;
      MainConnection.Connected := True;
    except on E: Exception do
      begin
        MessageDlg('Нет соединения с сервером - ' + #13#10 + E.Message, mtError,
          [mbOk], 0);
        SplashForm.Progress.Position := 0;
        SplashForm.StatusLabel.Caption := '';
        Application.ProcessMessages;
      end;
    end;
    // здесь вызывается все то
    // что может быть выполнено до показа главной формы
    if MainConnection.Connected then
      begin
        SplashForm.Progress.Position := 25;
        SplashForm.StatusLabel.Caption := 'Авторизация';
        Application.ProcessMessages;

        Query.Close;
        Query.SQL.Text := 'exec UsersAccessCheck :WindowsAccount, :Login, :Password';
        if WinAuth then
          begin
            Query.Parameters.ParamByName('WindowsAccount').Value := WindowsAccount;
            Query.Parameters.ParamByName('Login').Value := Null;
            Query.Parameters.ParamByName('Password').Value := Null;
          end else
          begin
            Query.Parameters.ParamByName('WindowsAccount').Value := Null;
            Query.Parameters.ParamByName('Login').Value := Login;
            Query.Parameters.ParamByName('Password').Value := Password;
          end;
        Query.Open;

        if Query.RecordCount > 0 then
          begin
            if not Query.FieldByName('Exclusive').AsBoolean then
              begin
                if Query.FieldByName('ID').AsInteger > 0 then
                  begin
                    UserID := MainForm.Query.FieldByName('ID').AsVariant;
                    TypeCalc := MainForm.Query.FieldByName('TypeCalc').AsVariant;
                    Caption := MainForm.Caption + '. Работает: ' + Query.FieldByName('Username').AsString;
                    SessionsListDoActivity;
                    TimerSessionActivity.Enabled := True;
                    ExclusiveMode := False;
                    GetCloseRequest := False;
                  end else
                  begin
                    SplashForm.Progress.Position := 0;
                    SplashForm.StatusLabel.Caption := '';
                    Application.ProcessMessages;
                    MessageDlg('Доступ запрещен', mtError, [mbOk], 0);
                    Exit;
                  end;
              end else
                  begin
                    SplashForm.Progress.Position := 0;
                    SplashForm.StatusLabel.Caption := '';
                    Application.ProcessMessages;
                    MessageDlg('Включен монопольный режим. Попробуйте войти позже.', mtError, [mbOk], 0);
                    Exit;
                  end;
          end else
          begin
            SplashForm.Progress.Position := 0;
            SplashForm.StatusLabel.Caption := '';
            Application.ProcessMessages;
            MessageDlg('Доступ запрещен', mtError, [mbOk], 0);
            Exit;
          end;

        SplashForm.Progress.Position := 50;
        SplashForm.StatusLabel.Caption := 'Загрузка программы';
        Application.ProcessMessages;

        ActionsActual; // сопоставляем экшены из списка с базой
        SplashForm.Progress.Position := 100;
        Show; // показываем главную форму
        // TaskBarForm.Show; // пока не показываем панель задач
        MayClose := True; // флаг для успешного закрытия формы приветствия
        SplashForm.Close; // закрываем форму приветствия
        Application.CreateForm(TTreeForm, TreeForm);
        TreeForm.Visible:=true;
        TreeForm.BringToFront;

        DoActualInterface;

        //ParamCode := 'c:\nodir\Задание_№13 (3).taskx7';
        if ParamCode <> '' then StartWithParamCode(ParamCode, '');

        UpdateFlag := False;
    end;

  except
    MessageDlg('Не удалось запустить программу', mtError, [mbOk], 0);
    Close;
  end;
end;

function TMainForm.GetIndexForComboBox: Integer;
begin
  Result := 0;
  if TypeCalc =  'Все бюджеты' then Result := 0;
  if TypeCalc =  'Бюджет ОИСИ' then Result := 1;
  if TypeCalc =  'Бюджет НИО' then Result := 2;
  if TypeCalc =  'Бюджет Проектировщики' then Result := 3;
  if TypeCalc =  'Бюджет ОАН' then Result := 4;
end;

function TMainForm.GetNameButton: string;
begin
  Result := 'BudgetAll';
  if TypeCalc =  'Все бюджеты' then Result := 'BudgetAll';
  if TypeCalc =  'Бюджет ОИСИ' then Result := 'BudgetOISI';
  if TypeCalc =  'Бюджет НИО' then Result := 'BudgetNIO';
  if TypeCalc =  'Бюджет Проектировщики' then Result := 'BudgetPro';
  if TypeCalc =  'Бюджет ОАН' then Result := 'BudgetOAN';
end;

procedure TMainForm.ImageButton2Click(Sender: TObject);
begin


end;

// процедура обработки кода задачи в параметре при запуске программы
procedure TMainForm.StartWithParamCode(FilePath, Code: string);
var ActionName: string;
    AComponent: TComponent;
    LocalTaskGUID: Variant;
    SL: TStringList;
    SA: array of DOSString;
    I: Integer;
begin
  try

    LocalTaskGUID := Null;
    if FilePath <> '' then
      begin
        SL := TStringList.Create;
        SL.LoadFromFile(FilePath, TEncoding.Unicode); // без BOM нужно указывать кодировку
        SetLength(SA, SL.Count);
        for I := 0 to SL.Count - 1 do
          begin
            SA[I] := SL[I]; // конвертация
          end;
        Code := '{' + SA[0] + '}';
      end;

    LocalTaskGUID := Code;

    if (FilePath <> '') or (Code <> '') then
      begin
        Query.Close;
        Query.SQL.Text := 'exec TasksExecute :TaskGUID, :UserID';
        Query.Parameters.ParamByName('TaskGUID').Value := LocalTaskGUID;
        Query.Parameters.ParamByName('UserID').Value := UserID;
        Query.Open;

        if Query.RecordCount > 0 then
          begin
            ActionName := Query.FieldByName('ActionName').AsString;
            AComponent := Mainform.FindComponent(ActionName);
            if not VarIsNull(Query.FieldByName('BudgetGUID').AsVariant) then
              begin
                if not VarIsNull(Query.FieldByName('NumbersContractsID').AsVariant) then
                  begin
                    if Assigned(AComponent) then
                    if AComponent is TCustomAction then
                      begin
                        GlobalBudgetGUID := Query.FieldByName('BudgetGUID').AsVariant;
                        GlobalBudgetGUIDForSpr := Null;
                        GlobalContractID := Query.FieldByName('NumbersContractsID').AsInteger;
                        TCustomAction(AComponent).execute;
                        TaskGUID := LocalTaskGUID;
                      end;
                  end else MessageDlg('Задание не открыто, т.к. не определен договор.',mtError,[mbOk],0);
              end else MessageDlg('Задание не открыто, т.к. в нем не указан бюджет.',mtError,[mbOk],0);
          end else MessageDlg('Задание не найдено.',mtError,[mbOk],0);

      end;
  except
  end;
end;

           // по списку доступных действий скрываем пункты в программе
procedure TMainForm.DoActualInterface;
var C: TComponent;
begin
  try
    PermQ.SQL.Text := 'exec UserPermissionsShow :UserID';
    PermQ.Parameters.ParseSQL(PermQ.SQL.Text, True);
    PermQ.Parameters.ParamByName('UserID').Value := UserID;
    PermQ.Open;
  except
  end;
  if PermQ.RecordCount > 0 then
    begin
      PermQ.First;
      while not PermQ.Eof do
        begin
          C := nil;
          C := FindComponent(PermQ.FieldByName('ActionName').AsString);
          if C <> nil then
            begin
              if PermQ.FieldByName('Permissions').AsString = 'False' then
                begin
                  TAction(C).Visible := False;
                end else
                begin
                  TAction(C).Visible := True;
                end;
            end;
          PermQ.Next;
        end;
    end;
end;

procedure TMainForm.MonthActionExecute(Sender: TObject);
begin
  //spUnitMonths.InitWithBudgetGUID;
end;

procedure TMainForm.N1Click(Sender: TObject);
//var NewTab: Integer;
begin
  if TabSet.Tabs.Count > 0 then
    begin
      TForm(TTabObject(TabSet.Tabs.Objects[TabSet.TabIndex]).FormLink).Close;
    end;
end;

procedure TMainForm.OrgAcrtioExecute(Sender: TObject);
begin
 sprUnitOrganizations.InitWithBudgetGUID;
end;

procedure TMainForm.sprAccountingHoursActionsExecute(Sender: TObject);
begin
  sprUnitAccountingHourValues.InitWithBudgetGUID;
end;

procedure TMainForm.sprBudgetArticlesActionExecute(Sender: TObject);
begin
  sprUnitBudgetArticles.InitWithBudgetGUID;
end;

procedure TMainForm.sprCitiesActionExecute(Sender: TObject);
begin
  spUnitCities.InitWithBudgetGUID;
end;

procedure TMainForm.SprConformityActionExecute(Sender: TObject);
begin
  spUnitConformityArticles.InitWithBudgetGUID;
end;

procedure TMainForm.SprFormAccountingHoursShowExecute(Sender: TObject);
begin
  sprUnitAccountingHours.InitWithBudgetGUID;
end;

procedure TMainForm.Update;
var Version1, Version2: string;
    s: string;
begin

  //Inc(GlobalContractID);
  //MainForm.Caption := IntToStr(GlobalContractID);
  try
  UpdateFlag := True;
  if Search <> '' then
    if FileExists(Search + '\projectx7.exe') then
      begin
        Version1 := FileVersion(Search + '\projectx7.exe');
        Version2 := FileVersion(Application.ExeName);
        if Version1 <> Version2 then
          begin
            if  MessageBox(MainForm.Handle,'Обнаружена новая версия программы - будет начато автоматическое обновление. ' +
                             #10#13 + 'Нажмите ОК, ожидайте завершения работ и перезапуска программы.','Обновление ПО',0) = 1 then
            //if MessageDlg('Обнаружена новая версия программы - будет начато автоматическое обновление. ' + #10#13 + 'Нажмите ОК, ожидайте завершения работ и перезапуска программы.', mtWarning, [mbOk], 0) = mrOk then
              begin
                s := GetDirUp(Application.ExeName);//c_GetTempPath;
                s := s + 'Temp';
                if not DirectoryExists(s, False) then
                  begin
                    MkDir(s);
                  end;

                CopyFile(PChar(getcurrentdir + '\updatex7.exe'),PChar(s + '\updatex7.exe'), False);
                CopyFile(PChar(getcurrentdir + '\options.ini'),PChar(s + '\options.ini'), False);
                CloseAppByTime := True;
              end;

          end;
      end;
  finally
     UpdateFlag := False;
  end;

end;

procedure TNewThread.Execute;
begin
  MainForm.Update;
end;

procedure TMainForm.DoUpdate;
begin
  NewThread.Resume;
end;

procedure TMainForm.TabSetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Index: Integer;
begin
  Index := TabSet.ItemAtPos(Point(X,Y), True);
  if Index >= 0 then
    begin
      TabSet.TabIndex := Index;
      TForm(TTabObject(TabSet.Tabs.Objects[Index]).FormLink).BringToFront;
    end;
  if TabSet.Tabs.Count <= 0 then TabSet.PopupMenu := nil;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  if CloseAppByTime = False then
    begin
      if UpdateFlag = False then
    begin
      NewThread := TNewThread.Create(true);
      NewThread.FreeOnTerminate := True;
      NewThread.Priority := tpNormal;
      DoUpdate;
      NewThread := nil;
    end;
    end else
        begin
          ShellExecute(0,'open',PChar(GetDirUp(Application.ExeName) + 'Temp\updatex7.exe'),'','',SW_SHOW);
          Close;
        end;
end;

procedure TMainForm.TimerSessionActivityTimer(Sender: TObject);
begin
  SessionsListDoActivity;
end;

procedure TMainForm.SessionsListDoActivity;
begin
  try
    QuerySessionActivity.Close;
    QuerySessionActivity.SQL.Text := 'exec SessionsListDoActivity :UserID';
    QuerySessionActivity.Parameters.ParamByName('UserID').Value := UserID;
    QuerySessionActivity.Open;
    if QuerySessionActivity.RecordCount > 0 then
      if not VarIsNull(QuerySessionActivity.FieldByName('CloseRequest').AsVariant) then
        if QuerySessionActivity.FieldByName('CloseRequest').AsBoolean then
          if not GetCloseRequest then
            begin
              GetCloseRequest := True;
              if MessageDlg('Пожалуйста, закройте программу. Запрошен монопольный режим.', mtWarning, [mbOk], 0) = mrOk then
                begin
                  GetCloseRequest := False;
                end;
            end;
  except
  end;
end;

procedure TMainForm.TypesWorkActionExecute(Sender: TObject);
begin
  sprUnitTypesWork.InitWithBudgetGUID;
end;

procedure TMainForm.AppException(Sender: TObject; E: Exception);
begin
  if E is EDatabaseError then
    begin
      MessageDlg('Не удалось выполнить действие', mtError, [mbOk], 0);
    end else
  if Copy(E.Message,1,17) = 'List index out of' then
    begin

    end else
    begin
      MessageDlg('ErrorClass: ' + E.ClassName + #10#13+ 'ErrorText: ' + E.Message, mtError, [mbOk], 0);
    end;
end;

procedure TMainForm.BudgetArticlesActionExecute(Sender: TObject);
begin
  sprUnitBudgetArticles.InitWithBudgetGUID;
end;

procedure TMainForm.UploadToExcel(Grid: TcxGrid; FirstName: string);
var GUID: TGUID;            filepath:string;
begin
  CoCreateGuid(GUID);
  filepath:=GetCurrentDir + '\'+FirstName+'_'+GUIDToString(GUID) + '.xls';
  ExportGridToExcel(filepath, Grid, True, True, True, 'xls');
    ShellExecute(0,'open',pchar(filepath),PChar(ExtractFileDir(Application.ExeName)),'',SW_SHOW);

end;

procedure TMainForm.PlanGetRecordCount(Query: TADOQuery; Plan: string; PlanForm: TForm);
var Button: TcxButton;
begin
  try
    Query.Close;
    Query.SQL.Text := 'exec PlanGetRecordCount :BudgetGUID, :Plan';
    Query.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
    Query.Parameters.ParamByName('Plan').Value := Plan;
    Query.Open;
    Button := TcxButton(PlanForm.FindComponent('BudgetAll'));
    if Button <> nil then Button.Caption := 'Все бюджеты' + ' (' + Query.FieldByName('BudgetAll').AsString + ')';
    Button := TcxButton(PlanForm.FindComponent('BudgetOISI'));
    if Button <> nil then Button.Caption := 'Бюджет ОИСИ' + ' (' + Query.FieldByName('BudgetOISI').AsString + ')';
    Button := TcxButton(PlanForm.FindComponent('BudgetNIO'));
    if Button <> nil then Button.Caption := 'Бюджет НИО' + ' (' + Query.FieldByName('BudgetNIO').AsString + ')';
    Button := TcxButton(PlanForm.FindComponent('BudgetPro'));
    if Button <> nil then Button.Caption := 'Бюджет Проектировщики' + ' (' + Query.FieldByName('BudgetPro').AsString + ')';
    Button := TcxButton(PlanForm.FindComponent('BudgetOAN'));
    if Button <> nil then Button.Caption := 'Бюджет ОАН' + ' (' + Query.FieldByName('BudgetOAN').AsString + ')';
    TreeForm.SetItemCount(GlobalBudgetGUID, 'Act' + Plan, Query.FieldByName('BudgetAll').AsString);
  except
  end;
end;


procedure TMainForm.SetFilter(DocsTable: TcxGridDBTableView; SearchText: string);
var sFilterString: string;
    i: Integer;
begin
  sFilterString := '%' + SearchText + '%';
  with DocsTable.DataController.Filter.Root do
    begin
      Clear;
      BoolOperatorKind := fboOr;
      for i := 0 to DocsTable.ItemCount - 1 do
        AddItem(DocsTable.Items[i], foLike, sFilterString, sFilterString);
    end;
  DocsTable.DataController.Filter.Active := True;
end;


Procedure TMainForm.RegisterFileType(prefix:String; exepfad:String);
Begin
 With TRegistry.Create Do
  try
   RootKey:=HKEY_CLASSES_ROOT;
    { create a new key --> .pci }
   OpenKey('.'+prefix,True);
    { create a new value for this key --> pcifile }
   WriteString('',prefix);
   CloseKey;
    { create a new key --> pcifile }
   CreateKey(prefix);
    { create a new key pcifile\DefaultIcon }
   OpenKey(prefix+'\DefaultIcon',True);
    { and create a value where the icon is stored --> c:\project1.exe,0 }
   WriteString('',exepfad+',0');
   CloseKey;
   OpenKey(prefix+'\shell\open\command',True);
    { create value where exefile is stored --> c:\project1.exe "%1" }
   WriteString('',exepfad+' "%1"');
   CloseKey;
  finally
   Free;
  end;


  // RegisterFileType('pci','c:\project1.exe');
end;


constructor TTabObject.Create(Link: TForm; TType: Integer);
begin
  FormLink := Link;
  TabType := TType;
end;

destructor TTabObject.Destroy;
begin
  inherited
end;

procedure TMainForm.AddTab(Tab: TTabSet; TabObject: TObject);
begin
//  if Length(TForm(TTabObject(TabObject).FormLink).Caption)>=18 then
//    begin
//      Tab.Tabs.AddObject(Copy(TForm(TTabObject(TabObject).FormLink).Caption,1,17) + '...', TabObject)
//    end else
//    begin
//      Tab.Tabs.AddObject(TForm(TTabObject(TabObject).FormLink).Caption, TabObject);
//    end;
  Tab.Tabs.AddObject(TForm(TTabObject(TabObject).FormLink).Caption, TabObject);
  Tab.TabIndex := Tab.Tabs.Count - 1;
  if Tab.Tabs.Count > 0 then Tab.PopupMenu := TabMenu;
end;

procedure TMainForm.DeleteTab(Tab: TTabSet; Form: TForm);
var i, NewTab: Integer;
begin
  for i := 0 to Tab.Tabs.Count - 1 do
    begin
      if TForm(TTabObject(Tab.Tabs.Objects[i]).FormLink).Handle = Form.Handle then
        begin
          if TabSet.TabIndex = TabSet.Tabs.Count - 1 then
            begin
              if (TabSet.Tabs.Count > 1) then NewTab := TabSet.TabIndex - 1;
            end else
            if TabSet.TabIndex = 0 then
              begin
                if (TabSet.Tabs.Count > 1) then NewTab := 0;
              end else
              begin
                if (TabSet.Tabs.Count > 1) then NewTab := TabSet.TabIndex - 1;
              end;
          TabSet.Tabs.Delete(i);
          if TabSet.Tabs.Count > 0 then TabSet.TabIndex := NewTab;
          Break;
        end;
    end;
end;

procedure TMainForm.ActivateTab(Tab: TTabSet; Form: TForm);
var i: Integer;
begin
  for i := 0 to Tab.Tabs.Count - 1 do
    begin
      if TForm(TTabObject(Tab.Tabs.Objects[i]).FormLink).Handle = Form.Handle then
        begin
          TabSet.TabIndex := i;
        end;
    end;
end;

end.
