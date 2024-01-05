inherited frmMarcacaoTipo: TfrmMarcacaoTipo
  Left = 104
  Top = 152
  Caption = 'Controle de Marca'#231#245'es'
  ClientHeight = 631
  ClientWidth = 798
  OldCreateOrder = True
  ExplicitWidth = 814
  ExplicitHeight = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 798
    ExplicitWidth = 798
    inherited PanelBotoesBasicos: TPanel
      Width = 716
      ExplicitWidth = 716
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
      object chkShowMarcacaoInterna: TCheckBox
        Left = 385
        Top = 32
        Width = 114
        Height = 17
        Caption = 'Marca'#231#245'es Internas'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        OnClick = chkShowMarcacaoInternaClick
      end
      object btnAtualiza: TcxButton
        Left = 385
        Top = 4
        Width = 106
        Height = 25
        Caption = 'Atualizar'
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
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnAtualizaClick
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 718
      ExplicitLeft = 718
    end
  end
  inherited StatusBar: TStatusBar
    Top = 611
    Width = 798
    ExplicitTop = 611
    ExplicitWidth = 798
  end
  inherited PanelGeral: TPanel
    Width = 798
    Height = 555
    ExplicitWidth = 798
    ExplicitHeight = 555
    inherited PanelData: TPanel
      Width = 796
      Height = 168
      Visible = False
      ExplicitWidth = 796
      ExplicitHeight = 168
      object Shape1: TShape
        Left = 7
        Top = 59
        Width = 777
        Height = 31
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object cxLabel1: TcxLabel
        Left = 15
        Top = 33
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel2: TcxLabel
        Left = 15
        Top = 9
        Caption = 'Nome: '
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel3: TcxLabel
        Left = 320
        Top = 9
        Caption = 'Grupo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel4: TcxLabel
        Left = 234
        Top = 65
        Caption = 'Tipo do Valor:'
      end
      object chbSituacao: TcxDBCheckBox
        Left = 711
        Top = 64
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
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 7
        Transparent = True
        Height = 21
        Width = 57
      end
      object lblInfoMarcacaoInterna: TcxLabel
        Left = 453
        Top = 93
        AutoSize = False
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = True
        Style.TextColor = clRed
        StyleDisabled.TextColor = clRed
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 23
        Width = 332
        AnchorX = 619
        AnchorY = 105
      end
      object cxLabel5: TcxLabel
        Left = 458
        Top = 65
        Caption = 'Tipo Qualifica'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object pnlMarcacaoValor: TPanel
        Left = 1
        Top = 119
        Width = 794
        Height = 48
        Align = alBottom
        BevelInner = bvLowered
        Color = clWindow
        TabOrder = 15
        Visible = False
        object lblTabela: TLabel
          Left = 13
          Top = 7
          Width = 33
          Height = 13
          Caption = 'Tabela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 191
          Top = 7
          Width = 33
          Height = 13
          Caption = 'Campo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 526
          Top = 7
          Width = 41
          Height = 13
          Caption = 'Mascara'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 363
          Top = 7
          Width = 47
          Height = 13
          Caption = 'ID Campo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cbxTabela: TcxComboBox
          Left = 14
          Top = 21
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.DropDownListStyle = lsFixedList
          Properties.OnEditValueChanged = cbxTabelaPropertiesEditValueChanged
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 0
          Width = 171
        end
        object cbxCampo: TcxComboBox
          Left = 191
          Top = 21
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbxCampoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 164
        end
        object btnMarcacaoValor: TcxButton
          Left = 678
          Top = 19
          Width = 106
          Height = 25
          Hint = 'Dicion'#225'rio de Palavras - Gram'#225'tica'
          Caption = 'Incluir'
          Colors.Default = clWindow
          Enabled = False
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            0800000000009001000000000000000000000001000000000000000000000101
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
          TabOrder = 4
          OnClick = btnMarcacaoValorClick
        end
        object cbxMascara: TcxImageComboBox
          Left = 524
          Top = 21
          ParentFont = False
          Properties.Items = <
            item
              Description = 'DataExtenso'
              ImageIndex = 0
              Value = 'D1'
            end
            item
              Description = 'AnoExtenso*'
              Value = 'D10'
            end
            item
              Description = 'DataExtensoSimples'
              Value = 'D11'
            end
            item
              Description = 'DiaExtensoSimples*'
              Value = 'D12'
            end
            item
              Description = 'DiasNome'
              Value = 'D13'
            end
            item
              Description = 'DiaExtensoSimples'
              Value = 'D14'
            end
            item
              Description = 'DataSimples'
              Value = 'D15'
            end
            item
              Description = 'AnoExtenso'
              Value = 'D2'
            end
            item
              Description = 'MesExtenso'
              Value = 'D3'
            end
            item
              Description = 'DiaExtenso'
              Value = 'D4'
            end
            item
              Description = 'AnoNumero'
              Value = 'D5'
            end
            item
              Description = 'MesNumero'
              Value = 'D6'
            end
            item
              Description = 'DiaNumero'
              Value = 'D7'
            end
            item
              Description = 'DiaExtenso*'
              Value = 'D8'
            end
            item
              Description = 'MesExtenso*'
              Value = 'D9'
            end
            item
              Description = 'MascaraFloat'
              Value = 'F1'
            end
            item
              Description = 'EstadoExtenso'
              Value = 'F10'
            end
            item
              Description = 'IdadeAno'
              Value = 'F11'
            end
            item
              Description = 'Maiusculo'
              Value = 'F12'
            end
            item
              Description = 'CPFCNPJ'
              Value = 'F13'
            end
            item
              Description = 'LocalizarSubstuituir'
              Value = 'F14'
            end
            item
              Description = 'Numerador'
              Value = 'F15'
            end
            item
              Description = 'QrCode'
              Value = 'F16'
            end
            item
              Description = 'Minusculo'
              Value = 'F17'
            end
            item
              Description = 'CondicaoVazio'
              Value = 'F18'
            end
            item
              Description = 'CPFCNPJCondicaoAntes'
              Value = 'F19'
            end
            item
              Description = 'MaiusculoMinusculo'
              Value = 'F2'
            end
            item
              Description = 'Doi'
              Value = 'F3'
            end
            item
              Description = 'MascaraTexto'
              Value = 'F4'
            end
            item
              Description = 'Concordancia'
              Value = 'F5'
            end
            item
              Description = 'Condicao'
              Value = 'F6'
            end
            item
              Description = 'CondicaoDiferenteIgual'
              Value = 'F7'
            end
            item
              Description = 'UsarFonteCodigo'
              Value = 'F8'
            end
            item
              Description = 'ConcatenarAntes'
              Value = 'F9'
            end
            item
              Description = 'HoraMinuto'
              Value = 'H1'
            end
            item
              Description = 'HoraMinutoTexto'
              Value = 'H2'
            end
            item
              Description = 'HoraMinutoTextoSimples'
              Value = 'H3'
            end
            item
              Description = 'HoraMinutoSegundo'
              Value = 'H4'
            end
            item
              Description = 'ValorExtenso'
              Value = 'V1'
            end
            item
              Description = 'ValorNumerico'
              Value = 'V2'
            end
            item
              Description = 'ValorNumeroInteiro'
              Value = 'V3'
            end
            item
              Description = 'ValorTextoInteiro'
              Value = 'V4'
            end
            item
              Description = 'ValorRetornarNumero'
              Value = 'V5'
            end
            item
              Description = 'ValorSomatorioLista'
              Value = 'V6'
            end>
          Properties.OnChange = cbxMascaraPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Width = 149
        end
        object cbxCampoID: TcxComboBox
          Left = 362
          Top = 21
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbxCampoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 156
        end
      end
      object cxLabel6: TcxLabel
        Left = 15
        Top = 65
        Caption = 'Tipo Grupo:'
      end
      object lblcondicaoSql: TcxLabel
        Left = 14
        Top = 96
        Caption = 'Condi'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object gbxSeparadores: TcxGroupBox
        Left = 544
        Top = 2
        Caption = ' Separadores                                    '
        ParentColor = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 3
        Visible = False
        Height = 50
        Width = 241
        object lblSeparadorMeio: TcxLabel
          Left = 9
          Top = 23
          Caption = 'Meio:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object cxLabel9: TcxLabel
          Left = 76
          Top = 23
          Caption = 'Pr'#233'-Final:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object lblSeparadorFinal: TcxLabel
          Left = 161
          Top = 23
          Caption = 'Final:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtSeparadorMeio: TcxDBTextEdit
          Left = 38
          Top = 21
          DataBinding.DataField = 'SEPARADOR_1'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.MaxLength = 3
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 0
          Width = 39
        end
        object edtSeparadorPre: TcxDBTextEdit
          Left = 122
          Top = 21
          DataBinding.DataField = 'SEPARADOR_2'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.MaxLength = 3
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 1
          Width = 39
        end
        object edtSeparadorFinal: TcxDBTextEdit
          Left = 189
          Top = 21
          DataBinding.DataField = 'SEPARADOR_3'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.MaxLength = 3
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 2
          Width = 40
        end
        object cxDBCheckBox2: TcxDBCheckBox
          Left = 105
          Top = -4
          RepositoryItem = dtmLookup.Check_SimNao
          AutoSize = False
          Caption = 'Ativar Separador '
          DataBinding.DataField = 'ATIVAR_SEPARADOR'
          DataBinding.DataSource = SourceAncestral
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = 'S'
          Properties.DisplayGrayed = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          Style.IsFontAssigned = True
          TabOrder = 6
          Transparent = True
          Height = 21
          Width = 122
        end
      end
      object edtNome: TcxDBTextEdit
        Left = 86
        Top = 7
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 0
        OnKeyPress = edtNomeKeyPress
        Width = 229
      end
      object cbxGrupoValor: TcxComboBox
        Left = 356
        Top = 7
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.OnChange = cbxGrupoValorPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 1
        Width = 183
      end
      object edtDescricao: TcxDBTextEdit
        Left = 86
        Top = 31
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 371
      end
      object icxTipoGrupo: TcxDBImageComboBox
        Left = 86
        Top = 63
        DataBinding.DataField = 'GRUPO_TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Vari'#225'vel'
            ImageIndex = 0
            Value = 'V'
          end
          item
            Description = 'Qualifica'#231#227'o'
            Value = 'Q'
          end
          item
            Description = 'Pr'#233'-Minuta'
            Value = 'M'
          end>
        Properties.OnChange = icxTipoGrupoPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 4
        Width = 143
      end
      object cbxTipoValor: TcxDBImageComboBox
        Left = 304
        Top = 64
        RepositoryItem = dtmLookup.Combo_TiposValoresMarcacoes
        DataBinding.DataField = 'TIPO_VALOR'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Properties.OnEditValueChanged = cbxTipoValorPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 143
      end
      object icxTipoQualificacao: TcxDBImageComboBox
        Left = 549
        Top = 63
        RepositoryItem = dtmLookup.Combo_TipoQualificacao
        DataBinding.DataField = 'TIPO_QUALIFICACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 156
      end
      object edtCondicaoSql: TcxDBTextEdit
        Left = 86
        Top = 94
        DataBinding.DataField = 'CONDICAO_SQL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 260
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 8
        Width = 360
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 463
        Top = 32
        RepositoryItem = dtmLookup.Check_SimNao
        AutoSize = False
        Caption = 'Protegida'
        DataBinding.DataField = 'PROTEGIDA'
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
        TabOrder = 18
        Transparent = True
        Height = 21
        Width = 74
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 169
      Width = 796
      Height = 385
      Align = alClient
      TabOrder = 1
      object cxGridBasica: TcxGrid
        Left = 1
        Top = 44
        Width = 794
        Height = 114
        Align = alTop
        PopupMenu = popDuplicar
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGridBasicaDBTableView1: TcxGridDBTableView
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
          OnFocusedRecordChanged = cxGridBasicaDBTableView1FocusedRecordChanged
          DataController.DataSource = SourceAncestral
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDBcodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'MARCACAO_TIPO_ID'
            Width = 63
          end
          object cxGridBasicaDBNome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            Width = 170
          end
          object cxGridBasicaDBDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 250
          end
          object cxGridBasicaDBTipo: TcxGridDBColumn
            Caption = 'Tipo Valor'
            DataBinding.FieldName = 'TIPO_VALOR'
            RepositoryItem = dtmLookup.Combo_TiposValoresMarcacoes
            Width = 88
          end
          object cxGridBasicaDBTipoQualificacao: TcxGridDBColumn
            Caption = 'Tipo Qualifica'#231#227'o'
            DataBinding.FieldName = 'TIPO_QUALIFICACAO'
            RepositoryItem = dtmLookup.Combo_TipoQualificacao
            Width = 126
          end
          object cxGridBasicaDBSituacao: TcxGridDBColumn
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
            Width = 75
          end
          object cxGridBasicaDBGrupo: TcxGridDBColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'GRUPO'
            Visible = False
            GroupIndex = 0
          end
        end
        object cxGridBasicaLevel1: TcxGridLevel
          GridView = cxGridBasicaDBTableView1
        end
      end
      object splGrdBasica: TcxSplitter
        Left = 1
        Top = 158
        Width = 794
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salTop
        Control = cxGridBasica
      end
      inline fmeEditor: TfmeEditor
        Left = 1
        Top = 166
        Width = 794
        Height = 218
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 1
        ExplicitTop = 166
        ExplicitWidth = 794
        ExplicitHeight = 218
        inherited wptFerramentas: TWPToolbar
          Width = 794
          sel_ActionIcons = [SelOpen, SelSave, SelPrint, SelPrintSetup, SelZoomIn, SelZoomOut]
          FontSizeFrom = 3
          ExplicitWidth = 794
          inherited btnGravacaoAutomatica: TSpeedButton
            Left = 423
            Width = 19
            ExplicitLeft = 423
            ExplicitWidth = 19
          end
          inherited WPToolPanel1: TWPToolPanel
            Left = 442
            ExplicitLeft = 442
          end
          inherited speNumColunas: TcxSpinEdit
            ExplicitHeight = 19
          end
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 794
          ExplicitWidth = 794
        end
        inherited PanelMarcacao: TPanel
          Width = 794
          ExplicitWidth = 794
          inherited lblInfoMarcacaoInterna: TcxLabel
            AnchorX = 657
            AnchorY = 14
          end
          inherited btnDicionarioGramatical: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnMarcacaoAutomatica: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnMarcacaoManual: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnVerificarMarcacao: TcxButton
            LookAndFeel.SkinName = ''
          end
        end
        inherited wptTexto: TWPRichText
          Width = 768
          Height = 90
          RTFVariables = <
            item
              Name = 'Databases'
              SubType = wpxDefault
            end>
          LayoutMode = wplayFullLayout
          EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectSelecting, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpActivateRedo, wpActivateRedoHotkey, wpMoveCPOnPageUpDown]
          ProtectedProp = []
          WriteObjectMode = wobStandard
          ExplicitWidth = 768
          ExplicitHeight = 90
        end
        inherited WPVertRuler1: TWPVertRuler
          Height = 90
          ExplicitHeight = 90
        end
        inherited StatusBar: TStatusBar
          Top = 199
          Width = 794
          ExplicitTop = 199
          ExplicitWidth = 794
        end
        inherited popMinuta: TPopupMenu
          inherited mniRetirarProtecao: TMenuItem
            OnClick = fmeEditormniRetirarProtecaoClick
          end
          object mniAgruparMascaras: TMenuItem
            Caption = 'Agrupar Mascaras'
            OnClick = mniAgruparMascarasClick
          end
          object RetirarAgrupamentodeMascara: TMenuItem
            Caption = 'Retirar Agrupamento de Mascara'
            OnClick = RetirarAgrupamentodeMascaraClick
          end
        end
      end
      object gbxBuscarMarcacao: TcxGroupBox
        Left = 1
        Top = 1
        Align = alTop
        Caption = 'Buscar Marca'#231#227'o (Nome ou Descri'#231#227'o)'
        TabOrder = 3
        Height = 43
        Width = 794
        object btnBuscarMarcacao: TcxButton
          Left = 385
          Top = 13
          Width = 106
          Height = 25
          HelpType = htKeyword
          Caption = 'Buscar'
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
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnBuscarMarcacaoClick
        end
        object EdtBuscar: TcxTextEdit
          Left = 13
          Top = 16
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          OnKeyDown = EdtBuscarKeyDown
          Width = 366
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 565
    Top = 250
  end
  inherited DataSetAncestral: TI9Query
    MasterFields = 'SISTEMA_ID'
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_MARCACAO_TIPO'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID'#13#10 +
        'ORDER BY GRUPO, NOME')
    Left = 595
    Top = 250
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        NumericScale = 2
        ParamType = ptInput
        Size = 34
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 627
    Top = 250
  end
  inherited ClientAncestral: TClientDataSet
    Left = 659
    Top = 250
    object ClientAncestralMARCACAO_TIPO_ID: TBCDField
      FieldName = 'MARCACAO_TIPO_ID'
      Origin = 'MARCACAO_TIPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      DisplayWidth = 120
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 120
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
      Origin = 'TEXTO'
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object ClientAncestralGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 30
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralTIPO_QUALIFICACAO: TStringField
      FieldName = 'TIPO_QUALIFICACAO'
      Origin = 'TIPO_QUALIFICACAO'
      Size = 3
    end
    object ClientAncestralGRUPO_TIPO: TStringField
      FieldName = 'GRUPO_TIPO'
      Origin = 'GRUPO_TIPO'
      Size = 1
    end
    object ClientAncestralTIPO_VALOR: TStringField
      FieldName = 'TIPO_VALOR'
      Origin = 'TIPO_VALOR'
      Size = 1
    end
    object ClientAncestralPROTEGIDA: TStringField
      FieldName = 'PROTEGIDA'
      Origin = 'PROTEGIDA'
      Size = 1
    end
    object ClientAncestralATIVAR_SEPARADOR: TStringField
      FieldName = 'ATIVAR_SEPARADOR'
      Origin = 'ATIVAR_SEPARADOR'
      Size = 1
    end
    object ClientAncestralSEPARADOR_1: TStringField
      FieldName = 'SEPARADOR_1'
      Origin = 'SEPARADOR_1'
      Size = 10
    end
    object ClientAncestralSEPARADOR_2: TStringField
      FieldName = 'SEPARADOR_2'
      Origin = 'SEPARADOR_2'
      Size = 10
    end
    object ClientAncestralSEPARADOR_3: TStringField
      FieldName = 'SEPARADOR_3'
      Origin = 'SEPARADOR_3'
      Size = 10
    end
    object ClientAncestralCONDICAO_SQL: TStringField
      FieldName = 'CONDICAO_SQL'
      Origin = 'CONDICAO_SQL'
      Size = 260
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 691
    Top = 250
  end
  object popDuplicar: TPopupMenu
    Left = 516
    Top = 256
    object actDuplicarItem: TMenuItem
      Caption = 'Duplicar'
      OnClick = actDuplicarItemClick
    end
  end
  object sqlDuplicar: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_MARCACAO_TIPO'#13#10'WHERE MARCACAO_TIPO_ID = 0')
    Left = 480
    Top = 256
    object sqlDuplicarMARCACAO_TIPO_ID: TBCDField
      FieldName = 'MARCACAO_TIPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlDuplicarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlDuplicarTEXTO: TBlobField
      FieldName = 'TEXTO'
    end
    object sqlDuplicarNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sqlDuplicarGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 30
    end
    object sqlDuplicarSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlDuplicarSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 20
      Size = 2
    end
    object sqlDuplicarGRUPO_TIPO: TStringField
      FieldName = 'GRUPO_TIPO'
      Size = 1
    end
    object sqlDuplicarTIPO_QUALIFICACAO: TStringField
      FieldName = 'TIPO_QUALIFICACAO'
      Size = 3
    end
    object sqlDuplicarCONDICAO_SQL: TStringField
      FieldName = 'CONDICAO_SQL'
      Size = 120
    end
    object sqlDuplicarSEPARADOR_1: TStringField
      FieldName = 'SEPARADOR_1'
      Size = 3
    end
    object sqlDuplicarSEPARADOR_2: TStringField
      FieldName = 'SEPARADOR_2'
      Size = 3
    end
    object sqlDuplicarSEPARADOR_3: TStringField
      FieldName = 'SEPARADOR_3'
      Size = 3
    end
    object sqlDuplicarTIPO_VALOR: TStringField
      FieldName = 'TIPO_VALOR'
      Size = 1
    end
    object sqlDuplicarATUALIZAR: TStringField
      FieldName = 'ATUALIZAR'
      Size = 1
    end
    object sqlDuplicarPROTEGIDA: TStringField
      FieldName = 'PROTEGIDA'
      Size = 1
    end
  end
end
