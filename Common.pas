unit Common;

interface
uses cxGridCustomTableView, cxGridDBTableView, cxGraphics, Graphics, cxRichEdit,
     Controls, SysUtils, ShellAPI, Windows;


type
  RecordLights = record
    // ��������� ��� ��������� ������ � ������� �� insert/edit
    ErrorState: Boolean;
    ErrorControl: Boolean;
    RecordControlID: Integer;
end;

procedure ColorRecordByState(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; RL: RecordLights);
procedure LogError(RichEdit: TcxRichEdit; Text: string);
procedure LogWarning(RichEdit: TcxRichEdit; Text: string);
procedure LogInfo(RichEdit: TcxRichEdit; Text: string);
function GetMonthName(MonthNumber: Byte): string;
function DelDir(dir: string): Boolean;

implementation

function DelDir(dir: string): Boolean;
var fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));

  with fos do
  begin
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom  := PChar(dir + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure ColorRecordByState(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; RL: RecordLights);
begin
   if RL.ErrorControl then
    begin
      if AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('ID').Index] = RL.RecordControlID then
      begin
        if not RL.ErrorState then
          begin
            if AViewInfo.Item.VisibleIndex <> TcxGridDBTableView(Sender).Controller.FocusedColumnIndex then
              begin
                ACanvas.Brush.Color := clLime;
                ACanvas.Font.Color := clBlack;
              end else
              begin
                if AViewInfo.GridRecord.Focused then
                  begin
                    ACanvas.Brush.Color := clYellow;
                    ACanvas.Font.Color := clBlack;
                  end else
                  begin
                    ACanvas.Brush.Color := clLime;
                    ACanvas.Font.Color := clBlack;
                  end;
               end;
          end
        else
          begin
            ACanvas.Brush.Color := clRed;
            ACanvas.Font.Color := clBlack;
        end;
      end;
    end;
    ACanvas.FillRect(AViewInfo.Bounds);
end;

procedure LogError(RichEdit: TcxRichEdit; Text: string);
begin
  RichEdit.SelAttributes.Color := clRed;
  RichEdit.Lines.Add(Text);
  RichEdit.SetSelection(Length(RichEdit.Text),Length(Text));
  RichEdit.SelAttributes.Color := clRed;
end;

procedure LogWarning(RichEdit: TcxRichEdit; Text: string);
begin
  RichEdit.SelAttributes.Color := $008CFF;
  RichEdit.Lines.Add(Text);
  RichEdit.SetSelection(Length(RichEdit.Text),Length(Text));
  RichEdit.SelAttributes.Color := $008CFF;
end;

procedure LogInfo(RichEdit: TcxRichEdit; Text: string);
begin
  RichEdit.SelAttributes.Color := clBlue;
  RichEdit.Lines.Add(Text);
  RichEdit.SetSelection(Length(RichEdit.Text),Length(Text));
  RichEdit.SelAttributes.Color := clBlue;
end;

function GetMonthName(MonthNumber: Byte): string;
begin
  case MonthNumber of
    1: Result := '������';
    2: Result := '�������';
    3: Result := '����';
    4: Result := '������';
    5: Result := '���';
    6: Result := '����';
    7: Result := '����';
    8: Result := '������';
    9: Result := '��������';
    10: Result := '�������';
    11: Result := '������';
    12: Result := '�������';
  end;
end;


end.
