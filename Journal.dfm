object JournalForm: TJournalForm
  Left = 397
  Top = 296
  Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  ClientHeight = 648
  ClientWidth = 1181
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1181
    Height = 648
    Align = alClient
    Images = MainForm.ImageList
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    LookAndFeel.SkinName = ''
    RootLevelOptions.TabsForEmptyDetails = False
    ExplicitTop = 120
    ExplicitHeight = 528
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = JournalDatasource
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
      NewItemRow.Visible = True
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.EditAutoHeight = eahRow
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CellEndEllipsis = True
      OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GridLineColor = clBtnFace
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetDevExpress
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cxGrid1DBTableView1version: TcxGridDBColumn
        Caption = #1042#1077#1088#1089#1080#1103
        DataBinding.FieldName = 'version'
        Width = 121
      end
      object cxGrid1DBTableView1IntelliRecordState: TcxGridDBColumn
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        DataBinding.FieldName = 'IntelliRecordState'
        Width = 349
      end
      object cxGrid1DBTableView1DateChange: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'DateChange'
        Width = 146
      end
      object cxGrid1DBTableView1UsernameChange: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'UsernameChange'
        Width = 551
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object JournalDatasource: TDataSource
    DataSet = JournalQuery
    Left = 184
    Top = 72
  end
  object JournalQuery: TADOQuery
    Active = True
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [ID]      '
      '      ,[version]'
      '      ,[UsernameChange]'
      '      ,[DateChange]'
      '      ,[IntelliRecordState]'
      '  FROM    PlannedTripsJournal')
    Left = 272
    Top = 72
  end
end
