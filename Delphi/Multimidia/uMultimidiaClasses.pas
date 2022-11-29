unit uMultimidiaClasses;

interface

Uses Generics.Collections
   , Winapi.Windows
   , System.Classes
   , System.SysUtils
   , Messages
   ;

Type

  TExtensionsValid = (tevMP3, tevWAV);

  MCI_DGV_SETAUDIO_PARMS = record
    dwCallback: DWORD;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PChar;
    lpstrQuality: PChar;
  end;

  MCI_STATUS_PARMS = record
    dwCallback: DWORD;
    dwReturn: DWORD;
    dwItem: DWORD;
    dwTrack: DWORD;
  end;

  TThreadMain = Class;
  TThreadMainClass = Class of TThreadMain;
  TMultimidiaItem = Class;
  TMultimidiaItemClass = Class of TMultimidiaItem;
  TListMultimidiaItem = Class;
  TListMultimidiaItemClass = Class of TListMultimidiaItem;
  TListString = Class;
  TListStringClass = Class of TListString;

  TThreadMain = Class(TThread)
    Private
      fOnExecute: TProc;
    public
      Constructor Create; Reintroduce;
      Procedure Execute; Override;
      Property OnExecute: TProc read fOnExecute write fOnExecute;

  End;

  TMultimidiaItem = Class
    Strict Private
      fID: Integer;
      fName: String;
      fPath: String;
      fPathTmp: String;
      fBytes: Int64;
      fCreatedDate: TDateTime;
      fNumberReproductions: Integer;
      fPrior: TMultimidiaItem;
      fNext: TMultimidiaItem;
    Public
      Constructor Create; Reintroduce;
      Destructor Destroy; Override;

      Property ID: Integer read fID write fID;
      Property Name: String read fName write fName;
      Property Path: String read fPath write fPath;
      Property PathTmp: String read fPathTmp write fPathTmp;
      Property Bytes: Int64 read fBytes write fBytes;
      Property CreatedDate: TDateTime read fCreatedDate write fCreatedDate;
      Property NumberReproductions: Integer read fNumberReproductions write fNumberReproductions;
      Property Prior: TMultimidiaItem read fPrior write fPrior;
      Property Next: TMultimidiaItem read fNext write fNext;
  End;

  TListMultimidiaItem = Class(TList<TMultimidiaItem>)
    Private
      function IndexOf(Value: TMultimidiaItem): Integer;

    Public
      function SortListID(const Item1, Item2: TMultimidiaItem): Integer;
      function SortListName(const Item1, Item2: TMultimidiaItem): Integer;
  End;

  TListString = Class(TList<String>)
    public
      Procedure Assign(Value: String; Separator: Char);
      Function ToString: String; Override;
  End;

const
  MCI_SETAUDIO = $0873;
  MCI_DGV_SETAUDIO_VOLUME = $4002;
  MCI_DGV_SETAUDIO_ITEM = $00800000;
  MCI_DGV_SETAUDIO_VALUE = $01000000;
  MCI_DGV_STATUS_VOLUME = $4019;
  WM_ICONTRAY = WM_USER + 1;

  TExtensionsValidStrings: array[TExtensionsValid] of string = ('.MP3', '.WAV');

implementation

Uses Generics.Defaults
   ;

{ TThreadMain }

constructor TThreadMain.Create;
begin
  Inherited Create(True);
  Self.Priority := TThreadPriority.tpTimeCritical;
  Self.FreeOnTerminate := True;
end;

Procedure TThreadMain.Execute;
Begin
  TThread.Synchronize(Self, procedure Begin fOnExecute End);
End;

{ TMultimidiaItem }

constructor TMultimidiaItem.Create;
begin
  fID := 0;
  fName := EmptyStr;
  fPath := EmptyStr;
  fPathTmp := EmptyStr;
  fBytes := 0;
  fCreatedDate := 0;
  fNumberReproductions := 0;
  fPrior := nil;
  fNext := nil;
end;

destructor TMultimidiaItem.Destroy;
begin
  inherited Destroy;
end;

{ TListMultimidiaItem }

function TListMultimidiaItem.IndexOf(Value: TMultimidiaItem): Integer;
Begin

End;

function TListMultimidiaItem.SortListID(const Item1, Item2: TMultimidiaItem): Integer;
begin
  Result := TComparer<Integer>.Default.Compare(Item1.ID, Item2.ID);
end;

function TListMultimidiaItem.SortListName(const Item1, Item2: TMultimidiaItem): Integer;
Begin
  Result := CompareText(Item1.Name, Item2.Name);
End;

{ TListString }

Procedure TListString.Assign(Value: String; Separator: Char);
Var
  lsStringList: TStringList;
  lsItem: String;
Begin
  lsStringList := TStringList.Create;
  Try
    lsStringList.Clear;
    lsStringList.StrictDelimiter := True;
    lsStringList.Delimiter := Separator;
    lsStringList.DelimitedText := Value;
    for lsItem in lsStringList do
        Self.Add(lsItem);
  Finally
    FreeAndNil(lsStringList);
  End;
End;

function TListString.ToString: String;
Var
  lsString: String;
begin
  Result := EmptyStr;
  for lsString in Self do
      if   Result = EmptyStr then
           Result := lsString
      Else
           Result := Result +'|'+ lsString;
end;

end.
