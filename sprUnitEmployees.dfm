inherited EmployeesForm: TEmployeesForm
  Left = 636
  Top = 326
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
  ExplicitLeft = 636
  ExplicitTop = 326
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
          OptionsView.GroupByBox = True
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
            Width = 150
          end
          object cxGrid1DBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
            Width = 150
          end
          object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 150
          end
          object cxGrid1DBTableView1FIO: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'FIO'
            HeaderImageIndex = 0
            Width = 150
          end
          object cxGrid1DBTableView1ClockNumber: TcxGridDBColumn
            Caption = #1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
            DataBinding.FieldName = 'ClockNumber'
            HeaderImageIndex = 0
            Width = 150
          end
          object cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn
            Caption = #1054#1090#1076#1077#1083
            DataBinding.FieldName = 'DepartmentGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'DepartmentName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DepartmentsDataSource
            Width = 150
          end
          object cxGrid1DBTableView1PostGUID: TcxGridDBColumn
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PostGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'PostName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = PostsDataSource
            Width = 150
          end
          object cxGrid1DBTableView1GroupGUID: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087
            DataBinding.FieldName = 'GroupGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'GroupName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = GroupsDataSource
            Visible = False
            VisibleForCustomization = False
            Width = 150
          end
          object cxGrid1DBTableView1SectorGUID: TcxGridDBColumn
            Caption = #1057#1077#1082#1090#1086#1088
            DataBinding.FieldName = 'SectorGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'SectorName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = SectorsDataSource
            Visible = False
            VisibleForCustomization = False
            Width = 150
          end
          object cxGrid1DBTableView1RecordState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
            DataBinding.FieldName = 'RecordState'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #1044#1086#1089#1090#1091#1087#1085#1072
              #1042' '#1082#1086#1088#1079#1080#1085#1077)
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
          object cxGrid1DBTableView2BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2DepartmentGUID: TcxGridDBColumn
            Caption = #1054#1090#1076#1077#1083
            DataBinding.FieldName = 'DepartmentGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'DepartmentName'
              end>
            Properties.ListSource = DepartmentsDataSource
            Width = 70
          end
          object cxGrid1DBTableView2GroupGUID: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072
            DataBinding.FieldName = 'GroupGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2PostGUID: TcxGridDBColumn
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            DataBinding.FieldName = 'PostGUID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'GUID'
            Properties.ListColumns = <
              item
                FieldName = 'PostNAme'
              end>
            Properties.ListSource = PostsDataSource
            Width = 70
          end
          object cxGrid1DBTableView2SectorGUID: TcxGridDBColumn
            Caption = #1057#1077#1082#1090#1086#1088
            DataBinding.FieldName = 'SectorGUID'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGrid1DBTableView2FIO: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'FIO'
            Width = 70
          end
          object cxGrid1DBTableView2ClockNumber: TcxGridDBColumn
            Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
            DataBinding.FieldName = 'ClockNumber'
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
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec employeesShow')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.617804178240000000
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
  object DepartmentsDataSource: TDataSource
    DataSet = DepartmentsQuery
    Left = 512
    Top = 272
  end
  object DepartmentsQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec departmentsShow')
    Left = 464
    Top = 360
  end
  object GroupsQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec groupsShow')
    Left = 568
    Top = 344
  end
  object GroupsDataSource: TDataSource
    DataSet = GroupsQuery
    Left = 520
    Top = 320
  end
  object PostsQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec PostsShow'
      '')
    Left = 656
    Top = 344
  end
  object PostsDataSource: TDataSource
    DataSet = PostsQuery
    Left = 640
    Top = 216
  end
  object SectorsQuery: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec SectorsShow'
      '')
    Left = 592
    Top = 416
  end
  object SectorsDataSource: TDataSource
    DataSet = SectorsQuery
    Left = 640
    Top = 272
  end
  object ADOQuery4: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'exec BudgetArticlesShow NULL,2')
    Left = 744
    Top = 168
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 744
    Top = 216
  end
end
