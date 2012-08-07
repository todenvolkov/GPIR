unit sprUnitPosts;

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
  StdCtrls, cxButtons, ExtCtrls, dxStatusBar, GridViewTemplateSource,
  cxDBLookupComboBox, SQLRoutines1, Main, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo, cxDBExtLookupComboBox, cxDropDownEdit;

type
  TPostsForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1PostName: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    DepartmentsQuery: TADOQuery;
    DepartmentsDatasource: TDataSource;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2DepartmentName: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionGUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2DivisionName: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView3ID: TcxGridDBColumn;
    cxGrid1DBTableView3GUID: TcxGridDBColumn;
    cxGrid1DBTableView3BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView3PostName: TcxGridDBColumn;
    cxGrid1DBTableView3DepartmentGUID: TcxGridDBColumn;
    cxGrid1DBTableView3RecordState: TcxGridDBColumn;
    cxGrid1DBTableView3UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView3DateChange: TcxGridDBColumn;
    cxGrid1DBTableView3Version: TcxGridDBColumn;
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PostsForm: TPostsForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(PostsForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TPostsForm, PostsForm);
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

          OpenParamsQ(PostsForm.Adoquery1,'exec PostsShow :BudgetGUID, :DepartmentGUID, :FormType', [GlobalBudgetGUID, Null, 'Справочник']);

      PostsForm.Adoquery4.Close;
      PostsForm.Adoquery4.SQL.Text := 'exec SprPostsJournalShow :BudgetGUID';
      PostsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PostsForm.Adoquery4.Open;

    OpenQ(PostsForm.ADOQuery2, 'exec ApplicationTablesShow');

    OpenParamsQ(PostsForm.DepartmentsQuery,'exec DepartmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, 'Справочник']);
      PostsForm.Visible := true;
      PostsForm.BringToFront;
    end;
end;

procedure TPostsForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      PostsForm.Adoquery4.Close;
      PostsForm.Adoquery4.SQL.Text := 'exec SprPostsJournalShow :BudgetGUID';
      PostsForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      PostsForm.Adoquery4.Open;
end;

procedure TPostsForm.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='posts';
end;

end.
