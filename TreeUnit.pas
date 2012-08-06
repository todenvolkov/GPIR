unit TreeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxInplaceContainer, DB,
  ADODB, routines, ImgList, ActnList,
  ActnMan, ExtCtrls, PlatformDefaultStyleActnCtrls, ActnPopup, cxContainer, cxEdit, Buttons;

type
  TTreeForm = class(TForm)
    cxTreeList1: TcxTreeList;
    cxTreeList1Column1: TcxTreeListColumn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cxImageList1: TcxImageList;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    sprMenu: TPopupActionBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N9: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    NavigatorMenu: TPopupActionBar;
    N22: TMenuItem;
    Filter: TcxTextEdit;
    HintLabel: TLabel;
    procedure cxTreeList1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxTreeList1Deletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
    procedure sprMenuChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure NavigatorMenuPopup(Sender: TObject);
    procedure cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure FilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FilterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HintLabelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HintLabelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetItemCount(BudgetGUID, ActionName, Count: string);
    procedure LoadContracts(FilterText: string);
  end;

type
  PFolder = ^TFolder;

  TFolder = record
    ID: int64;
    GUID: string[42];
    WindowName: string;
    WindowType: string;
    ActionName: string;
    WindowOptions: string;
    BudgetGUID: string[42];
    ContractID: integer;
    State: string;
    Bold: Integer;
    // ID, GUID, WindowName, WindowType,ActionName, WindowOptions
    // NodeType:set of string ['Contract','Budget','Form','Dictionary','CalculationGroup','Calculation'];
  end;

var
  TreeForm: TTreeForm;

implementation

uses Main, TaskBar, SQLRoutines1, Budgets, Hint;
{$R *.dfm}

procedure TTreeForm.cxButton1Click(Sender: TObject);
begin
  FormCreate(Sender);

end;

procedure TTreeForm.cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
var ptr: PFolder;
begin

  ptr := AViewInfo.Node.Data;
  if ptr <> nil then
  if ((ptr.WindowType = 'Задачи') or (ptr.WindowType = 'Задача')) and (ptr.Bold > 0) then
    begin
      //ACanvas.Brush.Color := 9500108;
      ACanvas.Font.Style := [fsBold];
      ACanvas.FillRect(AViewInfo.EditRect);
    end;
end;

procedure TTreeForm.cxTreeList1DblClick(Sender: TObject);
var
  ptr, parent: PFolder;
  newnode: TcxTreeListNode;
  AComponent: TComponent;
  Plan: string;
  BudgetGUIDTemp: Variant;

begin
  if cxTreeList1.SelectionCount > 0 then
    begin
      cxTreeList1.BeginUpdate;
      Screen.Cursor := crHourGlass;
      ptr := cxTreeList1.Selections[0].Data;
      parent := ptr;
      cxTreeList1.Selections[0].DeleteChildren;
      if 'Договора' = ptr.WindowType then
        begin
          //OpenParamsQ(MainForm.Query, 'exec BudgetsToContractShow ', [ptr.ID]);
            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec BudgetsToContractShow :ID';
            MainForm.Query.Parameters.ParamByName('ID').Value := ptr.ID;
            MainForm.Query.Open;

          while not(MainForm.Query.eof) do
            begin
              new(ptr);
              ptr.ID := MainForm.Query.fieldbyname('ID').asinteger;
              ptr.WindowName := MainForm.Query.fieldbyname('BudgetNameMod').asString;
              ptr.GUID := MainForm.Query.fieldbyname('GUID').asString;
              ptr.BudgetGUID := ptr.GUID;
              ptr.ContractID := parent.ContractID;
              ptr.WindowType := 'Бюджеты';
              ptr.WindowOptions := '';
              ptr.State := MainForm.Query.fieldbyname('State').asString;
              newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
              if MainForm.Query.fieldbyname('NeedCalcUpdate').AsBoolean then newnode.Values[0] := '[Calc] ' + ptr.WindowName
                else newnode.Values[0] := '[Ok] ' + ptr.WindowName;
              newnode.ImageIndex := 1;
              newnode.SelectedIndex := 1;
              MainForm.Query.Next;
            end;
        end
      else if 'Бюджеты' = ptr.WindowType then
        begin
          // openq(adoquery1,'exec [BudgetsToContractShow] '+inttostr(ptr.ID));
          if ptr.State = 'Закрыт' then
            begin
              new(ptr);
              ptr.ID := 0;
              ptr.WindowName := 'Локальные справочники';
              ptr.GUID := '';
              ptr.WindowType := 'Локальные справочники';
              ptr.BudgetGUID := parent.BudgetGUID;
              ptr.ContractID := parent.ContractID;
              ptr.State := parent.State;
              newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
              newnode.Values[0] := ptr.WindowName;
              newnode.ImageIndex := 3;
              newnode.SelectedIndex := 3;
            end;

          new(ptr);
          ptr.ID := 0;
          ptr.WindowName := 'Формы';
          ptr.GUID := '';
          ptr.WindowType := 'Формы';
          ptr.BudgetGUID := parent.BudgetGUID;
          ptr.ContractID := parent.ContractID;
          ptr.State := Parent.State;
          newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
          newnode.Values[0] := ptr.WindowName;
          newnode.ImageIndex := 2;
          newnode.SelectedIndex := 2;

          new(ptr);
          ptr.ID := 0;
          ptr.WindowName := 'Задачи';
          ptr.WindowType := 'Задачи';
          ptr.GUID := '';
          ptr.BudgetGUID := parent.BudgetGUID;
          ptr.ContractID := parent.ContractID;

          MainForm.ADOQuery1.Close;
          MainForm.ADOQuery1.SQL.Text := 'exec TaskGetRecordCount :BudgetGUID, :UserID';
          MainForm.ADOQuery1.Parameters.ParamByName('BudgetGUID').Value := parent.BudgetGUID;
          MainForm.ADOQuery1.Parameters.ParamByName('UserID').Value := MainForm.UserID;
          MainForm.ADOQuery1.Open;
          if MainForm.ADOQuery1.RecordCount > 0 then
            begin
              if MainForm.ADOQuery1.FieldByName('TaskNotViewed').AsInteger > 0 then
                begin
                  ptr.Bold := MainForm.ADOQuery1.FieldByName('TaskNotViewed').AsInteger;
                end else
                begin
                  ptr.Bold := 0;
                end;
            end;

          newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
          newnode.Values[0] := ptr.WindowName;
          newnode.ImageIndex := 1;
          newnode.SelectedIndex := 1;

          if ptr.Bold > 0 then
            begin
              newnode.Values[0] := ptr.WindowName + ' (' + MainForm.ADOQuery1.FieldByName('TaskNotViewed').AsString + '/' +
                      MainForm.ADOQuery1.FieldByName('TaskCount').AsString + ')';
            end else
            begin
              newnode.Values[0] := ptr.WindowName + ' (' + MainForm.ADOQuery1.FieldByName('TaskCount').AsString + ')';
            end;



        end
      else if 'Локальные справочники' = ptr.WindowType then
        begin
          //openq(ADOQuery1, 'exec ApplicationDictionariesShow ');

            MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec ApplicationDictionariesShow';
            MainForm.Query.Open;
          while not(MainForm.Query.eof) do
            begin
              new(ptr);
              ptr.WindowName := MainForm.Query.fieldbyname('WindowName').asString;
              ptr.ID := MainForm.Query.fieldbyname('id').asinteger;
              ptr.GUID := MainForm.Query.fieldbyname('GUID').asString;
              ptr.ActionName := MainForm.Query.fieldbyname('ActionName').asString;
              ptr.WindowType := MainForm.Query.fieldbyname('WindowType').asString;
              ptr.WindowOptions := MainForm.Query.fieldbyname
                ('WindowOptions').asString;
              ptr.BudgetGUID := parent.BudgetGUID;
              ptr.ContractID := parent.ContractID;
              ptr.State := parent.State;
              newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
              newnode.Values[0] := ptr.WindowName;
              newnode.ImageIndex := 3;
              newnode.SelectedIndex := 3;
              MainForm.Query.Next;
            end;
        end
      else if 'Формы' = ptr.WindowType then
        begin
          //openq(ADOQuery1, 'exec [ApplicationFormsShow] ');
          MainForm.Query.Close;
            MainForm.Query.SQL.Text := 'exec ApplicationFormsShow';
            MainForm.Query.Open;
          while not(MainForm.Query.eof) do
            begin
              new(ptr);
              ptr.WindowName := MainForm.Query.fieldbyname('WindowName').asString;
              ptr.ID := MainForm.Query.fieldbyname('id').asinteger;
              ptr.GUID := MainForm.Query.fieldbyname('GUID').asString;
              ptr.ActionName := MainForm.Query.fieldbyname('ActionName').asString;
              ptr.WindowType := MainForm.Query.fieldbyname('WindowType').asString;
              ptr.WindowOptions := MainForm.Query.fieldbyname
                ('WindowOptions').asString;
              ptr.BudgetGUID := parent.BudgetGUID;
              ptr.ContractID := parent.ContractID;
              ptr.State := parent.State;
              newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);


              //// считаем количество -
                  if ptr.ActionName = 'ActPlannedWork' then Plan := 'PlannedWork';
                  if ptr.ActionName =   'ActPlannedWorkOISI' then Plan := 'PlannedWorkOISI';
                  if ptr.ActionName =   'ActPlannedRent' then Plan := 'PlannedRent';
                  if ptr.ActionName =   'ActPlannedTransport' then Plan := 'PlannedTransport';
                  if ptr.ActionName =   'ActPlannedManualValue' then Plan := 'PlannedManualValue';
                  if ptr.ActionName =   'ActPlannedTrips' then Plan := 'PlannedTrips';
                  if ptr.ActionName =   'ActPlannedTripsShift' then Plan := 'PlannedTripsShift';
                  if ptr.ActionName =   'ActPlannedStages' then Plan := 'PlannedStages';
                  if ptr.ActionName =   'ActPlannedSubcontract' then Plan := 'PlannedSubcontract';

                  MainForm.ADOQuery1.Close;
                  MainForm.ADOQuery1.SQL.Text := 'exec PlanGetRecordCount :BudgetGUID, :Plan';
                  MainForm.ADOQuery1.Parameters.ParamByName('BudgetGUID').Value := parent.BudgetGUID;
                  MainForm.ADOQuery1.Parameters.ParamByName('Plan').Value := Plan;
                  MainForm.ADOQuery1.Open;
              ///

              newnode.Values[0] := ptr.WindowName + ' (' + MainForm.ADOQuery1.FieldByName('BudgetAll').AsString + ')';
              newnode.ImageIndex := 2;
              newnode.SelectedIndex := 2;
              MainForm.Query.Next;
            end;
        end
     else if 'Задачи' = ptr.WindowType then
        begin
          //openq(ADOQuery1, 'exec [ApplicationCalculationsShow] ');
          MainForm.Query.Close;
          MainForm.Query.SQL.Text := 'exec TasksBudgetShow :BudgetGUID, :UserID';
          MainForm.Query.Parameters.ParamByName('BudgetGUID').Value := parent.BudgetGUID;
          MainForm.Query.Parameters.ParamByName('UserID').Value := MainForm.UserID;
          MainForm.Query.Open;
          while not(MainForm.Query.eof) do
            begin
              new(ptr);
              ptr.WindowName := 'Задача №' + MainForm.Query.fieldbyname('id').AsString;
              ptr.ID := MainForm.Query.fieldbyname('id').asinteger;
              ptr.GUID := MainForm.Query.fieldbyname('GUID').asString;
              ptr.ActionName := 'ActTasksSpecial';
              ptr.WindowType := 'Задача';
              ptr.WindowOptions := '';
              ptr.BudgetGUID := parent.BudgetGUID;
              ptr.ContractID := parent.ContractID;
              ptr.Bold := Integer(not MainForm.Query.fieldbyname('Viewed').AsBoolean);

              newnode := cxTreeList1.AddChild(cxTreeList1.Selections[0], ptr);
              newnode.Values[0] := ptr.WindowName;
              newnode.ImageIndex := 1;
              newnode.SelectedIndex := 1;
              MainForm.Query.Next;
            end;
        end
      else if ('Справочник' = ptr.WindowType) or ('Формы ввода' = ptr.WindowType) then
        begin

            AComponent := mainform.FindComponent(ptr.ActionName);
            if Assigned(AComponent) then
              if AComponent is TCustomAction then
                begin
                  GlobalBudgetGUID := ptr.BudgetGUID;
                  GlobalContractID := ptr.ContractID;
                  if ptr.State = 'Закрыт' then
                    begin
                      GlobalBudgetGUIDForSpr := GlobalBudgetGUID;
                    end else
                        begin
                          GlobalBudgetGUIDForSpr := Null;
                        end;
                  TCustomAction(AComponent).execute;
                end;


        end
        else if ('Задача' = ptr.WindowType) then
        begin
            AComponent := mainform.FindComponent(ptr.ActionName);
            if Assigned(AComponent) then
              if AComponent is TCustomAction then
                begin
                  TAction(AComponent).Hint := IntToStr(ptr.ID);
                  GlobalBudgetGUID := ptr.BudgetGUID;
                  GlobalContractID := ptr.ContractID;
                  if ptr.State = 'Закрыт' then
                    begin
                      GlobalBudgetGUIDForSpr := GlobalBudgetGUID;
                    end else
                        begin
                          GlobalBudgetGUIDForSpr := Null;
                        end;
                  TCustomAction(AComponent).execute;
                end;
        end;
      cxTreeList1.Selections[0].Expand(true);
      cxTreeList1.EndUpdate;
      Screen.Cursor := crDefault;
    end;
end;

procedure TTreeForm.cxTreeList1Deletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
begin
 try
 if ANode<>nil then
  if ANode.Data<>nil then
      Anode.Data:=nil;
 except

 end;
end;

procedure TTreeForm.FilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Filter.Text <> '') and (Filter.Text <> 'Поиск по шифру договора') then
    begin
      LoadContracts('RecordState = ' + #39 + 'Доступен' + #39 +  ' and CodeNumber like ' + #39 + '%'+ Filter.Text + '%' + #39);
    end else
        begin
          Filter.Text := 'Поиск по шифру договора';
          Filter.SelectAll;
          LoadContracts('RecordState = ' + #39 + 'Доступен' + #39);
        end;
end;

procedure TTreeForm.FilterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Filter.SelectAll;
end;

procedure TTreeForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TTreeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.DeleteTab(MainForm.TabSet, TForm(Sender));
  MainForm.ActNavigator.Checked := False;
end;

procedure TTreeForm.HintLabelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Cu: TPoint;
begin
  GetCursorPos(Cu);
  HintForm.Left := Cu.X;
  HintForm.Top := Cu.Y;
  HintForm.Show;
end;

procedure TTreeForm.HintLabelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  HintForm.Close;
end;

procedure TTreeForm.LoadContracts(FilterText: string);
var
  ptr: PFolder;
  newnode: TcxTreeListNode;
begin
  TreeForm.Left:=5;
  TreeForm.top:=MainForm.top+MainForm.Height+5;
  TreeForm.Width:=300;
  TreeForm.Height:=Screen.Height-50-MainForm.top-MainForm.Height;
  cxTreeList1.BeginUpdate;
  cxTreeList1.Clear;
  openq(ADOQuery1, 'exec NumberContractsShow');
  ADOQuery1.Filter :=  FilterText;
  ADOQuery1.Filtered := True;
  cxTreeList1Column1.Caption.Text := 'Всего договоров: ' + IntToStr(ADOQuery1.RecordCount);
  while not(ADOQuery1.eof) do
    begin
      new(ptr);
      ptr.ID := ADOQuery1.fieldbyname('id').asinteger;
      if not VarIsNull(ADOQuery1.fieldbyname('CodeNumber').AsVariant) then
        if ADOQuery1.fieldbyname('CodeNumber').AsString <> '' then
          begin
            ptr.WindowName := ADOQuery1.fieldbyname('CodeNumber').AsString + '.' +
                              ADOQuery1.fieldbyname('Name').asString;
          end else
          begin
            ptr.WindowName := ADOQuery1.fieldbyname('Name').asString;
          end;
      ptr.WindowType := 'Договора';
      ptr.ContractID := ptr.ID;
      newnode := cxTreeList1.Add(nil, ptr);
      newnode.Values[0] := ptr.WindowName;
      newnode.ImageIndex := 0;
      newnode.SelectedIndex := 0;
      ADOQuery1.Next;
    end;
  cxTreeList1.EndUpdate;

end;

procedure TTreeForm.FormCreate(Sender: TObject);
begin
  LoadContracts('RecordState = ' + #39 + 'Доступен' + #39);
end;

procedure TTreeForm.FormShow(Sender: TObject);
begin
  MainForm.AddTab(MainForm.TabSet, TTabObject.Create(TForm(Sender), 1));
  MainForm.ActNavigator.Checked := True;
end;

procedure TTreeForm.N22Click(Sender: TObject);
var ptr: PFolder;
    node: TcxTreeListNode;
    Options: CreateOptionsBudgets;
begin
  if cxTreeList1.SelectionCount > 0 then
    begin
      ptr := cxTreeList1.Selections[0].Data;
      if 'Бюджеты' = ptr.WindowType then
        begin
          Options.FormCaption := 'Бюджеты';
          ShowBudgets(Options, ptr.ContractID, ptr.ID);
        end;
    end;
end;

procedure TTreeForm.NavigatorMenuPopup(Sender: TObject);
var ptr: PFolder;
begin
  NavigatorMenu.Items.Items[0].Visible := True;
  if cxTreeList1.SelectionCount > 0 then
    begin
      ptr := cxTreeList1.Selections[0].Data;
      if 'Бюджеты' <> ptr.WindowType then
        begin
          NavigatorMenu.Items.Items[0].Visible := False;
        end;
    end;
end;

procedure TTreeForm.sprMenuChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  GlobalBudgetGUID := Null;
  GlobalContractID := 0;
end;

procedure TTreeForm.SetItemCount(BudgetGUID, ActionName, Count: string);
var i: Integer;
    Data: PFolder;
begin
  for i := 0 to cxTreeList1.AbsoluteCount - 1 do
    begin
      Data := PFolder(cxTreeList1.AbsoluteItems[i].Data);
      if (Data.ActionName = ActionName) and (Data.BudgetGUID = BudgetGUID) then
        begin
          cxTreeList1.AbsoluteItems[i].Values[0] := Data.WindowName + ' (' + Count + ')';
          Break;
        end;
    end;
end;

end.
