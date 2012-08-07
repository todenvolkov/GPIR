unit sprUnitCostResiding;

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
  TsprCostResidingForm = class(TGridVewTemplateFormSource)
    CitiesDataset: TDataSource;
    CitiesQuery: TADOQuery;
    PlaceResidenceQuery: TADOQuery;
    PlaceResidenceDataset: TDataSource;
    PlaceResidenceFilterDataset: TDataSource;
    PlaceResidenceFilterQuery: TADOQuery;
    cxGrid1DBTableView1PlaceResidenceGUID:TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2CityGUID: TcxGridDBColumn;
    cxGrid1DBTableView2PlaceResidenceGUID: TcxGridDBColumn;
    cxGrid1DBTableView2Price: TcxGridDBColumn;
    cxGrid1DBTableView2DateValidStart: TcxGridDBColumn;
    cxGrid1DBTableView2DateValidFinish: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure InitWithBudgetGUID;

var
  sprCostResidingForm: TsprCostResidingForm;

implementation

uses routines, cxGridDBDataDefinitions, cxVariants, cxLookupDBGrid;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(sprCostResidingForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TsprCostResidingForm, sprCostResidingForm);
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

     OpenParamsQ(sprCostResidingForm.Adoquery1,'exec CostResidingShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);
      OpenQ(sprCostResidingForm.ADOQuery2, 'exec ApplicationTablesShow');

       OpenParamsQ(sprCostResidingForm.CitiesQuery,'exec CitiesShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);

      //OpenParamsQ(sprCostResidingForm.PlaceResidenceQuery,'exec PlaceResidenceShow :BudgetGUID, :CityGUID, :FormType', [GlobalBudgetGUID, Null, 'Справочник']);

      sprCostResidingForm.PlaceResidenceQuery.SQL.Text := 'exec PlaceResidenceShow :BudgetGUID, :CityFinishGUID, :FormType';
      sprCostResidingForm.PlaceResidenceQuery.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprCostResidingForm.PlaceResidenceQuery.Parameters.ParamByName('CityFinishGUID').Value := Null;
      sprCostResidingForm.PlaceResidenceQuery.Parameters.ParamByName('FormType').Value := '';
      sprCostResidingForm.PlaceResidenceQuery.Open;

      sprCostResidingForm.Visible := true;
      sprCostResidingForm.BringToFront;
    end;
end;

procedure TsprCostResidingForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      sprCostResidingForm.Adoquery4.Close;
      sprCostResidingForm.Adoquery4.SQL.Text := 'exec SprCostsResidingJournalShow :BudgetGUID';
      sprCostResidingForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprCostResidingForm.Adoquery4.Open;
end;

procedure TsprCostResidingForm.ADOQuery1BeforePost(DataSet: TDataSet);
var exb:word;
begin
  inherited;

if Adoquery1.FieldByname('DateValidFinish').asDateTime<Adoquery1.FieldByname('DateValidStart').asDateTime then
     ExB:=MessageBox(handle,pchar('Вы ввели неверные сочетания даты. '+#13+
     ' Исправьте даты таким образом, чтобы дата Окончания была больше или равна дате Начала.'),pchar('Исправьте даты'),48);

end;
{
procedure TPlannedWorkForm.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var DC: TcxGridDBDataController;
begin
  DC := TcxGridDBTableView(Sender).DataController;  //блокировка колонки PostGUID пока не выбран отдел
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PostGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('DivisionGUID').Index]);
  end
end;

procedure TPlannedWorkForm.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshMonths;
end;


procedure TPlannedWorkForm.cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
var ItemIndex: Integer;
    ItemValue: Variant;
    DC: TcxGridDBDataController;
    LookupProperty: TcxLookupComboBoxProperties;
begin
  if AItem = cxGrid1DBTableView1PostGUID then
    begin
      DC := TcxGridDBDataController(Sender.DataController);
      ItemIndex := DC.GetItemByFieldName('DivisionGUID').Index;
      ItemValue := DC.Values[DC.FocusedRecordIndex, ItemIndex];

      if PostFilterQ.Active then PostFilterQ.Close;

      PostFilterQ.SQL.Text := 'exec PostsShow :BudgetGUID, :DepartmentGUID ';
      PostFilterQ.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PostFilterQ.Parameters.ParamByName('DepartmentGUID').Value := ItemValue;

      LookupProperty := TcxLookupComboBox(AEdit).Properties;
      LookupProperty.ListSource := PostFilterDS;
      PostFilterQ.Open;
    end;
end;
}

procedure TsprCostResidingForm.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var Index1, Index2: Integer;
    BrushColor, FontColor: TColor;
    Date: TDate;
begin
  inherited;
   // раскраска при выходе дат за пределы действия договора

   if (DateToStr(ContractStart) <> '30.12.1899') and (DateToStr(ContractFinish) <> '30.12.1899') then
      begin
        Index1 := cxGrid1DBTableView1.GetColumnByFieldName('DateValidStart').Index;
        Index2 := cxGrid1DBTableView1.GetColumnByFieldName('DateValidFinish').Index;

        if (Index1 >= 0) and (Index2 >= 0) then
          begin
            BrushColor := ACanvas.Brush.Color;
            FontColor := ACanvas.Font.Color;

            if ((AViewInfo.Item.Index = Index1) and ((AViewInfo.GridRecord.Values[Index1] < ContractStart) or
                (AViewInfo.GridRecord.Values[Index1] > ContractFinish))) or
               ((AViewInfo.Item.Index = Index2) and ((AViewInfo.GridRecord.Values[Index2] < ContractStart) or
                (AViewInfo.GridRecord.Values[Index2] > ContractFinish))) then
              begin
                ACanvas.Brush.Color := clFuchsia;
                ACanvas.Font.Color := clBlack;
              end else
              begin
                ACanvas.Brush.Color := BrushColor;
                ACanvas.Font.Color := FontColor;
              end;
          end;
      end;
end;

procedure TsprCostResidingForm.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
 var DC: TcxGridDBDataController;
begin
  inherited;
  DC := TcxGridDBTableView(Sender).DataController;  //блокировка колонки PlaceResidenceGUID пока не выбран город
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PlaceResidenceGUID' then
  begin
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, DC.GetItemByFieldName('CityGUID').Index]);
  end
end;

procedure TsprCostResidingForm.cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);

  var ItemIndex: Integer;
    ItemValue: Variant;
    DC: TcxGridDBDataController;
    LookupProperty: TcxLookupComboBoxProperties;

begin
  inherited;

    if AItem = cxGrid1DBTableView1PlaceResidenceGUID then
    begin
      DC := TcxGridDBDataController(Sender.DataController);
      ItemIndex := DC.GetItemByFieldName('CityGUID').Index;
      ItemValue := DC.Values[DC.FocusedRecordIndex, ItemIndex];

      if PlaceResidenceFilterQuery.Active then PlaceResidenceFilterQuery.Close;

      PlaceResidenceFilterQuery.SQL.Text := 'exec PlaceResidenceShow :BudgetGUID, :CityFinishGUID, :FormType';
      PlaceResidenceFilterQuery.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PlaceResidenceFilterQuery.Parameters.ParamByName('CityFinishGUID').Value := ItemValue;
      PlaceResidenceFilterQuery.Parameters.ParamByName('FormType').Value := '';


      LookupProperty := TcxLookupComboBox(AEdit).Properties;
      LookupProperty.ListSource := PlaceResidenceFilterDataset;
      PlaceResidenceFilterQuery.Open;
    end;
end;

procedure TsprCostResidingForm.FormCreate(Sender: TObject);
begin
  inherited;
TableName:='CostsResiding';
end;

end.
