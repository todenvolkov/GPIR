unit Journal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ADODB, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons;

type
  TJournalForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    JournalDatasource: TDataSource;
    JournalQuery: TADOQuery;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1version: TcxGridDBColumn;
    cxGrid1DBTableView1UsernameChange: TcxGridDBColumn;
    cxGrid1DBTableView1DateChange: TcxGridDBColumn;
    cxGrid1DBTableView1IntelliRecordState: TcxGridDBColumn;
  private
    { Private declarations }
  public
   procedure InitWithJournal(JournalName:string; GUID:string='');
    { Public declarations }
  end;

var
  JournalForm: TJournalForm;

implementation

uses Main, routines;

{$R *.dfm}

procedure TJournalForm.initWithJournal(JournalName:string; GUID:string='');
var s:string;
begin
 JournalQuery.close;

 if JournalName<>'' then
  if GUID<>'' then
      begin
         s:='SELECT [ID],[version], [UsernameChange], [DateChange], [IntelliRecordState] FROM  '+  JournalName+ ' where GUID ='+#39+GUID+#39;
         OpenQ(JournalQuery,S,true);
      end;


end;
end.
