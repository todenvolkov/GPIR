unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridViewTemplate, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, Menus, cxCustomData, cxStyles,
  cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, dxSkinscxPCPainter, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ADODB, cxSplitter, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxInplaceContainer, StdCtrls, cxButtons, ExtCtrls,
  dxStatusBar, cxPropertiesStore;

type
  TForm2 = class(TForm1)
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1divisionID: TcxGridDBColumn;
    cxGrid1DBTableView1SpecialistCategoryID: TcxGridDBColumn;
    cxGrid1DBTableView1fio: TcxGridDBColumn;
    cxGrid1DBTableView1employeeNumber: TcxGridDBColumn;
    cxGrid1DBTableView1plannedBeginDate: TcxGridDBColumn;
    cxGrid1DBTableView1plannedEndDate: TcxGridDBColumn;
    cxGrid1DBTableView1worktypeId: TcxGridDBColumn;
    cxGrid1DBTableView1plannedHours: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Main;

{$R *.dfm}

end.
