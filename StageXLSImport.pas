unit StageXLSImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSImportUnit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, Menus, DB, ADODB, XLSFonts4, XLSReadWriteII4, ComCtrls, StdCtrls, cxButtons,
  cxSplitter, cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, cxSSheet, cxProgressBar, Common, SQLRoutines1;

type
  TStageXLSImportForm = class(TXLSImportForm)
    procedure OpenBtnClick(Sender: TObject);
    procedure DownloadBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StageXLSImportForm: TStageXLSImportForm;

implementation

uses Main;

{$R *.dfm}

procedure TStageXLSImportForm.DownloadBtnClick(Sender: TObject);
var XL: TXLSReadWriteII4;
    CurString: string;
    i, j: Integer;
    ID, StageRegNumber, ContractName, StageName, Summa, TypeWork, DateStart, DateFinish, CalcType: string;
    PostFlag: Boolean;
    DStart, DFinish: TDatetime;
    DSumma: Real;
begin
   if OpenDialog1.FileName = '' then
     begin
       LogError(RichEdit,'Не выбран файл');
       TopSplitter.OpenSplitter;
       Exit;
     end;

   FormatSettings.DecimalSeparator:='.';

   xl := TXLSReadWriteII4.create(nil);
   xl.Filename := OpenDialog1.FileName;
   xl.Read;
   cxProgressBar1.Properties.Min := DataBeginsRow;
   cxProgressBar1.Properties.Max := XL.Sheets[0].LastRow;

   CurString := trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString = 'ИД' then
      LogInfo(RichEdit,'Начало данных определено правильно')
    else
    begin
      LogError(RichEdit,'Начало данных определено НЕправильно');
      TopSplitter.OpenSplitter;
      Exit;
    end;


    for i := DataBeginsRow+1 to XL.Sheets[0].LastRow do
      begin
        PostFlag := True;
        for j := DataBeginsCol to XL.Sheets[0].LastCol do
          begin
            CurString := trim(StringReplace(xl.Sheets[0].AsString[j,i],',','.',[rfReplaceAll]));
            //LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);

            if j = DataBeginsCol then begin ID := CurString; end;
            if j = DataBeginsCol+1 then
              begin
                StageRegNumber := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
              end;
            if j = DataBeginsCol+2 then
              begin
                ContractName := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
              end;
            if j = DataBeginsCol+3 then
              begin
                StageName := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
              end;
            if j = DataBeginsCol+4 then
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
                      DStart := StrToDate(DateStart);
                      LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                    except
                      PostFlag := False;
                      LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                      TopSplitter.OpenSplitter;
                    end;
                  end;
              end;
            if j = DataBeginsCol+5 then
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
                      DFinish:= StrToDate(DateFinish);
                      LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                    except
                      PostFlag := False;
                      LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в дату');
                      TopSplitter.OpenSplitter;
                    end;
                  end;
              end;
            if j = DataBeginsCol+6 then
              begin
                Summa := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else
                  begin
                    try
                      DSumma := StrToFloat(Summa);
                      LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                    except
                      PostFlag := False;
                      LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' не удалось преобразовать в сумму');
                      TopSplitter.OpenSplitter;
                    end;
                  end;
              end;
            if j = DataBeginsCol+7 then
              begin
                TypeWork := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else
                  begin
                    LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;
              end;
            if j = DataBeginsCol+8 then
              begin
                CalcType := CurString;
                if CurString = '' then
                  begin
                    PostFlag := False;
                    LogError(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString + ' пустая ячейка');
                    TopSplitter.OpenSplitter;
                  end else
                  begin
                    LogInfo(RichEdit,'Строка'+IntToStr(i)+', колонка '+IntToStr((j))+ ' = ' + CurString);
                  end;
              end;
            //OpenParamsQ(Adoquery1,'exec DepartmentsAdd :DepartmentName, :BudgetGUID', [DepartmentName, BudgetGUID]);
            cxProgressBar1.Position:=cxProgressBar1.Position+1;
            cxProgressBar1.Repaint;
            application.processmessages;
          end;
        if i > DataBeginsRow then
         if PostFlag then
          begin

            OpenParamsQ(Adoquery1,'exec StageAddOrChange :StageName, :StageRegNumber, :ContractName, :ContractID,'
                 + ' :Summa, :TypeWork, :DateStart, :DateFinish, :BudgetGUID, :CalcType', [StageName, StageRegNumber, ContractName, ContractID,
                     Summa, TypeWork, DateStart, DateFinish, BudgetGUID, CalcType]);
            LogInfo(RichEdit,'Этап успешно перенесен.');
          end else
          begin
            LogError(RichEdit,'Этап имеет ошибки и не перенесен в форму!');
          end;

   end;

 xl.Destroy;
end;

procedure TStageXLSImportForm.FormActivate(Sender: TObject);
begin
  inherited;
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TStageXLSImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TStageXLSImportForm.OpenBtnClick(Sender: TObject);
begin
  inherited;
  //
end;

end.
