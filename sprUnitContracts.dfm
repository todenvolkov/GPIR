inherited ContractsForm: TContractsForm
  Left = 390
  Top = 227
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1044#1086#1075#1086#1074#1086#1088#1072'"'
  ExplicitLeft = 390
  ExplicitTop = 227
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
          NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1101#1090#1072#1087
          OptionsView.CellAutoHeight = False
          OptionsView.ExpandButtonsForEmptyDetails = True
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
          object cxGridDBTableView1ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1StageName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1101#1090#1072#1087#1072
            DataBinding.FieldName = 'StageName'
          end
          object cxGridDBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1NumbersContractsID: TcxGridDBColumn
            DataBinding.FieldName = 'NumbersContractsID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1Version: TcxGridDBColumn
            DataBinding.FieldName = 'Version'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1DateChange: TcxGridDBColumn
            DataBinding.FieldName = 'DateChange'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridDBTableView1UsernameChange: TcxGridDBColumn
            DataBinding.FieldName = 'UsernameChange'
            Visible = False
            VisibleForCustomization = False
          end
        end
      end
    end
    inherited Panel5: TPanel
      inherited cxGrid1: TcxGrid
        LookAndFeel.SkinName = ''
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
          NewItemRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1089#1102#1076#1072' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
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
          object cxGrid1DBTableView1Name: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'Name'
            HeaderImageIndex = 0
            Width = 150
          end
          object cxGrid1DBTableView1CodeNumber: TcxGridDBColumn
            Caption = #1064#1080#1092#1088
            DataBinding.FieldName = 'CodeNumber'
            HeaderImageIndex = 0
            Width = 150
          end
          object cxGrid1DBTableView1Number: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'Number'
            Width = 150
          end
          object cxGrid1DBTableView1CodeNumber1C: TcxGridDBColumn
            Caption = #1064#1080#1092#1088' '#1074' 1'#1057
            DataBinding.FieldName = 'CodeNumber1C'
            Width = 150
          end
        end
      end
    end
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec NumberContractsShow')
  end
  inherited ADOQuery3: TADOQuery
    BeforePost = ADOQuery3BeforePost
    SQL.Strings = (
      'exec StagesShow 2')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.617855173610000000
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
end
