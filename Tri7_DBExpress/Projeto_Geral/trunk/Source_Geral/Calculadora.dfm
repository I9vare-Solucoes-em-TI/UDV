object frmCalculadora: TfrmCalculadora
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 490
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 138
    Top = 0
    Width = 755
    Height = 490
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl1'
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object edtResultado: TcxRichEdit
      Left = 0
      Top = 0
      Align = alClient
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 0
      Height = 461
      Width = 755
    end
    object pnlResultado: TPanel
      Left = 0
      Top = 461
      Width = 755
      Height = 29
      Align = alBottom
      BevelInner = bvLowered
      Color = 13034466
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210688
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 138
    Height = 490
    Align = alLeft
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btn1: TcxButton
      Left = 7
      Top = 82
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '1'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn2: TcxButton
      Left = 39
      Top = 82
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '2'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn3: TcxButton
      Left = 71
      Top = 82
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '3'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn4: TcxButton
      Left = 7
      Top = 56
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '4'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn5: TcxButton
      Left = 39
      Top = 56
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '5'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn6: TcxButton
      Left = 71
      Top = 56
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '6'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn7: TcxButton
      Left = 7
      Top = 30
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '7'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn8: TcxButton
      Left = 39
      Top = 30
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '8'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn9: TcxButton
      Left = 71
      Top = 30
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '9'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btn0: TcxButton
      Left = 7
      Top = 108
      Width = 61
      Height = 23
      Cursor = crHandPoint
      Caption = '0'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btnVirgula: TcxButton
      Left = 71
      Top = 108
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = ','
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnNumeroClick
    end
    object btnSoma: TcxButton
      Left = 103
      Top = 30
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '+'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnSubtrai: TcxButton
      Left = 103
      Top = 56
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '-'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnMultiplica: TcxButton
      Left = 103
      Top = 82
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '*'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnDivide: TcxButton
      Left = 103
      Top = 108
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '/'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnMod: TcxButton
      Left = 71
      Top = 134
      Width = 61
      Height = 23
      Cursor = crHandPoint
      Caption = 'Mod'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnPorcentagem: TcxButton
      Left = 7
      Top = 134
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = '%'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object btnDiv: TcxButton
      Left = 39
      Top = 134
      Width = 29
      Height = 23
      Cursor = crHandPoint
      Caption = 'Div'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSomaClick
    end
    object edtCasasDecimais: TcxSpinEdit
      Left = 86
      Top = 238
      ParentFont = False
      Properties.OnChange = edtCasasDecimaisPropertiesChange
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 18
      Width = 46
    end
    object lblCasasDecimais: TcxLabel
      Left = 7
      Top = 241
      Caption = 'Casas decimais:'
      ParentColor = False
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object edtEntrada: TcxTextEdit
      Left = 7
      Top = 8
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 20
      OnKeyDown = edtEntradaKeyDown
      OnKeyPress = edtEntradaKeyPress
      OnKeyUp = edtEntradaKeyUp
      Width = 125
    end
    object btnZerarSoma: TcxButton
      Left = 7
      Top = 160
      Width = 125
      Height = 23
      Cursor = crHandPoint
      Caption = 'Zerar soma'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnZerarSomaClick
    end
    object btnLimparHistorico: TcxButton
      Left = 7
      Top = 186
      Width = 125
      Height = 23
      Cursor = crHandPoint
      Caption = 'Limpar hist'#243'rico'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnLimparHistoricoClick
    end
    object btnImprimirHistorico: TcxButton
      Left = 7
      Top = 212
      Width = 125
      Height = 23
      Cursor = crHandPoint
      Caption = 'Imprimir hist'#243'rico'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnImprimirHistoricoClick
    end
    object Panel1: TPanel
      Left = 2
      Top = 458
      Width = 134
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 24
      object btnCancelar: TcxButton
        Left = 6
        Top = 3
        Width = 123
        Height = 24
        Caption = 'Sair'
        Colors.Default = clWhite
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          080000000000900100009B0E00009B0E0000000100000000000000000000D7D7
          D7007D7D7D0033333300C3C3C300FFFFFF004C4C4C00A0A0A000181818007777
          7700EDEDED0099999900BCBCBC00444444006666660041414100CCCCCC00DEDE
          DE0026262600F0F0F000A5A5A500030303005252520037373700FBFBFB00ADAD
          AD00DDDDDD00E5E5E500828282003D3D3D00C7C7C7009C9C9C00575757004E4E
          4E00C1C1C100E3E3E3000909090047474700000000001A1A1A00A3A3A300EFEF
          EF005050500049494900C5C5C500C9C9C9000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000050505130D00
          000000000000000000002405050505050A06000000000000000000000000001C
          050505050E00212D101010101010101010100C000A0505050F000B0505050505
          05050505050505001A0505050F000B0505050505050505050505050011050505
          0F000B050505050505052D061B050515010505050F000B050505050505051F00
          271E0504230505050F000B05050505050505190000152805050505050F000B05
          052700000000000000000020180505050F000B05051200000000000000000000
          032205050F000B05051200000000000000000000032205050F000B0505270000
          0000000000000020180505050F000B05050B1616161603000000000505050505
          0F000B050505050505051F00271E0504230505050F000B050505050505052C2B
          1B050515010505050F000B05050505050505050505050500110505050F000B05
          0505050505050505050505001A0505051D000705050505050505050505050500
          1A0505050A06000000000000000000000000001C0505050505130D0000000000
          00000000000024050505}
        TabOrder = 0
        OnClick = btnCancelarClick
      end
    end
  end
end