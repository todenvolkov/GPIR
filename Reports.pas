unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls, cxButtons,
  ExtCtrls, XLSFonts4, XLSReadWriteII4, DB, ADODB, Main, SQLRoutines1, routines, ComObj, ActiveX,
  CellFormats4, XLSRange4, Columns4, Common, ComCtrls, cxControls, cxContainer, cxEdit, cxDropDownEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, DateUtils, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, BIFFRecsII4,
  WorkWithExcel;

type
  TReportsForm = class(TForm)
    Panel1: TPanel;
    BudgetPanel: TPanel;
    SubcontractRerportBtn: TcxButton;
    StagesReportBtn: TcxButton;
    MSFOReportBtn: TcxButton;
    D1S2ReportBtn: TcxButton;
    XLS: TXLSReadWriteII4;
    ReportQuery: TADOQuery;
    DS1: TADODataSet;
    DS2: TADODataSet;
    DS3: TADODataSet;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    YearSpin: TcxSpinEdit;
    MonthsCombo: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxComboBox1: TcxComboBox;
    cxLookupComboBox1: TcxLookupComboBox;
    BudgetQ: TADOQuery;
    BudgetDS: TDataSource;
    cxLookupComboBox2: TcxLookupComboBox;
    DS4: TADODataSet;
    DS5: TADODataSet;
    DS6: TADODataSet;
    procedure SubcontractRerportBtnClick(Sender: TObject);
    procedure StagesReportBtnClick(Sender: TObject);
    procedure MSFOReportBtnClick(Sender: TObject);
    procedure D1S2ReportBtnClick(Sender: TObject);
    procedure SubcontractRerportBtnMouseEnter(Sender: TObject);
    procedure StagesReportBtnMouseEnter(Sender: TObject);
    procedure MSFOReportBtnMouseEnter(Sender: TObject);
    procedure D1S2ReportBtnMouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    BudgetGUID: Variant;
    procedure ReportStart(ReportType: string);
    procedure ReportSubcontractExecute;
    procedure ReportStagesExecute;
    procedure ReportMSFOExecute;
    procedure ReportMSFOExecute2;
    procedure ReportD1S2Execute;
    procedure NoPage;
  end;

var
  ReportsForm: TReportsForm;


implementation

{$R *.dfm}

procedure TReportsForm.ReportStart(ReportType: string);
begin
  if ReportType = 'Субподряд' then
    begin
      ReportSubcontractExecute;
    end;
  if ReportType = 'Выручка' then
    begin
      ReportStagesExecute;
    end;
  if ReportType = 'Отчет МСФО' then
    begin
      ReportMSFOExecute2;
    end;
  if ReportType = 'D1 и S2' then
    begin
      ReportD1S2Execute;
    end;
end;

procedure TReportsForm.ReportSubcontractExecute;
var XL: TXLSReadWriteII4;
    i,k: Integer;

    RowCount, ColumnCount: Integer;
    Affected: Integer;
    GUID: TGUID;    Range: TXLSRange;

begin
  try
    // формируем набор данных
    //OpenParamsQ(ReportQuery, 'exec ReportSubcontractDataQtr', ['{54744EC8-9E74-4C9B-993F-A7E3DCC68A65}']);
    ReportQuery.Close;
    ReportQuery.sql.Text := 'exec ReportSubcontractDataQtr ' + #39 + cxLookupComboBox1.EditValue + #39;
    ReportQuery.Open;
    // определяем границы набора
    DS1.RecordSet := ReportQuery.RecordSet;
    DS2.RecordSet := ReportQuery.NextRecordset(Affected);

    RowCount := DS2.FieldByName('RecordCount').AsInteger;
    ColumnCount := Trunc(DS1.RecordCount/RowCount);


    // начало формирования плоской таблицы
    XL := TXLSReadWriteII4.Create(nil);
    XL.Sheets.Add();

    // формирование заголовка отчета
    XL.Sheet[0].AsString[1,0] := 'Наименование этапа генерального договора';
    TXLSRange(XL.Sheet[0].Range).Items[1,0,1,1].Merged := True;

    XL.Sheet[0].AsString[2,0] := 'Номер этапа';
    TXLSRange(XL.Sheet[0].Range).Items[2,0,2,1].Merged := True;

    XL.Sheet[0].AsString[3,0] := 'Договор';
    TXLSRange(XL.Sheet[0].Range).Items[3,0,3,1].Merged := True;

    XL.Sheet[0].AsString[4,0] := 'Организация';
    TXLSRange(XL.Sheet[0].Range).Items[4,0,4,1].Merged := True;

    XL.Sheet[0].AsString[5,0] := 'Действует по';
    TXLSRange(XL.Sheet[0].Range).Items[5,0,5,1].Merged := True;

    XL.Sheet[0].AsString[6+ColumnCount*2,0] := 'Остаток, руб.';
    TXLSRange(XL.Sheet[0].Range).Items[6+ColumnCount*2,0,6+ColumnCount*2,1].Merged := True;

    for k := 0 to ColumnCount - 1 do
      begin
        XL.Sheet[0].AsString[6+k*2,0] := 'Сумма без налогов, план';
        XL.Sheet[0].AsString[7+k*2,0] := 'Сумма без налогов, факт';
      end;

    // формирование таблицы
    DS1.First;
    i := 2;
    while not DS1.Eof do
      begin
            XL.Sheet[0].AsString[1,i] := DS1.FieldByName('StageName').AsString;
            XL.Sheet[0].AsInteger[2,i] := DS1.FieldByName('StageNumber').AsInteger;
            XL.Sheet[0].AsString[3,i] := DS1.FieldByName('ContractName').AsString;
            XL.Sheet[0].AsString[4,i] := DS1.FieldByName('Name').AsString;
            XL.Sheet[0].AsString[5,i] := DS1.FieldByName('DateValidBefore').AsString;
            XL.Sheet[0].AsFloat[6+ColumnCount*2,i] := DS1.FieldByName('Rest').AsFloat;
        for k := 0 to ColumnCount - 1 do
          begin
            XL.Sheet[0].AsFloat[6+k*2,i] := DS1.FieldByName('PlanValue').AsFloat;
            XL.Sheet[0].AsFloat[7+k*2,i] := DS1.FieldByName('FactValue').AsFloat;

            if XL.Sheet[0].AsString[6+k*2,1] = '' then
              begin
                XL.Sheet[0].AsString[6+k*2,1] := DS1.FieldByName('Qtr').AsString + ' квартал ' + DS1.FieldByName('Years').AsString;
                //XL.Sheet[0].AsString[7+k*2,1] := DS1.FieldByName('Qtr').AsString + ' квартал ' + DS1.FieldByName('Years').AsString;
                TXLSRange(XL.Sheet[0].Range).Items[6+k*2,1,7+k*2,1].Merged := True;
               TXLSRange(XL.Sheet[0].Range).Items[6+k*2,1,7+k*2,1].HorizAlignment := chaCenter;
              end;

            DS1.Next;
          end;
        Inc(i);
      end;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,6+ColumnCount*2,1+RowCount].BorderInsideVertStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,6+ColumnCount*2,1+RowCount].BorderInsideHorizStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,6+ColumnCount*2,1+RowCount].BorderOutlineStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,6+ColumnCount*2,1+RowCount].FormatOptions := [foWrapText];

    CoCreateGuid(GUID);
    XL.Filename := GetCurrentDir + '\' + GUIDToString(GUID) + '_субподряд.xls';
    XL.Write;
  finally
    XL.Free;
  end;
end;

procedure TReportsForm.D1S2ReportBtnClick(Sender: TObject);
begin
  ReportStart(TcxButton(Sender).Caption);
end;

procedure TReportsForm.D1S2ReportBtnMouseEnter(Sender: TObject);
begin
  TcxButton(Sender).SetFocus;
  PageControl.ActivePage := TabSheet4;
end;

procedure TReportsForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TReportsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TReportsForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  NoPage;

  SubcontractRerportBtn.SetFocus;
  TabSheet1.Visible := True;
  PageControl.ActivePage := TabSheet1;

  YearSpin.Value := YearOf(Now);
  cxSpinEdit1.Value := YearOf(Now);

  MonthsCombo.ItemIndex := MonthOf(Now)-1;
  cxComboBox1.ItemIndex := MonthOf(Now)-1;

  BudgetQ.Close;
  BudgetQ.SQL.Text := 'exec BudgetsForReportsShow';
  BudgetQ.Open;
end;

procedure TReportsForm.MSFOReportBtnClick(Sender: TObject);
begin
  ReportStart(TcxButton(Sender).Caption);
end;

procedure TReportsForm.MSFOReportBtnMouseEnter(Sender: TObject);
begin
  TcxButton(Sender).SetFocus;
  PageControl.ActivePage := TabSheet3;
end;

procedure TReportsForm.NoPage;
begin
   TabSheet1.Visible := False;
   TabSheet2.Visible := False;
   TabSheet3.Visible := False;
   TabSheet4.Visible := False;
end;

procedure TReportsForm.ReportStagesExecute;
var XL: TXLSReadWriteII4;
    i,k: Integer;

    RowCount, ColumnCount: Integer;
    Affected: Integer;
    GUID: TGUID;    Range: TXLSRange;
    QtrColumn, QtrNumber, Month: Integer;
begin
  try

    // формируем набор данных
    //OpenParamsQ(ReportQuery, 'exec ReportSubcontractDataQtr', ['{54744EC8-9E74-4C9B-993F-A7E3DCC68A65}']);
    ReportQuery.Close;
    ReportQuery.sql.Text := 'exec ReportStagesDataQtr ' + #39 + cxLookupComboBox2.EditValue + #39;
    ReportQuery.Open;
    // определяем границы набора
    DS1.RecordSet := ReportQuery.RecordSet;
    DS2.RecordSet := ReportQuery.NextRecordset(Affected);
    DS3.RecordSet := ReportQuery.NextRecordset(Affected);

    RowCount := DS2.FieldByName('RecordCount').AsInteger;
    ColumnCount := Trunc(DS1.RecordCount/RowCount);

    // начало формирования плоской таблицы
    XL := TXLSReadWriteII4.Create(nil);
    XL.Sheets.Add();

    // формирование заголовка отчета
    XL.Sheet[0].AsString[1,0] := 'Договор';
    TXLSRange(XL.Sheet[0].Range).Items[1,0,1,1].Merged := True;

    XL.Sheet[0].AsString[2,0] := 'Наименование этапа генерального договора';
    TXLSRange(XL.Sheet[0].Range).Items[2,0,2,1].Merged := True;

    XL.Sheet[0].AsString[3,0] := 'Рег. номер этапа';
    TXLSRange(XL.Sheet[0].Range).Items[3,0,3,1].Merged := True;

    XL.Sheet[0].AsString[4,0] := 'Вид работ';
    TXLSRange(XL.Sheet[0].Range).Items[4,0,4,1].Merged := True;

    XL.Sheet[0].AsString[5,0] := 'Договорная стоимость';
    TXLSRange(XL.Sheet[0].Range).Items[5,0,5,1].Merged := True;

    XL.Sheet[0].AsString[6,0] := 'Начало работ по этапу';
    TXLSRange(XL.Sheet[0].Range).Items[6,0,6,1].Merged := True;

    XL.Sheet[0].AsString[7,0] := 'Окончание работ по этапу';
    TXLSRange(XL.Sheet[0].Range).Items[7,0,7,1].Merged := True;

    XL.Sheet[0].AsString[8,0] := 'Ожидаемая дата завершения этапа';
    TXLSRange(XL.Sheet[0].Range).Items[8,0,8,1].Merged := True;

    XL.Sheet[0].AsString[9,0] := 'Планируемая дата реализации';
    TXLSRange(XL.Sheet[0].Range).Items[9,0,9,1].Merged := True;

    XL.Sheet[0].AsString[10,0] := 'Плановая сумма выручки без НДС, руб.';
    TXLSRange(XL.Sheet[0].Range).Items[10,0,10,1].Merged := True;



//    for k := 0 to ColumnCount - 1 do
//      begin
//        XL.Sheet[0].AsString[13+k*2,0] := 'План';
//        XL.Sheet[0].AsString[14+k*2,0] := 'Факт';
//      end;

    // формирование таблицы
    DS1.First;
    DS3.First;
    i := 2;
    QtrColumn := 11;
    while not DS1.Eof do
      begin
            XL.Sheet[0].AsString[1,i] := DS1.FieldByName('Name').AsString;
            XL.Sheet[0].AsString[2,i] := DS1.FieldByName('StageName').AsString;
            XL.Sheet[0].AsString[3,i] := DS1.FieldByName('StageRegNumber').AsString;
            XL.Sheet[0].AsString[4,i] := DS1.FieldByName('TypeWorkName').AsString;
            XL.Sheet[0].AsFloat[5,i] := DS1.FieldByName('Cost').AsFloat;
            XL.Sheet[0].AsString[6,i] := DS1.FieldByName('DateStart').AsString;
            XL.Sheet[0].AsString[7,i] := DS1.FieldByName('DateFinish').AsString;
            XL.Sheet[0].AsString[8,i] := DS1.FieldByName('DateStageClose').AsString;
            XL.Sheet[0].AsString[9,i] := DS1.FieldByName('DateStageRealize').AsString;
            XL.Sheet[0].AsFloat[10,i] := DS1.FieldByName('CostPlan').AsFloat;


            //XL.Sheet[0].AsFloat[6+ColumnCount*2,i] := DS1.FieldByName('Rest').AsFloat;
        for k := 0 to ColumnCount - 1 do
          begin
            XL.Sheet[0].AsFloat[QtrColumn,i] := DS1.FieldByName('PlanValue').AsFloat;
            //XL.Sheet[0].AsFloat[14+k*2,i] := DS1.FieldByName('FactValue').AsFloat;
            if XL.Sheet[0].AsString[QtrColumn,1] = '' then
              begin
                XL.Sheet[0].AsString[QtrColumn,0] := DS1.FieldByName('Qtr').AsString + ' квартал ' + DS1.FieldByName('Years').AsString;
                TXLSRange(XL.Sheet[0].Range).Items[QtrColumn,0,QtrColumn,1].Merged := True;
                TXLSRange(XL.Sheet[0].Range).Items[QtrColumn,0,QtrColumn,1].HorizAlignment := chaCenter;
              end;
            QtrNumber := DS1.FieldByName('Qtr').AsInteger;
            Inc(QtrColumn);
            XL.Sheet[0].AsString[QtrColumn,0] := ' в том числе';
            Month := QtrColumn;
            while QtrNumber = DS3.FieldByName('Qtr').AsInteger do
              begin
                XL.Sheet[0].AsFloat[QtrColumn,i] := DS3.FieldByName('PlanValue').AsFloat;
                XL.Sheet[0].AsString[QtrColumn,1] := GetMonthName(DS3.FieldByName('Months').AsInteger);


                QtrNumber := DS1.FieldByName('Qtr').AsInteger;
                Inc(QtrColumn);
                DS3.Next;
                if DS3.Eof then Break;
              end;
            if QtrColumn > Month then
              begin
                TXLSRange(XL.Sheet[0].Range).Items[Month, 0,QtrColumn-1,0].Merged := True;
                TXLSRange(XL.Sheet[0].Range).Items[Month, 0,QtrColumn-1,0].HorizAlignment := chaCenter;
              end;
            DS1.Next;
          end;

            XL.Sheet[0].AsFloat[QtrColumn,i] := DS1.FieldByName('CostFact').AsFloat;
            if DS1.FieldByName('CloseState').AsBoolean then
              XL.Sheet[0].AsString[QtrColumn+1,i] := 'Этап закрыт' else XL.Sheet[0].AsString[QtrColumn+1,i] := 'Этап не закрыт';

        Inc(i);
      end;

    XL.Sheet[0].AsString[QtrColumn,0] := 'Фактическая реализация, руб.';
    TXLSRange(XL.Sheet[0].Range).Items[QtrColumn,0,QtrColumn,1].Merged := True;

    XL.Sheet[0].AsString[QtrColumn+1,0] := 'Отметка о закрытии';
    TXLSRange(XL.Sheet[0].Range).Items[QtrColumn+1,0,QtrColumn+1,1].Merged := True;

            TXLSRange(XL.Sheet[0].Range).Items[1,0,QtrColumn+1,1+RowCount].BorderInsideVertStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,QtrColumn+1,1+RowCount].BorderInsideHorizStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,QtrColumn+1,1+RowCount].BorderOutlineStyle := cbsThin;
            TXLSRange(XL.Sheet[0].Range).Items[1,0,QtrColumn+1,1+RowCount].FormatOptions := [foWrapText];

    CoCreateGuid(GUID);
    XL.Filename := GetCurrentDir + '\' + GUIDToString(GUID) + '_выручка.xls';
    XL.Write;
  finally
    XL.Free;
  end;
end;

procedure TReportsForm.ReportMSFOExecute;   // почти законченный вариант, не используется т.к. у компонента ограничение на 255 столбцов
var XL: TXLSReadWriteII4;
    i,k,g: Integer;

    RowCount, ColumnCount: Integer;
    Affected: Integer;
    GUID: TGUID;    Range: TXLSRange;
    QtrColumn, QtrNumber, Month: Integer;

    ReportDate: string;
begin
  try
    // формируем набор данных
    //OpenParamsQ(ReportQuery, 'exec ReportSubcontractDataQtr', ['{54744EC8-9E74-4C9B-993F-A7E3DCC68A65}']);
    ReportQuery.Close;
    ReportQuery.sql.Text := 'exec ReportMSFOData :ReportDate' ;
    ReportDate := '01.' + IntToStr(MonthsCombo.ItemIndex+1) + '.' + string(YearSpin.Value);
    ReportQuery.Parameters.ParamByName('ReportDate').Value := ReportDate;
    ReportQuery.Open;


    DS1.RecordSet := ReportQuery.RecordSet;
    DS2.RecordSet := ReportQuery.NextRecordset(Affected);
    DS3.Recordset := ReportQuery.NextRecordset(Affected);
    DS4.Recordset := ReportQuery.NextRecordset(Affected);
    DS5.Recordset := ReportQuery.NextRecordset(Affected);
    DS6.Recordset := ReportQuery.NextRecordset(Affected);

    // определяем границы набора
    RowCount := DS2.FieldByName('RecordCount').AsInteger;
    ColumnCount := 9;

    // начало формирования плоской таблицы
    XL := TXLSReadWriteII4.Create(nil);
    XL.Sheets.Add();

    // формирование заголовка отчета
    XL.Sheet[0].AsString[1,1] := 'Наименование заказчика';
    TXLSRange(XL.Sheet[0].Range).Items[1,1,1,3].Merged := True;
    XL.Sheet[0].Cell[1,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[1,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[2,1] := '№ и дата договора (перечень доп. соглашений с датами при их наличии)';
    TXLSRange(XL.Sheet[0].Range).Items[2,1,2,3].Merged := True;
    XL.Sheet[0].Cell[2,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[2,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[3,1] := 'ГИП';
    XL.Sheet[0].Cell[3,1].FormatOptions := [foWrapText];
    TXLSRange(XL.Sheet[0].Range).Items[3,1,3,3].Merged := True;
    XL.Sheet[0].Cell[3,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[3,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[4,1] := 'Наименование договора';
    TXLSRange(XL.Sheet[0].Range).Items[4,1,4,3].Merged := True;
    XL.Sheet[0].Cell[4,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[4,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[5,1] := 'Шифр договора (код номенклатуры в 1С)';
    TXLSRange(XL.Sheet[0].Range).Items[5,1,5,3].Merged := True;
    XL.Sheet[0].Cell[5,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[5,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[6,1] := 'Номенклатура в 1С';
    TXLSRange(XL.Sheet[0].Range).Items[6,1,6,3].Merged := True;
    XL.Sheet[0].Cell[6,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[6,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[7,1] := 'Плановый бюджет по договору на';
    TXLSRange(XL.Sheet[0].Range).Items[7,1,7,3].Merged := True;
    XL.Sheet[0].Cell[7,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[7,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[8,1] := 'Итого переходящий остаток на следующий отчетный период, на отчетную дату';
    TXLSRange(XL.Sheet[0].Range).Items[8,1,8,3].Merged := True;
    XL.Sheet[0].Cell[8,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[8,1].VertAlignment := cvaCenter;

    XL.Sheet[0].AsString[9,1] := 'выручка (по актам) с начала действия договора по состоянию на отчетную дату';
    TXLSRange(XL.Sheet[0].Range).Items[9,1,9,3].Merged := True;
    XL.Sheet[0].Cell[9,1].HorizAlignment := chaCenter;
    XL.Sheet[0].Cell[9,1].VertAlignment := cvaCenter;

    // формирование таблицы
    DS1.First;

    i := 4;

    while not DS1.Eof do
      begin
            XL.Sheet[0].AsString[1,i] := DS1.FieldByName('CounterpartName').AsString;
            XL.Sheet[0].AsString[2,i] := DS1.FieldByName('NumbersContractsExt').AsString;
            XL.Sheet[0].AsString[3,i] := DS1.FieldByName('GIP').AsString;
            XL.Sheet[0].AsString[4,i] := DS1.FieldByName('ContractName').AsString;
            XL.Sheet[0].AsString[5,i] := DS1.FieldByName('CodeNumber').AsString;
            XL.Sheet[0].AsString[6,i] := DS1.FieldByName('Nomenclature1C').AsString;
            XL.Sheet[0].AsString[7,i] := DS1.FieldByName('CostPlan').AsString;
            XL.Sheet[0].AsString[8,i] := DS1.FieldByName('CostTotal').AsString;
            XL.Sheet[0].AsString[9,i] := DS1.FieldByName('CostFact').AsString;


            ///// блок выручки по годам
            DS3.Filtered := False;
            DS3.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS3.Filtered := True;
            k := 10;
            if DS3.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS3.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[k,1] := 'в том числе';
                    XL.Sheet[0].Cell[k,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS3.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS3.RecordCount-1,3].FillPatternForeColor := xcLightBrown;
                  end;
                DS3.First;
                while not DS3.Eof do
                  begin
                    XL.Sheet[0].AsString[k,i] := DS3.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[k,3] := DS3.FieldByName('Years').AsString;;
                    Inc(k);
                    DS3.Next;
                  end;
              end;
            //////////////////
            ///
            ///// блок выручки за последний год помесячно
            DS4.Filtered := False;
            DS4.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS4.Filtered := True;
            //k := 10;
            if DS4.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS4.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[k,1] := 'в том числе';
                    XL.Sheet[0].Cell[k,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS4.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS4.RecordCount-1,3].FillPatternForeColor := xcPaleSky;
                  end;
                DS4.First;
                while not DS4.Eof do
                  begin
                    XL.Sheet[0].AsString[k,i] := DS4.FieldByName('CostFact').AsString;
                    Inc(k);
                    DS4.Next;
                  end;
              end;
            //////////////////
            ///
            ///// блок производственной себестоимости
            DS5.Filtered := False;
            DS5.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS5.Filtered := True;
            //k := 10;
            if DS5.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[k+1,1,k+DS5.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[k+1,1] := 'в том числе';
                    XL.Sheet[0].Cell[k+1,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[k+1,1,k+DS5.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS5.RecordCount-1,3].FillPatternForeColor := xcPaleTurquois;
                  end;
                DS5.First;
                while not DS5.Eof do
                  begin
                    XL.Sheet[0].AsString[k,i] := DS5.FieldByName('CostFact').AsString;
                    Inc(k);
                    DS5.Next;
                  end;
              end;
            //////////////////
            ///
            ///
            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 1';
            DS6.Filtered := True;
            g := k;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Фактические затраты по договору с начала действия договора  до 01.01.2011 г.';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcLightOrange;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 2';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Фактические затраты по договору за 2011 г.';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcSky;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 3';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Фактические затраты по договору с начала действия договора  до 01.01.2012 г.';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcRose;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 4';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Фактические затраты по договору за февраль 2012 г.';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcGray40;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Фактические затраты по договору с начала действия договора по состоянию на отчетную дату';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcDarkSky;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostFact').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Плановые расходы на период действия договора по состоянию на отчетную дату';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcRed;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('CostPlan').AsString;
                    XL.Sheet[0].AsString[g,3] := DS6.FieldByName('ArticleName').AsString;
                    XL.Sheet[0].Cell[g,3].HorizAlignment := chaCenter;
                    XL.Sheet[0].Cell[g,3].VertAlignment := cvaCenter;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
                  begin
                    XL.Sheet[0].AsString[g,1] := 'Оставшиеся плановые расходы (S2) до конца срока действия договора по состоянию на отчетную дату';
                    XL.Sheet[0].Cell[g,1].HorizAlignment := chaCenter;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged := True;
                    TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,3].FillPatternForeColor := xcGrass;
                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    XL.Sheet[0].AsString[g,i] := DS6.FieldByName('Rest').AsString;
                    if not TXLSRange(XL.Sheet[0].Range).Items[g,2,g,3].Merged then
                      begin
                        XL.Sheet[0].AsString[g,2] := DS6.FieldByName('ArticleName').AsString;
                        XL.Sheet[0].Cell[g,2].HorizAlignment := chaCenter;
                        XL.Sheet[0].Cell[g,2].VertAlignment := cvaCenter;
                        TXLSRange(XL.Sheet[0].Range).Items[g,2,g,3].Merged := True;
                      end;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            Inc(i);
            DS1.Next;
      end;

    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderInsideVertStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderInsideHorizStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderOutlineStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].FormatOptions := [foWrapText];

    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderInsideVertStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderInsideHorizStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderOutlineStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].FormatOptions := [{foWrapText}];


    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderInsideVertStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderInsideHorizStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderOutlineStyle := cbsThin;

    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderInsideVertStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderInsideHorizStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderOutlineStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].FormatOptions := [foWrapText];

    XL.Sheet[0].Columns.SetColWidth(2,g-1,4000);

    CoCreateGuid(GUID);
    XL.Filename := GetCurrentDir + '\' + GUIDToString(GUID) + '_МСФО.xls';
    XL.Write;
  finally
    XL.Free;
  end;
end;

procedure TReportsForm.ReportMSFOExecute2;   // экспорт средствами COM
var XL: TXLSReadWriteII4;
    i,k,g: Integer;

    RowCount, ColumnCount: Integer;
    Affected: Integer;
    GUID: TGUID;    Range: TXLSRange;
    QtrColumn, QtrNumber, Month: Integer;

    ReportDate: string;
begin
  try
    // формируем набор данных
    //OpenParamsQ(ReportQuery, 'exec ReportSubcontractDataQtr', ['{54744EC8-9E74-4C9B-993F-A7E3DCC68A65}']);
    ReportQuery.Close;
    ReportQuery.sql.Text := 'exec ReportMSFOData :ReportDate' ;
    ReportDate := '01.' + IntToStr(MonthsCombo.ItemIndex+1) + '.' + string(YearSpin.Value);
    ReportQuery.Parameters.ParamByName('ReportDate').Value := ReportDate;
    ReportQuery.Open;


    DS1.RecordSet := ReportQuery.RecordSet;
    DS2.RecordSet := ReportQuery.NextRecordset(Affected);
    DS3.Recordset := ReportQuery.NextRecordset(Affected);
    DS4.Recordset := ReportQuery.NextRecordset(Affected);
    DS5.Recordset := ReportQuery.NextRecordset(Affected);
    DS6.Recordset := ReportQuery.NextRecordset(Affected);

    // определяем границы набора
    RowCount := DS2.FieldByName('RecordCount').AsInteger;
    ColumnCount := 9;

    // начало формирования плоской таблицы
    if not StartExcel(False) then
      begin
        Exit;
      end;

    if not NewWorkbook then
      begin
        Exit;
      end;

    if not AddSheet(Workbook) then
      begin
        Exit;
      end;

    // формирование заголовка отчета
    Excel.Cells.Item[1,1].Value := 'Наименование заказчика';
    Excel.Range[Excel.Cells[1,1],Excel.Cells[3,1]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,2].Value := '№ и дата договора (перечень доп. соглашений с датами при их наличии)';
    Excel.Range[Excel.Cells[1,2],Excel.Cells[3,2]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,3].Value := 'ГИП';
    Excel.Range[Excel.Cells[1,3],Excel.Cells[3,3]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,4].Value := 'Наименование договора';
    Excel.Range[Excel.Cells[1,4],Excel.Cells[3,4]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,5].Value := 'Шифр договора (код номенклатуры в 1С)';
    Excel.Range[Excel.Cells[1,5],Excel.Cells[3,5]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,6].Value := 'Номенклатура в 1С';
    Excel.Range[Excel.Cells[1,6],Excel.Cells[3,6]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,7].Value := 'Плановый бюджет по договору на';
    Excel.Range[Excel.Cells[1,7],Excel.Cells[3,7]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,8].Value := 'Итого переходящий остаток на следующий отчетный период, на отчетную дату';
    Excel.Range[Excel.Cells[1,8],Excel.Cells[3,8]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    Excel.Cells.Item[1,9].Value := 'выручка (по актам) с начала действия договора по состоянию на отчетную дату';
    Excel.Range[Excel.Cells[1,9],Excel.Cells[3,9]].Select;
    Excel.Selection.MergeCells := True;
    Excel.Selection.WrapText := True;
    Excel.Selection.HorizontalAlignment := 3;
    Excel.Selection.VerticalAlignment := 2;

    // формирование таблицы
    DS1.First;

    i := 4;

    while not DS1.Eof do
      begin
             Excel.Cells.Item[i,1].Value := DS1.FieldByName('CounterpartName').AsString;
             Excel.Cells.Item[i,2].Value := DS1.FieldByName('NumbersContractsExt').AsString;
             Excel.Cells.Item[i,3].Value := DS1.FieldByName('GIP').AsString;
             Excel.Cells.Item[i,4].Value := DS1.FieldByName('ContractName').AsString;
             Excel.Cells.Item[i,5].Value := DS1.FieldByName('CodeNumber').AsString;
             Excel.Cells.Item[i,6].Value := DS1.FieldByName('Nomenclature1C').AsString;
             Excel.Cells.Item[i,7].Value := DS1.FieldByName('CostPlan').AsString;
             Excel.Cells.Item[i,8].Value := DS1.FieldByName('CostTotal').AsString;
             Excel.Cells.Item[i,9].Value := DS1.FieldByName('CostFact').AsString;


            ///// блок выручки по годам
            DS3.Filtered := False;
            DS3.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS3.Filtered := True;
            k := 10;
            if DS3.RecordCount > 0 then
              begin
//                if not Excel.Cells.Item[1,k].Value = 'в том числе' then
//                  begin
                    Excel.Cells.Item[1,k].Value := 'в том числе';
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[1,k+DS3.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[3,k+DS3.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(192, 255, 192);
                  //end;
                DS3.First;
                while not DS3.Eof do
                  begin
                    Excel.Cells.Item[i,k].Value := DS3.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,k].Value := DS3.FieldByName('Years').AsString;;
                    Inc(k);
                    DS3.Next;
                  end;
              end;
            //////////////////
            ///
            ///// блок выручки за последний год помесячно
            DS4.Filtered := False;
            DS4.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS4.Filtered := True;
            //k := 10;
            if DS4.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[k,1,k+DS4.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,k].Value := 'в том числе';
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[1,k+DS4.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[3,k+DS4.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(192, 210, 192);
                  //end;
                DS4.First;
                while not DS4.Eof do
                  begin
                   Excel.Cells.Item[i,k].Value := DS4.FieldByName('CostFact').AsString;
                    Inc(k);
                    DS4.Next;
                  end;
              end;
            //////////////////
            ///
            ///// блок производственной себестоимости
            DS5.Filtered := False;
            DS5.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString;
            DS5.Filtered := True;
            //k := 10;
            if DS5.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[k+1,1,k+DS5.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,k+1].Value := 'в том числе';
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[1,k+DS5.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,k],Excel.Cells[3,k+DS5.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(192, 180, 192);
                  //end;
                DS5.First;
                while not DS5.Eof do
                  begin
                    Excel.Cells.Item[i,k] := DS5.FieldByName('CostFact').AsString;
                    Inc(k);
                    DS5.Next;
                  end;
              end;
            //////////////////
            ///
            ///
            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 1';
            DS6.Filtered := True;
            g := k;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Фактические затраты по договору с начала действия договора  до 01.01.2011 г.';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(180, 255, 192);
                  //end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 2';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Фактические затраты по договору за 2011 г.';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(180, 255, 180);
                  //end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 3';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Фактические затраты по договору с начала действия договора  до 01.01.2012 г.';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(180, 180, 180);
//                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 4';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Фактические затраты по договору за февраль 2012 г.';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(180, 190, 180);
//                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Фактические затраты по договору с начала действия договора по состоянию на отчетную дату';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(180, 190, 190);
//                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostFact').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Плановые расходы на период действия договора по состоянию на отчетную дату';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(190, 190, 190);
//                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('CostPlan').AsString;
                    Excel.Cells.Item[3,g] := DS6.FieldByName('ArticleName').AsString;
                    Excel.Range[Excel.Cells[3,g],Excel.Cells[3,g]].Select;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Selection.VerticalAlignment := 2;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            DS6.Filtered := False;
            DS6.Filter := 'ContractID = ' + DS1.FieldByName('ContractID').AsString + ' and ID = 5';
            DS6.Filtered := True;
            if DS6.RecordCount > 0 then
              begin
//                if not TXLSRange(XL.Sheet[0].Range).Items[g,1,g+DS6.RecordCount-1,1].Merged then
//                  begin
                    Excel.Cells.Item[1,g] := 'Оставшиеся плановые расходы (S2) до конца срока действия договора по состоянию на отчетную дату';
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[1,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.MergeCells := True;
                    Excel.Selection.HorizontalAlignment := 3;
                    Excel.Range[Excel.Cells[1,g],Excel.Cells[3,g+DS6.RecordCount-1]].Select;
                    Excel.Selection.Interior.Color := rgb(171, 190, 244);
//                  end;
                DS6.First;
                while not DS6.Eof do
                  begin
                    Excel.Cells.Item[i,g] := DS6.FieldByName('Rest').AsString;
//                    if not TXLSRange(XL.Sheet[0].Range).Items[g,2,g,3].Merged then
//                      begin
                        Excel.Cells.Item[2,g] := DS6.FieldByName('ArticleName').AsString;
                        Excel.Range[Excel.Cells[2,g],Excel.Cells[3,g]].Select;
                        Excel.Selection.HorizontalAlignment := 3;
                        Excel.Selection.VerticalAlignment := 2;
                        Excel.Selection.MergeCells := True;
//                      end;
                    Inc(g);
                    DS6.Next;
                  end;
              end;

            Inc(i);
            DS1.Next;
      end;

//    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderInsideVertStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderInsideHorizStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].BorderOutlineStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,1,9,3].FormatOptions := [foWrapText];
//
//    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderInsideVertStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderInsideHorizStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].BorderOutlineStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[1,4,9,5+RowCount].FormatOptions := [{foWrapText}];
//
//
//    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderInsideVertStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderInsideHorizStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[9,4,g-1,5+RowCount].BorderOutlineStyle := cbsThin;
//
//    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderInsideVertStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderInsideHorizStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].BorderOutlineStyle := cbsThin;
//    TXLSRange(XL.Sheet[0].Range).Items[9,1,g-1,3].FormatOptions := [foWrapText];
//
//    XL.Sheet[0].Columns.SetColWidth(2,g-1,4000);

    CoCreateGuid(GUID);
    SaveWorkBook(GetCurrentDir + '\МСФО_' + GUIDToString(GUID) + '.xls');
  finally
    StopExcel;
  end;
end;

procedure TReportsForm.ReportD1S2Execute;
var XL: TXLSReadWriteII4;
    i,k: Integer;

    RowCount, ColumnCount: Integer;
    Affected: Integer;
    GUID: TGUID;    Range: TXLSRange;
    QtrColumn, QtrNumber, Month: Integer;

    ReportDate: string;
begin
  try
    // формируем набор данных
    //OpenParamsQ(ReportQuery, 'exec ReportSubcontractDataQtr', ['{54744EC8-9E74-4C9B-993F-A7E3DCC68A65}']);
    ReportQuery.Close;
    ReportQuery.sql.Text := 'exec ReportD1S2Data :ReportDate' ;
    ReportDate := '01.' + IntToStr(cxComboBox1.ItemIndex+1) + '.' + string(cxSpinEdit1.Value);
    ReportQuery.Parameters.ParamByName('ReportDate').Value := ReportDate;
    ReportQuery.Open;

    // определяем границы набора
    DS1.RecordSet := ReportQuery.RecordSet;
    DS2.RecordSet := ReportQuery.NextRecordset(Affected);

    RowCount := DS2.FieldByName('RecordCount').AsInteger;
    ColumnCount := 9;

    // начало формирования плоской таблицы
    XL := TXLSReadWriteII4.Create(nil);
    XL.Sheets.Add();

    // формирование заголовка отчета
    XL.Sheet[0].AsString[1,0] := 'Код номенклатуры в 1С (шифр договора)';
    TXLSRange(XL.Sheet[0].Range).Items[1,0,1,1].Merged := True;

    XL.Sheet[0].AsString[2,0] := 'Наименование контрагента в 1С';
    TXLSRange(XL.Sheet[0].Range).Items[2,0,2,1].Merged := True;

    XL.Sheet[0].AsString[3,0] := 'Номенклатурная группа в 1 С';
    TXLSRange(XL.Sheet[0].Range).Items[3,0,3,1].Merged := True;

    XL.Sheet[0].AsString[4,1] := 'Фактические расходы на';
    //TXLSRange(XL.Sheet[0].Range).Items[4,0,4,1].Merged := True;

    XL.Sheet[0].AsString[5,1] := 'Фактические расходы за';
    //TXLSRange(XL.Sheet[0].Range).Items[5,0,5,1].Merged := True;

    XL.Sheet[0].AsString[6,1] := 'Фактические расходы на';
    //TXLSRange(XL.Sheet[0].Range).Items[6,0,6,1].Merged := True;

    XL.Sheet[0].AsString[4,0] := 'Данные по БУ';
    TXLSRange(XL.Sheet[0].Range).Items[4,0,6,0].Merged := True;

    XL.Sheet[0].AsString[7,1] := 'Плановые затраты по договору, Sобщ на';
    //TXLSRange(XL.Sheet[0].Range).Items[7,0,7,1].Merged := True;

    XL.Sheet[0].AsString[8,1] := 'Сумма предстоящих затрат по производству работ, руб. (S2) на';
    //TXLSRange(XL.Sheet[0].Range).Items[8,0,8,1].Merged := True;

    XL.Sheet[0].AsString[9,1] := 'Договорная стоимость работ с учетом корректировок, руб. (D1) без НДС на';
    //TXLSRange(XL.Sheet[0].Range).Items[9,0,9,1].Merged := True;

    XL.Sheet[0].AsString[7,0] := 'вносим в 1С с датой начала месяца, который закрываем';
    TXLSRange(XL.Sheet[0].Range).Items[7,0,9,0].Merged := True;


    // формирование таблицы
    DS1.First;

    i := 2;

    while not DS1.Eof do
      begin
            XL.Sheet[0].AsString[1,i] := DS1.FieldByName('CodeNumber').AsString;
            XL.Sheet[0].AsString[2,i] := DS1.FieldByName('CounterpartName').AsString;
            XL.Sheet[0].AsString[3,i] := DS1.FieldByName('NumbersContractsExt').AsString;
            XL.Sheet[0].AsString[4,i] := DS1.FieldByName('FactBefore').AsString;
            XL.Sheet[0].AsString[5,i] := DS1.FieldByName('FactInto').AsString;
            XL.Sheet[0].AsString[6,i] := DS1.FieldByName('FactTotal').AsString;
            XL.Sheet[0].AsFloat[7,i] := DS1.FieldByName('PlanTotal').AsFloat;
            XL.Sheet[0].AsFloat[8,i] := DS1.FieldByName('S2').AsFloat;
            XL.Sheet[0].AsFloat[9,i] := DS1.FieldByName('D1').AsFloat;
            Inc(i);
            DS1.Next;
      end;

    TXLSRange(XL.Sheet[0].Range).Items[1,0,9,1+RowCount].BorderInsideVertStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,0,9,1+RowCount].BorderInsideHorizStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,0,9,1+RowCount].BorderOutlineStyle := cbsThin;
    TXLSRange(XL.Sheet[0].Range).Items[1,0,9,1+RowCount].FormatOptions := [foWrapText];

    CoCreateGuid(GUID);
    XL.Filename := GetCurrentDir + '\' + GUIDToString(GUID) + '_D1S2.xls';
    XL.Write;
  finally
    XL.Free;
  end;
end;

procedure TReportsForm.StagesReportBtnClick(Sender: TObject);
begin
  ReportStart(TcxButton(Sender).Caption);
end;

procedure TReportsForm.StagesReportBtnMouseEnter(Sender: TObject);
begin
  TcxButton(Sender).SetFocus;
  PageControl.ActivePage := TabSheet2;
end;

procedure TReportsForm.SubcontractRerportBtnClick(Sender: TObject);
begin
  ReportStart(TcxButton(Sender).Caption);
end;

procedure TReportsForm.SubcontractRerportBtnMouseEnter(Sender: TObject);
begin
  TcxButton(Sender).SetFocus;
  PageControl.ActivePage := TabSheet1;
end;

end.
