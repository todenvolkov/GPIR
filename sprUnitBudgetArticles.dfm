inherited sprBudgetArticles: TsprBudgetArticles
  Left = 501
  Top = 267
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1090#1072#1090#1100#1080' '#1079#1072#1090#1088#1072#1090'"'
  ExplicitLeft = 501
  ExplicitTop = 267
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited cxGrid3: TcxGrid
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
      inherited cxGrid2: TcxGrid
        LookAndFeel.SkinName = ''
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
      inherited cxGrid1: TcxGrid
        LookAndFeel.SkinName = ''
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DetailKeyFieldNames = 'ParentArticleGUID'
          DataController.KeyFieldNames = 'GUID'
          NewItemRow.Visible = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
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
          object cxGrid1DBTableView1ArticleNumber: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ArticleNumber'
            HeaderImageIndex = 0
            Width = 51
          end
          object cxGrid1DBTableView1ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1ArticleName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1090#1100#1080' '#1079#1072#1090#1088#1072#1090
            DataBinding.FieldName = 'ArticleName'
            HeaderImageIndex = 0
            Width = 325
          end
          object cxGrid1DBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1TotalSum: TcxGridDBColumn
            DataBinding.FieldName = 'TotalSum'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1articleGUID: TcxGridDBColumn
            DataBinding.FieldName = 'articleGUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1Code: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1089#1090#1072#1090#1100#1080' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
            DataBinding.FieldName = 'Code'
            HeaderImageIndex = 0
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
          OnCustomDrawCell = cxGrid1DBTableView2CustomDrawCell
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
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = MainForm.GridTableViewStyleSheetDevExpress
          object cxGrid1DBTableView2ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView2ArticleNumber: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'ArticleNumber'
            Options.Editing = False
            Width = 32
          end
          object cxGrid1DBTableView2ArticleName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'ArticleName'
            Options.Editing = False
            Width = 300
          end
          object cxGrid1DBTableView2GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView2ParentArticleGUID: TcxGridDBColumn
            DataBinding.FieldName = 'ParentArticleGUID'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView2Code: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1089#1090#1072#1090#1100#1080' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
            DataBinding.FieldName = 'Code'
            Options.Editing = False
            Width = 70
          end
          object cxGrid1DBTableView2UsernameChange: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'UsernameChange'
            Options.Editing = False
            Width = 70
          end
          object cxGrid1DBTableView2DateChange: TcxGridDBColumn
            Caption = #1044#1072#1090#1072'/'#1042#1088#1077#1084#1103
            DataBinding.FieldName = 'DateChange'
            Options.Editing = False
            Width = 70
          end
          object cxGrid1DBTableView2Version: TcxGridDBColumn
            Caption = #1042#1077#1088#1089#1080#1103' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'Version'
            Options.Editing = False
            Width = 70
          end
          object cxGrid1DBTableView2RecordState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'RecordState'
            Options.Editing = False
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
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec BudgetArticlesShow Null,1')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40925.718938981480000000
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
    BeforePost = ADOQuery4BeforePost
    AfterPost = ADOQuery4AfterPost
    OnPostError = ADOQuery4PostError
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow NULL,2')
    Left = 672
    Top = 184
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 672
    Top = 232
  end
end
