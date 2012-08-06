unit SQLRoutines1;

interface

Uses Windows, Classes, DB, ADODB, SysUtils, Forms, Dialogs, Controls,variants;

const
  // Property TNTServerInfo.ServerType Mask of following values
  SV_TYPE_UNKNOWN = 0;
  SV_TYPE_WORKSTATION = $00000001;
  SV_TYPE_SERVER = $00000002;
  SV_TYPE_SQLSERVER = $00000004;
  SV_TYPE_DOMAIN_CTRL = $00000008;
  SV_TYPE_DOMAIN_BAKCTRL = $00000010;
  SV_TYPE_TIME_SOURCE = $00000020;
  SV_TYPE_AFP = $00000040;
  SV_TYPE_NOVELL = $00000080;
  SV_TYPE_DOMAIN_MEMBER = $00000100;
  SV_TYPE_PRINTQ_SERVER = $00000200;
  SV_TYPE_DIALIN_SERVER = $00000400;
  SV_TYPE_SERVER_UNIX = $00000800;
  SV_TYPE_NT = $00001000;
  SV_TYPE_WFW = $00002000;
  SV_TYPE_SERVER_MFPN = $00004000;
  SV_TYPE_SERVER_NT = $00008000;
  SV_TYPE_POTENTIAL_BROWSER = $00010000;
  SV_TYPE_BACKUP_BROWSER = $00020000;
  SV_TYPE_MASTER_BROWSER = $00040000;
  SV_TYPE_DOMAIN_MASTER = $00080000;
  SV_TYPE_SERVER_OSF = $00100000;
  SV_TYPE_SERVER_VMS = $00200000;
  SV_TYPE_WINDOWS = $00400000;
  SV_TYPE_DFS = $00800000;
  SV_TYPE_ALTERNATE_XPORT = $20000000;
  SV_TYPE_LOCAL_LIST_ONLY = $40000000;
  SV_TYPE_DOMAIN_ENUM = $80000000;
  SV_TYPE_ALL = $FFFFFFFF;

type
  TCursor = -32768 .. 32767;

const
  crDefault = TCursor(0);
  crNone = TCursor(-1);
  crArrow = TCursor(-2);
  crCross = TCursor(-3);
  crIBeam = TCursor(-4);
  crSize = TCursor(-22);
  crSizeNESW = TCursor(-6);
  crSizeNS = TCursor(-7);
  crSizeNWSE = TCursor(-8);
  crSizeWE = TCursor(-9);
  crUpArrow = TCursor(-10);
  crHourGlass = TCursor(-11);
  crDrag = TCursor(-12);
  crNoDrop = TCursor(-13);
  crHSplit = TCursor(-14);
  crVSplit = TCursor(-15);
  crMultiDrag = TCursor(-16);
  crSQLWait = TCursor(-17);
  crNo = TCursor(-18);
  crAppStart = TCursor(-19);
  crHelp = TCursor(-20);
  crHandPoint = TCursor(-21);
  crSizeAll = TCursor(-22);

type
  PServerInfo101 = ^TServerInfo101;

  _SERVER_INFO_101 = record
    sv101_platform_id: DWORD;
    sv101_name: LPWSTR;
    sv101_version_major: DWORD;
    sv101_version_minor: DWORD;
    sv101_type: DWORD;
    sv101_comment: LPWSTR;
  end;

  TServerInfo101 = _SERVER_INFO_101;
procedure OpenParamsQ(Q: TadoQuery; S: string; const Args: array of const );
function _GetComputerName: string;
Procedure ListSQLServers(aList: TStrings);
function _OpenConnection(_ADOConn: TADOConnection; CType: integer;
  Provider, Server: String; Init_Cat: string = ''; Usr: string = '';
  Pass: string = ''): Boolean;
function _InitiateConnection(_ADOCon: TADOConnection; CType: integer;
  Server: String; Init_Cat: string = ''; Usr: string = ''; Pass: string = '';
  _Close: Boolean = True): Boolean;
function SQLOperationPrepared(Q: TadoQuery): Boolean;
function CheckSQLConnection(Con: TADOConnection;
  ErrorMessage: string = ''): Boolean;
Procedure CheckAndRestoreConnection(_Query: TadoQuery);
Function _HidePass(_Pass: String; Code: Boolean = True): String;
procedure _OpenQ(Q: TadoQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True); overload;
procedure _OpenQ(Q: TadoQuery; S: TStringList; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True); overload;
function _ExecQ(Q: TadoQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True): Boolean;
procedure _RefreshQ(Q: TadoQuery; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True);
function _Go_To_Rec(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): Boolean;
function _Read_Integer(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): integer;
function _Read_String(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): string;
function _Read_DateTime(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): TDateTime;
function _Read_Integer_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: integer; _ColumnName: string = 'TheName'): integer;
function _Read_String_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: string; _ColumnName: string = 'TheName'): string;
function _Read_DateTime_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: TDateTime; _ColumnName: string = 'TheName'): TDateTime;

implementation

uses Routines;

function _GetComputerName: string;
var
  Buf: Cardinal;
  Chars: array [0 .. 255] of char;
begin
  Result := GetEnvironmentVariable('Computername');
end;
function NetServerEnum(servername: LPCWSTR; level: DWORD; var bufptr: Pointer;
  prefmaxlen: integer; var entriesread: DWORD; var totalentries: DWORD;
  servertype: DWORD; domain: LPCWSTR; var resume_handle: DWORD): DWORD; stdcall;
  external 'netapi32.dll' name 'NetServerEnum';
/// /////////////////////////////////////////////////////////////////////////////
// //
// CONNECTION ROUTINES                            //
// //
/// /////////////////////////////////////////////////////////////////////////////

function CheckSQLConnection(Con: TADOConnection;
  ErrorMessage: string = ''): Boolean;
begin
  // mycomment
  Result := True;
  if not Con.Connected then
    begin
      try
        Con.Open;
      except
        if ErrorMessage <> '' then
          ShowMessage(ErrorMessage);
        Result := False;
      end;
    end;
end;

Procedure CheckAndRestoreConnection(_Query: TadoQuery);
var
  FreeQ: TadoQuery;
  S: byte;
begin
  FreeQ := TadoQuery.Create(_Query.Connection);
  FreeQ.Connection := _Query.Connection;
  FreeQ.SQL.Clear;
  FreeQ.SQL.Add('select 1 as variable');
  try
    FreeQ.Open;
    S := FreeQ.Fields[0].AsInteger;
    FreeQ.Close;
    FreeQ.Free;
  except
    _Query.Connection.Close;
    _Query.Connection.Open;
    FreeQ.Free;
  end;
end;

function SQLOperationPrepared(Q: TadoQuery): Boolean;
begin
  Result := True;
  CheckSQLConnection(Q.Connection);
  if not Q.Active then
    begin
      ShowMessage
        ('Нет связи с базой данных. Обратитесь к вашему системному администратору для устранения проблемы');
      Result := False;
      exit;
    end;
  if Q.RecordCount < 1 then
    begin
      ShowMessage('У вас нет ни одной записи.');
      Result := False;
      exit;
    end;
  if (Q.RecNo < 0) or (Q.RecNo > Q.RecordCount) then
    begin
      ShowMessage('Не выбрано ни одной записи.');
      Result := False;
      exit;
    end;
end;

procedure ListSQLServers(aList: TStrings);
var
  i, E, ResumeHandle, totalentries, entriesread: DWORD;
  pServerBuffer: Pointer;
  pIncBuff: PServerInfo101;
begin
  pServerBuffer := nil;
  ResumeHandle := 0;
  E := NetServerEnum(nil, 101, pServerBuffer, -1, entriesread, totalentries,
    SV_TYPE_SQLSERVER, nil, ResumeHandle);
  if E = 0 then
    begin
      aList.Clear;
      pIncBuff := pServerBuffer;
      for i := 1 to entriesread do
        begin
          aList.Add(WideCharToString(pIncBuff.sv101_name));
          inc(pIncBuff);
        end;
    end;
end;

function _OpenConnection(_ADOConn: TADOConnection; CType: integer;
  Provider, Server: String; Init_Cat: string = ''; Usr: string = '';
  Pass: string = ''): Boolean;
var
  S: String;
begin
  if (stOpen in _ADOConn.State) then
    _ADOConn.Close;
  Result := False;
  S := '';
  case CType of
    0:
      begin
        if AnsiUpperCase(Provider) <> 'SQLOLEDB.1' then
          begin
            Result := False;
            exit;
          end;
        S := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;';
        if Init_Cat <> '' then
          S := S + 'Initial Catalog=' + Init_Cat + ';';
        S := S + 'Data Source=' + Server + ';';
        S := S + 'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;';
        S := S + 'Workstation ID=' + _GetComputerName +
          ';Use Encryption for Data=False;';
        S := S + 'Tag with column collation when possible=False';
      end;
    1:
      begin
        if (AnsiUpperCase(Provider) <> 'SQLNCLI.1') or (Usr = '') or
          (Pass = '') then
          begin
            Result := False;
            exit;
          end;
        S := 'Provider=SQLNCLI.1;Password=' + Pass +
          ';Persist Security Info=True;';
        S := S + 'User ID=' + Usr + ';';
        if Init_Cat <> '' then
          S := S + 'Initial Catalog=' + Init_Cat + ';';
        S := S + 'Data Source=' + Server + ';';
      end;
  else
    begin
      Result := False;
      exit;
    end;
  end;
  if S = '' then
    exit;
  _ADOConn.Provider := Provider;
  _ADOConn.ConnectionString := S;
  try
    try
      _ADOConn.Open;
    finally
      if (stOpen in _ADOConn.State) then
        Result := True;
    end;
  except
    Result := False;
  end
end;

function _InitiateConnection(_ADOCon: TADOConnection; CType: integer;
  Server: String; Init_Cat: string = ''; Usr: string = ''; Pass: string = '';
  _Close: Boolean = True): Boolean;
var
  S: string;
begin
  case CType of
    0:
      S := 'SQLOLEDB.1';
    1:
      S := 'SQLNCLI.1';
  else
    begin
      Result := False;
      exit;
    end;
  end;
  Result := _OpenConnection(_ADOCon, CType, S, Server, Init_Cat, Usr, Pass);
  if _Close then
    if (stOpen in _ADOCon.State) then
      _ADOCon.Close;
end;
/// /////////////////////////////////////////////////////////////////////////////
// //
// HIDE PASS INTO KBYTE                           //
// //
/// /////////////////////////////////////////////////////////////////////////////

Function _HidePass(_Pass: String; Code: Boolean = True): String;
var
  i, pn: byte;
  S: string;
function _SetChar(_Type: byte; _Symb: char): String;
begin
  case _Type of
    0 .. 127:
      begin
        Result := Chr(random(127)) + Chr(255 - ord(_Symb));
      end;
  else
    begin
      Result := Chr(random(255));
      if ord(Result[1]) < 128 then
        Result := char(ord(Result[1]) + 128);
      Result := Result + _Symb;
    end;
  end;
end;
function _GetChar(FChar, SChar: char): char;
begin
  case ord(FChar) of
    0 .. 127:
      Result := Chr(255 - ord(SChar))
  else
    Result := SChar;
  end;
end;
function _GetTypedChars: char;
var
  S: byte;
begin
  S := 0;
  while not(S in [32 .. 126, 168, 184, 192 .. 255]) do
    S := random(255);
  Result := char(S);
end;
function _GetPN(FChar, SChar: char): byte;
begin
  case ord(FChar) of
    0 .. 109:
      Result := ord(FChar) - 100;
  else
    Result := 255 - ord(FChar);
  end;
end;

begin
  if Code then
    begin
      if length(_Pass) > 125 then
        begin
          Result := '-2';
          exit;
        end;
      Result := '';
      case length(_Pass) of
        1 .. 9:
          Result := char(100 + length(_Pass)) + _GetTypedChars;
        0:
          begin
            Result := '-1';
            exit;
          end;
      else
        Result := char(255 - length(_Pass)) + _GetTypedChars;
      end;
      for i := 1 to 126 do
        if i <= length(_Pass) then
          Result := Result + _SetChar(random(255), _Pass[i])
        else
          Result := Result + _SetChar(random(255), _GetTypedChars);
    end
  else begin
      Result := '';
      if length(_Pass) <> 254 then
        begin
          Result := '-3';
          exit;
        end;
      pn := _GetPN(_Pass[1], _Pass[2]);
      S := '';
      for i := 1 to 126 do
        begin
          if i <= pn then
            Result := Result + _GetChar(_Pass[i * 2 + 1], _Pass[i * 2 + 2])
          else
            S := S + _GetChar(_Pass[i * 2 + 1], _Pass[i * 2 + 2]);
        end;
    end;
end;
/// /////////////////////////////////////////////////////////////////////////////
// //
// QUERY ROUTINES                              //
// //
/// /////////////////////////////////////////////////////////////////////////////

procedure OpenParamsQ(Q: TadoQuery; S: string; const Args: array of const );
var
  i: integer;
  Result: variant;
begin

  CheckAndRestoreConnection(Q);
  Screen.Cursor := crSQLWait;

  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add(S);
  Result := vaNil;


  for i := 0 to High(Args) do
    with Args[i] do
      case VType of
        vtInteger:
          Q.Parameters.Items[i].Value := IntToStr(VInteger);
        vtBoolean:
          Q.Parameters.Items[i].Value := BoolToStr(VBoolean);
        vtChar:
          Q.Parameters.Items[i].Value := VChar;
        vtExtended:
          Q.Parameters.Items[i].Value := FloatToStr(VExtended^);
        vtString:
          Q.Parameters.Items[i].Value := VString^;
        // vtPChar:    Q.Parameters.Items[i].Value :=   VPChar;
        vtObject:
          Q.Parameters.Items[i].Value := VObject.ClassName;
        vtClass:
          Q.Parameters.Items[i].Value := VClass.ClassName;
        vtAnsiString:
          Q.Parameters.Items[i].Value := string(VAnsiString);
        vtUnicodeString:
          begin
            if (string(VUnicodeString)='') then Q.Parameters.Items[i].Value:=null else
            Q.Parameters.Items[i].Value := string(VUnicodeString);
          end;

        vtCurrency:
          Q.Parameters.Items[i].Value := CurrToStr(VCurrency^);
        vtVariant: begin
        if not varisnull(VVariant^) then

         Q.Parameters.Items[i].Value := string(VVariant^)
         else
         begin
            Q.Parameters.Items[i].Value:=Null;
         end;
        end;

        vtInt64:
          Q.Parameters.Items[i].Value := IntToStr(VInt64^);
      end;
  Q.Prepared := True;
 try
    try
      Q.Open;
      if Q.Fields.FindField('error') <> nil then
        if (Q.RecordCount > 0) and (Q.RecordCount <= 1) then
          if Q.FieldByName('error').AsString <> '' then
            begin
              MessageBox(0, pchar(Q.FieldByName('error').AsString),
                'Ошибка базы данных', MB_OK);
            end;
    except
      Screen.Cursor := crDefault;

        ShowMessage('Ошибка при выполнении запроса с сообщением:' + #13 +
          Q.Connection.Errors.Item[Q.Connection.Errors.Count - 1].Description);
    end;
  finally

      Screen.Cursor := crDefault;
  end;
end;

procedure _OpenQ(Q: TadoQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True);
var
  ChCur: Boolean;
begin
  CheckAndRestoreConnection(Q);
  ChCur := (Screen.Cursor = crDefault) and ChangeCursor;
  if ChCur then
    Screen.Cursor := crSQLWait;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add(S);
  try
    try
      Q.Open;
      if Q.Fields.FindField('error') <> nil then
        if (Q.RecordCount > 0) and (Q.RecordCount <= 1) then
          if Q.FieldByName('error').AsString <> '' then
            begin
              MessageBox(0, pchar(Q.FieldByName('error').AsString),
                'Ошибка базы данных', MB_OK);
            end;
    except
      Screen.Cursor := crDefault;
      if ShowWarnings then
        ShowMessage('Ошибка при выполнении запроса с сообщением:' + #13 +
          Q.Connection.Errors.Item[Q.Connection.Errors.Count - 1].Description);
    end;
  finally
    if ChCur then
      Screen.Cursor := crDefault;
  end;
end;

procedure _OpenQ(Q: TadoQuery; S: TStringList; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True);
var
  ChCur: Boolean;
begin
  CheckAndRestoreConnection(Q);
  ChCur := (Screen.Cursor = crDefault) and ChangeCursor;
  if ChCur then
    Screen.Cursor := crSQLWait;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.AddStrings(S);
  try
    try
      Q.Open;
      if Q.Fields.FindField('error') <> nil then
        if (Q.RecordCount > 0) and (Q.RecordCount <= 1) then
          if Q.FieldByName('error').AsString <> '' then
            begin
              MessageBox(0, pchar(Q.FieldByName('error').AsString),
                'Ошибка базы данных', MB_OK);
            end;
    except
      Screen.Cursor := crDefault;
      if ShowWarnings then
        ShowMessage('Ошибка при выполнении запроса с сообщением:' + #13 +
          Q.Connection.Errors.Item[Q.Connection.Errors.Count - 1].Description);
    end;
  finally
    if ChCur then
      Screen.Cursor := crDefault;
  end;
end;

function _ExecQ(Q: TadoQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True): Boolean;
var
  ChCur: Boolean;
begin
  Result := True;
  CheckAndRestoreConnection(Q);
  ChCur := (Screen.Cursor = crDefault) and ChangeCursor;
  if ChCur then
    Screen.Cursor := crSQLWait;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add(S);
  try
    try
      Q.ExecSQL;
      if Q.Fields.FindField('error') <> nil then
        if (Q.RecordCount > 0) and (Q.RecordCount <= 1) then
          if Q.FieldByName('error').AsString <> '' then
            begin
              MessageBox(0, pchar(Q.FieldByName('error').AsString),
                'Ошибка базы данных', MB_OK);
            end;
    except
      if ChCur then
        Screen.Cursor := crDefault;
      if ShowWarnings then
        ShowMessage('Ошибка при выполнении запроса с сообщением:' + #13 +
          Q.Connection.Errors.Item[Q.Connection.Errors.Count - 1].Description);
      Result := False;
    end;
  finally
    if ChCur then
      Screen.Cursor := crDefault;
  end;
end;

procedure _RefreshQ(Q: TadoQuery; ShowWarnings: Boolean = True;
  ChangeCursor: Boolean = True);
var
  bk: Pointer;
  ChCur: Boolean;
begin
  CheckAndRestoreConnection(Q);
  ChCur := (Screen.Cursor = crDefault) and ChangeCursor;
  if ChCur then
    Screen.Cursor := crSQLWait;
  bk := Q.GetBookmark;
  Q.Close;
  try
    try
      Q.Open;
      if Q.BookmarkValid(bk) then
        Q.GotoBookmark(bk);
    except
      Screen.Cursor := crDefault;
      if ShowWarnings then
        ShowMessage('Ошибка при выполнении запроса с сообщением:' + #13 +
          Q.Connection.Errors.Item[Q.Connection.Errors.Count - 1].Description);
    end;
  finally
    Q.FreeBookmark(bk);
    if ChCur then
      Screen.Cursor := crDefault;
  end;
end;
/// /////////////////////////////////////////////////////////////////////////////
// //
// RECORDS MANIPULATION                           //
// //
/// /////////////////////////////////////////////////////////////////////////////

function _Go_To_Rec(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): Boolean;
begin
  Result := False;
  if _AdoQ = nil then
    exit;
  if not _AdoQ.Active then
    exit;
  if _AdoQ.RecordCount <= 0 then
    exit;
  if _ColumnName = '' then
    _ColumnName := 'TheName';
  try
    _AdoQ.Locate(_ColumnName, _ValueName, [loCaseInsensitive]);
    Result := (_AdoQ.FieldByName(_ColumnName).AsString = _ValueName);
  except
    exit;
  end;
end;

function _Read_Integer(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): integer;
begin
  Result := -1;
  if not _Go_To_Rec(_AdoQ, _ValueName, _ColumnName) then
    Raise Exception.Create('Could not find Parameter');
  if _AdoQ.FieldByName('ValueType').AsInteger <> 1 then
    Raise Exception.Create('DataBase options structure broken');
  Result := VarToInt(_AdoQ.FieldByName('TheValue').AsVariant);
end;

function _Read_String(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): string;
begin
  Result := '';
  if not _Go_To_Rec(_AdoQ, _ValueName, _ColumnName) then
    Raise Exception.Create('Could not find Parameter');
  if _AdoQ.FieldByName('ValueType').AsInteger <> 4 then
    Raise Exception.Create('DataBase options structure broken');
  Result := _AdoQ.FieldByName('TheValue').AsString;
end;

function _Read_DateTime(_AdoQ: TadoQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): TDateTime;
begin
  Result := 0;
  if not _Go_To_Rec(_AdoQ, _ValueName, _ColumnName) then
    Raise Exception.Create('Could not find Parameter');
  if _AdoQ.FieldByName('ValueType').AsInteger <> 5 then
    Raise Exception.Create('DataBase options structure broken');
  Result := _AdoQ.FieldByName('TheValue').AsDateTime;
end;

function _Read_Integer_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: integer; _ColumnName: string = 'TheName'): integer;
begin
  Result := -1;
  try
    Result := _Read_Integer(_AdoQ, _ValueName, _ColumnName);
  finally
    if Result = -1 then
      Result := _Default_Result;
  end;
end;

function _Read_String_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: string; _ColumnName: string = 'TheName'): string;
begin
  Result := '';
  try
    Result := _Read_String(_AdoQ, _ValueName, _ColumnName);
  finally
    if (StringReplace(Result, ' ', '', [rfReplaceAll]) = '') or
      (AnsiUpperCase(Result) = 'NULL') then
      Result := _Default_Result;
  end;
end;

function _Read_DateTime_WDF(_AdoQ: TadoQuery; _ValueName: string;
  const _Default_Result: TDateTime; _ColumnName: string = 'TheName'): TDateTime;
begin
  Result := 0;
  try
    Result := _Read_DateTime(_AdoQ, _ValueName, _ColumnName);
  finally
    if Result = 0 then
      Result := _Default_Result;
  end;
end;

end.
