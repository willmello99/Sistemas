unit uID3InfoWriter;

interface

uses System.Classes
   ;

type

  DWord = Cardinal;

  IID3InfoWriter = interface
    ['{B9B73748-06C8-45E2-82A4-533F1F7BDAD5}']

    Procedure Clear;
    Procedure LoadFromFile(FileName: String);

    Procedure ClearFrameAPIC;

    Function GetLoadedFile: Boolean;
  end;

  TID3InfoWriter = Class(TInterfacedObject, IID3InfoWriter)
    Strict Private
      fLoadedFile: Boolean;
      fMemoryStream: TMemoryStream;
    protected
      Function GetLoadedFile: Boolean;
    Public
      Constructor Create; Reintroduce;
      Destructor Destroy; Override;

      Procedure Clear;
      Procedure LoadFromFile(FileName: String);

      Procedure ClearFrameAPIC;

      Property LoadedFile: Boolean read GetLoadedFile;
  End;

Function ReverseBytes32(Value: Cardinal): Cardinal;

implementation

Uses SysUtils
   ;

Function ReverseBytes32(Value: Cardinal): Cardinal;
Begin
  Result := (Value SHR 24) OR (Value SHL 24) OR ((Value AND $00FF0000) SHR 8) OR ((Value AND $0000FF00) SHL 8);
End;

{ TID3InfoWriter }

Constructor TID3InfoWriter.Create;
Begin
  Inherited Create;
  fMemoryStream := TMemoryStream.Create;
  Clear;
End;

Destructor TID3InfoWriter.Destroy;
Begin
  if   Assigned(fMemoryStream) then
       FreeAndNil(fMemoryStream);
  Inherited Destroy;
End;

Function TID3InfoWriter.GetLoadedFile: Boolean;
Begin
  Result := fLoadedFile;
End;

Procedure TID3InfoWriter.Clear;
Begin
  fLoadedFile := False;
  fMemoryStream.Clear;
  fMemoryStream.SetSize(0);
End;

procedure TID3InfoWriter.LoadFromFile(FileName: String);
begin
  Clear;
  fMemoryStream.LoadFromFile(FileName);
  fLoadedFile := True;
end;

procedure TID3InfoWriter.ClearFrameAPIC;
Var
  I: Integer;
  Frame: array[0..3] of byte;
  FrameSize: DWord;
  Size: Cardinal;
  Buffer: Integer;
  fMemoryTemp: TMemoryStream;
begin
  fMemoryTemp := TMemoryStream.Create;
  fMemoryStream.Position := 0;
  I := 0;
  Size := 0;
  while I < (fMemoryStream.Size-4) do
        Begin
          fMemoryStream.Position := I;
          fMemoryStream.Read(Frame, 4);
          if (Frame[0] = 65{A}) And (Frame[1] = 80{P}) And (Frame[2] = 73{I}) And  (Frame[3] = 67{C}) then
             Begin
               fMemoryStream.Read(FrameSize, 4);
               Size := ReverseBytes32(FrameSize SHL 8) + 2;
//               Buffer := 0;
//               fMemoryStream.Write(Buffer, Size);
//                (Value SHR 24) OR (Value SHL 24) OR ((Value AND $00FF0000) SHR 8) OR ((Value AND $0000FF00) SHL 8)
//               break;
               I := I + Size;
               fMemoryTemp.Position := I - Size;
               FillChar(Frame, SizeOf(Frame), 0);
               fMemoryTemp.Write(Frame, 4);
             End
          Else
             Begin
               fMemoryTemp.Position := I - Size;
               fMemoryTemp.Write(Frame, 4);
             End;

          Inc(I);
        End;
  fMemoryTemp.SaveToFile('C:\Users\William\Desktop\teste.mp3');
  FreeAndNil(fMemoryTemp);
end;

end.
