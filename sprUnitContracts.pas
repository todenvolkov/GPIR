unit sprUnitContracts;

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
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo;

type
  TContractsForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1CodeNumber: TcxGridDBColumn;
    cxGrid1DBTableView1Number: TcxGridDBColumn;
    cxGrid1DBTableView1CodeNumber1C: TcxGridDBColumn;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1StageName: TcxGridDBColumn;
    cxGridDBTableView1GUID: TcxGridDBColumn;
    cxGridDBTableView1NumbersContractsID: TcxGridDBColumn;
    cxGridDBTableView1Version: TcxGridDBColumn;
    cxGridDBTableView1DateChange: TcxGridDBColumn;
    cxGridDBTableView1UsernameChange: TcxGridDBColumn;
    procedure cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ADOQuery3BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContractsForm: TContractsForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(ContractsForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TContractsForm, ContractsForm);
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

      OpenQ(ContractsForm.Adoquery1,'exec NumberContractsShow ');
      OpenQ(ContractsForm.ADOQuery2, 'exec ApplicationTablesShow ');
      ContractsForm.Visible := true;
      ContractsForm.BringToFront;
    end;
end;

procedure TContractsForm.ADOQuery3BeforePost(DataSet: TDataSet);
begin
  inherited;
  if ContractsForm.Adoquery1.Active = True then
    if ContractsForm.Adoquery1.RecordCount > 0 then
      begin
        ContractsForm.ADOQuery3.FieldByName('NumbersContractsID').AsVariant := ContractsForm.Adoquery1.FieldByName('ID').AsVariant;
      end;
end;

procedure TContractsForm.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
      if ContractsForm.Adoquery1.Active = True then
      if ContractsForm.Adoquery1.RecordCount > 0 then
        begin
          OpenParamsQ(ContractsForm.ADOQuery3, 'exec StagesShow :ContractID ', [ContractsForm.Adoquery1.FieldByName('ID').AsVariant]);
        end;
  except
  end;
end;

end.
