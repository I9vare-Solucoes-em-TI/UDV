inherited frmUsuario: TfrmUsuario
  Left = 278
  Top = 239
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 516
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitWidth = 820
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 804
    ExplicitWidth = 804
    inherited PanelBotoesBasicos: TPanel
      Width = 722
      ExplicitWidth = 722
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
      object btnBiometria: TcxButton
        Left = 385
        Top = 27
        Width = 95
        Height = 22
        Caption = 'Biometria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnBiometriaClick
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D9D9D94F4F4F2F2F2F313131414141AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE0C0C0C08
          0808080808080808080808080808888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6363630808080808080808
          08080808080808080808080808333333E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF171717080808080808080808080808
          080808080808323232080808080808808080D9D9D9FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD4D4D408080808080808080808080808080808080808
          0808B6B6B6E9E9E90909090808087B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9696960808080808080808080808080808080808080808086A6A
          6AFFFFFFE3E3E3CACACAF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
          F0F07676760808082D2D2D0808081616160808082A2A2A0E0E0E363636FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD5E5E
          5E0808087474740808087F7F7F1010105C5C5C5C5C5C080808F5F5F5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9383838080808
          7A7A7A0808089393931111115858589D9D9D080808B4B4B4FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7D7D0808082B2B2B8A8A8A08
          0808A6A6A6111111484848D1D1D10808087C7C7CFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC3535358484848E8E8E080808B9B9
          B9101010303030FFFFFF080808303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A080808D1D1D10E0E0E
          1C1C1CFFFFFF3535350B0B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666660C0C0CFFFFFF080808151515FF
          FFFFD6D6D6C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF5F5F5FFFFFF5E5E5E6B6B6BFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 724
      ExplicitLeft = 724
    end
  end
  inherited StatusBar: TStatusBar
    Top = 496
    Width = 804
    ExplicitWidth = 804
  end
  inherited PanelGeral: TPanel
    Width = 804
    Height = 440
    ExplicitWidth = 804
    inherited PanelData: TPanel
      Width = 802
      Height = 0
      ExplicitWidth = 802
      ExplicitHeight = 0
    end
    object pagPrincipal: TcxPageControl
      Left = 1
      Top = 1
      Width = 802
      Height = 438
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tbsUsuario
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      OnChange = pagPrincipalChange
      ExplicitHeight = 344
      ClientRectBottom = 433
      ClientRectLeft = 2
      ClientRectRight = 797
      ClientRectTop = 25
      object tbsUsuario: TcxTabSheet
        Caption = 'Usu'#225'rio'
        ImageIndex = 0
        ExplicitHeight = 314
        object pnlDadosUsuarios: TPanel
          Left = 0
          Top = 0
          Width = 795
          Height = 131
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object cxLabel1: TcxLabel
            Left = 9
            Top = 32
            Caption = 'Nome:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 9
            Top = 9
            Caption = 'C'#243'digo:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 9
            Top = 56
            Caption = 'Login:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 361
            Top = 56
            Caption = 'Senha:'
            Transparent = True
          end
          object cxLabel5: TcxLabel
            Left = 9
            Top = 80
            Caption = 'Fun'#231#227'o:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object cxLabel6: TcxLabel
            Left = 272
            Top = 56
            Caption = 'Sigla:'
            Transparent = True
          end
          object cxLabel7: TcxLabel
            Left = 9
            Top = 104
            Caption = 'Grupo:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object cxLabel8: TcxLabel
            Left = 360
            Top = 82
            Caption = 'Comiss'#227'o:'
            Transparent = True
          end
          object chbSituacao: TcxDBCheckBox
            Left = 119
            Top = 7
            AutoSize = False
            Caption = 'Ativo'
            DataBinding.DataField = 'SITUACAO'
            DataBinding.DataSource = SourceAncestral
            ParentBackground = False
            ParentColor = False
            ParentFont = False
            Properties.DisplayChecked = 'A'
            Properties.DisplayGrayed = 'I'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'A'
            Properties.ValueUnchecked = 'I'
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 8
            Transparent = True
            Height = 21
            Width = 60
          end
          object chbTrocarSenha: TcxDBCheckBox
            Left = 204
            Top = 7
            AutoSize = False
            Caption = 'Trocar Senha ao logar no sistema'
            DataBinding.DataField = 'TROCARSENHA'
            DataBinding.DataSource = SourceAncestral
            ParentBackground = False
            ParentColor = False
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayGrayed = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 9
            Transparent = True
            Height = 21
            Width = 223
          end
          object chbAssinar: TcxDBCheckBox
            Left = 453
            Top = 7
            AutoSize = False
            Caption = 'Assina'
            DataBinding.DataField = 'ASSINA'
            DataBinding.DataSource = SourceAncestral
            ParentBackground = False
            ParentColor = False
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayGrayed = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 10
            Transparent = True
            Height = 21
            Width = 62
          end
          object edtCodigo: TcxDBTextEdit
            Left = 52
            Top = 8
            DataBinding.DataField = 'USUARIO_ID'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            Style.TextColor = clNavy
            TabOrder = 11
            Width = 56
          end
          object edtNome: TcxDBTextEdit
            Left = 52
            Top = 31
            DataBinding.DataField = 'NOME_COMPLETO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 12
            Width = 476
          end
          object edtLogin: TcxDBTextEdit
            Left = 52
            Top = 55
            DataBinding.DataField = 'LOGIN'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 13
            Width = 214
          end
          object edtSigla: TcxDBTextEdit
            Left = 305
            Top = 55
            DataBinding.DataField = 'SIGLA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 5
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 14
            Width = 49
          end
          object edtSenha: TcxDBTextEdit
            Left = 417
            Top = 55
            DataBinding.DataField = 'SENHA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.EchoMode = eemPassword
            Properties.MaxLength = 8
            Properties.PasswordChar = '#'
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 15
            Width = 110
          end
          object edtFuncao: TcxDBTextEdit
            Left = 52
            Top = 79
            DataBinding.DataField = 'FUNCAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 16
            Width = 303
          end
          object cxDBCurrencyEdit1: TcxDBCurrencyEdit
            Left = 418
            Top = 79
            DataBinding.DataField = 'COMISSAO'
            DataBinding.DataSource = SourceAncestral
            TabOrder = 17
            Width = 109
          end
          object lbxGrupoSistema: TcxLookupComboBox
            Left = 52
            Top = 103
            ParentFont = False
            Properties.ClearKey = 46
            Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsGrupoUsuario
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 18
            Width = 476
          end
          object btnCadGrupo: TcxButton
            Left = 530
            Top = 102
            Width = 25
            Height = 22
            Cursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 19
            OnClick = btnCadGrupoClick
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
          end
          object SpeedButton4: TcxButton
            Left = 558
            Top = 102
            Width = 25
            Height = 22
            Cursor = crHandPoint
            Hint = 'Excluir Parcela Selecionada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Orientation = 900
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 20
            OnClick = SpeedButton4Click
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
          end
        end
        object tabUsuarios: TcxTabControl
          Left = 0
          Top = 131
          Width = 795
          Height = 277
          Align = alClient
          TabOrder = 1
          Properties.CustomButtons.Buttons = <>
          Properties.TabIndex = 0
          Properties.Tabs.Strings = (
            'Ativos'
            'Inativos'
            'Todos')
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'McSkin'
          OnChange = tabUsuariosChange
          ExplicitLeft = 64
          ExplicitTop = 200
          ExplicitWidth = 289
          ExplicitHeight = 193
          ClientRectBottom = 273
          ClientRectLeft = 4
          ClientRectRight = 791
          ClientRectTop = 28
          object grdUsuario: TcxGrid
            Left = 4
            Top = 28
            Width = 787
            Height = 245
            Align = alClient
            PopupMenu = PopPermissaoUsuario
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            ExplicitLeft = 5
            ExplicitTop = 29
            object grdUsuarioDBTableView1: TcxGridDBTableView
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
              DataController.DataSource = SourceAncestral
              DataController.DetailKeyFieldNames = 'USUARIO_ID'
              DataController.KeyFieldNames = 'USUARIO_ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total:0'
                  Kind = skCount
                  FieldName = 'USUARIO_ID'
                  Column = grdUsuarioDBTableView1USUARIO_ID
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ColumnHeaderHints = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glVertical
              OptionsView.GroupByBox = False
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object grdUsuarioDBTableView1USUARIO_ID: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'USUARIO_ID'
                Width = 70
              end
              object grdUsuarioDBTableView1NOME_COMPLETO: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'NOME_COMPLETO'
                Width = 240
              end
              object grdUsuarioDBTableView1LOGIN: TcxGridDBColumn
                Caption = 'Login'
                DataBinding.FieldName = 'LOGIN'
                Width = 90
              end
              object grdUsuarioDBTableView1SIGLA: TcxGridDBColumn
                Caption = 'Sigla'
                DataBinding.FieldName = 'SIGLA'
                Width = 60
              end
              object grdUsuarioDBTableView1FUNCAO: TcxGridDBColumn
                Caption = 'Fun'#231#227'o'
                DataBinding.FieldName = 'FUNCAO'
                Width = 150
              end
              object grdUsuarioDBTableView1ASSINA: TcxGridDBColumn
                Caption = 'Assina'
                DataBinding.FieldName = 'ASSINA'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = dtmControles.imgCadBasicos
                Properties.Items = <
                  item
                    Description = 'Assina'
                    ImageIndex = 18
                    Value = 'S'
                  end
                  item
                    Description = 'N'#227'o Assina'
                    ImageIndex = 10
                    Value = 'N'
                  end
                  item
                    Description = 'N'#227'o Assina'
                    ImageIndex = 10
                  end>
                Width = 90
              end
              object grdUsuarioDBTableView1SITUACAO: TcxGridDBColumn
                Caption = 'Situa'#231#227'o'
                DataBinding.FieldName = 'SITUACAO'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = dtmControles.imgCadBasicos
                Properties.Items = <
                  item
                    Description = 'Ativo'
                    ImageIndex = 0
                    Value = 'A'
                  end
                  item
                    Description = 'Inativo'
                    ImageIndex = 1
                    Value = 'I'
                  end>
                Width = 80
              end
            end
            object grdUsuarioLevel1: TcxGridLevel
              GridView = grdUsuarioDBTableView1
            end
          end
        end
      end
      object tbsPermissao: TcxTabSheet
        Caption = 'Permiss'#245'es'
        ImageIndex = 1
        object grdRotinas: TcxGrid
          Left = 192
          Top = 80
          Width = 603
          Height = 328
          Align = alClient
          PopupMenu = PopupMenu2
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object grdRotinasDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = True
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.Visible = True
            OnCellClick = grdRotinasDBTableView1CellClick
            OnCustomDrawCell = grdRotinasDBTableView1CustomDrawCell
            DataController.DataSource = dsRotina
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.Appending = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            OnCustomDrawGroupCell = grdRotinasDBTableView1CustomDrawGroupCell
            object grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn
              Caption = 'Rotina'
              DataBinding.FieldName = 'DESCROTINA'
              MinWidth = 320
              Options.Editing = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 320
            end
            object grdRotinasDBTableView1pIncluir: TcxGridDBColumn
              Caption = 'Inc.'
              DataBinding.FieldName = 'pIncluir'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pAlterar: TcxGridDBColumn
              Caption = 'Alt.'
              DataBinding.FieldName = 'pAlterar'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pExcluir: TcxGridDBColumn
              Caption = 'Exc.'
              DataBinding.FieldName = 'pExcluir'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pPesquisar: TcxGridDBColumn
              Caption = 'Pes.'
              DataBinding.FieldName = 'pPesquisar'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pRelatorio: TcxGridDBColumn
              Caption = 'Imp.'
              DataBinding.FieldName = 'pRelatorio'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pEspecial: TcxGridDBColumn
              Caption = 'Esp.'
              DataBinding.FieldName = 'pEspecial'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1DBColumn1: TcxGridDBColumn
              Caption = 'Chave Rotina'
              DataBinding.FieldName = 'CHAVE_ROTINA'
              Visible = False
              Options.Editing = False
              Options.Focusing = False
              Options.Grouping = False
              Width = 120
            end
          end
          object grdRotinasLevel1: TcxGridLevel
            GridView = grdRotinasDBTableView1
          end
        end
        object cxGridBasica: TcxGrid
          Left = 0
          Top = 80
          Width = 192
          Height = 328
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          object gridMenus: TcxGridDBTableView
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
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dtsMenu
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.CancelOnExit = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Background = dtmControles.cxStyle1
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object gridMenusDESCRICAO: TcxGridDBColumn
              Caption = 'Menu'
              DataBinding.FieldName = 'DESCRICAO'
              MinWidth = 160
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.Focusing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 160
            end
          end
          object cxGridBasicaLevel1: TcxGridLevel
            GridView = gridMenus
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 795
          Height = 40
          Align = alTop
          BevelInner = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 2
          object Label1: TLabel
            Left = 27
            Top = 14
            Width = 39
            Height = 13
            Caption = 'Grupo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lcbGrupos: TcxLookupComboBox
            Left = 78
            Top = 10
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
            Properties.ListColumns = <
              item
                Caption = 'Descri'#231#227'o'
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsGrupo
            Properties.OnChange = lcbGruposPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 393
          end
          object btnAtualizaGrupo: TcxButton
            Left = 474
            Top = 10
            Width = 95
            Height = 22
            Caption = 'Atualizar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnAtualizaGrupoClick
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              E6040000424DE604000000000000360000002800000014000000140000000100
              180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FEFEFEF9F9F9F3F3F3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFCFCFCF4F4F4FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5D1
              D1D1E5E5E5D3D3D3DDDDDDF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2DBDBDB
              CFCFCFE8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBDEDEDEFFFF
              FFE6E6E6C4C4C4CACACAE1E1E1E3E3E3E3E3E3DFDFDFC9C9C9C5C5C5E6E6E6FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
              FFFFFFE1E1E1848484535353535353828282DCDCDCFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777B9B9B9FFFFFFE9E9E96767671D
              1D1D1D1D1D1D1D1D1D1D1D1E1E1E1C1C1C676767ECECECFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF5050501D1D1DACACAC181818191919646464C2C2
              C2DCDCDCDADADAB9B9B95757571A1A1A1A1A1AC7C7C7FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF7A7A7A1919191818183B3B3BD7D7D7FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFBDBDBD1818181B1B1BEFEFEFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF757575191919191919787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFD4D4D41B1B1B404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              6464641B1B1B1919191A1A1A7C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF7E7E7E1B1B1BCDCDCDFFFFFFFFFFFFFFFFFFFFFFFF92929245
              4545494949464646393939D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFDFDFDF191919878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
              FDFD1A1A1A444444FFFFFFFFFFFFFFFFFFFFFFFF7878787C7C7CFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBE
              BEC4C4C4FFFFFFFFFFFFFFFFFFFFFFFF232323191919FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFEFEFEC2C2C2D3D3D3D6D6D6D7D7D7FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF939393191919D0D0D0FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFEFEFE8B8B8B1A1A1A1919191919191A1A1AB5B5B5FFFFFFFF
              FFFFFFFFFFFFFFFFF9F9F9191919313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9D9D9D1E1E1E191919191919B8B8B8FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFB1B1B11818185F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF282828191919191919BBBBBBFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF878787181818323232A4A4A4F2F2F2FFFFFFFFFFFFEAEAEA9A9A
              9A1D1D1D1919195555551A1A1ABABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFB0B0B01919191919191919191919191919191919191919192C2C2C
              CECECEFFFFFF424242909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFCFCFCABABAB6767674343434646466C6C6CB6B6B6FFFFFFFFFFFFFF
              FFFFF1F1F1D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
          end
        end
        object pnlCopiarPermissoa: TPanel
          Left = 0
          Top = 40
          Width = 795
          Height = 40
          Align = alTop
          BevelInner = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object Label4: TLabel
            Left = 27
            Top = 13
            Width = 48
            Height = 13
            Caption = 'Destino:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbxGrupoDestino: TcxLookupComboBox
            Left = 78
            Top = 10
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
            Properties.ListColumns = <
              item
                Caption = 'Descri'#231#227'o'
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsGrupo
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 393
          end
          object btnConfirmarCopiaGrupo: TcxButton
            Left = 474
            Top = 9
            Width = 95
            Height = 22
            HelpType = htKeyword
            Caption = 'Confirmar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnConfirmarCopiaGrupoClick
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
          end
          object btnCancelarPesquisarCertidao: TcxButton
            Left = 573
            Top = 9
            Width = 95
            Height = 22
            Caption = 'Cancelar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnCancelarPesquisarCertidaoClick
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
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 565
    Top = 231
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'select * from '#13#10'G_USUARIO '#13#10'order by NOME_COMPLETO'
    Left = 595
    Top = 231
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 627
    Top = 231
  end
  inherited ClientAncestral: TClientDataSet
    BeforeOpen = ClientAncestralBeforeOpen
    AfterOpen = ClientAncestralAfterOpen
    AfterScroll = ClientAncestralAfterScroll
    Left = 659
    Top = 231
    object ClientAncestralUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralTROCARSENHA: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object ClientAncestralLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object ClientAncestralSENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object ClientAncestralFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object ClientAncestralASSINA: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 10
    end
    object ClientAncestralCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 20
      Size = 3
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 691
    Top = 231
  end
  object sqlGrupo: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT DISTINCT UG.* FROM G_USUARIO_SISTEMA US'#13#10'LEFT JOIN G_USUA' +
      'RIO_GRUPO UG ON'#13#10'   US.USUARIO_GRUPO_ID = UG.USUARIO_GRUPO_ID'#13#10'W' +
      'HERE US.SISTEMA_ID = :SISTEMA_ID AND'#13#10'               UG.SITUACAO' +
      ' =  '#39'A'#39'        '#13#10'ORDER BY UG.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '7'
      end>
    Params = <>
    Left = 289
    Top = 281
    object sqlGrupoUSUARIO_GRUPO_ID: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlGrupoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dsGrupo: TDataSource
    DataSet = sqlGrupo
    Left = 321
    Top = 281
  end
  object dsRotina: TDataSource
    DataSet = sqlRotina
    Left = 251
    Top = 280
  end
  object sqlGrupoUsuario: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_USUARIO_GRUPO'#13#10'where SITUACAO = '#39'A'#39#13#10'order by DE' +
      'SCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 359
    Top = 281
    object FMTBCDField1: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsGrupoUsuario: TDataSource
    DataSet = sqlGrupoUsuario
    Left = 391
    Top = 281
  end
  object ImageList1: TImageList
    Left = 216
    Top = 240
    Bitmap = {
      494C010102000400380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE00000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD00000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001094CE001094CE001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC1FFC1F00000000F007F00700000000
      E003E00300000000C001C00100000000C001C00100000000C001C00100000000
      C001C00100000000C001C00100000000E003E00300000000FFC7F1C700000000
      F1C7F1C700000000F1C7F00700000000F1C7F80F00000000F007FC1F00000000
      F80FFFFF00000000FC1FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object sqlMenu: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_SISTEMA_MENU '#13#10'where SISTEMA_ID = :SISTEMA_ID'#13#10'o' +
      'rder by DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforeOpen = sqlMenuBeforeOpen
    AfterOpen = sqlMenuAfterOpen
    AfterScroll = sqlMenuAfterScroll
    Left = 433
    Top = 281
    object sqlMenuSISTEMA_MENU_ID: TFMTBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlMenuDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlMenuSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsMenu: TDataSource
    DataSet = sqlMenu
    Left = 465
    Top = 281
  end
  object PopupMenu1: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 139
    Top = 194
    object CopirarPermisso1: TMenuItem
      Caption = 'Copirar Permiss'#227'o'
      ImageIndex = 2
      OnClick = CopirarPermisso1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 491
    Top = 250
    object MarcarEste1: TMenuItem
      Caption = 'Marcar Este'
      ImageIndex = 6
      OnClick = MarcarEste1Click
    end
    object DesmarcarEste1: TMenuItem
      Caption = 'Desmarcar Este'
      ImageIndex = 7
      OnClick = DesmarcarEste1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MarcarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      ImageIndex = 0
      OnClick = MarcarTodos1Click
    end
    object DesmarcarTodos1: TMenuItem
      Caption = 'Desmarcar Todos'
      ImageIndex = 1
      OnClick = DesmarcarTodos1Click
    end
  end
  object sqlRotina: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT R.SISTEMA_ROTINA_ID,'#13#10'       R.DESCRICAO DESCROTINA,'#13#10'   ' +
      '    R.SISTEMA_MENU_ID,'#13#10'       R.CHAVE_ROTINA,'#13#10'       PG.PERMIS' +
      'SAO'#13#10'FROM G_SISTEMA_ROTINA R'#13#10'LEFT JOIN G_PERMISSAO_GRUPO PG ON'#13 +
      #10'     R.SISTEMA_ROTINA_ID = PG.SISTEMA_ROTINA_ID AND'#13#10'     PG.US' +
      'UARIO_GRUPO_ID = :USUARIO_GRUPO_ID'#13#10'WHERE R.SISTEMA_MENU_ID = :S' +
      'ISTEMA_MENU_ID'#13#10'ORDER BY  R.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIO_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SISTEMA_MENU_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforePost = sqlRotinaBeforePost
    AfterPost = sqlRotinaAfterPost
    OnCalcFields = sqlRotinaCalcFields
    Left = 216
    Top = 280
    object sqlRotinaCHAVE_ROTINA: TStringField
      FieldName = 'CHAVE_ROTINA'
      Size = 30
    end
    object sqlRotinaSISTEMA_MENU_ID: TFMTBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Precision = 15
      Size = 2
    end
    object sqlRotinaDESCROTINA: TStringField
      FieldName = 'DESCROTINA'
      Size = 60
    end
    object sqlRotinaSISTEMA_ROTINA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlRotinaPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 10
    end
    object sqlRotinapIncluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pIncluir'
      Size = 1
    end
    object sqlRotinapAlterar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pAlterar'
      Size = 1
    end
    object sqlRotinapExcluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pExcluir'
      Size = 1
    end
    object sqlRotinapPesquisar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pPesquisar'
      Size = 1
    end
    object sqlRotinapRelatorio: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pRelatorio'
      Size = 1
    end
    object sqlRotinapEspecial: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pEspecial'
      Size = 1
    end
  end
  object PopPermissaoUsuario: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 131
    Top = 314
    object MenuItem1: TMenuItem
      Caption = 'Permiss'#227'o Usu'#225'rio'
      ImageIndex = 2
      OnClick = MenuItem1Click
    end
  end
end