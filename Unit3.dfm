object Form3: TForm3
  Left = 421
  Top = 331
  Caption = 'Form3'
  ClientHeight = 469
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 80
    Top = 64
    Width = 849
    Height = 361
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnEditing = cxGrid1DBTableView1Editing
      OnInitEdit = cxGrid1DBTableView1InitEdit
      DataController.DataSource = WorkDS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1GUID: TcxGridDBColumn
        DataBinding.FieldName = 'GUID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1Value: TcxGridDBColumn
        DataBinding.FieldName = 'Value'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1BudgetGUID: TcxGridDBColumn
        DataBinding.FieldName = 'BudgetGUID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1AccountingHourGUID: TcxGridDBColumn
        DataBinding.FieldName = 'AccountingHourGUID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1BudgetArticleGUID: TcxGridDBColumn
        DataBinding.FieldName = 'BudgetArticleGUID'
        Visible = False
        VisibleForCustomization = False
        Width = 80
      end
      object cxGrid1DBTableView1DepartmentGUID: TcxGridDBColumn
        DataBinding.FieldName = 'DepartmentGUID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'GUID'
        Properties.ListColumns = <
          item
            FieldName = 'DepartmentName'
          end>
        Properties.ListSource = BudgetArticlesDS
        Width = 361
      end
      object cxGrid1DBTableView1PostGUID: TcxGridDBColumn
        DataBinding.FieldName = 'PostGUID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'GUID'
        Properties.ListColumns = <
          item
            FieldName = 'PostName'
          end>
        Properties.ListSource = DataSource1
        Width = 283
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object WorkQ: TADOQuery
    Active = True
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from AccountingHourValues')
    Left = 128
    Top = 304
  end
  object WorkDS: TDataSource
    DataSet = WorkQ
    Left = 128
    Top = 368
  end
  object BudgetArticlesQ: TADOQuery
    Active = True
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Departments')
    Left = 208
    Top = 304
  end
  object BudgetArticlesDS: TDataSource
    DataSet = BudgetArticlesQ
    Left = 208
    Top = 368
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Posts')
    Left = 304
    Top = 304
  end
  object cv: TDataSource
    DataSet = Q2
    Left = 376
    Top = 368
  end
  object Q2: TADOQuery
    Connection = MainForm.MainConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DepartmentGUID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from Posts'
      '      where DepartmentGUID = :DepartmentGUID')
    Left = 376
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 368
  end
end
