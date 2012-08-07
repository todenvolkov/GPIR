unit sprUnitPlaceResidense;

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
  ExtCtrls, dxStatusBar, Main, SQLRoutines1, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxDBLookupComboBox, cxContainer,
  cxRichEdit, cxTextEdit, cxMemo, cxDropDownEdit;

type
  TPlaceResidenseForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1CityGUID: TcxGridDBColumn;
    CityQuery: TADOQuery;
    CityDatasource: TDataSource;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2CompanyName: TcxGridDBColumn;
    cxGrid1DBTableView2CityGUID: TcxGridDBColumn;
    cxGrid1DBTableView2CompanyAddress: TcxGridDBColumn;
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

procedure InitWithBudgetGUID;

var
  PlaceResidenseForm: TPlaceResidenseForm;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(PlaceResidenseForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TPlaceResidenseForm, PlaceResidenseForm);
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

      PlaceResidenseForm.Adoquery1.SQL.Text := 'exec PlaceResidenceShow :BudgetGUID, :CityFinishGUID, :FormType';
      PlaceResidenseForm.Adoquery1.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PlaceResidenseForm.Adoquery1.Parameters.ParamByName('CityFinishGUID').Value := Null;
      PlaceResidenseForm.Adoquery1.Parameters.ParamByName('FormType').Value := '';
      PlaceResidenseForm.Adoquery1.Open;

      PlaceResidenseForm.Adoquery4.Close;
      PlaceResidenseForm.Adoquery4.SQL.Text := 'exec SprPlacesResidenceJournalShow :BudgetGUID';
      PlaceResidenseForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PlaceResidenseForm.Adoquery4.Open;

      OpenParamsQ(PlaceResidenseForm.CityQuery,'exec CitiesShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);
      OpenQ(PlaceResidenseForm.ADOQuery2, 'exec ApplicationTablesShow');
      PlaceResidenseForm.Visible := true;
      PlaceResidenseForm.BringToFront;
    end;
end;

procedure TPlaceResidenseForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      PlaceResidenseForm.Adoquery4.Close;
      PlaceResidenseForm.Adoquery4.SQL.Text := 'exec SprPlacesResidenceJournalShow :BudgetGUID';
      PlaceResidenseForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PlaceResidenseForm.Adoquery4.Open;
end;

procedure TPlaceResidenseForm.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='PlacesResidence';
end;

end.
