inherited SprFormAccountingHours: TSprFormAccountingHours
  Left = 576
  Top = 204
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1080'"'
  ClientHeight = 488
  ClientWidth = 786
  ExplicitLeft = 576
  ExplicitTop = 204
  ExplicitWidth = 794
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 469
    Width = 786
    ExplicitTop = 469
    ExplicitWidth = 786
  end
  inherited Panel1: TPanel
    Width = 786
    ExplicitWidth = 786
  end
  inherited Panel2: TPanel
    Width = 786
    Height = 381
    ExplicitWidth = 786
    ExplicitHeight = 381
    inherited Panel3: TPanel
      Height = 381
      ExplicitHeight = 381
      inherited cxGrid3: TcxGrid
        Height = 381
        ExplicitHeight = 381
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
      Left = 686
      Height = 381
      ExplicitLeft = 686
      ExplicitHeight = 381
      inherited cxGrid2: TcxGrid
        Height = 381
        LookAndFeel.SkinName = ''
        ExplicitHeight = 381
        inherited cxGridDBTableView1: TcxGridDBTableView
          OptionsView.CellAutoHeight = False
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
      Width = 570
      Height = 381
      ExplicitWidth = 570
      ExplicitHeight = 381
      inherited cxGrid1: TcxGrid
        Width = 570
        Height = 381
        LookAndFeel.SkinName = ''
        ExplicitWidth = 570
        ExplicitHeight = 381
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
          end
          object cxGrid1DBTableView1AccountingHourName: TcxGridDBColumn
            Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1080
            DataBinding.FieldName = 'AccountingHourName'
            Width = 500
          end
          object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
            DataBinding.FieldName = 'BudgetGUID'
            Visible = False
          end
          object cxGrid1DBTableView1GUID: TcxGridDBColumn
            DataBinding.FieldName = 'GUID'
            Visible = False
          end
        end
      end
    end
    inherited LeftSplitter: TcxSplitter
      Height = 381
      ExplicitHeight = 381
    end
    inherited RightSplitter: TcxSplitter
      Left = 678
      Height = 381
      ExplicitLeft = 678
      ExplicitHeight = 381
    end
  end
  inherited Panel6: TPanel
    Width = 786
    ExplicitWidth = 786
    inherited cxSplitter1: TcxSplitter
      Left = 34
      ExplicitLeft = 34
    end
    inherited BudgetInfoMemo: TcxMemo
      ExplicitWidth = 34
      Width = 34
    end
    inherited RichEdit: TcxRichEdit
      Left = 42
      ExplicitLeft = 42
    end
  end
  inherited TopSplitter: TcxSplitter
    Width = 786
    ExplicitWidth = 786
  end
  inherited ADOQuery1: TADOQuery
    SQL.Strings = (
      'exec AccountingHoursShow')
  end
  inherited ADOQuery2: TADOQuery
    SQL.Strings = (
      'exec AccountingHoursShow')
  end
  inherited dxComponentPrinter1: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40921.623518692130000000
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
