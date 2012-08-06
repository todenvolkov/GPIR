object NewTaskForm: TNewTaskForm
  Left = 1361
  Top = 175
  BorderIcons = [biSystemMenu]
  Caption = #1053#1086#1074#1072#1103' '#1079#1072#1076#1072#1095#1072
  ClientHeight = 344
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BudgetEdit: TcxLookupComboBox
    Left = 105
    Top = 111
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'GUID'
    Properties.ListColumns = <
      item
        FieldName = 'BudgetNameExt'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = TasksForm.BudgetDS
    TabOrder = 1
    Width = 296
  end
  object ActionEdit: TcxLookupComboBox
    Left = 105
    Top = 138
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'GUID'
    Properties.ListColumns = <
      item
        FieldName = 'ActionCaption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = TasksForm.ActionDS
    TabOrder = 2
    Width = 296
  end
  object DateStartEdit: TcxDateEdit
    Left = 105
    Top = 165
    Properties.OnEditValueChanged = DateStartEditPropertiesEditValueChanged
    TabOrder = 3
    Width = 296
  end
  object DateFinishEdit: TcxDateEdit
    Left = 105
    Top = 192
    TabOrder = 4
    Width = 296
  end
  object PriorityEdit: TcxComboBox
    Left = 105
    Top = 219
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1042' '#1086#1073#1099#1095#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
      #1057#1088#1086#1095#1085#1086)
    TabOrder = 5
    Text = #1042' '#1086#1073#1099#1095#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
    Width = 296
  end
  object cxLabel1: TcxLabel
    Left = 70
    Top = 9
    Caption = #1050#1086#1084#1091
  end
  object cxLabel2: TcxLabel
    Left = 53
    Top = 112
    Caption = #1041#1102#1076#1078#1077#1090
  end
  object cxLabel3: TcxLabel
    Left = 46
    Top = 139
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
  end
  object cxLabel4: TcxLabel
    Left = 25
    Top = 166
    Caption = #1050#1086#1075#1076#1072' '#1085#1072#1095#1072#1090#1100
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 193
    Caption = #1050#1086#1075#1076#1072' '#1079#1072#1082#1086#1085#1095#1080#1090#1100
  end
  object cxLabel6: TcxLabel
    Left = 40
    Top = 220
    Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
  end
  object cxLabel7: TcxLabel
    Left = 28
    Top = 247
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object CommentEdit: TcxMemo
    Left = 105
    Top = 246
    Lines.Strings = (
      #1053#1077#1090' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1103)
    TabOrder = 6
    Height = 53
    Width = 296
  end
  object cxButton2: TcxButton
    Left = 309
    Top = 311
    Width = 92
    Height = 25
    Caption = 'OK'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    TabOrder = 7
    OnClick = cxButton2Click
  end
  object UserGetterEdit: TcxCheckListBox
    Left = 105
    Top = 8
    Width = 296
    Height = 98
    EditValueFormat = cvfCaptions
    Items = <>
    TabOrder = 0
  end
end
