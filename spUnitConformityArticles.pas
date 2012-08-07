unit spUnitConformityArticles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxPropertiesStore, ADODB, cxSplitter,
  cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls, dxStatusBar,
  cxDBLookupComboBox, GridViewTemplateSource, Main, SQLRoutines1, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton,
  cxContainer, cxRichEdit, cxTextEdit, cxMemo, cxDropDownEdit;

type
  TsprConformityArticles = class(TGridVewTemplateFormSource)
    BudgetArticlesQuery: TADOQuery;
    BudgetArticlesDataset: TDataSource;
    cxGrid1DBTableView1Code: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2ArticleName: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView2Code: TcxGridDBColumn;
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
  sprConformityArticles: TsprConformityArticles;

implementation

uses routines;
{$R *.dfm}
procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(sprConformityArticles)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TsprConformityArticles, sprConformityArticles);
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

      OpenParamsQ(sprConformityArticles.Adoquery1,'exec ConformityArticlesShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);

      sprConformityArticles.Adoquery4.Close;
      sprConformityArticles.Adoquery4.SQL.Text := 'exec SprConformityArticlesJournalShow :BudgetGUID';
      sprConformityArticles.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprConformityArticles.Adoquery4.Open;

      OpenQ(sprConformityArticles.ADOQuery2, 'exec ApplicationTablesShow');

      //OpenParamsQ(sprConformityArticles.BudgetArticlesQuery,'exec BudgetArticlesShow :BudgetGUID', [GlobalBudgetGUID]);
      sprConformityArticles.Adoquery1.SQL.Text := 'exec BudgetArticlesShow :BudgetGUID, :Level, :Context, :FormType';
      sprConformityArticles.Adoquery1.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprConformityArticles.Adoquery1.Parameters.ParamByName('Level').Value := '';
      sprConformityArticles.Adoquery1.Parameters.ParamByName('Context').Value := '';
      sprConformityArticles.Adoquery1.Parameters.ParamByName('FormType').Value := '';
      sprConformityArticles.Adoquery1.Open;

      sprConformityArticles.Visible := true;
      sprConformityArticles.BringToFront;
    end;
end;

procedure TsprConformityArticles.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      sprConformityArticles.Adoquery4.Close;
      sprConformityArticles.Adoquery4.SQL.Text := 'exec SprConformityArticlesJournalShow :BudgetGUID';
      sprConformityArticles.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprConformityArticles.Adoquery4.Open;
end;

procedure TsprConformityArticles.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='ConformityArticles';
end;

end.
