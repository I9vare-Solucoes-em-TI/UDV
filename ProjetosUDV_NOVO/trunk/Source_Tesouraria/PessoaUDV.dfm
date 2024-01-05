inherited frmCadPessoaUDV: TfrmCadPessoaUDV
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 386
  ClientWidth = 893
  ExplicitWidth = 899
  ExplicitHeight = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 893
    ExplicitWidth = 893
    inherited PanelBotoesBasicos: TPanel
      Width = 696
      ExplicitWidth = 696
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 325
          Visible = False
          ExplicitLeft = 325
        end
        inherited cxBtnCancelar: TcxButton
          Left = 133
          ExplicitLeft = 133
        end
        inherited cxBtnGravar: TcxButton
          Left = 69
          ExplicitLeft = 69
        end
        inherited cxBtnExcluir: TcxButton
          Left = 261
          ExplicitLeft = 261
        end
        inherited cxBtnAlterar: TcxButton
          Left = 197
          ExplicitLeft = 197
        end
        inherited cxBtnIncluir: TcxButton
          Left = 5
          ExplicitLeft = 5
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 698
      Width = 193
      ExplicitLeft = 698
      ExplicitWidth = 193
      inherited cxBtnFechar: TcxButton
        Left = 123
        Top = 5
        ExplicitLeft = 123
        ExplicitTop = 5
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 366
    Width = 893
    ExplicitTop = 366
    ExplicitWidth = 893
  end
  inherited PanelGeral: TPanel
    Width = 893
    Height = 310
    ExplicitWidth = 893
    ExplicitHeight = 310
    inherited PanelData: TPanel
      Width = 891
      Height = 308
      Align = alClient
      ExplicitWidth = 891
      ExplicitHeight = 308
      object pgcDados: TcxPageControl
        Left = 1
        Top = 33
        Width = 889
        Height = 274
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet2
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 274
        ClientRectRight = 889
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'Dados do Associado'
          ImageIndex = 0
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 889
            Height = 250
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object Bevel1: TBevel
              Left = 9
              Top = 32
              Width = 857
              Height = 25
              Shape = bsBottomLine
            end
            object cxLabel29: TcxLabel
              Left = 109
              Top = 9
              Caption = 'Nome'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = 4210688
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel1: TcxLabel
              Left = 583
              Top = 9
              Caption = 'Grau'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = 4210688
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel2: TcxLabel
              Left = 730
              Top = 9
              Caption = 'Situa'#231#227'o'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = 4210688
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel6: TcxLabel
              Left = 18
              Top = 9
              Caption = 'Data Cadastro'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel10: TcxLabel
              Left = 15
              Top = 196
              Caption = 'Observa'#231#227'o'
              Style.TextColor = 4210688
              Transparent = True
            end
            object edtData: TcxDBDateEdit
              Left = 18
              Top = 27
              DataBinding.DataField = 'DATA_CADASTRO'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              Properties.SaveTime = False
              Properties.ShowTime = False
              StyleDisabled.TextColor = clBlack
              TabOrder = 5
              Width = 85
            end
            object edtNome: TcxDBTextEdit
              Left = 108
              Top = 27
              DataBinding.DataField = 'NOME'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.CharCase = ecUpperCase
              Style.Color = clSkyBlue
              Style.Shadow = True
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextColor = clBlue
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 6
              Width = 473
            end
            object icxGrau: TcxDBImageComboBox
              Left = 585
              Top = 27
              RepositoryItem = dtmLookup.Combo_Grau
              DataBinding.DataField = 'GRAU'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 7
              Width = 139
            end
            object icxSituacao: TcxDBImageComboBox
              Left = 730
              Top = 27
              RepositoryItem = dtmLookup.Combo_Situacao
              DataBinding.DataField = 'SITUACAO'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 8
              Width = 139
            end
            object cbxGrupo: TcxGroupBox
              Left = 8
              Top = 63
              Caption = 'Grupo do Associado'
              Style.BorderStyle = ebsSingle
              Style.TextStyle = [fsBold]
              TabOrder = 9
              Height = 129
              Width = 345
              object cxLabel4: TcxLabel
                Left = 7
                Top = 16
                Caption = 'Vinculo do Grupo Familiar'
                Style.TextColor = 4210688
                Transparent = True
              end
              object lcxGrupo: TcxDBLookupComboBox
                Left = 7
                Top = 34
                RepositoryItem = dtmLookup.Lista_GrupoAssociadoAtivo
                DataBinding.DataField = 'PESSOA_GRUPO_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.ListColumns = <>
                Properties.OnEditValueChanged = lcxGrupoPropertiesEditValueChanged
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 1
                Width = 270
              end
              object chxEmailGrupo: TcxDBCheckBox
                Left = 10
                Top = 67
                Caption = 'Email do Associado Padr'#227'o do Grupo?'
                DataBinding.DataField = 'EMAIL_GRUPO_PADRAO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayChecked = 'S'
                Properties.DisplayUnchecked = 'N'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 2
                Transparent = True
                OnClick = chxEmailOutroAssociadoClick
                Width = 208
              end
              object chxPessoaPadrao: TcxDBCheckBox
                Left = 10
                Top = 90
                Caption = 'Dados do Associado Padr'#227'o do Boleto?'
                DataBinding.DataField = 'PRINCIPAL'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayChecked = 'S'
                Properties.DisplayUnchecked = 'N'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 3
                Transparent = True
                OnClick = chxEmailOutroAssociadoClick
                Width = 237
              end
              object btnAdGrupo: TcxButton
                Left = 281
                Top = 32
                Width = 28
                Height = 23
                Cursor = crHandPoint
                Hint = 'Adicionar Parcela'
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
                ParentShowHint = False
                ShowHint = True
                SpeedButtonOptions.Flat = True
                SpeedButtonOptions.Transparent = True
                TabOrder = 4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Orientation = 900
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btnAdGrupoClick
              end
              object sbnLimparFiltro: TcxButton
                Left = 312
                Top = 32
                Width = 28
                Height = 23
                Cursor = crHandPoint
                Hint = 'Excluir Parcela'
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
                ParentShowHint = False
                ShowHint = True
                SpeedButtonOptions.Flat = True
                SpeedButtonOptions.Transparent = True
                TabOrder = 5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Orientation = 900
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = sbnLimparFiltroClick
              end
            end
            object cxGroupBox2: TcxGroupBox
              Left = 358
              Top = 63
              Caption = 'Dados da Fatura e Envio'
              Style.BorderStyle = ebsSingle
              Style.TextStyle = [fsBold]
              TabOrder = 10
              Height = 129
              Width = 524
              object cxLabel3: TcxLabel
                Left = 7
                Top = 20
                Caption = 'Fatura Email'
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel11: TcxLabel
                Left = 180
                Top = 20
                Caption = 'Email Pessoal'
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Transparent = True
              end
              object lblEmailOutroAssociado: TcxLabel
                Left = 7
                Top = 81
                Caption = 'Pra qual Associado deseja encaminhar o email?'
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Transparent = True
              end
              object cxLabel5: TcxLabel
                Left = 83
                Top = 20
                Caption = 'Tipo Fatura'
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Transparent = True
              end
              object icxBoleto: TcxImageComboBox
                Left = 9
                Top = 38
                RepositoryItem = dtmLookup.Combo_SimNao
                ParentFont = False
                Properties.Items = <>
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                StyleDisabled.TextColor = clBlack
                TabOrder = 4
                Width = 72
              end
              object icxFatura: TcxDBImageComboBox
                Left = 85
                Top = 37
                RepositoryItem = dtmLookupContabil.Combo_FaturaTipo
                DataBinding.DataField = 'FATURA_TIPO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.Items = <>
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                Style.TextStyle = [fsBold]
                StyleDisabled.TextColor = clBlack
                TabOrder = 5
                Width = 92
              end
              object edtEmail: TcxDBTextEdit
                Left = 181
                Top = 38
                DataBinding.DataField = 'EMAIL'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.CharCase = ecLowerCase
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                StyleDisabled.TextColor = 4210688
                TabOrder = 6
                Width = 330
              end
              object chxEmailOutroAssociado: TcxDBCheckBox
                Left = 8
                Top = 62
                Caption = 'Usar Email de Outro Associado'
                DataBinding.DataField = 'EMAIL_TERCEIRO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayChecked = 'S'
                Properties.DisplayUnchecked = 'N'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Properties.OnEditValueChanged = chxEmailOutroAssociadoPropertiesEditValueChanged
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 7
                Transparent = True
                OnClick = chxEmailOutroAssociadoClick
                Width = 173
              end
              object lcxOutroAssociado: TcxDBLookupComboBox
                Left = 9
                Top = 101
                RepositoryItem = dtmLookup.Lista_Pessoas
                DataBinding.DataField = 'PESSOA_TERCEIRO_ID'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.ListColumns = <>
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 8
                Width = 503
              end
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 15
              Top = 215
              DataBinding.DataField = 'OBSERVACAO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 11
              Width = 854
            end
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Dados Pessoais e Contato'
          ImageIndex = 1
          object pnlDadosPessoais: TPanel
            Left = 0
            Top = 0
            Width = 889
            Height = 250
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            ExplicitLeft = -1
            ExplicitTop = -1
            object Bevel2: TBevel
              Left = 8
              Top = 36
              Width = 773
              Height = 8
              Shape = bsBottomLine
            end
            object lblEndereco: TcxLabel
              Left = 11
              Top = 56
              Caption = 'End.:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel34: TcxLabel
              Left = 295
              Top = 56
              Caption = 'Bairro:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel35: TcxLabel
              Left = 548
              Top = 56
              Caption = 'Cidade:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel36: TcxLabel
              Left = 12
              Top = 84
              Caption = 'UF:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object lblTelefone: TcxLabel
              Left = 295
              Top = 85
              Caption = 'Telefone(s):'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel38: TcxLabel
              Left = 95
              Top = 85
              Caption = 'Cep:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel30: TcxLabel
              Left = 548
              Top = 17
              Caption = 'Sexo:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel7: TcxLabel
              Left = 11
              Top = 17
              Caption = 'CPF/CNPJ:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel8: TcxLabel
              Left = 295
              Top = 17
              Caption = 'Documento:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object edtCPFCNPJ: TcxDBMaskEdit
              Left = 72
              Top = 16
              DataBinding.DataField = 'CPF'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.MaxLength = 0
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 9
              Width = 215
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 357
              Top = 16
              DataBinding.DataField = 'RG'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 10
              Width = 185
            end
            object icxSexo: TcxDBImageComboBox
              Left = 591
              Top = 16
              RepositoryItem = dtmLookup.Combo_Sexo
              DataBinding.DataField = 'SEXO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 11
              Width = 67
            end
            object edtEndereco: TcxDBTextEdit
              Left = 44
              Top = 54
              DataBinding.DataField = 'ENDERECO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 12
              Width = 243
            end
            object cxDBTextEdit15: TcxDBTextEdit
              Left = 357
              Top = 54
              DataBinding.DataField = 'BAIRRO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 13
              Width = 185
            end
            object cxDBTextEdit16: TcxDBTextEdit
              Left = 591
              Top = 54
              DataBinding.DataField = 'CIDADE'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 14
              Width = 250
            end
            object cxDBComboBox3: TcxDBComboBox
              Left = 44
              Top = 82
              RepositoryItem = dtmLookup.Combo_UF
              DataBinding.DataField = 'UF'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 15
              Width = 45
            end
            object cxDBMaskEdit1: TcxDBMaskEdit
              Left = 124
              Top = 82
              DataBinding.DataField = 'CEP'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.EditMask = '99\.999\-999;0;_'
              Properties.MaxLength = 0
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 16
              Width = 163
            end
            object edtTelefone: TcxDBMaskEdit
              Left = 357
              Top = 82
              DataBinding.DataField = 'TELEFONES'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.MaxLength = 0
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 17
              Width = 485
            end
          end
        end
      end
      object lbllInformacao: TcxLabel
        Left = 1
        Top = 1
        Align = alTop
        AutoSize = False
        Caption = 'Existe Boleto Vinculado. Altera'#231#227'o de Grupo n'#227'o permitida!!!'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsOffice11
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'GlassOceans'
        Style.Shadow = False
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'GlassOceans'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'GlassOceans'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'GlassOceans'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 32
        Width = 889
        AnchorX = 446
        AnchorY = 17
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 589
    Top = 58
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM T_PESSOA'
    Left = 619
    Top = 58
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 651
    Top = 58
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 683
    Top = 58
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
    object ClientAncestralCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object ClientAncestralRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object ClientAncestralENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object ClientAncestralBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ClientAncestralCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object ClientAncestralUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object ClientAncestralTELEFONES: TStringField
      FieldName = 'TELEFONES'
      Size = 60
    end
    object ClientAncestralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 90
    end
    object ClientAncestralGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 90
    end
    object ClientAncestralDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object ClientAncestralBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
    object ClientAncestralCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ClientAncestralPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCODIGO_UDV: TStringField
      FieldName = 'CODIGO_UDV'
      Size = 10
    end
    object ClientAncestralEMAIL_TERCEIRO: TStringField
      FieldName = 'EMAIL_TERCEIRO'
      Size = 1
    end
    object ClientAncestralPESSOA_TERCEIRO_ID: TFMTBCDField
      FieldName = 'PESSOA_TERCEIRO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientAncestralEMAIL_GRUPO_PADRAO: TStringField
      FieldName = 'EMAIL_GRUPO_PADRAO'
      Size = 1
    end
    object ClientAncestralFATURA_TIPO: TStringField
      FieldName = 'FATURA_TIPO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 715
    Top = 58
  end
end
