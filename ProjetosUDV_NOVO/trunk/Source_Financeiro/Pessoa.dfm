inherited frmCadPessoa: TfrmCadPessoa
  Caption = 'Cadastro Pessoa'
  ClientHeight = 560
  ClientWidth = 644
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 660
  Constraints.MinWidth = 660
  ExplicitWidth = 660
  ExplicitHeight = 599
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 644
    ExplicitWidth = 644
    inherited PanelBotoesBasicos: TPanel
      Width = 502
      Color = clWindow
      ExplicitWidth = 502
    end
    inherited PanelBotaoFechar: TPanel
      Left = 504
      Width = 138
      Color = clWindow
      ExplicitLeft = 504
      ExplicitWidth = 138
      inherited cxBtnFechar: TcxButton
        Left = 74
        ExplicitLeft = 74
      end
      object btnSelecionar: TcxButton
        Left = 10
        Top = 4
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Hint = 'Fechar (Esc)'
        Caption = 'Selecionar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B0000000100000000000000000000D5D5
          D5007C7C7C0033333300ABABAB001717170052525200FFFFFF0011111100C6C6
          C60020202000999999006B6B6B000C0C0C0043434300909090002A2A2A00E8E8
          E8001616160008080800A5A5A5001C1C1C003E3E3E00B6B6B6005A5A5A008686
          8600D1D1D10014141400060606004A4A4A003C3C3C00B3B3B3003A3A3A002525
          2500303030000E0E0E006E6E6E00616161001E1E1E0004040400D9D9D9004646
          460080808000959595002E2E2E00BBBBBB008A8A8A0000000000222222004040
          40009999990027272700C9C9C9006C6C6C00939393002C2C2C004C4C4C007171
          7100000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000070707070707
          070711351300002706340707070707070707070707092C272727272727051407
          07070707070707071A0D1C1C1C1C1C1C1C1C131F07070707070707071E131313
          1313131313131321070707070707071A0D0D0D0D0D0D0D0D0D0D0D0D07070707
          07070717232323232323232323232323070707070707072D0808080808080808
          0808080807070707070707041B1B1B1B1B1B1B1B1B1B1B1B0707070707070719
          0505050505050505050505050707070707070716050505050505050505050505
          0707070707071F15150322151515151515200E0C070707070728200A0A141D0A
          0A0A0A390601070707070707072530302407160A022E0B070707070707070707
          071A182A070716210B0707070707070707070707070707070707313336070707
          07070707070707070707070707070E102B070707070707070707070707070707
          0707292C2B070707070707070707070707070707070738220B07070707070707
          070707070707070707070F310107070707070707070707070707070707070707
          07070707070707070707}
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnSelecionarClick
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 540
    Width = 644
    ExplicitTop = 540
    ExplicitWidth = 644
  end
  inherited PanelGeral: TPanel
    Width = 644
    Height = 484
    ExplicitWidth = 644
    ExplicitHeight = 484
    inherited PanelData: TPanel
      Width = 642
      Height = 482
      Align = alClient
      Color = clWhite
      ExplicitWidth = 642
      ExplicitHeight = 482
      object pgcDados: TcxPageControl
        Left = 1
        Top = 1
        Width = 640
        Height = 480
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Properties.ActivePage = tabIdentificacao
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2007Silver'
        ClientRectBottom = 480
        ClientRectRight = 640
        ClientRectTop = 24
        object tabIdentificacao: TcxTabSheet
          Caption = 'Identifica'#231#227'o'
          ImageIndex = 0
          object pnlIdentificacao: TPanel
            Left = 0
            Top = 0
            Width = 640
            Height = 456
            Align = alClient
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object pgcDadosPessoa: TcxPageControl
              Left = 0
              Top = 150
              Width = 640
              Height = 75
              Align = alTop
              TabOrder = 2
              Properties.ActivePage = tabPessoaFisica
              Properties.CustomButtons.Buttons = <>
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              ClientRectBottom = 75
              ClientRectRight = 640
              ClientRectTop = 24
              object tabPessoaFisica: TcxTabSheet
                Caption = 'Pessoa F'#237'sica'
                ImageIndex = 0
                ParentColor = False
                object cxLabel3: TcxLabel
                  Left = 6
                  Top = 6
                  Caption = 'Tipo Documento'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object cxLabel5: TcxLabel
                  Left = 167
                  Top = 6
                  Caption = 'Documento'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object lcxTipoDocumento: TcxDBLookupComboBox
                  Left = 9
                  Top = 25
                  DataBinding.DataField = 'TIPO_DOCUMENTO_ID'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Properties.ListColumns = <>
                  Properties.OnChange = lcxxTipoDocumentoPropertiesChange
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 2
                  OnDblClick = lcxTipoDocumentoDblClick
                  OnEnter = lcxTipoDocumentoEnter
                  OnExit = lcxTipoDocumentoExit
                  Width = 152
                end
                object edtDocumento: TcxDBTextEdit
                  Left = 167
                  Top = 25
                  DataBinding.DataField = 'DOCUMENTO'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 3
                  Width = 256
                end
              end
              object tabPessoaJuridica: TcxTabSheet
                Caption = 'Pessoa Jur'#237'dica'
                ImageIndex = 1
                object cxLabel6: TcxLabel
                  Left = 8
                  Top = 3
                  Caption = 'Nome Fantasia'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object cxLabel24: TcxLabel
                  Left = 399
                  Top = 3
                  Caption = 'Inscri'#231#227'o Estadual'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object edtEmpresa: TcxDBTextEdit
                  Left = 10
                  Top = 21
                  DataBinding.DataField = 'EMPRESA'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 2
                  Width = 383
                end
                object cxDBTextEdit4: TcxDBTextEdit
                  Left = 399
                  Top = 21
                  DataBinding.DataField = 'DOCUMENTO'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 3
                  Width = 221
                end
              end
            end
            object cxGroupBox3: TcxGroupBox
              Left = 0
              Top = 225
              Align = alTop
              Caption = ' Endere'#231'o'
              Style.BorderStyle = ebsOffice11
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Office2007Black'
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold, fsUnderline]
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Office2007Black'
              TabOrder = 3
              Height = 109
              Width = 640
              object cxLabel13: TcxLabel
                Left = 399
                Top = 59
                Caption = 'Cep'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel14: TcxLabel
                Left = 399
                Top = 17
                Caption = 'Bairro'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel15: TcxLabel
                Left = 9
                Top = 17
                Caption = 'Logradouro'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel16: TcxLabel
                Left = 9
                Top = 59
                Caption = 
                  'UF                  Cidade                                      ' +
                  '    '
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Transparent = True
              end
              object edtLogradouro: TcxDBTextEdit
                Left = 10
                Top = 35
                DataBinding.DataField = 'ENDERECO_LOGRADOURO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 4
                Width = 383
              end
              object edtBairro: TcxDBTextEdit
                Left = 399
                Top = 35
                DataBinding.DataField = 'ENDERECO_BAIRRO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 5
                Width = 222
              end
              object cbxsCidadeUF: TcxDBComboBox
                Left = 8
                Top = 77
                RepositoryItem = dtmLookup.Combo_UF
                DataBinding.DataField = 'ENDERECO_CIDADE_UF'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.OnEditValueChanged = cxDBComboBox1PropertiesEditValueChanged
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 6
                Width = 62
              end
              object lcxCidade: TcxDBLookupComboBox
                Left = 76
                Top = 77
                DataBinding.DataField = 'ENDERECO_CIDADE_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.KeyFieldNames = 'MUNICIPIO_ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'MUNICIPIO'
                  end>
                Properties.ListSource = dtsCidadeEndereco
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 7
                Width = 317
              end
              object edtCep: TcxDBMaskEdit
                Left = 399
                Top = 77
                DataBinding.DataField = 'ENDERECO_CEP'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.AlwaysShowBlanksAndLiterals = True
                Properties.EditMask = '99\.999\-999;0;_'
                Properties.MaxLength = 0
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 8
                OnExit = edtCepExit
                Width = 222
              end
            end
            object cxGroupBox1: TcxGroupBox
              Left = 0
              Top = 334
              Align = alClient
              Caption = ' Contato'
              Style.BorderStyle = ebsSingle
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Office2007Black'
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold, fsUnderline]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Office2007Black'
              TabOrder = 4
              Height = 122
              Width = 640
              object chxListContatos: TcxCheckListBox
                Left = 297
                Top = 18
                Width = 341
                Height = 102
                Align = alClient
                Items = <>
                TabOrder = 0
              end
              object Panel2: TPanel
                Left = 2
                Top = 18
                Width = 295
                Height = 102
                Align = alLeft
                BevelKind = bkFlat
                BevelOuter = bvNone
                Color = clWindow
                ParentBackground = False
                TabOrder = 1
                object cxLabel1: TcxLabel
                  Left = 6
                  Top = 2
                  Caption = 'Tipo'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object cxLabel2: TcxLabel
                  Left = 164
                  Top = 2
                  Caption = 'Operadora'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object cxLabel4: TcxLabel
                  Left = 6
                  Top = 44
                  Caption = 'Descri'#231#227'o (email  e/ou Telefone)'
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object btnAdcionarResponsavel: TcxButton
                  Left = 569
                  Top = 21
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Colors.Default = clBlue
                  Colors.Normal = clBtnFace
                  Colors.Pressed = clGreen
                  Colors.Disabled = clGray
                  OptionsImage.Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000120B0000120B0000000100000000000000000000FFFF
                    FF00FF00FF00BE4E0000B34D0000EF6C0000FD790000DA771C00FF7F0000FA7A
                    0000FA7D0000FB810700FF850000FB810000FB830000FD850500FA932100FF8C
                    0000FE870000FD870000FD890100FF8D0200FF8F0000F0901300FFA12600FEA5
                    3400E2993D00E5A04300FF940000FF990200FF9E0C00FF9C1200FFA01A00EEA1
                    3100FFAD3900FF9B0200FF9C0300FFA00D00FFA51500FFA51600FFA71600FFA8
                    1900FFA81B00FFA91D00FFAB1F00FFAD1B00FFAF1E00FFAC2000FFAD2200FFAE
                    2300FFAE2400FFB22500FFAF2700FFB12A00FFB32C00FEBA4200FFBC4000FFC1
                    4D00FFC35400FEC55B00FFCA6200FFCD6800FBCF7900FFC95900FFD57D00FFD8
                    7F00FFD782000000000000000000000000000000000000000000000000000000
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
                    0000000000000000000000000000000000000000000000000000020202020202
                    04040404020202020202020202020204070B0605040202020202020202020204
                    190F090604020202020202020202020422140D08040202020202020202020204
                    1F15130C040202020202020404040417241C1612030404040402042136332E28
                    251D1C16120C08060504043B36312F2A2625231C16130E0A0604043E3832302C
                    2A271E231C11130D0804041A413F3938352B27251D232018100402040404041B
                    3A2F29262504040404020202020202043C322F2D040202020202020202020204
                    3D34313104020202020202020202020440383233040202020202020202020204
                    1A423F3704020202020202020202020204040404020202020202}
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 7
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnExcluirResponsavel: TcxButton
                  Left = 599
                  Top = 21
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Colors.Default = clBlue
                  Colors.Normal = clBtnFace
                  Colors.Pressed = clGreen
                  Colors.Disabled = clGray
                  OptionsImage.Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000120B0000120B0000000100000000000000000000FFFF
                    FF00FF00FF00FDFCFA00F9F7F100E8E6DF00E1DED200F4F2E800FEFDF800E8E6
                    DA00FFFFF900FFFFFB00134DFE001F52E9002B5EF9001046FE001648F6001845
                    EC001D4FF5000934EC000B35EB000C3BF3001241F200123EED000329E600052D
                    E900052CE6000830E8000A31F300092EE5000022E5000023E0000020DF000126
                    E5000120D9000223DF000526DB00566BDA008893CC0096A1DF00001BDE00011B
                    C5000421EF000421E0000723D4000925DB00A0A9E4000014D5000013C0000012
                    BD00031BE500515ECB00000FB8000010B800000DB4000210BD000314C3000313
                    B8000413C3000A1AC500000CDB00000AC400000DC400000DC000000BBD00000D
                    BB000009B900000AB5000009B1000008A9000410BE000913B5000007C8000006
                    B3000007AE0000059B00000494000000AB0000017100FAFAFA00000000000000
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
                    000000000000000000000000000000000000000000000000000002020202024E
                    4E4E4E4E4E02020202020202024E4E44424249454B4E4E02020202024E40483D
                    303135364D4D4C4E0202024E3E2C2525293F41393333474C4E02024E3C330701
                    2E3837270A01334D4E024E2F28330903012E270B010A334D4B4E4E321F2D2605
                    4F0101010B2747434A4E4E2A182022260401010127464134494E4E1C191E2B27
                    080101012E3A3F31424E4E16131D270A010A044F012E3B30424E4E1115250701
                    0A2726050301253D444E024E0F25060727232226090725484E02024E0D0E2525
                    1B21202433332C404E0202024E0D0C1017141A1F283C3E4E02020202024E4E0D
                    12161C322F4E4E02020202020202024E4E4E4E4E4E0202020202}
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 8
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object icxTipoContato: TcxImageComboBox
                  Left = 6
                  Top = 20
                  ParentFont = False
                  Properties.Images = dtmControles.imgCadBasicos
                  Properties.Items = <
                    item
                      Description = 'email principal'
                      ImageIndex = 50
                      Value = 'email principal'
                    end
                    item
                      Description = 'email secud'#225'rio'
                      ImageIndex = 51
                      Value = 'email secund'#225'rio'
                    end
                    item
                      Description = 'Telefone Residencial'
                      ImageIndex = 52
                      Value = '(res)'
                    end
                    item
                      Description = 'Telefone Comercial'
                      ImageIndex = 52
                      Value = '(com)'
                    end
                    item
                      Description = 'Telefone Celular'
                      ImageIndex = 52
                      Value = '(cel)'
                    end>
                  Properties.OnEditValueChanged = icxTipoContatoPropertiesEditValueChanged
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 0
                  Width = 152
                end
                object icxOperadora: TcxImageComboBox
                  Left = 164
                  Top = 20
                  ParentFont = False
                  Properties.Items = <
                    item
                      Description = 'CLARO'
                      Value = '{c}'
                    end
                    item
                      Description = 'OI'
                      Value = '{o}'
                    end
                    item
                      Description = 'TIM'
                      Value = '{t}'
                    end
                    item
                      Description = 'VIVO'
                      Value = '{v}'
                    end
                    item
                      Description = 'N'#195'O INFORMADO'
                      Value = '-'
                    end>
                  Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                  TabOrder = 1
                  Width = 120
                end
                object edtContatoDescricao: TcxTextEdit
                  Left = 6
                  Top = 62
                  AutoSize = False
                  ParentFont = False
                  Properties.CharCase = ecLowerCase
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 2
                  OnKeyDown = edtContatoDescricaoKeyDown
                  Height = 19
                  Width = 248
                end
                object btnContatoAdicionar: TcxButton
                  Left = 256
                  Top = 60
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Colors.Default = clBlue
                  Colors.Normal = clBtnFace
                  Colors.Pressed = clGreen
                  Colors.Disabled = clGray
                  OptionsImage.Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000120B0000120B0000000100000000000000000000FFFF
                    FF00FF00FF00BE4E0000B34D0000EF6C0000FD790000DA771C00FF7F0000FA7A
                    0000FA7D0000FB810700FF850000FB810000FB830000FD850500FA932100FF8C
                    0000FE870000FD870000FD890100FF8D0200FF8F0000F0901300FFA12600FEA5
                    3400E2993D00E5A04300FF940000FF990200FF9E0C00FF9C1200FFA01A00EEA1
                    3100FFAD3900FF9B0200FF9C0300FFA00D00FFA51500FFA51600FFA71600FFA8
                    1900FFA81B00FFA91D00FFAB1F00FFAD1B00FFAF1E00FFAC2000FFAD2200FFAE
                    2300FFAE2400FFB22500FFAF2700FFB12A00FFB32C00FEBA4200FFBC4000FFC1
                    4D00FFC35400FEC55B00FFCA6200FFCD6800FBCF7900FFC95900FFD57D00FFD8
                    7F00FFD782000000000000000000000000000000000000000000000000000000
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
                    0000000000000000000000000000000000000000000000000000020202020202
                    04040404020202020202020202020204070B0605040202020202020202020204
                    190F090604020202020202020202020422140D08040202020202020202020204
                    1F15130C040202020202020404040417241C1612030404040402042136332E28
                    251D1C16120C08060504043B36312F2A2625231C16130E0A0604043E3832302C
                    2A271E231C11130D0804041A413F3938352B27251D232018100402040404041B
                    3A2F29262504040404020202020202043C322F2D040202020202020202020204
                    3D34313104020202020202020202020440383233040202020202020202020204
                    1A423F3704020202020202020202020204040404020202020202}
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnContatoAdicionarClick
                end
              end
              object btnContatoExcluir: TcxButton
                Left = 600
                Top = 21
                Width = 28
                Height = 23
                Cursor = crHandPoint
                Colors.Default = clBlue
                Colors.Normal = clBtnFace
                Colors.Pressed = clGreen
                Colors.Disabled = clGray
                OptionsImage.Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000120B0000120B0000000100000000000000000000FFFF
                  FF00FF00FF00FDFCFA00F9F7F100E8E6DF00E1DED200F4F2E800FEFDF800E8E6
                  DA00FFFFF900FFFFFB00134DFE001F52E9002B5EF9001046FE001648F6001845
                  EC001D4FF5000934EC000B35EB000C3BF3001241F200123EED000329E600052D
                  E900052CE6000830E8000A31F300092EE5000022E5000023E0000020DF000126
                  E5000120D9000223DF000526DB00566BDA008893CC0096A1DF00001BDE00011B
                  C5000421EF000421E0000723D4000925DB00A0A9E4000014D5000013C0000012
                  BD00031BE500515ECB00000FB8000010B800000DB4000210BD000314C3000313
                  B8000413C3000A1AC500000CDB00000AC400000DC400000DC000000BBD00000D
                  BB000009B900000AB5000009B1000008A9000410BE000913B5000007C8000006
                  B3000007AE0000059B00000494000000AB0000017100FAFAFA00000000000000
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
                  000000000000000000000000000000000000000000000000000002020202024E
                  4E4E4E4E4E02020202020202024E4E44424249454B4E4E02020202024E40483D
                  303135364D4D4C4E0202024E3E2C2525293F41393333474C4E02024E3C330701
                  2E3837270A01334D4E024E2F28330903012E270B010A334D4B4E4E321F2D2605
                  4F0101010B2747434A4E4E2A182022260401010127464134494E4E1C191E2B27
                  080101012E3A3F31424E4E16131D270A010A044F012E3B30424E4E1115250701
                  0A2726050301253D444E024E0F25060727232226090725484E02024E0D0E2525
                  1B21202433332C404E0202024E0D0C1017141A1F283C3E4E02020202024E4E0D
                  12161C322F4E4E02020202020202024E4E4E4E4E4E0202020202}
                SpeedButtonOptions.Flat = True
                SpeedButtonOptions.Transparent = True
                TabOrder = 2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btnContatoExcluirClick
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 640
              Height = 101
              Align = alTop
              BevelInner = bvLowered
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 0
              object cxLabel7: TcxLabel
                Left = 116
                Top = 4
                Caption = 'Nome Completo'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel8: TcxLabel
                Left = 411
                Top = 43
                Caption = 'CPF/CNPJ                                                   '
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Transparent = True
              end
              object lblIdentificacao: TcxLabel
                Left = 9
                Top = 43
                Caption = 'Nome de Identifica'#231#227'o no Sistema'
                Style.TextColor = 4210688
                Transparent = True
              end
              object lbllConcordancia: TcxLabel
                Left = 324
                Top = 43
                Caption = 'Sexo'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel23: TcxLabel
                Left = 9
                Top = 4
                Caption = 'Tipo Pessoa'
                Style.TextColor = 4210688
                Transparent = True
              end
              object icxTipoPessoa: TcxDBImageComboBox
                Left = 9
                Top = 20
                DataBinding.DataField = 'TIPO_PESSOA'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.Items = <
                  item
                    Description = 'Juridica'
                    Value = 'J'
                  end
                  item
                    Description = 'Fisica'
                    ImageIndex = 0
                    Value = 'F'
                  end>
                Properties.OnEditValueChanged = icxTipoPessoaPropertiesEditValueChanged
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 5
                Width = 101
              end
              object edtNome: TcxDBTextEdit
                Left = 116
                Top = 20
                DataBinding.DataField = 'NOME'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                Style.TextStyle = [fsBold, fsUnderline]
                TabOrder = 6
                Width = 507
              end
              object edtIdentificacao: TcxDBTextEdit
                Left = 9
                Top = 60
                DataBinding.DataField = 'IDENTIFICACAO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                Style.TextStyle = [fsBold]
                TabOrder = 7
                Width = 309
              end
              object lcxNomeIdentificacao: TcxDBLookupComboBox
                Left = 10
                Top = 61
                RepositoryItem = dtmLookupFinanceiro.ListaGrupoIdentificacao
                DataBinding.DataField = 'IDENTIFICACAO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxNomeIdentificacaoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 8
                OnDblClick = lcxNomeIdentificacaoDblClick
                OnEnter = lcxNomeIdentificacaoEnter
                Width = 309
              end
              object icxSexo: TcxDBImageComboBox
                Left = 324
                Top = 60
                RepositoryItem = dtmLookup.Combo_Sexo
                DataBinding.DataField = 'SEXO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.Items = <>
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 9
                Width = 82
              end
              object cbxTipoCPF: TcxComboBox
                Left = 411
                Top = 60
                Enabled = False
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  'CPF'
                  'CNPJ')
                Properties.OnChange = cxComboBox1PropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 10
                Width = 56
              end
              object edtCPF: TcxDBMaskEdit
                Left = 472
                Top = 60
                DataBinding.DataField = 'CPFCNPJ'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.AlwaysShowBlanksAndLiterals = True
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 11
                OnExit = edtCPFExit
                Width = 150
              end
              object chbSituacao: TcxDBCheckBox
                Left = 9
                Top = 81
                AutoSize = False
                Caption = 'Utiliza boleto?'
                DataBinding.DataField = 'UTILIZA_BOLETO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayChecked = 'S'
                Properties.DisplayGrayed = 'N'
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'MS Sans Serif'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                TabOrder = 12
                Transparent = True
                Height = 21
                Width = 105
              end
            end
            object pnlFuncao: TPanel
              Left = 0
              Top = 101
              Width = 640
              Height = 49
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Color = 13034466
              ParentBackground = False
              TabOrder = 1
              object cxLabel9: TcxLabel
                Left = 7
                Top = 3
                Caption = 'Tipo da Pessoa'
                Style.TextColor = 4210688
                Transparent = True
              end
              object edtTipoPessoa: TcxDBCheckComboBox
                Left = 8
                Top = 21
                DataBinding.DataField = 'TIPO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.Items = <>
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 1
                Text = 'None selected'
                Width = 310
              end
              object lcxPessoaFuncao: TcxDBLookupComboBox
                Left = 324
                Top = 21
                RepositoryItem = dtmLookupFinanceiro.ListaPessoaFuncao
                DataBinding.DataField = 'PESSOA_FUNCAO_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxxTipoDocumentoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 2
                OnEnter = lcxTipoDocumentoEnter
                OnExit = lcxTipoDocumentoExit
                Width = 297
              end
              object cxLabel10: TcxLabel
                Left = 324
                Top = 3
                Caption = 'Fun'#231#227'o '
                Style.TextColor = 4210688
                Transparent = True
              end
            end
          end
        end
        object tabComplemento: TcxTabSheet
          Caption = 'Dados Complementares'
          ImageIndex = 1
          object pnlDadosComplementares: TPanel
            Left = 0
            Top = 0
            Width = 640
            Height = 456
            Align = alClient
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object cxGroupBox2: TcxGroupBox
              Left = 0
              Top = 0
              Align = alTop
              Caption = ' Dados Pessoais'
              Style.BorderStyle = ebsNone
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = ''
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold, fsUnderline]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = ''
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = ''
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = ''
              TabOrder = 0
              Height = 153
              Width = 640
              object cxLabel12: TcxLabel
                Left = 9
                Top = 18
                Caption = 'Estado Civil'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel20: TcxLabel
                Left = 197
                Top = 18
                Caption = 'Profiss'#227'o'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel19: TcxLabel
                Left = 10
                Top = 61
                Caption = 'Nacionalidade'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel27: TcxLabel
                Left = 10
                Top = 103
                Caption = 
                  'Filia'#231#227'o - Pai                                                  ' +
                  '         M'#227'e                                    _'
                Style.TextColor = 4210688
                Style.TextStyle = [fsBold, fsUnderline]
              end
              object cxLabel22: TcxLabel
                Left = 513
                Top = 18
                Caption = 'Data Nascimento'
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel17: TcxLabel
                Left = 197
                Top = 61
                Caption = 
                  'Naturalidade - UF - Cidade                                      ' +
                  '                  '
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Transparent = True
              end
              object lcxEstadoCivil: TcxDBLookupComboBox
                Left = 10
                Top = 36
                DataBinding.DataField = 'TB_ESTADOCIVIL_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.ListColumns = <
                  item
                    FieldName = 'TB_ESTADOCIVIL_ID'
                  end>
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 6
                Width = 181
              end
              object lcxProfissao: TcxDBLookupComboBox
                Left = 197
                Top = 36
                DataBinding.DataField = 'TB_PROFISSAO_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecLowerCase
                Properties.DropDownListStyle = lsEditList
                Properties.ListColumns = <>
                Properties.OnChange = lcxProfissaoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 7
                OnDblClick = lcxProfissaoDblClick
                OnEnter = lcxProfissaoEnter
                OnExit = lcxProfissaoExit
                Width = 310
              end
              object edtDataNascimento: TcxDBDateEdit
                Left = 513
                Top = 36
                DataBinding.DataField = 'DATA_NASCIMENTO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 8
                Width = 108
              end
              object cxDBTextEdit3: TcxDBTextEdit
                Left = 10
                Top = 78
                DataBinding.DataField = 'NACIONALIDADE'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 9
                Width = 181
              end
              object cbxNaturalidadeUf: TcxDBComboBox
                Left = 197
                Top = 78
                RepositoryItem = dtmLookup.Combo_UF
                DataBinding.DataField = 'NATURALIDADE_UF'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.OnEditValueChanged = cxDBComboBox2PropertiesEditValueChanged
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 10
                Width = 62
              end
              object cxDBLookupComboBox2: TcxDBLookupComboBox
                Left = 265
                Top = 78
                DataBinding.DataField = 'NATURALIDADE_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.KeyFieldNames = 'MUNICIPIO_ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'MUNICIPIO'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dtsCidadeNaturalidade
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 11
                Width = 356
              end
              object edtPai: TcxDBTextEdit
                Left = 10
                Top = 122
                DataBinding.DataField = 'NOME_PAI'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 12
                Width = 302
              end
              object edtNomeMae: TcxDBTextEdit
                Left = 318
                Top = 122
                DataBinding.DataField = 'NOME_MAE'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 13
                Width = 302
              end
            end
            object cxGroupBox4: TcxGroupBox
              Left = 0
              Top = 153
              Align = alClient
              Caption = ' Documentos Adicionais'
              Style.BorderStyle = ebsNone
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = ''
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold, fsUnderline]
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = ''
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = ''
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = ''
              TabOrder = 1
              Height = 303
              Width = 640
              object pnlDocumentosAdicionais: TPanel
                Left = 2
                Top = 18
                Width = 636
                Height = 47
                Align = alTop
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Color = 13034466
                ParentBackground = False
                TabOrder = 0
                object cxLabel18: TcxLabel
                  Left = 10
                  Top = 2
                  Caption = 'Tipo Documento'
                  Style.TextColor = 4210688
                  Style.TextStyle = []
                  Transparent = True
                end
                object cxLabel21: TcxLabel
                  Left = 224
                  Top = 2
                  Caption = 'Documento (N'#186'/Org'#227'o/Emiss'#227'o...)'
                  Style.TextColor = 4210688
                  Style.TextStyle = []
                  Transparent = True
                end
                object DocumentoTipo_lcx: TcxLookupComboBox
                  Left = 10
                  Top = 20
                  ParentFont = False
                  Properties.ListColumns = <>
                  Properties.OnChange = DocumentoTipo_lcxPropertiesChange
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 2
                  OnDblClick = DocumentoTipo_lcxDblClick
                  OnEnter = DocumentoTipo_lcxEnter
                  OnExit = DocumentoTipo_lcxExit
                  Width = 208
                end
                object DocumentoNumero_edt: TcxTextEdit
                  Left = 224
                  Top = 21
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 3
                  Width = 326
                end
                object btnDocumentoAdicionar: TcxButton
                  Left = 554
                  Top = 18
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
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
                    F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
                    FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                    FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
                    000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
                    FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
                    D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
                    00000000000000000000000000D5FFAA00000000000000000000000000000000
                    00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
                    00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
                    FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
                    FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
                    FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                    FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 4
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnDocumentoAdicionarClick
                end
                object btnDocumentoExcluir: TcxButton
                  Left = 585
                  Top = 18
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Colors.Default = clWhite
                  Enabled = False
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
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
                    F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE8E9FF
                    FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFEDC5753E5FFFFFFFFFFFFFFFFFCA3379F
                    F5FFFDD6610D0467DFFFFFFFFFFFFFFBAB20022D9EF5FAA31500000A62DDFFFF
                    FFFFFCAA2900000146E6FEE2660800000A65E4FFFFFCAC290200002FB7FAFFFF
                    EF760F00000259DDF7A21D00000338C1FFFFFFFFFFEC72070000005F9A210000
                    0038BEFFFFFFFFFFFFFFED690C000008110000002CC2FFFFFFFFFFFFFFFFFFE3
                    6F0D000000000332B7FFFFFFFFFFFFFFFFFFFFFEDF56000000001CADFBFFFFFF
                    FFFFFFFFFFFFFFF7A52100000000095EDDFFFFFFFFFFFFFFFFFFFCA521000000
                    0200000056E4FFFFFFFFFFFFFFFBAB1D000000315A0C00000265DFFFFFFFFFFF
                    FCAA2900000030BBDE6E0A00000A62DDFFFFFFFCAC290200002DB8FBFEE26608
                    00000A67E5FFFAAD1F00000338C1FFFFFFFFEF750F00000256EAFBB831030038
                    BEFFFFFFFFFFFFEC720700136DEDFFF8B23630C2FFFFFFFFFFFFFFFFEC6A1F77
                    E7FFFFFFF8BDC7FFFFFFFFFFFFFFFFFFFFE5B1E7FFFFFFFFFFFCFEFFFFFFFFFF
                    FFFFFFFFFFFEFCFFFFFF}
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object gridDoucmentosGeral: TcxGrid
                Left = 2
                Top = 65
                Width = 636
                Height = 236
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = cxcbsNone
                TabOrder = 1
                LookAndFeel.Kind = lfFlat
                object cxGridDBTableView4: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = False
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  DataController.DataSource = dtsPessoaDocumento
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'Total:0'
                      Kind = skCount
                      FieldName = 'USUARIO_ID'
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.NoDataToDisplayInfoText = 'Nenhum Documento Inserido'
                  OptionsView.ScrollBars = ssVertical
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GridLines = glNone
                  OptionsView.GroupByBox = False
                  Styles.Background = dtmControles.cxStyle1
                  Styles.ContentEven = dtmControles.cxStyle3
                  Styles.Inactive = dtmControles.cxStyle10
                  Styles.Selection = dtmControles.cxStyle14
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  object cxGridDBColumn3: TcxGridDBColumn
                    Caption = 'Tipo Documento'
                    DataBinding.FieldName = 'TIPO_DOCUMENTO_ID'
                    FooterAlignmentHorz = taCenter
                    Width = 218
                  end
                  object cxGridDBTableView4Column1: TcxGridDBColumn
                    Caption = 'Documento (n'#186'/Org'#227'o/Emiss'#227'o...)'
                    DataBinding.FieldName = 'DOCUMENTO'
                    Width = 706
                  end
                end
                object cxGridLevel4: TcxGridLevel
                  GridView = cxGridDBTableView4
                end
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 449
    Top = 252
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT * FROM J_PESSOA'#13#10'WHERE PESSOA_ID = :PESSOA_ID'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    Left = 479
    Top = 252
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 511
    Top = 252
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    AfterScroll = ClientAncestralAfterScroll
    OnCalcFields = ClientAncestralCalcFields
    Left = 543
    Top = 250
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object ClientAncestralEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 120
    end
    object ClientAncestralCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 15
    end
    object ClientAncestralDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object ClientAncestralEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 90
    end
    object ClientAncestralTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 120
    end
    object ClientAncestralEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Size = 90
    end
    object ClientAncestralTIPO_DOCUMENTO_ID: TFMTBCDField
      FieldName = 'TIPO_DOCUMENTO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO_PETICIONADOR: TStringField
      FieldName = 'TIPO_PETICIONADOR'
      Size = 1
    end
    object ClientAncestralTIPO_CAPTADOR: TStringField
      FieldName = 'TIPO_CAPTADOR'
      Size = 1
    end
    object ClientAncestralTIPO_SOCIO: TStringField
      FieldName = 'TIPO_SOCIO'
      Size = 1
    end
    object ClientAncestralTIPO_PARTICIPANTE: TStringField
      FieldName = 'TIPO_PARTICIPANTE'
      Size = 1
    end
    object ClientAncestralPESSOA_FUNCAO_ID: TFMTBCDField
      FieldName = 'PESSOA_FUNCAO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 60
    end
    object ClientAncestralENDERECO_LOGRADOURO: TStringField
      FieldName = 'ENDERECO_LOGRADOURO'
      Size = 120
    end
    object ClientAncestralENDERECO_CIDADE_ID: TFMTBCDField
      FieldName = 'ENDERECO_CIDADE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralENDERECO_CIDADE_UF: TStringField
      FieldName = 'ENDERECO_CIDADE_UF'
      Size = 3
    end
    object ClientAncestralENDERECO_CEP: TStringField
      FieldName = 'ENDERECO_CEP'
      Size = 15
    end
    object ClientAncestralNATURALIDADE_ID: TFMTBCDField
      FieldName = 'NATURALIDADE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralNATURALIDADE_UF: TStringField
      FieldName = 'NATURALIDADE_UF'
      Size = 3
    end
    object ClientAncestralNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 120
    end
    object ClientAncestralNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 120
    end
    object ClientAncestralDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object ClientAncestralENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      Size = 60
    end
    object ClientAncestralTB_PROFISSAO_ID: TFMTBCDField
      FieldName = 'TB_PROFISSAO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralTB_ESTADOCIVIL_ID: TFMTBCDField
      FieldName = 'TB_ESTADOCIVIL_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Size = 1
    end
    object ClientAncestralSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object ClientAncestralNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 30
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 90
    end
    object ClientAncestralUTILIZA_BOLETO: TStringField
      FieldName = 'UTILIZA_BOLETO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 575
    Top = 252
  end
  object sqlCidadeEndereco: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT MUNICIPIO_ID, MUNICIPIO'#13#10'FROM G_MUNICIPIO'#13#10'WHERE SIGLA = ' +
      ':UF'#13#10'ORDER BY MUNICIPIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end>
    Params = <>
    Left = 572
    Top = 309
    object sqlCidadeEnderecoMUNICIPIO_ID: TFMTBCDField
      FieldName = 'MUNICIPIO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCidadeEnderecoMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 120
    end
  end
  object dtsCidadeEndereco: TDataSource
    DataSet = sqlCidadeEndereco
    Left = 572
    Top = 341
  end
  object sqlCidadeNaturalidade: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT MUNICIPIO_ID, MUNICIPIO'#13#10'FROM G_MUNICIPIO'#13#10'WHERE SIGLA = ' +
      ':UF'#13#10'ORDER BY MUNICIPIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end>
    Params = <>
    Left = 542
    Top = 309
    object FMTBCDField1: TFMTBCDField
      FieldName = 'MUNICIPIO_ID'
      Precision = 20
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'MUNICIPIO'
      Size = 120
    end
  end
  object dtsCidadeNaturalidade: TDataSource
    DataSet = sqlCidadeNaturalidade
    Left = 540
    Top = 339
  end
  object sqlPessoaDocumento: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT *'#13#10'FROM J_PESSOA_DOCUMENTO'#13#10'WHERE PESSOA_ID = :PESSOA_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlPessoaDocumentoAfterScroll
    Left = 508
    Top = 309
    object sqlPessoaDocumentoPESSOA_DOCUMENTO_ID: TFMTBCDField
      FieldName = 'PESSOA_DOCUMENTO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlPessoaDocumentoPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPessoaDocumentoTIPO_DOCUMENTO_ID: TFMTBCDField
      FieldName = 'TIPO_DOCUMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPessoaDocumentoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 90
    end
  end
  object dtsPessoaDocumento: TDataSource
    DataSet = sqlPessoaDocumento
    Left = 508
    Top = 341
  end
end
