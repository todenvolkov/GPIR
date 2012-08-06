unit sprUnitEmployees;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridViewTemplateSource, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, Menus,
  cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox,
  cxPropertiesStore, ADODB, cxSplitter,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, StdCtrls,
  cxButtons, ExtCtrls, dxStatusBar, Main, SQLRoutines1, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo, cxDropDownEdit;

type
  TEmployeesForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView1GroupGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView1SectorGUID: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1ClockNumber: TcxGridDBColumn;
    DepartmentsDataSource: TDataSource;
    DepartmentsQuery: TADOQuery;
    GroupsQuery: TADOQuery;
    GroupsDataSource: TDataSource;
    PostsQuery: TADOQuery;
    PostsDataSource: TDataSource;
    SectorsQuery: TADOQuery;
    SectorsDataSource: TDataSource;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView2GroupGUID: TcxGridDBColumn;
    cxGrid1DBTableView2PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView2SectorGUID: TcxGridDBColumn;
    cxGrid1DBTableView2FIO: TcxGridDBColumn;
    cxGrid1DBTableView2ClockNumber: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeesForm: TEmployeesForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(EmployeesForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TEmployeesForm, EmployeesForm);
        FormCreatedOrExists := true;
      except
        FormCreatedOrExists := false;
        // Тут какое-нить сообщение можно выдавать.. Хотя врядли сюда дойдет выполнение
      end;
    end
  else
    FormCreatedOrExists := true;
  if (FormCreatedOrExists = true) then
    // Если все ништяк - обновим все датасеты формы
    begin

      OpenParamsQ(EmployeesForm.Adoquery1,'exec EmployeesShow :BudgetGUID, :FormType', [GlobalBudgetGUID,  'Справочник']);

      EmployeesForm.Adoquery4.Close;
      EmployeesForm.Adoquery4.SQL.Text := 'exec SprEmployeesJournalShow :BudgetGUID';
      EmployeesForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      EmployeesForm.Adoquery4.Open;

      OpenQ(EmployeesForm.ADOQuery2, 'exec ApplicationTablesShow');


        OpenParamsQ(EmployeesForm.DepartmentsQuery,'exec DepartmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);


       OpenParamsQ(EmployeesForm.GroupsQuery,'exec GroupsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);


       OpenParamsQ(EmployeesForm.PostsQuery,'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [GlobalBudgetGUID, Null, 'Справочник']);


        OpenParamsQ(EmployeesForm.SectorsQuery,'exec SectorsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);

      EmployeesForm.Visible := true;
      EmployeesForm.BringToFront;
    end;
end;

procedure TEmployeesForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      EmployeesForm.Adoquery4.Close;
      EmployeesForm.Adoquery4.SQL.Text := 'exec SprEmployeesJournalShow :BudgetGUID';
      EmployeesForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      EmployeesForm.Adoquery4.Open;
end;

end.
