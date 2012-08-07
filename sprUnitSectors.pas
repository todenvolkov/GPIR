unit sprUnitSectors;

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
  TSectorsForm = class(TGridVewTemplateFormSource)
    DepartmentsQuery: TADOQuery;
    DepartmentsDataset: TDataSource;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView2SectorName: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SectorsForm: TSectorsForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
// var FormCreatedOrExists:boolean;
begin

  try
    if SectorsForm = nil then // Если еще не создана
      begin
        Application.CreateForm(TSectorsForm, SectorsForm);
      end;
    if SectorsForm <> nil then // Если все ништяк - обновим все датасеты формы
      begin

        OpenParamsQ(SectorsForm.Adoquery1,'exec SectorsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);

      SectorsForm.Adoquery4.Close;
      SectorsForm.Adoquery4.SQL.Text := 'exec SprSectorsJournalShow :BudgetGUID';
      SectorsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      SectorsForm.Adoquery4.Open;

        OpenQ(SectorsForm.ADOQuery2, 'exec ApplicationTablesShow');

             OpenParamsQ(SectorsForm.DepartmentsQuery,'exec DepartmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);
        SectorsForm.Show;
      end;
  except
  end;
end;

procedure TSectorsForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
     SectorsForm.Adoquery4.Close;
      SectorsForm.Adoquery4.SQL.Text := 'exec SprSectorsJournalShow :BudgetGUID';
      SectorsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      SectorsForm.Adoquery4.Open;
end;

procedure TSectorsForm.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='sectors';
end;

end.
