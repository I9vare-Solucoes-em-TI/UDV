object frmGerenciaBoletoRemessa: TfrmGerenciaBoletoRemessa
  Left = 0
  Top = 0
  ActiveControl = edtPesqNumero
  Caption = 'Gerenciador de Boletos'
  ClientHeight = 570
  ClientWidth = 1207
  Color = clBtnFace
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pgcTipoArquivo: TcxPageControl
    Left = 0
    Top = 0
    Width = 1207
    Height = 570
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tbsBoleto
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 6
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Black'
    ClientRectBottom = 570
    ClientRectRight = 1207
    ClientRectTop = 24
    object tbsBoleto: TcxTabSheet
      Caption = 'Boleto'
      ImageIndex = 2
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Caption = ' Filtro(s)'
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 0
        Height = 124
        Width = 1207
        object btnPesquisarBoleto: TcxButton
          Left = 771
          Top = 66
          Width = 106
          Height = 25
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
          OnClick = btnPesquisarBoletoClick
        end
        object btnLimparBoleto: TcxButton
          Left = 883
          Top = 66
          Width = 106
          Height = 25
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
          TabOrder = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparBoletoClick
        end
        object lcxCedenteBoleto: TcxLookupComboBox
          Left = 387
          Top = 33
          ParentFont = False
          Properties.KeyFieldNames = 'BANCO_CEDENTE_ID'
          Properties.ListColumns = <
            item
              Caption = 'Cedente'
              Width = 200
              FieldName = 'NOME_CEDENTE'
            end
            item
              Width = 150
              FieldName = 'BANCO_NOME'
            end
            item
              Width = 60
              FieldName = 'CONTA_NUMERO'
            end
            item
              Width = 60
              FieldName = 'AGENCIA_NUMERO'
            end>
          Properties.ListSource = dtsContaCendente
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 2
          Width = 490
        end
        object cxLabel3: TcxLabel
          Left = 389
          Top = 18
          Caption = 'Conta Cedente'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object cxGroupBox5: TcxGroupBox
          Left = 6
          Top = 15
          Caption = 'Dt. Processamento'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 1
          Height = 103
          Width = 120
          object edtDataInicio: TcxDateEdit
            Left = 10
            Top = 18
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 99
          end
          object edtDataFinal: TcxDateEdit
            Left = 10
            Top = 59
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 99
          end
          object cxLabel11: TcxLabel
            Left = 54
            Top = 40
            Caption = 'a'
            ParentFont = False
            Transparent = True
          end
        end
        object cxGroupBox3: TcxGroupBox
          Left = 132
          Top = 15
          Caption = 'Lista de:'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 0
          Height = 103
          Width = 247
          object edtPesqNumero: TcxCurrencyEdit
            Left = 109
            Top = 18
            ParentFont = False
            Properties.DisplayFormat = '0'
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            OnEnter = edtPesqNumeroEnter
            OnExit = edtPesqNumeroExit
            OnKeyDown = edtPesqNumeroKeyDown
            Width = 131
          end
          object mmoListaApont: TcxMemo
            Left = 109
            Top = 40
            Enabled = False
            ParentFont = False
            Properties.ScrollBars = ssVertical
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            Height = 57
            Width = 131
          end
          object cbxTipoNumero: TcxComboBox
            Left = 5
            Top = 18
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'N'#186' Documento:'
              'Nosso N'#186':')
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Text = 'N'#186' Documento:'
            Width = 102
          end
          object chbLista: TcxCheckBox
            Left = 5
            Top = 55
            Caption = 'Usar Lista'
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 2
            OnClick = chbListaClick
            Width = 74
          end
        end
        object icbTipoOcorrenciaBoleto: TcxImageComboBox
          Left = 389
          Top = 70
          Hint = 'Pressione Delete para limpar o campo'
          RepositoryItem = icb_tipo_ocorrencia
          EditValue = 'TDS'
          ParentFont = False
          ParentShowHint = False
          Properties.ClearKey = 46
          Properties.Items = <>
          Properties.OnChange = icbTipoOcorrenciaBoletoPropertiesChange
          ShowHint = True
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Width = 262
        end
        object cxLabel1: TcxLabel
          Left = 387
          Top = 55
          Caption = 'Tipo Ocorr'#234'ncia'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object cxGroupBox4: TcxGroupBox
          Left = 883
          Top = 8
          Caption = 'Data Vencimento'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.TextColor = clPurple
          TabOrder = 8
          Height = 46
          Width = 112
          object edtDataVencimento: TcxDateEdit
            Left = 10
            Top = 17
            Enabled = False
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 93
          end
        end
        object lblBoletoSemRemessa: TcxLabel
          Left = 387
          Top = 101
          Caption = 'Boletos Sem Remessa Gerada!'
          ParentFont = False
          Style.Shadow = False
          Style.TextColor = clRed
          Style.TextStyle = [fsBold]
          Transparent = True
          Visible = False
        end
        object lblMarcarTodos: TcxLabel
          Tag = 1
          Left = 660
          Top = 103
          Cursor = crHandPoint
          Caption = 'Marcar Todos'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold, fsUnderline]
          Style.HotTrack = False
          Style.TextColor = clNavy
          Style.IsFontAssigned = True
          StyleHot.TextColor = clGreen
          Transparent = True
          Visible = False
          OnClick = lblMarcarTodosClick
        end
        object lblDesmarcarTodos: TcxLabel
          Tag = 2
          Left = 771
          Top = 103
          Cursor = crHandPoint
          Caption = 'Desmarcar Todos'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold, fsUnderline]
          Style.HotTrack = False
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleHot.TextColor = clGreen
          Transparent = True
          Visible = False
          OnClick = lblDesmarcarTodosClick
        end
        object cxButton2: TcxButton
          Left = 883
          Top = 95
          Width = 106
          Height = 25
          Cursor = crArrow
          Caption = 'Sair'
          Colors.Default = clWhite
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
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
            3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
            CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
            FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
            B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
            3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
            FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
            64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
            4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
            B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
            BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
            FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
            ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
            33333333333451B8F9FF}
          TabOrder = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton2Click
        end
        object icbRemessaGerada: TcxImageComboBox
          Left = 655
          Top = 70
          EditValue = 'T'
          ParentFont = False
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Sim'
              ImageIndex = 0
              Value = 'S'
            end
            item
              Description = 'N'#227'o'
              ImageIndex = 1
              Value = 'N'
            end
            item
              Description = '<Todas>'
              ImageIndex = 64
              Value = 'T'
            end>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 13
          Width = 110
        end
        object cxLabel7: TcxLabel
          Left = 655
          Top = 55
          Caption = 'Remessa Gerada'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
      end
      object grdGerenciaBoleto: TcxGrid
        Left = 0
        Top = 124
        Width = 1207
        Height = 422
        Align = alClient
        PopupMenu = ppmBoleto
        TabOrder = 1
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          OnCellClick = cxGridDBTableView3CellClick
          OnCustomDrawCell = grdBoletoDBTableView1CustomDrawCell
          DataController.DataSource = dtsBoleto
          DataController.Filter.AutoDataSetFilter = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'VALOR_DOCUMENTO'
              Column = cxGridDBVALOR_DOCUMENTO
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridDBTableView3calc_selecao: TcxGridDBColumn
            Caption = 'Sel.'
            DataBinding.FieldName = 'calc_check'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 30
          end
          object cxGridDBBOLETO_ID: TcxGridDBColumn
            Caption = 'Boleto ID'
            DataBinding.FieldName = 'BOLETO_ID'
            Options.Editing = False
            Options.Focusing = False
            Width = 61
          end
          object cxGridDBDATA_PROCESSAMENTO: TcxGridDBColumn
            Caption = 'Dt. Processamento'
            DataBinding.FieldName = 'DATA_PROCESSAMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 118
          end
          object cxGridDBCARTEIRA: TcxGridDBColumn
            Caption = 'Carteira'
            DataBinding.FieldName = 'CARTEIRA'
            Options.Editing = False
            Options.Focusing = False
            Width = 53
          end
          object cxGridDBNUMERO_DOCUMENTO: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'NUMERO_DOCUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 92
          end
          object cxGridDBNOSSO_NUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#186
            DataBinding.FieldName = 'NOSSO_NUMERO'
            Options.Editing = False
            Options.Focusing = False
            Width = 72
          end
          object cxGridDBTableView3DATA_VENCIMENTO: TcxGridDBColumn
            Caption = 'Vencimento'
            DataBinding.FieldName = 'DATA_VENCIMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 77
          end
          object cxGridDBVALOR_DOCUMENTO: TcxGridDBColumn
            Caption = 'Valor Documento'
            DataBinding.FieldName = 'VALOR_DOCUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 103
          end
          object cxGridDBTIPO_OCORRENCIA: TcxGridDBColumn
            Caption = 'Tipo Ocorr'#234'ncia'
            DataBinding.FieldName = 'TIPO_OCORRENCIA'
            RepositoryItem = icb_tipo_ocorrencia
            Options.Editing = False
            Options.Focusing = False
            Width = 101
          end
          object cxGridDBDATA_OCORRENCIA: TcxGridDBColumn
            Caption = 'Dt. Ocorr'#234'ncia'
            DataBinding.FieldName = 'DATA_OCORRENCIA'
            Options.Editing = False
            Options.Focusing = False
            Width = 97
          end
          object cxGridDBTableView3REMESSA_GERADA: TcxGridDBColumn
            Caption = 'Remessa'
            DataBinding.FieldName = 'REMESSA_GERADA'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.ImageListAndamento
            Properties.Items = <
              item
                Description = 'Gerada'
                ImageIndex = 7
                Value = 'S'
              end
              item
                Description = 'N'#227'o Gerada'
                ImageIndex = 6
                Value = 'N'
              end>
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
          object cxGridDBNOME: TcxGridDBColumn
            Caption = 'Nome Sacado'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Focusing = False
            Width = 116
          end
          object cxGridDBCPFCNPJ: TcxGridDBColumn
            Caption = 'CPF/CNPJ Sacado'
            DataBinding.FieldName = 'CPFCNPJ'
            OnGetDisplayText = grdBoletoDBTableView1CPFCNPJGetDisplayText
            Options.Editing = False
            Options.Focusing = False
            Width = 115
          end
          object cxGridDBCIDADE: TcxGridDBColumn
            Caption = 'Cidade'
            DataBinding.FieldName = 'CIDADE'
            Options.Editing = False
            Options.Focusing = False
            Width = 70
          end
          object cxGridDBUF: TcxGridDBColumn
            DataBinding.FieldName = 'UF'
            Options.Editing = False
            Options.Focusing = False
            Width = 20
          end
        end
        object cxGridLevel7: TcxGridLevel
          Caption = 'Boletos'
          GridView = cxGridDBTableView3
        end
      end
    end
    object tbsRemessa: TcxTabSheet
      Caption = 'Remessa'
      ImageIndex = 1
      object pgcRemessa: TcxPageControl
        Left = 0
        Top = 0
        Width = 1207
        Height = 546
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tbsGerarRemessa
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 546
        ClientRectRight = 1207
        ClientRectTop = 24
        object tbsGerarRemessa: TcxTabSheet
          Caption = 'Gerar Remessa'
          ImageIndex = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 1207
            Height = 57
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btnPesquisaRemessa: TcxButton
              Left = 526
              Top = 24
              Width = 106
              Height = 25
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
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnPesquisaRemessaClick
            end
            object btnLimparRemessa: TcxButton
              Left = 637
              Top = 24
              Width = 106
              Height = 25
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
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnLimparRemessaClick
            end
            object btnGerarRemessa: TcxButton
              Left = 748
              Top = 24
              Width = 106
              Height = 25
              Cursor = crArrow
              Caption = 'Gerar Remessa'
              Colors.Default = clWhite
              Enabled = False
              LookAndFeel.Kind = lfUltraFlat
              OptionsImage.Glyph.Data = {
                C6050000424DC605000000000000360400002800000014000000140000000100
                080000000000900100000000000000000000000100000000000000000000BBBB
                BB00757575003333330024242400FFFFFF00A5A5A5004848480017171700E5E5
                E50099999900E1E1E1000B0B0B005353530083838300080808002E2E2E006666
                6600F3F3F30036363600CCCCCC001B1B1B002B2B2B003A3A3A00A9A9A9000606
                0600C8C8C8005656560012121200A1A1A10028282800929292003C3C3C00ABAB
                AB0020202000595959003F3F3F004A4A4A009D9D9D00D0D0D000101010006060
                600046464600F5F5F500000000004D4D4D00ADADAD000A0A0A00191919008989
                8900E8E8E800B1B1B1002A2A2A002222220076767600BEBEBE0014141400D5D5
                D5005050500030303000A7A7A70026262600E3E3E3009F9F9F00F7F7F7001818
                18003838380004040400A3A3A3001E1E1E00E9E9E90069696900000000000000
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
                0000000000000000000000000000000000000000000000000000050505361900
                0000000000000000000000100B050505050F0000434343434343000000000043
                0A0505050519190C070D0D0D0D240F191919191926050505050F0F4539093E3E
                09010C0F0F0F0F0F26050505050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C26050505
                050C0C22273E0B0B0B0B090909310C0C3F050505052828080725070707070707
                2D1328281D050505051C1C304702363636363636022A1C1C1D0505050538381E
                37141A1A1A1A1A1A140E38381D05050505414141413030303030303030414141
                060505050515153B0B121212121212122B0A151506050505054545223B3B3B3B
                3B3B3B3B0316454506050505052222160A18181818181818184722223C050505
                0535353B1D182E2106060606180235353C050505050404041E1E1E0417172020
                1716040418050505051E1E252B402523121212122B1D1E1E180505050516163A
                05052910131313134203161621050505051010100D1B10101010101010101010
                2105050505133B3B3B3B3B3B3B3B3B3B3B3B3B0333050505051F130303030303
                030303030303031B3205}
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = btnGerarRemessaClick
            end
            object lcxCedenteRemessa: TcxLookupComboBox
              Left = 9
              Top = 24
              ParentFont = False
              Properties.KeyFieldNames = 'BANCO_CEDENTE_ID'
              Properties.ListColumns = <
                item
                  Caption = 'Cedente'
                  Width = 200
                  FieldName = 'NOME_CEDENTE'
                end
                item
                  Width = 150
                  FieldName = 'BANCO_NOME'
                end
                item
                  Width = 60
                  FieldName = 'CONTA_NUMERO'
                end
                item
                  Width = 60
                  FieldName = 'AGENCIA_NUMERO'
                end>
              Properties.ListSource = dtsContaCendente
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 3
              Width = 511
            end
            object cxLabel14: TcxLabel
              Left = 10
              Top = 6
              Caption = 'Conta Cedente'
              Style.TextColor = 16384
              Style.TextStyle = []
              Transparent = True
            end
            object cxButton3: TcxButton
              Left = 859
              Top = 24
              Width = 106
              Height = 25
              Cursor = crArrow
              Caption = 'Sair'
              Colors.Default = clWhite
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
                F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
                3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
                CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
                FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
                B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
                3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
                FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
                64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
                4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
                B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
                BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
                FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
                ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
                33333333333451B8F9FF}
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = cxButton2Click
            end
          end
          object grdBoleto: TcxGrid
            Left = 0
            Top = 57
            Width = 1207
            Height = 465
            Align = alClient
            TabOrder = 1
            RootLevelOptions.DetailTabsPosition = dtpTop
            object grdBoletoDBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = True
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = True
              Navigator.Buttons.Next.Enabled = False
              Navigator.Buttons.Next.Visible = True
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Enabled = False
              Navigator.Buttons.Last.Visible = True
              Navigator.Buttons.Insert.Visible = False
              Navigator.Buttons.Delete.Visible = False
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Post.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              OnCustomDrawCell = grdBoletoDBTableView1CustomDrawCell
              DataController.DataSource = dtsRemessa
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0.00'
                  Kind = skSum
                  FieldName = 'VALOR_DOCUMENTO'
                  Column = grdBoletoDBTableView1VALOR_DOCUMENTO
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
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.GroupRowHeight = 25
              Preview.Visible = True
              Styles.Inactive = dtmControles.cxStyle23
              Styles.GroupByBox = dtmControles.cxStyle7
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object grdBoletoDBTableView1BOLETO_ID: TcxGridDBColumn
                Caption = 'Boleto ID'
                DataBinding.FieldName = 'BOLETO_ID'
                Options.Editing = False
                Options.Focusing = False
                Width = 67
              end
              object grdBoletoDBTableView1DATA_PROCESSAMENTO: TcxGridDBColumn
                Caption = 'Dt. Processamento'
                DataBinding.FieldName = 'DATA_PROCESSAMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 120
              end
              object grdBoletoDBTableView1CARTEIRA: TcxGridDBColumn
                Caption = 'Carteira'
                DataBinding.FieldName = 'CARTEIRA'
                Options.Editing = False
                Options.Focusing = False
                Width = 62
              end
              object grdBoletoDBTableView1NUMERO_DOCUMENTO: TcxGridDBColumn
                Caption = 'N'#186' Documento'
                DataBinding.FieldName = 'NUMERO_DOCUMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 90
              end
              object grdBoletoDBTableView1NOSSO_NUMERO: TcxGridDBColumn
                Caption = 'Nosso N'#186
                DataBinding.FieldName = 'NOSSO_NUMERO'
                Options.Editing = False
                Options.Focusing = False
                Width = 79
              end
              object grdBoletoDBTableView1DATA_VENCIMENTO: TcxGridDBColumn
                Caption = 'Vencimento'
                DataBinding.FieldName = 'DATA_VENCIMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 81
              end
              object grdBoletoDBTableView1VALOR_DOCUMENTO: TcxGridDBColumn
                Caption = 'Valor Documento'
                DataBinding.FieldName = 'VALOR_DOCUMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 110
              end
              object grdBoletoDBTableView1TIPO_OCORRENCIA: TcxGridDBColumn
                Caption = 'Tipo Ocorr'#234'ncia'
                DataBinding.FieldName = 'TIPO_OCORRENCIA'
                RepositoryItem = icb_tipo_ocorrencia
                Options.Editing = False
                Options.Focusing = False
                Width = 113
              end
              object grdBoletoDBTableView1DATA_OCORRENCIA: TcxGridDBColumn
                Caption = 'Dt. Ocorr'#234'ncia'
                DataBinding.FieldName = 'DATA_OCORRENCIA'
                Options.Editing = False
                Options.Focusing = False
                Width = 95
              end
              object grdBoletoDBTableView1NOME: TcxGridDBColumn
                Caption = 'Nome Sacado'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Options.Focusing = False
                Width = 143
              end
              object grdBoletoDBTableView1CPFCNPJ: TcxGridDBColumn
                Caption = 'CPF/CNPJ Sacado'
                DataBinding.FieldName = 'CPFCNPJ'
                OnGetDisplayText = grdBoletoDBTableView1CPFCNPJGetDisplayText
                Options.Editing = False
                Options.Focusing = False
                Width = 141
              end
              object grdBoletoDBTableView1CIDADE: TcxGridDBColumn
                Caption = 'Cidade'
                DataBinding.FieldName = 'CIDADE'
                Options.Editing = False
                Options.Focusing = False
                Width = 84
              end
              object grdBoletoDBTableView1UF: TcxGridDBColumn
                DataBinding.FieldName = 'UF'
                Options.Editing = False
                Options.Focusing = False
                Width = 20
              end
            end
            object grdBoletoLevel1: TcxGridLevel
              Caption = 'Boletos'
              GridView = grdBoletoDBTableView1
            end
          end
        end
        object tbsRemessaGerada: TcxTabSheet
          Caption = 'Remessas Geradas'
          ImageIndex = 1
          object grdRemessa: TcxGrid
            Left = 0
            Top = 64
            Width = 1207
            Height = 223
            Align = alTop
            PopupMenu = ppmSaveFileRemessa
            TabOrder = 0
            RootLevelOptions.DetailTabsPosition = dtpTop
            object cxGridDBTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Enabled = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Enabled = False
              Navigator.Buttons.Last.Visible = False
              Navigator.Buttons.Insert.Visible = False
              Navigator.Buttons.Delete.Visible = False
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Post.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = dtsRemessaHistorico
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
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
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.GroupRowHeight = 25
              Preview.Visible = True
              Styles.Inactive = dtmControles.cxStyle23
              Styles.GroupByBox = dtmControles.cxStyle7
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object cxGridDBTableView2NUMERO_REMESSA: TcxGridDBColumn
                Caption = 'N'#186' Remessa'
                DataBinding.FieldName = 'NUMERO_REMESSA'
                Options.Editing = False
                Options.Focusing = False
                Width = 102
              end
              object cxGridDBTableView2DATA_REMESSA: TcxGridDBColumn
                Caption = 'Dt. Remessa'
                DataBinding.FieldName = 'DATA_REMESSA'
                Options.Editing = False
                Options.Focusing = False
                Width = 107
              end
              object cxGridDBTableView2NOME_ARQUIVO: TcxGridDBColumn
                Caption = 'Arquivo'
                DataBinding.FieldName = 'NOME_ARQUIVO'
                Options.Editing = False
                Options.Focusing = False
                Width = 426
              end
              object cxGridDBTableView2USUARIO: TcxGridDBColumn
                Caption = 'Usu'#225'rio'
                DataBinding.FieldName = 'USUARIO'
                Options.Editing = False
                Options.Focusing = False
                Width = 570
              end
            end
            object cxGridLevel2: TcxGridLevel
              Caption = 'Remessa'
              GridView = cxGridDBTableView2
            end
          end
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Caption = ' Filtro(s)'
            ParentFont = False
            Style.StyleController = dtmControles.cxEditStyleGroup
            TabOrder = 1
            Height = 64
            Width = 1207
            object btnPesquisarRemessaGerada: TcxButton
              Left = 670
              Top = 33
              Width = 106
              Height = 25
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
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnPesquisarRemessaGeradaClick
            end
            object btnLimparRemessaGerada: TcxButton
              Left = 780
              Top = 33
              Width = 106
              Height = 25
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
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnLimparRemessaGeradaClick
            end
            object cxLabel5: TcxLabel
              Left = 9
              Top = 15
              Caption = 'Peri'#243'do Retorno'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindow
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsUnderline]
              Style.TextColor = clBlack
              Style.TextStyle = []
              Style.IsFontAssigned = True
              Transparent = True
            end
            object edtDtRemessaIni: TcxDateEdit
              Left = 11
              Top = 33
              AutoSize = False
              ParentFont = False
              Properties.DateButtons = []
              Properties.InputKind = ikMask
              Properties.ShowTime = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 3
              Height = 21
              Width = 98
            end
            object edtDtRemessaFim: TcxDateEdit
              Left = 115
              Top = 33
              AutoSize = False
              ParentFont = False
              Properties.DateButtons = []
              Properties.InputKind = ikMask
              Properties.ShowTime = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 4
              Height = 21
              Width = 98
            end
            object lcxCedenteRemessaGerada: TcxLookupComboBox
              Left = 219
              Top = 33
              ParentFont = False
              Properties.KeyFieldNames = 'BANCO_CEDENTE_ID'
              Properties.ListColumns = <
                item
                  Caption = 'Cedente'
                  Width = 200
                  FieldName = 'NOME_CEDENTE'
                end
                item
                  Width = 150
                  FieldName = 'BANCO_NOME'
                end
                item
                  Width = 60
                  FieldName = 'CONTA_NUMERO'
                end
                item
                  Width = 60
                  FieldName = 'AGENCIA_NUMERO'
                end>
              Properties.ListSource = dtsContaCendente
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 5
              Width = 445
            end
            object cxLabel6: TcxLabel
              Left = 219
              Top = 15
              Caption = 'Conta Cedente'
              Style.TextColor = 16384
              Style.TextStyle = []
              Transparent = True
            end
            object cxButton4: TcxButton
              Left = 891
              Top = 33
              Width = 106
              Height = 25
              Cursor = crArrow
              Caption = 'Sair'
              Colors.Default = clWhite
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
                F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
                3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
                CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
                FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
                B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
                3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
                FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
                64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
                4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
                B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
                BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
                FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
                ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
                33333333333451B8F9FF}
              TabOrder = 7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = cxButton2Click
            end
          end
          object grdRemessaItem: TcxGrid
            Left = 0
            Top = 287
            Width = 1207
            Height = 235
            Align = alClient
            TabOrder = 2
            RootLevelOptions.DetailTabsPosition = dtpTop
            object cxGridDBtvRemessaItem: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = True
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = True
              Navigator.Buttons.Next.Enabled = False
              Navigator.Buttons.Next.Visible = True
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Enabled = False
              Navigator.Buttons.Last.Visible = True
              Navigator.Buttons.Insert.Visible = False
              Navigator.Buttons.Delete.Visible = False
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Post.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              OnCustomDrawCell = cxGridDBtvRemessaItemCustomDrawCell
              DataController.DataSource = dtsRemessaHistoricoItem
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
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
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.GroupRowHeight = 25
              Preview.Visible = True
              Styles.Inactive = dtmControles.cxStyle23
              Styles.GroupByBox = dtmControles.cxStyle7
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object cxGridDBtvRemessaItemBOLETO_ID: TcxGridDBColumn
                Caption = 'Boleto ID'
                DataBinding.FieldName = 'BOLETO_ID'
                Options.Editing = False
                Options.Focusing = False
                Width = 74
              end
              object cxGridDBtvRemessaItemDATA_PROCESSAMENTO: TcxGridDBColumn
                Caption = 'Dt. Processamento'
                DataBinding.FieldName = 'DATA_PROCESSAMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 116
              end
              object cxGridDBtvRemessaItemCARTEIRA: TcxGridDBColumn
                Caption = 'Carteira'
                DataBinding.FieldName = 'CARTEIRA'
                Options.Editing = False
                Options.Focusing = False
                Width = 56
              end
              object cxGridDBtvRemessaItemNUMERO_DOCUMENTO: TcxGridDBColumn
                Caption = 'N'#186' Documento'
                DataBinding.FieldName = 'NUMERO_DOCUMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 90
              end
              object cxGridDBtvRemessaItemNOSSO_NUMERO: TcxGridDBColumn
                Caption = 'Nosso N'#186
                DataBinding.FieldName = 'NOSSO_NUMERO'
                Options.Editing = False
                Options.Focusing = False
                Width = 92
              end
              object cxGridDBtvRemessaItemDATA_VENCIMENTO: TcxGridDBColumn
                Caption = 'Vencimento'
                DataBinding.FieldName = 'DATA_VENCIMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 73
              end
              object cxGridDBtvRemessaItemVALOR_DOCUMENTO: TcxGridDBColumn
                Caption = 'Valor Documento'
                DataBinding.FieldName = 'VALOR_DOCUMENTO'
                Options.Editing = False
                Options.Focusing = False
                Width = 112
              end
              object cxGridDBtvRemessaItemTIPO_OCORRENCIA: TcxGridDBColumn
                Caption = 'Tipo Ocorr'#234'ncia'
                DataBinding.FieldName = 'TIPO_OCORRENCIA'
                RepositoryItem = icb_tipo_ocorrencia
                Options.Editing = False
                Options.Focusing = False
                Width = 135
              end
              object cxGridDBtvRemessaItemDATA_OCORRENCIA: TcxGridDBColumn
                Caption = 'Dt. Ocorr'#234'ncia'
                DataBinding.FieldName = 'DATA_OCORRENCIA'
                Options.Editing = False
                Options.Focusing = False
                Width = 98
              end
              object cxGridDBtvRemessaItemNOME: TcxGridDBColumn
                Caption = 'Nome Sacado'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Options.Focusing = False
                Width = 179
              end
              object cxGridDBtvRemessaItemCPFCNPJ: TcxGridDBColumn
                Caption = 'CPF/CNPJ Sacado'
                DataBinding.FieldName = 'CPFCNPJ'
                OnGetDisplayText = cxGridDBtvRemessaItemCPFCNPJGetDisplayText
                Options.Editing = False
                Options.Focusing = False
                Width = 180
              end
            end
            object cxGridLevel1: TcxGridLevel
              Caption = 'Remessa Itens'
              GridView = cxGridDBtvRemessaItem
            end
          end
        end
      end
    end
    object tbsRetorno: TcxTabSheet
      Caption = 'Retorno'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object cxGroupBox6: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Caption = ' Filtro(s)'
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 0
        Height = 64
        Width = 1207
        object btnPesquisarRetorno: TcxButton
          Left = 576
          Top = 33
          Width = 106
          Height = 25
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
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarRetornoClick
        end
        object btnLimparRetorno: TcxButton
          Left = 687
          Top = 33
          Width = 106
          Height = 25
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
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparRetornoClick
        end
        object cxLabel2: TcxLabel
          Left = 10
          Top = 15
          Caption = 'Peri'#243'do Retorno'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = clBlack
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtDtRetornoIni: TcxDateEdit
          Left = 11
          Top = 33
          AutoSize = False
          ParentFont = False
          Properties.DateButtons = []
          Properties.InputKind = ikMask
          Properties.ShowTime = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Height = 21
          Width = 98
        end
        object edtDtRetornoFim: TcxDateEdit
          Left = 115
          Top = 33
          AutoSize = False
          ParentFont = False
          Properties.DateButtons = []
          Properties.InputKind = ikMask
          Properties.ShowTime = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 4
          Height = 21
          Width = 98
        end
        object lcxCedenteRetorno: TcxLookupComboBox
          Left = 219
          Top = 33
          ParentFont = False
          Properties.KeyFieldNames = 'BANCO_CEDENTE_ID'
          Properties.ListColumns = <
            item
              Caption = 'Cedente'
              Width = 200
              FieldName = 'NOME_CEDENTE'
            end
            item
              Caption = 'Banco'
              Width = 150
              FieldName = 'BANCO_NOME'
            end
            item
              Caption = 'Conta'
              Width = 60
              FieldName = 'CONTA_NUMERO'
            end
            item
              Caption = 'Ag'#234'ncia'
              Width = 60
              FieldName = 'AGENCIA_NUMERO'
            end>
          Properties.ListSource = dtsContaCendente
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 5
          Width = 351
        end
        object cxLabel4: TcxLabel
          Left = 219
          Top = 15
          Caption = 'Conta Cedente'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object cxButton1: TcxButton
          Left = 798
          Top = 33
          Width = 124
          Height = 25
          Caption = 'Processar Retorno'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000003636
            36E63C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF0C0C0C330000000000000000000000002B2B
            2BB73C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF222222900000000000000000000000002020
            208A3B3B3BFC3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF373737EA0101010600000000000000001E1E
            1E80333333D73C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1313135100000000000000001E1E
            1E80282828A83C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF292929AE00000000000000001E1E
            1E801E1E1E813A3A3AF53C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3B3B3BFC05050515000000001E1E
            1E801E1E1E802F2F2FC63C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1B1B1B72000000001E1E
            1E801E1E1E80242424983C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF313131CF000000001B1B
            1B741E1E1E801E1E1E801E1E1E801E1E1E801E1E1E801E1E1E801E1E1E801E1E
            1E801E1E1E801E1E1E801E1E1E80000000000000000000000000000000000808
            0820181818651E1E1E801E1E1E801E1E1E801E1E1E801E1E1E801E1E1E801E1E
            1E801E1E1E801E1E1E801E1E1E80000000000000000000000000000000000000
            0000000000000000000000000000000000001B1B1B741E1E1E801E1E1E801E1E
            1E801E1E1E801E1E1E801B1B1B74000000000000000000000000000000000000
            00000000000000000000000000000000000008080820181818651E1E1E801E1E
            1E801E1E1E801818186508080820000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          TabOrder = 7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton1Click
        end
        object cxButton5: TcxButton
          Left = 926
          Top = 33
          Width = 106
          Height = 25
          Cursor = crArrow
          Caption = 'Sair'
          Colors.Default = clWhite
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
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
            3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
            CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
            FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
            B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
            3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
            FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
            64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
            4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
            B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
            BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
            FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
            ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
            33333333333451B8F9FF}
          TabOrder = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton2Click
        end
      end
      object grdRetorno: TcxGrid
        Left = 0
        Top = 64
        Width = 1207
        Height = 121
        Align = alTop
        PopupMenu = ppmSaveFileRetorno
        TabOrder = 1
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGridDBtvRetornoHistorico: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          DataController.DataSource = dtsRetornoHistorico
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridDBtvRetornoHistoricoBOLETO_RETORNO_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'BOLETO_RETORNO_ID'
            Options.Editing = False
            Options.Focusing = False
            Width = 60
          end
          object cxGridDBtvRetornoHistoricoDATA_RETORNO: TcxGridDBColumn
            Caption = 'Dt. Retorno'
            DataBinding.FieldName = 'DATA_RETORNO'
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object cxGridDBtvRetornoHistoricoNOME_ARQUIVO: TcxGridDBColumn
            Caption = 'Arquivo'
            DataBinding.FieldName = 'NOME_ARQUIVO'
            Options.Editing = False
            Options.Focusing = False
            Width = 250
          end
          object cxGridDBtvRetornoHistoricoHASH_ARQUIVO: TcxGridDBColumn
            Caption = 'Hash do Arquivo'
            DataBinding.FieldName = 'HASH_ARQUIVO'
            Options.Editing = False
            Options.Focusing = False
            Width = 300
          end
          object cxGridDBtvRetornoHistoricoUSUARIO: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'USUARIO'
            Options.Editing = False
            Options.Focusing = False
            Width = 200
          end
        end
        object cxGridLevel3: TcxGridLevel
          Caption = 'Retorno'
          GridView = cxGridDBtvRetornoHistorico
        end
      end
      object grdRetornoItem: TcxGrid
        Left = 0
        Top = 185
        Width = 1207
        Height = 173
        Align = alClient
        PopupMenu = ppmItemRetorno
        TabOrder = 2
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGridDBtvRetornoHistoricoItem: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          OnCustomDrawCell = cxGridDBtvRetornoHistoricoItemCustomDrawCell
          DataController.DataSource = dtsRetornoHistoricoItem
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Qtde: 0'
              Kind = skCount
              FieldName = 'OCORRENCIA'
              Column = cxGridDBtvRetornoHistoricoItemOCORRENCIA
            end
            item
              Format = 'Total:  R$ ,0.00'
              Kind = skSum
              FieldName = 'VALOR'
              Column = cxGridDBtvRetornoHistoricoItemVALOR
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridDBtvRetornoHistoricoItemNUMERO_DOCUMENTO: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'NUMERO_DOCUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 195
          end
          object cxGridDBtvRetornoHistoricoItemNOSSO_NUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#186
            DataBinding.FieldName = 'NOSSO_NUMERO'
            Options.Editing = False
            Options.Focusing = False
            Width = 191
          end
          object cxGridDBtvRetornoHistoricoItemDATA_CORRENCIA: TcxGridDBColumn
            Caption = 'Dt. Ocorr'#234'ncia'
            DataBinding.FieldName = 'DATA_CORRENCIA'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 165
          end
          object cxGridDBtvRetornoHistoricoItemOCORRENCIA: TcxGridDBColumn
            Caption = 'Ocorr'#234'ncia'
            DataBinding.FieldName = 'OCORRENCIA'
            Visible = False
            GroupIndex = 0
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object cxGridDBtvRetornoHistoricoItemVALOR: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALOR'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 125
          end
          object cxGridDBtvRetornoHistoricoItemDATA_CREDITO: TcxGridDBColumn
            Caption = 'Data Cr'#233'dito'
            DataBinding.FieldName = 'DATA_CREDITO'
            Options.Editing = False
            Options.Focusing = False
            Width = 134
          end
          object cxGridDBtvRetornoHistoricoItemDATA_BAIXA: TcxGridDBColumn
            Caption = 'Data Baixa'
            DataBinding.FieldName = 'DATA_BAIXA'
            Visible = False
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object cxGridDBtvRetornoHistoricoItemBOLETO_ID: TcxGridDBColumn
            Caption = 'Boleto ID'
            DataBinding.FieldName = 'BOLETO_ID'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle16
            Width = 104
          end
        end
        object cxGridLevel4: TcxGridLevel
          Caption = 'Retorno Itens'
          GridView = cxGridDBtvRetornoHistoricoItem
        end
      end
      object grdListBoleto: TcxGrid
        Left = 0
        Top = 464
        Width = 1207
        Height = 82
        Align = alBottom
        TabOrder = 3
        RootLevelOptions.DetailTabsPosition = dtpTop
        object gridBoleto: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          OnCustomDrawCell = gridBoletoCustomDrawCell
          DataController.DataSource = dtsBoletoRetorno
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.FocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          object gridBoletoBOLETO_ID: TcxGridDBColumn
            Caption = 'Boleto ID'
            DataBinding.FieldName = 'BOLETO_ID'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle16
            Width = 61
          end
          object gridBoletoCARTEIRA: TcxGridDBColumn
            Caption = 'Carteira'
            DataBinding.FieldName = 'CARTEIRA'
            Options.Editing = False
            Options.Focusing = False
            Width = 52
          end
          object gridBoletoDATA_PROCESSAMENTO: TcxGridDBColumn
            Caption = 'Dt. Processamento'
            DataBinding.FieldName = 'DATA_PROCESSAMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 99
          end
          object gridBoletoNUMERO_DOCUMENTO: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'NUMERO_DOCUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 83
          end
          object gridBoletoNOSSO_NUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#186
            DataBinding.FieldName = 'NOSSO_NUMERO'
            Options.Editing = False
            Options.Focusing = False
            Width = 83
          end
          object gridBoletoVALOR_DOCUMENTO: TcxGridDBColumn
            Caption = 'Valor Documento'
            DataBinding.FieldName = 'VALOR_DOCUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 92
          end
          object gridBoletoDATA_OCORRENCIA: TcxGridDBColumn
            Caption = 'Dt. Ocorr'#234'ncia'
            DataBinding.FieldName = 'DATA_OCORRENCIA'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 98
          end
          object gridBoletoTIPO_OCORRENCIA: TcxGridDBColumn
            Caption = 'Tipo Ocorr'#234'ncia'
            DataBinding.FieldName = 'TIPO_OCORRENCIA'
            RepositoryItem = icb_tipo_ocorrencia
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 159
          end
          object gridBoletoVALOR_RECEBIDO: TcxGridDBColumn
            Caption = 'Valor Recebido'
            DataBinding.FieldName = 'VALOR_RECEBIDO'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 90
          end
          object gridBoletoVALOR_DESPESA_COBRANCA: TcxGridDBColumn
            Caption = 'Despesa/Tarifa'
            DataBinding.FieldName = 'VALOR_DESPESA_COBRANCA'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle14
            Width = 95
          end
          object gridBoletoNOME: TcxGridDBColumn
            Caption = 'Devedor'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Focusing = False
            Width = 175
          end
          object gridBoletoCPFCNPJ: TcxGridDBColumn
            Caption = 'CPF/CNPJ Devedor'
            DataBinding.FieldName = 'CPFCNPJ'
            Options.Editing = False
            Options.Focusing = False
            Width = 118
          end
        end
        object cxGridLevel5: TcxGridLevel
          Caption = 'Boleto'
          GridView = gridBoleto
        end
      end
      object grdMotivoRejeicao: TcxGrid
        Left = 0
        Top = 358
        Width = 1207
        Height = 106
        Align = alBottom
        TabOrder = 4
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          DataController.DataSource = dtsMotivoRejeicao
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.FocusRect = False
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridDBTableView1DESCRICAO_MOTIVO_REJEICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO_MOTIVO_REJEICAO'
            Options.Editing = False
            Options.Focusing = False
            Width = 928
          end
        end
        object cxGridLevel6: TcxGridLevel
          Caption = 'Motivo Rejei'#231#227'o'
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object OpenDialogRetorno: TOpenDialog
    Left = 464
    Top = 200
  end
  object dtsRemessa: TDataSource
    DataSet = tblRemessa
    Left = 153
    Top = 202
  end
  object sqlContaCedente: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT DISTINCT'
      '       BC.BANCO_CEDENTE_ID,'
      '       B.BANCO_ID BANCO_ID,'
      '       B.DESCRICAO BANCO_NOME,'
      '       BC.NOME NOME_CEDENTE,'
      '       BC.CONTA_NUMERO CONTA_NUMERO,'
      '       BC.CONTA_DIGITO CONTA_DIGITO,'
      '       BC.AGENCIA_NUMERO AGENCIA_NUMERO,'
      '       BC.AGENCIA_DIGITO AGENCIA_DIGITO,'
      '       BC.CODIGO_CEDENTE CODIGO_CEDENTE_NUMERO,'
      '       BC.DIGITO_CODIGO_CEDENTE CODIGO_CEDENTE_DIGITO,'
      '       BC.CARTEIRA_SUGERIDA CARTEIRA,'
      '       BC.MODALIDADE MODALIDADE'
      '  FROM G_BANCO_CEDENTE BC'
      ' INNER JOIN G_BANCO B ON B.BANCO_ID = BC.BANCO_ID'
      'WHERE BC.SITUACAO = '#39'A'#39
      ' ORDER BY'
      '       B.DESCRICAO  ')
    Left = 270
    Top = 201
    object sqlContaCedenteBANCO_CEDENTE_ID: TBCDField
      FieldName = 'BANCO_CEDENTE_ID'
      Origin = 'BANCO_CEDENTE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlContaCedenteNOME_CEDENTE: TStringField
      FieldName = 'NOME_CEDENTE'
      Origin = 'NOME'
      Size = 120
    end
    object sqlContaCedenteBANCO_ID: TStringField
      DisplayLabel = 'ID Banco'
      DisplayWidth = 6
      FieldName = 'BANCO_ID'
      Origin = 'BANCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object sqlContaCedenteBANCO_NOME: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 30
      FieldName = 'BANCO_NOME'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlContaCedenteCONTA_NUMERO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Conta'
      DisplayWidth = 10
      FieldName = 'CONTA_NUMERO'
      Origin = 'CONTA_NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object sqlContaCedenteCONTA_DIGITO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'D'#237'gito'
      DisplayWidth = 10
      FieldName = 'CONTA_DIGITO'
      Origin = 'CONTA_DIGITO'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object sqlContaCedenteAGENCIA_NUMERO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 10
      FieldName = 'AGENCIA_NUMERO'
      Origin = 'AGENCIA_NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object sqlContaCedenteAGENCIA_DIGITO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'D'#237'gito'
      DisplayWidth = 10
      FieldName = 'AGENCIA_DIGITO'
      Origin = 'AGENCIA_DIGITO'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object sqlContaCedenteCODIGO_CEDENTE_NUMERO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cedente'
      DisplayWidth = 10
      FieldName = 'CODIGO_CEDENTE_NUMERO'
      Origin = 'CODIGO_CEDENTE_NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object sqlContaCedenteCODIGO_CEDENTE_DIGITO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'D'#237'gito'
      DisplayWidth = 10
      FieldName = 'CODIGO_CEDENTE_DIGITO'
      Origin = 'CODIGO_CEDENTE_DIGITO'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dtsContaCendente: TDataSource
    DataSet = sqlContaCedente
    Left = 270
    Top = 272
  end
  object tblRetornoHistorico: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'BOLETO_RETORNO_ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 40
    Top = 400
    object tblRetornoHistoricoBOLETO_RETORNO_ID: TBCDField
      FieldName = 'BOLETO_RETORNO_ID'
      Origin = 'BOLETO_RETORNO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoDATA_RETORNO: TSQLTimeStampField
      FieldName = 'DATA_RETORNO'
      Origin = 'DATA_RETORNO'
    end
    object tblRetornoHistoricoNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Origin = 'NOME_ARQUIVO'
      Size = 120
    end
    object tblRetornoHistoricoBANCO_CEDENTE_ID: TBCDField
      FieldName = 'BANCO_CEDENTE_ID'
      Origin = 'BANCO_CEDENTE_ID'
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoHASH_ARQUIVO: TStringField
      FieldName = 'HASH_ARQUIVO'
      Origin = 'HASH_ARQUIVO'
      Size = 120
    end
    object tblRetornoHistoricoUSUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO'
      Origin = 'NOME_COMPLETO'
      ProviderFlags = []
      Size = 120
    end
  end
  object dtsRetornoHistorico: TDataSource
    DataSet = tblRetornoHistorico
    Left = 152
    Top = 400
  end
  object tblRemessa: TI9MemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 40
    Top = 208
    object tblRemessaBOLETO_ID: TBCDField
      FieldName = 'BOLETO_ID'
      Origin = 'BOLETO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object tblRemessaCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 3
    end
    object tblRemessaNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 30
    end
    object tblRemessaVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VALOR_DOCUMENTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblRemessaNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      Size = 30
    end
    object tblRemessaDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
    object tblRemessaDATA_PROCESSAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PROCESSAMENTO'
      Origin = 'DATA_PROCESSAMENTO'
    end
    object tblRemessaDATA_OCORRENCIA: TSQLTimeStampField
      FieldName = 'DATA_OCORRENCIA'
      Origin = 'DATA_OCORRENCIA'
    end
    object tblRemessaTIPO_OCORRENCIA: TStringField
      FieldName = 'TIPO_OCORRENCIA'
      Origin = 'TIPO_OCORRENCIA'
      Size = 3
    end
    object tblRemessaNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 120
    end
    object tblRemessaCPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      ProviderFlags = []
      Size = 15
    end
    object tblRemessaLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      Size = 90
    end
    object tblRemessaNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object tblRemessaCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 60
    end
    object tblRemessaBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      Size = 60
    end
    object tblRemessaCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      Size = 120
    end
    object tblRemessaUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      Size = 3
    end
    object tblRemessaCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      Size = 15
    end
  end
  object tblRemessaHistorico: TI9MemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'BOLETO_REMESSA_ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 40
    Top = 272
    object tblRemessaHistoricoBOLETO_REMESSA_ID: TBCDField
      FieldName = 'BOLETO_REMESSA_ID'
      Origin = 'BOLETO_REMESSA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object tblRemessaHistoricoDATA_REMESSA: TSQLTimeStampField
      FieldName = 'DATA_REMESSA'
      Origin = 'DATA_REMESSA'
    end
    object tblRemessaHistoricoNUMERO_REMESSA: TBCDField
      FieldName = 'NUMERO_REMESSA'
      Origin = 'NUMERO_REMESSA'
      Precision = 18
      Size = 2
    end
    object tblRemessaHistoricoNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Origin = 'NOME_ARQUIVO'
      Size = 120
    end
    object tblRemessaHistoricoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 120
    end
  end
  object dtsRemessaHistorico: TDataSource
    DataSet = tblRemessaHistorico
    Left = 153
    Top = 274
  end
  object tblRemessaHistoricoItem: TI9MemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'BOLETO_REMESSA_ID'
    MasterSource = dtsRemessaHistorico
    MasterFields = 'BOLETO_REMESSA_ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 40
    Top = 336
    object tblRemessaHistoricoItemBOLETO_REMESSA_ID: TBCDField
      FieldName = 'BOLETO_REMESSA_ID'
      Origin = 'BOLETO_REMESSA_ID'
      Precision = 18
      Size = 2
    end
    object tblRemessaHistoricoItemBOLETO_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BOLETO_ID'
      Origin = 'BOLETO_ID'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object tblRemessaHistoricoItemCARTEIRA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      ProviderFlags = []
      Size = 3
    end
    object tblRemessaHistoricoItemNUMERO_DOCUMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      ProviderFlags = []
      Size = 30
    end
    object tblRemessaHistoricoItemNOSSO_NUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      ProviderFlags = []
      Size = 30
    end
    object tblRemessaHistoricoItemDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
    object tblRemessaHistoricoItemVALOR_DOCUMENTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VALOR_DOCUMENTO'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
    end
    object tblRemessaHistoricoItemDATA_PROCESSAMENTO: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_PROCESSAMENTO'
      Origin = 'DATA_PROCESSAMENTO'
      ProviderFlags = []
    end
    object tblRemessaHistoricoItemDATA_OCORRENCIA: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_OCORRENCIA'
      Origin = 'DATA_OCORRENCIA'
      ProviderFlags = []
    end
    object tblRemessaHistoricoItemTIPO_OCORRENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_OCORRENCIA'
      Origin = 'TIPO_OCORRENCIA'
      ProviderFlags = []
      Size = 3
    end
    object tblRemessaHistoricoItemNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 120
    end
    object tblRemessaHistoricoItemCPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      ProviderFlags = []
      Size = 15
    end
    object tblRemessaHistoricoItemCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      Size = 120
    end
    object tblRemessaHistoricoItemUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      Size = 3
    end
  end
  object dtsRemessaHistoricoItem: TDataSource
    DataSet = tblRemessaHistoricoItem
    Left = 153
    Top = 338
  end
  object cxEditRepository1: TcxEditRepository
    Left = 568
    Top = 200
    object icb_tipo_ocorrencia: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Boleto Alterado'
          ImageIndex = 42
          Value = 'BLA'
        end
        item
          Description = 'Boleto Baixado'
          ImageIndex = 16
          Value = 'RBA'
        end
        item
          Description = 'Boleto Cancelado'
          ImageIndex = 46
          Value = 'BLC'
        end
        item
          Description = 'Boleto Confirmado'
          ImageIndex = 0
          Value = 'REC'
        end
        item
          Description = 'Boleto Gerado'
          ImageIndex = 2
          Value = 'BLG'
        end
        item
          Description = 'Boleto Inativado'
          ImageIndex = 33
          Value = 'BIN'
        end
        item
          Description = 'Boleto Liquidado'
          ImageIndex = 53
          Value = 'RLN'
        end
        item
          Description = 'Boleto Rejeitado'
          ImageIndex = 1
          Value = 'RER'
        end
        item
          Description = '<Todos>'
          ImageIndex = 27
          Value = 'TDS'
        end>
    end
  end
  object tblRetornoHistoricoItem: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'BOLETO_RETORNO_ID'
    MasterSource = dtsRetornoHistorico
    MasterFields = 'BOLETO_RETORNO_ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 40
    Top = 464
    object tblRetornoHistoricoItemBOLETO_RETORNO_ITEM_ID: TBCDField
      FieldName = 'BOLETO_RETORNO_ITEM_ID'
      Origin = 'BOLETO_RETORNO_ITEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoItemBOLETO_RETORNO_ID: TBCDField
      FieldName = 'BOLETO_RETORNO_ID'
      Origin = 'BOLETO_RETORNO_ID'
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoItemBOLETO_ID: TBCDField
      FieldName = 'BOLETO_ID'
      Origin = 'BOLETO_ID'
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoItemOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      Origin = 'OCORRENCIA'
      Size = 120
    end
    object tblRetornoHistoricoItemDATA_CORRENCIA: TSQLTimeStampField
      FieldName = 'DATA_CORRENCIA'
      Origin = 'DATA_CORRENCIA'
    end
    object tblRetornoHistoricoItemNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 30
    end
    object tblRetornoHistoricoItemNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      Size = 30
    end
    object tblRetornoHistoricoItemVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblRetornoHistoricoItemDATA_CREDITO: TSQLTimeStampField
      FieldName = 'DATA_CREDITO'
      Origin = 'DATA_CREDITO'
    end
    object tblRetornoHistoricoItemDATA_BAIXA: TSQLTimeStampField
      FieldName = 'DATA_BAIXA'
      Origin = 'DATA_BAIXA'
    end
  end
  object dtsRetornoHistoricoItem: TDataSource
    DataSet = tblRetornoHistoricoItem
    Left = 152
    Top = 464
  end
  object SaveDialogRemessa: TSaveDialog
    Left = 464
    Top = 264
  end
  object ppmSaveFileRemessa: TPopupMenu
    AutoPopup = False
    Left = 720
    Top = 288
    object ExportarArquivoRemessa1: TMenuItem
      Caption = 'Exportar Arquivo Remessa'
      OnClick = ExportarArquivoRemessa1Click
    end
  end
  object ppmSaveFileRetorno: TPopupMenu
    AutoPopup = False
    Left = 720
    Top = 360
    object ExportarArquivoRetorno1: TMenuItem
      Caption = 'Exportar Arquivo Retorno'
      OnClick = ExportarArquivoRetorno1Click
    end
  end
  object sqlBoletoRetorno: TI9Query
    IndexFieldNames = 'BOLETO_ID'
    MasterSource = dtsRetornoHistoricoItem
    MasterFields = 'BOLETO_ID'
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT B.BOLETO_ID,'
      '       B.CARTEIRA,'
      '       B.DATA_PROCESSAMENTO,'
      '       B.NUMERO_DOCUMENTO,'
      '       B.NOSSO_NUMERO,'
      '       B.DATA_VENCIMENTO,'
      '       B.VALOR_DOCUMENTO,'
      '       B.DATA_OCORRENCIA,'
      '       B.TIPO_OCORRENCIA,'
      '       B.VALOR_RECEBIDO, '
      '       B.VALOR_DESPESA_COBRANCA,'
      '       B.REMESSA_GERADA,'
      '       BS.NOME,'
      '       BS.CPFCNPJ'
      'FROM C_BOLETO B'
      'INNER JOIN C_BOLETO_SACADO BS ON BS.BOLETO_ID = B.BOLETO_ID'
      'WHERE B.BOLETO_ID = :BOLETO_ID'
      'ORDER BY B.BOLETO_ID')
    Left = 352
    Top = 416
    ParamData = <
      item
        Name = 'BOLETO_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end>
    object sqlBoletoRetornoBOLETO_ID: TBCDField
      FieldName = 'BOLETO_ID'
      Origin = 'BOLETO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlBoletoRetornoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 3
    end
    object sqlBoletoRetornoDATA_PROCESSAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PROCESSAMENTO'
      Origin = 'DATA_PROCESSAMENTO'
    end
    object sqlBoletoRetornoNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 30
    end
    object sqlBoletoRetornoNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      Size = 30
    end
    object sqlBoletoRetornoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
    object sqlBoletoRetornoVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VALOR_DOCUMENTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlBoletoRetornoDATA_OCORRENCIA: TSQLTimeStampField
      FieldName = 'DATA_OCORRENCIA'
      Origin = 'DATA_OCORRENCIA'
    end
    object sqlBoletoRetornoTIPO_OCORRENCIA: TStringField
      FieldName = 'TIPO_OCORRENCIA'
      Origin = 'TIPO_OCORRENCIA'
      Size = 3
    end
    object sqlBoletoRetornoVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlBoletoRetornoVALOR_DESPESA_COBRANCA: TBCDField
      FieldName = 'VALOR_DESPESA_COBRANCA'
      Origin = 'VALOR_DESPESA_COBRANCA'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlBoletoRetornoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object sqlBoletoRetornoCPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object sqlBoletoRetornoREMESSA_GERADA: TStringField
      FieldName = 'REMESSA_GERADA'
      Origin = 'REMESSA_GERADA'
      Size = 1
    end
  end
  object dtsBoletoRetorno: TDataSource
    DataSet = sqlBoletoRetorno
    Left = 352
    Top = 472
  end
  object sqlMotivoRejeicao: TI9Query
    IndexFieldNames = 'BOLETO_RETORNO_ITEM_ID'
    MasterSource = dtsRetornoHistoricoItem
    MasterFields = 'BOLETO_RETORNO_ITEM_ID'
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT BOLETO_MOTIVO_REJEICAO_ID,'
      '       BOLETO_RETORNO_ITEM_ID,'
      '       DESCRICAO_MOTIVO_REJEICAO'
      'FROM C_BOLETO_MOTIVO_REJEICAO'
      'WHERE BOLETO_RETORNO_ITEM_ID = :BOLETO_RETORNO_ITEM_ID '
      'ORDER BY BOLETO_MOTIVO_REJEICAO_ID ')
    Left = 472
    Top = 408
    ParamData = <
      item
        Name = 'BOLETO_RETORNO_ITEM_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end>
    object sqlMotivoRejeicaoBOLETO_MOTIVO_REJEICAO_ID: TBCDField
      FieldName = 'BOLETO_MOTIVO_REJEICAO_ID'
      Origin = 'BOLETO_MOTIVO_REJEICAO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlMotivoRejeicaoBOLETO_RETORNO_ITEM_ID: TBCDField
      FieldName = 'BOLETO_RETORNO_ITEM_ID'
      Origin = 'BOLETO_RETORNO_ITEM_ID'
      Precision = 18
      Size = 2
    end
    object sqlMotivoRejeicaoDESCRICAO_MOTIVO_REJEICAO: TStringField
      FieldName = 'DESCRICAO_MOTIVO_REJEICAO'
      Origin = 'DESCRICAO_MOTIVO_REJEICAO'
      Size = 260
    end
  end
  object dtsMotivoRejeicao: TDataSource
    DataSet = sqlMotivoRejeicao
    Left = 472
    Top = 464
  end
  object ppmItemRetorno: TPopupMenu
    AutoPopup = False
    Images = dtmControles.imgCadBasicos
    Left = 720
    Top = 216
    object ExportarPlanilha1: TMenuItem
      Caption = 'Exportar Planilha'
      ImageIndex = 66
      OnClick = ExportarPlanilha1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExportarGrupoSelecionado1: TMenuItem
      Caption = 'Exportar Grupo Selecionado'
      ImageIndex = 45
      OnClick = ExportarGrupoSelecionado1Click
    end
  end
  object tblBoleto: TI9MemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 568
    Top = 408
    object tblBoletoBOLETO_ID: TBCDField
      FieldName = 'BOLETO_ID'
      Origin = 'BOLETO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object tblBoletoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 3
    end
    object tblBoletoNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 30
    end
    object tblBoletoVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VALOR_DOCUMENTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblBoletoNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      Size = 30
    end
    object tblBoletoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
    object tblBoletoDATA_PROCESSAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PROCESSAMENTO'
      Origin = 'DATA_PROCESSAMENTO'
    end
    object tblBoletoDATA_OCORRENCIA: TSQLTimeStampField
      FieldName = 'DATA_OCORRENCIA'
      Origin = 'DATA_OCORRENCIA'
    end
    object tblBoletoTIPO_OCORRENCIA: TStringField
      FieldName = 'TIPO_OCORRENCIA'
      Origin = 'TIPO_OCORRENCIA'
      Size = 3
    end
    object tblBoletoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 120
    end
    object tblBoletoCPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      ProviderFlags = []
      Size = 15
    end
    object tblBoletoLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      Size = 90
    end
    object tblBoletoNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object tblBoletoCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 60
    end
    object tblBoletoBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      Size = 60
    end
    object tblBoletoCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      Size = 120
    end
    object tblBoletoUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      Size = 3
    end
    object tblBoletoCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      Size = 15
    end
    object tblBoletoREMESSA_GERADA: TStringField
      FieldName = 'REMESSA_GERADA'
      Origin = 'REMESSA_GERADA'
      Size = 1
    end
    object tblBoletocalc_check: TStringField
      FieldName = 'calc_check'
      Size = 1
    end
  end
  object dtsBoleto: TDataSource
    DataSet = tblBoleto
    Left = 569
    Top = 466
  end
  object ppmBoleto: TPopupMenu
    AutoPopup = False
    Images = dtmControles.imgCadBasicos
    Left = 720
    Top = 432
    object AlterarVencimento1: TMenuItem
      Caption = 'Alterar Vencimento'
      ImageIndex = 47
      OnClick = AlterarVencimento1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      ImageIndex = 46
      OnClick = Cancelar1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Inativar1: TMenuItem
      Caption = 'Inativar'
      ImageIndex = 33
      OnClick = Inativar1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ExportarBoletos1: TMenuItem
      Caption = 'Exportar Boleto(s)'
      ImageIndex = 66
      OnClick = ExportarBoletos1Click
    end
  end
end
