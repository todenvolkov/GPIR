unit sprUnitAccountingHours;

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
  GridViewTemplateSource, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxDBLookupComboBox, cxContainer,
  cxRichEdit, cxTextEdit, cxMemo;

type
  TSprFormAccountingHours = class(TGridVewTemplateFormSource)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SprFormAccountingHours: TSprFormAccountingHours;
procedure InitWithBudgetGUID;
// ������� ��� �������� ����� � ������������� ��� �������� � ��������� GlobalBudgetGUID

implementation

uses Main, routines, SQLRoutines1;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // ��� �������� ���� ��� ����� ��������
  if not(Assigned(SprFormAccountingHours)) then // ���� ��� �� �������
    begin
      try
        Application.CreateForm(TSprFormAccountingHours, SprFormAccountingHours);
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
      OpenParamsQ(SprFormAccountingHours.Adoquery1,
        'exec AccountingHoursShow :BudgetGUID', [GlobalBudgetGUID]);
      Openq(SprFormAccountingHours.ADOQuery2, 'exec ApplicationTablesShow');
      SprFormAccountingHours.Visible := true;
      SprFormAccountingHours.BringToFront;
    end;
end;

procedure TSprFormAccountingHours.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='AccountingHours';

end;

end.
