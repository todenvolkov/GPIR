inherited SprDivisionsForm: TSprDivisionsForm
  Left = 488
  Top = 249
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'"'
  ClientHeight = 489
  ClientWidth = 952
  ExplicitLeft = 488
  ExplicitTop = 249
  ExplicitWidth = 960
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 470
    Width = 952
    ExplicitTop = 470
    ExplicitWidth = 952
  end
  inherited Panel1: TPanel
    Width = 952
    ExplicitWidth = 952
  end
  inherited Panel2: TPanel
    Width = 952
    Height = 382
    ExplicitWidth = 952
    ExplicitHeight = 382
    inherited Panel3: TPanel
      Height = 382
      ExplicitHeight = 382
      inherited cxGrid3: TcxGrid
        Height = 382
        ExplicitHeight = 382
        inherited cxGrid3DBTableView1: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.FilterBox = nil
          Styles.Inactive = nil
          Styles.IncSearch = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Indicator = nil
          Styles.Preview = nil
        end
      end
    end
    inherited Panel4: TPanel
      Left = 852
      Height = 382
      ExplicitLeft = 852
      ExplicitHeight = 382
      inherited cxGrid2: TcxGrid
        Height = 382
        LookAndFeel.SkinName = ''
        ExplicitHeight = 382
        inherited cxGridDBTableView1: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.FilterBox = nil
          Styles.Inactive = nil
          Styles.IncSearch = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Indicator = nil
          Styles.Preview = nil
        end
      end
    end
    inherited Panel5: TPanel
      Width = 736
      Height = 382
      ExplicitWidth = 736
      ExplicitHeight = 382
      inherited cxGrid1: TcxGrid
        Width = 736
        Height = 382
        LookAndFeel.SkinName = ''
        ExplicitWidth = 736
        ExplicitHeight = 382
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.FilterBox = nil
          Styles.Inactive = nil
          Styles.IncSearch = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Indicator = nil
          Styles.Preview = nil
          object cxGrid1DBTableView1ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1DivisionName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'DivisionName'
            Width = 94
          end
          object cxGrid1DBTableView1Code: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'Code'
            Width = 94
          end
          object cxGrid1DBTableView1WorkType: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
            DataBinding.FieldName = 'WorkType'
            Width = 94
          end
          object cxGrid1DBTableView1WorkCharacter: TcxGridDBColumn
            Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1088#1072#1073#1086#1090
            DataBinding.FieldName = 'WorkCharacter'
            Width = 94
          end
          object cxGrid1DBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
            Width = 94
          end
          object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 94
          end
          object cxGrid1DBTableView1RecordState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'RecordState'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #1044#1086#1089#1090#1091#1087#1085#1072
              #1042' '#1082#1086#1088#1079#1080#1085#1077)
            Width = 80
          end
        end
        object cxGrid1DBTableView2: TcxGridDBTableView [1]
          DataController.DataSource = DataSource4
          DataController.DetailKeyFieldNames = 'GUID'
          DataController.KeyFieldNames = 'ID'
          DataController.MasterKeyFieldNames = 'GUID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView2ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2DivisionName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'DivisionName'
            Width = 70
          end
          object cxGrid1DBTableView2Code: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'Code'
            Width = 70
          end
          object cxGrid1DBTableView2WorkType: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
            DataBinding.FieldName = 'WorkType'
            Width = 70
          end
          object cxGrid1DBTableView2WorkCharacter: TcxGridDBColumn
            Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1088#1072#1073#1086#1090#1099
            DataBinding.FieldName = 'WorkCharacter'
            Width = 70
          end
          object cxGrid1DBTableView2GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2RecordState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'RecordState'
            Width = 70
          end
          object cxGrid1DBTableView2UsernameChange: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'UsernameChange'
            Width = 70
          end
          object cxGrid1DBTableView2DateChange: TcxGridDBColumn
            Caption = #1044#1072#1090#1072'/'#1042#1056#1077#1084#1103
            DataBinding.FieldName = 'DateChange'
            Width = 70
          end
          object cxGrid1DBTableView2Version: TcxGridDBColumn
            Caption = #1042#1077#1088#1089#1080#1103
            DataBinding.FieldName = 'Version'
            Width = 70
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          object cxGrid1Level2: TcxGridLevel
            GridView = cxGrid1DBTableView2
          end
        end
      end
    end
    inherited LeftSplitter: TcxSplitter
      Height = 382
      ExplicitHeight = 382
    end
    inherited RightSplitter: TcxSplitter
      Left = 844
      Height = 382
      ExplicitLeft = 844
      ExplicitHeight = 382
    end
  end
  inherited Panel6: TPanel
    Width = 952
    ExplicitWidth = 952
    inherited cxSplitter1: TcxSplitter
      Left = 200
      ExplicitLeft = 200
    end
    inherited BudgetInfoMemo: TcxMemo
      ExplicitWidth = 200
      Width = 200
    end
    inherited RichEdit: TcxRichEdit
      Left = 208
      ExplicitLeft = 208
    end
  end
  inherited TopSplitter: TcxSplitter
    Width = 952
    ExplicitWidth = 952
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec DivisionsShow')
  end
  inherited ADOQuery2: TADOQuery
    SQL.Strings = (
      'exec AccountingHoursShow')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.617641412030000000
      Styles.BandHeader = nil
      Styles.Caption = nil
      Styles.CardCaptionRow = nil
      Styles.CardRowCaption = nil
      Styles.Content = nil
      Styles.ContentEven = nil
      Styles.ContentOdd = nil
      Styles.FilterBar = nil
      Styles.Footer = nil
      Styles.Group = nil
      Styles.Header = nil
      Styles.Preview = nil
      Styles.Selection = nil
      BuiltInReportLink = True
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    inherited dxGridReportLinkStyleSheet1: TdxGridReportLinkStyleSheet
      BuiltIn = True
    end
  end
  object ADOQuery4: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow NULL,2')
    Left = 640
    Top = 208
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 640
    Top = 256
  end
end
