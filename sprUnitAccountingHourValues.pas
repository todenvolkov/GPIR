unit sprUnitAccountingHourValues;

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
  cxDBLookupComboBox, GridViewTemplateSource, main, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo, cxDropDownEdit;

type
  TSprFormAccountingHourValues = class(TGridVewTemplateFormSource)
    AccountingHourGUIDQuery: TADOQuery;
    AccountingHourGUIDDataset: TDataSource;
    BudgetArticleGUIDDatasource: TDataSource;
    BudgetArticleGUIDQuery: TADOQuery;
    PostGUIDQuery: TADOQuery;
    PostGUIDDataset: TDataSource;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1Value: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1AccountingHourGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    DepartmentQ: TADOQuery;
    DepartmentDS: TDataSource;
    PostFilterDataset: TDataSource;
    PostFilterQuery: TADOQuery;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView2PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView2Value: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2AccountingHourGUID: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UserNameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SprFormAccountingHourValues: TSprFormAccountingHourValues;
procedure InitWithBudgetGUID;
// Создает или вызывает форму и перезагружает все датасеты с указанным BudgetGUID

implementation

uses  routines, spUnitDepartments, SQLRoutines1, cxGridDBDataDefinitions, cxVariants, cxLookupDBGrid;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(SprFormAccountingHourValues)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TSprFormAccountingHourValues,
          SprFormAccountingHourValues);
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
      with SprFormAccountingHourValues do
        begin
          OpenParamsQ(Adoquery1,
            'exec AccountingHourValuesShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);

          Openq(ADOQuery2, 'exec ApplicationTablesShow');

//          OpenParamsQ(AccountingHourGUIDQuery,
//            'exec AccountingHoursShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);

          //OpenParamsQ(BudgetArticleGUIDQuery, 'exec BudgetArticlesShow :BudgetGUID, :Level, :Context, :FormType', [GlobalBudgetGUID, '0', Null, 'Справочник']);
          BudgetArticleGUIDQuery.SQL.Text := 'exec BudgetArticlesShow :BudgetGUID, :Level, :Context, :FormType';
          BudgetArticleGUIDQuery.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
          BudgetArticleGUIDQuery.Parameters.ParamByName('Level').Value := '';
          BudgetArticleGUIDQuery.Parameters.ParamByName('Context').Value := '';
          BudgetArticleGUIDQuery.Parameters.ParamByName('FormType').Value := '';
          BudgetArticleGUIDQuery.Open;

      SprFormAccountingHourValues.Adoquery4.Close;
      SprFormAccountingHourValues.Adoquery4.SQL.Text := 'exec SprAccountingHourValuesJournalShow :BudgetGUID';
      SprFormAccountingHourValues.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      SprFormAccountingHourValues.Adoquery4.Open;

          OpenParamsQ(PostGUIDQuery, 'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [GlobalBudgetGUID, Null, 'Справочник']);

          OpenParamsQ(DepartmentQ, 'exec DepartmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);



          SprFormAccountingHourValues.Visible := true;
          SprFormAccountingHourValues.BringToFront;
        end;
    end;
end;

procedure TSprFormAccountingHourValues.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      SprFormAccountingHourValues.Adoquery4.Close;
      SprFormAccountingHourValues.Adoquery4.SQL.Text := 'exec SprAccountingHourValuesJournalShow :BudgetGUID';
      SprFormAccountingHourValues.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      SprFormAccountingHourValues.Adoquery4.Open;
end;

procedure TSprFormAccountingHourValues.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
 var DC: TcxGridDBDataController;
begin
  inherited;
  DC := TcxGridDBTableView(Sender).DataController;  //блокировка колонки PlaceResidenceGUID пока не выбран город
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PostGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('DepartmentGUID').Index]);
  end
end;

procedure TSprFormAccountingHourValues.cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
  var ItemIndex: Integer;
    ItemValue: Variant;
    DC: TcxGridDBDataController;
    LookupProperty: TcxLookupComboBoxProperties;

begin
  inherited;

    if AItem = cxGrid1DBTableView1PostGUID then
    begin
      DC := TcxGridDBDataController(Sender.DataController);
      ItemIndex := DC.GetItemByFieldName('DepartmentGUID').Index;
      ItemValue := DC.Values[DC.FocusedRecordIndex, ItemIndex];

      if PostFilterQuery.Active then PostFilterQuery.Close;

      PostFilterQuery.SQL.Text := 'exec PostsShow :BudgetGUID, :DepartmentGUID ';
      PostFilterQuery.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PostFilterQuery.Parameters.ParamByName('DepartmentGUID').Value := ItemValue;

      LookupProperty := TcxLookupComboBox(AEdit).Properties;
      LookupProperty.ListSource := PostFilterDataset;
      PostFilterQuery.Open;
    end;

end;

procedure TSprFormAccountingHourValues.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
 
end;

end.
