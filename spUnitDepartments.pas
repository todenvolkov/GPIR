unit spUnitDepartments;

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
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxPropertiesStore,
  ADODB, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, dxStatusBar, cxDBLookupComboBox, SQLRoutines1, Main, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton,
  cxContainer, cxRichEdit, cxTextEdit, cxMemo, cxDropDownEdit;

type
  TDepartmentsForm = class(TGridVewTemplateFormSource)
    DivisionsDatasource: TDataSource;
    DivisionsQuery: TADOQuery;
    cxGrid1DBTableView1Code: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2Code: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentName: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
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
  DepartmentsForm: TDepartmentsForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(DepartmentsForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TDepartmentsForm, DepartmentsForm);
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


      OpenParamsQ(DepartmentsForm.Adoquery1,'exec DepartmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);

      DepartmentsForm.Adoquery4.Close;
      DepartmentsForm.Adoquery4.SQL.Text := 'exec SprDepartmentsJournalShow :BudgetGUID';
      DepartmentsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      DepartmentsForm.Adoquery4.Open;

      OpenQ(DepartmentsForm.ADOQuery2, 'exec ApplicationTablesShow');

      OpenParamsQ(DepartmentsForm.DivisionsQuery,'exec DivisionsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);
      DepartmentsForm.Visible := true;
      DepartmentsForm.BringToFront;
    end;
end;

procedure TDepartmentsForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      DepartmentsForm.Adoquery4.Close;
      DepartmentsForm.Adoquery4.SQL.Text := 'exec SprDepartmentsJournalShow :BudgetGUID';
      DepartmentsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      DepartmentsForm.Adoquery4.Open;
end;

end.
