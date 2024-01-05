object frmCadEnvioEmail: TfrmCadEnvioEmail
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Configura'#231#227'o de Envio de E-Mail'
  ClientHeight = 312
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcConfig: TcxPageControl
    Left = 0
    Top = 0
    Width = 719
    Height = 235
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabTextoPadrao
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OnChange = pgcConfigChange
    ClientRectBottom = 235
    ClientRectRight = 719
    ClientRectTop = 24
    object tabConexao: TcxTabSheet
      Caption = 'Configura'#231#227'o de Conex'#227'o'
      ImageIndex = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 719
        Height = 211
        Align = alClient
        BevelOuter = bvLowered
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object cxLabel3: TcxLabel
          Left = 11
          Top = 26
          Caption = 'Host SMTP'
          Style.TextColor = 4210688
        end
        object cxLabel1: TcxLabel
          Left = 11
          Top = 74
          Caption = 'Usu'#225'rio'
          Style.TextColor = 4210688
        end
        object cxLabel2: TcxLabel
          Left = 11
          Top = 122
          Caption = 'Senha'
          Style.TextColor = 4210688
        end
        object cxLabel5: TcxLabel
          Left = 363
          Top = 74
          Caption = 'E-Mail de envio padr'#227'o'
          Style.TextColor = 4210688
        end
        object cxLabel6: TcxLabel
          Left = 363
          Top = 122
          Caption = 'Assunto Padr'#227'o'
          Style.TextColor = 4210688
        end
        object chxAutenticar: TcxDBCheckBox
          Left = 360
          Top = 4
          RepositoryItem = dtmLookup.Check_SimNao
          Caption = 'Autenticar Servidor'
          DataBinding.DataField = 'AUTENTICAR_SERVIDOR'
          DataBinding.DataSource = SourceAncestral
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.DisplayGrayed = 'N'
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          TabOrder = 5
          OnClick = chxAutenticarClick
          Width = 121
        end
        object chxEmailPadrao: TcxDBCheckBox
          Left = 480
          Top = 4
          RepositoryItem = dtmLookup.Check_SimNao
          Caption = 'Email Padr'#227'o Usu'#225'rio'
          DataBinding.DataField = 'USAR_EMAIL_USUARIO'
          DataBinding.DataSource = SourceAncestral
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.DisplayGrayed = 'N'
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          TabOrder = 6
          OnClick = chxEmailPadraoClick
          Width = 137
        end
        object cxLabel4: TcxLabel
          Left = 363
          Top = 26
          Caption = 'Porta:'
          Style.TextColor = 4210688
        end
        object edtHostSMTP: TcxDBTextEdit
          Left = 12
          Top = 44
          DataBinding.DataField = 'HOST_SMTP'
          DataBinding.DataSource = SourceAncestral
          TabOrder = 8
          Width = 345
        end
        object edtUsuario: TcxDBTextEdit
          Left = 12
          Top = 92
          DataBinding.DataField = 'USER_NAME'
          DataBinding.DataSource = SourceAncestral
          TabOrder = 9
          Width = 345
        end
        object edtSenha: TcxDBTextEdit
          Left = 12
          Top = 140
          DataBinding.DataField = 'PASSWORD'
          DataBinding.DataSource = SourceAncestral
          Properties.EchoMode = eemPassword
          TabOrder = 10
          Width = 345
        end
        object edtPorta: TcxDBTextEdit
          Left = 364
          Top = 44
          DataBinding.DataField = 'PORTA'
          DataBinding.DataSource = SourceAncestral
          StyleDisabled.BorderStyle = ebsFlat
          StyleDisabled.Color = clSilver
          TabOrder = 11
          Width = 53
        end
        object edtEmailPadrao: TcxDBTextEdit
          Left = 364
          Top = 92
          DataBinding.DataField = 'EMAIL_PADRAO'
          DataBinding.DataSource = SourceAncestral
          StyleDisabled.BorderStyle = ebsFlat
          StyleDisabled.Color = clSilver
          TabOrder = 12
          Width = 345
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 364
          Top = 140
          DataBinding.DataField = 'ASSUNTO_PADRAO'
          DataBinding.DataSource = SourceAncestral
          TabOrder = 13
          Width = 345
        end
      end
    end
    object tabTextoPadrao: TcxTabSheet
      Caption = 'Texto Padr'#227'o'
      Color = clBtnFace
      ImageIndex = 1
      ParentColor = False
      object Panel3: TPanel
        Left = 0
        Top = 49
        Width = 719
        Height = 162
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object memTextoPadrao: TRichEdit
          Left = 0
          Top = 0
          Width = 719
          Height = 162
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          Zoom = 100
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 719
        Height = 49
        Align = alTop
        TabOrder = 1
        object cxLabel14: TcxLabel
          Left = 8
          Top = 4
          Caption = 'Assunto/Texto Modelo Padr'#227'o'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
          Transparent = True
        end
        object lcxEmailTextoPadrao: TcxLookupComboBox
          Left = 8
          Top = 23
          RepositoryItem = dtmLookup.Lista_EmailTextoPadrao
          ParentFont = False
          Properties.ListColumns = <>
          Properties.OnChange = lcxEmailTextoPadraoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleFocused.BorderColor = clRed
          TabOrder = 1
          Width = 366
        end
      end
    end
    object tabRodape: TcxTabSheet
      Caption = 'Texto Rodap'#233' (Assinatura Padr'#227'o)'
      ImageIndex = 2
      object memTextoRodape: TMemo
        Left = 0
        Top = 0
        Width = 719
        Height = 182
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 182
        Width = 719
        Height = 29
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 1
        object cxLabel7: TcxLabel
          Left = 7
          Top = 6
          Caption = 'Linhas de Espa'#231'amento do Texto:'
          Style.TextColor = 4210688
        end
        object chxAssinaturaUsuario: TcxDBCheckBox
          Left = 228
          Top = 4
          RepositoryItem = dtmLookup.Check_SimNao
          Caption = 'Adicionar Assinatura/Fun'#231#227'o do Usu'#225'rio Logado'
          DataBinding.DataField = 'ADICIONAR_ASSINATURA_USUARIO'
          DataBinding.DataSource = SourceAncestral
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.DisplayGrayed = 'N'
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          TabOrder = 1
          OnClick = chxAutenticarClick
          Width = 257
        end
        object edtLinhas: TcxSpinEdit
          Left = 176
          Top = 4
          TabOrder = 2
          Width = 45
        end
      end
      object cxRichEdit1: TcxRichEdit
        Left = 516
        Top = 28
        Lines.Strings = (
          'cxRichEdit1')
        TabOrder = 2
        Visible = False
        Height = 89
        Width = 185
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Proxy'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 719
        Height = 211
        Align = alClient
        BevelOuter = bvLowered
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object cxGroupBox1: TcxGroupBox
          Left = 12
          Top = 6
          Caption = 'Proxy'
          TabOrder = 0
          Height = 163
          Width = 697
          object cxLabel9: TcxLabel
            Left = 11
            Top = 38
            Caption = 'Methodo de Autentica'#231#227'o'
            Style.TextColor = 4210688
          end
          object cxLabel10: TcxLabel
            Left = 155
            Top = 38
            Caption = 'HostName'
            Style.TextColor = 4210688
          end
          object cxLabel11: TcxLabel
            Left = 274
            Top = 38
            Caption = 'Porta'
            Style.TextColor = 4210688
          end
          object cxLabel12: TcxLabel
            Left = 387
            Top = 38
            Caption = 'Usuario'
            Style.TextColor = 4210688
          end
          object cxLabel13: TcxLabel
            Left = 503
            Top = 38
            Caption = 'Senha'
            Style.TextColor = 4210688
          end
          object icxProxyMetodo: TcxImageComboBox
            Left = 12
            Top = 56
            EditValue = 'LOGIN'
            Properties.Items = <
              item
                Description = 'LOGIN'
                ImageIndex = 0
                Value = 'LOGIN'
              end
              item
                Description = 'NTLM'
                Value = 'NTLM'
              end>
            TabOrder = 5
            Width = 137
          end
          object edtProxyHostName: TcxTextEdit
            Left = 156
            Top = 56
            TabOrder = 6
            Text = '10.21.1.215'
            Width = 109
          end
          object edtProxyPorta: TcxTextEdit
            Left = 272
            Top = 56
            TabOrder = 7
            Text = '8080'
            Width = 109
          end
          object edtProxyUsuario: TcxTextEdit
            Left = 388
            Top = 56
            TabOrder = 8
            Text = 'celg\p24601'
            Width = 109
          end
          object edtProxyHostSenha: TcxTextEdit
            Left = 504
            Top = 56
            TabOrder = 9
            Text = '0127'
            Width = 109
          end
          object chxUsarProxy: TcxCheckBox
            Left = 8
            Top = 16
            Caption = 'Usar Proxy'
            TabOrder = 10
            Width = 89
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 235
    Width = 719
    Height = 77
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 14807280
    ParentBackground = False
    TabOrder = 1
    object pnlEnvio: TPanel
      Left = 1
      Top = 1
      Width = 380
      Height = 75
      Align = alLeft
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object cxLabel8: TcxLabel
        Left = 15
        Top = 5
        Caption = 'Assunto:'
        Style.TextColor = 4210688
      end
      object chxCC: TcxCheckBox
        Left = 12
        Top = 28
        Caption = 'Enviar Cc...'
        TabOrder = 1
        OnClick = chxCCClick
        Width = 81
      end
      object rdbArquivoRTF: TcxRadioButton
        Left = 202
        Top = 54
        Width = 97
        Height = 17
        Caption = 'Arquivo em RTF'
        Enabled = False
        TabOrder = 2
        Visible = False
      end
      object edtAssuntoEmail: TcxTextEdit
        Left = 96
        Top = 5
        Style.BorderStyle = ebsOffice11
        Style.Color = clWindow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.Color = clSilver
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 277
      end
      object edtCC: TcxTextEdit
        Left = 96
        Top = 28
        Enabled = False
        Style.BorderStyle = ebsOffice11
        Style.Color = clWindow
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.Color = clSilver
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 277
      end
      object rdbArquivoPDF: TcxRadioButton
        Left = 98
        Top = 54
        Width = 97
        Height = 17
        Caption = 'Arquivo em PDF'
        Checked = True
        TabOrder = 5
        TabStop = True
      end
    end
    object lblEnviando: TcxLabel
      Left = 386
      Top = 32
      AutoSize = False
      Caption = 'AGUARDE,  enviando email...'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -9
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Visible = False
      Height = 21
      Width = 324
      AnchorX = 548
      AnchorY = 43
    end
    object cxProgress: TcxProgressBar
      Left = 386
      Top = 52
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 2
      Visible = False
      Width = 324
    end
    object btnEnviar: TcxButton
      Left = 384
      Top = 6
      Width = 104
      Height = 22
      Caption = '&Enviar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000989898E0E0E0
        2C2C2C0303031111111111111111111111111111111111111111111111111111
        111111111111111111110303032C2C2CE0E0E0989898000000747474D1D1D10A
        0A0A000000000000000000000000000000000000000000000000000000000000
        000000000000090909D0D0D07575750000000808080000007E7E7ED1D1D11B1B
        1B0000000000000000000000000000000000000000000000000000000000001B
        1B1BD0D0D07F7F7F000000080808121212000000000000737373C2C2C2161616
        000000000000000000000000000000000000000000000000161616C2C2C27373
        73000000000000121212111111000000000000000000676767B7B7B716161600
        0000000000000000000000000000000000161616B7B7B7676767000000000000
        000000111111111111000000000000000000000000575757A3A3A31616160000
        00000000000000000000161616A3A3A357575700000000000000000000000011
        11111111110000000000000000000000000000004E4E4E7E7E7E000000000000
        0000000000007E7E7E4E4E4E0000000000000000000000000000001111111111
        11000000000000000000000000000000000000858585B2B2B2000000000000B1
        B1B1858585000000000000000000000000000000000000111111111111000000
        0000000000000000000000006B6B6BF4F4F4FFFFFF838383838383FFFFFFF4F4
        F46B6B6B00000000000000000000000000000011111111111100000000000000
        0000050505959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9595950505050000000000000000001111111313130000000000001B1B1BBEBE
        BEFFFFFFFFFFFFFFFFFF9A9A9A8989898989899A9A9AFFFFFFFFFFFFFFFFFFBE
        BEBE1B1B1B0000000000001313130808080000004B4B4BF5F5F5FFFFFFFFFFFF
        FFFFFFFFFFFFC1C1C1BCBCBCBCBCBCC1C1C1FFFFFFFFFFFFFFFFFFFFFFFFF5F5
        F54B4B4B000000080808000000646464FFFFFFEFEFEF7A7A7A7A7A7A7A7A7ABF
        BFBFBDBDBD999999999999BDBDBDBFBFBF7A7A7A7A7A7A7A7A7AEFEFEFFFFFFF
        656565000000B8B8B8FFFFFFFFFFFFF1F1F1C9C9C9C9C9C9C9C9C9E5E5E5D9D9
        D9C9C9C9C9C9C9D9D9D9E5E5E5C9C9C9C9C9C9C9C9C9F1F1F1FFFFFFFFFFFFB8
        B8B8CCCCCC646464FFFFFFE3E3E3858585858585858585C5C5C5AAAAAA858585
        858585AAAAAAC5C5C5858585858585858585E3E3E3FFFFFF646464CCCCCC7C7C
        7C000000FFFFFFF4F4F4CDCDCDCDCDCDCDCDCDE7E7E7DDDDDDCDCDCDCDCDCDDD
        DDDDE7E7E7CDCDCDCDCDCDCDCDCDF4F4F4FFFFFF0000007C7C7C8C8C8C010101
        FFFFFFDFDFDF747474747474747474BCBCBC9E9E9E7474747474749E9E9EBCBC
        BC747474747474747474DFDFDFFFFFFF0101018C8C8C898989010101FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0101018989898D8D8D000000B2B2B2B3B3B3B7B7
        B7B7B7B7B7B7B7B4B4B4B5B5B5B7B7B7B7B7B7B5B5B5B4B4B4B7B7B7B7B7B7B7
        B7B7B3B3B3B2B2B20000008D8D8DAAAAAA111111000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000111111AAAAAA}
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEnviarClick
    end
    object btnConfirmar: TcxButton
      Left = 494
      Top = 6
      Width = 104
      Height = 22
      Caption = '&Confirmar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE7E8E7D0D2D1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEEEEEE8E8F8E515452B9BBBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
        AAABAA3D3E3D232423565756E5E7E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECD4A4C4A27
        2827292B29282928848785F7F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E5E35253522929292F2F2F2E2E
        2E2E2E2E353635A1A2A1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEBECEB797B792A2B2A2F302F2D2D2D2E2E2E303130
        2C2E2C4F514FC3C4C3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF0F1F0979897393A392F302F3334335252524546452F312F31323133
        3433707270DEDFDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9F9
        B3B5B34B4C4B323332333433747574CECFCEB6B7B6484948323232323332393B
        39919391F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDCED0CF5A5C5A34
        35342D2E2D7C7D7CEAEAEAFEFEFEFAFAFABFBFBF343534333533353535444544
        B9BABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E8E76D6E6D3233323A3A3A8D8D
        8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC4546453536353536354F5250DD
        DFDEFFFFFFFFFFFFFFFFFFFFFFFFA6A8A63B3D3B4547459A9A9AF4F4F4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8ACACAC494A493839383636367A7C7BECED
        ECFFFFFFFFFFFFFFFFFF5A5C5B545554ADADADF2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF3F3F3A7A7A7494A49393A39444544A1A2A2F4F5F5
        FFFFFFFFFFFFB9B9B9CCCCCCF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF2F2F2A2A3A23F403F3D3D3D595B5AC2C3C3FCFCFCFF
        FFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF6F6F6A1A2A1343634404140737573E0E0E0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9999994041404142418C8F8CEFF0EFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF3F3F39797974647464C4D4CBABABAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFECECEC9494944647465C5E5CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFECECEC9C9C9C7E7F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF5F5F5EFF0EF}
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object cxButton1: TcxButton
      Left = 604
      Top = 6
      Width = 104
      Height = 22
      Caption = '&Cancelar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000130B0000130B00000001000000000000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
        D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
        D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
        E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
        E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
        F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFDE7
        B55F180101185FB5E7FDFFFFFFFFFFFFFFF4BB56160209131309021656BBF4FF
        FFFFFFFFEE93290A2859829A9A825823092993EEFFFFFFF49420081275E4F8FE
        FEF8E3B854092094F4FFFEBD2A0B0B0D35B7FEFFFFFFFFFDE9550B2BBEFEE95E
        1118100E0E2CAEF9FFFFFFFFFFE8550F5EE9BB212F783A10101031AFFEFFFFFF
        FFFDB82A21BB691363E5BA3112121230BAFEFFFFFFFFE561126A2B1D8CF9FEB1
        351515153FB5FEFFFFFFF88A1C2B1B29A3FFFFF9B23619191B41BBFEFFFFFEA2
        291B1C2AA4FFFFFFFEBB421D1B1B39B4F9FFFEA32A1C332591F9FFFFFFFDB746
        1E1E1E3EB5FEF98E253372206BE6FFFFFFFFFEBD3C2020203DBDE76C2173BF32
        3BC0FEFFFFFFFFFEB54022222248823E32C0EB6D2765EBFFFFFFFFFFF9B54025
        25272D276DEBFEC5442969EBFDFFFFFFFFFEBF4D2A282944C5FEFFF5A33F2B6C
        C2E8F9FFFEF9E888332B3FA3F5FFFFFFF1A3492F467396ABAB96734A304AA3F1
        FFFFFFFFFFF5C6733F2F353E3E352F3F73C6F5FFFFFFFFFFFFFFFDECC47E4534
        34447CC3ECFDFFFFFFFF}
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object DataSetAncestral: TI9Query
    MasterSource = SourceAncestral
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_EMAIL_CONFIG')
    Left = 579
    Top = 155
  end
  object ProviderAncestral: TDataSetProvider
    DataSet = DataSetAncestral
    Left = 611
    Top = 155
  end
  object ClientAncestral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderAncestral'
    Left = 643
    Top = 155
    object ClientAncestralEMAIL_CONFIG_ID: TBCDField
      FieldName = 'EMAIL_CONFIG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralTEXTO_EMAIL: TBlobField
      FieldName = 'TEXTO_EMAIL'
    end
    object ClientAncestralHOST_SMTP: TStringField
      FieldName = 'HOST_SMTP'
      Size = 90
    end
    object ClientAncestralHOST_POP3: TStringField
      FieldName = 'HOST_POP3'
      Size = 90
    end
    object ClientAncestralUSER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 90
    end
    object ClientAncestralPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 15
    end
    object ClientAncestralAUTENTICAR_SERVIDOR: TStringField
      FieldName = 'AUTENTICAR_SERVIDOR'
      Size = 1
    end
    object ClientAncestralASSUNTO_PADRAO: TStringField
      FieldName = 'ASSUNTO_PADRAO'
      Size = 90
    end
    object ClientAncestralEMAIL_PADRAO: TStringField
      FieldName = 'EMAIL_PADRAO'
      Size = 90
    end
    object ClientAncestralUSAR_EMAIL_USUARIO: TStringField
      FieldName = 'USAR_EMAIL_USUARIO'
      Size = 1
    end
    object ClientAncestralTEXTO_RODAPE: TBlobField
      FieldName = 'TEXTO_RODAPE'
    end
    object ClientAncestralESPACO_TEXTO_RODAPE: TBCDField
      FieldName = 'ESPACO_TEXTO_RODAPE'
      Precision = 20
      Size = 2
    end
    object ClientAncestralADICIONAR_ASSINATURA_USUARIO: TStringField
      FieldName = 'ADICIONAR_ASSINATURA_USUARIO'
      Size = 1
    end
    object ClientAncestralPORTA: TStringField
      FieldName = 'PORTA'
      Size = 3
    end
  end
  object SourceAncestral: TDataSource
    DataSet = ClientAncestral
    Left = 675
    Top = 155
  end
end
