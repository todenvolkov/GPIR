unit NewTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxLabel, cxMemo, Menus, StdCtrls, cxButtons, Tasks, cxCheckListBox;

type
  TNewTaskForm = class(TForm)
    BudgetEdit: TcxLookupComboBox;
    ActionEdit: TcxLookupComboBox;
    DateStartEdit: TcxDateEdit;
    DateFinishEdit: TcxDateEdit;
    PriorityEdit: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    CommentEdit: TcxMemo;
    cxButton2: TcxButton;
    UserGetterEdit: TcxCheckListBox;
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateStartEditPropertiesEditValueChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;
  end;

var
  NewTaskForm: TNewTaskForm;

implementation

uses Main;

{$R *.dfm}

procedure TNewTaskForm.cxButton2Click(Sender: TObject);
var i: Integer;
begin
  try
  if TasksForm <> nil then
    begin
      for i := 0 to UserGetterEdit.Items.Count - 1 do
        begin
          if UserGetterEdit.Items[i].Checked then
            begin
              TasksForm.cxGridDBTableView1.DataController.Insert;
              TasksForm.Query.FieldByName('UserGetterID').Value := UserGetterEdit.Items[i].ImageIndex;
              TasksForm.Query.FieldByName('BudgetGUID').Value := BudgetEdit.EditValue;
              TasksForm.Query.FieldByName('ActionGUID').Value := ActionEdit.EditValue;
              TasksForm.Query.FieldByName('DateStart').Value := DateStartEdit.EditValue;
              TasksForm.Query.FieldByName('DateFinish').Value := DateFinishEdit.EditValue;
              TasksForm.Query.FieldByName('Priority').Value := PriorityEdit.EditValue;
              TasksForm.Query.FieldByName('Comment').Value := CommentEdit.EditValue;
              TasksForm.cxGridDBTableView1.DataController.Post;
              TasksForm.SendMail;
            end;
        end;
    end;
  finally
    Close;
  end;
end;

procedure TNewTaskForm.DateStartEditPropertiesEditValueChanged(Sender: TObject);
begin
  DateFinishEdit.EditValue := DateStartEdit.EditValue;
end;

procedure TNewTaskForm.FormActivate(Sender: TObject);
begin
  MainForm.ActivateTab(MainForm.TabSet, TForm(Sender));
end;

procedure TNewTaskForm.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TNewTaskForm.RefreshData;
begin
  try
  if TasksForm <> nil then
    begin
      TasksForm.RefreshData;

      UserGetterEdit.Items.Clear;
      UserGetterEdit.SetFocus;
      BudgetEdit.EditValue := Null;
      ActionEdit.EditValue := Null;
      DateStartEdit.EditValue := Null;
      DateFinishEdit.EditValue := Null;
      PriorityEdit.ItemIndex := 0;
      CommentEdit.EditValue := 'Нет комментария';

      while not TasksForm.UserGetQ.Eof do
        begin
          UserGetterEdit.Items.Add;
          UserGetterEdit.Items[UserGetterEdit.Items.Count-1].Text := TasksForm.UserGetQ.FieldByName('UserName').AsString;
          UserGetterEdit.Items[UserGetterEdit.Items.Count-1].ImageIndex := TasksForm.UserGetQ.FieldByName('ID').AsInteger;
          TasksForm.UserGetQ.Next;
        end;
    end;
  finally
  end;
end;


end.
