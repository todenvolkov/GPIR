object ReportsForm: TReportsForm
  Left = 847
  Top = 359
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1099
  ClientHeight = 166
  ClientWidth = 341
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object BudgetPanel: TPanel
      Left = 1
      Top = 1
      Width = 339
      Height = 463
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SubcontractRerportBtn: TcxButton
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 79
        Height = 41
        Hint = #1042#1089#1077' '#1073#1102#1076#1078#1077#1090#1099
        Cancel = True
        Caption = #1057#1091#1073#1087#1086#1076#1088#1103#1076
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        TabOrder = 0
        OnMouseEnter = SubcontractRerportBtnMouseEnter
        WordWrap = True
        OnClick = SubcontractRerportBtnClick
      end
      object StagesReportBtn: TcxButton
        AlignWithMargins = True
        Left = 88
        Top = 1
        Width = 79
        Height = 41
        Hint = #1041#1102#1076#1078#1077#1090' '#1054#1048#1057#1048
        Cancel = True
        Caption = #1042#1099#1088#1091#1095#1082#1072
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        TabOrder = 1
        OnMouseEnter = StagesReportBtnMouseEnter
        WordWrap = True
        OnClick = StagesReportBtnClick
      end
      object MSFOReportBtn: TcxButton
        AlignWithMargins = True
        Left = 173
        Top = 1
        Width = 79
        Height = 41
        Hint = #1041#1102#1076#1078#1077#1090' '#1053#1048#1054
        Cancel = True
        Caption = #1054#1090#1095#1077#1090' '#1052#1057#1060#1054
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        TabOrder = 2
        OnMouseEnter = MSFOReportBtnMouseEnter
        WordWrap = True
        OnClick = MSFOReportBtnClick
      end
      object D1S2ReportBtn: TcxButton
        AlignWithMargins = True
        Left = 258
        Top = 1
        Width = 79
        Height = 41
        Hint = #1041#1102#1076#1078#1077#1090' '#1055#1088#1086#1077#1082#1090#1080#1088#1086#1074#1097#1080#1082#1080
        Cancel = True
        Caption = 'D1 '#1080' S2'
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        TabOrder = 3
        OnMouseEnter = D1S2ReportBtnMouseEnter
        WordWrap = True
        OnClick = D1S2ReportBtnClick
      end
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 49
    Width = 341
    Height = 111
    ActivePage = TabSheet4
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      TabVisible = False
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 333
        Height = 26
        Align = alTop
        Caption = 
          #1042#1099#1074#1086#1076' '#1092#1086#1088#1084#1099' '#1089#1091#1073#1087#1086#1076#1088#1103#1076#1072' '#1074' '#1092#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072' Microsoft Excel. '#1055#1077#1088#1077#1076' '#1079#1072#1087 +
          #1091#1089#1082#1086#1084' '#1091#1082#1072#1078#1080#1090#1077' '#1073#1102#1076#1078#1077#1090'.'
        WordWrap = True
        ExplicitWidth = 330
      end
      object cxLookupComboBox1: TcxLookupComboBox
        Left = 3
        Top = 48
        Properties.DropDownSizeable = True
        Properties.DropDownWidth = 500
        Properties.KeyFieldNames = 'GUID'
        Properties.ListColumns = <
          item
            FieldName = 'CodeNumber'
          end
          item
            FieldName = 'Version'
          end
          item
            FieldName = 'ContractName'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = BudgetDS
        TabOrder = 0
        Width = 330
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      TabVisible = False
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 333
        Height = 26
        Align = alTop
        Caption = 
          #1042#1099#1074#1086#1076' '#1092#1086#1088#1084#1099' '#1101#1090#1072#1087#1086#1074' '#1074' '#1092#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072' Microsoft Excel. '#1055#1077#1088#1077#1076' '#1079#1072#1087#1091#1089#1082#1086 +
          #1084' '#1091#1082#1072#1078#1080#1090#1077' '#1073#1102#1076#1078#1077#1090'.'
        WordWrap = True
        ExplicitWidth = 310
      end
      object cxLookupComboBox2: TcxLookupComboBox
        Left = 3
        Top = 48
        Properties.DropDownSizeable = True
        Properties.DropDownWidth = 500
        Properties.KeyFieldNames = 'GUID'
        Properties.ListColumns = <
          item
            Caption = #1064#1080#1092#1088' '#1087#1088#1086#1077#1082#1090#1072
            Width = 200
            FieldName = 'CodeNumber'
          end
          item
            Caption = #1042#1077#1088#1089#1080#1103' '#1073#1102#1076#1078#1077#1090#1072
            FieldName = 'Version'
          end
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1077#1082#1090#1072
            Width = 200
            FieldName = 'ContractName'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = BudgetDS
        TabOrder = 0
        Width = 330
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      TabVisible = False
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 333
        Height = 39
        Align = alTop
        Caption = 
          #1042#1099#1074#1086#1076' '#1086#1090#1095#1077#1090#1072' '#1076#1083#1103' '#1052#1057#1060#1054' '#1074' '#1092#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072' Microsoft Excel. '#1055#1077#1088#1077#1076' '#1079#1072#1087#1091 +
          #1089#1082#1086#1084' '#1091#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076'. '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1086' '#1074#1089#1077#1084' '#1085#1077' '#1079#1072#1082#1088#1099#1090#1099#1084' '#1076#1086#1075#1086#1074#1086 +
          #1088#1072#1084'.'
        WordWrap = True
        ExplicitWidth = 330
      end
      object YearSpin: TcxSpinEdit
        Left = 85
        Top = 60
        Properties.MaxValue = 2500.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        TabOrder = 0
        Value = 2013
        Width = 63
      end
      object MonthsCombo: TcxComboBox
        Left = 154
        Top = 60
        Properties.Items.Strings = (
          #1071#1085#1074#1072#1088#1100
          #1060#1077#1074#1088#1072#1083#1100
          #1052#1072#1088#1090
          #1040#1087#1088#1077#1083#1100
          #1052#1072#1081
          #1048#1102#1085#1100
          #1048#1102#1083#1100
          #1040#1074#1075#1091#1089#1090
          #1057#1077#1085#1090#1103#1073#1088#1100
          #1054#1082#1090#1103#1073#1088#1100
          #1053#1086#1103#1073#1088#1100
          #1044#1077#1082#1072#1073#1088#1100)
        TabOrder = 1
        Text = #1071#1085#1074#1072#1088#1100
        Width = 82
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      TabVisible = False
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 333
        Height = 39
        Align = alTop
        Caption = 
          #1042#1099#1074#1086#1076' '#1086#1090#1095#1077#1090#1072' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1074' 1'#1057' '#1074' '#1092#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072' Microsoft Excel. '#1055 +
          #1077#1088#1077#1076' '#1079#1072#1087#1091#1089#1082#1086#1084' '#1091#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076'. '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1086' '#1074#1089#1077#1084' '#1085#1077' '#1079#1072#1082#1088#1099#1090 +
          #1099#1084' '#1076#1086#1075#1086#1074#1086#1088#1072#1084'.'
        WordWrap = True
        ExplicitWidth = 331
      end
      object cxSpinEdit1: TcxSpinEdit
        Left = 85
        Top = 60
        Properties.MaxValue = 2500.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        TabOrder = 0
        Value = 2013
        Width = 63
      end
      object cxComboBox1: TcxComboBox
        Left = 154
        Top = 60
        Properties.Items.Strings = (
          #1071#1085#1074#1072#1088#1100
          #1060#1077#1074#1088#1072#1083#1100
          #1052#1072#1088#1090
          #1040#1087#1088#1077#1083#1100
          #1052#1072#1081
          #1048#1102#1085#1100
          #1048#1102#1083#1100
          #1040#1074#1075#1091#1089#1090
          #1057#1077#1085#1090#1103#1073#1088#1100
          #1054#1082#1090#1103#1073#1088#1100
          #1053#1086#1103#1073#1088#1100
          #1044#1077#1082#1072#1073#1088#1100)
        TabOrder = 1
        Text = #1071#1085#1074#1072#1088#1100
        Width = 82
      end
    end
  end
  object Progress: TProgressBar
    Left = 0
    Top = 160
    Width = 341
    Height = 6
    Align = alBottom
    Smooth = True
    SmoothReverse = True
    TabOrder = 2
    Visible = False
  end
  object XLS: TXLSReadWriteII4
    Version = xvExcel2007
    Sheets = <
      item
        Name = 'Sheet1'
        DefaultColWidth = 8
        DefaultRowHeight = 255
        PrintSettings.Copies = 0
        PrintSettings.FooterMargin = 0.500000000000000000
        PrintSettings.FooterMarginCm = 1.270000000000000000
        PrintSettings.HeaderMargin = 0.500000000000000000
        PrintSettings.HeaderMarginCm = 1.270000000000000000
        PrintSettings.MarginBottom = 1.000000000000000000
        PrintSettings.MarginLeft = 0.750000000000000000
        PrintSettings.MarginRight = 0.750000000000000000
        PrintSettings.MarginTop = 1.000000000000000000
        PrintSettings.MarginBottomCm = 2.540000000000000000
        PrintSettings.MarginLeftCm = 1.905000000000000000
        PrintSettings.MarginRightCm = 1.905000000000000000
        PrintSettings.MarginTopCm = 2.540000000000000000
        PrintSettings.Options = [psoPortrait]
        PrintSettings.PaperSize = psA4
        PrintSettings.ScalingFactor = 100
        PrintSettings.StartingPage = 1
        PrintSettings.HorizPagebreaks = <>
        PrintSettings.VertPagebreaks = <>
        PrintSettings.Resolution = 600
        PrintSettings.FitWidth = 1
        PrintSettings.FitHeight = 1
        Options = [soGridlines, soRowColHeadings, soShowZeros]
        WorkspaceOptions = [woShowAutoBreaks, woRowSumsBelow, woColSumsRight, woOutlineSymbols]
        SheetProtection = [spEditObjects, spEditScenarios, spEditCellFormatting, spEditColumnFormatting, spEditRowFormatting, spInsertColumns, spInsertRows, spInsertHyperlinks, spDeleteColumns, spDeleteRows, spSelectLockedCells, spSortCellRange, spEditAutoFileters, spEditPivotTables, spSelectUnlockedCells]
        Zoom = 0
        ZoomPreview = 0
        RecalcFormulas = True
        Hidden = hsVisible
        Validations = <>
        DrawingObjects.Texts = <>
        DrawingObjects.Notes = <>
        DrawingObjects.Basics = <>
        DrawingObjects.AutoShapes = <>
        DrawingObjects.Pictures = <>
        ControlsObjects.ListBoxes = <>
        ControlsObjects.ComboBoxes = <>
        ControlsObjects.Buttons = <>
        ControlsObjects.CheckBoxes = <>
        ControlsObjects.RadioButtons = <>
        Hyperlinks = <>
        ConditionalFormats = <>
      end>
    Workbook.Left = 100
    Workbook.Top = 100
    Workbook.Width = 10000
    Workbook.Height = 7000
    Workbook.SelectedTab = 0
    Workbook.Options = [woHScroll, woVScroll, woTabs]
    OptionsDialog.SaveExtLinkVal = False
    OptionsDialog.CalcCount = 100
    OptionsDialog.CalcMode = cmAutomatic
    OptionsDialog.Delta = 0.001000000000000000
    OptionsDialog.ShowObjects = soShowAll
    OptionsDialog.Iteration = False
    OptionsDialog.PrecisionAsDisplayed = True
    OptionsDialog.R1C1Mode = False
    OptionsDialog.RecalcBeforeSave = False
    OptionsDialog.Uncalced = False
    OptionsDialog.SaveRecalc = True
    OptionsDialog.RightToLeft = False
    BookProtected = False
    Backup = False
    RefreshAll = False
    StrTRUE = 'TRUE'
    StrFALSE = 'FALSE'
    ShowFormulas = False
    IsMac = False
    PreserveMacros = True
    ComponentVersion = '4.00.60a'
    MSOPictures = <>
    RecomendReadOnly = False
    TempFileMode = tfmOnDisk
    Left = 64
    Top = 8
  end
  object ReportQuery: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 256
    Top = 8
  end
  object DS1: TADODataSet
    Parameters = <>
    Left = 104
    Top = 8
  end
  object DS2: TADODataSet
    Parameters = <>
    Left = 136
    Top = 8
  end
  object DS3: TADODataSet
    Parameters = <>
    Left = 176
    Top = 8
  end
  object BudgetQ: TADOQuery
    Active = True
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetsForReportsShow')
    Left = 64
    Top = 64
  end
  object BudgetDS: TDataSource
    DataSet = BudgetQ
    Left = 104
    Top = 64
  end
  object DS4: TADODataSet
    Parameters = <>
    Left = 176
    Top = 56
  end
  object DS5: TADODataSet
    Parameters = <>
    Left = 224
    Top = 56
  end
  object DS6: TADODataSet
    Parameters = <>
    Left = 176
    Top = 120
  end
end
