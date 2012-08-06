unit WorkWithExcel;

interface

uses SysUtils, ComObj, Variants, Grids;

var Excel, WorkBook, Sheet: Variant;

function StartExcel(Visible: Boolean): Boolean;
function OpenWorkBook(FileName: string): Boolean;
function SaveWorkBook(Filename: string): Boolean;
procedure StopExcel;
procedure SheetToGrid(Sheet: Variant; var Grid: TStringGrid);

function NewWorkbook: Boolean;
function AddSheet(Workbook: Variant): Boolean;

implementation


function StartExcel(Visible: Boolean): Boolean;
begin
  try
    Excel := CreateOLEObject('Excel.Application');
    if not VarIsNull(Excel) then
      begin
        Excel.Visible := Visible;
        Excel.DisplayAlerts := False;
        Result := True;
      end
      else Result := False;
  except
    Result := False;
  end;
end;

function NewWorkbook: Boolean;
begin
  try
    if not VarIsNull(Excel) then
      begin
        Workbook := Excel.Workbooks.Add;
        Result := True;
      end
      else Result := False;
  except
    Result := False;
  end;
end;

function AddSheet(Workbook: Variant): Boolean;
begin
  try
    if not VarIsNull(Workbook) then
      begin
        //Workbook := Excel.Workbooks.Add;
        Sheet := Workbook.Sheets.Add;
        Result := True;
      end
      else Result := False;
  except
    Result := False;
  end;
end;

procedure StopExcel;
begin
  try
    if not VarIsEmpty(Excel) then
      begin
        if (Excel.Workbooks.Count > 0) and (not Excel.Visible) then
          begin
            Excel.WindowState := $FFFFEFD4;
            Excel.Visible := True;
          end
          else Excel.Quit;
        //Excel.Free;
        //FreeAndNil(Excel);
        Excel := UnAssigned;
      end;
  except

  end;
end;

function OpenWorkBook(FileName: string): Boolean;
begin
  Result := False;
  try
    if not VarIsNull(Excel) then
      begin
        WorkBook := Excel.Workbooks.Open(FileName);
        if not VarIsNull(WorkBook) then
          begin
            Sheet := WorkBook.WorkSheets.Item[1];
            //Sheet.Cells.SpecialCells($0000000B).Activate;
            Result := True;
          end
          else Result := False;
      end;
  except
    Result := False;
  end;
end;

function SaveWorkBook(Filename: string): Boolean;
begin
  Result := False;
  try
    if not VarIsNull(Excel) then
      begin
        if not VarIsNull(WorkBook) then
          begin
            WorkBook.SaveAs(Filename);
            Result := True;
          end;
      end;
  except
    Result := False;
  end;
end;

procedure SheetToGrid(Sheet: Variant; var Grid: TStringGrid);
var X, Y: Integer;
    i, k: Integer;
begin
 try
   if not VarIsNull(Sheet) then
     begin
       Sheet.Cells.SpecialCells($0000000B).Activate;
       X := Excel.ActiveCell.Column+3;
       Y := Excel.ActiveCell.Row;
       Grid.ColCount := X;
       Grid.RowCount := Y;

       for i := 0 to Y do
         begin
           for k := 0 to X do
             begin
               Grid.Cells[k,i] := Excel.Cells.Item[i+1,k+1].Value;
             end;
         end;
        Grid.Cells[4,0] := 'Шаблон';
        Grid.Cells[5,0] := 'X';
        Grid.Cells[6,0] := 'Y';         
     end;
 except

 end;
end;


end.
