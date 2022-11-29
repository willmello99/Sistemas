object frmConfigurations: TfrmConfigurations
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#245'es'
  ClientHeight = 486
  ClientWidth = 509
  Color = 13882323
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 445
    ExplicitHeight = 481
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 445
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 240
    ExplicitHeight = 185
    object lblTitleOptions: TLabel
      Left = 0
      Top = 0
      Width = 185
      Height = 16
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Op'#231#245'es'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      ExplicitWidth = 177
    end
    object tvOptions: TTreeView
      Left = 0
      Top = 16
      Width = 185
      Height = 429
      Align = alClient
      BorderStyle = bsNone
      Indent = 19
      TabOrder = 0
      OnDblClick = tvOptionsDblClick
      Items.NodeData = {
        03010000002C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000000000001074100740061006C0068006F007300}
      ExplicitLeft = 1
      ExplicitTop = 17
      ExplicitWidth = 183
      ExplicitHeight = 463
    end
  end
  object pgOptions: TPageControl
    Left = 190
    Top = 0
    Width = 319
    Height = 445
    Align = alClient
    TabOrder = 1
    object tsShortcuts: TTabSheet
      Caption = 'Atalhos'
      TabVisible = False
      ExplicitTop = 24
      ExplicitHeight = 417
      object sgShortcuts: TStringGrid
        Left = 0
        Top = 0
        Width = 311
        Height = 435
        Align = alClient
        BorderStyle = bsNone
        ColCount = 2
        Ctl3D = False
        DefaultColWidth = 100
        DefaultRowHeight = 35
        DrawingStyle = gdsGradient
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine]
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = sgShortcutsDblClick
        ExplicitHeight = 417
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 445
    Width = 509
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 446
    ExplicitWidth = 442
    object btnSave: TBitBtn
      Left = 153
      Top = 6
      Width = 79
      Height = 28
      Caption = 'Salvar'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TBitBtn
      Left = 257
      Top = 6
      Width = 79
      Height = 28
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
