unit routines;

interface

uses windows, SysUtils, ShellAPI, DB, ADODB, Messages, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, Menus, Jpeg, SQLRoutines1;

const
  bsp = #13;

type
  _TOKEN_USER = record
    User: TSidAndAttributes;
  end;

type
  CallReason = (AddReason, EditReason, ShowReason);

  // PAsyncThread = ^TAsyncThread;

type
  TOKEN_USER = _TOKEN_USER;
  PTOKEN_USER = ^TOKEN_USER;
function BoolToInt(Value: Boolean): integer;
function IntToBool(Value: integer): Boolean;
function ChangeLang(_Char: Char; ToRus: Boolean = True;
  RetPrev: Boolean = True): Char;
function DeleteWCID(_sn: string): string;
function GetNextControl(CurentControl: TObject): TObject;
procedure SetFocusToNextControl(CurentControl: TObject);
function FileVersion(AFileName: string): string;
FUNCTION GZCodeEAN13(Const S: String): String;
function ean13ekim(S: String): string;
function ean13(cbarre: string): string;
// procedure ExecQ( ADOQuery:TADOQuery; s:String);
// procedure OpenSavingPosQ( ADOQuery:TADOQuery;S:String);
// procedure RefreshQ(ADOQuery:TADOQuery);
// procedure OpenQ( ADOQuery:TADOQuery;S:String;const ShowError:boolean=true);
function isNull(S: string): string;
function isNullorQuote(S: string): string;
function TimeToDateTime(ATime: TDateTime): TDateTime;
function MinutesToTime(Minutes: integer): TDateTime;
procedure LogAction(Action, Value, Username: string; Date: TDateTime);
function Q(StrToQuote: string): string;
function c_GetTempPath: String;
function GetDirUp(Path: string): string;
function RemoveEnters(Inp: string): string;
function GetCurrentUserAndDomain(szUser: PChar; var chUser: DWORD;
  szDomain: PChar; var chDomain: DWORD): Boolean;
function RndFileName: string;
function _ComputerName: string;
function GetShortName(LongName: string): string;
procedure CreateThumbnail(InStream, OutStream: TStream; Width, Height: integer;
  FillColor: TColor = clWhite); overload;
procedure CreateThumbnail(const InFileName, OutFileName: string;
  Width, Height: integer; FillColor: TColor = clWhite); overload;
// procedure LogQuery(QueryString:string; DelayTime:TDateTime; ADOQ: TADOQuery = nil; Exception: Boolean=False);
function VarToInt(const V: Variant): integer;
function VarToFloat(const V: Variant): Real;
// procedure CheckAndRestoreConnection(_Query: TADOQuery);
// procedure ExecuteInSubProcess(Sender: TComponent; _Proc: TNotifyEvent);
procedure OpenQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True);
  overload;
procedure OpenQ(Q: TADOQuery; S: TStringList;
  ShowWarnings: Boolean = True); overload;
function ExecQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True): Boolean;
procedure RefreshQ(Q: TADOQuery; ShowWarnings: Boolean = True);
function Go_To_Rec(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): Boolean;
function Read_Integer(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): integer;
function Read_String(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): string;
function Read_DateTime(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): TDateTime;
function Read_Integer_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: integer; _ColumnName: string = 'TheName'): integer;
function Read_String_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: string; _ColumnName: string = 'TheName'): string;
function Read_DateTime_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: TDateTime; _ColumnName: string = 'TheName'): TDateTime;
procedure OpenAsyncQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
procedure ExecAsyncQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
procedure RefreshAsyncQ(Q: TADOQuery; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
function PrepareStringToQuery(S: string): string;
function VariantAsString(Value: Variant): string;

procedure SetPositionForm(ReferencePoint: TPoint; TargetForm: TForm);
procedure ChangeKeyboardLang(LangName: string);


implementation

Function DoAllocate(PA: Cardinal): Pointer;
begin
  Result := HeapAlloc(GetProcessHeap, 0, PA);
end;

Function DoFree(PA: Pointer): Boolean;
begin
 DoFree:=HeapFree(GetProcessHeap, 0, PA);

end;

function BoolToInt(Value: Boolean): integer;
begin
  Result := 0;
  if Value then
    Result := 1;
end;

function IntToBool(Value: integer): Boolean;
begin
  Result := (Value = 1);
end;

function ChangeLang(_Char: Char; ToRus: Boolean = True;
  RetPrev: Boolean = True): Char;
var
  UC: Boolean;
  Pr: string;
begin
  Result := _Char;
  if GetKeyboardLayout(0) = 68748313 then
    Pr := '00000419'
  else
    Pr := '00000409';
  if ToRus then
    begin
      if Pr = '00000419' then
        exit;
      UC := (_Char in ['A' .. 'Z']);
      if UC then
        _Char := AnsiLowerCase(_Char)[1];
      LoadKeyboardLayout('00000419', KLF_ACTIVATE); // rus
      case _Char of
        'q':
          Result := 'й';
        'w':
          Result := 'ц';
        'e':
          Result := 'у';
        'r':
          Result := 'к';
        't':
          Result := 'е';
        'y':
          Result := 'н';
        'u':
          Result := 'г';
        'i':
          Result := 'ш';
        'o':
          Result := 'щ';
        '[':
          Result := 'х';
        ']':
          Result := 'ъ';
        '{':
          Result := 'Х';
        '}':
          Result := 'Ъ';
        'p':
          Result := 'з';
        'a':
          Result := 'ф';
        's':
          Result := 'ы';
        'd':
          Result := 'в';
        'f':
          Result := 'а';
        'g':
          Result := 'п';
        'h':
          Result := 'р';
        'j':
          Result := 'о';
        'k':
          Result := 'л';
        'l':
          Result := 'д';
        ';':
          Result := 'ж';
        ':':
          Result := 'Ж';
        '''':
          Result := 'э';
        '"':
          Result := 'Э';
        'z':
          Result := 'я';
        'x':
          Result := 'ч';
        'c':
          Result := 'с';
        'v':
          Result := 'м';
        'b':
          Result := 'и';
        'n':
          Result := 'т';
        'm':
          Result := 'ь';
        ',':
          Result := 'б';
        '.':
          Result := 'ю';
        '/':
          Result := '.';
        '`':
          Result := 'ё';
        '<':
          Result := 'Б';
        '>':
          Result := 'Ю';
        '?':
          Result := ',';
        '~':
          Result := 'Ё';
        '@':
          Result := '"';
        '#':
          Result := '№';
        '$':
          Result := ';';
        '^':
          Result := ':';
        '&':
          Result := '?';
      end;
      if UC then
        Result := AnsiUpperCase(Result)[1]
    end
  else begin
      if Pr = '00000409' then
        exit;
      UC := (_Char in ['А' .. 'Я', 'Ё']);
      if UC then
        _Char := AnsiLowerCase(_Char)[1];
      LoadKeyboardLayout('00000409', KLF_ACTIVATE); // eng
      case _Char of
        'й':
          Result := 'q';
        'ц':
          Result := 'w';
        'у':
          Result := 'e';
        'к':
          Result := 'r';
        'е':
          Result := 't';
        'н':
          Result := 'y';
        'г':
          Result := 'u';
        'ш':
          Result := 'i';
        'щ':
          Result := 'o';
        'х':
          Result := '[';
        'ъ':
          Result := ']';
        'з':
          Result := 'p';
        'ф':
          Result := 'a';
        'ы':
          Result := 's';
        'в':
          Result := 'd';
        'а':
          Result := 'f';
        'п':
          Result := 'g';
        'р':
          Result := 'h';
        'о':
          Result := 'j';
        'л':
          Result := 'k';
        'д':
          Result := 'l';
        'ж':
          Result := ';';
        'э':
          Result := '''';
        'я':
          Result := 'z';
        'ч':
          Result := 'x';
        'с':
          Result := 'c';
        'м':
          Result := 'v';
        'и':
          Result := 'b';
        'т':
          Result := 'n';
        'ь':
          Result := 'm';
        'б':
          Result := ',';
        'ю':
          Result := '.';
        'ё':
          Result := '`';
        '.':
          Result := '/';
        ',':
          Result := '?';
        '"':
          Result := '@';
        '№':
          Result := '#';
        ';':
          Result := '$';
        ':':
          Result := '^';
        '?':
          Result := '&';
      end;
      if UC then
        case Result of
          '`':
            Result := '~';
          ';':
            Result := ':';
          '''':
            Result := '"';
          ',':
            Result := '<';
          '.':
            Result := '>';
          '[':
            Result := '{';
          ']':
            Result := '}';
        else
          Result := AnsiUpperCase(Result)[1];
        end;
    end;
  if RetPrev then
    LoadKeyboardLayout(PAnsiChar(Pr), KLF_ACTIVATE);
end;

function DeleteWCID(_sn: string): string;
// Extract name with ident
// Example: 'City (ID: 345)' => 'City'
var
  dp: byte;
begin
  Result := _sn;
  if length(_sn) = 0 then
    exit;
  dp := pos('(', _sn);
  if dp > 0 then
    delete(Result, dp - 1, length(_sn) - dp + 2);
end;

function CompareByTab(Item1: Pointer; Item2: Pointer): integer;
begin
  Result := 0;
  if TWinControl(Item1).TabOrder > TWinControl(Item2).TabOrder then
    Result := 1
  else if TWinControl(Item1).TabOrder < TWinControl(Item2).TabOrder then
    Result := -1
  else
    Result := 0;
end;

function GetNextControl(CurentControl: TObject): TObject;
var
  list: TList;
  i, nc: integer;
  Parent, Ctrl: TWinControl;
  Buf: TControl;
begin
  Result := nil;
  list := nil;
  try
    Ctrl := (CurentControl as TWinControl);
    if Ctrl.Parent <> nil then
      Parent := Ctrl.Parent
    else
      exit;
    nc := Ctrl.TabOrder + 1;
    list := TList.Create;
    for i := 0 to Parent.ControlCount - 1 do
      begin
        if not(Parent.Controls[i] as TWinControl).CanFocus then
          continue;
        list.Add(Parent.Controls[i]);
        if ((Parent.Controls[i] as TWinControl).TabOrder = nc) and
          (Parent.Controls[i] as TWinControl).tabstop then
          begin
            Result := Parent.Controls[i];
            break;
          end
      end;
    if Result = nil then
      begin
        list.Sort(CompareByTab);
        i := list.IndexOf(Ctrl);
        while (Result = nil) and (i < list.Count) do
          begin
            inc(i);
            if (not TWinControl(list[i]).tabstop) or
              (not TWinControl(list[i]).CanFocus) then
              continue
            else
              Result := TWinControl(list[i])
          end;
      end;
    if Result = nil then
      begin
        i := 0;
        while (Result = nil) and (i < list.Count) do
          begin
            inc(i);
            if (not TWinControl(list[i]).tabstop) or
              (not TWinControl(list[i]).CanFocus) then
              continue
            else
              Result := TWinControl(list[i])
          end;
      end;
    list.Free;
  except
    if list <> nil then
      list.Free;
  end;
end;

procedure SetFocusToNextControl(CurentControl: TObject);
var
  Ret: TObject;
begin
  Ret := GetNextControl(CurentControl);
  if Ret <> nil then
    TWinControl(Ret).SetFocus;
end;

function FileVersion(AFileName: string): string;
var
  szName: array [0 .. 255] of Char;
  P: Pointer;
  Value: Pointer;
  Len: UINT;
  GetTranslationString: string;
  FFileName: PChar;
  FValid: Boolean;
  FSize: DWORD;
  FHandle: DWORD;
  FBuffer: PChar;
begin
  try
    FFileName:='';
    FFileName := StrPCopy(StrAlloc(length(AFileName) + 1), AFileName);
    FValid := False;
    FSize:=0;
    FSize := GetFileVersionInfoSize(FFileName, FHandle);
    if FSize > 0 then
      try
        GetMem(FBuffer, FSize);
        FValid := GetFileVersionInfo(FFileName, FHandle, FSize, FBuffer);
      except
        FValid := False;
        raise;
      end;
    Result := '';
    if FValid then
      VerQueryValue(FBuffer, '\VarFileInfo\Translation', P, Len)
    else
      P := nil;
    if P <> nil then
      GetTranslationString :=
        IntToHex(MakeLong(HiWord(Longint(P^)), LoWord(Longint(P^))), 8);
    if FValid then
      begin
        StrPCopy(szName, '\StringFileInfo\' + GetTranslationString +
          '\FileVersion');
        if VerQueryValue(FBuffer, szName, Value, Len) then
          Result := StrPas(PChar(Value));
      end;
  finally
    try
      if FBuffer <> nil then
        FreeMem(FBuffer, FSize);
    except
    end;
    try
      StrDispose(FFileName);
    except
    end;
  end;
end;

function ean13(cbarre: string): string;
var
  chaine, codebarre: string;
  checksum: Longint;
  first, tableA, i: integer;
begin
  chaine := cbarre;
  i := 13;
  { for i := 1 to 13 do
    begin
    if (ord(chaine[i])<48) or (ord(chaine[i])>57) then chaine[i]:='0';
    end; }
  If i = 13 then
    begin
      i := 2;
      checksum := checksum + strtoint(chaine[i]);
      i := 4;
      checksum := checksum + strtoint(chaine[i]);
      i := 6;
      checksum := checksum + strtoint(chaine[i]);
      i := 8;
      checksum := checksum + strtoint(chaine[i]);
      i := 10;
      checksum := checksum + strtoint(chaine[i]);
      i := 12;
      checksum := checksum + strtoint(chaine[i]);
      checksum := checksum * 3;
      i := 1;
      checksum := checksum + strtoint(chaine[i]);
      i := 3;
      checksum := checksum + strtoint(chaine[i]);
      i := 5;
      checksum := checksum + strtoint(chaine[i]);
      i := 7;
      checksum := checksum + strtoint(chaine[i]);
      i := 9;
      checksum := checksum + strtoint(chaine[i]);
      i := 11;
      checksum := checksum + strtoint(chaine[i]);
    end;
  codebarre := chaine[1]; // (inttostr((10 - checksum Mod 10) Mod 10));
  codebarre := codebarre + chr(65 + strtoint(chaine[2]));
  first := strtoint(chaine[1]);
  for i := 3 to 7 do
    begin
      tableA := 0;
      if (i = 3) and ((first = 0) or (first = 1) or (first = 2) or
        (first = 3)) then
        tableA := 1;
      if (i = 4) and ((first = 0) or (first = 4) or (first = 7) or
        (first = 8)) then
        tableA := 1;
      if (i = 5) and ((first = 0) or (first = 1) or (first = 4) or (first = 5)
        or (first = 9)) then
        tableA := 1;
      if (i = 6) and ((first = 0) or (first = 2) or (first = 5) or (first = 6)
        or (first = 7)) then
        tableA := 1;
      if (i = 7) and ((first = 0) or (first = 3) or (first = 6) or (first = 8)
        or (first = 9)) then
        tableA := 1;
      If tableA = 1 Then
        codebarre := codebarre + chr(65 + strtoint(chaine[i]))
      Else
        codebarre := codebarre + chr(75 + strtoint(chaine[i]));
      tableA := 0;
    end;
  codebarre := codebarre + '*';
  For i := 8 To 13 do
    begin
      codebarre := codebarre + chr(97 + strtoint(chaine[i]));
    end;
  codebarre := codebarre + '+';
  ean13 := codebarre;
end;

FUNCTION GZCodeEAN13(Const S: String): String;
{ Fonction convertissant la chaine S en une chaine CodeEAN13 pouvant кtre
  imprimйe avec la police ean13.ttf de GrandZebu }
Type
  TBPos = (B2, B3, B4, B5, B6, B7);
  // Les caractиres utilisant la table B, les autres utilisant la table A
  TSBPos = Set Of TBPos;
Var
  i: integer;
  IB: TBPos;
Const
  TAB: Array ['0' .. '9'] Of TSBPos =
  // Table d'utilisation des tables A ou B en fonction du premiиr caractиre
  { 0 } ([],
    { 1 } [B4, B6, B7],
    { 2 } [B4, B5, B7],
    { 3 } [B4, B5, B6],
    { 4 } [B3, B6, B7],
    { 5 } [B3, B4, B7],
    { 6 } [B3, B4, B5],
    { 7 } [B3, B5, B6],
    { 8 } [B3, B4, B7],
    { 9 } [B3, B4, B6]);
BEGIN
  // Result := ''; // Rйsultat vide si erreur
  // If Length(S) <> 12 Then Exit; // La chaine d'entrйe doit avoir 12 caractиres
  // For I := 1 To 12 Do // Tous les caractиres doivent кtre des chiffres
  // If (S[I] < '0') Or (S[I] > '9') Then Exit;
  /// / Initialisation de la chaine avec la bonne longueur
  // SetLength(Result, 15);
  /// / Calcul (et enregistrement а sa place dans Result) de la somme de contrфle
  // I := 3 * (Ord(S[2]) + Ord(S[4]) + Ord(S[6]) + Ord(S[8]) + Ord(S[10]) + Ord(S[12]) - 48 * 6) +
  // Ord(S[1]) + Ord(S[3]) + Ord(S[5]) + Ord(S[7]) + Ord(S[9]) + Ord(S[11]) - 48 * 6;
  // Result[14] := Chr((10 - (I Mod 10)) Mod 10 + 97);
  /// / Sйparateurs de dйbut, du milieu et de fin
  // Result[1] := S[1];
  // Result[8] := '*';
  // Result[15]:= '+';
  /// / Transcodage des 6 premiиrs caractиres (2 а 7)
  // { Patois incomprйhensible !!! mais n'incrйmentant que l'indice de boucle
  // For IB := B2 To B7 Do
  // Result[Ord(IB) + 2] := Chr(Ord(S[Ord(IB) + 2]) - 48 + 65 + 10 * Ord(IB In TAB[S[1]]));
  // }
  // { La mкme chose en plus digeste mais utilisant plus de variables et de code }
  // I := 2;
  // For IB := B2 To B7 Do
  // begin
  // Result[I] := Chr(Ord(S[I]) - 48 + 65);
  // If IB In TAB[S[1]] Then Inc(Byte(Result[I]), 10);
  // Inc(I);
  // end;
  // {}
  /// / Transcodage des 5 derniers caractиres (8 а 12)
  // For I := 9 To 13 Do
  // Result[I] := Chr(Ord(S[I - 1]) - 48 + 97);
END;

function ean13ekim(S: String): String;
var
  chaine, codebarre: string;
  checksum: Longint;
  first, i: integer;
  tableA: Boolean;
begin
  Result := '';
  checksum := 0;
  if length(S) = 12 then
    begin
      i := 0;
      repeat
        inc(i);
        if (ord(S[i]) < 48) or (ord(S[i]) > 57) then
          begin
            i := 0;
          end;
      until (i = 12) or (i = 0);
      if i = 12 then
        begin
          i := 0;
          repeat
            inc(i, 2);
            checksum := checksum + strtoint(S[i]);
          until (i = 12);
          i := -1;
          repeat
            inc(i, 2);
            checksum := checksum + strtoint(S[i]);
          until (i = 11);
        end;
      S := S + inttostr((10 - checksum mod 10) mod 10);
      codebarre := S[1] + chr(65 + strtoint(S[2]));
      first := strtoint(S[1]);
      For i := 3 to 7 do
        begin
          tableA := False;
          if i = 3 then
            begin
              if first in [0 .. 3] then
                tableA := True;
            end;
          if i = 4 then
            begin
              if first in [0, 4, 7, 8] then
                tableA := True;
            end;
          if i = 5 then
            begin
              if first in [0, 1, 4, 5, 9] then
                tableA := True;
            end;
          if i = 6 then
            begin
              if first in [0, 2, 5, 6, 7] then
                tableA := True;
            end;
          if i = 7 then
            begin
              if first in [0, 3, 6, 8, 9] then
                tableA := True;
            end;
          if tableA then
            codebarre := codebarre + chr(65 + strtoint(S[i]))
          else
            codebarre := codebarre + chr(75 + strtoint(S[i]));
        end;
      codebarre := codebarre + '*';
      for i := 8 to 13 do
        codebarre := codebarre + chr(97 + strtoint(S[i]));
      codebarre := codebarre + '+';
      Result := codebarre;
    end;
end;
{ procedure LogQuery(QueryString:string; DelayTime:TDateTime; ADOQ: TADOQuery = nil; Exception: Boolean=False);
  var
  f:text;
  begin
  if ADOQ=nil then
  begin
  assignFile(f,'log.txt');
  Append(f);
  writeln(f,QueryString);
  closeFile(f);
  end

  else
  begin
  if Exception then
  AddErrorToLog(ADOQ)
  else
  AddToLog(ADOQ);
  end
  end;
}

{
  procedure ExecQ( ADOQuery:TADOQuery; s:String);
  var
  ChCur: Boolean;
  begin
  CheckAndRestoreConnection(ADOQuery);
  ChCur:=(Screen.Cursor=crDefault);
  if ChCur then
  Screen.Cursor:=crSQLWait;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.add(s);
  { try
  ADOQuery.ExecSQL;
  except
  ShowMessage('Ошибка выполнения запроса.'+s);
  Screen.Cursor:=crDefault;
  end; }     { +
  try
  try
  ADOQuery.ExecSQL;
  AddToLog(ADOQuery);
  Except
  AddErrorToLog(ADOQuery);
  end
  finally
  if ChCur then
  Screen.Cursor:=crDefault;
  end;
  end;

  procedure OpenSavingPosQ( ADOQuery:TADOQuery;S:String);
  var
  bk:TBookmark;
  beginTime,EndTime:TDatetime;
  ChCur: Boolean;
  begin
  CheckAndRestoreConnection(ADOQuery);
  bk:=ADOQuery.GetBookmark;
  ChCur:=(Screen.Cursor=crDefault);
  if ChCur then
  Screen.Cursor:=crSQLWait;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.add(s);
  {try
  ADOQuery.Open;
  try
  ADOQuery.GotoBookmark(bk);
  ADOQuery.FreeBookmark(bk);
  except
  end;
  except
  // ShowMessage('Ошибка выполнения запроса');
  Screen.Cursor:=crDefault;
  end; }     {
  ADOQuery.Open;
  AddToLog(ADOQuery);
  ADOQuery.GotoBookmark(bk);
  ADOQuery.FreeBookmark(bk);
  if ChCur then
  Screen.Cursor:=crDefault;
  end;
  {
  procedure RefreshQ( ADOQuery:TADOQuery);
  var
  bk:TBookmark;
  beginTime,EndTime:TDatetime;
  ChCur: Boolean;
  begin
  CheckAndRestoreConnection(ADOQuery);
  bk:=ADOQuery.GetBookmark;

  ChCur:=(Screen.Cursor=crDefault);
  if ChCur then
  Screen.Cursor:=crSQLWait;
  ADOQuery.Close;
  beginTime:=now;
  try

  ADOQuery.Open;
  AddToLog(ADOQuery);
  try
  ADOQuery.GotoBookmark(bk);
  ADOQuery.FreeBookmark(bk);
  except
  end;
  except
  AddErrorToLog(ADOQuery);
  end;
  {
  ADOQuery.Open;
  ADOQuery.GotoBookmark(bk);
  ADOQuery.FreeBookmark(bk);
}
{ EndTime:=now;
  begintime:=EndTime-beginTime;
  LogQuery(ADOQuery.SQL.Text,beginTime, ADOQuery);
  if ChCur then
  Screen.Cursor:=crDefault;
  end;
}{
  procedure OpenQ( ADOQuery:TADOQuery;S:String;const ShowError:boolean=true);
  var beginTime,EndTime:TDatetime;
  ChCur: Boolean;
  begin
  CheckAndRestoreConnection(ADOQuery);
  ChCur:=(Screen.Cursor=crDefault);
  if ChCur then
  Screen.Cursor:=crSQLWait;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.add(s);
  { try
  ADOQuery.Open;
  except
  if ShowError then
  ShowMessage('Ошибка выполнения запроса');
  Screen.Cursor:=crDefault;
  end; }
{
  try
  try
  beginTime:=now;
  ADOQuery.Open;
  EndTime:=now;
  begintime:=EndTime-beginTime;
  if pos('chedule_NeedsRefresh',s)=0 then
  if pos('Application_NeedsRestarting',s)=0 then
  LogQuery(s,beginTime, ADOQuery);

  if ADOQuery.Fields.FindField('error')<>nil then
  if (ADOQuery.RecordCount>0) and (ADOQuery.RecordCount<=1) then
  if ADOQuery.FieldByName('error').AsString<>'' then
  begin
  MessageBox(0,pchar(ADOQuery.FieldByName('error').asstring),'Ошибка базы данных',MB_OK);
  end;

  Except
  LogQuery(s,beginTime, ADOQuery, true);
  end
  finally
  if ChCur then
  Screen.Cursor:=crDefault;
  end;
  end;
}
function TimeToDateTime(ATime: TDateTime): TDateTime;
var
  H, M, S, MS: Word;
begin
  DecodeTime(ATime, H, M, S, MS);
  Result := H * 60 + M;
end;

function MinutesToTime(Minutes: integer): TDateTime;
var
  Hours, Min: integer;
begin
  Hours := Minutes div 60;
  Min := Minutes mod 60;
  Result := EncodeTime(Hours, Min, 0, 0);
end;

procedure LogAction(Action, Value, Username: string; Date: TDateTime);
begin
  { DONE : Сделать обработку - сохранение в журнале }
end;

function Q(StrToQuote: string): string;
begin
  Q := #39 + trim(StrToQuote) + #39;
end;

function isNull(S: string): string;
begin
  if (S = '') or (S = Q('')) or (S = Q('0')) or (S = '0') or
    (S = Q('0' + FormatSettings.DecimalSeparator + '00')) or
    (S = '0' + FormatSettings.DecimalSeparator + '00') then
    isNull := 'NULL'
  else
    isNull := S;
end;

function isNullorQuote(S: string): string;
begin
  if (S = '') or (S = Q('')) or (S = Q('0')) or (S = '0') or
    (S = Q('0' + FormatSettings.DecimalSeparator + '00')) or
    (S = '0' + FormatSettings.DecimalSeparator + '00') then
    isNullorQuote := 'NULL'
  else
    isNullorQuote := Q(S);
end;

function c_GetTempPath: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function GetDirUp(Path: string): string;
var i: Integer;
    s: string;
begin
   Result := '';
   s := ExtractFilePath(Path);
   s := Copy(s,1,Length(s)-1);
   s := ExtractFilePath(s + '.txt');        // Нафига?
   Result := s;
end;

function GetCurrentUserAndDomain(szUser: PChar; var chUser: DWORD;
  szDomain: PChar; var chDomain: DWORD): Boolean;
var
  hToken: THandle;
  cbBuf: Cardinal;
  ptiUser: PTOKEN_USER;
  snu: SID_NAME_USE;
begin
  Result := False;
  // Получаем маркер доступа текущего потока нашего процесса
  if not OpenThreadToken(GetCurrentThread(), TOKEN_QUERY, True, hToken) then
    begin
      if GetLastError() <> ERROR_NO_TOKEN then
        exit;
      // В случее ошибки - получаем маркер доступа нашего процесса.
      if not OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, hToken) then
        exit;
    end;
  // Вывываем GetTokenInformation для получения размера буфера
  if not GetTokenInformation(hToken, TokenUser, nil, 0, cbBuf) then
    if GetLastError() <> ERROR_INSUFFICIENT_BUFFER then
      begin
        CloseHandle(hToken);
        exit;
      end;
  if cbBuf = 0 then
    exit;
  // Выделяем память под буфер
  GetMem(ptiUser, cbBuf);
  // В случае удачного вызова получим указатель на TOKEN_USER
  if GetTokenInformation(hToken, TokenUser, ptiUser, cbBuf, cbBuf) then
    begin
      // Ищем имя пользователя и его домен по его SID
      if LookupAccountSid(nil, ptiUser.User.Sid, szUser, chUser, szDomain,
        chDomain, snu) then
        Result := True;
    end;
  // Освобождаем ресурсы
  CloseHandle(hToken);
  FreeMem(ptiUser);
end;

function RndFileName: string;
var // i,j:integer;a:real;s:string;
  GUID: TGUID;
begin
  CreateGUID(GUID);
  RndFileName := GUIDToString(GUID);
end;

function _ComputerName: string;
var
  lpBuffer: array [0 .. MAX_COMPUTERNAME_LENGTH] of Char;
  nSize: DWORD;
begin
  nSize := length(lpBuffer);
  if GetComputerName(lpBuffer, nSize) then
    Result := lpBuffer
  else
    Result := '';
end;

function GetShortName(LongName: string): string;
var
  a, b, c: string;
  i, j: integer;
begin
  a := copy(LongName, 1, pos(' ', LongName) - 1);
  b := copy(LongName, pos(' ', LongName) + 1, 1) + '.';
  c := copy(LongName, pos(' ', LongName) + 1, length(LongName));
  c := copy(c, pos(' ', c) + 1, 1) + '.';
  GetShortName := a + ' ' + b + c;
end;

function RemoveEnters(Inp: string): string;
var
  i: integer;
  st: string;
begin
  st := '';
  for i := 1 to length(Inp) do
    begin
      if (Inp[i] <> #$A) and (Inp[i] <> #$D) then
        st := st + Inp[i];
    end;
  RemoveEnters := st;
end;

procedure CreateThumbnail(InStream, OutStream: TStream; Width, Height: integer;
  FillColor: TColor = clWhite); overload;
var
  JpegImage: TJpegImage;
  Bitmap: TBitmap;
  Ratio: Double;
  ARect: TRect;
  AHeight, AHeightOffset: integer;
  AWidth, AWidthOffset: integer;
begin
  // Check for invalid parameters
  if Width < 1 then
    raise Exception.Create('Invalid Width');
  if Height < 1 then
    raise Exception.Create('Invalid Height');
  JpegImage := TJpegImage.Create;
  try
    // Load the image
    JpegImage.LoadFromStream(InStream);
    // Create bitmap, and calculate parameters
    Bitmap := TBitmap.Create;
    try
      Ratio := JpegImage.Width / JpegImage.Height;
      if Ratio > 1 then
        begin
          AHeight := Round(Width / Ratio);
          AHeightOffset := (Height - AHeight) div 2;
          AWidth := Width;
          AWidthOffset := 0;
        end
      else begin
          AWidth := Round(Height * Ratio);
          AWidthOffset := (Width - AWidth) div 2;
          AHeight := Height;
          AHeightOffset := 0;
        end;
      Bitmap.Width := Width;
      Bitmap.Height := Height;
      Bitmap.Canvas.Brush.Color := FillColor;
      Bitmap.Canvas.FillRect(Rect(0, 0, Width, Height));
      // StretchDraw original image
      ARect := Rect(AWidthOffset, AHeightOffset, AWidth + AWidthOffset,
        AHeight + AHeightOffset);
      Bitmap.Canvas.StretchDraw(ARect, JpegImage);
      // Assign back to the Jpeg, and save to the file
      JpegImage.Assign(Bitmap);
      JpegImage.SaveToStream(OutStream);
    finally
      Bitmap.Free;
    end;
  finally
    JpegImage.Free;
  end;
end;

procedure CreateThumbnail(const InFileName, OutFileName: string;
  Width, Height: integer; FillColor: TColor = clWhite); overload;
var
  InStream, OutStream: TFileStream;
begin
  InStream := TFileStream.Create(InFileName, fmOpenRead);
  try
    OutStream := TFileStream.Create(OutFileName, fmOpenWrite or fmCreate);
    try
      CreateThumbnail(InStream, OutStream, Width, Height, FillColor);
    finally
      OutStream.Free;
    end;
  finally
    InStream.Free;
  end;
end;

function VarToInt(const V: Variant): integer;
begin
  Result := 0;
  if vartostr(V) = '' then
    exit;
  if VarIsNumeric(V) then
    Result := strtoint(vartostr(V))
  else if VarIsOrdinal(V) then
    Result := strtoint(vartostr(V))
  else if VarIsFloat(V) then
    if trunc(strtofloat(vartostr(V))) = strtofloat(vartostr(V)) then
      Result := trunc(strtofloat(vartostr(V)));
  if Result <> 0 then
    exit;
  try
    Result := strtoint(vartostr(V));
  except
    Result := 0;
  end;
end;

function VarToFloat(const V: Variant): Real;
begin
  Result := 0;
  if vartostr(V) = '' then
    exit;
  if VarIsFloat(V) then
    Result := strtofloat(vartostr(V))
  else if VarIsOrdinal(V) then
    Result := strtoint(vartostr(V))
  else if VarIsNumeric(V) then
    Result := strtoint(vartostr(V));
  if Result <> 0 then
    exit;
  try
    Result := strtofloat(StringReplace(vartostr(V), ' ', '', [rfReplaceAll]));
  except
    Result := 0;
  end;
end;
{ procedure ExecuteInSubProcess(Sender: TComponent; _Procedure: TNotifyEvent; );
  var
  Cmp: TComponent;
  FHndl: HWND;
  begin

  end;
}
/// /////////////////////////////////////////////////////////////////////////////
// //
// Export From SQLROUTINES                          //
// //
/// /////////////////////////////////////////////////////////////////////////////

procedure OpenQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True);
begin
  _OpenQ(Q, S, ShowWarnings);
end;

procedure OpenQ(Q: TADOQuery; S: TStringList; ShowWarnings: Boolean = True);
begin
  _OpenQ(Q, S, ShowWarnings);
end;

function ExecQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True): Boolean;
begin
  Result := _ExecQ(Q, S, ShowWarnings);
end;

procedure RefreshQ(Q: TADOQuery; ShowWarnings: Boolean = True);
begin
  _RefreshQ(Q, ShowWarnings);
end;

function Go_To_Rec(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): Boolean;
begin
  Result := _Go_To_Rec(_AdoQ, _ValueName, _ColumnName);
end;

function Read_Integer(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): integer;
begin
  Result := _Read_Integer(_AdoQ, _ValueName, _ColumnName);
end;

function Read_String(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): string;
begin
  Result := _Read_String(_AdoQ, _ValueName, _ColumnName);
end;

function Read_DateTime(_AdoQ: TADOQuery; _ValueName: string;
  _ColumnName: string = 'TheName'): TDateTime;
begin
  Result := _Read_DateTime(_AdoQ, _ValueName, _ColumnName);
end;

function Read_Integer_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: integer; _ColumnName: string = 'TheName'): integer;
begin
  Result := _Read_Integer_WDF(_AdoQ, _ValueName, _Default_Result, _ColumnName);
end;

function Read_String_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: string; _ColumnName: string = 'TheName'): string;
begin
  Result := _Read_String_WDF(_AdoQ, _ValueName, _Default_Result, _ColumnName);
end;

function Read_DateTime_WDF(_AdoQ: TADOQuery; _ValueName: string;
  const _Default_Result: TDateTime; _ColumnName: string = 'TheName'): TDateTime;
begin
  Result := _Read_DateTime_WDF(_AdoQ, _ValueName, _Default_Result, _ColumnName);
end;

procedure OpenAsyncQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
begin
  // ATh:=TAsyncThread.CreateIt(OpenQuery,@Q,s,ShowWarnings, ChangeCur);
  //
  // while not Ath.WorkDone do
  // Application.ProcessMessages;
  //
  // ATh.CanbeDestructed:=True;
end;

procedure ExecAsyncQ(Q: TADOQuery; S: string; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
begin
  // ATh:=TAsyncThread.CreateIt(ExecQuery,@Q,s,ShowWarnings, ChangeCur);
  //
  // while not Ath.WorkDone do
  // Application.ProcessMessages;
  //
  // ATh.CanbeDestructed:=True;
end;

procedure RefreshAsyncQ(Q: TADOQuery; ShowWarnings: Boolean = True;
  ChangeCur: Boolean = True);
begin
  // ATh:=TAsyncThread.CreateIt(RefreshQuery,@Q,'',ShowWarnings, ChangeCur);
  //
  // while not Ath.WorkDone do
  // Application.ProcessMessages;
  //
  // ATh.CanbeDestructed:=True;
end;

function PrepareStringToQuery(S: string): string;
begin
  Result := StringReplace(S, '''', '''''', [rfReplaceAll]);
end;

function VariantAsString(Value: Variant): string;
begin
  try
    if VarIsNull(Value) then Result := 'NULL'
     else Result := #39 + Value + #39;
  except
  end;
end;

procedure SetPositionForm(ReferencePoint: TPoint; TargetForm: TForm);
begin
  TargetForm.Top := ReferencePoint.Y - 4;
  TargetForm.Left := ReferencePoint.X + 5;
  TargetForm.Height := Screen.Height - ReferencePoint.Y - 40;
  TargetForm.Width := Screen.Width - ReferencePoint.X - 20;
end;

procedure ChangeKeyboardLang(LangName: string);
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  if LangName = 'Ru' then LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
  if LangName = 'Eng' then LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
  //SetActiveKeyboardLayout(russian);
end;



end.
