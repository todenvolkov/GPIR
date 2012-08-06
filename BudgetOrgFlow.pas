unit BudgetOrgFlow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxContainer, cxEdit,
  cxRichEdit, cxTextEdit, cxMemo, cxSplitter, ExtCtrls, dxorgchr, dxdborgc, DB, ADODB, Grids, DBGrids, ImgList, DBTables;

type
  TBudgetOrgFlowForm = class(TForm)
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    BudgetInfoMemo: TcxMemo;
    RichEdit: TcxRichEdit;
    TopSplitter: TcxSplitter;
    cxLookAndFeelController: TcxLookAndFeelController;
    Table1: TTable;
    Table1ID: TAutoIncField;
    Table1PARENT: TIntegerField;
    Table1NAME: TStringField;
    Table1CDATE: TDateField;
    Table1CBY: TStringField;
    Table1WIDTH: TIntegerField;
    Table1HEIGHT: TIntegerField;
    Table1TYPE: TStringField;
    Table1COLOR: TIntegerField;
    Table1IMAGE: TIntegerField;
    Table1IMAGEALIGN: TStringField;
    Table1ORDER: TIntegerField;
    Table1ALIGN: TStringField;
    DataSource1: TDataSource;
    ilTree: TcxImageList;
    ColorDialog: TColorDialog;
    DBTree: TdxDbOrgChart;
    OrgFlowQ: TADOQuery;
    procedure DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetImageAlign(const AAlignName: string): TdxOcImageAlign;
    function GetNodeAlign(const AAlignName: string): TdxOcNodeAlign;
    function GetShape(const AShapeName: String): TdxOcShape;
  end;

var
  BudgetOrgFlowForm: TBudgetOrgFlowForm;

implementation
     uses Main, routines;
{$R *.dfm}



procedure TBudgetOrgFlowForm.DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
begin
  with Node, OrgFlowQ do
  begin
    //Width := FindField('width').AsInteger;
    Height := FindField('height').AsInteger;
    //ImageIndex := 1;//FindField('Image').AsInteger;
    //ImageAlign := GetImageAlign(FindField('ImageAlign').AsString);
    //Shape := GetShape(FindField('type').AsString);
    Color := FindField('color').AsInteger;
    //ChildAlign := GetNodeAlign(FindField('Align').AsString);

  end;
end;

function TBudgetOrgFlowForm.GetImageAlign(const AAlignName: string): TdxOcImageAlign;
const
  AlignMap: array[TdxOcImageAlign] of string = (
   'None',
   'Left-Top', 'Left-Center', 'Left-Bottom',
   'Right-Top', 'Right-Center', 'Right-Bottom',
   'Top-Left', 'Top-Center', 'Top-Right',
   'Bottom-Left', 'Bottom-Center', 'Bottom-Right');
var
  AIndex: TdxOcImageAlign;
begin
  Result := Low(TdxOcImageAlign);
  for AIndex := Low(TdxOcImageAlign) to High(TdxOcImageAlign) do
    if SameText(AlignMap[AIndex], AAlignName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

function TBudgetOrgFlowForm.GetNodeAlign(const AAlignName: string): TdxOcNodeAlign;
const
  AlignMap: array[TdxOcNodeAlign] of string = ('Left', 'Center', 'Right');
var
  AIndex: TdxOcNodeAlign;
begin
  Result := Low(TdxOcNodeAlign);
  for AIndex := Low(TdxOcNodeAlign) to High(TdxOcNodeAlign) do
    if SameText(AlignMap[AIndex], AAlignName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

function TBudgetOrgFlowForm.GetShape(const AShapeName: String): TdxOcShape;
const
  ShapeMap: array[TdxOcShape] of string = ('Rectange', 'Round Rect', 'Ellipse', 'Diamond');
var
  AIndex: TdxOcShape;
begin
  Result := Low(TdxOcShape);
  for AIndex := Low(TdxOcShape) to High(TdxOcShape) do
    if SameText(ShapeMap[AIndex], AShapeName) then
    begin
      Result := AIndex;
      Break;
    end;
end;

procedure TBudgetOrgFlowForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TBudgetOrgFlowForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
end;

procedure TBudgetOrgFlowForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  TopSplitter.CloseSplitter;
  OpenQ(OrgFlowQ,' exec BudgetOrgFlowShow');

  DBTree.WidthFieldName  := 'Width';
  DBTree.HeightFieldName := 'Height'
end;

end.
