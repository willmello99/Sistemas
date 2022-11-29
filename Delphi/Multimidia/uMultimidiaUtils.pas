unit uMultimidiaUtils;

interface

uses Sysutils
   ;

Function RPad(Text: String; Caracter: String; Len: Integer) : String; overload;
Function RPad(Text: Integer; Caracter: String; Len: Integer) : String; overload;
Function LPad(Text: String; Caracter: String; Len: Integer) : String; overload;
Function LPad(Text: Integer; Caracter: String; Len: Integer) : String; overload;

implementation

Function RPad(Text: String; Caracter: String; Len: Integer) : String;
Var
  I: Integer;
Begin
  Result := Text;
  for I := 1 to Len - Length(Text) do
      Begin
        Result := Result + Caracter;
      End;
End;

Function RPad(Text: Integer; Caracter: String; Len: Integer) : String;
Var
  I: Integer;
Begin
  Result := IntToStr(Text);
  for I := 1 to Len - Length(IntToStr(Text)) do
      Begin
        Result := Result + Caracter;
      End;
End;

Function LPad(Text: String; Caracter: String; Len: Integer) : String;
Var
  I: Integer;
Begin
  Result := Text;
  for I := 1 to Len - Length(Text) do
      Begin
        Result := Caracter + Result;
      End;
End;

Function LPad(Text: Integer; Caracter: String; Len: Integer) : String;
Var
  I: Integer;
Begin
  Result := IntToStr(Text);
  for I := 1 to Len - Length(IntToStr(Text)) do
      Begin
        Result := Caracter + Result;
      End;
End;

end.
