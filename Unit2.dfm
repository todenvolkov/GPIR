inherited Form2: TForm2
  Caption = 'Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    ExplicitTop = 540
  end
  inherited Panel2: TPanel
    ExplicitHeight = 491
    inherited Panel3: TPanel
      ExplicitHeight = 489
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
      ExplicitHeight = 489
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
      ExplicitLeft = 169
      ExplicitWidth = 558
      ExplicitHeight = 489
      inherited cxGrid1: TcxGrid
        LookAndFeel.SkinName = ''
        ExplicitWidth = 558
        ExplicitHeight = 489
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
          Styles.StyleSheet = nil
          object cxGrid1DBTableView1id: TcxGridDBColumn
            DataBinding.FieldName = 'id'
          end
          object cxGrid1DBTableView1divisionID: TcxGridDBColumn
            DataBinding.FieldName = 'divisionID'
          end
          object cxGrid1DBTableView1SpecialistCategoryID: TcxGridDBColumn
            DataBinding.FieldName = 'SpecialistCategoryID'
          end
          object cxGrid1DBTableView1fio: TcxGridDBColumn
            DataBinding.FieldName = 'fio'
          end
          object cxGrid1DBTableView1employeeNumber: TcxGridDBColumn
            DataBinding.FieldName = 'employeeNumber'
          end
          object cxGrid1DBTableView1plannedBeginDate: TcxGridDBColumn
            DataBinding.FieldName = 'plannedBeginDate'
          end
          object cxGrid1DBTableView1plannedEndDate: TcxGridDBColumn
            DataBinding.FieldName = 'plannedEndDate'
          end
          object cxGrid1DBTableView1worktypeId: TcxGridDBColumn
            DataBinding.FieldName = 'worktypeId'
          end
          object cxGrid1DBTableView1plannedHours: TcxGridDBColumn
            DataBinding.FieldName = 'plannedHours'
          end
        end
      end
    end
  end
end
