unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxDBLookupComboBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, ADODB, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TForm3 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    WorkQ: TADOQuery;
    WorkDS: TDataSource;
    BudgetArticlesQ: TADOQuery;
    BudgetArticlesDS: TDataSource;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1Value: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn;
    cxGrid1DBTableView1AccountingHourGUID: TcxGridDBColumn;
    cxGrid1DBTableView1BudgetArticleGUID: TcxGridDBColumn;
    cxGrid1DBTableView1PostGUID: TcxGridDBColumn;
    cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn;
    ADOQuery1: TADOQuery;
    cv: TDataSource;
    Q2: TADOQuery;
    DataSource1: TDataSource;
    procedure cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  cxGridDBDataDefinitions, cxVariants, cxLookupDBGrid;

procedure TForm3.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var
  DC: TcxGridDBDataController;
  idxClass, idxName: Integer;
begin
  DC := TcxGridDBTableView(Sender).DataController;

  // do not allow input medName until medClass is not chosen
  if TcxGridDBColumn(AItem).DataBinding.FieldName = 'PostGUID' then
  begin
    idxClass := DC.GetItemByFieldName('DepartmentGUID').Index;
    AAllow := not VarIsSoftNull(DC.Values[DC.FocusedRecordIndex, idxClass]);
  end

end;

procedure TForm3.cxGrid1DBTableView1InitEdit(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
var MedClassValue: Variant;
  LGrid: TcxCustomLookupDBGrid;
  colClassID: TcxLookupDBGridColumn;
  LookupProp: TcxLookupComboBoxProperties;

  colMedClassIndex, colMedNameIndex: Integer;

  DC: TcxGridDBDataController;
begin
      if AItem = cxGrid1DBTableView1PostGUID then  // Medication Name
  begin
    DC := TcxGridDBDataController(Sender.DataController);
  colMedClassIndex := DC.GetItemByFieldName('DepartmentGUID').Index;
  MedClassValue := DC.Values[DC.FocusedRecordIndex, colMedClassIndex];

    if Q2.Active then
      Q2.Close;

    Q2.Parameters.ParamByName('DepartmentGUID').Value := MedClassValue;

    LookupProp := TcxLookupComboBox(AEdit).Properties;
    LookupProp.ListSource := cv;
    Q2.Open;
  end;
end;

end.
