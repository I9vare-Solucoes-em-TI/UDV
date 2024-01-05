object frmBematech: TfrmBematech
  Left = 294
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Aplicativo de teste usando a API de comunica'#231#227'o e o driver de sp' +
    'ooler'
  ClientHeight = 490
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000222
    2222222222222222222222222220022222222222222222222222222222200222
    22222222222BB222222222222220022222222222BBBBBBBB2222222222200222
    222222BBBBBBBBBBBB222222222002222222BBBBBCCCCCCBBBBB222222200222
    2BBBBBBBCFCCFCCCBBBBBBB22220022BBBBBBBBCCCCFCCCCFBBBBBBBB22002BB
    BBBBBBBCCFCCCCFFCBBBBBBBBB2002BBBBBBBBBCCCCCFFCCCBBBBBBBBB20022B
    BBBBBBBCCCFFCCCCCBBBBBBBB22002222BBBBBBBCCCCCFCCBBBBBBB222200222
    2222BBBBBCCCCCCBBBBB222222200222222222BBBBBBBBBBBB22222222200222
    22222222BBBBBBBB222222222220022222222222222BB2222222222222200222
    2222222222222222222222222220022222222222222222222222222222200000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    000000000000000000000000000002222222222222200222222BB22222200222
    2BBBBBB22220022BBB36C3BBB22002BBBBCC6CBBBB20022BBB36C3BBB2200222
    2BBBBBB222200222222BB2222220022222222222222000000000000000000000
    00000000000000000000000000000000000000000000FFFF0000FFFF00000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000FFFF0000FFFF0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = Inicializa
  OnCreate = FormCreate
  OnDestroy = Button5Click
  PixelsPerInch = 96
  TextHeight = 13
  object Idioma: TGroupBox
    Left = 8
    Top = 4
    Width = 169
    Height = 47
    Caption = 'Idioma/Language'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RBIdioma: TRadioButton
      Left = 16
      Top = 20
      Width = 73
      Height = 17
      Cursor = crHandPoint
      Caption = 'Portugu'#234's'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RBIdiomaClick
    end
    object RadioButton2: TRadioButton
      Left = 96
      Top = 20
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Caption = 'English'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RadioButton2Click
    end
  end
  object Button5: TButton
    Left = 496
    Top = 457
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sai&r'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button5Click
  end
  object GroupBox6: TGroupBox
    Left = 184
    Top = 4
    Width = 153
    Height = 47
    Caption = 'Porta de Comunica'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ComboBox1: TComboBox
      Left = 38
      Top = 18
      Width = 76
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'LPT1'
        'COM1'
        'COM2'
        'USB')
    end
  end
  object GroupBox7: TGroupBox
    Left = 344
    Top = 4
    Width = 185
    Height = 47
    Caption = 'Modelo da Impressora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object ComboModeloImpressora: TComboBox
      Left = 13
      Top = 18
      Width = 156
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboModeloImpressoraChange
      Items.Strings = (
        'MP-20 CI'
        'MP-20 MI'
        'MP-20 TH'
        'MP-2000 CI'
        'MP-2000 TH'
        'Bloco T'#233'rmico'
        '58mm Kiosk Printer'
        '76/80mm Kiosk Printer'
        '112mm Kiosk Printer')
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 58
    Width = 585
    Height = 391
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Usando a API'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox8: TGroupBox
        Left = 6
        Top = 154
        Width = 307
        Height = 92
        Caption = 'Autentica'#231#227'o de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        object Label1: TLabel
          Left = 8
          Top = 27
          Width = 46
          Height = 13
          Caption = 'Time-Out:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 138
          Top = 28
          Width = 30
          Height = 13
          Caption = 'Texto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 101
          Top = 26
          Width = 20
          Height = 13
          Caption = 'seg.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object tempo: TEdit
          Left = 64
          Top = 24
          Width = 33
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '5'
        end
        object TxtAutentica: TEdit
          Left = 176
          Top = 24
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 48
          ParentFont = False
          TabOrder = 1
          Text = 'Teste de Autentica'#231#227'o'
        end
        object btnVerificaDocInserido: TButton
          Left = 144
          Top = 56
          Width = 153
          Height = 25
          Caption = 'Verificar Documento I&nserido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnVerificaDocInseridoClick
        end
        object btnAutenticacao: TButton
          Left = 8
          Top = 56
          Width = 129
          Height = 25
          Caption = 'Autenticar &Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnAutenticacaoClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 154
        Width = 307
        Height = 92
        Caption = 'Programa'#231#227'o do Presenter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label11: TLabel
          Left = 7
          Top = 26
          Width = 102
          Height = 13
          Caption = 'Tempo para retra'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 147
          Top = 26
          Width = 52
          Height = 13
          Caption = 'segundo(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit2: TEdit
          Left = 112
          Top = 22
          Width = 33
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          Text = '5'
        end
        object btnPrgramarPresenter: TButton
          Left = 8
          Top = 56
          Width = 137
          Height = 25
          Cursor = crHandPoint
          Caption = '&Programar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnPrgramarPresenterClick
        end
        object btnHabilitaPresenter: TButton
          Left = 159
          Top = 56
          Width = 138
          Height = 25
          Cursor = crHandPoint
          Caption = '&Habilitar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnHabilitaPresenterClick
        end
      end
      object Edit1: TEdit
        Left = 5
        Top = 10
        Width = 336
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 48
        ParentFont = False
        TabOrder = 0
        Text = 'Digite o texto aqui.'
      end
      object btnCaracterGrafico: TButton
        Left = 168
        Top = 264
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Imprimir caracter &gr'#225'fico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCaracterGraficoClick
      end
      object Button9: TButton
        Left = 352
        Top = 9
        Width = 155
        Height = 25
        Cursor = crHandPoint
        Caption = 'Caracteres A&centuados'
        TabOrder = 2
        OnClick = Button9Click
      end
      object btnAguardaImpressaoTexto: TButton
        Left = 344
        Top = 264
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Aguardar i&mpress'#227'o texto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnAguardaImpressaoTextoClick
      end
      object btnCortarPapel: TButton
        Left = 168
        Top = 296
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Corte Total do Papel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnCortarPapelClick
      end
      object GroupBox5: TGroupBox
        Left = 6
        Top = 257
        Width = 153
        Height = 98
        Caption = 'Status da Impressora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object btnStatusPorta: TButton
          Left = 8
          Top = 64
          Width = 137
          Height = 25
          Cursor = crHandPoint
          Caption = 'Status da impressora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnStatusPortaClick
        end
        object MemoStatus: TMemo
          Left = 8
          Top = 22
          Width = 137
          Height = 35
          Lines.Strings = (
            '')
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 320
        Top = 154
        Width = 185
        Height = 92
        Caption = 'Tamanho do Extrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object Label9: TLabel
          Left = 9
          Top = 26
          Width = 89
          Height = 13
          Caption = 'N'#250'mero de Linhas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit4: TEdit
          Left = 136
          Top = 22
          Width = 33
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          Text = '90'
        end
        object btnPrgramarExtrato: TButton
          Left = 11
          Top = 56
          Width = 82
          Height = 25
          Cursor = crHandPoint
          Caption = 'Programar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnPrgramarExtratoClick
        end
        object btnHabilitaTamanhoExtrato: TButton
          Left = 96
          Top = 56
          Width = 80
          Height = 25
          Cursor = crHandPoint
          Caption = 'Habilitar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnHabilitaTamanhoExtratoClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 40
        Width = 243
        Height = 69
        Caption = 'Modos de Impress'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object RBNormal: TRadioButton
          Left = 14
          Top = 31
          Width = 60
          Height = 17
          Cursor = crHandPoint
          Caption = 'Normal'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object RBElite: TRadioButton
          Left = 85
          Top = 31
          Width = 45
          Height = 17
          Cursor = crHandPoint
          Caption = 'Elite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RBCondensado: TRadioButton
          Left = 145
          Top = 32
          Width = 84
          Height = 17
          Cursor = crHandPoint
          Caption = 'Condensado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 256
        Top = 40
        Width = 251
        Height = 69
        Caption = 'Modos de Formata'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object RBNegrito: TCheckBox
          Left = 19
          Top = 23
          Width = 78
          Height = 15
          Cursor = crHandPoint
          Caption = 'Negrito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object RBItalico: TCheckBox
          Left = 139
          Top = 23
          Width = 70
          Height = 16
          Cursor = crHandPoint
          Caption = 'It'#225'lico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RBSublinhado: TCheckBox
          Left = 19
          Top = 42
          Width = 94
          Height = 17
          Cursor = crHandPoint
          Caption = 'Sublinhado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object RBExpandido: TCheckBox
          Left = 139
          Top = 42
          Width = 94
          Height = 19
          Cursor = crHandPoint
          Caption = 'Expandido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object Button1: TButton
        Left = 8
        Top = 117
        Width = 161
        Height = 24
        Cursor = crHandPoint
        Caption = 'Imprime Te&xto sem Formata'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 176
        Top = 117
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Imprime Texto com &Formata'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = Button2Click
      end
      object btnTesteTextoFormatado: TButton
        Left = 344
        Top = 117
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'T&este Texto Formatado'
        TabOrder = 12
        OnClick = btnTesteTextoFormatadoClick
      end
      object btnVerificarPapelPresenter: TButton
        Left = 344
        Top = 296
        Width = 161
        Height = 25
        Cursor = crHandPoint
        Caption = 'Verificar Papel Presenter'
        TabOrder = 14
        OnClick = btnVerificarPapelPresenterClick
      end
      object BtnCorteParcial: TButton
        Left = 168
        Top = 328
        Width = 161
        Height = 25
        Caption = 'Corte Parcial do Papel'
        Enabled = False
        TabOrder = 15
        OnClick = BtnCorteParcialClick
      end
    end
    object TSCodBarras: TTabSheet
      Caption = 'Usando C'#243'digo de Barras com a API'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GBEscolhaCod: TGroupBox
        Left = 3
        Top = 11
        Width = 507
        Height = 64
        Caption = 'Escolha o C'#243'digo de Barras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object CBSelectCodigo: TComboBox
          Left = 147
          Top = 27
          Width = 212
          Height = 21
          Cursor = crHandPoint
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = CBSelectCodigoChange
          Items.Strings = (
            'EAN8'
            'EAN13'
            'CODE 39'
            'CODE 93'
            'CODE 128'
            'PDF 417'
            'UPCA'
            'UPCE'
            'ITF'
            'MSI'
            'ISBN'
            'PLESSEY'
            'CODABAR')
        end
      end
      object GBCodigo: TGroupBox
        Left = 3
        Top = 210
        Width = 507
        Height = 64
        Caption = 'C'#243'digo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object MEDCodigo: TMaskEdit
          Left = 108
          Top = 26
          Width = 292
          Height = 21
          EditMask = '0000000;0;_'
          MaxLength = 7
          TabOrder = 0
          Text = '1234567'
        end
      end
      object GBLargura: TGroupBox
        Left = 4
        Top = 84
        Width = 140
        Height = 118
        Caption = 'Largura das Barras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object RBMedia: TRadioButton
          Left = 16
          Top = 56
          Width = 113
          Height = 17
          Caption = 'M'#233'dias (default)'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RBMediaClick
        end
        object RbGrossa: TRadioButton
          Left = 16
          Top = 80
          Width = 113
          Height = 17
          Caption = 'Grossas'
          TabOrder = 1
          OnClick = RbGrossaClick
        end
        object RBFina: TRadioButton
          Left = 16
          Top = 32
          Width = 113
          Height = 17
          Caption = 'Finas'
          TabOrder = 2
          OnClick = RBFinaClick
        end
      end
      object Panel2: TPanel
        Left = 4
        Top = 280
        Width = 504
        Height = 72
        BevelInner = bvLowered
        BorderWidth = 1
        TabOrder = 3
        object LBImprimirCodigo: TLabel
          Left = 3
          Top = 2
          Width = 497
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'Imprimir C'#243'digo de Barras'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object BtnImprimirCodigo: TBitBtn
          Left = 180
          Top = 31
          Width = 145
          Height = 25
          Cursor = crHandPoint
          Caption = 'Imprimir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BtnImprimirCodigoClick
        end
      end
      object GBPosicao: TGroupBox
        Left = 155
        Top = 84
        Width = 202
        Height = 118
        Caption = 'Posi'#231#227'o dos Caracteres'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object RBAcima: TRadioButton
          Left = 16
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Acima do c'#243'digo'
          TabOrder = 0
        end
        object RBAbaixo: TRadioButton
          Left = 16
          Top = 45
          Width = 129
          Height = 17
          Caption = 'Abaixo do c'#243'digo'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object RBAcimaAbaixo: TRadioButton
          Left = 16
          Top = 67
          Width = 178
          Height = 17
          Caption = 'Acima e abaixo do c'#243'digo'
          TabOrder = 2
        end
        object RBNaoImprime: TRadioButton
          Left = 16
          Top = 88
          Width = 173
          Height = 17
          Caption = 'N'#227'o imprime os caracteres'
          TabOrder = 3
        end
      end
      object GBFonte: TGroupBox
        Left = 369
        Top = 84
        Width = 140
        Height = 118
        Caption = 'Fonte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object RBFonteNormal: TRadioButton
          Left = 16
          Top = 40
          Width = 113
          Height = 17
          Caption = 'Normal'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RBFonteCondensada: TRadioButton
          Left = 16
          Top = 72
          Width = 113
          Height = 17
          Caption = 'Condensada'
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Usando o Driver de Spooler'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 4
        Top = 88
        Width = 504
        Height = 185
        BevelInner = bvLowered
        BorderWidth = 1
        TabOrder = 0
        object Label4: TLabel
          Left = 17
          Top = 10
          Width = 122
          Height = 13
          Caption = 'Entre com seu Texto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RichEdit1: TRichEdit
          Left = 15
          Top = 27
          Width = 258
          Height = 142
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'Bematech Solu'#231#245'es')
          ParentFont = False
          TabOrder = 0
          Zoom = 100
        end
        object BtnImprimirTexto: TBitBtn
          Left = 288
          Top = 60
          Width = 201
          Height = 25
          Cursor = crHandPoint
          Caption = 'Imprimir'
          TabOrder = 1
          OnClick = BtnImprimirTextoClick
        end
        object BtnFonte: TBitBtn
          Left = 288
          Top = 28
          Width = 200
          Height = 25
          Cursor = crHandPoint
          Caption = 'Modificar Fonte'
          TabOrder = 2
          OnClick = BtnFonteClick
        end
        object Button4: TButton
          Left = 288
          Top = 92
          Width = 201
          Height = 25
          Cursor = crHandPoint
          Caption = 'Desligar Sensor de Pouco Papel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      object Panel1: TPanel
        Left = 4
        Top = 280
        Width = 504
        Height = 72
        BevelInner = bvLowered
        BorderWidth = 1
        TabOrder = 1
        object Label6: TLabel
          Left = 3
          Top = 2
          Width = 497
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'Imprimir Figura'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object BtnImprimirFigura: TBitBtn
          Left = 180
          Top = 31
          Width = 145
          Height = 25
          Cursor = crHandPoint
          Caption = 'Imprimir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object GBInformacoes: TGroupBox
        Left = 3
        Top = 9
        Width = 507
        Height = 72
        Caption = 'Informa'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label2: TLabel
          Left = 32
          Top = 34
          Width = 59
          Height = 13
          Caption = 'Impressoras:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object CBImpressoras: TComboBox
          Left = 109
          Top = 30
          Width = 356
          Height = 21
          Cursor = crHandPoint
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = CBImpressorasChange
          Items.Strings = (
            'A'
            'B'
            'D')
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Impress'#227'o de BitMap'
      ImageIndex = 3
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label7: TLabel
        Left = 8
        Top = 16
        Width = 97
        Height = 13
        Caption = 'Nome do arquivo'
      end
      object Label8: TLabel
        Left = 328
        Top = 24
        Width = 86
        Height = 13
        Caption = 'Bitola do papel'
      end
      object Label12: TLabel
        Left = 360
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Algor'#237'tmo'
      end
      object BmpImage: TImage
        Left = 8
        Top = 136
        Width = 321
        Height = 209
        Stretch = True
      end
      object FileName: TEdit
        Left = 120
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object findFileBtn: TButton
        Left = 256
        Top = 8
        Width = 41
        Height = 25
        Caption = '...'
        TabOrder = 1
        OnClick = findFileBtnClick
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 40
        Width = 249
        Height = 73
        Caption = 'Orienta'#231#227'o do papel'
        TabOrder = 2
        object RadioButtonRetrato: TRadioButton
          Left = 8
          Top = 24
          Width = 113
          Height = 17
          Caption = 'Retrato'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButtonPaisagem: TRadioButton
          Left = 8
          Top = 48
          Width = 113
          Height = 17
          Caption = 'Paisagem'
          TabOrder = 1
        end
        object PrintNormal: TButton
          Left = 152
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 2
          OnClick = PrintNormalClick
        end
      end
      object ComboBoxBitola: TComboBox
        Left = 424
        Top = 16
        Width = 81
        Height = 21
        TabOrder = 3
        OnChange = ComboBoxBitolaChange
        Items.Strings = (
          '48 mm'
          '58 mm'
          '76 mm'
          '80 mm'
          '112 mm')
      end
      object ComboBoxAlgo: TComboBox
        Left = 424
        Top = 48
        Width = 81
        Height = 21
        TabOrder = 4
        OnChange = ComboBoxAlgoChange
        Items.Strings = (
          'Bayer'
          'Floyd')
      end
      object GroupBoxTransform: TGroupBox
        Left = 344
        Top = 96
        Width = 193
        Height = 249
        Caption = 'Redimensionar'
        TabOrder = 5
        object Label13: TLabel
          Left = 8
          Top = 24
          Width = 34
          Height = 13
          Caption = 'Altura'
        end
        object Label14: TLabel
          Left = 8
          Top = 56
          Width = 44
          Height = 13
          Caption = 'Largura'
        end
        object Label16: TLabel
          Left = 144
          Top = 24
          Width = 30
          Height = 37
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object HeighEdit: TEdit
          Left = 72
          Top = 16
          Width = 57
          Height = 21
          TabOrder = 0
          OnKeyPress = HeighEditKeyPress
        end
        object WidthEdit: TEdit
          Left = 72
          Top = 48
          Width = 57
          Height = 21
          TabOrder = 1
          OnKeyPress = HeighEditKeyPress
        end
        object CheckBoxFitOnPage: TCheckBox
          Left = 8
          Top = 88
          Width = 177
          Height = 17
          Caption = 'Ajusta na largura do papel'
          TabOrder = 2
          OnClick = CheckBoxFitOnPageClick
        end
        object GroupBox10: TGroupBox
          Left = 16
          Top = 120
          Width = 153
          Height = 57
          Caption = 'Girar'
          TabOrder = 3
          object Label15: TLabel
            Left = 8
            Top = 24
            Width = 34
            Height = 13
            Caption = 'Graus'
          end
          object Degrees: TEdit
            Left = 64
            Top = 16
            Width = 65
            Height = 21
            TabOrder = 0
            OnKeyPress = HeighEditKeyPress
          end
        end
        object PrintSpecialBtn: TButton
          Left = 64
          Top = 208
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 4
          OnClick = PrintSpecialBtnClick
        end
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 552
    Top = 79
  end
  object imgIcones: TImageList
    Left = 560
    Top = 152
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000080000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000FFFF0000FFFF0000FFFF0000FFFF00008000000080
      0000008000000080000000800000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      000000FFFF0000FFFF00FF000000FF000000FF00000000FFFF0000FFFF0000FF
      FF0000800000008000000080000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000FFFF0000FFFF0000FF
      FF0000FFFF00FF000000FF000000FFFFFF00FF000000FF00000000FFFF0000FF
      FF0000FFFF0000FFFF0000800000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000FFFF0000FFFF0000FF
      FF0000FFFF00FF000000FF000000FF000000FFFFFF00FF00000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000000080000000FFFF0000FF
      FF0000FFFF0000FFFF00FF000000FF000000FFFFFF00FF00000000FFFF0000FF
      FF0000FFFF00008000000080000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      00000080000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080
      000000800000008000000080000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      000000800000008000000080000000FFFF000080000000800000008000000080
      000000800000008000000080000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000080000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialogFind: TOpenDialog
    Filter = '(bitmap images)|*.bmp|(prn)|*.prn'
    Left = 556
    Top = 186
  end
end
