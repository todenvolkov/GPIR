object SessionsForm: TSessionsForm
  Left = 733
  Top = 399
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1077#1089#1089#1080#1080
  ClientHeight = 310
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ExModeName: TLabel
    Left = 305
    Top = 284
    Width = 26
    Height = 13
    Caption = #1042#1099#1082#1083
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 0
    Width = 776
    Height = 273
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    LookAndFeel.SkinName = ''
    RootLevelOptions.TabsForEmptyDetails = False
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = SessionActivityDS
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.EditAutoHeight = eahRow
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.CellEndEllipsis = True
      OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetDevExpress
      object cxGridDBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGridDBTableView1UserName: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'UserName'
        Width = 120
      end
      object cxGridDBTableView1GroupName: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'GroupName'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownSizeable = True
        Properties.Items.Strings = (
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
          #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090' '#1055#1069#1054
          #1043#1083#1072#1074#1085#1099#1081' '#1080#1085#1078#1077#1085#1077#1088' '#1087#1088#1086#1077#1082#1090#1072)
        Width = 60
      end
      object cxGridDBTableView1CalcType: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
        DataBinding.FieldName = 'TypeCalc'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.Items.Strings = (
          #1042#1089#1077' '#1073#1102#1076#1078#1077#1090#1099
          #1041#1102#1076#1078#1077#1090' '#1054#1048#1057#1048
          #1041#1102#1076#1078#1077#1090' '#1053#1048#1054
          #1041#1102#1076#1078#1077#1090' '#1055#1088#1086#1077#1082#1090#1080#1088#1086#1074#1097#1080#1082#1080
          #1041#1102#1076#1078#1077#1090' '#1054#1040#1053)
        Width = 60
      end
      object cxGridDBTableView1UserID: TcxGridDBColumn
        DataBinding.FieldName = 'UserID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object ExModeBtn: TcxButton
    Left = 135
    Top = 279
    Width = 154
    Height = 25
    Hint = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1084#1086#1085#1086#1087#1086#1083#1100#1085#1099#1084' '#1088#1077#1078#1080#1084#1086#1084
    Caption = #1052#1086#1085#1086#1087#1086#1083#1100#1085#1099#1081' '#1088#1077#1078#1080#1084
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    ParentShowHint = False
    ShowHint = True
    SpeedButtonOptions.GroupIndex = 1
    SpeedButtonOptions.AllowAllUp = True
    TabOrder = 1
    OnClick = ExModeBtnClick
  end
  object MessageBtn: TcxButton
    Left = 8
    Top = 279
    Width = 121
    Height = 25
    Hint = 
      #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1076#1088#1091#1075#1080#1093' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1086' '#1090#1086#1084', '#1095#1090#1086' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1084#1086#1085#1086#1087#1086#1083#1100#1085#1099 +
      #1081' '#1076#1086#1089#1090#1091#1087' '
    Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
    Enabled = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = MessageBtnClick
  end
  object TimerSessionActivityList: TTimer
    OnTimer = TimerSessionActivityListTimer
    Left = 48
    Top = 159
  end
  object QuerySessionActivity: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 176
    Top = 40
  end
  object SessionActivityDS: TDataSource
    DataSet = QuerySessionActivity
    Left = 176
    Top = 96
  end
end
