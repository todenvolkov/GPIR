object OptionsForm: TOptionsForm
  Left = 665
  Top = 286
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OptionsForm'
  ClientHeight = 94
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 94
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object SprValueHide: TcxLabel
      Left = 156
      Top = 9
      Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 274
    end
    object SprHideValueCombo: TcxComboBox
      Left = 280
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '30 '#1076#1085#1077#1081
        '90 '#1076#1085#1077#1081
        '180 '#1076#1085#1077#1081
        '365 '#1076#1085#1077#1081)
      Properties.OnChange = SprHideValueComboPropertiesChange
      TabOrder = 1
      Width = 73
    end
    object Accept: TcxButton
      Left = 177
      Top = 61
      Width = 97
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 2
      OnClick = AcceptClick
    end
    object CloseBtn: TcxButton
      Left = 280
      Top = 61
      Width = 76
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 3
      OnClick = CloseBtnClick
    end
  end
end
