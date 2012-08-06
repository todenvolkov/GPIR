unit sprUnitConformityPosts;

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
  TConformityPostsForm = class(TGridVewTemplateFormSource)
    PostsQuery: TADOQuery;
    PostsDatasource: TDataSource;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1PostName: TcxGridDBColumn;
    cxGrid1DBTableView1PostType: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2PostName: TcxGridDBColumn;
    cxGrid1DBTableView2PostType: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2PostGUID: TcxGridDBColumn;
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
  ConformityPostsForm: TConformityPostsForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(ConformityPostsForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TConformityPostsForm, ConformityPostsForm);
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

      OpenParamsQ(ConformityPostsForm.Adoquery1,'exec ConformityPostsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);

      ConformityPostsForm.Adoquery4.Close;
      ConformityPostsForm.Adoquery4.SQL.Text := 'exec SprConformityPostsJournalShow :BudgetGUID';
      ConformityPostsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      ConformityPostsForm.Adoquery4.Open;

      OpenQ(ConformityPostsForm.ADOQuery2, 'exec ApplicationTablesShow');

      OpenParamsQ(ConformityPostsForm.PostsQuery,'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [GlobalBudgetGUID, Null, 'Справочник']);
      ConformityPostsForm.Visible := true;
      ConformityPostsForm.BringToFront;
    end;
end;

procedure TConformityPostsForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      ConformityPostsForm.Adoquery4.Close;
      ConformityPostsForm.Adoquery4.SQL.Text := 'exec SprConformityPostsJournalShow :BudgetGUID';
      ConformityPostsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      ConformityPostsForm.Adoquery4.Open;
end;

end.
