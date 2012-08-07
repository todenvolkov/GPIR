unit sprUnitBudgetArticles;

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
  StdCtrls, cxButtons, ExtCtrls, dxStatusBar, GridViewTemplateSource, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxDBTL, cxTLData, cxVGrid, cxDBVGrid, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton,
  cxDBLookupComboBox, cxContainer, cxRichEdit, cxTextEdit, cxMemo, cxDropDownEdit;

type
  TsprBudgetArticles = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1TotalSum: TcxGridDBColumn;
    cxGrid1DBTableView1articleGUID: TcxGridDBColumn;
    cxGrid1DBTableView1ArticleNumber: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2ArticleName: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2ParentArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView2ArticleNumber: TcxGridDBColumn;
    cxGrid1DBTableView1Code: TcxGridDBColumn;
    cxGrid1DBTableView2Code: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    procedure ADOQuery4BeforePost(DataSet: TDataSet);
    procedure cxGrid1DBTableView2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ADOQuery4PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure ADOQuery4AfterPost(DataSet: TDataSet);
    procedure btnColumnAutoWidthClick(Sender: TObject);
    procedure btnWordWrapClick(Sender: TObject);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sprBudgetArticles: TsprBudgetArticles;
procedure InitWithBudgetGUID(ReadOnly:boolean=false);
// Создает или вызывает форму и перезагружает всеls датасеты с указанным BudgetGUID

implementation

uses routines, SQLRoutines1, Main;
{$R *.dfm}

procedure InitWithBudgetGUID(ReadOnly:boolean=false);
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(sprBudgetArticles)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TsprBudgetArticles, sprBudgetArticles);
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
      //OpenParamsQ(sprBudgetArticles.Adoquery1,'exec BudgetArticlesShow :BudgetGUID, :Level, :Context', [GlobalBudgetGUID]);  //Первый уровень
      sprBudgetArticles.Adoquery1.SQL.Text := 'exec BudgetArticlesShow :BudgetGUID, :Level, :Context, :FormType';
      sprBudgetArticles.Adoquery1.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprBudgetArticles.Adoquery1.Parameters.ParamByName('Level').Value := '';
      sprBudgetArticles.Adoquery1.Parameters.ParamByName('Context').Value := '';
      sprBudgetArticles.Adoquery1.Parameters.ParamByName('FormType').Value := '';
      sprBudgetArticles.Adoquery1.Open;

      //OpenParamsQ(sprBudgetArticles.Adoquery4,'exec BudgetArticlesShow :BudgetGUID, 2', [GlobalBudgetGUID]);  //Второй уровень

      //раньше выводились подстатьи
      {sprBudgetArticles.Adoquery4.SQL.Text := 'exec BudgetArticlesShow :BudgetGUID, :Level, :Context, :FormType';
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('Level').Value := '2';
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('Context').Value := Null;
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('FormType').Value := 'Справочник';
      sprBudgetArticles.Adoquery4.Open;}

      //а теперь выводятся версии строки
      sprBudgetArticles.Adoquery4.SQL.Text := 'exec SprBudgetArticlesJournalShow :BudgetGUID';
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprBudgetArticles.Adoquery4.Open;

      Openq(sprBudgetArticles.ADOQuery2, 'exec ApplicationTablesShow');
      sprBudgetArticles.Visible := true;
      sprBudgetArticles.BringToFront;

    end;

     with  sprBudgetArticles do
     begin
       cxGrid1DBTableView1.OptionsData.Appending:=not(ReadOnly);
       cxGrid1DBTableView1.OptionsData.Deleting:=not(ReadOnly);
       cxGrid1DBTableView1.OptionsData.Inserting:=not(ReadOnly);
       cxGrid1DBTableView1.OptionsData.Editing:=not(ReadOnly);

       cxGrid1DBTableView2.OptionsData.Appending:=not(ReadOnly);
       cxGrid1DBTableView2.OptionsData.Deleting:=not(ReadOnly);
       cxGrid1DBTableView2.OptionsData.Inserting:=not(ReadOnly);
       cxGrid1DBTableView2.OptionsData.Editing:=not(ReadOnly);
     end;





end;

procedure TsprBudgetArticles.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      sprBudgetArticles.Adoquery4.Close;
      sprBudgetArticles.Adoquery4.SQL.Text := 'exec SprBudgetArticlesJournalShow :BudgetGUID';
      sprBudgetArticles.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      sprBudgetArticles.Adoquery4.Open;
end;

procedure TsprBudgetArticles.ADOQuery4AfterPost(DataSet: TDataSet);
begin
  inherited;
  RL.RecordControlID := DataSet.FieldByName('ID').AsInteger;
end;

procedure TsprBudgetArticles.ADOQuery4BeforePost(DataSet: TDataSet);
begin

  RL.ErrorState := False;
  RL.ErrorControl := true;
  if GlobalBudgetGUID<>Null then
     ADOQuery4.FieldByName('BudgetGUID').AsVariant:=GlobalBudgetGUID;
  ADOQuery4.FieldByName('ParentArticleGUID').AsVariant:=ADOQuery1.FieldByName('GUID').AsVariant;

end;

procedure TsprBudgetArticles.ADOQuery4PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
   DataSet.DataSource.DataSet.Close;
   DataSet.DataSource.DataSet.open;

   RL.ErrorState := True;
end;

procedure TsprBudgetArticles.btnColumnAutoWidthClick(Sender: TObject);
begin
  inherited;
   cxGrid1DBTableView2.optionsView.ColumnAutoWidth :=
    not(cxGrid1DBTableView2.optionsView.ColumnAutoWidth);
end;

procedure TsprBudgetArticles.btnWordWrapClick(Sender: TObject);
begin
  inherited;
   cxGrid1DBTableView2.optionsView.CellAutoHeight :=
    not(cxGrid1DBTableView2.optionsView.CellAutoHeight);
end;

procedure TsprBudgetArticles.cxGrid1DBTableView2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if RL.ErrorControl then
    begin
      if AViewInfo.GridRecord.Values[cxGrid1DBTableView2.GetColumnByFieldName('ID').Index] = RL.RecordControlID then
      begin
        if not RL.ErrorState then
          begin
            ACanvas.Brush.Color := clLime;
            ACanvas.Font.Color:=clBlack;
          end
        else
          begin
            ACanvas.Brush.Color := clRed;
            ACanvas.Font.Color:=clBlack;
        end;
      end;
    end;
    ACanvas.FillRect(AViewInfo.Bounds);
end;

procedure TsprBudgetArticles.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='BudgetArticles';
end;

end.

