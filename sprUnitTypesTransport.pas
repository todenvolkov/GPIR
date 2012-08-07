unit sprUnitTypesTransport;

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
  StdCtrls, cxButtons, ExtCtrls, dxStatusBar, GridViewTemplateSource, Main, SQLRoutines1, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore,
  ImageButton, cxContainer, cxRichEdit, cxTextEdit, cxMemo, cxDropDownEdit;

type
  TTypesTransportForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
    cxGrid1DBTableView2FullName: TcxGridDBColumn;
    cxGrid1DBTableView2ShortName: TcxGridDBColumn;
    cxGrid1DBTableView2GUID: TcxGridDBColumn;
    cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView2RecordState: TcxGridDBColumn;
    cxGrid1DBTableView2UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView2DateChange: TcxGridDBColumn;
    cxGrid1DBTableView2Version: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypesTransportForm: TTypesTransportForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // ��� �������� ���� ��� ����� ��������
  if not(Assigned(TypesTransportForm)) then // ���� ��� �� �������
    begin
      try
        Application.CreateForm(TTypesTransportForm, TypesTransportForm);
        FormCreatedOrExists := true;
      except
        FormCreatedOrExists := false;
        // ��� �����-���� ��������� ����� ��������.. ���� ������ ���� ������ ����������
      end;
    end
  else
    FormCreatedOrExists := true;
  if (FormCreatedOrExists = true) then
    // ���� ��� ������ - ������� ��� �������� �����
    begin

      OpenParamsQ(TypesTransportForm.Adoquery1,'exec TypesTransportShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + '����������' + #39]);

      TypesTransportForm.Adoquery4.Close;
      TypesTransportForm.Adoquery4.SQL.Text := 'exec SprTypesTransportJournalShow :BudgetGUID';
      TypesTransportForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      TypesTransportForm.Adoquery4.Open;

      OpenQ(TypesTransportForm.ADOQuery2, 'exec ApplicationTablesShow');
      TypesTransportForm.Visible := true;
      TypesTransportForm.BringToFront;
    end;
end;

procedure TTypesTransportForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
      TypesTransportForm.Adoquery4.Close;
      TypesTransportForm.Adoquery4.SQL.Text := 'exec SprTypesTransportJournalShow :BudgetGUID';
      TypesTransportForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      TypesTransportForm.Adoquery4.Open;
end;

procedure TTypesTransportForm.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='TypesTransport';
end;

end.
