object XLS1CImportForm: TXLS1CImportForm
  Left = 603
  Top = 346
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1079#1072#1090#1088#1072#1090' '#1080#1079' 1'#1057' (Excel)'
  ClientHeight = 389
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxProgressBar1: TcxProgressBar
    Left = 0
    Top = 368
    Align = alBottom
    TabOrder = 0
    Width = 672
  end
  object cxSpreadSheet1: TcxSpreadSheet
    Left = 0
    Top = 98
    Width = 672
    Height = 270
    Align = alClient
    DefaultStyle.Font.Name = 'Tahoma'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    PainterType = ptOfficeXPStyle
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object RichEdit: TcxRichEdit
      Left = 0
      Top = 0
      Align = alClient
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      TabOrder = 0
      Height = 41
      Width = 672
    end
  end
  object TopSplitter: TcxSplitter
    Left = 0
    Top = 41
    Width = 672
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salTop
    PositionAfterOpen = 50
    ResizeUpdate = True
    Control = Panel3
    ExplicitWidth = 8
  end
  object BudgetPanel: TPanel
    Left = 0
    Top = 49
    Width = 672
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object OpenBtn: TcxButton
      AlignWithMargins = True
      Left = 368
      Top = 2
      Width = 79
      Height = 41
      Hint = #1041#1102#1076#1078#1077#1090' '#1054#1048#1057#1048
      Cancel = True
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' Excel'
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      Visible = False
      WordWrap = True
      OnClick = OpenBtnClick
    end
    object DownloadBtn: TcxButton
      AlignWithMargins = True
      Left = 91
      Top = 2
      Width = 79
      Height = 41
      Hint = #1041#1102#1076#1078#1077#1090' '#1054#1048#1057#1048
      Cancel = True
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Enabled = False
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
      WordWrap = True
      OnClick = DownloadBtnClick
    end
    object MonthsCombo: TcxComboBox
      Left = 245
      Top = 12
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
      TabOrder = 2
      Text = #1071#1085#1074#1072#1088#1100
      Width = 82
    end
    object YearSpin: TcxSpinEdit
      Left = 176
      Top = 12
      Properties.MaxValue = 2500.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      TabOrder = 3
      Value = 2013
      Width = 63
    end
    object TestBtn: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 2
      Width = 79
      Height = 41
      Hint = #1041#1102#1076#1078#1077#1090' '#1054#1048#1057#1048
      Cancel = True
      Caption = #1058#1077#1089#1090
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 4
      WordWrap = True
      OnClick = TestBtnClick
    end
  end
  object XLSReadWriteII41: TXLSReadWriteII4
    Version = xvExcel97
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
    Left = 152
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 176
    object N1: TMenuItem
      Caption = #1085#1072#1095#1072#1083#1086' '#1076#1072#1085#1085#1099#1093
      OnClick = N1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Microsoft Excel|*.xlsx; *.xls'
    Left = 64
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 64
    Top = 192
  end
end
