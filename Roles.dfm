object RolesForm: TRolesForm
  Left = 697
  Top = 283
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #1056#1086#1083#1080
  ClientHeight = 568
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 568
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 232
      Height = 566
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 232
        Height = 566
        Align = alClient
        Images = MainForm.ImageList
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = ''
        RootLevelOptions.TabsForEmptyDetails = False
        object cxGridDBTableView2: TcxGridDBTableView
          OnEditKeyDown = cxGridDBTableView2EditKeyDown
          OnFocusedRecordChanged = cxGridDBTableView2FocusedRecordChanged
          DataController.DataSource = RolesDS
          DataController.KeyFieldNames = 'id'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1088#1086#1083#1100
          NewItemRow.Visible = True
          OptionsBehavior.PostponedSynchronization = False
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.EditAutoHeight = eahRow
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
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
            Width = 35
          end
          object cxGridDBTableView1RoleName: TcxGridDBColumn
            Caption = #1056#1086#1083#1100
            DataBinding.FieldName = 'RoleName'
            HeaderImageIndex = 0
            Width = 100
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
    object Panel5: TPanel
      Left = 241
      Top = 1
      Width = 380
      Height = 566
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 380
        Height = 337
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = ''
        RootLevelOptions.TabsForEmptyDetails = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = TrueActionsDS
          DataController.KeyFieldNames = 'GUID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = MainForm.ImageList
          NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1073#1102#1076#1078#1077#1090
          OptionsBehavior.PostponedSynchronization = False
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.EditAutoHeight = eahRow
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
          OptionsView.ShowEditButtons = gsebForFocusedRecord
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          Styles.Background = MainForm.cxStyle41
          Styles.StyleSheet = MainForm.GridTableViewStyleSheetDevExpress
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086
            DataBinding.FieldName = 'ActionCaption'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 337
        Width = 380
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        object UpAll: TcxButton
          Left = 6
          Top = 6
          Width = 85
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          TabOrder = 0
          OnClick = UpAllClick
        end
        object DownAll: TcxButton
          Left = 97
          Top = 6
          Width = 85
          Height = 25
          Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          TabOrder = 1
          OnClick = DownAllClick
        end
        object UpBtn: TcxButton
          Left = 188
          Top = 6
          Width = 85
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          TabOrder = 2
          OnClick = UpBtnClick
        end
        object DownBtn: TcxButton
          Left = 279
          Top = 6
          Width = 85
          Height = 25
          Caption = #1059#1073#1088#1072#1090#1100
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          TabOrder = 3
          OnClick = DownBtnClick
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 378
        Width = 380
        Height = 188
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = ''
        RootLevelOptions.TabsForEmptyDetails = False
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = FalseActionDS
          DataController.KeyFieldNames = 'GUID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = MainForm.ImageList
          NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1073#1102#1076#1078#1077#1090
          OptionsBehavior.PostponedSynchronization = False
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.EditAutoHeight = eahRow
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
          OptionsView.ShowEditButtons = gsebForFocusedRecord
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          Styles.Background = MainForm.cxStyle42
          Styles.StyleSheet = MainForm.GridTableViewStyleSheetDevExpress
          object cxGridDBTableView1Column1: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1086
            DataBinding.FieldName = 'ActionCaption'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object LeftSplitter: TcxSplitter
      Left = 233
      Top = 1
      Width = 8
      Height = 566
      HotZoneClassName = 'TcxSimpleStyle'
      MinSize = 190
      ResizeUpdate = True
      Control = Panel3
    end
  end
  object RolesQ: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec UsersShow')
    Left = 64
    Top = 160
  end
  object RolesDS: TDataSource
    DataSet = RolesQ
    Left = 96
    Top = 160
  end
  object TrueActionsQ: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec ActionsShow')
    Left = 64
    Top = 216
  end
  object TrueActionsDS: TDataSource
    DataSet = TrueActionsQ
    Left = 104
    Top = 216
  end
  object FalseActionsQ: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec ActionsShow')
    Left = 64
    Top = 272
  end
  object FalseActionDS: TDataSource
    DataSet = FalseActionsQ
    Left = 104
    Top = 272
  end
end
