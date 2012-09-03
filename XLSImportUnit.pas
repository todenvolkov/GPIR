unit XLSImportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XLSFonts4, XLSReadWriteII4, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxProgressBar, ComCtrls, Menus, cxButtons, cxLabel,
  cxSSheet, DB, ADODB, cxSplitter, cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, Common;

type
  TXLSImportForm = class(TForm)
    XLSReadWriteII41: TXLSReadWriteII4;
    OpenDialog1: TOpenDialog;
    cxProgressBar1: TcxProgressBar;
    cxSpreadSheet1: TcxSpreadSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel3: TPanel;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    BudgetPanel: TPanel;
    OpenBtn: TcxButton;
    DownloadBtn: TcxButton;
    procedure N1Click(Sender: TObject);
    procedure OpenBtnClick(Sender: TObject);
    procedure DownloadBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    BudgetGUID: Variant;
    ContractID: Integer;
  end;

var
  XLSImportForm: TXLSImportForm;
  DataBeginsCol, DataBeginsRow: Integer;

implementation

uses Main, SQLRoutines1, Files;

{$R *.dfm}

procedure TXLSImportForm.DownloadBtnClick(Sender: TObject);
var XL:TXLSReadWriteII4;
CurString,s,DepartmentName, PostName, ArticleName,  DepartmentGUID, PostGUID:string;   d1,d2:TDateTime;
i,j:integer; OVDUID, FileUID, CellWithDatetime:integer;
budgetGUID,AccountingHourGUID:variant;     ThisIsDepartmentLine:boolean;         value:extended;
BudgetArticleGUID:array[0..100] of string;
CurArticleName: string;
begin
   cxProgressBar1.Position := 0;
   if OpenDialog1.FileName = '' then
     begin
       LogError(RichEdit,'�� ������ ����');
       TopSplitter.OpenSplitter;
       Exit;
     end;

   FormatSettings.DecimalSeparator:='.';
   for j := 0 to 100 do
     BudgetArticleGUID[j]:='';

   budgetGUID:=Null;
   AccountingHourGUID:=Null;

   //Memo1.Lines.Clear;
   xl:=  TXLSReadWriteII4.create(nil);
   xl.Filename:=OpenDialog1.FileName;
   xl.Read;
   cxProgressBar1.Properties.Min:=DataBeginsRow;
   cxProgressBar1.Properties.Max:=XL.Sheets[0].LastRow;

    CurString:=trim(StringReplace(xl.Sheets[0].AsString[DataBeginsCol,DataBeginsRow],',','.',[rfReplaceAll]));
    if CurString='�����/������' then
      LogInfo(RichEdit,'������ ����� ���������� ���������')
    else
    begin
      LogError(RichEdit,'������ ����� ���������� �����������');
      TopSplitter.OpenSplitter;
      exit;
    end;

    DepartmentName:='';
    PostName:='';

    for i:=DataBeginsRow to XL.Sheets[0].LastRow do
    begin
        for j:=DataBeginsCol to XL.Sheets[0].LastCol do
          begin
              //ThisIsDepartmentLine:=false;

              CurString := trim(StringReplace(xl.Sheets[0].AsString[j,i],',','.',[rfReplaceAll]));
              LogInfo(RichEdit,'������'+IntToStr(i)+', ������� '+IntToStr((j))+ ' = ' + CurString);
              CurArticleName := trim(xl.Sheets[0].AsString[j,i]);
              if j=DataBeginsCol then  // ���� ��� ������ �������
                begin
                   {if pos('!',CurString)<>0 then     // ����  �����
                      begin
                         DepartmentName:=CurString;
                         DepartmentName := Copy(DepartmentName,2, Length(DepartmentName) - 1);
                         OpenParamsQ(Adoquery1,'exec DepartmentsAdd :DepartmentName, :BudgetGUID', [DepartmentName, BudgetGUID]);
                         DepartmentGUID:=ADOQuery1.FieldByName('GUID').AsString;
                         ThisIsDepartmentLine:=true;   // ����� ���������� ��� �� ������ �� ������ � ��������� ������. ������ ��������, ��� �� �� ����� ��� ��������, ������ ����������.
                         PostGUID := '';
                      end
                   else      // ���� ���������
                       begin
                         PostName:=CurString;
                         if PostName <> '��������� �����������' then
                           begin
                             OpenParamsQ(Adoquery1,'exec PostsAdd :PostName, :DepartmentGUID, :BudgetGUID', [PostName,DepartmentGUID,BudgetGUID]);
                             PostGUID:=ADOQuery1.FieldByName('GUID').AsString;
                           end else PostGUID := '';
                         ThisIsDepartmentLine:=false;
                       end;}
                 end
               else
                 begin     // �� ������ �������
                     if i=DataBeginsRow then   // ���� ��� ������� ������ � ���������� ������
                      begin
                        ArticleName:=CurArticleName;
                        OpenParamsQ(Adoquery1,'exec BudgetArticleGet :ArticleName, :BudgetGUID', [ArticleName, BudgetGUID]);
                        if ADOQuery1.RecordCount<=0 then
                          begin
                             LogWarning(RichEdit,'�� ������� ������ `'+ArticleName+'` � ������� BudgetArticles ��� �������� ������� BudgetGUID');
                             TopSplitter.OpenSplitter;
                             //exit; //����� �� ��������?
                          end
                        else
                          BudgetArticleGUID[j]:=ADOQuery1.fieldByname('GUID').asString;  //  ��������    BudgetArticleGUID �  ������� ��� j ��������� �������

                      end
                      else     // �� ������ ������� � �� ������ ������ = �� ���� �������� ��������
                      begin
                        // � ����� ������� ������ ���� ���������� GUID ������, ������ ������, ���������. ���� ����-�� ��� - ������� �� ��������� :)
                        if ((length(BudgetArticleGUID[j])<23 ) and (length(PostGUID)<23) and (Length(DepartmentGUID)<23)) or (length(PostGUID)<23) then
                          begin
                            if not ThisIsDepartmentLine then LogWarning(RichEdit,'�� ������ �����-�� �� ���������� "������", "���������" ��� "�����". ');
                            TopSplitter.OpenSplitter;
                            //exit;
                          end
                        else
                        begin  // ���������� ������� ������� ��������
                           if ThisIsDepartmentLine=False then
                            begin
                             //   Value:=strtofloat(CurString);      memo1.lines.add(CurString);
                                OpenParamsQ(Adoquery1,'exec UpdateAccountingHours :Value,  :BudgetArticleGUID, :DepartmentGUID, :PostGUID, :AccountingHourGUID, :BudgetGUID', [CurString, BudgetArticleGUID[j], DepartmentGUID, PostGUID, AccountingHourGUID,BudgetGUID ]);
                            end;
                        end;


                      end;
                 end;
          end;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.add('set dateformat dmy');
        ADOQuery1.SQL.add(s);
        ADOQuery1.ExecSQL;

        cxProgressBar1.Position := i;
        cxProgressBar1.Repaint;
        application.processmessages
   end;

 xl.Destroy;


try
    if FilesForm <> nil then
      begin
        FilesForm.FileToBase(OpenDialog1.FileName, '�����������');
        FilesForm.FilesAccounting.Click;
      end;
finally

end;

end;

procedure TXLSImportForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TXLSImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TXLSImportForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  TopSplitter.CloseSplitter;
end;

procedure TXLSImportForm.N1Click(Sender: TObject);
var
CurRect:Trect;
begin
     //cxLabel1.Caption:=cxSpreadSheet1.CellsNameByRef(0,cxSpreadSheet1.SelectionRect);
     CurRect := cxSpreadSheet1.SelectionRect;
     DataBeginsCol := CurRect.Left;
     DataBeginsRow := CurRect.Top;
end;

procedure TXLSImportForm.OpenBtnClick(Sender: TObject);
var XL:TXLSReadWriteII4;
m,i,j:integer;
begin
if OpenDialog1.Execute then
  begin
    Screen.Cursor:=crHourGlass;
    XL:=TXLSReadWriteII4.Create(nil);
    xl.Filename:=OpenDialog1.FileName;
    xl.Read;
    i:=xl.Sheets[0].LastCol;
    j:=xl.Sheets[0].LastRow;
    cxProgressBar1.Properties.Max:=i;
    cxProgressBar1.Position:=0;
    cxProgressBar1.Visible:=true;
    if j>10 then m:=10 else m:=j;

    for i:=0 to xl.Sheets[0].LastCol do
    begin

      for j:=0 to  m   do
        cxSpreadSheet1.Sheet.GetCellObject(i,j).Text:=xl.Sheets[0].AsString[i,j];

      cxProgressBar1.Position := i;
      cxProgressBar1.Repaint;
      application.ProcessMessages;
    end;

    xl.Destroy;

    Screen.Cursor:=crDefault;
    cxProgressBar1.Position := 0;
    DownloadBtn.Enabled := True;
  end;

end;

end.
