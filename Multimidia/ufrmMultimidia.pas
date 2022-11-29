unit ufrmMultimidia;

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
   , Vcl.ExtCtrls
   , Vcl.ComCtrls
   , uMultimidiaClasses
   , Vcl.RibbonLunaStyleActnCtrls
   , Vcl.Ribbon
   , Vcl.ToolWin
   , Vcl.ActnMan
   , Vcl.ActnCtrls
   , Vcl.ActnMenus
   , Vcl.RibbonActnMenus
   , System.Actions
   , Vcl.ActnList
   , Vcl.RibbonObsidianStyleActnCtrls
   , Vcl.StdCtrls
   , Vcl.Buttons
   , System.ImageList
   , Vcl.ImgList
   , Vcl.MPlayer
   , Vcl.Imaging.pngimage
   , Vcl.Menus
   , ShellAPI, System.Win.TaskbarCore, Vcl.Taskbar
   ;

type

  TfrmMultimidia = class(TForm)
    spContent: TSplitter;
    pnlMain: TPanel;
    pnlControlsMidia: TPanel;
    StatusBar: TStatusBar;
    pnlHeader: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    im16px: TImageList;
    Panel4: TPanel;
    tvContent: TTreeView;
    pnlFindMidia: TPanel;
    Label1: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer: TTimer;
    tbPosition: TTrackBar;
    tbVolume: TTrackBar;
    edFindMidia: TEdit;
    pnlButtonFindMidia: TPanel;
    imgFindMidia: TImage;
    Panel2: TPanel;
    pnlRandom: TPanel;
    pnlRepeat: TPanel;
    pnlNext: TPanel;
    pnlFastFoward: TPanel;
    pnlRewind: TPanel;
    pnlPrevious: TPanel;
    pnlStop: TPanel;
    pnlPause: TPanel;
    pnlPlay: TPanel;
    imPlay: TImage;
    imPause: TImage;
    imStop: TImage;
    imPrevious: TImage;
    imgRewind: TImage;
    imFastfoward: TImage;
    imNext: TImage;
    imRepeat: TImage;
    imRandom: TImage;
    pnlVolume: TPanel;
    imVolume: TImage;
    imMain: TImage;
    popArquivos: TPopupMenu;
    Arquivo1: TMenuItem;
    Abrirpasta1: TMenuItem;
    tmKeyBoard: TTimer;
    tmDesarm: TTimer;
    pnlReverse: TPanel;
    imReverse: TImage;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    TaskBarMidia: TTaskbar;
    ActionList: TActionList;
    actAnterior: TAction;
    actProxima: TAction;
    actParar: TAction;
    actReproduzirPausar: TAction;
    actAtivarDesativarMudo: TAction;
    imMidiaControls66px: TImageList;
    imMidiaControls25px: TImageList;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tvContentDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure tbVolumeChange(Sender: TObject);
    procedure imPlayClick(Sender: TObject);
    procedure imPauseClick(Sender: TObject);
    procedure imStopClick(Sender: TObject);
    procedure imNextClick(Sender: TObject);
    procedure imPreviousClick(Sender: TObject);
    procedure imRepeatClick(Sender: TObject);
    procedure imRandomClick(Sender: TObject);
    procedure imgFindMidiaClick(Sender: TObject);
    procedure edFindMidiaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvContentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgFindMidiaMouseEnter(Sender: TObject);
    procedure imgFindMidiaMouseLeave(Sender: TObject);
    procedure imPlayMouseEnter(Sender: TObject);
    procedure imPlayMouseLeave(Sender: TObject);
    procedure imPauseMouseEnter(Sender: TObject);
    procedure imPauseMouseLeave(Sender: TObject);
    procedure imStopMouseEnter(Sender: TObject);
    procedure imStopMouseLeave(Sender: TObject);
    procedure imPreviousMouseEnter(Sender: TObject);
    procedure imPreviousMouseLeave(Sender: TObject);
    procedure imgRewindMouseEnter(Sender: TObject);
    procedure imgRewindMouseLeave(Sender: TObject);
    procedure imFastfowardMouseEnter(Sender: TObject);
    procedure imFastfowardMouseLeave(Sender: TObject);
    procedure imNextMouseEnter(Sender: TObject);
    procedure imNextMouseLeave(Sender: TObject);
    procedure imRepeatMouseEnter(Sender: TObject);
    procedure imRepeatMouseLeave(Sender: TObject);
    procedure imRandomMouseEnter(Sender: TObject);
    procedure imRandomMouseLeave(Sender: TObject);
    procedure imVolumeMouseEnter(Sender: TObject);
    procedure imVolumeMouseLeave(Sender: TObject);
    procedure Arquivo1Click(Sender: TObject);
    procedure Abrirpasta1Click(Sender: TObject);
    procedure tmKeyBoardTimer(Sender: TObject);
    procedure imVolumeClick(Sender: TObject);
    procedure tmDesarmTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imReverseMouseEnter(Sender: TObject);
    procedure imReverseMouseLeave(Sender: TObject);
    procedure imReverseClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximaExecute(Sender: TObject);
    procedure actPararExecute(Sender: TObject);
    procedure actReproduzirPausarExecute(Sender: TObject);
    procedure actAtivarDesativarMudoExecute(Sender: TObject);
  private
    fLastID: Integer;
    fListMultimidiaItem: TListMultimidiaItem;
    fMinutesMidia: Integer;
    fSecondsMidia: Integer;
    fLoop: Boolean;
    fRandom: Boolean;
    fReverse: Boolean;
    fCurrentSong: TMultimidiaItem;
    fListNotReproduced: TListMultimidiaItem;
    fListRecents: TListMultimidiaItem;
    fTimerFindMidia: TTimer;
    fNumberJumper: Integer;
    fVolumeBackup: Integer;
    fPressButtonMidia: Boolean;
    TrayIconData: TNotifyIconData;
    fErrorsList: TStringList;

    procedure plLoadConfigurations;
    procedure plSaveConfigurations;
    procedure plLoadFile;
    procedure plLoadFolder;
    procedure plPlayMultimidia(MultimidiaItem: TMultimidiaItem);
    procedure plPause;
    procedure plResume;
    procedure plStop;
    procedure plNextSong;
    procedure plMuteDesmute;
    procedure plRepeat;
    procedure plRandom;
    procedure plPreviusSong;
    procedure plFindMidia;
    procedure plPlayContentSelect;
    procedure plResetFindMidia(Sender: TObject);
    procedure plCreateTimerResetMidia;

    // Procedures third party
    procedure plNotifyProc(Sender: TObject);
    procedure plSetMPVolume(MP: TMediaPlayer; Volume: Integer);
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;

    // Functions third party
    function flGetMPVolume(MP: TMediaPlayer): Integer;

    // Exceptions
    procedure plRemoveAPICFileMP3(MultimidiaItem: TMultimidiaItem);
  end;

implementation

{$R *.dfm}

uses uMultimidiaUtils
   , Generics.Defaults
   , Winapi.MMSystem
   , System.Math
   , StrUtils
   , UITypes
   , uMultimidiaConfigurations
   , Vcl.Themes
   , Vcl.Styles
   , uID3InfoWriter
   , ID3v2Library
   , System.IOUtils
   // Configurações
   , ufrmConfigurations
   ;

procedure TfrmMultimidia.FormCreate(Sender: TObject);
begin
  SetPriorityClass(GetCurrentProcess(), REALTIME_PRIORITY_CLASS);
  fListMultimidiaItem := TListMultimidiaItem.Create;
  fLastID := 0;
  MediaPlayer1.Notify := True;
  MediaPlayer1.OnNotify := plNotifyProc;
  fCurrentSong := nil;
  fListNotReproduced := TListMultimidiaItem.Create;
  fListRecents := TListMultimidiaItem.Create;
  plCreateTimerResetMidia;
  fNumberJumper := 0;
  fErrorsList := TStringList.Create;
  TrayIconData.cbSize := SizeOf(TrayIconData);
  TrayIconData.Wnd := Handle;
  TrayIconData.uID := 0;
  TrayIconData.uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
  TrayIconData.uCallbackMessage := WM_ICONTRAY;
  TrayIconData.hIcon := Application.Icon.Handle;
  StrPCopy(TrayIconData.szTip, Application.Title);
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);

end;

procedure TfrmMultimidia.FormDestroy(Sender: TObject);
begin
  plSaveConfigurations;
  FreeAndNil(fListMultimidiaItem);
  fCurrentSong := nil;
  FreeAndNil(fListNotReproduced);
  FreeAndNil(fListRecents);
  FreeAndNil(fTimerFindMidia);
  FreeAndNil(fErrorsList);
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfrmMultimidia.Abrirpasta1Click(Sender: TObject);
begin
  plLoadFolder;
end;

procedure TfrmMultimidia.actAnteriorExecute(Sender: TObject);
begin
  plPreviusSong;
end;

procedure TfrmMultimidia.actAtivarDesativarMudoExecute(Sender: TObject);
begin
  plMuteDesmute;
end;

procedure TfrmMultimidia.actPararExecute(Sender: TObject);
begin
  plStop;
end;

procedure TfrmMultimidia.actProximaExecute(Sender: TObject);
begin
  plNextSong;
end;

procedure TfrmMultimidia.actReproduzirPausarExecute(Sender: TObject);
begin
  if   MediaPlayer1.Mode in [TMPModes.mpPlaying] then
       plPause
  Else
       plResume;
end;

procedure TfrmMultimidia.Arquivo1Click(Sender: TObject);
begin
  plLoadFile;
end;

procedure TfrmMultimidia.BitBtn1Click(Sender: TObject);
begin
  plLoadFile;
end;

procedure TfrmMultimidia.BitBtn2Click(Sender: TObject);
begin
  plLoadFolder;
end;

procedure TfrmMultimidia.BitBtn3Click(Sender: TObject);
begin
  Application.MessageBox(PChar(fErrorsList.Text), PChar('Erros'), MB_OK or MB_ICONINFORMATION);
end;

procedure TfrmMultimidia.BitBtn4Click(Sender: TObject);
begin
  TfrmConfigurations.Execute;
end;

procedure TfrmMultimidia.edFindMidiaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: plFindMidia;
  end;
end;

procedure TfrmMultimidia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMultimidia.FormResize(Sender: TObject);
begin
  StatusBar.Panels[1].Width := Self.Width - StatusBar.Panels[0].Width - 130;
  if   WindowState = wsMinimized Then
       Application.MainForm.Hide;
end;

procedure TfrmMultimidia.FormShow(Sender: TObject);
begin
  plLoadConfigurations;
end;

procedure TfrmMultimidia.imNextClick(Sender: TObject);
begin
  plNextSong;
end;

procedure TfrmMultimidia.imNextMouseEnter(Sender: TObject);
begin
  pnlNext.Color := $FACE87;
end;

procedure TfrmMultimidia.imNextMouseLeave(Sender: TObject);
begin
  pnlNext.Color := clWhite;
end;

procedure TfrmMultimidia.imFastfowardMouseEnter(Sender: TObject);
begin
  pnlFastFoward.Color := $FACE87;
end;

procedure TfrmMultimidia.imFastfowardMouseLeave(Sender: TObject);
begin
  pnlFastFoward.Color := clWhite;
end;

procedure TfrmMultimidia.imgFindMidiaClick(Sender: TObject);
Begin
  plFindMidia;
end;

procedure TfrmMultimidia.imgFindMidiaMouseEnter(Sender: TObject);
begin
  pnlButtonFindMidia.Color := $FACE87;
end;

procedure TfrmMultimidia.imgFindMidiaMouseLeave(Sender: TObject);
begin
  pnlButtonFindMidia.Color := clWhite;
end;

procedure TfrmMultimidia.imRandomClick(Sender: TObject);
begin
  plRandom;
end;

procedure TfrmMultimidia.imRandomMouseEnter(Sender: TObject);
begin
  pnlRandom.Color := $FACE87;
end;

procedure TfrmMultimidia.imRandomMouseLeave(Sender: TObject);
begin
  if   fRandom then
       pnlRandom.Color := $FACE87
  else
       pnlRandom.Color := clWhite;
end;

procedure TfrmMultimidia.imgRewindMouseEnter(Sender: TObject);
begin
  pnlRewind.Color := $FACE87;
end;

procedure TfrmMultimidia.imgRewindMouseLeave(Sender: TObject);
begin
  pnlRewind.Color := clWhite;
end;

procedure TfrmMultimidia.imPauseClick(Sender: TObject);
begin
  plPause;
end;

procedure TfrmMultimidia.imPauseMouseEnter(Sender: TObject);
begin
  pnlPause.Color := $FACE87;
end;

procedure TfrmMultimidia.imPauseMouseLeave(Sender: TObject);
begin
  pnlPause.Color := clWhite;
end;

procedure TfrmMultimidia.imPlayClick(Sender: TObject);
begin
  plResume;
end;

procedure TfrmMultimidia.imPlayMouseEnter(Sender: TObject);
begin
  pnlPlay.Color := $FACE87;
end;

procedure TfrmMultimidia.imPlayMouseLeave(Sender: TObject);
begin
  pnlPlay.Color := clWhite;
end;

procedure TfrmMultimidia.imRepeatClick(Sender: TObject);
begin
  plRepeat;
end;

procedure TfrmMultimidia.imRepeatMouseEnter(Sender: TObject);
begin
  pnlRepeat.Color := $FACE87;
end;

procedure TfrmMultimidia.imRepeatMouseLeave(Sender: TObject);
begin
  if   fLoop then
       pnlRepeat.Color := $FACE87
  else
       pnlRepeat.Color := clWhite;
end;

procedure TfrmMultimidia.imReverseClick(Sender: TObject);
begin
  fReverse := not fReverse;
  if   fReverse Then
       pnlReverse.Color := $FACE87
  Else
       pnlReverse.Color := clWhite;
end;

procedure TfrmMultimidia.imReverseMouseEnter(Sender: TObject);
begin
  pnlReverse.Color := $FACE87;
end;

procedure TfrmMultimidia.imReverseMouseLeave(Sender: TObject);
begin
  if   fReverse Then
       pnlReverse.Color := $FACE87
  Else
       pnlReverse.Color := clWhite;
end;

procedure TfrmMultimidia.imPreviousClick(Sender: TObject);
begin
  plPreviusSong;
end;

procedure TfrmMultimidia.imPreviousMouseEnter(Sender: TObject);
begin
  pnlPrevious.Color := $FACE87;
end;

procedure TfrmMultimidia.imPreviousMouseLeave(Sender: TObject);
begin
  pnlPrevious.Color := clWhite;
end;

procedure TfrmMultimidia.imStopClick(Sender: TObject);
begin
  plStop;
end;

procedure TfrmMultimidia.imStopMouseEnter(Sender: TObject);
begin
  pnlStop.Color := $FACE87;
end;

procedure TfrmMultimidia.imStopMouseLeave(Sender: TObject);
begin
  pnlStop.Color := clWhite;
end;

procedure TfrmMultimidia.imVolumeClick(Sender: TObject);
begin
  plMuteDesmute;
end;

procedure TfrmMultimidia.imVolumeMouseEnter(Sender: TObject);
begin
  pnlVolume.Color := $FACE87;
end;

procedure TfrmMultimidia.imVolumeMouseLeave(Sender: TObject);
begin
  pnlVolume.Color := clWhite;
end;

procedure TfrmMultimidia.plLoadConfigurations;
Begin
  tbVolume.Position := TConfiguration.GetUniqueConfiguration.Volume;
//  TConfiguration.GetUniqueConfiguration.MidiaRecents :=
  fLoop := TConfiguration.GetUniqueConfiguration.Loop;
  imRepeat.OnMouseLeave(nil);
  fRandom := TConfiguration.GetUniqueConfiguration.Random;
  imRandom.OnMouseLeave(nil);
  edFindMidia.Text := TConfiguration.GetUniqueConfiguration.TextFinding;
  fReverse := TConfiguration.GetUniqueConfiguration.Reverse;
  imReverse.OnMouseLeave(nil);
End;

procedure TfrmMultimidia.plSaveConfigurations;
Begin
  TConfiguration.GetUniqueConfiguration.Volume := tbVolume.Position;
//  TConfiguration.GetUniqueConfiguration.MidiaRecents :=
  TConfiguration.GetUniqueConfiguration.Loop := fLoop;
  TConfiguration.GetUniqueConfiguration.Random := fRandom;
  TConfiguration.GetUniqueConfiguration.TextFinding := edFindMidia.Text;
  TConfiguration.GetUniqueConfiguration.Reverse := fReverse;
End;

procedure TfrmMultimidia.plLoadFile;
Var
  FileOpenDialog: TFileOpenDialog;
  MultimidiaFile: TMultimidiaItem;
  FileStream: TFileStream;
  TreeNode: TTreeNode;
begin
  FileOpenDialog := TFileOpenDialog.Create(Application);

  With FileOpenDialog.FileTypes.Add Do
       Begin
         DisplayName := 'Formato MP3';
         FileMask := '*.MP3';
       End;
  Try
    if   FileOpenDialog.Execute Then
         Begin
           fListMultimidiaItem.Clear;
           Inc(fLastID);
           FileStream := TFileStream.Create(FileOpenDialog.FileName, fmOpenRead);

           MultimidiaFile := TMultimidiaItem.Create;
           MultimidiaFile.ID := fLastID;
           MultimidiaFile.Path := FileOpenDialog.FileName;
           MultimidiaFile.Name := StringReplace(ExtractFileName(MultimidiaFile.Path), '.mp3', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
           MultimidiaFile.Bytes := FileStream.Size;
           MultimidiaFile.CreatedDate := FileDateToDateTime(FileAge(MultimidiaFile.Path));
           fListMultimidiaItem.Add(MultimidiaFile);

           tvContent.Items.BeginUpdate;
           Try
             tvContent.ClearSelection;
             tvContent.Items.Clear;

             TreeNode := tvContent.Items.Add(nil, MultimidiaFile.Name);
             TreeNode.ImageIndex := 1; // Pasta
             TreeNode.SelectedIndex := TreeNode.ImageIndex;
             TreeNode.Data := MultimidiaFile;

           Finally
             // Seleciona o primeiro registro
             if   tvContent.Items.Count > 0 then
                  tvContent.Select(tvContent.Items[0]);
             tvContent.Items.EndUpdate;
             FreeAndNil(FileStream);
           End;
         End;
  Finally
    FreeAndNil(FileOpenDialog);
  End;
end;

procedure TfrmMultimidia.plLoadFolder;
Var
  FileOpenDialog: TFileOpenDialog;
  TreeNode: TTreeNode;
  fPriorElement: TMultimidiaItem;

  Procedure ReadDirectory(const csDiretory: String; const coParent: TTreeNode);
  Var
    F: TSearchRec;
    Ret: Integer;
    FileStream: TFileStream;
    MultimidiaFile: TMultimidiaItem;
    TreeNodeChildren: TTreeNode;
    leExtensionValid: TExtensionsValid;

    function TemAtributo(Attr, Val: Integer): Boolean;
    Begin
      Result := Attr and Val = Val;
    End;

  Begin
    Ret := FindFirst(csDiretory +'\*.*', faAnyFile, F);
    Try
      while Ret = 0 do
            begin
              if   TemAtributo(F.Attr, faDirectory) then
                   Begin
                     if   (F.Name <> '.')
                     And  (F.Name <> '..') then
                          Begin
                            TreeNodeChildren := tvContent.Items.AddChild(coParent, ExtractFileName(ExcludeTrailingBackslash(F.Name)));
                            TreeNodeChildren.ImageIndex := 0; // Pasta
                            TreeNodeChildren.SelectedIndex := TreeNodeChildren.ImageIndex;
                            TreeNodeChildren.Data := MultimidiaFile;
                            ReadDirectory(csDiretory +'\'+ F.Name, TreeNodeChildren);
                          End;
                   End
              else
                   Begin
                     For leExtensionValid := Low(TExtensionsValid) to High(TExtensionsValid) Do
                         Begin
                           if   Pos(TExtensionsValidStrings[leExtensionValid], AnsiUpperCase(F.Name)) > 0 then
                                Begin
                                  Try
                                    FileStream := TFileStream.Create(csDiretory +'\'+ F.Name, fmOpenRead);
                                    Try
                                      MultimidiaFile := TMultimidiaItem.Create;
                                      Inc(fLastID);
                                      MultimidiaFile.ID := fLastID;
                                      MultimidiaFile.Path := csDiretory +'\'+ F.Name;
                                      MultimidiaFile.Name := StringReplace(ExtractFileName(MultimidiaFile.Path), '.mp3', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
                                      MultimidiaFile.Bytes := FileStream.Size;
                                      MultimidiaFile.CreatedDate := FileDateToDateTime(FileAge(MultimidiaFile.Path));
                                      MultimidiaFile.Prior := fPriorElement;
                                      fListMultimidiaItem.Add(MultimidiaFile);
                                      if   Assigned(fPriorElement) then
                                           fPriorElement.Next := MultimidiaFile;
                                      fPriorElement := MultimidiaFile;

                                      TreeNodeChildren := tvContent.Items.AddChild(coParent, MultimidiaFile.Name);
                                      TreeNodeChildren.ImageIndex := 1; // Música
                                      TreeNodeChildren.SelectedIndex := TreeNodeChildren.ImageIndex;
                                      TreeNodeChildren.Data := MultimidiaFile;
                                    Finally
                                      FreeAndNil(FileStream);
                                    End;
                                  Except
                                    On E:Exception Do
                                  End;
                                End;
                         End;
                   End;
              Ret := FindNext(F);
            end;
    Finally
      FindClose(F);
    End;
  End;

Begin
  fPriorElement := nil;
  FileOpenDialog := TFileOpenDialog.Create(Application);
  Try
    FileOpenDialog.Options := [fdoPickFolders];
    if   FileOpenDialog.Execute then
         Begin
           fLastID := 1;
           fListMultimidiaItem.Clear;
           // Exibe em tela o conteúdo da lista
           tvContent.Items.BeginUpdate;
           Try
             tvContent.ClearSelection;
             tvContent.Items.Clear;

             TreeNode := tvContent.Items.Add(nil, ExtractFileName(ExcludeTrailingBackslash(FileOpenDialog.FileName)));
             TreeNode.ImageIndex := 0; // Pasta
             TreeNode.SelectedIndex := TreeNode.ImageIndex;

             ReadDirectory(FileOpenDialog.FileName, TreeNode);
           Finally
             // Seleciona o primeiro registro
             if   tvContent.Items.Count > 0 then
                  tvContent.Select(tvContent.Items[0]);
             tvContent.Items.EndUpdate;
           End;

         End;
  Finally
    FreeAndNil(FileOpenDialog);
  End;
End;

procedure TfrmMultimidia.plPlayMultimidia(MultimidiaItem: TMultimidiaItem);
Var
//  Thread: TThreadMain;
  SetParams: MCI_WAVE_SET_PARMS;
begin
  if   Assigned(MultimidiaItem) then
       Begin
         // Tentativa de acionar uma thread no load dos arquivos
         // Resultado: sem sucesso
//         Thread := TThreadMain.Create;
//         Thread.OnExecute :=
//           procedure
//           begin

             Try
               MultimidiaItem.NumberReproductions := MultimidiaItem.NumberReproductions + 1;
               fCurrentSong := MultimidiaItem;
               tbPosition.Position := 0;
               Caption := MultimidiaItem.Name;
               StatusBar.Panels[0].Text := 'Em reprodução...';
               StatusBar.Panels[1].Text := MultimidiaItem.Path;
               fListRecents.Add(MultimidiaItem);
               if   Trim(MultimidiaItem.PathTmp) <> EmptyStr then
                    MediaPlayer1.FileName := MultimidiaItem.PathTmp
               Else
                    MediaPlayer1.FileName := MultimidiaItem.Path;
               Try
                 MediaPlayer1.Open;
               Except
                 On E:EMCIDeviceError Do
                    Begin
                      if   Trim(MultimidiaItem.PathTmp) <> EmptyStr then
                           Begin
                             fErrorsList.Add(MultimidiaItem.Path +' '+DateTimeToStr(Now)+': '+ e.Message);
                             raise E;
                           End;
                      if   E.Message = 'Problema ao inicializar o MCI.' Then
                           Begin
                             plRemoveAPICFileMP3(MultimidiaItem);
                             plPlayMultimidia(MultimidiaItem);
                           End;
                    End;
               End;
               MediaPlayer1.Play;
               tbPosition.Max := MediaPlayer1.Length div 1000;
               fMinutesMidia := Trunc(MediaPlayer1.Length / 1000 / 60);
               fSecondsMidia := Trunc((MediaPlayer1.Length / 1000) - (fMinutesMidia * 60));
               // Regula o volume do MediaPlayer
               tbVolumeChange(nil);

               SetParams.dwCallback := MediaPlayer1.Handle;
               SetParams.nChannels := 2;
               SetParams.wBitsPerSample := 32;
               SetParams.nSamplesPerSec := 44100*10;
               SetParams.nBlockAlign := 40;
               SetParams.nAvgBytesPerSec := 44100*10;
  //             SetParams.nAvgBytesPerSec := Trunc(SetParams.nSamplesPerSec * SetParams.nBlockAlign / 1000);
               mciSendCommand(MediaPlayer1.DeviceID, MCI_WAVE_SET_SAMPLESPERSEC or
                                                     MCI_WAVE_SET_AVGBYTESPERSEC or
                                                     MCI_WAVE_SET_CHANNELS or
                                                     MCI_WAVE_SET_BITSPERSAMPLE or
                                                     MCI_WAVE_SET_BLOCKALIGN, MCI_WAIT, Cardinal(@SetParams));

               imMidiaControls66px.GetIcon(1, TaskBarMidia.TaskBarButtons[2].Icon);
               TaskBarMidia.ApplyButtonsChanges;
             Except
               On E:Exception Do
                  Begin
                    fErrorsList.Add(MultimidiaItem.Path +' '+DateTimeToStr(Now)+': '+ e.Message);
                    plNextSong;
                  End;
             End;
//           end;
//         Thread.Start;
       End;
End;

Procedure TfrmMultimidia.plPause;
Begin
  if   MediaPlayer1.FileName <> EmptyStr then
       Begin
         MediaPlayer1.PauseOnly;
         StatusBar.Panels[0].Text := 'Em pausa...';
         imMidiaControls66px.GetIcon(0, TaskBarMidia.TaskBarButtons[2].Icon);
         TaskBarMidia.ApplyButtonsChanges;
       End;
End;

Procedure TfrmMultimidia.plResume;
Begin
  Try
    if   MediaPlayer1.FileName <> EmptyStr then
         Begin
           case MediaPlayer1.Mode of
             mpStopped,
             mpPaused: MediaPlayer1.Play;
           else
             MediaPlayer1.Open;
             MediaPlayer1.Play;
           end;
           // Regula o volume do MediaPlayer
           tbVolumeChange(nil);
           StatusBar.Panels[0].Text := 'Em reprodução...';
           imMidiaControls66px.GetIcon(1, TaskBarMidia.TaskBarButtons[2].Icon);
           TaskBarMidia.ApplyButtonsChanges;
         End;
  Except
    On E:Exception Do
       fErrorsList.Add(MediaPlayer1.FileName +' '+DateTimeToStr(Now)+': '+ e.Message);
  End;
End;

procedure TfrmMultimidia.plStop;
Begin
  if   MediaPlayer1.FileName <> EmptyStr then
       Begin
         MediaPlayer1.Stop;
         MediaPlayer1.Rewind;
         StatusBar.Panels[0].Text := 'Parado...';
       End;
End;

procedure TfrmMultimidia.tbVolumeChange(Sender: TObject);
begin
  plSetMPVolume(MediaPlayer1, tbVolume.Position * 10);
end;

procedure TfrmMultimidia.tmDesarmTimer(Sender: TObject);
begin
  fPressButtonMidia := False;
  tmDesarm.Enabled := False;
end;

procedure TfrmMultimidia.tmKeyBoardTimer(Sender: TObject);

  Function flKeyPressed(const ciKey: Integer): Boolean;
  Begin
    Result := GetKeyState(ciKey) and 128 > 0;
  End;

begin
  if   flKeyPressed(VK_MEDIA_NEXT_TRACK) then
       Begin
         if   not fPressButtonMidia Then
              Begin
                fPressButtonMidia := True;
                plNextSong;
                tmDesarm.Enabled := True;
              End;
       End
  Else
  if   flKeyPressed(VK_MEDIA_PLAY_PAUSE) then
       Begin
         if   not fPressButtonMidia then
              Begin
                fPressButtonMidia := True;
                if   MediaPlayer1.Mode in [TMPModes.mpPlaying] then
                     plPause
                Else
                     plResume;
                tmDesarm.Enabled := True;
              End;
       End
  Else
  if   flKeyPressed(VK_MEDIA_STOP) then
       Begin
         if   not fPressButtonMidia then
              Begin
                fPressButtonMidia := True;
                plStop;
                tmDesarm.Enabled := True;
              End;
       End
  else
  if   flKeyPressed(VK_MEDIA_PREV_TRACK) then
       begin
         if   not fPressButtonMidia then
              Begin
                fPressButtonMidia := True;
                plPreviusSong;
                tmDesarm.Enabled := True;
              End;
       end
  Else
  if   flKeyPressed(VK_VOLUME_MUTE) then
       Begin
         if   not fPressButtonMidia then
              Begin
                fPressButtonMidia := True;
                plMuteDesmute;
                tmDesarm.Enabled := True;
              End;
       End;
end;

procedure TfrmMultimidia.TimerTimer(Sender: TObject);
Var
  Minutes: Integer;
  Seconds: Integer;
begin
  Application.ProcessMessages;
  if   MediaPlayer1.Mode in [TMPModes.mpPlaying, mpPaused, mpOpen, mpRecording] then
       Begin
         Minutes := Trunc(MediaPlayer1.Position / 1000 / 60);
         Seconds := Trunc((MediaPlayer1.Position / 1000) - (Minutes * 60));

         StatusBar.Panels[2].Text := LPad(Minutes,'0',2)+':'+ LPad(Seconds,'0',2) +' / '+ LPad(fMinutesMidia,'0',2)+':'+ LPad(fSecondsMidia,'0',2) +'       ';
         tbPosition.Position := MediaPlayer1.Position div 1000;
         tbPosition.SelEnd := tbPosition.Position;
         tbPosition.SelStart := 0;
       End
  Else
       Begin
         tbPosition.Position := 0;
         tbPosition.SelEnd := 0;
         tbPosition.SelStart := 0;
         StatusBar.Panels[2].Text := '00:00 / 00:00       ';
       End;
end;

procedure TfrmMultimidia.plNotifyProc(Sender: TObject);
Var
  MediaPlayer: TMediaPlayer;
Begin
  if   Sender is TMediaPlayer then
       Begin
         MediaPlayer := TMediaPlayer(Sender);
         case MediaPlayer.Mode of
              TMPModes.mpPlaying : if   MediaPlayer.Position = MediaPlayer.Length then
                                        if   fLoop then
                                             Begin
                                               MediaPlayer.Rewind;
                                               MediaPlayer.Play;
                                             End
                                        Else
                                             plNextSong;
         end;
       End;
End;

procedure TfrmMultimidia.plSetMPVolume(MP: TMediaPlayer; Volume: Integer);
  { Volume: 0 - 1000 }
var
  p: MCI_DGV_SETAUDIO_PARMS;
begin
  { Volume: 0 - 1000 }
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_SETAUDIO_VOLUME;
  p.dwValue := Volume;
  p.dwOver := 0;
  p.lpstrAlgorithm := nil;
  p.lpstrQuality := nil;
  mciSendCommand(MP.DeviceID, MCI_SETAUDIO,
    MCI_DGV_SETAUDIO_VALUE or MCI_DGV_SETAUDIO_ITEM, Cardinal(@p));
end;

procedure TfrmMultimidia.TrayMessage(var Msg: TMessage);
begin
  case Msg.lParam of
    WM_LBUTTONDOWN: Begin
                      Application.MainForm.Show;
                      ShowWindow(Application.MainFormHandle, SW_SHOWNORMAL);
                      Application.BringToFront;
                    End;
    WM_RBUTTONDOWN: Application.MainForm.Hide;
  end;
End;

function TfrmMultimidia.flGetMPVolume(MP: TMediaPlayer): Integer;
var
  p: MCI_STATUS_PARMS;
begin
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_STATUS_VOLUME;
  mciSendCommand(MP.DeviceID, MCI_STATUS, MCI_STATUS_ITEM, Cardinal(@p));
  Result := p.dwReturn;
  { Volume: 0 - 1000 }
end;

procedure TfrmMultimidia.plRemoveAPICFileMP3(MultimidiaItem: TMultimidiaItem);
Var
//  ID3InfoWriter: TID3InfoWriter;
  ID3v2Tag: TID3v2Tag;
  Frame: Integer;
  PathTmp: String;
Begin
  PathTmp := TPath.GetTempPath + MultimidiaItem.Name +'.mp3';
  if   Not (FileExists(PathTmp)) then
       Begin
         CopyFile(PChar(MultimidiaItem.Path), PChar(PathTmp), False);
         ID3v2Tag := TID3v2Tag.Create;
         ID3v2Tag.LoadFromFile(MultimidiaItem.Path);
         Frame := ID3v2Tag.FrameExists('APIC');
         if   Frame > 0 then
              ID3v2Tag.Frames.Delete(Frame);

         ID3v2Tag.SaveToFile(PathTmp);
       End;
  MultimidiaItem.PathTmp := PathTmp;


//  ID3InfoWriter := TID3InfoWriter.Create;
//  Try
//    ID3InfoWriter.LoadFromFile(MultimidiaItem.Path);
//    ID3InfoWriter.ClearFrameAPIC;
//  Finally
//    FreeAndNil(ID3InfoWriter);
//  End;
End;

procedure TfrmMultimidia.plNextSong;
Var
  MultimidiaItem: TMultimidiaItem;

  Function flReturnRandomNumber: Integer;
  Var
    liRandom: Integer;
    I: Integer;

    procedure plResetNumberReproductions;
    Var
      Item: TMultimidiaItem;
    Begin
      for Item in fListMultimidiaItem do
          Item.NumberReproductions := 0;
    End;

  Begin
    I := 0;
    liRandom := RandomRange(1, fListMultimidiaItem.Count);
    while (not (fLoop))
      And (fListMultimidiaItem.Items[liRandom].NumberReproductions > 0) do
          Begin
            if   I >= fListMultimidiaItem.Count then
                 plResetNumberReproductions;

            liRandom := RandomRange(1, fListMultimidiaItem.Count);
            Inc(I);
          End;
    Result := liRandom;
  End;

Begin
  if   Assigned(fCurrentSong) then
       Begin
         if   fRandom then
              Begin
                // Reproduz aleatoriamente
                MultimidiaItem := fListMultimidiaItem.Items[flReturnRandomNumber];
                while MultimidiaItem.Name = fCurrentSong.Name do
                      Begin
                        MultimidiaItem := fListMultimidiaItem.Items[flReturnRandomNumber];
                      End;
                plPlayMultimidia(MultimidiaItem);
              End
         Else
              Begin
                // Reproduz na sequência
                if   fReverse then
                     Begin
                       // Order by DESC
                       plPlayMultimidia(fCurrentSong.Prior);
                     End
                Else
                     Begin
                       // Order by ASC
                       plPlayMultimidia(fCurrentSong.Next);
                     End;
              End;
       End;
End;

procedure TfrmMultimidia.plMuteDesmute;
Begin
  if   tbVolume.Position = 0 then
       Begin
         tbVolume.Position := fVolumeBackup;
         fVolumeBackup := 0;
         imVolume.Picture.Bitmap := nil;
         imMidiaControls25px.GetIcon(6, imVolume.Picture.Icon);
         imMidiaControls66px.GetIcon(6, TaskBarMidia.TaskBarButtons[4].Icon);
         TaskBarMidia.ApplyButtonsChanges;
       End
  Else
       Begin
         fVolumeBackup := tbVolume.Position;
         tbVolume.Position := 0;
         imVolume.Picture.Bitmap := nil;
         imMidiaControls25px.GetIcon(5, imVolume.Picture.Icon);
         imMidiaControls66px.GetIcon(5, TaskBarMidia.TaskBarButtons[4].Icon);
         TaskBarMidia.ApplyButtonsChanges;
       End;
End;

procedure TfrmMultimidia.plRepeat;
begin
  fLoop := not fLoop;
  if   fLoop then
       pnlRepeat.Color := $FACE87
  else
       pnlRepeat.Color := clWhite;
end;

procedure TfrmMultimidia.plRandom;
Begin
  fRandom := not fRandom;
  if   fRandom then
       pnlRandom.Color := $FACE87
  else
       pnlRandom.Color := clWhite;
End;

procedure TfrmMultimidia.plPreviusSong;
Var
  MultimidiaItem: TMultimidiaItem;
Begin
  if   Assigned(fCurrentSong) then
       if   fRandom then
            Begin
              // Reproduz aleatoriamente
              MultimidiaItem := fListMultimidiaItem.Items[RandomRange(1, fListMultimidiaItem.Count)];
              while MultimidiaItem.Name = fCurrentSong.Name do
                    Begin
                      MultimidiaItem := fListMultimidiaItem.Items[RandomRange(1, fListMultimidiaItem.Count)];
                    End;
              plPlayMultimidia(MultimidiaItem);
            End
       Else
            Begin
              // Reproduz na sequência
              if   fReverse then
                   Begin
                     // Order By DESC
                     plPlayMultimidia(fCurrentSong.Next);
                   End
              Else
                   Begin
                     // Order By ASC
                     plPlayMultimidia(fCurrentSong.Prior);
                   End;
            End;
End;

procedure TfrmMultimidia.plFindMidia;
Var
  I: Integer;
  lbBrokenFind: Boolean;
  liAmountFinded: Integer;

  Procedure plSubFindMidia(const coParent: TTreeNode);
  Var
    NodeFind: TTreeNode;
  Begin
    NodeFind := coParent.getFirstChild;
    while Assigned(NodeFind) do
          Begin
            if   Assigned(NodeFind.Data) then
                 Begin
                   // Arquivo
                   if   ContainsText(NodeFind.Text, Trim(edFindMidia.Text)) then
                        Begin
                          Inc(liAmountFinded);
                          if   liAmountFinded >= fNumberJumper then
                               Begin
                                 NodeFind.Selected := True;
                                 lbBrokenFind := True;
                               End;
                        End;
                 End
            Else
                 Begin
                   // Pasta
                   plSubFindMidia(NodeFind);
                 End;
            if   lbBrokenFind then
                 break;
            NodeFind := NodeFind.GetNext;
          End;
  End;

begin
  if   Trim(edFindMidia.Text) <> EmptyStr then
       Begin
         fTimerFindMidia.Enabled := False;
         liAmountFinded := 0;
         Inc(fNumberJumper);
         lbBrokenFind := False;
         // Busca
         For I := 0 to Pred(tvContent.Items.Count) do
             Begin
               if   Assigned(tvContent.Items[I].Data) Then
                    Begin
                      // Arquivo
                      if   ContainsText(tvContent.Items[I].Text, Trim(edFindMidia.Text)) then
                           Begin
                             Inc(liAmountFinded);
                             if   liAmountFinded >= fNumberJumper then
                                  Begin
                                    tvContent.Items[I].Selected := True;
                                    lbBrokenFind := True;
                                  End;
                           End;
                    End
               Else
                    begin
                      // Pasta
                      plSubFindMidia(tvContent.Items[I]);
                    End;
               if   lbBrokenFind then
                    break;
             End;
         plCreateTimerResetMidia;
         fTimerFindMidia.Enabled := True;
       End;
End;

procedure TfrmMultimidia.plPlayContentSelect;
Begin
  if   (Assigned(tvContent.Selected))
  And  (Assigned(tvContent.Selected.Data)) then
       plPlayMultimidia(TMultimidiaItem(tvContent.Selected.Data));
End;

procedure TfrmMultimidia.plResetFindMidia(Sender: TObject);
Begin
  fNumberJumper := 0;
  fTimerFindMidia.Enabled := False;
End;

procedure TfrmMultimidia.plCreateTimerResetMidia;
Begin
  if   Assigned(fTimerFindMidia) then
       FreeAndNil(fTimerFindMidia);
  fTimerFindMidia := TTimer.Create(nil);
  fTimerFindMidia.Interval := 2000;
  fTimerFindMidia.OnTimer := plResetFindMidia;
End;

procedure TfrmMultimidia.tvContentDblClick(Sender: TObject);
begin
  plPlayContentSelect;
end;

procedure TfrmMultimidia.tvContentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: plPlayContentSelect;
  end;
end;

end.
