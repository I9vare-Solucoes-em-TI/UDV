object frmMovimentacao: TfrmMovimentacao
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 483
  ClientWidth = 1008
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 0
    object Bevel4: TBevel
      Left = 37
      Top = 4
      Width = 636
      Height = 25
      Shape = bsFrame
    end
    object lblInformacaoLancamento: TcxLabel
      Left = 35
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = 
        'Pesquisa Detalhadas de Compromissos Pendentes, Realizados e Isen' +
        'tos (Entradas e Sa'#237'das) e Agendados'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 52
      Width = 829
      AnchorX = 450
      AnchorY = 26
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 35
      Height = 52
      Align = alLeft
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 1
      object imgReceber: TImage
        Left = 4
        Top = 3
        Width = 33
        Height = 34
        Transparent = True
      end
    end
    object PanelBotaoFechar: TPanel
      Left = 864
      Top = 0
      Width = 144
      Height = 52
      Align = alRight
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 2
      object cxBtnFechar: TcxButton
        Left = 70
        Top = 3
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Caption = 'Sair'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          080000000000400200009B0E00009B0E0000000100000000000000000000D7D7
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
          000000000000000000000000000000000000000000000000000005050505130D
          0000000000000000000000000024090505050505050A06000000000000000000
          000000000000001C05050505050E00212D1010101010101010101010100C0800
          0A050505051D0007050505050505050505050505050525001A050505050F000B
          05050505050505050505050505050D001A050505050F000B0505050505050505
          050505050505170011050505050F000B0505050505050505052D061B05051415
          01050505050F000B0505050505050505051F00271E05050423050505050F000B
          0505050505050505051900001528050505050505050F000B0505050B16161616
          160300000000020505050505050F000B05050527000000000000000000000020
          18050505050F000B0505051200000000000000000000000003220505050F000B
          0505051200000000000000000000000003220505050F000B0505052700000000
          000000000000002018050505050F000B0505050B161616161603000000000205
          05050505050F000B0505050505050505051900001528050505050505050F000B
          0505050505050505051F00271E05050423050505050F000B0505050505050505
          052C2B1B0505141501050505050F000B05050505050505050505050505051700
          11050505050F000B05050505050505050505050505050D001A050505051D0007
          050505050505050505050505050525001A050505050E00212D10101010101010
          10101010100C08000A050505050A06000000000000000000000000000000001C
          050505050505130D000000000000000000000000002409050505}
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = cxBtnFecharClick
      end
      object btnImprimir: TcxButton
        Left = 7
        Top = 3
        Width = 60
        Height = 45
        Hint = 'Imprimir Relat'#243'rios'
        Caption = 'Relatorio'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000110B0000110B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A56464646565
          6568686868686868686868686868686868686868686868686868686868686866
          6666626262A1A1A1FFFFFFFFFFFFFFFFFFFFFFFF606060000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00595959FFFFFFFFFFFFFFFFFFFFFFFF63636300000000000000000000000000
          00000000000000000000000000000000000000000000000000000000005C5C5C
          FFFFFFFFFFFFFFFFFFFFFFFF6666660000001515154F4F4F3939390000000000
          00000000000000000000000000000000000000000000000000626262FFFFFFFF
          FFFFFFFFFFFFFFFF6262620000005F5F5F6B6B6B6A6A6A3C3C3CA1A1A1B0B0B0
          A8A8A8A8A8A8A8A8A8A8A8A8BCBCBC727272000000575757FFFFFFFFFFFFFFFF
          FFFFFFFF6262620000005959596C6C6C6A6A6A3131317D7D7D87878781818181
          81818181818181819090905858580000005A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
          6767670000000000002525251B1B1B0000000000000000000000000000000000
          00000000000000000000000000646464FFFFFFFFFFFFFFFFFFFFFFFF67676700
          00002222227777774B4B4B0E0E0E232323303030353535333333333333353535
          2B2B2B1B1B1B0000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000009D9D
          9DF0F0F09C9C9C292929BABABAD2D2D2D1D1D1D0D0D0D0D0D0D1D1D1D3D3D391
          9191000000535353FFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000006E6E6E818181
          C1C1C12828281515151919191717171717171717171717171C1C1C1010100000
          005F5F5FFFFFFFFFFFFFFFFFFFFFFFFF6868680000000000000F0F0F41414119
          1919000000000000000000000000000000000000000000000000000000646464
          FFFFFFFFFFFFFFFFFFFFFFFF646464000000474747BDBDBD6565651010104D4D
          4D5959595555555555555555555555555858583D3D3D0000005B5B5BFFFFFFFF
          FFFFFFFFFFFFFFFF585858000000A4A4A4E2E2E2B0B0B0272727B1B1B1CBCBCB
          C0C0C0C0C0C0C0C0C0C0C0C0CECECE8B8B8B000000535353FFFFFFFFFFFFFFFF
          FFFFFFFF5C5C5C000000363636505050A2A2A227272700000000000000000000
          00000000000000000000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F0000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000575757FFFFFFFFFFFFFFFFFFFFFFFFA0A0A059
          59595A5A5A5A5A5A4F4F4F5757575F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          5F5F5F5C5C5C5858589C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OptionsImage.Layout = blGlyphTop
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnImprimirClick
      end
    end
  end
  object pgcPesquisa: TcxPageControl
    Left = 0
    Top = 52
    Width = 1008
    Height = 431
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabGerenciador
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OnChange = pgcPesquisaChange
    ClientRectBottom = 431
    ClientRectRight = 1008
    ClientRectTop = 24
    object tabGerenciador: TcxTabSheet
      Caption = 'Pesquisa Personalizada'
      ImageIndex = 0
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 175
        Align = alTop
        BevelOuter = bvLowered
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object lblSituacao: TcxLabel
          Left = 11
          Top = 44
          Caption = 'Situa'#231#227'o'
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object lblDataIni: TcxLabel
          Left = 151
          Top = 44
          Caption = 'Data Inicial:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object lblDataFim: TcxLabel
          Left = 253
          Top = 45
          Caption = 'Data Final:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object cxLabel3: TcxLabel
          Left = 352
          Top = 90
          Caption = 'Ref. Comp.'
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 600
          Top = 45
          Caption = 'Pessoa (Associado/N'#227'o Associado)'
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object lblDocumento: TcxLabel
          Left = 887
          Top = 90
          Caption = 'Documento(s)'
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 16384
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 11
          Top = 90
          Caption = 'Compromisso'
          ParentColor = False
          ParentFont = False
          Style.Color = clBtnFace
          Style.StyleController = dtmControles.cxEditStyleBotao
          Style.TextColor = 16384
          Transparent = True
        end
        object lblDescricao: TcxLabel
          Left = 428
          Top = 90
          Caption = 'Descri'#231#227'o'
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          Transparent = True
        end
        object rdbEntradas: TcxRadioButton
          Left = 12
          Top = 8
          Width = 173
          Height = 17
          Caption = 'Entradas/A Receber (Vencidos)'
          Checked = True
          TabOrder = 8
          TabStop = True
          OnClick = rdbEntradasClick
          Transparent = True
        end
        object rdbSaidas: TcxRadioButton
          Left = 204
          Top = 8
          Width = 373
          Height = 17
          Caption = 
            'Sa'#237'das (At'#233' Dezembro/2016)  >> 2017 em Diante Verificar Livro Ca' +
            'ixa'
          TabOrder = 9
          OnClick = rdbSaidasClick
          Transparent = True
        end
        object chxAgruparBalancete: TcxCheckBox
          Left = 8
          Top = 134
          Caption = 'Agrupar Balancete'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          TabOrder = 10
          Transparent = True
          OnClick = chxAgruparBalanceteClick
          Width = 141
        end
        object chxAgruparCentroCustos: TcxCheckBox
          Left = 148
          Top = 134
          Caption = 'Agrupar Centro Custos'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          TabOrder = 11
          Transparent = True
          OnClick = chxAgruparCentroCustosClick
          Width = 165
        end
        object chxAgruparCompromisso: TcxCheckBox
          Left = 308
          Top = 134
          Caption = 'Agrupar Compromisso'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          TabOrder = 12
          Transparent = True
          OnClick = chxAgruparCompromissoClick
          Width = 161
        end
        object chxAgruparReferencia: TcxCheckBox
          Left = 472
          Top = 134
          Caption = 'Agrupar Ref. Comp.'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          TabOrder = 13
          Transparent = True
          OnClick = chxAgruparReferenciaClick
          Width = 153
        end
        object chxAgruparPessoa: TcxCheckBox
          Left = 624
          Top = 134
          Caption = 'Agrupar Nome'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          TabOrder = 14
          Transparent = True
          OnClick = chxAgruparPessoaClick
          Width = 125
        end
        object chxTaxaBoleto: TcxCheckBox
          Left = 148
          Top = 87
          Caption = 'Mostrar Compromisso Taxa de Boleto'
          Style.TextColor = 16384
          TabOrder = 15
          Width = 203
        end
        object lblPesquisaDiaAtual: TcxLabel
          Left = 167
          Top = 158
          Caption = '<< Pesquisa do Dia Atual >>'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clRed
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblExpandirDados: TcxLabel
          Left = 82
          Top = 158
          Cursor = crHandPoint
          Caption = 'Expandir Dados'
          DragCursor = crHandPoint
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlue
          Style.TextStyle = [fsUnderline]
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.TextColor = clNavy
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextColor = clMaroon
          Transparent = True
          OnClick = lblExpandirDadosClick
        end
        object lblJuntarDados: TcxLabel
          Left = 10
          Top = 158
          Cursor = crHandPoint
          Caption = 'Juntar Dados'
          DragCursor = crHandPoint
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlue
          Style.TextStyle = [fsUnderline]
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.TextColor = clNavy
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextColor = clMaroon
          Transparent = True
          OnClick = lblJuntarDadosClick
        end
        object icxPesqSituacao: TcxImageComboBox
          Left = 11
          Top = 62
          ParentFont = False
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Pendente'
              ImageIndex = 53
              Value = '1'
            end
            item
              Description = 'Quitado'
              ImageIndex = 6
              Value = '2'
            end
            item
              Description = 'Isento'
              ImageIndex = 33
              Value = '3'
            end
            item
              Description = 'Todos'
              ImageIndex = 52
              Value = '0'
            end
            item
              Description = 'Pendentes e Quitados'
              ImageIndex = 2
              Value = '4'
            end>
          Properties.OnEditValueChanged = icxPesqSituacaoPropertiesEditValueChanged
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 19
          Width = 134
        end
        object edtPesqDataIni: TcxDateEdit
          Left = 153
          Top = 63
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 20
          Width = 92
        end
        object edtPesqDataFim: TcxDateEdit
          Left = 253
          Top = 63
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 21
          OnKeyDown = edtPesqDataFimKeyDown
          Width = 92
        end
        object cxGroupBox1: TcxGroupBox
          Left = 351
          Top = 30
          Caption = ' Boleto/Recibo/Comprovante'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 22
          Height = 59
          Width = 243
          object icxPesqTipoDocumento: TcxImageComboBox
            Left = 9
            Top = 32
            ParentFont = False
            Properties.Items = <
              item
                Description = 'Boleto'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'Recibo'
                Value = '2'
              end
              item
                Description = 'Comprovante'
                Value = '3'
              end>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 0
            Width = 142
          end
          object cxLabel5: TcxLabel
            Left = 8
            Top = 14
            Caption = 'Tipo Documento'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 16384
            StyleFocused.TextColor = 16384
            Transparent = True
          end
          object cxLabel6: TcxLabel
            Left = 157
            Top = 14
            Caption = 'N'#250'mero'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 16384
            Transparent = True
          end
          object edtPesqNumero: TcxTextEdit
            Left = 158
            Top = 33
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            OnKeyDown = edtPesqDataFimKeyDown
            OnKeyPress = edtPesqNumeroKeyPress
            Width = 77
          end
        end
        object edtPesqPessoa: TcxTextEdit
          Left = 600
          Top = 63
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 23
          OnKeyDown = edtPesqDataFimKeyDown
          Width = 392
        end
        object lcxPesqCompromisso: TcxLookupComboBox
          Left = 11
          Top = 108
          RepositoryItem = dtmLookup.Lista_CompSaidasTodos
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 24
          Width = 334
        end
        object edtPesqReferencia: TcxMaskEdit
          Left = 352
          Top = 108
          ParentFont = False
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '99\/9999;1;_'
          Properties.MaxLength = 0
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 25
          Text = '  /    '
          OnKeyDown = edtPesqDataFimKeyDown
          OnKeyPress = edtPesqReferenciaKeyPress
          Width = 69
        end
        object edtPesqDescricao: TcxTextEdit
          Left = 428
          Top = 108
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 26
          OnKeyDown = edtPesqDataFimKeyDown
          Width = 453
        end
        object edtPesqDocumento: TcxTextEdit
          Left = 887
          Top = 108
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 27
          OnKeyDown = edtPesqDataFimKeyDown
          Width = 103
        end
        object btnPesquisar: TcxButton
          Left = 796
          Top = 137
          Width = 95
          Height = 22
          Caption = 'Pesquisar'
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
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA3379E
            F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAC20022C9EF5FFFFFFFFFFFFFFFFFFFF
            FFFFFCAA2900000146E6FFFFFFFFFFFFFFFFFFFFFFFCAC290200002FB7FAFFFF
            FFFFFFFFFFFFFFFFF7A31E00000338C1FFFFFFFFFFFFFFEAE0E0E7F1A6210000
            0038BEFFFFFFFFFFFFEFAE5F51515B761F0000002CC2FFFFFFFFFFFFEB7E2139
            7175511100000030B7FFFFFFFFFFFFF68E1672E3F1F2E9AF150130B9FBFFFFFF
            FFFFFEC83571F0FFFFFFFFFFB41382F8FFFFFFFFFFFFFA9D2DC0FEFFFFFFFFFF
            E9535DE6FFFFFFFFFFFFF78B3FD4FFFFFFFFFFFFF27651E0FFFFFFFFFFFFF88E
            39D0FFFFFFFFFFFFF17252E0FFFFFFFFFFFFFCA927AEFDFFFFFFFFFFE23864EB
            FFFFFFFFFFFFFFDF543ECEFDFFFFFEF07222AEFEFFFFFFFFFFFFFFFDB6343FAC
            D1D2BD6F147EF0FFFFFFFFFFFFFFFFFFF8B553233B3D2A378BECFFFFFFFFFFFF
            FFFFFFFFFFFCDEA88F8C9BCAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8FAFE
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarClick
        end
        object btnLimpar: TcxButton
          Left = 895
          Top = 137
          Width = 95
          Height = 22
          Hint = 'Limpar Pesquisa'
          Caption = 'Limpar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000B00D0000B00D00000001000000000000000000000101
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
            687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
            68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
            FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
            F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
            FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
            39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 29
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparClick
        end
      end
      object pgcGrid: TcxPageControl
        Left = 0
        Top = 175
        Width = 1008
        Height = 211
        Align = alClient
        TabOrder = 1
        Properties.ActivePage = tabentradas
        Properties.CustomButtons.Buttons = <>
        ExplicitHeight = 232
        ClientRectBottom = 211
        ClientRectRight = 1008
        ClientRectTop = 24
        object tabentradas: TcxTabSheet
          Caption = 'tabentradas'
          ImageIndex = 0
          ExplicitHeight = 208
          object cxGridEntradas: TcxGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 187
            Align = alClient
            PopupMenu = popExportacao
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            ExplicitHeight = 208
            object cxGridDBTableEntradas: TcxGridDBTableView
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
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = dtsPesquisa1
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = 'R$ ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBTableEntradasBalancete
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total = ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBColumn14
                end
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  FieldName = 'COMPROMISSO_VENCIDO_ID'
                  Column = cxGridDBTableEntradasCompromisso
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              object cxGridDBTableEntradasNome: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'PESSOA_NOME'
                Options.Editing = False
                Options.Filtering = False
                Width = 173
              end
              object cxGridDBTableEntradasColumn2: TcxGridDBColumn
                Caption = 'S'#243'cio'
                DataBinding.FieldName = 'calc_NaoAssociado'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = dtmControles.imgCadBasicos
                Properties.Items = <
                  item
                    ImageIndex = 13
                    Value = 'True'
                  end
                  item
                    Value = 'False'
                  end>
                GroupSummaryAlignment = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 35
              end
              object cxGridDBTableEntradasCompromisso: TcxGridDBColumn
                Caption = 'Compromisso'
                DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 149
              end
              object cxGridDBTableEntradasBalancete: TcxGridDBColumn
                Caption = 'Balancete'
                DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                GroupSummaryAlignment = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 62
              end
              object cxGridDBTableEntradasCentroCusto: TcxGridDBColumn
                Caption = 'Centro Custos'
                DataBinding.FieldName = 'CENTRO_CUSTO_ID'
                RepositoryItem = dtmLookup.Lista_CentroCustoTodos
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 128
              end
              object cxGridDBColumn10: TcxGridDBColumn
                Caption = 'Data de Realiza'#231#227'o'
                DataBinding.FieldName = 'DATA_REALIZACAO'
                Options.Editing = False
                Options.Filtering = False
                Width = 96
              end
              object cxGridDBColumn13: TcxGridDBColumn
                Caption = 'Situa'#231#227'o'
                DataBinding.FieldName = 'SITUACAO'
                RepositoryItem = dtmLookup.Combo_SituacaoPagamento
                Options.Editing = False
                Options.Filtering = False
                Width = 74
              end
              object cxGridDBColumn14: TcxGridDBColumn
                Caption = 'Valor'
                DataBinding.FieldName = 'VALOR_ATUAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 87
              end
              object cxGridDBColumn15: TcxGridDBColumn
                Caption = '#'
                DataBinding.FieldName = 'DIFERENCA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                RepositoryItem = dtmLookup.Combo_SimNaoDiferenca
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 20
              end
              object cxGridDBColumn16: TcxGridDBColumn
                Caption = '+'
                DataBinding.FieldName = 'QTD_ADICIONAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taBottomJustify
                Properties.DisplayFormat = '0'
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 21
              end
              object cxGridDBTableEntradasReferencia: TcxGridDBColumn
                Caption = 'Refer'#234'ncia'
                DataBinding.FieldName = 'calc_referencia'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 60
              end
              object cxGridDBColumn18: TcxGridDBColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'calc_TipoDocumento'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = dtmControles.imgCadBasicos
                Properties.Items = <
                  item
                    Description = 'Boleto'
                    ImageIndex = 51
                    Value = '1'
                  end
                  item
                    Description = 'Recibo'
                    ImageIndex = 47
                    Value = '2'
                  end>
                Options.Editing = False
                Options.Filtering = False
                Width = 49
              end
              object cxGridDBColumn19: TcxGridDBColumn
                Caption = 'Numero'
                DataBinding.FieldName = 'calc_NumeroDocumento'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 44
              end
            end
            object cxGridLevel5: TcxGridLevel
              GridView = cxGridDBTableEntradas
            end
          end
        end
        object tabSaidas: TcxTabSheet
          Caption = 'tabSaidas'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGridSaidas: TcxGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 187
            Align = alClient
            PopupMenu = popExportacao
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            object cxGridDBTableSaidas: TcxGridDBTableView
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
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = dtsPesquisa1
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = 'R$ ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBTableSaidasCompromisso
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ' ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBColumn6
                end
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  FieldName = 'COMPROMISSO_VENCIDO_ID'
                  Column = cxGridDBTableSaidasCompromisso
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Column = cxGridDBColumn11
              Styles.Inactive = dtmControles.cxStyle40
              object cxGridDBTableSaidasCompromisso: TcxGridDBColumn
                Caption = 'Compromisso'
                DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 172
              end
              object cxGridDBTableSaidasColumn2: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'DESCRICAO'
                Options.Editing = False
                Options.Filtering = False
                Width = 182
              end
              object cxGridDBTableSaidasBalancete: TcxGridDBColumn
                Caption = 'B.G.'
                DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                GroupSummaryAlignment = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 44
              end
              object cxGridDBTableSaidasCentroCusto: TcxGridDBColumn
                Caption = 'Centro de Custo'
                DataBinding.FieldName = 'CENTRO_CUSTO_ID'
                RepositoryItem = dtmLookup.Lista_CentroCustoAtivo
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 105
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = 'Data de Realiza'#231#227'o'
                DataBinding.FieldName = 'DATA_REALIZACAO'
                Options.Editing = False
                Options.Filtering = False
                Width = 110
              end
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = 'Valor'
                DataBinding.FieldName = 'VALOR_ATUAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Width = 70
              end
              object cxGridDBTableSaidasReferencia: TcxGridDBColumn
                Caption = 'Refer'#234'ncia'
                DataBinding.FieldName = 'calc_referencia'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 57
              end
              object cxGridDBTableSaidasColumn1: TcxGridDBColumn
                Caption = 'Documento(s)'
                DataBinding.FieldName = 'SAIDA_DOCUMENTO'
                Options.Filtering = False
                Width = 103
              end
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'SAIDA_TIPO'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = dtmControles.imgCadBasicos
                Properties.Items = <
                  item
                    Description = 'Comprovante'
                    ImageIndex = 44
                    Value = 'C'
                  end
                  item
                    Description = 'Recibo'
                    ImageIndex = 47
                    Value = 'R'
                  end>
                Options.Editing = False
                Width = 86
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = 'Numero'
                DataBinding.FieldName = 'SAIDA_NUMERO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 69
              end
              object cxGridDBColumn11: TcxGridDBColumn
                DataBinding.FieldName = 'calc_Descricao'
                Options.Editing = False
                Width = 222
                IsCaptionAssigned = True
              end
              object cxGridDBTableSaidasNome: TcxGridDBColumn
                DataBinding.FieldName = 'PESSOA_NOME'
                Visible = False
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableSaidas
            end
          end
        end
      end
      object chxSelecaoMultipla: TcxCheckBox
        Left = 0
        Top = 386
        Align = alBottom
        Caption = 'Sele'#231#227'o Multipla (Exporta'#231#227'o)'
        Style.TextColor = clWindowText
        TabOrder = 2
        OnClick = chxSelecaoMultiplaClick
        ExplicitTop = 407
        Width = 1008
      end
    end
    object tabPendenteQuitado: TcxTabSheet
      Caption = 'Associados Pendentes/Quitados'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 113
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 11
          Top = 3
          Caption = 'Compromisso'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 415
          Top = 5
          Caption = 'Per'#237'odo'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel7: TcxLabel
          Left = 550
          Top = 5
          Caption = 'Refer'#234'ncia Final'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object chxAgrupar1Compromisso: TcxCheckBox
          Left = 138
          Top = 49
          Caption = 'Agrupar Compromisso'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 3
          Transparent = True
          OnClick = chxAgrupar1CompromissoClick
          Width = 161
        end
        object chxAgrupar1Referencia: TcxCheckBox
          Left = 300
          Top = 49
          Caption = 'Agrupar Refer'#234'ncia'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 4
          Transparent = True
          OnClick = chxAgrupar1ReferenciaClick
          Width = 153
        end
        object cbxPesquisaCompromisso: TcxCheckComboBox
          Left = 190
          Top = 71
          Properties.Delimiter = ','
          Properties.EditValueFormat = cvfIndices
          Properties.Items = <
            item
            end>
          TabOrder = 5
          Visible = False
          Width = 67
        end
        object chxAgrupar1CentroCustos: TcxCheckBox
          Left = 600
          Top = 49
          Caption = 'Agrupar Centro Custos'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 6
          Transparent = True
          OnClick = chxAgrupar1CentroCustosClick
          Width = 165
        end
        object chxAgrupar1Balancete: TcxCheckBox
          Left = 456
          Top = 49
          Caption = 'Agrupar Balancete'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 7
          Transparent = True
          OnClick = chxAgrupar1BalanceteClick
          Width = 141
        end
        object lblResultadoPesquisa: TcxLabel
          Left = 13
          Top = 92
          Caption = '<< Resultado da Pesquisa >>'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clRed
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cbxCompromisso: TcxCheckComboBox
          Left = 10
          Top = 23
          ParentFont = False
          ParentShowHint = False
          Properties.Delimiter = ','
          Properties.EmptySelectionText = 'Todos Compromissos Pendentes'
          Properties.EditValueFormat = cvfIndices
          Properties.Items = <
            item
            end>
          ShowHint = False
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 9
          Width = 399
        end
        object icxPeriodo: TcxImageComboBox
          Left = 414
          Top = 23
          ParentFont = False
          Properties.Items = <
            item
              Description = '>= 3 Meses de Atraso'
              Value = '1'
            end
            item
              Description = 'Qualquer Per'#237'odo'
              Value = '2'
            end>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 10
          Width = 130
        end
        object cbxReferenciaFinal: TcxComboBox
          Left = 549
          Top = 23
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 11
          Width = 104
        end
        object btnPesquisarAssociado: TcxButton
          Left = 661
          Top = 23
          Width = 95
          Height = 22
          Caption = 'Pesquisar'
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
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA3379E
            F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAC20022C9EF5FFFFFFFFFFFFFFFFFFFF
            FFFFFCAA2900000146E6FFFFFFFFFFFFFFFFFFFFFFFCAC290200002FB7FAFFFF
            FFFFFFFFFFFFFFFFF7A31E00000338C1FFFFFFFFFFFFFFEAE0E0E7F1A6210000
            0038BEFFFFFFFFFFFFEFAE5F51515B761F0000002CC2FFFFFFFFFFFFEB7E2139
            7175511100000030B7FFFFFFFFFFFFF68E1672E3F1F2E9AF150130B9FBFFFFFF
            FFFFFEC83571F0FFFFFFFFFFB41382F8FFFFFFFFFFFFFA9D2DC0FEFFFFFFFFFF
            E9535DE6FFFFFFFFFFFFF78B3FD4FFFFFFFFFFFFF27651E0FFFFFFFFFFFFF88E
            39D0FFFFFFFFFFFFF17252E0FFFFFFFFFFFFFCA927AEFDFFFFFFFFFFE23864EB
            FFFFFFFFFFFFFFDF543ECEFDFFFFFEF07222AEFEFFFFFFFFFFFFFFFDB6343FAC
            D1D2BD6F147EF0FFFFFFFFFFFFFFFFFFF8B553233B3D2A378BECFFFFFFFFFFFF
            FFFFFFFFFFFCDEA88F8C9BCAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8FAFE
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarAssociadoClick
        end
        object btnLimparAssociado: TcxButton
          Left = 760
          Top = 23
          Width = 95
          Height = 22
          Hint = 'Limpar Pesquisa'
          Caption = 'Limpar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000B00D0000B00D00000001000000000000000000000101
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
            687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
            68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
            FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
            F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
            FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
            39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparClick
        end
        object chxAgrupar1Pessoa: TcxCheckBox
          Left = 10
          Top = 49
          Caption = 'Agrupar Nome'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 14
          Transparent = True
          OnClick = chxAgrupar1PessoaClick
          Width = 125
        end
      end
      object pgcPendencia: TcxPageControl
        Left = 0
        Top = 113
        Width = 1008
        Height = 294
        Align = alClient
        TabOrder = 1
        Properties.ActivePage = tabQuitado
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 294
        ClientRectRight = 1008
        ClientRectTop = 24
        object tabPendenciaDetalhada: TcxTabSheet
          Caption = 'Pendencias Detalhada'
          ImageIndex = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGridPendenciaDetalhada: TcxGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 270
            Align = alClient
            PopupMenu = popExportacao
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            object cxGridDBTableView1: TcxGridDBTableView
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
              Navigator.Visible = True
              FilterBox.Position = fpTop
              DataController.DataSource = dtsPesquisaDetalhada
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = 'R$ ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBBalancete
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total = ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_ATUAL'
                  Column = cxGridDBColumn20
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnFilteredItemsList = True
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              object cxGridDBNome: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Width = 383
              end
              object cxGridDBCompromisso: TcxGridDBColumn
                Caption = 'Compromisso'
                DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 235
              end
              object cxGridDBReferencia: TcxGridDBColumn
                Caption = 'Refer'#234'ncia'
                DataBinding.FieldName = 'calc_referencia'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 90
              end
              object cxGridDBColumn20: TcxGridDBColumn
                Caption = 'Valor'
                DataBinding.FieldName = 'VALOR_ATUAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 94
              end
              object cxGridDBBalancete: TcxGridDBColumn
                Caption = 'Balancete'
                DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                GroupSummaryAlignment = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 64
              end
              object cxGridDBCentroCusto: TcxGridDBColumn
                Caption = 'Centro Custos'
                DataBinding.FieldName = 'CENTRO_CUSTO_ID'
                RepositoryItem = dtmLookup.Lista_CentroCustoTodos
                Options.Editing = False
                Styles.Header = dtmLookup.cxStyle1
                Width = 132
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
        object tabPendenciaTotal: TcxTabSheet
          Caption = 'Pedencia Somatoria'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGridPendenciaSoma: TcxGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 270
            Align = alClient
            PopupMenu = popExportacao
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            object cxGridDBTableView2: TcxGridDBTableView
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
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = dtsPesquisaPendenciaSoma
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total = ,#0.00'
                  Kind = skSum
                  FieldName = 'VALOR_TOTAL'
                  Column = cxGridDBColumn21
                end
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  FieldName = 'PESSOA_ID'
                  Column = cxGridDBColumn2
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Options.Filtering = False
                Width = 616
              end
              object cxGridDBColumn21: TcxGridDBColumn
                Caption = 'Valor'
                DataBinding.FieldName = 'VALOR_TOTAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 382
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
        end
        object tabQuitado: TcxTabSheet
          Caption = 'Associados Quitados Atualizados'
          ImageIndex = 2
          object cxGridQuitados: TcxGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 270
            Align = alClient
            PopupMenu = popExportacao
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            object cxGridDBTableView3: TcxGridDBTableView
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
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = dtsPesquisaQuitado
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  FieldName = 'NOME'
                  Column = cxGridDBColumn1
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Options.Filtering = False
                Width = 616
              end
            end
            object cxGridLevel4: TcxGridLevel
              GridView = cxGridDBTableView3
            end
          end
        end
      end
      object lblJuntarDados1: TcxLabel
        Left = 14
        Top = 72
        Cursor = crHandPoint
        Caption = 'Juntar Dados'
        DragCursor = crArrow
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlue
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.TextColor = clNavy
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.TextColor = clMaroon
        Transparent = True
        OnClick = lblJuntarDados1Click
      end
      object lblExpandirDados1: TcxLabel
        Left = 90
        Top = 72
        Cursor = crHandPoint
        Caption = 'Expandir Dados'
        DragCursor = crDefault
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlue
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.TextColor = clNavy
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.TextColor = clMaroon
        Transparent = True
        OnClick = lblExpandirDados1Click
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Compromissos Agendados'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object cxLabel9: TcxLabel
          Left = 11
          Top = 3
          Caption = 'Compromisso'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = 16384
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel10: TcxLabel
          Left = 414
          Top = 3
          Caption = 'Grupo'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 643
          Top = 3
          Caption = 'Grau'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxCompAgendados: TcxCheckComboBox
          Left = 10
          Top = 20
          ParentFont = False
          Properties.Delimiter = ','
          Properties.EmptySelectionText = 'Todos Compromissos Pendentes'
          Properties.EditValueFormat = cvfIndices
          Properties.Items = <
            item
            end>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 3
          Width = 399
        end
        object lcxPesqGrupo: TcxLookupComboBox
          Left = 413
          Top = 21
          RepositoryItem = dtmLookup.Lista_GrupoAssociadoAtivo
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 4
          Width = 224
        end
        object icxPesqGrau: TcxImageComboBox
          Left = 641
          Top = 21
          EditValue = '-1'
          ParentFont = False
          Properties.Items = <
            item
              Description = 'N'#227'o Associado'
              ImageIndex = 0
              Value = '0'
            end
            item
              Description = 'Quadro de S'#243'cio'
              Value = '1'
            end
            item
              Description = 'Corpo Instrutivo'
              Value = '2'
            end
            item
              Description = 'Corpo do Conselho'
              Value = '3'
            end
            item
              Description = 'Quadro de Mestres'
              Value = '4'
            end
            item
              Description = 'Todos'
              Value = '-1'
            end>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 5
          Width = 121
        end
        object btnPesquisaAgendados: TcxButton
          Left = 767
          Top = 19
          Width = 95
          Height = 22
          Caption = 'Pesquisar'
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
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA3379E
            F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAC20022C9EF5FFFFFFFFFFFFFFFFFFFF
            FFFFFCAA2900000146E6FFFFFFFFFFFFFFFFFFFFFFFCAC290200002FB7FAFFFF
            FFFFFFFFFFFFFFFFF7A31E00000338C1FFFFFFFFFFFFFFEAE0E0E7F1A6210000
            0038BEFFFFFFFFFFFFEFAE5F51515B761F0000002CC2FFFFFFFFFFFFEB7E2139
            7175511100000030B7FFFFFFFFFFFFF68E1672E3F1F2E9AF150130B9FBFFFFFF
            FFFFFEC83571F0FFFFFFFFFFB41382F8FFFFFFFFFFFFFA9D2DC0FEFFFFFFFFFF
            E9535DE6FFFFFFFFFFFFF78B3FD4FFFFFFFFFFFFF27651E0FFFFFFFFFFFFF88E
            39D0FFFFFFFFFFFFF17252E0FFFFFFFFFFFFFCA927AEFDFFFFFFFFFFE23864EB
            FFFFFFFFFFFFFFDF543ECEFDFFFFFEF07222AEFEFFFFFFFFFFFFFFFDB6343FAC
            D1D2BD6F147EF0FFFFFFFFFFFFFFFFFFF8B553233B3D2A378BECFFFFFFFFFFFF
            FFFFFFFFFFFCDEA88F8C9BCAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8FAFE
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisaAgendadosClick
        end
        object cxButton3: TcxButton
          Left = 866
          Top = 19
          Width = 95
          Height = 22
          Hint = 'Limpar Pesquisa'
          Caption = 'Limpar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000B00D0000B00D00000001000000000000000000000101
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
            687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
            68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
            FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
            F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
            FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
            39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton3Click
        end
        object chxCaAgruparGrupo: TcxCheckBox
          Left = 6
          Top = 44
          Caption = 'Agrupar Grupo'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 8
          Transparent = True
          OnClick = chxCaAgruparGrupoClick
          Width = 125
        end
        object chxCaAgruparNome: TcxCheckBox
          Left = 117
          Top = 44
          Caption = 'Agrupar Nome'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = 16384
          StyleFocused.TextColor = 16384
          TabOrder = 9
          Transparent = True
          OnClick = chxCaAgruparNomeClick
          Width = 125
        end
      end
      object gdrCompromissoAgendado: TcxGrid
        Left = 0
        Top = 73
        Width = 1008
        Height = 334
        Align = alClient
        PopupMenu = popExportacao
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          DataController.DataSource = dtsCompromissoAgendado
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              FieldName = 'CALC_VALOR'
              Column = cxGridDBTableValor
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',#0.00'
              Kind = skSum
              FieldName = 'CALC_VALOR'
              Column = cxGridDBTableValor
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          object cxGridDBTableViewCaNome: TcxGridDBColumn
            Caption = 'Associado'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Focusing = False
            Width = 216
          end
          object cxGridDBTableViewCaGrupo: TcxGridDBColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'GRUPO'
            Options.Editing = False
            Options.Focusing = False
            Width = 140
          end
          object cxGridDBTableView2Column1: TcxGridDBColumn
            Caption = 'Compromisso'
            DataBinding.FieldName = 'CONTABIL_CONTA_ID'
            RepositoryItem = dtmLookup.Lista_PlanoContasTodos
            Options.Editing = False
            Options.Focusing = False
            Width = 212
          end
          object cxGridDBTableValor: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'CALC_VALOR'
            Options.Editing = False
            Options.Focusing = False
            Width = 85
          end
          object cxGridDBTableView2Column5: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO_LOCAL'
            RepositoryItem = dtmLookup.Combo_SituacaoCompLocal
            Options.Editing = False
            Options.Focusing = False
            Width = 61
          end
          object cxGridDBTableView2Column6: TcxGridDBColumn
            Caption = 'Per'#237'odo'
            DataBinding.FieldName = 'PERIODO'
            RepositoryItem = dtmLookup.Combo_Periodo
            Options.Editing = False
            Options.Focusing = False
            Width = 82
          end
          object cxGridDBTableView2Column2: TcxGridDBColumn
            Caption = 'Per'#237'odo Inicial'
            DataBinding.FieldName = 'calc_AnoMesInicial'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 112
          end
          object cxGridDBTableView2Column3: TcxGridDBColumn
            Caption = 'Per'#237'odo Final'
            DataBinding.FieldName = 'calc_AnoMesFinal'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 98
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
    end
  end
  object sqlPesquisa1: TI9Query
    OnCalcFields = sqlPesquisa1CalcFields
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM T_COMPROMISSO_VENCIDO'#13#10'WHERE TIPO_OPERACAO = '#39'C'#39#13 +
        #10'ORDER BY DATA_REALIZACAO DESC, ANO_MES_REFERENCIA, CONTABIL_CON' +
        'TA_ID')
    Left = 48
    Top = 284
    object sqlPesquisa1calc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlPesquisa1SITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlPesquisa1LANCAMENTO_COMPROMISSO_ID: TBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1COMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1PESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1VALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlPesquisa1BOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1DIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlPesquisa1VALOR_ORIGEM: TBCDField
      FieldName = 'VALOR_ORIGEM'
      Precision = 20
      Size = 3
    end
    object sqlPesquisa1QTD_ADICIONAL: TBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1ATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlPesquisa1DATA_REALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_REALIZACAO'
    end
    object sqlPesquisa1BALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1ANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlPesquisa1PESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      Size = 120
    end
    object sqlPesquisa1SAIDA_NUMERO: TBCDField
      FieldName = 'SAIDA_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1SAIDA_TIPO: TStringField
      FieldName = 'SAIDA_TIPO'
      Size = 1
    end
    object sqlPesquisa1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 260
    end
    object sqlPesquisa1CENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1PESSOA_CPF: TStringField
      FieldName = 'PESSOA_CPF'
      Size = 15
    end
    object sqlPesquisa1calc_TipoDocumento: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_TipoDocumento'
      Size = 1
      Calculated = True
    end
    object sqlPesquisa1calc_NumeroDocumento: TStringField
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'calc_NumeroDocumento'
      Size = 6
      Calculated = True
    end
    object sqlPesquisa1calc_NaoAssociado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_NaoAssociado'
      Calculated = True
    end
    object sqlPesquisa1PESSOA_RG: TStringField
      FieldName = 'PESSOA_RG'
      Size = 30
    end
    object sqlPesquisa1calc_Descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Descricao'
      Size = 240
      Calculated = True
    end
    object sqlPesquisa1RECIBO_NUMERO: TBCDField
      FieldName = 'RECIBO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1SAIDA_PESSOA_ID: TBCDField
      FieldName = 'SAIDA_PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisa1ANO_MES_REALIZADO: TStringField
      FieldName = 'ANO_MES_REALIZADO'
      Size = 10
    end
    object sqlPesquisa1SAIDA_DOCUMENTO: TStringField
      FieldName = 'SAIDA_DOCUMENTO'
      Size = 30
    end
    object sqlPesquisa1CONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Origin = 'CONTABIL_CONTA_ID'
      Precision = 18
      Size = 2
    end
  end
  object dtsPesquisa1: TDataSource
    DataSet = sqlPesquisa1
    Left = 48
    Top = 316
  end
  object sqlPesquisaDetalhada: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CV.CONTABIL_CONTA_ID, P.NOME, CV.CENTRO_CUSTO_ID,'#13#10'      ' +
        ' CV.BALANCETE_GRUPO_ID, CV.VALOR_ATUAL, CV.ANO_MES_REFERENCIA'#13#10'F' +
        'ROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P'#13#10'   ON C' +
        'V.PESSOA_ID = P.PESSOA_ID'#13#10'WHERE CV.SITUACAO = '#39'1'#39#13#10'  AND P.SITU' +
        'ACAO IN ('#39'1'#39', '#39'3'#39')'#13#10'  AND (CV.DETALHADO = '#39'N'#39' OR CV.DETALHADO IS' +
        ' NULL)'#13#10'ORDER BY P.NOME, CV.CONTABIL_CONTA_ID, CV.ANO_MES_REFERE' +
        'NCIA')
    Left = 88
    Top = 284
    object sqlPesquisaDetalhadaCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisaDetalhadaCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisaDetalhadaBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesquisaDetalhadaVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlPesquisaDetalhadaANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlPesquisaDetalhadaNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dtsPesquisaDetalhada: TDataSource
    DataSet = ClientPesquisaDetalhada
    Left = 216
    Top = 324
  end
  object sqlPesquisaPendenciaSoma: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT SUM(CV.VALOR_ATUAL) AS VALOR_TOTAL, P.NOME'#13#10'FROM T_COMPRO' +
        'MISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P'#13#10'  ON CV.PESSOA_ID =' +
        ' P.PESSOA_ID'#13#10'WHERE P.SITUACAO IN ('#39'1'#39','#39'3'#39')'#13#10'  AND CV.SITUACAO =' +
        ' '#39'1'#39#13#10'  AND CV.PESSOA_ID IN (44,137)'#13#10'GROUP BY P.NOME'#13#10'ORDER BY ' +
        'P.NOME')
    Left = 124
    Top = 284
    object sqlPesquisaPendenciaSomaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 20
      Size = 3
    end
    object sqlPesquisaPendenciaSomaNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dtsPesquisaPendenciaSoma: TDataSource
    DataSet = sqlPesquisaPendenciaSoma
    Left = 124
    Top = 316
  end
  object sqlPesquisaQuitado: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT  NOME'#13#10'FROM  T_PESSOA'#13#10'ORDER BY NOME')
    Left = 160
    Top = 284
    object sqlPesquisaQuitadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dtsPesquisaQuitado: TDataSource
    DataSet = sqlPesquisaQuitado
    Left = 160
    Top = 316
  end
  object ClientPesquisaDetalhada: TClientDataSet
    PersistDataPacket.Data = {
      270100009619E0BD010000001800000006000000000003000000270111434F4E
      544142494C5F434F4E54415F49440C0005000000020008444543494D414C5302
      00020002000557494454480200020014000F43454E54524F5F435553544F5F49
      440C0005000000020008444543494D414C530200020002000557494454480200
      020014001242414C414E434554455F475255504F5F49440C0005000000020008
      444543494D414C530200020002000557494454480200020014000B56414C4F52
      5F415455414C0C0005000000020008444543494D414C53020002000300055749
      44544802000200140012414E4F5F4D45535F5245464552454E43494101004900
      00000100055749445448020002000A00044E4F4D450100490000000100055749
      4454480200020078000000}
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = ClientPesquisaDetalhadaCalcFields
    Left = 216
    Top = 288
    object ClientPesquisaDetalhadaCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientPesquisaDetalhadaCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object ClientPesquisaDetalhadaBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientPesquisaDetalhadaVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object ClientPesquisaDetalhadacalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object ClientPesquisaDetalhadaANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object ClientPesquisaDetalhadaNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object popExportacao: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 297
    Top = 273
    object ExportalExcel1: TMenuItem
      Caption = 'Exportal Excel'
      ImageIndex = 61
      OnClick = ExportalExcel1Click
    end
  end
  object sqlCompromissoAgendado: TI9Query
    OnCalcFields = sqlCompromissoAgendadoCalcFields
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT P.NOME, PG.DESCRICAO AS GRUPO, P.GRAU,'#13#10'       CC.DESCRIC' +
        'AO AS PLANO_CONTA,'#13#10'       CA.VALOR_ATUAL,CA.PERIODO, CA.SITUACA' +
        'O_LOCAL,'#13#10'       CA.SITUACAO_GERAL,'#13#10'       CA.ANO_MES_INICIAL, ' +
        'ANO_MES_FINAL,'#13#10'       CA.CONTABIL_CONTA_ID'#13#10'FROM T_PESSOA P'#13#10'  ' +
        'LEFT OUTER JOIN T_PESSOA_GRUPO PG ON'#13#10'  P.PESSOA_GRUPO_ID = PG.P' +
        'ESSOA_GRUPO_ID'#13#10'  LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA ON'#13#10 +
        '  P.PESSOA_ID = CA.PESSOA_ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_CONTA' +
        ' CC ON'#13#10'  CA.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID'#13#10'WHERE P.S' +
        'ITUACAO = '#39'1'#39#13#10'  AND CA.SITUACAO_LOCAL = '#39'1'#39#13#10'  AND CA.SITUACAO_' +
        'GERAL = '#39'1'#39#13#10'ORDER BY GRUPO, NOME')
    Left = 432
    Top = 264
    object sqlCompromissoAgendadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlCompromissoAgendadoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
    object sqlCompromissoAgendadoGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object sqlCompromissoAgendadoPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 90
    end
    object sqlCompromissoAgendadoVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoAgendadoPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object sqlCompromissoAgendadoANO_MES_INICIAL: TStringField
      FieldName = 'ANO_MES_INICIAL'
      Size = 10
    end
    object sqlCompromissoAgendadoANO_MES_FINAL: TStringField
      FieldName = 'ANO_MES_FINAL'
      Size = 10
    end
    object sqlCompromissoAgendadocalc_AnoMesFinal: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesFinal'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoAgendadocalc_AnoMesInicial: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesInicial'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoAgendadoCALC_VALOR: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR'
      Calculated = True
    end
    object sqlCompromissoAgendadoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoAgendadoSITUACAO_LOCAL: TStringField
      FieldName = 'SITUACAO_LOCAL'
      Size = 1
    end
    object sqlCompromissoAgendadoSITUACAO_GERAL: TStringField
      FieldName = 'SITUACAO_GERAL'
      Size = 1
    end
  end
  object dtsCompromissoAgendado: TDataSource
    DataSet = sqlCompromissoAgendado
    Left = 432
    Top = 320
  end
  object dtsAssociados: TDataSource
    Left = 560
    Top = 312
  end
end