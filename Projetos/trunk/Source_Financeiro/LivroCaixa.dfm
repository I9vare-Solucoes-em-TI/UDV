object frmLivroCaixa: TfrmLivroCaixa
  Left = 0
  Top = 0
  Caption = 'Livro Caixa'
  ClientHeight = 560
  ClientWidth = 1284
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 1284
    Height = 173
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 1284
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object PanelBotoesBasicos: TPanel
        Left = 132
        Top = 0
        Width = 68
        Height = 59
        Align = alLeft
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object cxBtnAlterar: TcxButton
          Left = 0
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Caption = 'Alterar'
          Colors.Default = clWhite
          Enabled = False
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B0000000100000000000000000000DBDB
            DB008A8A8A003333330012121200C5C5C5005E5E5E00B9B9B900FFFFFF00B5B5
            B50008080800A9A9A9001E1E1E00A5A5A500D1D1D100A0A0A0001A1A1A00BDBD
            BD0021212100E6E6E6003D3D3D000C0C0C00CCCCCC0027272700E2E2E200C1C1
            C1001414140039393900AEAEAE00D3D3D30004040400181818000A0A0A00C8C8
            C800BBBBBB000E0E0E001C1C1C00B7B7B700D5D5D500C7C7C700E9E9E9003E3E
            3E00292929000000000000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000080808000000
            0000000000000000000000000002080808080808080606060606060606060606
            0606060606110808080808080808080808080808080808080808080808080808
            080808080810101A0C190808080808080808080808080808080808080800001E
            0B0827160808080808080808080808080808080808000A1C0819150416080808
            080808080808080808080808080A0D08050400000C0E08080808080808080808
            08080808081108211A000000000C0E080808080808080808080808080808190A
            000000000000101608080808080808080808080808080700000000000000000C
            0E08080808080808080808080808081123000000000000000C0E080808080808
            0808080808080808071500000000000000101608080808080808080808080808
            08092000000000000000121D0808080808080808080808080808222300000000
            0000000C0E080808080808080808080808080807150000000000000024160808
            080808080808080808080808092000000000000000121D080808080808080808
            08080808080723000000000000000C0E0808080808080808080808080808070A
            000000000000000C0E0808080808080808080808080808091500000000000000
            171908080808080808080808080808082515000000000000001B080808080808
            080808080808080808090A000000000029010808080808080808080808080808
            080809150000000313080808080808080808080808080808080808071A001428
            08080808080808080808080808080808080808080F2A18080808}
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
          OnClick = cxBtnAlterarClick
        end
      end
      object Panel3: TPanel
        Left = 200
        Top = 0
        Width = 796
        Height = 59
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 50
          Width = 796
          Height = 9
          Align = alBottom
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 796
            Height = 1
            Align = alTop
            Pen.Color = clGray
            ExplicitWidth = 457
          end
        end
        object lcbConta: TcxLookupComboBox
          Left = 0
          Top = 24
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.GridMode = True
          Properties.KeyFieldNames = 'CAIXA_ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dtsCaixa
          Properties.OnEditValueChanged = lcbContaPropertiesEditValueChanged
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 301
        end
        object cxLabel4: TcxLabel
          Left = 0
          Top = 3
          Caption = 'LIVRO CAIXA  -  Op'#231#227'o de Pesquisa'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.Shadow = False
          Style.TextColor = 16384
          Style.TextStyle = [fsBold, fsItalic]
          Style.IsFontAssigned = True
        end
        object lblTipoCaixa: TcxLabel
          Left = 308
          Top = 5
          Caption = 'Tipo do Caixa'
          Style.TextColor = 16384
        end
        object lcxTipoCaixa: TcxImageComboBox
          Left = 307
          Top = 24
          RepositoryItem = dtmLookupFinanceiro.ComboTipoCaixa
          EditValue = '0'
          ParentFont = False
          Properties.Items = <>
          Properties.OnChange = icxTipoCreditoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 4
          Width = 173
        end
        object chxTodos: TcxCheckBox
          Left = 428
          Top = 4
          Caption = 'Todos'
          State = cbsChecked
          TabOrder = 5
          OnClick = chxTodosClick
          Width = 55
        end
      end
      object PanelBotaoFechar: TPanel
        Left = 1215
        Top = 0
        Width = 69
        Height = 59
        Align = alRight
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 2
        object cxBtnFechar: TcxButton
          Left = 4
          Top = 4
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
      end
      object gbxSomaItensSelecionados: TcxGroupBox
        Left = 996
        Top = 0
        Align = alRight
        Alignment = alTopCenter
        BiDiMode = bdRightToLeft
        Caption = 'SOMA ITENS SELECIONADOS'
        ParentBiDiMode = False
        ParentFont = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.Shadow = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Visible = False
        Height = 59
        Width = 219
        object btnAdValor: TSpeedButton
          Left = 194
          Top = 13
          Width = 19
          Height = 21
          Cursor = crHandPoint
          Hint = 'Adicionar Valor'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E7C6A5E7C6A5
            E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6
            A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5D0BF9993AB775293513D
            8B443A8940488C468BA46DCDBC95E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
            E7C6A5B3B78C549A5A40984F7CC18E95D0A595CFA577BD88358C413D873EA9AF
            7FE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5B6B98F539D5F63B377A7DBB486CC9765
            BB7C63B97B85CB97A4D9B357A96A338338A9AF7FE7C6A5E7C6A5E7C6A5D4C29D
            64A66C69B87CA7DBB15FBB765BB97258B76F58B46E57B46E5AB673A4D9B259A9
            6B3E883FCEBC95E7C6A5E7C6A5A2B78A52AA67A9DDB363C0785EBD705FBB76FF
            FFFFFFFFFF58B76F57B46D5BB673A5DAB3378E428AA46DE7C6A5E7C6A573AF7B
            89CC9788D3956AC57962C06F54AA64FFFFFFFFFFFF58B76F58B76F5AB87184CC
            967ABD8C498D47E7C6A5E7C6A569AF7BA8DDB27CCF8974CC80FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF58B76F66BD7C9BD4AA398940E7C6A5E7C6A56CB27E
            B5E2BD8AD59679C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58B76F68C0
            7D9CD4A93D8C45E7C6A5E7C6A57DB787ABDDB5A5DFAE80CB8B7BC9856DBC78FF
            FFFFFFFFFF5AAB695FBB765BB9728AD1987FC491539553E7C6A5E7C6A5ACBF96
            84C796D2EED794D99F89D3937EC888FFFFFFFFFFFF78CD846AC27B6EC77DABDF
            B4449D5694AB79E7C6A5E7C6A5D7C4A17BB989A9DAB6D8F1DC91D89C87CD9283
            CC8D8AD49589D49482D28DAEE0B66AB87C579C5DD1BF9AE7C6A5E7C6A5E7C6A5
            C1C29C74B887AEDCBADCF2E0B5E4BC9ADBA495D99FA4DFAEBFE8C478C189569F
            61B4B88DE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5C1C29C7CB88993CEA3C2E6CBCF
            EBD4C9E9CEAEDDB76CB87E65A76EB7BA90E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
            E7C6A5E7C6A5D7C4A1ADBF967EB7886FB3816CB17D75B17DA4B88CD4C29DE7C6
            A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7
            C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAdValorClick
        end
        object btnDeduzirValor: TSpeedButton
          Left = 194
          Top = 28
          Width = 19
          Height = 21
          Cursor = crHandPoint
          Hint = 'Deduzir Valor'
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
            8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000008C00396BFF000010FF000018FF000018FF000018EF000018E7000018
            DE000018CE000018C6000018BD0000008C00FF00FF00FF00FF00FF00FF00FF00
            FF0000008C0094B5FF004A63FF004A6BFF004A6BFF004A6BFF004A6BF7004A6B
            EF00395AE7003152DE00315ADE0000008C00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
            8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnDeduzirValorClick
        end
        object edtValorSomaSelecionados: TcxCurrencyEdit
          Left = 5
          Top = 17
          Enabled = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          StyleDisabled.TextColor = clBlue
          StyleDisabled.TextStyle = [fsBold]
          TabOrder = 0
          Width = 183
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 132
        Height = 59
        Align = alLeft
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 4
        object cxBtnIncluir: TcxButton
          Left = 4
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Caption = 'Incluir'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B0000000100000000000000000000FFFF
            FF008A8A8A004B4B4B0099999900000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000010101010101
            0101010101010101010101010101010101010101010101010101010200000000
            0002010101010101010101010101010101010102000000000002010101010101
            0101010101010101010101020000000000020101010101010101010101010101
            0101010200000000000201010101010101010101010101010101010200000000
            0002010101010101010101010101010101010102000000000002010101010101
            0101010101010101010101040000000000040101010101010101010102020202
            0202020300000000000302020202020202010101000000000000000000000000
            0000000000000000000101010000000000000000000000000000000000000000
            0001010100000000000000000000000000000000000000000001010100000000
            0000000000000000000000000000000000010101000000000000000000000000
            0000000000000000000101010202020202020203000000000003020202020202
            0201010101010101010101040000000000040101010101010101010101010101
            0101010200000000000201010101010101010101010101010101010200000000
            0002010101010101010101010101010101010102000000000002010101010101
            0101010101010101010101020000000000020101010101010101010101010101
            0101010200000000000201010101010101010101010101010101010200000000
            0002010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101}
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
          OnClick = cxBtnIncluirClick
        end
        object cxBtnExluir: TcxButton
          Left = 68
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Caption = 'Excluir'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B0000000100000000000000000000D3D3
            D300585858002727270099999900FFFFFF0013131300E6E6E6004A4A4A007171
            7100A1A1A10046464600C7C7C70036363600858585006C6C6C00F5F5F5006A6A
            6A000404040020202000D9D9D900F3F3F300666666001C1C1C00E0E0E000F1F1
            F100404040009F9F9F000707070076767600F8F8F8009D9D9D004C4C4C002323
            23002B2B2B00A4A4A40000000000D5D5D500DBDBDB0087878700060606002424
            24004F4F4F000A0A0A0014141400C9C9C9000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000050505050505
            050505050505050505050505050505050505050505100D0E0505050505050505
            05050505100D0E05050505051020002B0A050505050505050505051520002B23
            050505070B000000121B0505050505050505150B000000122705052617000000
            0000040505050505051E08000000000002050505011700000000121F05050505
            150B0000000000090505050505142100000000121B0505150B00000000001105
            050505050505251300000000000A190800000000000F05050505050505050501
            1700000000062200000000000F05050505050505050505051421000000000000
            000000110505050505050505050505050525030000000000001C0F0505050505
            050505050505050505050C0000000000001A0505050505050505050505050505
            05152A0000000000002C1B050505050505050505050505051E08000000000000
            000000040505050505050505050505150B00000000002B00000000121F050505
            050505050505150B00000000001D0C2900000000121B050505050505051E0800
            000000000F050525130000000000040505050505150B00000000000F05050505
            011700000000120A050505070B00000000001105050505050514210000000012
            2705052617000000000F05050505050505052513000000000205050501170000
            0F05050505050505050505011700000905050505051403110505050505050505
            0505050514031105050505050505180505050505050505050505050505180505
            0505050505050505050505050505050505050505050505050505}
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
          OnClick = cxBtnExluirClick
        end
      end
    end
    object pgcFiltro: TcxPageControl
      Left = 0
      Top = 59
      Width = 1284
      Height = 114
      Align = alClient
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Properties.ActivePage = tbcFiltro
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 6
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Black'
      ClientRectBottom = 114
      ClientRectRight = 1284
      ClientRectTop = 24
      object tbcFiltro: TcxTabSheet
        Hint = 'Filtro de Pesquisa'
        Caption = 'Pesquisa'
        Color = clBtnFace
        ImageIndex = 0
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        object pnlDadosFiltro: TPanel
          Left = 0
          Top = 0
          Width = 1284
          Height = 90
          Align = alClient
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object pnlDadosFiltroPersonalizado: TPanel
            Left = 0
            Top = 0
            Width = 1284
            Height = 49
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object pnlPesquisaPersonalizada: TPanel
              Left = 0
              Top = 0
              Width = 1284
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object cxLabel3: TcxLabel
                Left = 122
                Top = 22
                Caption = 'a'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object cxLabel6: TcxLabel
                Left = 255
                Top = 3
                Caption = 'Compromisso'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object cxLabel5: TcxLabel
                Left = 610
                Top = 3
                Caption = 'Balancete Grupo'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object edtDataInicial: TcxDateEdit
                Left = 9
                Top = 20
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 3
                Width = 110
              end
              object edtDataFinal: TcxDateEdit
                Left = 136
                Top = 20
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 4
                Width = 110
              end
              object lcxPesqCompromisso: TcxLookupComboBox
                Left = 251
                Top = 20
                RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxPesqCompromissoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 5
                Width = 353
              end
              object lcxBalanceteGrupo: TcxLookupComboBox
                Left = 610
                Top = 19
                RepositoryItem = dtmLookupContabil.Lista_BalanceteGrupoDescricao
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxBalanceteGrupoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 6
                Width = 212
              end
              object cxLabel7: TcxLabel
                Left = 828
                Top = 3
                Caption = 'Reserva/Provis'#227'o'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object lcxReserva: TcxLookupComboBox
                Left = 828
                Top = 18
                RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxBalanceteGrupoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 8
                Width = 217
              end
              object lcxCentroCusto: TcxLookupComboBox
                Left = 1049
                Top = 18
                RepositoryItem = dtmLookupContabil.Lista_CentroCustoAtivo
                ParentFont = False
                Properties.ListColumns = <>
                Properties.OnChange = lcxCentroCustoPropertiesChange
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 9
                Width = 217
              end
              object cxLabel8: TcxLabel
                Left = 1051
                Top = 3
                Caption = 'Centro de Custo'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object rdbDataLancamento: TcxRadioButton
                Left = 113
                Top = 4
                Width = 119
                Height = 17
                Hint = #201' a Data que Registrou no Sistema'
                Caption = 'Data Lan'#231'amento'
                TabOrder = 11
                OnClick = rdbDataRegistroClick
                Transparent = True
              end
              object rdbDataRegistro: TcxRadioButton
                Left = 10
                Top = 4
                Width = 97
                Height = 17
                Hint = #201' a Data do Pagamento~/Recebimento do Item'
                Caption = 'Data Pag/Recb.'
                Checked = True
                TabOrder = 12
                TabStop = True
                OnClick = rdbDataRegistroClick
                Transparent = True
              end
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 49
            Width = 1284
            Height = 41
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object cxLabel2: TcxLabel
              Left = 9
              Top = -3
              Caption = 
                'Busca R'#225'pida (Favorecido, Hist'#243'rico, Associado)    Tipo da  Oper' +
                'a'#231#227'o                               Ordena'#231#227'o'
              Style.TextColor = 16384
              Style.TextStyle = [fsUnderline]
              Transparent = True
            end
            object edtBuscaRapida: TcxTextEdit
              Left = 9
              Top = 15
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 1
              OnKeyDown = edtBuscaRapidaKeyDown
              Width = 237
            end
            object icxTipoCredito: TcxImageComboBox
              Left = 252
              Top = 15
              EditValue = '0'
              ParentFont = False
              Properties.Items = <
                item
                  Description = 'Todas'
                  ImageIndex = 4
                  Value = 0
                end
                item
                  Description = 'Somente Receitas'
                  ImageIndex = 1
                  Value = 1
                end
                item
                  Description = 'Somente Despesas'
                  ImageIndex = 2
                  Value = 2
                end
                item
                  Description = 'Somente Aporte/Ret./Transf.'
                  Value = 3
                end>
              Properties.OnChange = icxTipoCreditoPropertiesChange
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 2
              Width = 173
            end
            object cbxOrganizar: TcxComboBox
              Left = 431
              Top = 15
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'Extrato Crescente'
                'Extrato Decrescente')
              Properties.OnChange = cbxOrganizarPropertiesChange
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 3
              Width = 173
            end
            object btnPesquisar: TcxButton
              Left = 612
              Top = 13
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
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnPesquisarClick
            end
            object btnLimpar: TcxButton
              Left = 711
              Top = 13
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
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnLimparClick
            end
            object cxButton3: TcxButton
              Left = 810
              Top = 13
              Width = 95
              Height = 22
              Hint = 'Atualizar Dados'
              Caption = 'Atualizar'
              Colors.Default = clWhite
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              TabOrder = 6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = cxButton3Click
            end
            object btnRelatorio: TcxButton
              Left = 908
              Top = 13
              Width = 95
              Height = 22
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
              TabOrder = 7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnRelatorioClick
            end
          end
        end
      end
    end
    object rdbPesquisaSimplificada: TcxRadioButton
      Left = 77
      Top = 60
      Width = 89
      Height = 17
      Cursor = crHandPoint
      Caption = 'Simplificada'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = rdbPesquisaSimplificadaClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = ''
      Transparent = True
    end
    object rdbPesquisaPersonalizada: TcxRadioButton
      Left = 172
      Top = 59
      Width = 100
      Height = 17
      Cursor = crHandPoint
      Caption = 'Personalizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = rdbPesquisaPersonalizadaClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = ''
      Transparent = True
    end
    object chxVerificarVinculos: TcxCheckBox
      Left = 271
      Top = 56
      Caption = 'Verificar Registros sem Vinculo de Provis'#227'o'
      TabOrder = 4
      Transparent = True
      Visible = False
      Width = 227
    end
  end
  object tabOpcoes: TcxTabControl
    Left = 0
    Top = 195
    Width = 1284
    Height = 365
    Align = alClient
    TabOrder = 1
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      'Movimenta'#231#227'o'
      'Comprovantes Digitalizados')
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    OnChange = tabOpcoesChange
    ClientRectBottom = 361
    ClientRectLeft = 4
    ClientRectRight = 1280
    ClientRectTop = 28
    object pgcDados: TcxPageControl
      Left = 4
      Top = 28
      Width = 1276
      Height = 333
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 333
      ClientRectRight = 1276
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'Pag1 - Movimenta'#231#227'o'
        ImageIndex = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object tbcPeriodo: TcxTabControl
          Left = 0
          Top = 0
          Width = 1249
          Height = 309
          Align = alClient
          TabOrder = 0
          Properties.CustomButtons.Buttons = <>
          Properties.TabIndex = 0
          Properties.Tabs.Strings = (
            'Mes/Ano')
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          OnChange = tbcPeriodoChange
          ClientRectBottom = 305
          ClientRectLeft = 4
          ClientRectRight = 1245
          ClientRectTop = 28
          object pnlOpcoes: TPanel
            Left = 4
            Top = 28
            Width = 1241
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object pnlCancelarComprovante: TPanel
              Left = 497
              Top = 0
              Width = 120
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 0
              Visible = False
              object Image7: TImage
                Left = 6
                Top = 3
                Width = 20
                Height = 20
                Picture.Data = {
                  0954474946496D6167654749463839610E000E00D52000EA0004C9C9C9D3D3D3
                  CB000AD9D9D9E90004CECECEF9FCFE919191CDCDCD959595999999E16C71F7FB
                  FEFAFDFFFAFCFEF8FCFEE89397F586888E8E8EF6FBFEF0B7BADADADAC5C5C5E6
                  E6E6E4E4E4DFDFDF595959FBFDFF252525464646808080FFFFFF000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000021F90401000020002C
                  000000000E000E0085EA0004C9C9C9D3D3D3CB000AD9D9D9E90004CECECEF9FC
                  FE919191CDCDCD959595999999E16C71F7FBFEFAFDFFFAFCFEF8FCFEE89397F5
                  86888E8E8EF6FBFEF0B7BADADADAC5C5C5E6E6E6E4E4E4DFDFDF595959FBFDFF
                  252525464646808080FFFFFF0000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000065D409050F8F90C8FC7CD06644412374568B149C46C30
                  566C7138ED162FD40F674CE67CC05C4766CD3E871F9AB8DCCD3D102C848567CF
                  DF7F2002810A1E15110C03881D1F0D090606081E12050000938A140199131D9C
                  9D9C5E5E4EA248410021F90401000020002C000000000E000E0085EA0004C9C9
                  C9D3D3D3CB000AD9D9D9E90004CECECEF9FCFE919191CDCDCD959595999999E1
                  6C71F7FBFEFAFDFFFAFCFEF8FCFEE89397F586888E8E8EF6FBFEF0B7BADADADA
                  C5C5C5E6E6E6E4E4E4DFDFDF595959FBFDFF252525464646808080FFFFFF0000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000065D409050
                  F8F90C8FC7CD06644412374568B149C46C30566C7138ED162FD40F674CE67CC0
                  5C4766CD3E871F9AB8DCCD3D102C848567CFDF7F2002810A1E15110C03881D1F
                  0D090606081E12050000938A140199131D9C9D9C5E5E4EA248410021F9040100
                  0020002C000000000E000E0085EA0004C9C9C9D3D3D3CB000AD9D9D9E90004CE
                  CECEF9FCFE919191CDCDCD959595999999E16C71F7FBFEFAFDFFFAFCFEF8FCFE
                  E89397F586888E8E8EF6FBFEF0B7BADADADAC5C5C5E6E6E6E4E4E4DFDFDF5959
                  59FBFDFF252525464646808080FFFFFF00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000065D409050F8F90C8FC7CD06644412374568B1
                  49C46C30566C7138ED162FD40F674CE67CC05C4766CD3E871F9AB8DCCD3D102C
                  848567CFDF7F2002810A1E15110C03881D1F0D090606081E12050000938A1401
                  99131D9C9D9C5E5E4EA248410021F90401000020002C000000000E000E0085EA
                  0004C9C9C9D3D3D3CB000AD9D9D9E90004CECECEF9FCFE919191CDCDCD959595
                  999999E16C71F7FBFEFAFDFFFAFCFEF8FCFEE89397F586888E8E8EF6FBFEF0B7
                  BADADADAC5C5C5E6E6E6E4E4E4DFDFDF595959FBFDFF252525464646808080FF
                  FFFF000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000006
                  5D409050F8F90C8FC7CD06644412374568B149C46C30566C7138ED162FD40F67
                  4CE67CC05C4766CD3E871F9AB8DCCD3D102C848567CFDF7F2002810A1E15110C
                  03881D1F0D090606081E12050000938A140199131D9C9D9C5E5E4EA24841003B}
                Transparent = True
              end
              object lblCancelarComprovante: TcxLabel
                Left = 32
                Top = 4
                Cursor = crHandPoint
                Caption = 'Cancelar Recibo'
                Style.HotTrack = True
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clGreen
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.TextColor = clBlue
                Transparent = True
                OnClick = lblCancelarComprovanteClick
              end
            end
            object pnlRecibo: TPanel
              Left = 387
              Top = 0
              Width = 110
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 1
              Visible = False
              object Image3: TImage
                Left = 11
                Top = 3
                Width = 20
                Height = 20
                Picture.Data = {
                  07544269746D6170E6040000424DE60400000000000036000000280000001400
                  0000140000000100180000000000B0040000120B0000120B0000000000000000
                  0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC
                  A3A3A35D5D5D6C6C6C6464646363636363636363636363636363636363636363
                  63636363696969666666797979E1E1E1FFFFFFFFFFFFFFFFFFA7A7A747474718
                  1818101010000000000000000000000000000000000000000000000000000000
                  060606171717141414ABABABFFFFFFFFFFFFFFFFFF9D9D9D3F3F3F0D0D0D2727
                  27C5C5C5D8D8D8CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCE8E8E87A7A7A00
                  0000141414A0A0A0FFFFFFFFFFFFFFFFFFC6C6C66464641515152828288F8F8F
                  9C9C9C949494949494949494949494949494949494A7A7A75D5D5D0404041E1E
                  1ECCCCCCFFFFFFFFFFFFFFFFFFE1E1E18282822222221C1C1C01010100000000
                  00000000000000000000000000000000000000000707071A1A1A383838E8E8E8
                  FFFFFFFFFFFFFFFFFFFCFCFCA6A6A62020202020202222221E1E1E1717171717
                  171818181818181818181A1A1A1313130404041616165C5C5CFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFC2C2C22222222222222222222323231F1F1F191919191919
                  1A1A1A1A1A1A141414282828565656202020777777FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE0E0E02323232323232323232323232525252222221B1B1B1B1B1B1C
                  1C1C090909464646D5D5D52F2F2F979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF4444442525252525252525252525252727272424241E1E1E1B1B1B1C1C
                  1C1F1F1F2424241D1D1DC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
                  DEDE959595A5A5A5ACACACAAAAAAAAAAAAABABABAAAAAAAAAAAAAAAAAAAAAAAA
                  959595BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
                  FC8787876B6B6B7474747474747474747575757474747373735C5C5CA9A9A9FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5343434
                  3232325858585A5A5A5858585858585D5D5D5353532929296D6D6DFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F93A3A3A3636366A
                  6A6A6C6C6C6969696969696F6F6F6161612D2D2D787878FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F93939393B3B3B7F7F7F8282
                  827E7E7E7E7E7E8686867474742E2E2E777777FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F43737373636365959595B5B5B595959
                  5959595D5D5D5454542F2F2F717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFCFCFC9696967D7D7D7F7F7F7E7E7E7F7F7F7F7F7F7E
                  7E7E808080777777B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                Transparent = True
              end
              object btnEmitirRecibo: TcxLabel
                Left = 35
                Top = 4
                Cursor = crHandPoint
                Caption = 'Emitir Recibo'
                Style.HotTrack = True
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clGreen
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.TextColor = clBlue
                Transparent = True
                OnClick = btnEmitirReciboClick
              end
            end
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 387
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 2
              object cbxTipoDoc: TcxComboBox
                Left = 5
                Top = 2
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  'Todos Tipo. Doc'
                  'Doc. Fiscal'
                  'Recibo Sistema'
                  'Recibo Externo'
                  'Extrato Banc'#225'rio'
                  'Transfer'#234'ncia Banc'#225'ria'
                  'Recibo de Entrada'
                  'Boleto Banc'#225'rio'
                  'Doc Pendente')
                Properties.OnChange = cbxTipoDocPropertiesChange
                Style.BorderStyle = ebsSingle
                TabOrder = 0
                Text = 'Todos Tipo. Doc'
                Width = 180
              end
              object rdbEmitirTodos: TcxRadioButton
                Left = 191
                Top = 6
                Width = 54
                Height = 17
                Caption = 'Todos'
                Checked = True
                TabOrder = 1
                TabStop = True
                OnClick = cbxTipoDocPropertiesChange
              end
              object rdbEmitirConfirmado: TcxRadioButton
                Left = 251
                Top = 6
                Width = 54
                Height = 17
                Caption = 'Emitido'
                TabOrder = 2
                OnClick = cbxTipoDocPropertiesChange
              end
              object rdbEmitirPendente: TcxRadioButton
                Left = 311
                Top = 6
                Width = 77
                Height = 17
                Caption = 'N'#227'o Emitido'
                TabOrder = 3
                OnClick = cbxTipoDocPropertiesChange
              end
            end
            object pnlAgrupar: TPanel
              Left = 617
              Top = 0
              Width = 160
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 3
              Visible = False
              object Image1: TImage
                Left = 8
                Top = 3
                Width = 20
                Height = 20
                Picture.Data = {
                  0954474946496D6167654749463839610E000E00D52600FCF05BF7D31DF8D827
                  FFFD6FFFFFA6FDF668FDF363F9E23DF9DD32F6CF14FFFFA2FBEC52FBE748FFFE
                  92FFFE7FFDF463FFFD74FFFE99FFFD70FFFE9EF5CC0DFFFE86FAE748FFFD79FA
                  FCFEFAFDFFFCEB52FFFE8CF5CB0CFCF463C5C5C5DFDFDFE6E6E6E4E4E4595959
                  FBFDFF8080809C410FFFFFFF0000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000021F90401000026002C
                  000000000E000E0085FCF05BF7D31DF8D827FFFD6FFFFFA6FDF668FDF363F9E2
                  3DF9DD32F6CF14FFFFA2FBEC52FBE748FFFE92FFFE7FFDF463FFFD74FFFE99FF
                  FD70FFFE9EF5CC0DFFFE86FAE748FFFD79FAFCFEFAFDFFFCEB52FFFE8CF5CB0C
                  FCF463C5C5C5DFDFDFE6E6E6E4E4E4595959FBFDFF8080809C410FFFFFFF0000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000006694093706822918848A148544C0A492263D4781C9240
                  2210566BB452BF244FB5382A9B47E163A944CA84DEF0B4A93420613E78FC5A3C
                  97ACFF7F0A6C730310170E151B0D11131D042573140901020807160B0006058F
                  251C9395070C1A9A05907380800FA74E426B43410021F90401000026002C0000
                  00000E000E0085FCF05BF7D31DF8D827FFFD6FFFFFA6FDF668FDF363F9E23DF9
                  DD32F6CF14FFFFA2FBEC52FBE748FFFE92FFFE7FFDF463FFFD74FFFE99FFFD70
                  FFFE9EF5CC0DFFFE86FAE748FFFD79FAFCFEFAFDFFFCEB52FFFE8CF5CB0CFCF4
                  63C5C5C5DFDFDFE6E6E6E4E4E4595959FBFDFF8080809C410FFFFFFF00000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000006694093706822918848A148544C0A492263D4781C92402210
                  566BB452BF244FB5382A9B47E163A944CA84DEF0B4A93420613E78FC5A3C97AC
                  FF7F0A6C730310170E151B0D11131D042573140901020807160B0006058F251C
                  9395070C1A9A05907380800FA74E426B43410021F90401000026002C00000000
                  0E000E0085FCF05BF7D31DF8D827FFFD6FFFFFA6FDF668FDF363F9E23DF9DD32
                  F6CF14FFFFA2FBEC52FBE748FFFE92FFFE7FFDF463FFFD74FFFE99FFFD70FFFE
                  9EF5CC0DFFFE86FAE748FFFD79FAFCFEFAFDFFFCEB52FFFE8CF5CB0CFCF463C5
                  C5C5DFDFDFE6E6E6E4E4E4595959FBFDFF8080809C410FFFFFFF000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000006694093706822918848A148544C0A492263D4781C92402210566B
                  B452BF244FB5382A9B47E163A944CA84DEF0B4A93420613E78FC5A3C97ACFF7F
                  0A6C730310170E151B0D11131D042573140901020807160B0006058F251C9395
                  070C1A9A05907380800FA74E426B43410021F90401000026002C000000000E00
                  0E0085FCF05BF7D31DF8D827FFFD6FFFFFA6FDF668FDF363F9E23DF9DD32F6CF
                  14FFFFA2FBEC52FBE748FFFE92FFFE7FFDF463FFFD74FFFE99FFFD70FFFE9EF5
                  CC0DFFFE86FAE748FFFD79FAFCFEFAFDFFFCEB52FFFE8CF5CB0CFCF463C5C5C5
                  DFDFDFE6E6E6E4E4E4595959FBFDFF8080809C410FFFFFFF0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000006694093706822918848A148544C0A492263D4781C92402210566BB452
                  BF244FB5382A9B47E163A944CA84DEF0B4A93420613E78FC5A3C97ACFF7F0A6C
                  730310170E151B0D11131D042573140901020807160B0006058F251C9395070C
                  1A9A05907380800FA74E426B4341003B}
                Transparent = True
              end
              object lblAgrupar: TcxLabel
                Left = 34
                Top = 5
                Cursor = crHandPoint
                Caption = 'Agrupar'
                Style.HotTrack = True
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clGreen
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.TextColor = clBlue
                Transparent = True
              end
            end
          end
          object pgcVisualizacao: TcxPageControl
            Left = 4
            Top = 53
            Width = 1241
            Height = 252
            Align = alClient
            TabOrder = 1
            Properties.ActivePage = tabVisualizacaoDetalhada
            Properties.CustomButtons.Buttons = <>
            OnChange = pgcVisualizacaoChange
            ClientRectBottom = 252
            ClientRectRight = 1241
            ClientRectTop = 24
            object tabVisualizacaoDetalhada: TcxTabSheet
              Caption = 'Visualiza'#231#227'o Detalhada'
              ImageIndex = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object grdBasica: TcxGrid
                Left = 0
                Top = 0
                Width = 1241
                Height = 228
                Align = alClient
                Images = ImageList1
                PopupMenu = popExportacao
                TabOrder = 0
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridPesquisa: TcxGridDBTableView
                  OnDblClick = cxGridPesquisaDblClick
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
                  FilterBox.Visible = fvNever
                  OnSelectionChanged = cxGridPesquisaSelectionChanged
                  DataController.DataSource = dtsLivroCaixa
                  DataController.Filter.Active = True
                  DataController.MultiThreadedOptions.Sorting = bFalse
                  DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDespesa'
                      Column = cxGridBasicaDBValorDespesa
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorDespesa'
                      Column = cxGridBasicaDBValorDespesa
                    end
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorReceita'
                      Column = cxGridBasicaDBValorReceita
                    end
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorMovimento'
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = 'Nenhum Dado Encontrado'
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  OptionsView.Indicator = True
                  OptionsView.ShowColumnFilterButtons = sfbAlways
                  Preview.Column = cxGridPesquisaObservacao
                  Preview.Visible = True
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  OnColumnPosChanged = cxGridPesquisaColumnPosChanged
                  OnColumnSizeChanged = cxGridPesquisaColumnSizeChanged
                  object cxGridBasicaDBCodigo: TcxGridDBColumn
                    Caption = 'C'#243'digo'
                    DataBinding.FieldName = 'LIVRO_CAIXA_ID'
                    Options.Filtering = False
                    Width = 36
                  end
                  object cxGridPesquisaImagemVinculada: TcxGridDBColumn
                    DataBinding.FieldName = 'calc_ImagemVinculada'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = ImageList1
                    Properties.Items = <
                      item
                        ImageIndex = 14
                        Value = '1'
                      end
                      item
                        Value = '2'
                      end
                      item
                        ImageIndex = 17
                        Value = '3'
                      end>
                    HeaderImageIndex = 12
                    Options.Filtering = False
                    Width = 20
                    IsCaptionAssigned = True
                  end
                  object cxGridBasicaDBDataPag: TcxGridDBColumn
                    Caption = 'Data'
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.SaveTime = False
                    Options.Editing = False
                    Options.Grouping = False
                    SortIndex = 0
                    SortOrder = soAscending
                    Width = 37
                  end
                  object cxGridPesquisaBalanceteGrupo: TcxGridDBColumn
                    DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                    RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                    Width = 23
                    IsCaptionAssigned = True
                  end
                  object cxGridBasicaDBPlanoConta: TcxGridDBColumn
                    Caption = 'Compromisso'
                    DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
                    Options.Editing = False
                    Options.Grouping = False
                    Width = 99
                  end
                  object cxGridPesquisaHistorico: TcxGridDBColumn
                    Caption = 'Hist'#243'rico'
                    DataBinding.FieldName = 'HISTORICO'
                    Width = 157
                  end
                  object cxGridBasicaDBTipoConta: TcxGridDBColumn
                    Caption = 'Caixa'
                    DataBinding.FieldName = 'CAIXA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_CaixaResumo
                    Options.Editing = False
                    Width = 70
                  end
                  object cxGridPesquisaDocTipo: TcxGridDBColumn
                    Caption = 'Doc. Tipo'
                    DataBinding.FieldName = 'DOC_TIPO'
                    RepositoryItem = dtmLookupContabil.Combo_DocumentoTipo
                    Width = 63
                  end
                  object cxGridPesquisaIdentificador: TcxGridDBColumn
                    Caption = 'Id R/C'
                    DataBinding.FieldName = 'calc_Identificador'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Width = 48
                  end
                  object cxGridPesquisaDocNumero: TcxGridDBColumn
                    Caption = 'N'#186' Doc'
                    DataBinding.FieldName = 'DOCUMENTO_NUMERO'
                    Width = 63
                  end
                  object cxGridBasicaDBFavorecido: TcxGridDBColumn
                    Caption = 'Pessoa (Cliente, Favorecido...)'
                    DataBinding.FieldName = 'CALC_PESSOA'
                    Options.Editing = False
                    Options.Grouping = False
                    Width = 108
                  end
                  object cxGridPesquisaObservacao: TcxGridDBColumn
                    Caption = 'Detalhes'
                    DataBinding.FieldName = 'CALC_OBSERVACAO'
                    Width = 75
                  end
                  object cxGridBasicaDBOperacao: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 3
                        Value = 'R'
                      end
                      item
                        ImageIndex = 4
                        Value = 'D'
                      end
                      item
                        ImageIndex = 44
                        Value = 'TR'
                      end
                      item
                        ImageIndex = 44
                        Value = 'TD'
                      end
                      item
                        ImageIndex = 53
                        Value = 'AD'
                      end
                      item
                        ImageIndex = 53
                        Value = 'AR'
                      end>
                    RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
                    HeaderImageIndex = 17
                    Options.Editing = False
                    Options.Filtering = False
                    Width = 28
                    IsCaptionAssigned = True
                  end
                  object cxGridBasicaDBValorReceita: TcxGridDBColumn
                    Caption = 'Entradas'
                    DataBinding.FieldName = 'calc_ValorReceita'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00;(,0.00)'
                    Options.Editing = False
                    Options.Filtering = False
                    Width = 59
                  end
                  object cxGridBasicaDBValorDespesa: TcxGridDBColumn
                    Caption = 'Sa'#237'das'
                    DataBinding.FieldName = 'calc_ValorDespesa'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00;(,0.00)'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Grouping = False
                    Width = 55
                  end
                  object cxGridPesquisadbOperacao: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 4
                        Value = 'D'
                      end
                      item
                        ImageIndex = 4
                        Value = 'AD'
                      end
                      item
                        ImageIndex = 4
                        Value = 'TD'
                      end
                      item
                        ImageIndex = 3
                        Value = 'R'
                      end
                      item
                        ImageIndex = 3
                        Value = 'AR'
                      end
                      item
                        ImageIndex = 3
                        Value = 'TR'
                      end>
                    HeaderImageIndex = 16
                    Width = 28
                    IsCaptionAssigned = True
                  end
                  object cxGridPesquisaIndiceImagem: TcxGridDBColumn
                    DataBinding.FieldName = 'INDICE_IMAGEM'
                    Visible = False
                  end
                  object cxGridPesquisaNumeroIdentificador: TcxGridDBColumn
                    DataBinding.FieldName = 'IDENTIFICACAO_ID'
                    Visible = False
                  end
                  object cxGridPesquisaColumn1: TcxGridDBColumn
                    Caption = 'Esp'#233'cie'
                    DataBinding.FieldName = 'ESPECIE'
                    RepositoryItem = dtmLookupContabil.ComboEspeciePagamento
                    Width = 48
                  end
                end
                object grdBasicaLevel1: TcxGridLevel
                  GridView = cxGridPesquisa
                end
              end
            end
            object tabVisualizacaoSimplificada: TcxTabSheet
              Caption = 'Visualiza'#231#227'o Simplificada - Contador'
              ImageIndex = 1
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object grdSimplificada: TcxGrid
                Left = 0
                Top = 0
                Width = 1241
                Height = 228
                Align = alClient
                Images = ImageList1
                PopupMenu = popExportacao
                TabOrder = 0
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView1: TcxGridDBTableView
                  OnDblClick = cxGridDBTableView1DblClick
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
                  FilterBox.Visible = fvNever
                  OnSelectionChanged = cxGridDBTableView1SelectionChanged
                  DataController.DataSource = dtsCaixaSimplificado
                  DataController.Filter.Active = True
                  DataController.MultiThreadedOptions.Sorting = bFalse
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorDespesa'
                      Column = cxGridDBTableView1DESPESA
                    end
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorReceita'
                      Column = cxGridDBTableView1RECEITA
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnFiltering = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  OptionsView.Indicator = True
                  Preview.Column = cxGridDBTableView1Column6
                  Preview.Visible = True
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  OnColumnPosChanged = cxGridPesquisaColumnPosChanged
                  OnColumnSizeChanged = cxGridPesquisaColumnSizeChanged
                  object cxGridDBTableView1Column9: TcxGridDBColumn
                    Caption = 'Ordem'
                    DataBinding.FieldName = 'CALC_ORDEM'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 29
                  end
                  object cxGridDBTableView1Column10: TcxGridDBColumn
                    Caption = 'Cod. '
                    DataBinding.FieldName = 'ORDEM'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 28
                  end
                  object cxGridDBTableView1Column7: TcxGridDBColumn
                    DataBinding.FieldName = 'SITUACAO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 5
                        Value = 'F'
                      end>
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 20
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView1Column1: TcxGridDBColumn
                    Caption = 'Data Pagamento'
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    Options.Editing = False
                    Options.Focusing = False
                    SortIndex = 0
                    SortOrder = soAscending
                    Width = 78
                  end
                  object cxGridDBTableView1Column2: TcxGridDBColumn
                    Caption = 'Conta'
                    DataBinding.FieldName = 'CAIXA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_CaixaResumo
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 48
                  end
                  object cxGridDBTableView1Column3: TcxGridDBColumn
                    Caption = 'Nome Favorecido/Associado'
                    DataBinding.FieldName = 'NOME_PESSOA'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 212
                  end
                  object cxGridDBTableView1Column4: TcxGridDBColumn
                    Caption = 'Hist'#243'rico'
                    DataBinding.FieldName = 'HISTORICO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 163
                  end
                  object cxGridDBTableView1Column14: TcxGridDBColumn
                    Caption = 'Refer'#234'ncia'
                    DataBinding.FieldName = 'REFERENCIA'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 65
                  end
                  object cxGridDBTableView1Column15: TcxGridDBColumn
                    Caption = 'Doc. Tipo'
                    DataBinding.FieldName = 'DOC_TIPO'
                    RepositoryItem = dtmLookupContabil.Combo_DocTipoLista
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 96
                  end
                  object cxGridDBTableView1Column13: TcxGridDBColumn
                    Caption = 'Doc. Numero'
                    DataBinding.FieldName = 'DOCUMENTO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 107
                  end
                  object cxGridDBTableView1Column12: TcxGridDBColumn
                    Caption = 'Qtd Itens'
                    DataBinding.FieldName = 'QTD'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 53
                  end
                  object cxGridDBTableView1Column5: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 24
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView1RECEITA: TcxGridDBColumn
                    Caption = 'Entradas'
                    DataBinding.FieldName = 'calc_ValorReceita'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 82
                  end
                  object cxGridDBTableView1DESPESA: TcxGridDBColumn
                    Caption = 'Sa'#237'das'
                    DataBinding.FieldName = 'calc_ValorDespesa'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 82
                  end
                  object cxGridDBTableView1operacao: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 4
                        Value = 'D'
                      end
                      item
                        ImageIndex = 4
                        Value = 'AD'
                      end
                      item
                        ImageIndex = 4
                        Value = 'TD'
                      end
                      item
                        ImageIndex = 3
                        Value = 'R'
                      end
                      item
                        ImageIndex = 3
                        Value = 'AR'
                      end
                      item
                        ImageIndex = 3
                        Value = 'TR'
                      end>
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 24
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView1Column8: TcxGridDBColumn
                    Caption = 'Saldo'
                    DataBinding.FieldName = 'CALC_SALDO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 100
                  end
                  object cxGridDBTableView1Column6: TcxGridDBColumn
                    DataBinding.FieldName = 'CALC_OBSERVACAO'
                    Options.Editing = False
                    Options.Focusing = False
                  end
                end
                object cxGridLevel1: TcxGridLevel
                  GridView = cxGridDBTableView1
                end
              end
            end
            object cxTabSheet3: TcxTabSheet
              Caption = 'Transferencia de Provis'#227'o'
              ImageIndex = 2
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object cxGrid1: TcxGrid
                Left = 0
                Top = 0
                Width = 1241
                Height = 228
                Align = alClient
                Images = ImageList1
                PopupMenu = popExportacao
                TabOrder = 0
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView2: TcxGridDBTableView
                  OnDblClick = cxGridPesquisaDblClick
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
                  FilterBox.Visible = fvNever
                  OnSelectionChanged = cxGridPesquisaSelectionChanged
                  DataController.DataSource = dtsTransfProvisao
                  DataController.Filter.Active = True
                  DataController.MultiThreadedOptions.Sorting = bFalse
                  DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDespesa'
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorDespesa'
                    end
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorReceita'
                    end
                    item
                      Format = ',#0.00'
                      Kind = skSum
                      FieldName = 'calc_ValorMovimento'
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = 'Nenhum Dado Encontrado'
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  OptionsView.Indicator = True
                  OptionsView.ShowColumnFilterButtons = sfbAlways
                  Preview.Visible = True
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  OnColumnPosChanged = cxGridPesquisaColumnPosChanged
                  OnColumnSizeChanged = cxGridPesquisaColumnSizeChanged
                  object cxGridDBTableView2Column1: TcxGridDBColumn
                    Caption = 'Data'
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 100
                  end
                  object cxGridDBTableView2Column2: TcxGridDBColumn
                    Caption = 'Hist'#243'rico'
                    DataBinding.FieldName = 'HISTORICO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 392
                  end
                  object cxGridDBTableView2Column3: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 57
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView2Column4: TcxGridDBColumn
                    Caption = 'Provis'#227'o'
                    DataBinding.FieldName = 'RESERVA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 515
                  end
                  object cxGridDBTableView2Column5: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'VALOR'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 163
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView2
                end
              end
            end
          end
        end
        object pnlOrdenacao: TPanel
          Left = 1249
          Top = 0
          Width = 27
          Height = 309
          Align = alRight
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 1
          object imgOrdenarAvancar: TcxImage
            Left = 1
            Top = 71
            Cursor = crHandPoint
            Hint = 'Avan'#231'ar Registro'
            Picture.Data = {
              0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
              000000200806000000737A7AF40000000467414D410000D6D8D44F5832000000
              1974455874536F6674776172650041646F626520496D616765526561647971C9
              653C00000469494441545847C5967F4C556518C7117FE22DD244918659905C05
              D4896BEA72260BAA912DD34646C104457E4C253540A6161928A215D7EC07E1D2
              1406529BADE93492DF4354544010101011D43615456EF6EFD3F37DEF7B8FE92E
              F09EC31FBDDB771CCE79BF9FEF73CEFB9EE75C2722FA5F35D870668D648D628D
              D62978E005C3D018CE322D4FADA7A1080CC9D23586B170171E4B3FADA5A6CE7F
              A8E1DA43AABBFA902EB4FE4DE7AE58E94C9395AA1AFBA8F2521F95D53DA0E28B
              BD5474BE974E9EBB4FC7CFDCA7DF4FDF2378C1902C309507268F65BDF8F6960B
              54CFC17B0A6FE916BC604896EE02F0E85E0AD95C43E75BAD029859709332F26F
              D08EBC6EFA22B79B3E3FD4459FFD7C9DB61DE8A42D3F7552CAFE6B949CD3A115
              002F189265AC803712CF52353F6E0055C213B3AF6A05C00B8664192B20685335
              5536F409A04AF8A61F1E15002F189265AC80C08FABA8A4B6570055C2377CD7AE
              15002F189265AC8045EB2AE98F1A5B012AE1EBF7B56905C00B8664192BE095F8
              723AC6AF15802AE16BBF69D50A80170CC9D255001AC753AC69F3634AE9B7AA1E
              0154098FB75CD10A80170CC91AB019A13A4C40EB44D318C31ACF9AFE727431FD
              526E2B40253C36EB5101F082215960F6DB9E47F887E6BD1910F52739527EC91D
              0154095FF3558B56802316347345C1EB9CA93D11DCBDCB049F10F3ACF0E33776
              E6B5D3AF153D5458769783EF52DEA9DB74A8E8B600AA84AFFEB2592BE04925EC
              6D26CEE89EE8FB2EF6059E86D817A20096E7E4399161019145947AB0D3214025
              3C6A7793432F98607BCC8D0EE52C7796560006D66502CBF785E0DD9685712594
              9EDB6533F2CE57BD7384AFCC6CA2888CCBF4D1CE4631070CB0C0647616679859
              E3588F6D4A54824D329935DB6B49CE89254955C29C79E4A6587BBDE1ABF6348B
              D60D06586082CDC2DD3BFC3A6267E2ABE539C6CD2FD06B697EDBEA5DF50200D0
              C6EFD5C3C3F96F3AB76D78C1000B4CB06546BF3F52F0589E66798D9FB122C21C
              7AD49A9C6DEB6CDB0F7729857F90DE205E5778E005032C30257BC07E8081FDF0
              2C6B86DBDC0D297E61C7B4FD80A5182C1C4F0973E181170CB02413EC4107D606
              6B348935D37D7156E1A2B862018512BE6DEB373C9ACFDBE7C1032F1892A5EB57
              11D608AFE673AC00F7E0836DCB52AA057817FF2841014F867FB8A351DB74980B
              0FBC920196EE1FA730A0874F1D39CE1CE4169C6B5D6FB1BDE3F82AFE37FCFDB4
              06DACEE7700D7330171E78254377B87D8C603DC3F2314D8F5CEB117284D20E5F
              1741493F7668E19FF02B8A73B88639980B8FF482617860CDD0B1DC58FEA6395B
              F7FABC77548441B15FB7500C6F48FBFFB8660AD86AE1B97ED2F358B7333A0040
              9312FBC1342FAB32685DA908C49ADBD71DE74CF32D153C07CD060D0D9E2187DB
              87B61F9C5DA7BDE6B220FBAFB0D41AEDCE71CCE76E39BBFA28351BA3036BE9CA
              F21E3EE59D08D7570F5837EE6B2108C738C7D7949B8D9181C7A935296773429A
              E75B0504E118E7E435A5666374A0083494892C5F27EFD844211CDBCEE96A3646
              87BD087CBE9F97C2B1817027A77F0167C04E61105F02AE0000000049454E44AE
              426082}
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Transparent = True
            OnClick = imgOrdenarAvancarClick
            Height = 46
            Width = 24
          end
          object imgOrdenarVoltar: TcxImage
            Left = 1
            Top = 19
            Cursor = crHandPoint
            Hint = 'Voltar Registro'
            Picture.Data = {
              0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
              000000200806000000737A7AF40000000467414D410000D6D8D44F5832000000
              1974455874536F6674776172650041646F626520496D616765526561647971C9
              653C00000480494441545847BD967F4CD47518C7493BA14CCDAD5680AD9B85B8
              61216E95A3132426A5E74826CE0185D4A8219231740C66EA1C3F14F40C12D014
              9418DC9191F1237E947A8C6A142D3439300802EE54C01FD925AE7F9F9EF7C70F
              5F0ACFF1BD437CB6377CF7BDE779BD9FEFE7FBF93C776E538C87A41E78CC6069
              D6ED688D84702DEF3D908091877EFBD984E4A26E82708D7BF2B3690D2CB7BB2E
              B638283AF3577B47FF289DEF1BA528BED66D2A09E2CF66C99C690980353EBAF7
              B4FAB436DBE9F61BD4DE7B9B7EEE1EA5AF7FBA4E7CCFEA1B94F02CE73C2CB2A7
              21009E1796D2D298573540AD5DB768FFE75784CCE7FFA67DA67E0ADBF65D03E7
              CC61CD44C1FD0CBCDBD9215B9A723F3CD4495D83FF50FEA96136BD4C7B8D9729
              EFCB61D1D0E683160A49FA2607B9B2E6BE0496DEE3E598136F86A7B79165E036
              15D58E504EE515CAAAB84419E536D14441F5309D39F717AD4D6B23E4A246D64E
              290098E5B73AC37FE5D6EFED2D176E52C5D9EB94CBCB3E66BEA7CC46BB3FB38A
              D52869B84A26F30821D76F4DA63FD7E2784EA909BCF7F9BACD664B51F520D5FD
              7853BCF389E63B4F0CD247C707456365DF5EA33DA5BDA44B345BB8769E64B814
              D848735E896F30A51EEEA21F3A6FD181934394CDCB3DD17C079BA7170F88FFC8
              31F22AC5669DA3E5F18D26663C26594E0536D0234BA38C491B76B651CB05BBD8
              6858E67B99A71DEBA7D4A3FDB4ABD44A862F86E858FD08E9535B6969B429092C
              C954157867EEBE6B0CC1C15B9AED75ADD7E8481D36DDE4E6DB8FFC412987FB44
              CEC75543B4CF68A55713CC765FBD219899AA861412344FFBBFA50D886BB295D4
              DBA8FCCC9D4D97597E49957972512F2517F65236EF1334F141FE456296D53360
              93AA212586CD92E8EAC66D051D54DB2A379D13E65B0B7A29E9D0EF7CDD278E2A
              F6C4C6DDBFD00B3135930EA999EBDEC9F45E1C69DABF3AA5854EB7DBC513E049
              9C354FCCEFA184BC1E711F0D404189CDB438B2F29E434A6C3AED2A43C4B2B826
              6A68FB933EF96A58291E935AF389755056858DFC631B49FB7A7E387BDD35A434
              9E81E92FFA6CA8B17F5A6BA5E2FAAB0E216A9FDC512D9452D8438BD8C34BB76B
              097B2AFB019D787887E4463CB7BE9A1CA9B2F98600A8317FFF60B762E888052D
              08356054BB4B6FF107E774012B8085EFF5D758AB586BB511A7C47403508D79BC
              E137A501D482215960AE6061447BB294061098D98FB3D0C442960FCB8F15F84C
              78150F953BAF448DF9BB07C61B402D18920526D85EACB9ACFF1D49748226B039
              1E65617C3EC9F2F3D29FA4C29A110154631E977B516900B56048169860C303E6
              CAD3FF37701312DF032C9FA7DEA814C7114035E6B1395D4A03A80543B2C01CE3
              4F1A48C2797DFE8930A3025463FEF6DE4E251FB56048962AE3B1501A981F5AAE
              00D598C7648F37805A3024CBB506E6AE2C53806ACCA3B22C4A3E6AC1902CD71A
              98BDA25401AA31DF98D1A1E4A3160CC972AD018FC0E30AD059A1160CC972AD01
              CDF262877035422D1892E5740338B30B67BC7494A6223024CBE9063030BC59CB
              58F84583511AAA52C8450D6AC170E9273AA615462600780A2CA533420D6AEF1A
              BBE3E1E6F62F3801FE6AB956898F0000000049454E44AE426082}
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = True
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 1
            Transparent = True
            OnClick = imgOrdenarVoltarClick
            Height = 46
            Width = 24
          end
          object imgImprimirRelSimplificado: TcxImage
            Left = 0
            Top = 123
            Cursor = crHandPoint
            Hint = 'Imprimir Relat'#243'rio Simplificado - Contador'
            ParentShowHint = False
            Picture.Data = {
              07544269746D61709E050000424D9E0500000000000036040000280000001200
              000012000000010008000000000068010000120B0000120B0000000100000000
              000000000000D3D3D300626262001D1D1D00FFFFFF009595950051515100A4A4
              A40013131300DEDEDE0081818100E2E2E200C0C0C0007E7E7E0025252500B5B5
              B500B2B2B20004040400EDEDED0029292900DBDBDB009F9F9F00525252006E6E
              6E005D5D5D002222220084848400E9E9E900999999002C2C2C00161616002020
              2000DFDFDF00F0F0F00000000000070707000000000000000000000000000000
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
              0000040418000000000000000000000000000002000004041B130D1A0A0A0A0A
              0A0A0A1A0D1E1321000004040F16200404040404040404042008160F23230404
              0000060109141414141414010600000000000404000000030E19191919191903
              0000000000000404000000000000000000000000000000002323040400000000
              000000000000000000000000000004040E1D001F130E0E0E0E0E0E1F001E1D0E
              00000404140B230C201414141414140C230A0B14232304040404111B04040404
              0404041B1115040400000404040400140404040404040414001C040400000404
              0404001404040404040404140005040423230404040400140404040404040414
              0005040400000404040400140404040404040414001C04040000040404041117
              1A0A0A0A0A0A0A17110704042323040404040000000000000000000000100404
              0000040404040404040404040404040404040404000004040404040404040404
              04040404040404042323}
            ShowHint = True
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = True
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 2
            Transparent = True
            Visible = False
            OnClick = imgImprimirRelSimplificadoClick
            Height = 46
            Width = 24
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Pag2 - Digitaliza'#231#227'o'
        ImageIndex = 1
        inline fmeImagem1: TfmeImagem
          Left = 0
          Top = 0
          Width = 1276
          Height = 309
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 1276
          ExplicitHeight = 309
          inherited Panel1: TPanel
            Width = 1035
            Height = 246
            ExplicitWidth = 1035
            ExplicitHeight = 246
            inherited ImageView: TImageEnView
              Width = 1033
              Height = 244
              ExplicitTop = 0
              ExplicitWidth = 1033
              ExplicitHeight = 244
            end
          end
          inherited sbxPropriedades: TScrollBox
            Left = 1035
            Height = 246
            ExplicitLeft = 1035
            ExplicitHeight = 246
            inherited cxLabel1: TcxLabel
              ExplicitWidth = 220
              AnchorX = 110
            end
          end
          inherited StatusBar1: TStatusBar
            Top = 290
            Width = 1276
            ExplicitTop = 290
            ExplicitWidth = 1276
          end
          inherited BarManager: TdxBarManager
            DockControlHeights = (
              0
              0
              44
              0)
          end
        end
      end
    end
  end
  object dxBarManager1: TdxBarManager
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clDefault
    ImageOptions.Images = dtmControles.imgCadBasicos
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Coffee'
    PopupMenuLinks = <>
    ShowHelpButton = True
    UseSystemFont = False
    Left = 616
    Top = 204
    DockControlHeights = (
      0
      0
      22
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Barra de Op'#231#245'es'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 481
      FloatTop = 208
      FloatClientWidth = 400
      FloatClientHeight = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStaticSaldoAtual'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStaticSaldoPeriodo'
        end
        item
          Visible = True
          ItemName = 'dxBarStaticSaldoAnterior'
        end>
      OldName = 'Custom 1'
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      SizeGrip = False
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Opc'#245'es'
      Category = 0
      Visible = ivAlways
      ImageIndex = 41
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarAjusteSaldo'
        end
        item
          Visible = True
          ItemName = 'dxBarEstornar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarFechaMovimento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarDuplicar'
        end
        item
          Visible = True
          ItemName = 'dxBarLancamentoMaisUsados'
        end>
    end
    object dxBarProgressSaldoPeriodo: TdxBarProgressItem
      Align = iaRight
      Caption = 'Saldo do Periodo R$ 0,00'
      Category = 0
      Hint = 'Saldo do Periodo R$ 0,00'
      Visible = ivAlways
      Alignment = taRightJustify
      BorderStyle = sbsNone
      ImageIndex = 53
      Width = 400
      Color = clBtnFace
      Max = 0
      Step = 0
    end
    object dxBarProgressReceber: TdxBarProgressItem
      Align = iaRight
      Caption = 'Recebimentos R$ 0,00'
      Category = 0
      Hint = 'Recebimentos R$ 0,00'
      Visible = ivAlways
      Alignment = taRightJustify
      BorderStyle = sbsNone
      ImageIndex = 3
      Width = 230
      Color = clGreen
      Position = 50
      Smooth = True
    end
    object dxBarProgressSaldo: TdxBarProgressItem
      Align = iaRight
      Caption = 'Saldo Atual  R$ 0,00'
      Category = 0
      Hint = 'Saldo Atual  R$ 0,00'
      Visible = ivAlways
      BorderStyle = sbsNone
      ImageIndex = 53
      Width = 300
      Color = clNavy
      Position = 20
      Smooth = True
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Transferir Valor de Conta'
      Category = 0
      Hint = 'Transferir Valor de Conta'
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Mostrar Colunas'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarPlanoConta'
        end
        item
          Visible = True
          ItemName = 'dxBarHistorico'
        end
        item
          Visible = True
          ItemName = 'dxBarSaldo'
        end
        item
          Visible = True
          ItemName = 'dxBarUsuario'
        end>
    end
    object dxBarHistorico: TdxBarButton
      Caption = 'Historico'
      Category = 0
      Hint = 'Historico'
      Visible = ivAlways
      CloseSubMenuOnClick = False
      ImageIndex = 6
    end
    object dxBarSaldo: TdxBarButton
      Caption = 'Saldo'
      Category = 0
      Hint = 'Saldo'
      Visible = ivAlways
      AllowAllUp = True
      CloseSubMenuOnClick = False
      DropDownEnabled = False
      ImageIndex = 6
    end
    object dxBarPlanoConta: TdxBarButton
      Caption = 'Grupo do Plano de Contas'
      Category = 0
      Hint = 'Grupo do Plano de Conta'
      Visible = ivAlways
      CloseSubMenuOnClick = False
    end
    object dxBarLancamentoMaisUsados: TdxBarButton
      Caption = 'Adicionar em Lan'#231'amentos Preferidos'
      Category = 0
      Enabled = False
      Hint = 'Adicionar em Lan'#231'amentos Preferidos'
      Visible = ivAlways
    end
    object dxBarAjusteSaldo: TdxBarButton
      Caption = 'Ajuste Saldo'
      Category = 0
      Enabled = False
      Hint = 'Ajuste Saldo'
      Visible = ivAlways
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'Setar Lan'#231'amento'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarAtivado'
        end
        item
          Visible = True
          ItemName = 'dxBarCancelado'
        end
        item
          Visible = True
          ItemName = 'dxBarCompensado'
        end>
    end
    object dxBarCancelado: TdxBarButton
      Caption = 'Cancelado'
      Category = 0
      Hint = 'Cancelado'
      Visible = ivAlways
      ImageIndex = 46
    end
    object dxBarAtivado: TdxBarButton
      Caption = 'Ativado'
      Category = 0
      Hint = 'Ativado'
      Visible = ivAlways
      ImageIndex = 2
    end
    object dxBarEstornar: TdxBarButton
      Caption = 'Estornar Lan'#231'amento'
      Category = 0
      Hint = 'Estornar Lan'#231'amento'
      Visible = ivAlways
      OnClick = dxBarEstornarClick
    end
    object dxBarCompensado: TdxBarButton
      Caption = 'Compensado'
      Category = 0
      Hint = 'Compensado'
      Visible = ivAlways
      ImageIndex = 45
      ShortCut = 116
    end
    object dxBarUsuario: TdxBarButton
      Caption = 'Usu'#225'rio'
      Category = 0
      Hint = 'Usu'#225'rio'
      Visible = ivAlways
      CloseSubMenuOnClick = False
      DropDownEnabled = False
    end
    object dxBarFechaMovimento: TdxBarButton
      Caption = 'Fechamento de Movimenta'#231#227'o'
      Category = 0
      Enabled = False
      Hint = 'Fechamento de Movimenta'#231#227'o'
      Visible = ivAlways
    end
    object dxBarDuplicar: TdxBarButton
      Caption = 'Duplicar Movimenta'#231#227'o'
      Category = 0
      Enabled = False
      Hint = 'Duplicar Movimenta'#231#227'o'
      Visible = ivAlways
    end
    object dxBarProgressSaldoAnterior: TdxBarProgressItem
      Caption = 'Saldo Anterior'
      Category = 0
      Hint = 'Saldo Anterior'
      Visible = ivAlways
      BorderStyle = sbsNone
      ImageIndex = 59
      Color = clBlack
    end
    object dxBarStaticSaldoPeriodo: TdxBarStatic
      Caption = 'Saldo do Periodo R$ 0,00'
      Category = 0
      Hint = 'Saldo do Periodo R$ 0,00'
      Visible = ivAlways
      ImageIndex = 58
    end
    object dxBarStaticSaldoAnterior: TdxBarStatic
      Align = iaRight
      Caption = 'Saldo M'#234's Anterior R$ 0,00'
      Category = 0
      Hint = 'Saldo M'#234's Anterior R$ 0,00'
      Visible = ivAlways
      ImageIndex = 60
    end
    object dxBarStaticSaldoAtual: TdxBarStatic
      Caption = 'Saldo Atual R$ 0,00'
      Category = 0
      Hint = 'Saldo Atual R$ 0,00'
      Visible = ivAlways
      ImageIndex = 53
    end
  end
  object dtsLivroCaixa: TDataSource
    DataSet = sqlLivroCaixa
    Left = 360
    Top = 326
  end
  object dtsCaixa: TDataSource
    DataSet = ClientCaixa
    Left = 360
    Top = 376
  end
  object ClientCaixa: TClientDataSet
    PersistDataPacket.Data = {
      B60000009619E0BD010000001800000006000000000003000000B60008434149
      58415F49440400010000000000095052494E434950414C010049000000010005
      57494454480200020001000556414C4F52080004000000010007535542545950
      450200490006004D6F6E65790009504553534F415F4944040001000000000009
      44455343524943414F0100490000000100055749445448020002003C00065245
      53554D4F0100490000000100055749445448020002001E000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'CAIXA_ID'
        DataType = ftInteger
      end
      item
        Name = 'PRINCIPAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PESSOA_ID'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RESUMO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 279
    Top = 376
    object ClientCaixaCAIXA_ID: TIntegerField
      FieldName = 'CAIXA_ID'
    end
    object ClientCaixaPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientCaixaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientCaixaPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object ClientCaixaDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientCaixaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
  end
  object ImageList1: TImageList
    Left = 432
    Top = 340
    Bitmap = {
      494C010112001500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F600FDFDFD00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF0F0F000FBFBFB00F5F5F500FFFFFFFF2D2D2D000000
      00000707070069696900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E70033BB81007C988C00F9F9F900FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000007D7D7D00FFFFFFFF070707000D0D0D00FFFF
      FFFF909090000000000069696900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDDDDDD000FCE73002DE48C0000DF7600519C7700F2F2
      F200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAAAAAA00000000002F2F2F0070707000000000009F9F9F00FFFF
      FFFFCFCFCF009696960000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD0D0D0004AA7E1000DD76C00EEFEF800A4F4CB0000D4630027AC
      6300E6E6E600FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7D7D7D000000000000000000393939006060600000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBBBBBB0066B8FE003198EB00BDFFE600C3FFE800AAFFDF0080F7C40000C9
      4E000EB94D00D6D6D600FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF8181
      81000000000000000000A5A5A500FFFFFFFFB6B6B600000000001A1A1A00FFFF
      FFFF96969600000000003D3D3D00FFFFFFFFFFFFFFFFFFFFFFFFFDFDFD00A1A4
      A60057ABFF004A9BFF009CE8FF007CDFE10089FFD30078FFCD0057FFC20038FC
      B60003BD390002B93200C3C3C300FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC00EAEAEA00DDDDDD00000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9007B899C002382
      FF004C95FF005EB1FF0074C4FF0081CFFF005ECAD8003AFFB9001BFFB10000FC
      A60005F49B000DB4280000AD1500C0C1C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEAEAEA00424242000F0F0F00000000001C1C1C00727272006767
      670086868600E0E0E000FFFFFFFFFFFFFFFFF1F1F1004D6DA200005FF0004285
      F6001276FE00388FFF0063ABFF005FB5E90044FDBA0048FCB90048F9B40049F5
      AF0034EF9F000CE6850011AE1900679867000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB2B2B2000000000000000000000000000E0E0E001A1A1A00BABABA00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2850AB000045D5002B67E2001B68
      EC004E8AF6004F8FFC00658ABD006AF5BA006AF6BB006AF5B9006AF3B60062EF
      AE006BEDAC006BE9A50067E39C0078A882000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFD5D5
      D5002D2D2D000000000065656500E9E9E900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1438B6001544C7005C7EDE005E85
      E5005E8BEB009A878B00F6B96300D8B1450088F1BE0081F0B900F6C74A00FFCA
      4D0073E49B008AE8B00072BE9100FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFD0D0
      D00028282800000000007D7D7D00FDFDFD00FEFEFE00A4A4A400000000000000
      0000BABABA00FFFFFFFFFFFFFFFFFFFFFFFF4C5EBA007385D1007086D7006D88
      DD009C6F6D00ECAB7100F0B16C00F3B66800F0B25200FBBD5800FDC35C00FFC5
      5800FFC65200AFC9B600FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9C9C9C000000000000000000000000000101010001010100000000006363
      6300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE007681C5008390D1008091
      D6007E92DA00976E7600EAAB7700EDAF7200F0B26E00F3B66A00F5B96600F8B9
      5D00D7D6D400FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB6B6B60000000000000000000000000000000000B0B0B000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777DB700939B
      D100919CD400909CD700766E9600E8AA7C00EAAC7800ECAE7400EEB06F00E184
      3000D07E2900DDDDDD00FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000929292009292920000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8283
      AB00A2A5D0009598B400FFFFFFFFF2F2F200E4A47D00E7A97E00E9AA7900EAAA
      7500DD7C2B00B4784B00FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE8E8EA00FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE00DD957300E4A58400E4A4
      7F00E5A27800C8BAB000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2866E00D685
      6200FDFDFD00FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A34040098300000000000000000000000000000CC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FF000000000000000000000000E8BBBBFFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FFE8BBBBFF000000000000000000000000000000000000
      0000CC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000098300000AA501F0098300000000000000000000000000000CC6666FFE19C
      8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C
      8CFFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFF3F3FFFFF0
      F1FFFFEEEEFFFFEBECFFFFE8E8FFFFE6E5FFFFE2E3FFFFE0E0FFFFDDDDFFFFDB
      DAFFFFD8D8FFFFD5D5FFCC6666FF000000000000000000000000000000000000
      0000CC6666FFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C8CFFE19C
      8CFFE19C8CFFE19C8CFFE19C8CFFCC6666FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009533
      0500C0794900CC7E470098300000000000000000000000000000CC6666FFEDC8
      C8FFFFFAF4FFFFF7ECFFFFF4E2FFFFF0D9FFFFEDD0FFFFE9C7FFFFE6BFFFFFE4
      B9FFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFF6F6FFFFF3
      F3FFFFF1F1FFFFEEEEFFFFEBEBFFFFE8E8FFFFE6E6FFFFE3E2FFFFDFE0FFFFDD
      DDFFFFDBDAFFFFD8D7FFCC6666FF000000000000000000000000000000000000
      0000CC6666FFEDC8C8FFFFFCF7FFFFF9F0FFFFF6E7FFFFF3DEFFFFEED5FFFFEB
      CCFFFFE8C3FFFFE5BBFFE19C8CFFCC6666FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000096360700BE80
      5300EFB375009830000000000000000000000000000000000000CC6666FFEDC8
      C8FFFFFCF7FFFFF9F0FFFFF6E7FFFFF3DEFFFFEED5FFFFEBCCFFFFE8C3FFFFE5
      BBFFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFF8F8FFFFF6
      F6FFFFF3F4FFFFF0F1FFFFEEEEFFFFEBECFFFFE9E8FFFFE5E6FFFFE2E3FFFFE0
      E0FFFFDDDDFFFFDADAFFCC6666FF000000000000000000000000000000000000
      0000CC6666FFEDC8C8FFFFFDFAFFFFFAF4FFFFF8ECFFFFF4E3FFFFF0D9FFFFED
      D1FFFFEAC7FFFFE6BFFFE19C8CFFCC6666FF205E0000205E0000205E0000205E
      0000205E0000205E0000205E0000205E0000265C000094340000A0603A00EDB0
      6F00A7450A004845000019490000184500000000000000000000CC6666FFEDC8
      C8FFFFFDFAFFFFFAF4FFFFF8ECFFFFF4E3FFFFF0D9FFFFEDD1FFFFEAC7FFFFE6
      BFFFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFBFAFFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFFFDDDDFFCC6666FF000000000000000000000000000000000000
      0000CC6666FFEDC8C8FFFFFEFCFFFFFCF7FFFFF9EFFFFFF6E7FFFFF3DEFFFFEE
      D5FFFFEBCCFFFFE8C3FFE19C8CFFCC6666FF205E000038D3710037D1700036CF
      6C0036CF640038D1620086E0A500FFFFFF0097380900A0603A00F0B27400DA84
      2E00A85A2F00B3AEAC00AEAEAE00184600000000000000000000CC6666FFEDC8
      C8FFFFFEFCFFFFFCF7FFFFF9EFFFFFF6E7FFFFF3DEFFFFEED5FFFFEBCCFFFFE8
      C3FFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFCFCFFCC66
      66FFF8BF7EFFF8C07FFFF8BF7EFFF8BF7EFF688B8EFF688B8EFFF8BF7FFFF8BF
      7EFFCC6666FFFFE0E0FFCC6666FF000000000000000000000000000000000000
      0000CC6666FFEDC8C8FFFFFFFFFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
      B2FFB2B2B2FFFFE9C7FFE19C8CFFCC6666FF205E00001CB5390022BA440031C9
      620034CC690033CB6700BFEFCF00DBB6A800A0603A00EFB27300DD862D009D39
      0500A49A9500A8A8A800BCBCBC001C5200000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFFFE9
      C7FFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFDFDFFCC66
      66FFC7BCAEFFE8B87EFFE1BC90FFEDB673FFA3DECEFF51ADBBFFF3B76CFFF3B6
      6CFFCC6666FFFFE2E2FFCC6666FF000000000000000000000000000000000000
      00008A5151FF8D7E7EFFFFFFFFFFFFFEFDFFFFFCF7FFFFF9F0FFFFF6E7FFFFF3
      DFFFFFEFD5FFFFEBCCFFE19C8CFFCC6666FF205E000000970000009600000CA5
      180032C9640079DD9C00FDFEFD00A0431800EEAC6B00DD862E00A94300009D71
      5E00A5A5A500B9B9B900DBDBDB001F5B00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFEFDFFFFFCF7FFFFF9F0FFFFF6E7FFFFF3DFFFFFEFD5FFFFEB
      CCFFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFD4DBE8FFCBD0D8FFD6D9E2FFD0A673FF999468FF8DA863FFD5AA52FFEEAD
      57FFCC6666FFFFE6E6FFCC6666FF00000000000000000000000000000000E1AD
      7CFFCB6D17FFA36F4BFF959595FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
      B2FFB2B2B2FFFFEDD0FFE19C8CFFCC6666FF205E0000009A0000009900000096
      00008FDCA100F2F7F900A7B5BB0089604B00D57A2800963A0F009E766500A9A9
      A900BEBEBE00DDDDDD00F6F6F600205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFFFED
      D0FFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFDAC7C5FFEEDCCFFFEBC085FF898273FF4BA1C9FF77E7C2FF55A441FFE8A2
      42FFCC6666FFFFE8E8FFCC6666FF00000000000000000000000000000000CB6D
      17FFFFAC0AFFCB6D17FF888888FFFFFFFFFFFFFEFCFFFFFCF7FFEDC8C8FFEDC8
      C8FFEDC8C8FFEDC8C8FFE19C8CFFCC6666FF205E0000009A00000097000039AF
      44004590B7001979B000665D5A00B6B5AE00665D5A00AC9C9500B7B7B700CACA
      CA00E4E4E400F7F7F700FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFFFFFFFFFEFCFFFFFCF7FFEDC8C8FFEDC8C8FFEDC8C8FFEDC8
      C8FFE19C8CFFCC6666FF000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFD7A56BFFE5A13EFFE2A13EFF164998FF71C5FFFF9FFFFAFF2FBA5BFFE399
      2DFFCC6666FFFFEBEBFFCC6666FF00000000000000000000000000000000CB6D
      17FFFFAC0AFFCB6D17FF888888FF888888FF959595FFFFFDFAFFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FF205E000000980000009D1000298E
      A8002C94C9004DB4FD004C91D60048769500A6ABAC00CECECE00E1E1E100F0F0
      F000FCFCFC00FEFEFE00FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FF000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFDE8F1AFFDE901BFFD38F21FF18468DFF6DBDFFFF9BFFF5FF2BB756FFDE8F
      1AFFCC6666FFFFEEEFFFCC6666FF00000000E1AD7CFFCB6D17FFCB6D17FFCB6D
      17FFFFAC0AFFCB6D17FFCB6D17FFCB6D17FFA9825DFFC7C7C6FFCC6666FFDC91
      28FFDC9128FFDC9128FFCC6666FF00000000205E000025A31900B1D188002B8C
      B60051B9ED0053BAFF001C80B7005B8DA800D4D4D400F1F1F100FBFBFB00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFCC6666FFDC9128FFDC9128FFDC91
      28FFCC6666FF00000000000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFDA880BFFDA890BFFD9880BFF756749FF4793B8FF69D7A7FF609829FFDA88
      0BFFCC6666FFFFF1F1FFCC6666FF00000000CB6D17FFFFF172FFFFE651FFFFE6
      51FFFFD117FFFFAC0AFFFFAC0AFFFFAC0AFFCB6D17FF959595FFCC6666FFEABE
      84FFE5AE65FFCC6666FF0000000000000000205E0000F7E3B100FFE5BD00398B
      B00041A9DD001C80B700568CA900CECFCF00F0F0F000FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666FFEABE84FFE5AE65FFCC66
      66FF0000000000000000000000000000000000000000CC6666FFFFFFFFFFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFFFF3F3FFCC6666FF00000000E1AD7CFFCB6D17FFCB6D17FFCB6D
      17FFFFE651FFCB6D17FFCB6D17FFCB6D17FFE2AD7DFFFFFFFFFFCC6666FFEABE
      84FFCC6666FF000000000000000000000000205E0000FDE6BB00FCE1B300C3C4
      AB002480AE001C80B70099ADAF00EEEEEE00FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666FFEABE84FFCC6666FF0000
      00000000000000000000000000000000000000000000CC6666FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFCFCFFFFFA
      FAFFFFF8F8FFFFF6F6FFCC6666FF00000000000000000000000000000000CB6D
      17FFFFE651FFCB6D17FF827676FFEDC8C8FFEDC8C8FFEDC8C8FFCC6666FFCC66
      66FF00000000000000000000000000000000205E0000FDF2BD00FDE8B800FCE7
      B700F2DDB000E6D1A500EFEAD700FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00205E00000000000000000000CC6666FFEDC8
      C8FFEDC8C8FFEDC8C8FFEDC8C8FFEDC8C8FFCC6666FFCC6666FF000000000000
      00000000000000000000000000000000000000000000CC6666FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFC
      FCFFFFFAFAFFFFF8F8FFCC6666FF00000000000000000000000000000000CB6D
      17FFFFF172FFCB6D17FF695C5CFFCC6666FFCC6666FFCC6666FFCC6666FF0000
      000000000000000000000000000000000000205E0000205E0000205E0000205E
      0000205E0000205D0000205D0000205E0000205E0000205E0000205E0000205E
      0000205E0000205E0000205E0000205E00000000000000000000CC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FF00000000000000000000
      00000000000000000000000000000000000000000000E8BBBBFFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FFE8BBBBFF00000000000000000000000000000000E1AD
      7CFFCB6D17FFE1AD7CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052AD5200317B3900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000036343400363434003634
      3400363434003634340036343400363434003634340036343400363434003634
      3400363434003634340036343400000000000000000000000000000000000000
      000000000000004B8200004B8200004B8200004B8200004B8200004B8200004B
      8200004B8200004B8200004B8200004B82000000000000000000000000000000
      00000000000042944A0039844200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003939D600424ADE00424ADE00424AD6003942D6003942D6003139D6002129
      D6002929D600000000000000000000000000000000003B393900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003B39390000000000000000000000000093655E009F6F
      60009F6F6000004B820000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF00004B82000000000000000000000000000000
      00004AA5520063AD6B0063AD6300398C420031843900317B310029733100216B
      290021632100215A210000000000000000000000000000000000000000003942
      D600636BE7008C94FF008494FF007B8CFF007B8CFF007B8CF7007B8CF700525A
      DE002129CE0000000000000000000000000000000000403E3E00FFFFFF00E4E3
      E100E4E3E100E4E3E100E4E3E100E4E3E100E4E3E100E4E3E100E4E3E100E4E3
      E100E4E3E100FFFFFF00403E3E0000000000000000000000000097675F00FAE5
      C600F2D7B500004B820000BDFF00676767006767670067676700676767006767
      6700676767006767670000BDFF00004B82000000000000000000000000005AB5
      630073BD7B0094D69C0094CE9C008CCE94008CCE940084C68C007BBD840063AD
      6B004A94520021632100186321000000000000000000000000004A52DE006B73
      E70094A5FF005A73FF00314AFF00294AFF00294AFF002142FF00425AFF008494
      F700525ADE002129CE0000000000000000000000000046444300FFFFFF00E7E6
      E400E7E6E400E7E6E400E7E6E400E7E6E400E7E6E400E7E6E400E7E6E400E7E6
      E400E7E6E400FFFFFF00464443000000000000000000000000009C6B6200FCEA
      D000F3DCBF00004B820000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF00004B82000000000000000000000000005ABD
      6B007BC684009CD6A5009CD6A50094D69C0094CE9C008CCE940084CE8C007BC6
      84007BC684005AA56300216B2900215A2100000000005A63DE007B84E7009CAD
      FF006384FF00395AFF00395AFF00395AFF003152FF00314AFF002142FF004A63
      FF008C94F700525ADE002931D60000000000000000004B494700FFFFFF00E9E8
      E700BABAB900BABAB900BABAB900BABAB900BABAB900BABAB900E9E8E700E9E8
      E700E9E8E700FFFFFF004B494700000000000000000000000000A1706400FEF0
      DD00D5812700004B8200004B8200004B8200004B8200004B8200004B8200004B
      8200004B8200004B8200004B8200004B82000000000000000000000000000000
      000063BD6B007BC6840073C6840052AD5A004AA552004A9C520063AD6B0084C6
      8C0084CE8C0084C68C004A945200216B2900000000006B73E700A5B5FF00738C
      FF004A6BFF004A6BFF004A6BFF004263FF00425AFF00395AFF003152FF00294A
      FF004A63FF008494FF003942D6000000000000000000504E4C00FFFFFF00EBEA
      E900EBEAE900EBEAE900EBEAE900EBEAE900EBEAE900EBEAE900EBEAE900EBEA
      E900EBEAE900FFFFFF00504E4C00000000000000000000000000A7756600FFF6
      E700F7E6D300F6E1C900F3DCBF00F2D7B200F0D1A900EECC9F00EDC79600EBC2
      8B00EEC482009F6F600000000000000000000000000000000000000000000000
      00000000000063BD6B005ABD6B000000000000000000000000004A9C52004294
      4A0084C68C0084CE8C006BB5730029733100000000007B84E700A5BDFF005A7B
      FF005A7BFF005A7BFF005273FF004A6BFF004A6BFF004263FF00425AFF00395A
      FF00314AFF00849CFF004A52DE00000000000000000055535100FFFFFF00EEED
      EC00BEBDBD00BEBDBD00BEBDBD00BEBDBD00BEBDBD00BEBDBD00BEBDBD00BEBD
      BD00EEEDEC00FFFFFF0055535100000000000000000000000000AF7A6800FFFC
      F400D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700EFC78C009F6F6000000000000000000042944A00398C420039843900317B
      39002973310052AD520063C66B00000000000000000000000000000000004AA5
      520042944A004294420039844200317B390000000000848CE700ADBDFF006B8C
      FF006B8CFF006384FF005A7BFF005A7BFF005273FF004A6BFF004A6BFF004263
      FF00395AFF008C9CFF00525ADE0000000000000000005A585600FFFFFF00F0EF
      EE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00F0EF
      EE00F0EFEE00FFFFFF005A585600000000000000000000000000B7816B00FFFF
      FF00FBF2EB00F8EDDE00F7E6D300F6E1C700F3DCBD00F2D7B400F0D1A900EECC
      9E00F2CC97009F6F600000000000000000004A9C5200429C4A00429442003984
      4200317B390000000000000000000000000000000000185A21000052000052AD
      5A004AA552004A9C520042944A00398C4200000000008C8CE700B5C6FF007394
      FF007394FF006B8CFF006B8CFF006384FF005A7BFF005A7BFF005273FF004A6B
      FF004263FF008CA5FF005A63DE0000000000000000005F5D5B00FFFFFF00F2F2
      F100C2C1C100C2C1C100C2C1C100C2C1C100C2C1C100C2C1C100C2C1C100C2C1
      C100F2F2F100FFFFFF005F5D5B00000000000000000000000000BD876D00FFFF
      FF00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700F3D0A0009F6F6000000000000000000052AD5A007BC68C008CCE940084C6
      8C00398C42003184390000000000000000000000000021632100185A21000000
      000000000000000000000000000000000000000000009494E700B5CEFF007B9C
      FF007B9CFF00739CFF007394FF006B8CFF006B8CFF006384FF005A7BFF005A73
      FF004A6BFF0094ADFF00636BDE00000000000000000064626000FFFFFF00F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4
      F300F4F4F300FFFFFF0064626000000000000000000000000000C58B6F00FFFF
      FF00FFFFFF00FFFBF700FBF3EB00FAEBDE00F7E6D300F6E1C500F2D8B600F0D3
      AA00F2D1A3009F6F600000000000000000005AB5630073BD7B0094D6A50094CE
      9C0084C68C005AA5630039843900317B3900297331004A8C4A00428C4A001863
      21000000000000000000000000000000000000000000949CEF00BDCEFF009CBD
      FF0084A5FF0084A5FF007B9CFF00739CFF007394FF006B8CFF006B8CFF005A7B
      FF007394FF009CADFF00636BDE00000000000000000069676400FFFFFF00F7F7
      F600F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600F7F7
      F600F7F7F600FFFFFF0074726F00000000000000000000000000CB907200FFFF
      FF00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700F4D7AD009F6F600000000000000000005AB56B005AB5630084CE8C009CD6
      A5008CCE940094CE9C008CCE940084CE8C0084C68C007BC684007BC67B00428C
      4A0021632100000000000000000000000000000000008C94E700A5ADEF00C6D6
      FF009CBDFF0084ADFF0084A5FF0084A5FF007B9CFF007394FF006B8CFF0084A5
      FF00ADBDFF00848CE7006363DE0000000000000000006E6C6900F9EBE500F5DF
      D600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD600817F7C00817F
      7C00817F7C00817F7C00817F7C00000000000000000000000000D0957400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFBF700FBF3EB00FAF0E500F8EBDA00F6E3
      CA00F6E0BD009F6F600000000000000000000000000063BD6B005ABD63007BC6
      84008CCE940094CE9C0094D69C008CCE9C008CCE940084CE8C007BC684004A94
      5200216B290000000000000000000000000000000000000000009494E700A5AD
      EF00C6D6FF00A5C6FF008CADFF008CADFF0084A5FF007B9CFF0094ADFF00B5C6
      FF008C94EF006B73DE0000000000000000000000000073716E00F9EBE500F5DF
      D600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD60086848100E9E8
      E600E9E8E600A5A3A00054525000000000000000000000000000D4987500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFA00FCF7F200FBF3E900F8EB
      D800FAE6CB009F6F6000000000000000000000000000000000005AC673005ABD
      6B005AB5630052AD5A004AA55A004A9C520042944A005AA563005AA56300317B
      3900000000000000000000000000000000000000000000000000000000009494
      E700A5ADEF00C6D6FF00C6D6FF00BDD6FF00BDCEFF00BDCEFF00B5C6FF00949C
      EF00737BE7000000000000000000000000000000000078767300F9EBE500F5DF
      D600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD600F5DFD6008D8B8700F4F3
      F300B3B1AF005756540000000000000000000000000000000000D4987500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF300FBF0
      E000FCEDD0009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042944A0042944A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000949CEF009CA5EF009CA5EF009CA5EF009C9CEF00949CEF009494EF00848C
      E7007B7BD600000000000000000000000000000000007E7C7800F9EBE500F9EB
      E500F9EBE500F9EBE500F9EBE500F9EBE500F9EBE500F9EBE50092908D00BBB9
      B7005A5957000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F6F600000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004AA5520052AD52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083817D0083817D008381
      7D0083817D0083817D0083817D0083817D0083817D00908E8A00989692005F5E
      5B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EFF700D6D6DE00B5B5BD00949C
      AD006B849C009CADC600FFFFFF00FFFFFF00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFE7EF00CECED600A5ADBD008C94AD00738C9C006B8C9C006B9CA50073B5
      B5007BC6C6005A84A500DEDEE700FFFFFF00CECECE0000000000000000000000
      00000000000000000000000000000000000000000000CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      0000BD4A1000B542100000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C663
      1800BD52100000000000000000000000000000000000BD421000BD391000B539
      1000B5391000000000000000000000000000FFFFFF00D6D6DE00A5ADBD008C9C
      AD007394A5006B9CA5006BA5B50073BDBD0084C6C60084CEC60084BDBD0084AD
      B50084A5B50073849C008494AD0000000000CECECE00A57B6300A57B6300A57B
      6300A57B6300A57B6300A57B6300A57B630000000000CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      0000C65A1000CE733900B5421000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE6B
      1800D6844200C65A1800000000000000000000000000BD4A1000D67B4A00D694
      5A00B5391000000000000000000000000000E7EFEF0084B5BD0073B5B5007BC6
      BD0084C6C60084C6C60084B5BD007BA5AD00638C94005A738C00526B8C00636B
      8C005A638C005A73940073739400CECED600CECECE00A57B6300FFFFD600FFFF
      D600FFFFD600FFFFD600FFFFD600A57B63000000000000000000000000000000
      0000000000000000000000000000CECECE000000000000000000000000000000
      0000CE631800DEA57300CE733900BD4A10000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE73
      2900E7AD8400D6844200C65A18000000000000000000BD521000D6845200DE94
      6300BD421000000000000000000000000000C6DEDE007BB5BD0084ADB5007B9C
      AD007B8CA5006B7B9C005A738C004252730039396300394A6B00395A8400395A
      8400395A8400395A8C0063739400ADADC60000000000A57B6300E7E7E7000000
      0000FFF7D600FFF7D600FFF7D600A57B6300A57B6300A57B6300A57B6300A57B
      6300A57B6300A57B630000000000CECECE000000000000000000000000000000
      0000CE6B2100E7A57B00DEA57B00CE733900BD4A100000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D67B
      3900E7B58C00E7AD8400D6844200C65A180000000000C65A1000D68C5200DE9C
      6B00BD4A1000000000000000000000000000EFEFF7008494AD004A639400526B
      9C004A639400395A8C00395A8400394263001829390021315200425A7B004263
      7B004263840042638400426384009CADBD0000000000A57B6300E7E7E700E7E7
      E700000000000000000000000000A57B6300FFFFD600FFFFD600FFFFD600FFFF
      D600FFFFD600A57B630000000000CECECE000000000000000000000000000000
      0000D6733100E7AD8400DEA57300E7AD7B00CE7B3900BD521000BD3900000000
      000000000000000000000000000000000000000000000000000000000000D684
      4200E7B59400E7AD7B00E7B58C00D6844A00C6631800C6631800DE945A00DE9C
      6B00BD521000000000000000000000000000FFFFFF00EFEFF700637BA5003152
      840042638C00395A840042638400183142000018100010293100395A7B00315A
      7B0031527B0031527B00295273008494AD003194000031940000319400003194
      0000E7E7E700000000000000000000DE000031940000FFF7D600FFF7D600FFF7
      D600FFF7D600A57B630000000000CECECE000000000000000000000000000000
      0000D6844200E7B58C00DEA57300DEA57300E7AD8400D67B4200C65218000000
      000000000000000000000000000000000000000000000000000000000000DE8C
      5200EFBD9400E7AD7B00E7AD8400E7B58C00DE9C6300CE6B1800DEA57300DEA5
      7300C65A1000000000000000000000000000FFFFFF00FFFFFF00EFF7F700637B
      A50031528C00395A8C003952840031424A001821210039424A00526B8C006B84
      9C008C9CB500ADB5C600CED6DE00EFEFEF00319400006BFF6B006BFF6B003194
      0000E7E7E70000000000000000003194000000DE000031940000000000003194
      0000E7E7E700A57B630000000000CECECE000000000000000000000000000000
      0000DE8C5200EFBD9C00E7AD7B00E7AD8400E7B58C00D6844A00C66318000000
      000000000000000000000000000000000000000000000000000000000000DE94
      5A00EFBD9C00E7AD8400E7B58C00E7B59400DE9C6B00CE732900E7AD8400E7A5
      7B00C663180000000000000000000000000000000000FFFFFF00FFFFFF00EFEF
      F7006B84AD004A6B9400738CB500636B7300212121007B848400F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003194000031940000319400003194
      0000E7E7E70000000000E7E7E700A57B63003194000000DE0000319400003194
      0000E7E7E700A57B630000000000CECECE000000000000000000000000000000
      0000E7946300EFC6A500E7B59400EFBD9C00DE946300CE732900000000000000
      000000000000000000000000000000000000000000000000000000000000E79C
      6300EFC6A500EFBD9400EFBD9C00DE9C6B00CE7B3900D67B3900DEA57300E7AD
      8400CE6B18000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF0063737B000000000084949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00A57B6300E7E7E700E7E7
      E700E7E7E700E7E7E700A57B6300A57B6300000000003194000000DE00003194
      0000E7E7E700A57B630000000000CECECE000000000000000000000000000000
      0000E79C6B00EFC6A500EFC6A500E7A57300D684420000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E79C
      6B00EFC6AD00EFC6A500E7A57B00D68C4A0000000000D6844200E7A57B00E7B5
      8C00CE732900000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00E7E7E70042424A0021212900525A6300FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000CECECE00A57B6300A57B6300A57B
      6300A57B6300A57B6300A57B6300000000003194000031940000319400003194
      0000E7E7E700A57B630000000000CECECE000000000000000000000000000000
      0000E7A57B00EFC6AD00E7AD8400DE945A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7A5
      7300EFC6AD00E7AD8400DE9463000000000000000000DE8C5200E7AD8400E7B5
      9400D67B3900000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00F7F7F700636B6B00313131004242420031313100848C8C00FFFF
      FF00FFFFFF00FFFFFF000000000000000000CECECE00CECECE00000000000000
      0000A57B6300E7E7E700E7E7E700E7E7E7000000000000000000000000000000
      0000E7E7E700A57B630000000000CECECE000000000000000000000000000000
      0000EFAD7B00E7A57B00E7A57300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      7B00E7A57B00E7A57300000000000000000000000000DE945A00E7B58C00EFBD
      9C00D6844200000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00DEDEDE0042393900393939003939390031313100525A5A00F7F7
      F700FFFFFF00FFFFFF000000000000000000CECECE00CECECE000000BD000000
      BD000000BD000000BD000000BD000000BD0000000000E7E7E700CECECE00CECE
      CE00CECECE00A57B630000000000CECECE000000000000000000000000000000
      0000E7AD7B00E7A57B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      7B00E7A57B0000000000000000000000000000000000E79C6300DE945A00DE8C
      5A00DE8C5200000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00DEDEDE003939390042424200424242003942420031393900EFEF
      EF00FFFFFF00FFFFFF000000000000000000CECECE00CECECE000000DE006B6B
      FF006B6BFF000000FF000000FF000000BD0000000000E7E7E700A57B6300A57B
      6300A57B6300A57B630000000000CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00F7F7F7006B6B6B002929290031313100423942007B7B8400F7F7
      F700FFFFFF00FFFFFF000000000000000000CECECE00CECECE000000DE000000
      DE000000DE000000DE000000DE000000BD00E7E7E700E7E7E700A57B6300E7E7
      E700A57B63000000000000000000CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00F7F7F700C6C6C600B5ADB500C6C6C600FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000CECECE00CECECE00CECECE00AD94
      8C00A57B6300A57B6300A57B6300A57B6300A57B6300A57B6300A57B6300A57B
      63000000000000000000CECECE00CECECE0030262500B1625B00B1625B00B162
      5B0002010100000000001F94D6001F94D6001F94D6001F94D6001F94D6001F94
      D6001F94D6001F94D60000000000000000000000000000000000000000000000
      00002490CF002490CF002490CF002490CF002490CF002490CF002490CF002490
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFFFFF00FFFF
      FF00B1625B00000000001F94D60051E3FF0045DFFF003ADCFF002ED9FF0022D6
      FF0048E3FF001F94D60000000000000000000000000000000000000000000000
      00002490CF006BEDFF0062E9FF005BE7FF0053E5FF004BE3FF0040E1FF002490
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFCDC900FFFF
      FF00B1625B00B1625B001F94D60098EEFC008EEAFB0086E8FC007CE5FC0074E3
      FC006BE0FD001F94D600B1625B00B1625B000000000000000000B1625B00B162
      5B002490CF0076ECFF006AE8FF005FE5FF0053E2FF0048DFFF003ADBFF002490
      CF00B1625B00B1625B000000000000000000000000000000000000000000C663
      1800C65A1800C6521000BD52100000000000000000000000000000000000B531
      1000B53910000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD290800B53110000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFD4CF00FFFF
      FF00B1625B00FFFFFF00C8745900C8745900C8745900C8745900C8745900C874
      5900C8745900C8745900FFFFFF00B1625B0000000000B1625B00FFF2F100F9D3
      D0002490CF00ADFFFF009FFAFF0094F7FF0088F4FF007DF1FF006FEEFF002490
      CF00F9D3D000FFF2F100B1625B0000000000000000000000000000000000CE6B
      1800E7A57B00D6945A00C65A1000000000000000000000000000B5391000C663
      3100B53910000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5391000C65A3100B53910000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFD4CF00FFFF
      FF00B1625B00FFE4E200FFE4E200FFE4E200FFE4E200FFE4E200FFE4E200FFE4
      E200FFE4E200FFE4E200FFFFFF00B1625B0000000000B1625B00FFEFEE00C57B
      7400CC787400CC787400CC787400CC787400CC787400CC787400CC787400CC78
      7400C5736E00FFF2F100B1625B0000000000000000000000000000000000CE73
      2900E7AD8400DE946300C66318000000000000000000BD4A1000CE6B3100DE94
      6300BD4210000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD4A1000CE6B3100DE946300BD3910000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFDBD800FFFF
      FF00B1625B00FFEEEE00FFEEEE00FFE4E200D3969100BB706A00D3969100BB70
      6A00D3969100BB706A00FFFFFF00B1625B0000000000B1625B00FFF2F100FEED
      ED00F9D8D400F9D5D100F9D2CE00FAD1CC00FACEC800FACBC500FAC8C200FAC5
      BE00FDCAC600FFF2F100B1625B0000000000000000000000000000000000D67B
      3900E7B58C00DE9C6B00CE6B180000000000C65A1800CE733900DE9C6B00DE9C
      6B00BD4A10000000000000000000000000000000000000000000000000000000
      00000000000000000000C65A1800CE733900DE9C6B00DE9C6B00BD4210000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFE2E000FFFF
      FF00B1625B000000DA00493EBF00FFE8E600D3969100FFE8E600D3969100FFE8
      E600D3969100FFE8E600FFFFFF00B1625B0000000000B1625B00FFF2F100FFF2
      F100DE865E00DC815900D97A5300D6734C00D36C4500D1674000D1684100D168
      4100FFF2F100FFF2F100B1625B0000000000000000000000000000000000D684
      4200E7B59400E7A57300CE732900CE6B1800D6844200DEA57B00DE946300DE9C
      6B00BD5210000000000000000000000000000000000000000000000000000000
      0000BD7B3900CE6B2100D6844200E7AD7B00DE946300DEA57300BD5210000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFE9E600FFFF
      FF00B1625B00FFEEEE00FFEEEE00FFEEEE00FFEEEE00FFEEEE00FFEEEE00FFEE
      EE00FFEEEE00FFEEEE00FFFFFF00B1625B0000000000B1625B00FFF2F100F5A8
      7900F7AB7C00F4A27500F19A6D00ED916400E8875900E47C4E00DE714400DE6E
      4000DE6C3D00FFF2F100B1625B0000000000000000000000000000000000DE8C
      5200EFBD9400E7B58C00D67B3900DE9C6B00E7AD8400DEA57300DE946300DEA5
      7300C65A10000000000000000000000000000000000000000000000000000000
      0000D67B4200DE945A00E7B58C00DEA57300DE9C6300E7A57B00C65A18000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFF0EF00FFFF
      FF00B1625B0041D781007ECE9600FFF3F300DF8A5000DF8A5000DF8A5000DF8A
      5000DF8A5000DF8A5000FFFFFF00B1625B0000000000B1625B00FFF2F100F8B0
      8100FCB48700FAAF8100F7A97B00F4A27400F0996C00EC906300E8865900E27B
      4D00DE6E4000FFF2F100B1625B0000000000000000000000000000000000DE94
      5A00EFBD9C00EFBD9400D6844200E7A57300E7B58C00E7A57B00DE9C6B00E7A5
      7B00C66318000000000000000000000000000000000000000000000000000000
      0000D6844A00DE9C6B00E7B59400E7AD8400DEA57300E7AD8400CE6318000000
      000000000000000000000000000000000000B1625B00FFFFFF00FFF9F800FFFF
      FF00B1625B00FFEEEE00FFEEEE00FFF4F600DF8A5000FFEAD100FFE7CD00FFDB
      B500FFCB9500DF8A5000FFFFFF00B1625B0000000000B1625B00FFF2F100FCB4
      8700FFBB8D00FDB88900FDB48500F9AF8000F7A87A00F4A17200F0996A00EC8E
      6100EC885800FFF2F100B1625B0000000000000000000000000000000000E79C
      6300EFC6A500E7B58C00DE8C5200D67B4200DE946300E7B58C00E7AD7B00E7AD
      8400CE6B18000000000000000000000000000000000000000000000000000000
      000000000000DE8C5200DE9C7300EFBD9C00E7AD8400E7B58C00CE7329000000
      00000000000000000000000000000000000078605E00B1625B00B1625B00B162
      5B00FFFFFF00FFFFFF00FFF9FB00FFFFFF00DF8A5000DF8A5000DF8A5000DF8A
      5000DF8A5000DF8A5000FFFFFF00B1625B000000000000000000B1625B00B162
      5B00B1625B00B1625B00B1625B00B1625B00B1625B00B1625B00B1625B00B162
      5B00B1625B00B1625B000000000000000000000000000000000000000000E79C
      6B00EFC6AD00EFBD9400DE945A0000000000D6844200DE9C6300E7B58C00E7B5
      8C00CE7329000000000000000000000000000000000000000000000000000000
      00000000000000000000DE8C5A00E7A57300EFBD9C00E7BD9400D67B39000000
      00000000000000000000000000000000000000000000B1625B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B1625B000000000000000000000000000000
      0000C88C4B00FFFBF700FFF8F100FFF7EF00FFF6ED00FFF5EC00FFF5ED00C88C
      4B0000000000000000000000000000000000000000000000000000000000E7A5
      7300EFCEAD00EFBD9C00E79C63000000000000000000D6844A00DE9C6B00E7B5
      8C00D67B39000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DE945A00E7A57B00EFBD9C00DE844A000000
      0000000000000000000000000000000000000000000006020200B1625B00B162
      5B00B1625B00B1625B00B1625B00B1625B00B1625B00B1625B00B1625B00B162
      5B00B1625B00B1625B00B1625B000F0E0E000000000000000000000000000000
      0000C88C4B00FFFCFA00FFF9F600FFF8F400FFF7F200C88C4B00C88C4B00C88C
      4B0000000000000000000000000000000000000000000000000000000000E7AD
      7B00F7CEB500EFC6A500E79C6B00000000000000000000000000D68C4A00D684
      4A00D68442000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE946300DE946300DE8C5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE925000FFFDFA00FFFAF500FFF9F200FFF8F000FFF6
      F000FFF9F400C58E510000000000000000000000000000000000000000000000
      0000C88C4B00FFFFFF00FFFEFF00FFFDFE00FFFDFC00C88C4B00C88C4B000000
      000000000000000000000000000000000000000000000000000000000000EFAD
      7B00EFAD7B00E7AD7B00E7A5730000000000000000000000000000000000DE8C
      5200DE844A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE9C6B00DE9463000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CF955400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7ED
      E400D2955200B37D420000000000000000000000000000000000000000000000
      0000C88C4B00C88C4B00C88C4B00C88C4B00C88C4B00C88C4B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6945D00CD904E00CD904E00CD904E00CD904E00CD90
      4E00BF8A4E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF9C0038001F000FFF1C0038001F000
      FFE1C0038001F000FFC3C0038001F0000000C0038001F0000000C0038001F000
      0000C0038001F0000000C0038001E0000000C0038001E0000000C0038001E000
      0000C003800100010000C007800100030000C00F800100070000C01F8001E00F
      0000C03F8001E01F0000C07F8001E3FFF9FFFFFF8001F800F9FFF0078001C000
      F003E0078001C000E001C0038001C000E00080018001C000F00080018001C003
      F9C080018001C00301E080018001C003078080018001C003039F80018001C003
      000F80018001C003000780018001C0038007C0038001C003C00FE0078003C003
      FF9FF0078007C003FF9FFFFF800FFFFFFFFFFFFF80000000FFFFFFFF00000000
      F3FFE78700010000F1FFE38700000000F0FFE18700001000F07FE08700000E00
      F01FE00700000600F01FE00700000620F01FE00780000400F03FE007C0000080
      F07FE087E0070100F0FFE187E00300F0F1FFE387E0030080F3FFE787E0030080
      FFFFFFFFE0030000FFFFFFFFF00700000403F00FFFFFFFFF0403F00FFFFFFFFF
      0000C003E1E7FF9F00008001E1C7FF1F00008001E187FE1F00008001E107FC1F
      00008001E007F01F00008001E007F01F00008001E007F01F00008001E007F81F
      0000C003E107FC1F8000F00FE187FE1F8000F00FE1C7FF1FFC03F01FE1E7FF9F
      FC03F03FFFFFFFFFFC07FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object popExportacao: TPopupMenu
    Left = 535
    Top = 335
    object actExportarExcel: TMenuItem
      Caption = 'Exportar Excel'
      OnClick = actExportarExcelClick
    end
    object mniDuplicarItem: TMenuItem
      Caption = 'Duplicar Item'
      OnClick = mniDuplicarItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniLancamentoFavorito: TMenuItem
      Caption = 'Definir Item Lan'#231'amento Favorito'
      OnClick = mniLancamentoFavoritoClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mniExcluir: TMenuItem
      Caption = 'Excluir Item'
      OnClick = mniExcluirClick
    end
    object mniEstornarItem: TMenuItem
      Caption = 'Estornar Item'
      OnClick = mniEstornarItemClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CamposGrid1: TMenuItem
      Caption = 'Campos da Grid'
      OnClick = CamposGrid1Click
    end
    object REsetarCamposdaGrid1: TMenuItem
      Caption = 'Resetar Campos da Grid'
      OnClick = REsetarCamposdaGrid1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Expo1: TMenuItem
      Caption = 'Exportar Imagens (PDF)'
      OnClick = Expo1Click
    end
  end
  object sqlLivroCaixa: TI9Query
    AfterScroll = sqlLivroCaixaAfterScroll
    AfterRefresh = sqlLivroCaixaAfterRefresh
    OnCalcFields = sqlLivroCaixaCalcFields
    IndexFieldNames = 'DATA_PAGAMENTO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LC.*,'#13#10'       LF.LIVRO_AGENDAMENTO_ID,'#13#10'       CC.DESCRIC' +
        'AO AS CONTABIL_CONTA_DESCRICAO,'#13#10'       CC.GRUPO AS GRUPO_SECUDA' +
        'RIO, CC.INTERNO,'#13#10'       CG.DESCRICAO AS GRUPO_PRINCIPAL,'#13#10'     ' +
        '  P.NOME, A.NOME AS ASSOCIADO'#13#10'FROM J_LIVRO_CAIXA LC'#13#10'  LEFT OUT' +
        'ER JOIN J_LIVRO_FINANCEIRO LF ON'#13#10'  LC.LIVRO_FINANCEIRO_ID = LF.' +
        'LIVRO_FINANCEIRO_ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_CONTA CC ON'#13#10' ' +
        ' LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID'#13#10'  LEFT OUTER JOIN ' +
        'T_CONTABIL_GRUPO CG ON'#13#10'  CC.CONTABIL_GRUPO_ID = CC.CONTABIL_GRU' +
        'PO_ID'#13#10'  LEFT OUTER JOIN J_PESSOA P ON'#13#10'  LC.PESSOA_ID = P.PESSO' +
        'A_ID'#13#10'  LEFT OUTER JOIN T_PESSOA A ON'#13#10'  LC.ASSOCIADO_ID = A.PES' +
        'SOA_ID'#13#10'WHERE LC.LIVRO_CAIXA_ID = 0'#13#10'ORDER BY LC.LIVRO_CAIXA_ID')
    Left = 279
    Top = 326
    object sqlLivroCaixaDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlLivroCaixaLIVRO_CAIXA_ID: TBCDField
      FieldName = 'LIVRO_CAIXA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlLivroCaixaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object sqlLivroCaixaPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object sqlLivroCaixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlLivroCaixaCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixacalc_ValorDespesa: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorDespesa'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object sqlLivroCaixacalc_ValorReceita: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorReceita'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object sqlLivroCaixacalc_vinculo: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_vinculo'
      Calculated = True
    end
    object sqlLivroCaixacalc_ImagemVinculada: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ImagemVinculada'
      Size = 1
      Calculated = True
    end
    object sqlLivroCaixacalc_Agrupado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_Agrupado'
      Calculated = True
    end
    object sqlLivroCaixaESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object sqlLivroCaixaDOCUMENTO_DESCRICAO: TStringField
      FieldName = 'DOCUMENTO_DESCRICAO'
      Size = 30
    end
    object sqlLivroCaixaBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaLIVRO_FINANCEIRO_ID: TBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlLivroCaixaANO_MES_REGISTRO: TStringField
      FieldName = 'ANO_MES_REGISTRO'
      Size = 10
    end
    object sqlLivroCaixaDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlLivroCaixaLIVRO_AGENDAMENTO_ID: TBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaCONTABIL_CONTA_DESCRICAO: TStringField
      FieldName = 'CONTABIL_CONTA_DESCRICAO'
      Size = 60
    end
    object sqlLivroCaixaGRUPO_SECUDARIO: TStringField
      FieldName = 'GRUPO_SECUDARIO'
      Size = 60
    end
    object sqlLivroCaixaGRUPO_PRINCIPAL: TStringField
      FieldName = 'GRUPO_PRINCIPAL'
      Size = 90
    end
    object sqlLivroCaixacalc_ValorMovimento: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorMovimento'
      Calculated = True
    end
    object sqlLivroCaixaCAIXA_TRANSFERENCIA_ID: TBCDField
      FieldName = 'CAIXA_TRANSFERENCIA_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroCaixaIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlLivroCaixaDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlLivroCaixacalc_captador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_captador'
      Size = 120
      Calculated = True
    end
    object sqlLivroCaixaINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 1
    end
    object sqlLivroCaixaAUTOMATICO: TStringField
      FieldName = 'AUTOMATICO'
      Size = 1
    end
    object sqlLivroCaixaORCAMENTO_ID: TBCDField
      FieldName = 'ORCAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaINDICE_IMAGEM: TBCDField
      FieldName = 'INDICE_IMAGEM'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixacalc_identificador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_identificador'
      Size = 10
      Calculated = True
    end
    object sqlLivroCaixaASSOCIADO_ID: TBCDField
      FieldName = 'ASSOCIADO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object sqlLivroCaixaIDENTIFICACAO_TIPO: TStringField
      FieldName = 'IDENTIFICACAO_TIPO'
      Size = 1
    end
    object sqlLivroCaixaRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaDOC_TIPO: TStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object sqlLivroCaixaFAVORECIDO_ASSOCIADO: TStringField
      FieldName = 'FAVORECIDO_ASSOCIADO'
      Size = 1
    end
    object sqlLivroCaixaNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlLivroCaixaASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Size = 120
    end
    object sqlLivroCaixaCALC_PESSOA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_PESSOA'
      Size = 120
      Calculated = True
    end
    object sqlLivroCaixaCALC_OBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OBSERVACAO'
      Size = 240
      Calculated = True
    end
    object sqlLivroCaixaFAVORITO_SITUACAO: TStringField
      FieldName = 'FAVORITO_SITUACAO'
      Size = 1
    end
    object sqlLivroCaixaTIPO_DESPESA_ID: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaIDENTIFICACAO_ID: TBCDField
      FieldName = 'IDENTIFICACAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlLivroCaixaDESCRICAO_AGRUPADOR: TStringField
      FieldName = 'DESCRICAO_AGRUPADOR'
      Size = 120
    end
    object sqlLivroCaixaORDEM: TBCDField
      FieldName = 'ORDEM'
      Precision = 20
      Size = 2
    end
    object sqlLivroCaixaCALC_ORDEM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CALC_ORDEM'
      Calculated = True
    end
  end
  object frxDBdtRecibo: TfrxDBDataset
    UserName = 'frxDBdtRecibo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_PAGAMENTO=DATA_PAGAMENTO'
      'VALOR=VALOR'
      'HISTORICO=HISTORICO'
      'DOC_TIPO=DOC_TIPO'
      'IDENTIFICACAO_ID=IDENTIFICACAO_ID'
      'NOME_PESSOA=NOME_PESSOA'
      'CPFCNPJ=CPFCNPJ'
      'LIVRO_CAIXA_ID=LIVRO_CAIXA_ID'
      'CALC_IDENTIFICADOR=CALC_IDENTIFICADOR'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'PLANO_CONTA=PLANO_CONTA'
      'CALC_REFERENCIA=CALC_REFERENCIA'
      'REFERENCIA=REFERENCIA')
    DataSet = sqlRecibo
    BCDToCurrency = False
    Left = 469
    Top = 419
  end
  object frxRecibo: TfrxReport
    Version = '6.8.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39108.449637581020000000
    ReportOptions.LastChange = 39295.389484583330000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 550
    Top = 419
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object sqlRecibo: TI9Query
    AfterScroll = sqlLivroCaixaAfterScroll
    OnCalcFields = sqlReciboCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LC.DATA_PAGAMENTO, LC.VALOR, LC.HISTORICO,'#13#10'       DOC_TI' +
        'PO, IDENTIFICACAO_ID, DOCUMENTO_NUMERO,'#13#10'      REFERENCIA,'#13#10'    ' +
        '   CC.DESCRICAO AS PLANO_CONTA,'#13#10'       CASE'#13#10'        WHEN LC.AS' +
        'SOCIADO_ID > 0 THEN PU.NOME'#13#10'        WHEN LC.PESSOA_ID > 0 THEN ' +
        'P.NOME'#13#10'       END AS NOME_PESSOA,'#13#10'       CASE'#13#10'        WHEN AS' +
        'SOCIADO_ID > 0 THEN PU.CPF'#13#10'        WHEN P.PESSOA_ID > 0 THEN P.' +
        'CPFCNPJ'#13#10'       END AS CPFCNPJ,'#13#10'      LC.LIVRO_CAIXA_ID'#13#10'FROM J' +
        '_LIVRO_CAIXA LC'#13#10'  LEFT OUTER JOIN J_PESSOA P ON'#13#10'  LC.PESSOA_ID' +
        ' = P.PESSOA_ID'#13#10'  LEFT OUTER JOIN T_PESSOA PU ON'#13#10'  LC.ASSOCIADO' +
        '_ID = PU.PESSOA_ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_CONTA CC ON'#13#10'  ' +
        'LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID'#13#10'WHERE LC.IDENTIFICA' +
        'CAO_ID = :IDENTIFICACAO_ID'#13#10'  AND LC.DOC_TIPO = :DOC_TIPO')
    Left = 152
    Top = 335
    ParamData = <
      item
        Name = 'IDENTIFICACAO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DOC_TIPO'
        DataType = ftString
        ParamType = ptInput
      end>
    object sqlReciboDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlReciboVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlReciboHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlReciboDOC_TIPO: TStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object sqlReciboIDENTIFICACAO_ID: TBCDField
      FieldName = 'IDENTIFICACAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlReciboNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 120
    end
    object sqlReciboCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 15
    end
    object sqlReciboLIVRO_CAIXA_ID: TBCDField
      FieldName = 'LIVRO_CAIXA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlReciboCALC_IDENTIFICADOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_IDENTIFICADOR'
      Size = 30
      Calculated = True
    end
    object sqlReciboDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlReciboPLANO_CONTA: TStringField
      FieldName = 'PLANO_CONTA'
      Size = 90
    end
    object sqlReciboCALC_REFERENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_REFERENCIA'
      Size = 10
      Calculated = True
    end
    object sqlReciboREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
  end
  object dtsRecibo: TDataSource
    DataSet = sqlRecibo
    Left = 152
    Top = 390
  end
  object dtsCaixaSimplificado: TDataSource
    DataSet = sqlCaixaSimplificado
    Left = 360
    Top = 438
  end
  object sqlCaixaSimplificado: TI9Query
    BeforeOpen = sqlCaixaSimplificadoBeforeOpen
    AfterScroll = sqlCaixaSimplificadoAfterScroll
    OnCalcFields = sqlCaixaSimplificadoCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT SUM(LC.VALOR) AS VALOR, LC.CAIXA_ID, LC.OPERACAO, LC.DATA' +
        '_PAGAMENTO, COUNT(LC.LIVRO_CAIXA_ID) AS QTD,'#13#10'       LC.SITUACAO' +
        ', LC.ORDEM, LC.CAIXA_TRANSFERENCIA_ID, IDENTIFICACAO_ID, DOCUMEN' +
        'TO_NUMERO, DOC_TIPO,'#13#10'       '#13#10'       (CASE'#13#10'       WHEN LC.DESC' +
        'RICAO_AGRUPADOR <> '#39#39' THEN LC.DESCRICAO_AGRUPADOR'#13#10'       WHEN L' +
        'C.ASSOCIADO_ID > 0 THEN A.NOME'#13#10'       WHEN (LC.ASSOCIADO_ID = 0' +
        ') OR (LC.ASSOCIADO_ID IS NULL) THEN P.NOME'#13#10'       END) AS NOME_' +
        'PESSOA,'#13#10#13#10'       (CASE'#13#10'       WHEN (LC.ASSOCIADO_ID = 0) OR (L' +
        'C.ASSOCIADO_ID IS NULL)'#13#10'       and (OPERACAO = '#39'D'#39') THEN '#39'S'#39#13#10' ' +
        '      WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL)'#13#10' ' +
        '      and (OPERACAO = '#39'R'#39') THEN '#39'S'#39#13#10'       ELSE '#39'N'#39#13#10'       END' +
        ') AS ITEM_UNICO,'#13#10#13#10'       (CASE'#13#10'       WHEN (LC.ASSOCIADO_ID >' +
        ' 0) AND (OPERACAO = '#39'R'#39') THEN '#39'Recebimento de Associado'#39#13#10'      ' +
        ' WHEN (LC.ASSOCIADO_ID > 0) AND (OPERACAO = '#39'D'#39') THEN '#39'Pagamento' +
        ' de Despesas Realizadas por Associado'#39#13#10'       WHEN (LC.ASSOCIAD' +
        'O_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) and (OPERACAO = '#39'R'#39') THEN' +
        ' LC.HISTORICO'#13#10'       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIAD' +
        'O_ID IS NULL) and (OPERACAO = '#39'D'#39') THEN LC.HISTORICO'#13#10'       WHE' +
        'N (OPERACAO = '#39'AD'#39') THEN '#39'Retirada de Valores'#39#13#10'       WHEN (OPE' +
        'RACAO = '#39'AR'#39') THEN '#39'Aporte de Valores'#39#13#10'       WHEN (OPERACAO = ' +
        #39'TD'#39') THEN '#39'Transfer'#234'ncia de Valor - Sa'#237'da'#39#13#10'       WHEN (OPERAC' +
        'AO = '#39'TR'#39') THEN '#39'Transfer'#234'ncia de Valor - Entrada'#39#13#10'       END) ' +
        'AS HISTORICO,'#13#10'    (CASE WHEN (OPERACAO = '#39'D'#39') THEN LC.REFERENCI' +
        'A'#13#10'  ELSE '#39#39#13#10'  END) AS REFERENCIA,'#13#10'  (CASE WHEN ((DOCUMENTO_NU' +
        'MERO = '#39#39') OR (DOCUMENTO_NUMERO = NULL)) THEN CAST(IDENTIFICACAO' +
        '_ID AS INTEGER)'#13#10'  ELSE DOCUMENTO_NUMERO'#13#10'  END) AS DOCUMENTO'#13#10'F' +
        'ROM J_LIVRO_CAIXA LC'#13#10'  LEFT OUTER JOIN J_PESSOA P ON'#13#10'  LC.PESS' +
        'OA_ID = P.PESSOA_ID'#13#10'  LEFT OUTER JOIN T_PESSOA A ON'#13#10'  LC.ASSOC' +
        'IADO_ID = A.PESSOA_ID'#13#10'WHERE NOT LC.LIVRO_CAIXA_ID IS NULL'#13#10'  AN' +
        'D ANO_MES_REGISTRO = '#39'201705'#39#13#10'GROUP BY DATA_PAGAMENTO, ORDEM, N' +
        'OME_PESSOA, IDENTIFICACAO_ID, DOC_TIPO, DOCUMENTO_NUMERO, REFERE' +
        'NCIA,  LC.CAIXA_ID, LC.OPERACAO, HISTORICO, ITEM_UNICO, LC.SITUA' +
        'CAO, LC.CAIXA_TRANSFERENCIA_ID'#13#10'ORDER BY DATA_PAGAMENTO, ORDEM')
    Left = 280
    Top = 438
    object sqlCaixaSimplificadoCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCaixaSimplificadoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object sqlCaixaSimplificadoDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlCaixaSimplificadoNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 120
    end
    object sqlCaixaSimplificadoITEM_UNICO: TStringField
      FieldName = 'ITEM_UNICO'
      FixedChar = True
      Size = 1
    end
    object sqlCaixaSimplificadoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlCaixaSimplificadocalc_ValorDespesa: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorDespesa'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object sqlCaixaSimplificadocalc_ValorReceita: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorReceita'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object sqlCaixaSimplificadoCALC_SALDO: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SALDO'
    end
    object sqlCaixaSimplificadoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlCaixaSimplificadoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCaixaSimplificadoCALC_ORDEM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_ORDEM'
    end
    object sqlCaixaSimplificadoORDEM: TBCDField
      FieldName = 'ORDEM'
      Precision = 20
      Size = 2
    end
    object sqlCaixaSimplificadoCALC_OBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OBSERVACAO'
      Size = 120
      Calculated = True
    end
    object sqlCaixaSimplificadoCAIXA_TRANSFERENCIA_ID: TBCDField
      FieldName = 'CAIXA_TRANSFERENCIA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCaixaSimplificadoIDENTIFICACAO_ID: TBCDField
      FieldName = 'IDENTIFICACAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCaixaSimplificadoQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sqlCaixaSimplificadoDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlCaixaSimplificadoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object sqlCaixaSimplificadoDOC_TIPO: TStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object sqlCaixaSimplificadoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 60
    end
  end
  object frxDBDatasetcABECALHO: TfrxDBDataset
    UserName = 'frxDBDatasetCabecalho'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BALANCETE_GRUPO_ID=BALANCETE_GRUPO_ID'
      'CABECALHO=CABECALHO'
      'TEXTO_CABECALHO=TEXTO_CABECALHO'
      'NOME=NOME'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'CNPJ_CPF=CNPJ_CPF'
      'END_CIDADE=END_CIDADE'
      'END_UF=END_UF'
      'CALC_CPNJ=CALC_CPNJ')
    DataSet = dtmLookup.sqlCabecalho
    BCDToCurrency = False
    Left = 728
    Top = 345
  end
  object frxDBDataSetDemonstrativo: TfrxDBDataset
    UserName = 'frxDBDataSetDemonstrativo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_PAGAMENTO=DATA_PAGAMENTO'
      'CAIXA=CAIXA'
      'LIVRO_CAIXA_ID=LIVRO_CAIXA_ID'
      'CAIXA_ID=CAIXA_ID'
      'VALOR=VALOR'
      'OPERACAO=OPERACAO'
      'PESSOA_ID=PESSOA_ID'
      'REFERENCIA=REFERENCIA'
      'OBSERVACAO=OBSERVACAO'
      'CONTABIL_CONTA_ID=CONTABIL_CONTA_ID'
      'CENTRO_CUSTO_ID=CENTRO_CUSTO_ID'
      'ESPECIE=ESPECIE'
      'DOCUMENTO_DESCRICAO=DOCUMENTO_DESCRICAO'
      'BALANCETE_GRUPO_ID=BALANCETE_GRUPO_ID'
      'LIVRO_FINANCEIRO_ID=LIVRO_FINANCEIRO_ID'
      'HISTORICO=HISTORICO'
      'ANO_MES_REGISTRO=ANO_MES_REGISTRO'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'LIVRO_AGENDAMENTO_ID=LIVRO_AGENDAMENTO_ID'
      'CONTABIL_CONTA_DESCRICAO=CONTABIL_CONTA_DESCRICAO'
      'GRUPO_SECUDARIO=GRUPO_SECUDARIO'
      'GRUPO_PRINCIPAL=GRUPO_PRINCIPAL'
      'BALANCETE_GRUPO=BALANCETE_GRUPO'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'NOME=NOME')
    BCDToCurrency = False
    Left = 73
    Top = 196
  end
  object frxDBDatasetLivroCaixaSimplif: TfrxDBDataset
    UserName = 'frxDBDatasetLivroCaixaSimplif'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CAIXA_ID=CAIXA_ID'
      'OPERACAO=OPERACAO'
      'DATA_PAGAMENTO=DATA_PAGAMENTO'
      'NOME_PESSOA=NOME_PESSOA'
      'ITEM_UNICO=ITEM_UNICO'
      'HISTORICO=HISTORICO'
      'calc_ValorDespesa=calc_ValorDespesa'
      'calc_ValorReceita=calc_ValorReceita'
      'CALC_SALDO=CALC_SALDO'
      'VALOR=VALOR'
      'SITUACAO=SITUACAO'
      'CALC_ORDEM=CALC_ORDEM'
      'ORDEM=ORDEM'
      'CALC_OBSERVACAO=CALC_OBSERVACAO'
      'CAIXA_TRANSFERENCIA_ID=CAIXA_TRANSFERENCIA_ID'
      'IDENTIFICACAO_ID=IDENTIFICACAO_ID'
      'QTD=QTD'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'REFERENCIA=REFERENCIA'
      'DOC_TIPO=DOC_TIPO'
      'DOCUMENTO=DOCUMENTO')
    DataSet = sqlCaixaSimplificado
    BCDToCurrency = False
    Left = 720
    Top = 417
  end
  object sqlTransfProvisao: TI9Query
    AfterScroll = sqlLivroCaixaAfterScroll
    AfterRefresh = sqlLivroCaixaAfterRefresh
    OnCalcFields = sqlLivroCaixaCalcFields
    IndexFieldNames = 'DATA_PAGAMENTO'
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LC.LIVRO_CAIXA_ID, LC.HISTORICO, LC.DATA_PAGAMENTO, LC.OB' +
        'SERVACAO, LC.OPERACAO, LC.RESERVA_ID, LC.VALOR'#13#10'FROM J_LIVRO_CAI' +
        'XA LC'#13#10'WHERE LC.ANO_MES_REGISTRO = 202205'#13#10' AND OPERACAO IN ('#39'PD' +
        #39', '#39'PR'#39')'#13#10' ORDER BY LC.LIVRO_CAIXA_ID')
    Left = 95
    Top = 462
    object sqlTransfProvisaoLIVRO_CAIXA_ID: TBCDField
      FieldName = 'LIVRO_CAIXA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlTransfProvisaoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlTransfProvisaoDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlTransfProvisaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlTransfProvisaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object sqlTransfProvisaoRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlTransfProvisaoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
  end
  object dtsTransfProvisao: TDataSource
    DataSet = sqlTransfProvisao
    Left = 176
    Top = 462
  end
end