unit sprUnitFieldContentment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridViewTemplateSource, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
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
  cxCurrencyEdit, cxCalendar, Main, SQLRoutines1, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPScxCommon, dxPSCore, ImageButton, cxContainer, cxRichEdit,
  cxTextEdit, cxMemo, cxDropDownEdit;

type
  TFieldContentmentForm = class(TGridVewTemplateFormSource)
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Price: TcxGridDBColumn;
    cxGrid1DBTableView1DateValidStart: TcxGridDBColumn;
    cxGrid1DBTableView1DateValidFinish: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1RecordState: TcxGridDBColumn;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID: TcxGridDBColumn;
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
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FieldContentmentForm: TFieldContentmentForm;
procedure InitWithBudgetGUID;

implementation

uses routines;
{$R *.dfm}

procedure InitWithBudgetGUID;
var
  FormCreatedOrExists: boolean;
begin
  FormCreatedOrExists := false; // Для проверки того что форма создаана
  if not(Assigned(FieldContentmentForm)) then // Если еще не создана
    begin
      try
        Application.CreateForm(TFieldContentmentForm, FieldContentmentForm);
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

     OpenParamsQ(FieldContentmentForm.Adoquery1,'exec FieldContentmentsShow :BudgetGUID, :FormType', [GlobalBudgetGUID, #39 + 'Справочник' + #39]);

     FieldContentmentForm.Adoquery4.Close;
      FieldContentmentForm.Adoquery4.SQL.Text := 'exec SprFieldContentmentsJournalShow :BudgetGUID';
      FieldContentmentForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      FieldContentmentForm.Adoquery4.Open;

      OpenQ(FieldContentmentForm.ADOQuery2, 'exec ApplicationTablesShow');
      FieldContentmentForm.Visible := true;
      FieldContentmentForm.BringToFront;
    end;
end;

procedure TFieldContentmentForm.ADOQuery1AfterPost(DataSet: TDataSet);
begin
  inherited;
     FieldContentmentForm.Adoquery4.Close;
      FieldContentmentForm.Adoquery4.SQL.Text := 'exec SprFieldContentmentsJournalShow :BudgetGUID';
      FieldContentmentForm.Adoquery4.Parameters.ParamByName('BudgetGUID').Value := GlobalBudgetGUID;
      FieldContentmentForm.Adoquery4.Open;
end;

procedure TFieldContentmentForm.ADOQuery1BeforePost(DataSet: TDataSet);
  Var ExB: WORD;
begin
  inherited;
  if Adoquery1.FieldByname('DateValidFinish').asDateTime<Adoquery1.FieldByname('DateValidStart').asDateTime then
     ExB:=MessageBox(handle,pchar('Вы ввели неверные сочетания даты. '+#13+
     ' Исправьте даты таким образом, чтобы дата Окончания была больше или равна дате Начала.'),pchar('Исправьте даты'),48);



end;

procedure TFieldContentmentForm.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
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

procedure TFieldContentmentForm.FormCreate(Sender: TObject);
begin
  inherited;
 TableName:='FieldContentments';
end;

end.
