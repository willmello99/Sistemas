program Multimidia;

uses
  Vcl.Forms,
  ufrmMultimidia in 'ufrmMultimidia.pas' {frmMultimidia},
  uID3InfoWriter in 'uID3InfoWriter.pas';

{$R *.res}
Var
  frmMultimidia: TfrmMultimidia;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMultimidia, frmMultimidia);
  Application.Run;
end.
