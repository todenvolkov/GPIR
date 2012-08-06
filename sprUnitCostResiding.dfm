inherited sprCostResidingForm: TsprCostResidingForm
  Left = 567
  Top = 295
  Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1074' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1072#1093
  ExplicitLeft = 567
  ExplicitTop = 295
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
          DataController.DataModeController.GridMode = True
          OptionsBehavior.PostponedSynchronization = True
          OptionsView.HeaderEndEllipsis = False
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
          object cxGrid1DBTableView1CityGUID: TcxGridDBColumn
            Caption = #1043#1086#1088#1086#1076
            DataBinding.FieldName = 'CityGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'CityName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = CitiesDataset
            HeaderImageIndex = 0
          end
          object cxGrid1DBTableView1PlaceResidenceGUID: TcxGridDBColumn
            Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' / '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
            DataBinding.FieldName = 'PlaceResidenceGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'CompanyName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = PlaceResidenceDataset
            HeaderImageIndex = 0
          end
          object cxGrid1DBTableView1Price: TcxGridDBColumn
            Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1074' '#1089#1091#1090#1082#1080
            DataBinding.FieldName = 'Price'
            HeaderImageIndex = 0
          end
          object cxGrid1DBTableView1DateValidStart: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089
            DataBinding.FieldName = 'DateValidStart'
            HeaderImageIndex = 0
          end
          object cxGrid1DBTableView1DateValidFinish: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1087#1086
            DataBinding.FieldName = 'DateValidFinish'
            HeaderImageIndex = 0
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
          object cxGrid1DBTableView2CityGUID: TcxGridDBColumn
            Caption = #1043#1086#1088#1086#1076
            DataBinding.FieldName = 'CityGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'CityName'
              end>
            Properties.ListSource = CitiesDataset
            Width = 70
          end
          object cxGrid1DBTableView2PlaceResidenceGUID: TcxGridDBColumn
            Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' / '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
            DataBinding.FieldName = 'PlaceResidenceGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'CompanyName'
              end>
            Properties.ListSource = PlaceResidenceDataset
            Width = 70
          end
          object cxGrid1DBTableView2Price: TcxGridDBColumn
            Caption = #1057#1088#1077#1076#1085#1103#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1074' '#1089#1091#1090#1082#1080
            DataBinding.FieldName = 'Price'
            Width = 70
          end
          object cxGrid1DBTableView2DateValidStart: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089
            DataBinding.FieldName = 'DateValidStart'
            Width = 70
          end
          object cxGrid1DBTableView2DateValidFinish: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1087#1086
            DataBinding.FieldName = 'DateValidFinish'
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
  inherited TopSplitter: TcxSplitter
    ExplicitWidth = 8
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec CostResidingShow')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.617094722220000000
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
  object CitiesDataset: TDataSource
    DataSet = CitiesQuery
    Left = 552
    Top = 304
  end
  object CitiesQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec CitiesShow')
    Left = 528
    Top = 360
  end
  object PlaceResidenceQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec PlaceResidenceShow')
    Left = 624
    Top = 360
  end
  object PlaceResidenceDataset: TDataSource
    DataSet = PlaceResidenceQuery
    Left = 632
    Top = 304
  end
  object PlaceResidenceFilterDataset: TDataSource
    DataSet = PlaceResidenceFilterQuery
    Left = 728
    Top = 304
  end
  object PlaceResidenceFilterQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec PlaceResidenceShow')
    Left = 720
    Top = 360
  end
  object ADOQuery4: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow NULL,2')
    Left = 672
    Top = 176
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 672
    Top = 224
  end
end
