unit uMultimidiaConfigurations;

interface

uses generics.collections
   , uMultimidiaClasses
   ;

Type

  TConfiguration = Class;

  TConfiguration = Class
    Strict Private
      fVolume: Integer;
      fMidiaRecents: TListString;
      fLoop: Boolean;
      fRandom: Boolean;
      fTextFinding: String;
      fReverse: Boolean;
      Constructor Create; Reintroduce;
      Destructor Destroy; Override;
      procedure plLoadConfigurations;
      procedure plSaveConfigurations;
    public
      Class Function GetUniqueConfiguration: TConfiguration;
      Class procedure FreeUniqueConfiguration;

      Property Volume: Integer read fVolume write fVolume;
      Property MidiaRecents: TListString read fMidiaRecents write fMidiaRecents;
      Property Loop: Boolean read fLoop write fLoop;
      Property Random: Boolean read fRandom write fRandom;
      Property TextFinding: String read fTextFinding write fTextFinding;
      Property Reverse: Boolean read fReverse write fReverse;
  End;

Var
  Configuration: TConfiguration = nil;
Const
  CNT_MULTIMIDIAFILE_TEMP = 'MultimidiaConfig.cgf';
  CNT_VOLUME = 'VOLUME: ';
  CNT_MIDIA_RECENTS = 'MIDIA_RECENTS: ';
  CNT_LOOP = 'LOOP: ';
  CNT_RANDOM = 'RANDOM: ';
  CNT_TEXT_FINDING = 'TEXT_FINDING: ';
  CNT_REVERSE = 'REVERSE: ';
  CNT_SEPARATOR = '|';

Function GetFolderTemp: String;
Function GetPreviousFolderTemp: String;

implementation

Uses SysUtils
   , Classes
   , System.IOUtils
   , Math
   ;

Function GetFolderTemp: String;
Begin
  Result := TPath.GetTempPath;
End;

Function GetPreviousFolderTemp: String;
Begin
  Result := ExtractFilePath(ExcludeTrailingPathDelimiter(TPath.GetTempPath));
End;

{ TConfiguration }

constructor TConfiguration.Create;
begin
  Inherited Create;
  fVolume := 50;
  fMidiaRecents := TListString.Create;
  fLoop := False;
  fRandom := False;
  fTextFinding := EmptyStr;
  fReverse := False;

  plLoadConfigurations;
end;

destructor TConfiguration.Destroy;
begin
  plSaveConfigurations;
  FreeAndNil(fMidiaRecents);
  inherited Destroy;
end;

procedure TConfiguration.plLoadConfigurations;
Var
  fileTemp: TStringList;
Begin
  fileTemp := TStringList.Create;
  Try
    Try
      fileTemp.LoadFromFile(GetPreviousFolderTemp + CNT_MULTIMIDIAFILE_TEMP);
      fVolume := StrToIntDef(StringReplace(fileTemp[0], CNT_VOLUME, EmptyStr, [rfReplaceAll, rfIgnoreCase]),50);
      fMidiaRecents.Assign(Trim(StringReplace(fileTemp[1], CNT_MIDIA_RECENTS, EmptyStr, [rfReplaceAll, rfIgnoreCase])), CNT_SEPARATOR);
      fLoop := Trim(StringReplace(fileTemp[2], CNT_LOOP, EmptyStr, [rfReplaceAll, rfIgnoreCase])) = '1';
      fRandom := Trim(StringReplace(fileTemp[3], CNT_RANDOM, EmptyStr, [rfReplaceAll, rfIgnoreCase])) = '1';
      fTextFinding := Trim(StringReplace(fileTemp[4], CNT_TEXT_FINDING, EmptyStr, [rfReplaceAll, rfIgnoreCase]));
      fReverse := Trim(StringReplace(fileTemp[5], CNT_REVERSE, EmptyStr, [rfReplaceAll, rfIgnoreCase])) = '1';
    Except
      // Erros não devem ser exibidos
    End;
  Finally
    FreeAndNil(fileTemp);
  End;
End;

procedure TConfiguration.plSaveConfigurations;
Var
  fileTemp: TStringList;
Begin
  fileTemp := TStringList.Create;
  Try
    fileTemp.Add(Format(CNT_VOLUME +' %d',[fVolume]));
    fileTemp.Add(Format(CNT_MIDIA_RECENTS +' %s',[fMidiaRecents.ToString]));
    fileTemp.Add(Format(CNT_LOOP +' %d',[ifthen(fLoop, 1,0)]));
    fileTemp.Add(Format(CNT_RANDOM +' %d',[ifthen(fRandom, 1, 0)]));
    fileTemp.Add(Format(CNT_TEXT_FINDING +' %s',[fTextFinding]));
    fileTemp.Add(Format(CNT_REVERSE +' %d',[ifthen(fReverse, 1, 0)]));
    fileTemp.SaveToFile(GetPreviousFolderTemp + CNT_MULTIMIDIAFILE_TEMP);
  Finally
    FreeAndNil(fileTemp);
  End;
End;

class procedure TConfiguration.FreeUniqueConfiguration;
begin
  if   Assigned(Configuration) then
       Configuration.Free;
  Configuration := nil;
end;

class function TConfiguration.GetUniqueConfiguration: TConfiguration;
begin
  if   not (Assigned(Configuration)) then
       Configuration := TConfiguration.Create;
  Result := Configuration;
end;

Initialization
  TConfiguration.GetUniqueConfiguration;

Finalization
  TConfiguration.FreeUniqueConfiguration;


end.
