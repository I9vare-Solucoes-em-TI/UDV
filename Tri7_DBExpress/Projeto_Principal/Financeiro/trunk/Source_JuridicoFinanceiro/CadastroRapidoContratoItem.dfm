inherited frmCadastroRapidoContratoItem: TfrmCadastroRapidoContratoItem
  ClientHeight = 454
  ClientWidth = 641
  KeyPreview = True
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 647
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 641
    ExplicitWidth = 641
    inherited lblInformaca: TcxLabel
      Caption = 'Item do Contrato'
      Style.IsFontAssigned = True
      ExplicitWidth = 606
      Width = 606
      AnchorY = 19
    end
    inherited btnCancelar: TcxButton
      Left = 433
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 433
      ExplicitTop = 10
    end
    inherited btnConfirmar: TcxButton
      Left = 534
      Top = 10
      Caption = 'Confirmar'
      LookAndFeel.SkinName = ''
      ExplicitLeft = 534
      ExplicitTop = 10
    end
  end
  inherited Panel1: TPanel
    Width = 641
    Height = 416
    ExplicitWidth = 641
    ExplicitHeight = 416
    object pgcPersonalizados: TcxPageControl
      Left = 8
      Top = 171
      Width = 620
      Height = 238
      TabOrder = 0
      Properties.ActivePage = tabValorPersonalizado
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      ClientRectBottom = 234
      ClientRectLeft = 4
      ClientRectRight = 616
      ClientRectTop = 28
      object tabValorPersonalizado: TcxTabSheet
        Caption = 'Valores Personalizados'
        ImageIndex = 0
        object cbxParcelas: TcxGroupBox
          Left = 1
          Top = 30
          Caption = 'Defina o Per'#237'odo e Valor das Parcelas'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnExit = cbxParcelasExit
          Height = 176
          Width = 607
          object gridParcelas: TDBCtrlGrid
            Left = 2
            Top = 35
            Width = 603
            Height = 139
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            DataSource = dtmLookupServico.dtsParcelas
            PanelBorder = gbNone
            PanelHeight = 23
            PanelWidth = 586
            TabOrder = 0
            RowCount = 6
            object edtParcelaDataVencimento: TcxDBDateEdit
              Left = 4
              Top = 1
              DataBinding.DataField = 'DATA_VENCIMENTO'
              DataBinding.DataSource = dtmLookupServico.dtsParcelas
              ParentFont = False
              Properties.SaveTime = False
              Properties.ShowTime = False
              Properties.OnEditValueChanged = edtParcelaDataVencimentoPropertiesEditValueChanged
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 0
              Width = 101
            end
            object edtParcelaValor: TcxDBCurrencyEdit
              Left = 111
              Top = 1
              DataBinding.DataField = 'VALOR_PARCELA'
              DataBinding.DataSource = dtmLookupServico.dtsParcelas
              ParentFont = False
              Properties.OnEditValueChanged = edtParcelaValorPropertiesEditValueChanged
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 1
              Width = 125
            end
            object edtParcelaSituacao: TcxDBImageComboBox
              Left = 240
              Top = 1
              RepositoryItem = dtmLookupContabil.Combo_SituacaoPagamento
              DataBinding.DataField = 'SITUACAO'
              DataBinding.DataSource = dtmLookupServico.dtsParcelas
              Enabled = False
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 2
              Width = 342
            end
          end
          object HeaderControl1: THeaderControl
            Left = 2
            Top = 18
            Width = 603
            Height = 17
            Sections = <
              item
                ImageIndex = -1
                Text = 'Data Vencimento'
                Width = 110
              end
              item
                ImageIndex = -1
                Text = 'Valor Parcela'
                Width = 130
              end
              item
                ImageIndex = -1
                Text = 'Situa'#231#227'o'
                Width = 345
              end>
          end
        end
        object btnDuplicarParcela: TcxButton
          Left = 309
          Top = 19
          Width = 28
          Height = 23
          Cursor = crHandPoint
          Hint = 'Duplica Parcela + 1 M'#234's '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Orientation = 900
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnDuplicarParcelaClick
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000120B0000120B0000000100000000000000000000C1C1
            C100747474004747470023232300FFFFFF00ADADAD0017171700DEDEDE008989
            8900101010002E2E2E000C0C0C00ECECEC005C5C5C00D1D1D100999999007C7C
            7C002A2A2A00080808001C1C1C0057575700B5B5B500CCCCCC00333333001414
            1400F8F8F80027272700040404005F5F5F00E7E7E700535353007A7A7A001A1A
            1A00D8D8D800F6F6F60085858500C7C7C7009F9F9F008E8E8E00F4F4F4006666
            660039393900B0B0B000B9B9B9004C4C4C00181818008C8C8C00E3E3E3001F1F
            1F00D5D5D50081818100EAEAEA00B7B7B7000E0E0E0006060600777777009999
            9900B3B3B300AFAFAF0058585800C3C3C300FBFBFB00DBDBDB00C9C9C9009191
            9100000000000000000000000000000000000000000000000000000000000000
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
            05051737000000000000000013020505050505050505061C1C1C1C1C1C1C1C1C
            1C0A050505050505050506131313131313131313131305050505050505053B0C
            0C0C0C0C0C0C0C0C0C0C05050505050505052B0A0A0A0A0A0A0A0A0A0A0A0505
            0505050505053A191919191919191919191905240E0E0E0E08053A2E2E2E2E2E
            2E2E2E2E2E2E051C1C1C1C1C4005161414141414141414141414051313131313
            170516313131313112022F110E31050C0C0C0C0C170535040404040402053227
            150B050A0A0A0A0A0F052C1B1B1B1B1B41221B1B153005191919191925052C12
            121212120910121D1A050507070707072C05160B0B0B0B0B3C1F0E2305050514
            1414141426051E3311111111382F3E0505050531313131310328050505050505
            0505050505050504040404040401050D34300505050505050505051B1B1B1B1B
            1B3F10181210050505050505050505121212121212012D122F05050505050505
            0505050B0B0B0B0B0B242A100505050505050505050505291818181818182405
            05050505050505050505}
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
        end
        object btnExcluirParcela: TcxButton
          Left = 278
          Top = 19
          Width = 28
          Height = 23
          Cursor = crHandPoint
          Hint = 'Excluir Parcela'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Orientation = 900
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnExcluirParcelaClick
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
        object btnAdicionarParcela: TcxButton
          Left = 247
          Top = 19
          Width = 28
          Height = 23
          Cursor = crHandPoint
          Hint = 'Adicionar Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Orientation = 900
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnAdicionarParcelaClick
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
        object imgSituacaoEdicao: TcxImage
          Left = 195
          Top = 19
          Hint = 'Aguardando Grava'#231#227'o'
          Picture.Data = {
            07544269746D6170C6050000424DC60500000000000036040000280000001400
            000014000000010008000000000090010000120B0000120B0000000100002100
            000000000000CCCCCC00868686003A3A3A00FFFFFF00BDBDBD002A2A2A00F3F3
            F3004B4B4B00A5A5A500D4D4D4005E5E5E00EDEDED00C8C8C800898989009D9D
            9D004343430004040400ABABAB00E1E1E100F6F6F600C2C2C200D2D2D2004848
            48003E3E3E00FAFAFA00D9D9D9004C4C4C00616161002D2D2D00F9F9F900F5F5
            F500C5C5C5000000000000000000000000000000000000000000000000000000
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
            0000040404040419121B110000111B1214040404040404040404051000000000
            0000000018050404040404040402000000000618180600000000020404040404
            0E0000001C0107040407011C0000000E04040415000011090404040404040404
            0911000015041E030000090404040404040404040409000018191200000B0404
            040404040404040404040B000012080011160404040404040404040404041611
            00081100060704040404070D0D0D0D1A04040706001100001804040404042000
            0000001004040418000000001804040404040D00000000100404041800001100
            0607040404040D00000F0D1A04040706001108001116040404040D00000A0404
            0404161100081200000B040404040D00000D040404040B000012191800000904
            04040D00000D040404090000031E041500001109040401000001040409110000
            150404040E0000001C010C13130C011C0000000E040404040402000000001D17
            171D000000000204040404040404051800000000000000001005040404040404
            04040414121B110000111B12190404040404}
          Style.BorderStyle = ebsNone
          TabOrder = 4
          Transparent = True
          Height = 24
          Width = 32
        end
        object lblRestante: TcxLabel
          Left = 343
          Top = -2
          Caption = 'Total Parcelas            Restante '#224' Definir do Pr'#243'-Labore '
          ParentColor = False
          Style.Color = clBtnFace
          Style.TextColor = 4210688
          Style.TextStyle = [fsUnderline]
          StyleDisabled.TextStyle = [fsUnderline]
          Transparent = True
        end
        object edtTotalParcelas: TcxCurrencyEdit
          Left = 345
          Top = 16
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          Style.TransparentBorder = False
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.Color = clWindow
          StyleDisabled.TextColor = 16384
          TabOrder = 6
          Width = 97
        end
        object edtRestante: TcxCurrencyEdit
          Left = 446
          Top = 16
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          Style.TransparentBorder = False
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.Color = clWindow
          StyleDisabled.TextColor = clRed
          TabOrder = 7
          Width = 97
        end
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 9
      Top = 11
      Caption = 'Dados do Honor'#225'rio'
      ParentFont = False
      Style.LookAndFeel.SkinName = 'SevenClassic'
      Style.StyleController = dtmControles.cxEditStyleCheckBox
      StyleDisabled.LookAndFeel.SkinName = 'SevenClassic'
      StyleFocused.LookAndFeel.SkinName = 'SevenClassic'
      StyleHot.LookAndFeel.SkinName = 'SevenClassic'
      TabOrder = 1
      Height = 153
      Width = 620
      object cxLabel5: TcxLabel
        Left = 11
        Top = 16
        Caption = 'Tipo Honor'#225'rio'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 266
        Top = 16
        Caption = 'Esp'#233'cie'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object icxTipoContrato: TcxDBImageComboBox
        Left = 11
        Top = 34
        DataBinding.DataField = 'TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Pr'#243'-Labore'
            ImageIndex = 0
            Value = '1'
          end
          item
            Description = 'Mensal Vig'#234'ncia de Contrato'
            Value = '2'
          end
          item
            Description = 'Mensal at'#233' a Senten'#231'a'
            Value = '3'
          end
          item
            Description = 'Mensal Ap'#243's Senten'#231'a at'#233' Transito em Julgado'
            Value = '4'
          end
          item
            Description = #202'xito (Benef'#237'cio Econ'#244'mico)'
            Value = '5'
          end
          item
            Description = 'Tarefa'
            Value = '6'
          end
          item
            Description = 'Benef'#237'cio Econ'#244'mico'
            Value = '7'
          end>
        Properties.OnChange = icxTipoContratoPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 249
      end
      object icxEspecie: TcxDBImageComboBox
        Left = 266
        Top = 34
        RepositoryItem = dtmLookupContabil.ComboEspeciePagamento
        DataBinding.DataField = 'ESPECIE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 172
      end
      object pgcDados: TcxPageControl
        Left = 5
        Top = 60
        Width = 611
        Height = 75
        TabOrder = 4
        Properties.ActivePage = tabHonorario
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 71
        ClientRectLeft = 4
        ClientRectRight = 607
        ClientRectTop = 24
        object tabExito: TcxTabSheet
          Caption = 'Beneficio Econ'#244'mico'
          ImageIndex = 0
          object cxLabel1: TcxLabel
            Left = 186
            Top = 4
            Caption = '% Beneficio'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lblCobrancaValor: TcxLabel
            Left = 251
            Top = 4
            Caption = 'Valor Fixo'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 2
            Top = 3
            Caption = 'Tipo'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lcxTipoBeneficio: TcxDBLookupComboBox
            Left = 2
            Top = 22
            RepositoryItem = dtmLookupJuridico.ListaTipoBeneficio
            DataBinding.DataField = 'TIPO_BENEFICIO_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.ListColumns = <>
            Properties.OnChange = lcxTipoBeneficioPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            OnEnter = lcxTipoBeneficioEnter
            OnExit = lcxTipoBeneficioExit
            Width = 178
          end
          object edtBeneficioPercentual: TcxDBCurrencyEdit
            Left = 186
            Top = 22
            DataBinding.DataField = 'VALOR_PERCENTUAL'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DisplayFormat = '% ,0.00;'
            Properties.MaxValue = 100.000000000000000000
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 4
            Width = 61
          end
          object edtBeneficioValorFixo: TcxDBCurrencyEdit
            Left = 251
            Top = 22
            DataBinding.DataField = 'VALOR_PARCELA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 5
            Width = 77
          end
          object cxGroupBox2: TcxGroupBox
            Left = 334
            Top = 3
            Caption = ' Distribuir?      %Captador   %Peticionador   %Gestor'
            Style.LookAndFeel.NativeStyle = True
            Style.LookAndFeel.SkinName = 'Coffee'
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.SkinName = 'Coffee'
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.SkinName = 'Coffee'
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.SkinName = 'Coffee'
            TabOrder = 6
            Height = 41
            Width = 266
            object icxBeneficioDistribuir: TcxDBImageComboBox
              Left = 7
              Top = 19
              RepositoryItem = dtmLookup.Combo_SimNao
              DataBinding.DataField = 'BENEFICIO_DISTRIBUIR'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Properties.OnChange = icxBeneficioDistribuirPropertiesChange
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 0
              Width = 65
            end
            object edtBeneficioCaptador: TcxDBCurrencyEdit
              Left = 78
              Top = 19
              DataBinding.DataField = 'BENEFICIO_CAPTADOR'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DisplayFormat = '% ,0.00;'
              Properties.MaxValue = 100.000000000000000000
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 1
              Width = 57
            end
            object edtBeneficioPeticionador: TcxDBCurrencyEdit
              Left = 141
              Top = 19
              DataBinding.DataField = 'BENEFICIO_PETICIONADOR'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DisplayFormat = '% ,0.00;'
              Properties.MaxValue = 100.000000000000000000
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 2
              Width = 57
            end
            object edtBeneficioGestor: TcxDBCurrencyEdit
              Left = 204
              Top = 19
              DataBinding.DataField = 'BENEFICIO_GESTOR'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DisplayFormat = '% ,0.00;'
              Properties.MaxValue = 100.000000000000000000
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 3
              Width = 57
            end
          end
        end
        object tabHonorario: TcxTabSheet
          Caption = 'Pr'#243'-Labore (Honor'#225'rios)'
          ImageIndex = 1
          object lblTotal: TcxLabel
            Left = 129
            Top = 1
            Caption = 'Total Pr'#243'-Labore'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel6: TcxLabel
            Left = 230
            Top = 1
            Caption = 'Parcela(s) Qtd   Valor'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 2
            Top = 1
            Caption = 'Tipo'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel27: TcxLabel
            Left = 410
            Top = 1
            Caption = 'Data Inicial'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Transparent = True
          end
          object lblDataLimite: TcxLabel
            Left = 506
            Top = 1
            Caption = 'Data Final'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Transparent = True
          end
          object icxProLaborePeriodo: TcxDBImageComboBox
            Left = 1
            Top = 19
            DataBinding.DataField = 'PERIODO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <>
            Properties.ReadOnly = False
            Properties.OnEditValueChanged = icxProLaborePeriodoPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.Color = clWindow
            TabOrder = 5
            Width = 123
          end
          object edtProLaboreValorTotal: TcxDBCurrencyEdit
            Left = 130
            Top = 19
            DataBinding.DataField = 'VALOR_PROLABORE'
            DataBinding.DataSource = SourceAncestral
            ParentColor = True
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 6
            OnExit = edtProLaboreValorTotalExit
            Width = 95
          end
          object edtProLaboreQtdParcela: TcxDBSpinEdit
            Left = 229
            Top = 19
            DataBinding.DataField = 'QTD'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.MinValue = 1.000000000000000000
            Properties.OnEditValueChanged = edtProLaboreQtdParcelaPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 7
            Width = 73
          end
          object edtProLaboreValorParcela: TcxDBCurrencyEdit
            Left = 307
            Top = 19
            DataBinding.DataField = 'VALOR_PARCELA'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 8
            Width = 97
          end
          object edtProLaboreDataInicial: TcxDBDateEdit
            Left = 408
            Top = 19
            DataBinding.DataField = 'DATA_INICIAL'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 9
            OnExit = edtProLaboreDataInicialExit
            Width = 90
          end
          object edtProLaboreDataFinal: TcxDBDateEdit
            Left = 505
            Top = 19
            DataBinding.DataField = 'DATA_FINAL'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 10
            Width = 90
          end
        end
        object tabMensalidade: TcxTabSheet
          Caption = 'Mensalidade'
          ImageIndex = 3
          object lblVigencia: TcxLabel
            Left = 2
            Top = 3
            Caption = 'Vig'#234'ncia'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel13: TcxLabel
            Left = 197
            Top = 3
            Caption = 'Defini'#231#227'o do Valor'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsUnderline]
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lblMeses: TcxLabel
            Left = 66
            Top = 24
            Caption = 'm'#234'ses'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel16: TcxLabel
            Left = 102
            Top = 3
            Caption = 'Data Inicial'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Transparent = True
          end
          object edtVigencia: TcxDBSpinEdit
            Left = 0
            Top = 24
            DataBinding.DataField = 'QTD'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.MaxValue = 30.000000000000000000
            Properties.MinValue = 1.000000000000000000
            Properties.OnEditValueChanged = edtProLaboreDataInicialExit
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 4
            OnExit = edtSalarioMinimoExit
            Width = 60
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 101
            Top = 21
            DataBinding.DataField = 'DATA_INICIAL'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 5
            OnExit = edtProLaboreDataInicialExit
            Width = 90
          end
          object icxMensalidadePeriodo: TcxDBImageComboBox
            Left = 197
            Top = 21
            RepositoryItem = dtmLookupJuridico.ComboDefinicaoValor
            DataBinding.DataField = 'DEFINICAO_VALOR'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <
              item
                ImageIndex = 0
              end>
            Properties.ReadOnly = False
            Properties.OnEditValueChanged = icxMensalidadePeriodoPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.Color = clWindow
            TabOrder = 6
            Width = 142
          end
          object pgcValorDefinicao: TcxPageControl
            Left = 341
            Top = -18
            Width = 258
            Height = 64
            TabOrder = 7
            Properties.ActivePage = tabValorDefinido
            Properties.CustomButtons.Buttons = <>
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 64
            ClientRectRight = 258
            ClientRectTop = 24
            object tabValorDefinido: TcxTabSheet
              Caption = 'tabValorDefinido'
              ImageIndex = 0
              object cxLabel11: TcxLabel
                Left = 5
                Top = -4
                Caption = 'Honor'#225'rios'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindow
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsUnderline]
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel12: TcxLabel
                Left = 108
                Top = -4
                Caption = 'Reajuste'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindow
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsUnderline]
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object edtHonorariosDenifido: TcxDBCurrencyEdit
                Left = 4
                Top = 14
                DataBinding.DataField = 'VALOR_PARCELA'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 2
                Width = 97
              end
              object icxReajuste: TcxDBImageComboBox
                Left = 107
                Top = 14
                DataBinding.DataField = 'REAJUSTE'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.Items = <
                  item
                    Description = 'Anual IGPM'
                    ImageIndex = 0
                    Value = '1'
                  end
                  item
                    Description = 'Anua INPC'
                    Value = '2'
                  end
                  item
                    Description = 'A Contratar'
                    Value = '3'
                  end>
                Properties.ReadOnly = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                StyleDisabled.Color = clWindow
                TabOrder = 3
                Width = 146
              end
            end
            object tabValorSalario: TcxTabSheet
              Caption = 'tabValorSalario'
              ImageIndex = 1
              object cxLabel14: TcxLabel
                Left = 5
                Top = -4
                Caption = 'Qtd Sal'#225'rio M'#237'nimos      Honor'#225'rios'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindow
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsUnderline]
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object edtSalarioMinimo: TcxDBCurrencyEdit
                Left = 6
                Top = 14
                DataBinding.DataField = 'QTD_SALARIO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayFormat = ',0.00;'
                Properties.MaxLength = 4
                Properties.MaxValue = 20.000000000000000000
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 1
                OnExit = edtSalarioMinimoExit
                Width = 103
              end
              object edtHonorarioMensal: TcxDBCurrencyEdit
                Left = 113
                Top = 14
                DataBinding.DataField = 'VALOR_PARCELA'
                DataBinding.DataSource = SourceAncestral
                Enabled = False
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 2
                Width = 97
              end
            end
          end
        end
      end
      object lblDefinicaoCobranca: TcxLabel
        Left = 444
        Top = 16
        Caption = 'Defini'#231#227'o da Cobran'#231'a'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object icxDefinicaoCobranca: TcxDBImageComboBox
        Left = 444
        Top = 34
        RepositoryItem = dtmLookupJuridico.ComboDefinicaoCobranca
        DataBinding.DataField = 'DEFINICAO_VALOR'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            ImageIndex = 0
          end>
        Properties.ReadOnly = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        StyleDisabled.Color = clWindow
        TabOrder = 6
        Width = 161
      end
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT * '#13#10'FROM J_PROCESSO_CONTRATO_ITEM'
    Left = 283
    Top = 1
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 319
    Top = 1
  end
  inherited ClientAncestral: TClientDataSet
    Left = 353
    Top = 1
    object ClientAncestralPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField
      FieldName = 'PROCESSO_CONTRATO_ITEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
    end
    object ClientAncestralDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
    end
    object ClientAncestralPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object ClientAncestralVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Precision = 20
      Size = 3
    end
    object ClientAncestralVALOR_PERCENTUAL: TFMTBCDField
      FieldName = 'VALOR_PERCENTUAL'
      Precision = 20
      Size = 2
    end
    object ClientAncestralVALOR_PROLABORE: TFMTBCDField
      FieldName = 'VALOR_PROLABORE'
      Precision = 20
      Size = 3
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralPROCESSO_CONTRATO_ID: TFMTBCDField
      FieldName = 'PROCESSO_CONTRATO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField
      FieldName = 'PROCESSO_TRAMITE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralREAJUSTE: TStringField
      FieldName = 'REAJUSTE'
      Size = 1
    end
    object ClientAncestralQTD_SALARIO: TFMTBCDField
      FieldName = 'QTD_SALARIO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDEFINICAO_VALOR: TStringField
      FieldName = 'DEFINICAO_VALOR'
      Size = 1
    end
    object ClientAncestralTAREFA_ID: TFMTBCDField
      FieldName = 'TAREFA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralQTD: TFMTBCDField
      FieldName = 'QTD'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBENEFICIO_DISTRIBUIR: TStringField
      FieldName = 'BENEFICIO_DISTRIBUIR'
      Size = 1
    end
    object ClientAncestralBENEFICIO_PETICIONADOR: TFMTBCDField
      FieldName = 'BENEFICIO_PETICIONADOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralBENEFICIO_CAPTADOR: TFMTBCDField
      FieldName = 'BENEFICIO_CAPTADOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralVALOR_DISTRIBUIR: TFMTBCDField
      FieldName = 'VALOR_DISTRIBUIR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralTIPO_BENEFICIO_ID: TFMTBCDField
      FieldName = 'TIPO_BENEFICIO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBENEFICIO_GESTOR: TFMTBCDField
      FieldName = 'BENEFICIO_GESTOR'
      Precision = 20
      Size = 3
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 383
    Top = 1
  end
end
