inherited SprFormAccountingHourValues: TSprFormAccountingHourValues
  Left = 421
  Top = 245
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103' '#1095#1077#1083'/'#1095#1072#1089' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1086#1090#1076#1077#1083#1086#1074' '#1080' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074
  ExplicitLeft = 421
  ExplicitTop = 245
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
          OnEditing = cxGrid1DBTableView1Editing
          OnInitEdit = cxGrid1DBTableView1InitEdit
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
          object cxGrid1DBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn
            Caption = #1054#1090#1076#1077#1083
            DataBinding.FieldName = 'DepartmentGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 300
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'DepartmentName'
              end
              item
                FieldName = 'DivisionName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DepartmentDS
            Properties.PostPopupValueOnTab = True
            HeaderImageIndex = 0
            Width = 109
          end
          object cxGrid1DBTableView1PostGUID: TcxGridDBColumn
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PostGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 300
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'PostName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = PostGUIDDataset
            HeaderImageIndex = 0
            Width = 108
          end
          object cxGrid1DBTableView1BudgetArticleGUID: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1100#1103' '#1073#1102#1076#1078#1077#1090#1072
            DataBinding.FieldName = 'BudgetArticleGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 300
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'ArticleNameMod'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = BudgetArticleGUIDDatasource
            HeaderImageIndex = 0
            Width = 165
          end
          object cxGrid1DBTableView1Value: TcxGridDBColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'Value'
            HeaderImageIndex = 0
            Width = 165
          end
          object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 200
          end
          object cxGrid1DBTableView1AccountingHourGUID: TcxGridDBColumn
            Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
            DataBinding.FieldName = 'AccountingHourGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 300
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'AccountingHourName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = AccountingHourGUIDDataset
            Visible = False
            VisibleForCustomization = False
            Width = 164
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
          object cxGrid1DBTableView2GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2DepartmentGUID: TcxGridDBColumn
            Caption = #1054#1090#1076#1077#1083
            DataBinding.FieldName = 'DepartmentGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 300
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'DepartmentName'
              end
              item
                FieldName = 'DivisionName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DepartmentDS
            Width = 70
          end
          object cxGrid1DBTableView2PostGUID: TcxGridDBColumn
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PostGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'PostName'
              end>
            Properties.ListSource = PostGUIDDataset
            Width = 70
          end
          object cxGrid1DBTableView2BudgetArticleGUID: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1100#1103' '#1073#1102#1076#1078#1077#1090#1072
            DataBinding.FieldName = 'BudgetArticleGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'ArticleNameMod'
              end>
            Properties.ListSource = BudgetArticleGUIDDatasource
            Width = 70
          end
          object cxGrid1DBTableView2Value: TcxGridDBColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'Value'
            Width = 70
          end
          object cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2AccountingHourGUID: TcxGridDBColumn
            Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
            DataBinding.FieldName = 'AccountingHourGUID'
            Width = 70
          end
          object cxGrid1DBTableView2RecordState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'RecordState'
            Width = 70
          end
          object cxGrid1DBTableView2UserNameChange: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'UserNameChange'
            Width = 70
          end
          object cxGrid1DBTableView2DateChange: TcxGridDBColumn
            Caption = #1044#1072#1090#1072'/'#1042#1088#1077#1084#1103
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
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec AccountingHourValuesShow')
    Left = 152
    Top = 376
  end
  object AccountingHourGUIDQuery: TADOQuery [8]
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec AccountingHoursShow')
    Left = 696
    Top = 384
  end
  object AccountingHourGUIDDataset: TDataSource [9]
    DataSet = AccountingHourGUIDQuery
    Left = 696
    Top = 320
  end
  object BudgetArticleGUIDDatasource: TDataSource [10]
    DataSet = BudgetArticleGUIDQuery
    Left = 448
    Top = 320
  end
  object BudgetArticleGUIDQuery: TADOQuery [11]
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow')
    Left = 448
    Top = 376
  end
  object PostGUIDQuery: TADOQuery [12]
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec PostsShow')
    Left = 584
    Top = 384
  end
  object PostGUIDDataset: TDataSource [13]
    DataSet = PostGUIDQuery
    Left = 592
    Top = 320
  end
  inherited DataSource1: TDataSource
    Left = 144
    Top = 328
  end
  inherited DataSource2: TDataSource
    Left = 240
    Top = 312
  end
  inherited ADOQuery2: TADOQuery
    Left = 248
    Top = 368
  end
  inherited DataSource3: TDataSource
    Left = 336
    Top = 320
  end
  inherited ADOQuery3: TADOQuery
    Left = 336
    Top = 376
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.629124525460000000
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
  object DepartmentQ: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec DepartmentsShow')
    Left = 160
    Top = 168
  end
  object DepartmentDS: TDataSource
    DataSet = DepartmentQ
    Left = 160
    Top = 216
  end
  object PostFilterDataset: TDataSource
    DataSet = PostFilterQuery
    Left = 704
    Top = 184
  end
  object PostFilterQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec PostsShow')
    Left = 696
    Top = 248
  end
  object ADOQuery4: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow NULL,2')
    Left = 568
    Top = 176
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 568
    Top = 224
  end
end
