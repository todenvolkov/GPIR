unit XLS1CImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, ComCtrls, StdCtrls, cxButtons, cxSplitter, cxTextEdit, cxMemo, cxRichEdit, ExtCtrls,
  cxSSheet, cxProgressBar, DB, ADODB, XLSFonts4, XLSReadWriteII4, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  SQLRoutines1, Files;

type
  TXLS1CImportForm = class(TForm)
    XLSReadWriteII41: TXLSReadWriteII4;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cxProgressBar1: TcxProgressBar;
    cxSpreadSheet1: TcxSpreadSheet;
    Panel3: TPanel;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    BudgetPanel: TPanel;
    OpenBtn: TcxButton;
    DownloadBtn: TcxButton;
    MonthsCombo: TcxComboBox;
    YearSpin: TcxSpinEdit;
    TestBtn: TcxButton;
    procedure OpenBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DownloadBtnClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TestBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure Load1C;
    procedure Load1CTotal;
    procedure LoadKASAccepted;
    procedure LoadKASRealized;
    procedure TestLoadKASRealized;
    procedure TestLoad1CTotal;
    procedure TestLoadKASTotal;
    procedure LoadKASTotal;
    procedure TestLoad1CCalc;
    procedure Load1CCalc;
  public
    { Public declarations }
    Operation: string;
  end;

var
  XLS1CImportForm: TXLS1CImportForm;
  DataBeginsCol, DataBeginsRow: Integer;

implementation
     uses Main, Common;
{$R *.dfm}

procedure TXLS1CImportForm.DownloadBtnClick(Sender: TObject);
begin
   if OpenDialog1.FileName = '' then
     begin
       LogError(RichEdit,'Не выбран файл');
       TopSplitter.OpenSplitter;
       Exit;
     end;
  if Operation = '1C' then
    begin
      Load1C;
    end;
  if Operation = '1CTotal' then
    begin
      Load1CTotal;
    end;
  if Operation = 'KASAccepted' then
    begin
      LoadKASAccepted;
    end;
  if Operation = 'KASRealized' then
    begin
      LoadKASRealized;
    end;
  if Operation = 'KASTotal' then
    begin
      LoadKASTotal;
    end;
  if Operation = '1CCalc' then
    begin
      Load1CCalc;
    end;
end;

procedure TXLS1CImportForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TXLS1CImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  OpenDialog1.FileName := '';
end;

procedure TXLS1CImportForm.FormCreate(Sender: TObject);
begin
  YearSpin.Value := CurrentYear;
end;

procedure TXLS1CImportForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  DownloadBtn.Enabled := False;

  if Operation = '1C' then
    begin
      Caption := 'Загрузка фактических затрат из 1С (Excel)';
      DownLoadBtn.Enabled := True;
    end;
  if Operation = '1CTotal' then
    begin
      Caption := 'Загрузка затрат из 1С итогом (Excel)';
      YearSpin.Visible := False;
      MonthsCombo.Visible := False;
    end;
  if Operation = 'KASAccepted' then
    begin
      Caption := 'Загрузка принятых субподрядных ПИР из КАС (Excel)';
      DownLoadBtn.Enabled := True;
    end;
  if Operation = 'KASRealized' then
    begin
      Caption := 'Загрузка реализованных ПИР из КАС (Excel)';
    end;
  if Operation = 'KASTotal' then
    begin
      Caption := 'Загрузка выручки из КАС итогом (Excel)';
      YearSpin.Visible := False;
      MonthsCombo.Visible := False;
    end;
  if Operation = '1CCalc' then
    begin
      Caption := 'Загрузка калькуляции из Excel';
      YearSpin.Visible := False;
      MonthsCombo.Visible := False;
    end;
  //TopSplitter.CloseSplitter;
  DataBeginsCol := 0;
  DataBeginsRow := 0;
end;

procedure TXLS1CImportForm.N1Click(Sender: TObject);
var CurRect:Trect;
begin
     CurRect:=cxSpreadSheet1.SelectionRect;
     DataBeginsCol:=CurRect.Left;
     DataBeginsRow:=CurRect.Top;
end;

procedure TXLS1CImportForm.OpenBtnClick(Sender: TObject);
var XL: TXLSReadWriteII4;
    m,i,j: Integer;
begin
  try
    if OpenDialog1.Execute then
      begin
        try
        Screen.Cursor := crHourGlass;
        XL := TXLSReadWriteII4.Create(nil);
        XL.Filename:=OpenDialog1.FileName;
        XL.Read;
        i := XL.Sheets[0].LastCol;
        j  := XL.Sheets[0].LastRow;
        cxProgressBar1.Properties.Max := i;
        cxProgressBar1.Position:=0;

        if j > 10 then m := 10 else m := j;
        for i := 0 to xl.Sheets[0].LastCol do
          begin
            for j := 0 to  m   do
            cxSpreadSheet1.Sheet.GetCellObject(i,j).Text := XL.Sheets[0].AsString[i,j];
            cxProgressBar1.Position := i;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;

        XL.Destroy;

        Screen.Cursor := crDefault;
        finally
          Screen.Cursor := crDefault;
        end;
      end;
  except
    Close;
  end;
  if OpenDialog1.FileName = '' then Close;
end;

procedure TXLS1CImportForm.TestBtnClick(Sender: TObject);
begin
  if Operation = '1C' then
    begin
      //TestLoad1C;
    end;
  if Operation = '1CTotal' then
    begin
      TestLoad1CTotal;
    end;
  if Operation = 'KASAccepted' then
    begin
      //TestLoadKASAccepted;
    end;
  if Operation = 'KASRealized' then
    begin
      TestLoadKASRealized;
    end;
  if Operation = 'KASTotal' then
    begin
      TestLoadKASTotal;
    end;
  if Operation = '1CCalc' then
    begin
      TestLoad1CCalc;
    end;

end;

procedure TXLS1CImportForm.Load1C;
var XL: TXLSReadWriteII4;
    CellValue: Variant;
    i,j: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CellValue := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CellValue = 'Код статьи затрат 1С' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 1 then
          begin
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec FactValues1CAddOrChange :ArticleCode1C, :ArticleCode, :ArticleName,' +
                                       ':DepartmentCode, :DepartmentName, :ContractCode, :ContractName,' +
                                       ':DateCost, :FactValue';
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CellValue := Trim(xl.Sheets[0].AsString[j,i]);
                //LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CellValue);
                if j = DataBeginsCol then MainForm.Query.Parameters.ParamByName('ArticleCode1C').Value := CellValue;
                if j = DataBeginsCol + 1 then MainForm.Query.Parameters.ParamByName('ArticleCode').Value := CellValue;
                if j = DataBeginsCol + 2 then MainForm.Query.Parameters.ParamByName('ArticleName').Value := CellValue;
                if j = DataBeginsCol + 3 then MainForm.Query.Parameters.ParamByName('DepartmentCode').Value := CellValue;
                if j = DataBeginsCol + 4 then MainForm.Query.Parameters.ParamByName('DepartmentName').Value := CellValue;
                if j = DataBeginsCol + 5 then MainForm.Query.Parameters.ParamByName('ContractCode').Value := CellValue;
                if j = DataBeginsCol + 6 then MainForm.Query.Parameters.ParamByName('ContractName').Value := CellValue;
                if j = DataBeginsCol + 7 then MainForm.Query.Parameters.ParamByName('DateCost').Value := CellValue;
                if j = DataBeginsCol + 8 then
                  begin
                    if (CellValue = '') or (CellValue = '-') then CellValue := '0';
                    MainForm.Query.Parameters.ParamByName('FactValue').Value := StrToFloat(CellValue);
                  end;
              end;

            MainForm.Query.ExecSQL;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;
  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Затраты из &1С');
        FilesForm.N11.Click;
        try
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec FactValues1CProcessing';
          MainForm.Query.Open;
        except
        end;
      end;
  end;
end;

procedure TXLS1CImportForm.Load1CTotal;
var XL: TXLSReadWriteII4;
    CellValue: Variant;
    i,j: Integer;
begin
  try
    cxProgressBar1.Position := 0;
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CellValue := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CellValue = 'Договор' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 1 then
          begin
            MainForm.Query.Close;

            MainForm.Query.SQL.Text := 'exec RestExpensesAddOrChange :ContractName, :ContractCode, :ArticleNumber,' +
                                       ':ArticleName, :ArticleCode, :CalcType, :PlanValue,' +
                                       ':FactValue, :Months, :Years';

            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CellValue := Trim(xl.Sheets[0].AsString[j,i]);
                //LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CellValue);
                if j = DataBeginsCol then MainForm.Query.Parameters.ParamByName('ContractName').Value := CellValue;
                if j = DataBeginsCol + 1 then MainForm.Query.Parameters.ParamByName('ContractCode').Value := CellValue;
                if j = DataBeginsCol + 2 then MainForm.Query.Parameters.ParamByName('ArticleNumber').Value := CellValue;
                if j = DataBeginsCol + 3 then MainForm.Query.Parameters.ParamByName('ArticleName').Value := CellValue;
                if j = DataBeginsCol + 4 then MainForm.Query.Parameters.ParamByName('ArticleCode').Value := CellValue;
                if j = DataBeginsCol + 5 then MainForm.Query.Parameters.ParamByName('CalcType').Value := CellValue;
                if j = DataBeginsCol + 6 then
                  begin
                    if (CellValue = '') or (CellValue = '-') then CellValue := '0';
                    MainForm.Query.Parameters.ParamByName('PlanValue').Value := StrToFloat(CellValue);
                  end;
                if j = DataBeginsCol + 7 then
                  begin
                    if (CellValue = '') or (CellValue = '-') then CellValue := '0';
                    MainForm.Query.Parameters.ParamByName('FactValue').Value := StrToFloat(CellValue);
                  end;
                if j = DataBeginsCol + 8 then
                  begin
                    if (CellValue = '') or (CellValue = '-') then CellValue := '0';
                    MainForm.Query.Parameters.ParamByName('Months').Value := StrToInt(CellValue);
                  end;
                if j = DataBeginsCol + 9 then
                  begin
                    if (CellValue = '') or (CellValue = '-') then CellValue := '0';
                    MainForm.Query.Parameters.ParamByName('Years').Value := StrToInt(CellValue);
                  end;
              end;

            MainForm.Query.ExecSQL;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;
  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Затраты из 1С итогом');
        FilesForm.N13.Click;
        try
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec RestExpensesProcessing';
          MainForm.Query.Open;
        except
        end;
      end;
  end;
end;

procedure TXLS1CImportForm.LoadKASAccepted;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;


    GeneralCustomerName, ContractCode, ContractName, GIP, StageName, StageRegNumber,
    CustomerName, CustomerCode, NumberSPContract, ContractValue, FactValue,
    ActNumber, ActDate, InvoiceNumber, InvoiceDate: string;
    DContractValue, DFactValue: Real;
    DActDate, DInvoiceDate: TDateTime;
    Months, Years: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'Генеральный заказчик' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    Months := MonthsCombo.ItemIndex + 1;
    Years := YearSpin.Value;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 2 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol then
                  begin
                    GeneralCustomerName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 1 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 2 then
                  begin
                    ContractName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 3 then
                  begin
                    GIP := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 4 then
                  begin
                    StageName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 5 then
                  begin
                    StageRegNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    CustomerName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 7 then
                  begin
                    CustomerCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 8 then
                  begin
                    NumberSPContract := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 9 then
                  begin
                    ContractValue := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DContractValue := StrToFloat(ContractValue);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 10 then
                  begin
                    FactValue := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DFactValue := StrToFloat(FactValue);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 11 then
                  begin
                    ActNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 12 then
                  begin
                    ActDate := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DActDate:= StrToDate(ActDate);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 13 then
                  begin
                    InvoiceNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 14 then
                  begin
                    InvoiceDate := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DInvoiceDate:= StrToDate(InvoiceDate);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;
              end;

             if i > DataBeginsRow + 1 then
              if PostFlag then
                 begin
                   OpenParamsQ(AdoQuery1,'exec FactValuesKASAcceptedAddOrChange :GeneralCustomerName, :ContractCode, :ContractName, :GIP, :StageName, :StageRegNumber,'
                                       + ':CustomerName, :CustomerCode, :NumberSPContract, :ContractValue, :FactValue, :ActNumber, :ActDate, :InvoiceNumber, :InvoiceDate,'
                                       + ':Months, :Years, :RecordType',
                        [GeneralCustomerName, ContractCode, ContractName, GIP, StageName, StageRegNumber, CustomerName, CustomerCode, NumberSPContract,
                         ContractValue, FactValue, ActNumber, ActDate, InvoiceNumber, InvoiceDate, Months, Years, 'Принято ПИР']);

                   LogInfo(RichEdit,'Строка успешно перенесена.');
                 end else
                 begin
                   LogError(RichEdit,'Строка имеет ошибки и не перенесена!');
                 end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Принято ПИР');
        FilesForm.FilesKAS1.Click;
        try
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec FactKASAcceptedProcessing';
          MainForm.Query.Open;
        except
        end;
      end;
  end;
end;

procedure TXLS1CImportForm.TestLoad1CTotal;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;


    ContractName, ContractCode, ArticleNumber, ArticleName, ArticleCode, CalcType: string;
    PlanValue, FactValue: string;
    Years, Months: string;

    DPlanValue, DFactValue: Real;
    DYears, DMonths: Integer;

    ErrorCount: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'Договор' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    //Months := MonthsCombo.ItemIndex + 1;
    //Years := YearSpin.Value;

    ErrorCount := 0;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 1 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol then
                  begin
                    ContractName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', договор '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', договор '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 1 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 2 then
                  begin
                    ArticleNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', номер статьи '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', номер статьи '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 3 then
                  begin
                    ArticleName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', статья затрат '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', статья затрат '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 4 then
                  begin
                    ArticleCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', код статьи затрат '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', код статьи затрат '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 5 then
                  begin
                    CalcType := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', вид бюджета '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', вид бюджета '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    PlanValue := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', сумма плановых затрат по статье '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DPlanValue := StrToFloat(PlanValue);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', сумма плановых затрат по статье '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 7 then
                  begin
                    FactValue := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', сумма фактических затрат по статье '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DFactValue := StrToFloat(FactValue);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', сумма фактических затрат по статье '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;


                if j = DataBeginsCol + 8 then
                  begin
                    Months := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', месяц '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DMonths := StrToInt(Months);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', месяц '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 9 then
                  begin
                    Years := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', год '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DYears := StrToInt(Years);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', год '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;
              end;

            if i > DataBeginsRow + 1 then
              if PostFlag then
                 begin
                   OpenParamsQ(AdoQuery1,'exec OneCTotalTest :ContractCode', [ContractCode]);
                   if AdoQuery1.FieldByName('ResultValue').AsString = 'Exist' then
                   begin
                     LogError(RichEdit,'Автоматическая загрузка не может выполняться в существующий договор, шифр - ' + ContractCode);
                     Inc(ErrorCount);
                   end else
                       begin
                         //LogInfo(RichEdit,'Строка может быть успешно перенесена.');
                       end;
                 end else
                 begin
                   LogError(RichEdit,'Строка имеет ошибки и не будет переноситься!');
                 end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

    if ErrorCount = 0 then
      begin
        DownLoadBtn.Enabled := True;
        LogInfo(RichEdit,'Загрузка доступна. Нажмите кнопку Загрузить.');
      end else
      begin
        DownloadBtn.Enabled := False;
        LogError(RichEdit,'Загрузка будет возможна после исправления файла.');
      end;
  finally
    xl.Free;
     cxProgressBar1.Position := 0;
  end;
end;

procedure TXLS1CImportForm.TestLoadKASTotal;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;


    ContractName, ContractCode, StageName, StageRegNumber, CalcType, WorkType, Cost,
    DateStart, DateFinish, DateStageClose, DateStageRealize, CostPlan, CostFact: string;
    Years, Months: string;

    DCost, DCostPlan, DCostFact: Real;
    DYears, DMonths: Integer;

    DDateStart, DDateFinish, DDateStageClose, DDateStageRealize: TDateTime;

    ErrorCount: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'Наименование договора' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    //Months := MonthsCombo.ItemIndex + 1;
    //Years := YearSpin.Value;

    ErrorCount := 0;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 1 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol then
                  begin
                    ContractName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', договор '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', договор '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 1 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 2 then
                  begin
                    StageName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', этап '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', этап '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 3 then
                  begin
                    StageRegNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', рег. номер этапа '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', рег. номер этапа '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 4 then
                  begin
                    CalcType := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', вид бюджета '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', вид бюджета '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 5 then
                  begin
                    WorkType := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', вид работ '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end;// else LogInfo(RichEdit,'Строка'+IntToStr(i)+', вид работ '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    Cost := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', договорная стоимость '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DCost := StrToFloat(Cost);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', договорная стоимость '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', договорная стоимость '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 7 then
                  begin
                    DateStart := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', начало работ по этапу '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DDateStart:= StrToDate(DateStart);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', начало работ по этапу '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', начало работ по этапу '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 8 then
                  begin
                    DateFinish := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', окончание работ по этапу '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DDateFinish := StrToDate(DateFinish);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', окончание работ по этапу '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', окончание работ по этапу '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 9 then
                  begin
                    DateStageClose := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', ожидаемая дата завершения '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DDateStageClose := StrToDate(DateStageClose);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', ожидаемая дата завершения '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', ожидаемая дата завершения '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 10 then
                  begin
                    DateStageRealize := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', планируемая дата реализации '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DDateStageRealize := StrToDate(DateStageRealize);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', планируемая дата реализации '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', планируемая дата реализации '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 11 then
                  begin
                    CostPlan := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', плановая сумма выручки '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DCostPlan := StrToFloat(CostPlan);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', плановая сумма выручки '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', плановая сумма выручки '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 12 then
                  begin
                    CostFact := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', фактическая реализация '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DCostFact := StrToFloat(CostFact);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', фактическая реализация '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', фактическая реализация '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 13 then
                  begin
                    Months := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', месяц '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DMonths := StrToInt(Months);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', месяц '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 14 then
                  begin
                    Years := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', год '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                        Inc(ErrorCount);
                      end else
                      begin
                        try
                          DYears := StrToInt(Years);
                          //LogInfo(RichEdit,'Строка'+IntToStr(i)+', год '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                          Inc(ErrorCount);
                        end;
                      end;
                  end;
              end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

    if ErrorCount = 0 then
      begin
        DownLoadBtn.Enabled := True;
        LogInfo(RichEdit,'Загрузка доступна. Нажмите кнопку Загрузить.');
      end else
      begin
        DownloadBtn.Enabled := False;
        LogError(RichEdit,'В ходе проверки были обнаружены ошибки. Загрузка будет возможна после исправления файла.');
      end;
  finally
    xl.Free;
     cxProgressBar1.Position := 0;
  end;
end;

procedure TXLS1CImportForm.TestLoadKASRealized;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;

    GIP, CustomerName, CustomerCode, ContractName, ContractCode, StageName, StageRegNumber,
    ShippedAll, OwnForces, SubcontractSumma, ActNumber, ActDate, DateCloseAct, CloseState: string;
    DActDate, DDateCloseAct: TDateTime;
    DShippedAll, DOwnForces, DSubcontractSumma: Real;
    Months, Years: Integer;

    ErrorCount: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'ГИП' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    Months := MonthsCombo.ItemIndex + 1;
    Years := YearSpin.Value;

    ErrorCount := 0;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 2 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol + 3 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', шифр договора '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    StageRegNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', рег. номер этапа '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', рег. номер этапа '+IntToStr((j))+ ' = ' + CurString);
                  end;
              end;

            if i > DataBeginsRow + 1 then
              if PostFlag then
                 begin
                   OpenParamsQ(AdoQuery1,'exec FactKASRealizedTest :ContractCode, :StageRegNumber', [ContractCode, StageRegNumber]);
                   if AdoQuery1.FieldByName('ResultValue').AsString = 'None' then
                   begin
                     LogError(RichEdit,'Этап не найден.');
                     Inc(ErrorCount);
                   end else
                       begin
                         LogInfo(RichEdit,'Строка может быть успешно перенесена.');
                       end;
                 end else
                 begin
                   LogError(RichEdit,'Строка имеет ошибки и не будет переноситься!');
                 end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

  finally
    xl.Free;
    if ErrorCount = 0 then
      begin
        DownLoadBtn.Enabled := True;
        LogInfo(RichEdit,'Загрузка доступна. Для начала выберите месяц, год. Нажмите кнопку Загрузить.');
      end else
      begin
        DownloadBtn.Enabled := False;
        LogError(RichEdit,'Загрузка будет возможна после исправления файла.');
      end;

  end;
end;

procedure TXLS1CImportForm.LoadKASRealized;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;

    GIP, CustomerName, CustomerCode, ContractName, ContractCode, StageName, StageRegNumber,
    ShippedAll, OwnForces, SubcontractSumma, ActNumber, ActDate, DateCloseAct, CloseState: string;
    DActDate, DDateCloseAct: TDateTime;
    DShippedAll, DOwnForces, DSubcontractSumma: Real;
    Months, Years: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'ГИП' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    Months := MonthsCombo.ItemIndex + 1;
    Years := YearSpin.Value;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 2 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol then
                  begin
                    GIP := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 1 then
                  begin
                    CustomerName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 2 then
                  begin
                    CustomerCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 3 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 4 then
                  begin
                    ContractName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 5 then
                  begin
                    StageName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    StageRegNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 7 then
                  begin
                    ShippedAll := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DShippedAll := StrToFloat(ShippedAll);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 8 then
                  begin
                    OwnForces := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DOwnForces := StrToFloat(OwnForces);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 9 then
                  begin
                    SubcontractSumma := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DSubcontractSumma := StrToFloat(SubcontractSumma);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 10 then
                  begin
                    ActNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 11 then
                  begin
                    ActDate := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DActDate:= StrToDate(ActDate);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 12 then
                  begin
                    DateCloseAct := CurString;

                        try
                          if Length(CurString) > 0 then DDateCloseAct := StrToDate(DateCloseAct);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;

                  end;

                if j = DataBeginsCol + 13 then
                  begin
                    CloseState := CurString;
                    LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;
              end;

            if i > DataBeginsRow + 1 then
              if PostFlag then
                 begin
                   OpenParamsQ(AdoQuery1,'exec FactValuesKASRealizedAddOrChange :GIP, :CustomerName, :CustomerCode, :ContractCode, :ContractName,'
                     + ' :StageName, :StageRegNumber, :ShippedAll, :OwnForces, :Subcontract, :ActNumber, :ActDate, :DateCloseAct, :CloseState, :Months, :Years, :RecordType',
                        [GIP, CustomerName, CustomerCode, ContractCode, ContractName,
                             StageName, StageRegNumber, ShippedAll, OwnForces, SubcontractSumma, ActNumber, ActDate, DateCloseAct, CloseState, Months, Years, 'Реализовано ПИР']);
                   //Caption := AdoQuery1.Fields[1].Value;
                   LogInfo(RichEdit,'Строка успешно перенесена.');
                 end else
                 begin
                   LogError(RichEdit,'Строка имеет ошибки и не перенесена!');
                 end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Реализовано ПИР');
        FilesForm.FilesKAS2.Click;
        try
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec FactKASRealizedProcessing';
          MainForm.Query.Open;
        except
        end;
      end;
  end;
end;


procedure TXLS1CImportForm.LoadKASTotal;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;
    PostFlag: Boolean;

    ContractName, ContractCode, StageName, StageRegNumber,
    CalcType, TypeWork, Cost, DateStart, DateFinish, DateStageClose,
    DateStageRealize, CostPlan, CostFact, Months, Years: string;
    DDateStart, DDateFinish, DDataStageClose, DDateStageRealize: TDateTime;
    DCost, DCostPlan, DCostFact: Real;
    DMonths, DYears: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'Наименование договора' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        if i >= DataBeginsRow + 1 then
          begin
            PostFlag := True;
            for j := DataBeginsCol to XL.Sheets[0].LastCol do
              begin
                CurString := Trim(xl.Sheets[0].AsString[j,i]);

                if j = DataBeginsCol then
                  begin
                    ContractName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 1 then
                  begin
                    ContractCode := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 2 then
                  begin
                    StageName := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 3 then
                  begin
                    StageRegNumber := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 4 then
                  begin
                    CalcType := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 5 then
                  begin
                    TypeWork := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;

                if j = DataBeginsCol + 6 then
                  begin
                    Cost := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DCost := StrToFloat(Cost);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 7 then
                  begin
                    DateStart := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DDateStart:= StrToDate(DateStart);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 8 then
                  begin
                    DateFinish := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DDateFinish:= StrToDate(DateFinish);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 9 then
                  begin
                    DateStageClose := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DDataStageClose := StrToDate(DateStageClose);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 10 then
                  begin
                    DateStageRealize := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DDateStageRealize:= StrToDate(DateStageRealize);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 11 then
                  begin
                    CostPlan := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DCostPlan := StrToFloat(CostPlan);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 12 then
                  begin
                    CostFact := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DCostFact := StrToFloat(CostFact);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 13 then
                  begin
                    Months := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DMonths := StrToInt(Months);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;

                if j = DataBeginsCol + 14 then
                  begin
                    Years := CurString;
                    if CurString = '' then
                      begin
                        PostFlag := False;
                        LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                        TopSplitter.OpenSplitter;
                      end else
                      begin
                        try
                          DYears := StrToInt(Years);
                          LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                        except
                          PostFlag := False;
                          LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в число');
                          TopSplitter.OpenSplitter;
                        end;
                      end;
                  end;
              end;

            if i >= DataBeginsRow + 1 then
              if PostFlag then
                 begin
                   OpenParamsQ(AdoQuery1,'exec RestRevenueAddOrChange :ContractName, :ContractCode, :StageName, :StageRegNumber,' +
                                         ':CalcType, :TypeWork, :Cost, :DateStart, :DateFinish, :DateStageClose,' +
                                         ':DateStageRealize, :CostPlan, :CostFact, :Months, :Years',
                        [ContractName, ContractCode, StageName, StageRegNumber,
                   CalcType, TypeWork, Cost, DateStart, DateFinish, DateStageClose,
                   DateStageRealize, CostPlan, CostFact, Months, Years]);
                   //Caption := AdoQuery1.Fields[1].Value;
                   LogInfo(RichEdit,'Строка успешно перенесена.');
                 end else
                 begin
                   LogError(RichEdit,'Строка имеет ошибки и не перенесена!');
                 end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
          end;
      end;

  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Выручка из КАС итогом');
        FilesForm.FilesKAS2.Click;
        try
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec RestRevenueProcessing';
          MainForm.Query.Open;
        except
        end;
      end;
  end;
end;


procedure TXLS1CImportForm.TestLoad1CCalc;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;

    ErrorCount: Integer;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'отдел/статья' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      Inc(ErrorCount);
      TopSplitter.OpenSplitter;
      Exit;
    end;

    ErrorCount := 0;

    for i := DataBeginsCol + 1 to XL.Sheets[0].LastCol do
      begin
        CurString := Trim(xl.Sheets[0].AsString[i,DataBeginsRow]);
        OpenParamsQ(AdoQuery1,'exec Excel1CCalcTest :Code, :CodeType', [CurString, 'Article']);
        if AdoQuery1.FieldByName('ResultValue').AsString = 'None' then
          begin
            LogError(RichEdit,'Статья с кодом ' + CurString + ' не найдена.');
            Inc(ErrorCount);
        end;
      end;

    for i := DataBeginsRow + 1 to XL.Sheets[0].LastRow do
      begin
        CurString := Trim(xl.Sheets[0].AsString[DataBeginsCol,i]);
        if Copy(CurString,1,1) = '!' then
          begin
            OpenParamsQ(AdoQuery1,'exec Excel1CCalcTest :Code, :CodeType', [Copy(CurString, 2, Length(CurString)-1), 'Depart']);
            if AdoQuery1.FieldByName('ResultValue').AsString = 'None' then
              begin
                LogError(RichEdit,'Отдел с кодом ' + Copy(CurString, 2, Length(CurString)-1) + ' не найден.');
                Inc(ErrorCount);
              end;
          end else
          begin
            OpenParamsQ(AdoQuery1,'exec Excel1CCalcTest :Code, :CodeType', [CurString, 'Post']);
            if AdoQuery1.FieldByName('ResultValue').AsString = 'None' then
              begin
                LogError(RichEdit,'Категория специалиста с кодом ' + CurString + ' не найдена.');
                Inc(ErrorCount);
              end;
          end;
      end;

    for i := DataBeginsRow + 1 to XL.Sheets[0].LastRow do
      begin
        for j := DataBeginsCol + 1 to XL.Sheets[0].LastCol do
          begin
            CurString := Trim(xl.Sheets[0].AsString[j,i]);
            if CurString = '' then
              begin
                LogError(RichEdit,'Строка'+IntToStr(i)+', значение калькуляции '+IntToStr((j))+ ' = ' + ' пустая ячейка');
                Inc(ErrorCount);
                TopSplitter.OpenSplitter;
              end;
          end;
      end;

  finally
    xl.Free;
    if ErrorCount = 0 then
      begin
        DownLoadBtn.Enabled := True;
        LogInfo(RichEdit,'Загрузка доступна.');
      end else
      begin
        DownloadBtn.Enabled := False;
        LogError(RichEdit,'Загрузка будет возможна после исправления файла.');
      end;

  end;
end;

procedure TXLS1CImportForm.Load1CCalc;
var XL: TXLSReadWriteII4;
    CurString: Variant;
    i,j: Integer;

    ErrorCount: Integer;
    DepartmentCode, PostCode, ArticleCode: string;
begin
  try
    xl := TXLSReadWriteII4.create(nil);
    xl.Filename := OpenDialog1.FileName;
    xl.Read;
    cxProgressBar1.Properties.Min := DataBeginsRow;
    cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

    CurString := Trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'отдел/статья' then
      LogInfo(RichEdit,'Начало файла определено правильно')
    else begin
      LogError(RichEdit,'Начало файла определено НЕправильно');
      Inc(ErrorCount);
      TopSplitter.OpenSplitter;
      Exit;
    end;

    ErrorCount := 0;

    for i := DataBeginsRow to XL.Sheets[0].LastRow do
      begin
        for j := DataBeginsCol to XL.Sheets[0].LastCol do
          begin
            CurString := Trim(xl.Sheets[0].AsString[j,i]);
            if CurString <> '' then
              begin

                if (j = DataBeginsCol) and (i <> DataBeginsRow) then
                  begin
                    if Copy(CurString,1,1)= '!' then
                      begin
                        DepartmentCode := Copy(CurString, 2, Length(CurString)-1);
                      end else
                      begin
                        PostCode := CurString;
                      end;
                  end;

                if (j <> DataBeginsCol) and (i <> DataBeginsRow) then
                  begin
                    ArticleCode := Trim(xl.Sheets[0].AsString[j,DataBeginsRow]);
                    if (DepartmentCode <> '') and (PostCode <> '') and (ArticleCode <> '') then
                      begin
                        OpenParamsQ(Adoquery1,'exec UpdateAccountingHours2 :Value, :BudgetArticleGUID, :DepartmentGUID, :PostGUID',
                        [DepartmentCode, PostCode, ArticleCode, CurString]);
                      end;
                  end;

              end;
          end;

            cxProgressBar1.Position := cxProgressBar1.Position + 1;
            cxProgressBar1.Repaint;
            Application.ProcessMessages;
      end;

  finally
    xl.Free;
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, 'Калькуляции');
        FilesForm.N2.Click;
      end;
  end;
end;

end.
