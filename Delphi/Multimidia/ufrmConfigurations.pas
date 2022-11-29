unit ufrmConfigurations;

interface

uses Winapi.Windows
   , Winapi.Messages
   , System.SysUtils
   , System.Variants
   , System.Classes
   , Vcl.Graphics
   , Vcl.Controls
   , Vcl.Forms
   , Vcl.Dialogs
   , Vcl.ComCtrls
   , Vcl.ExtCtrls
   , Vcl.StdCtrls
   , Vcl.Buttons
   , Vcl.Grids
   ;

type
  TfrmConfigurations = class(TForm)
    Panel1: TPanel;
    tvOptions: TTreeView;
    lblTitleOptions: TLabel;
    Splitter: TSplitter;
    pgOptions: TPageControl;
    tsShortcuts: TTabSheet;
    pnlFooter: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    sgShortcuts: TStringGrid;
    procedure tvOptionsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgShortcutsDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private

  public
    Class function Execute: Boolean;

    procedure plSaveConfigurations;
  end;

implementation

{$R *.dfm}

Class function TfrmConfigurations.Execute: Boolean;
Var
  Form: TfrmConfigurations;
Begin
  Form := TfrmConfigurations.Create(Application);
  Try
    if   Form.ShowModal = mrOk then
         Form.plSaveConfigurations;
  Finally
    FreeAndNil(Form);
  End;
End;

procedure TfrmConfigurations.plSaveConfigurations;
Begin

End;

procedure TfrmConfigurations.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmConfigurations.FormResize(Sender: TObject);
begin
  sgShortcuts.DefaultColWidth := tsShortcuts.Width div 2;
end;

procedure TfrmConfigurations.sgShortcutsDblClick(Sender: TObject);
begin
  if   (sgShortcuts.Col in [1..sgShortcuts.ColCount])
  And  (sgShortcuts.Row in [0..sgShortcuts.RowCount]) then
       Begin

       End;
end;

procedure TfrmConfigurations.tvOptionsDblClick(Sender: TObject);
begin
  if   Assigned(tvOptions.Selected) then
       if   tvOptions.Selected.Text = 'Atalhos' then
            pgOptions.ActivePage := tsShortcuts;
end;

end.
