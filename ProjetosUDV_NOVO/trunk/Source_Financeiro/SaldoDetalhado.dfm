object frmSaldoDetalhado: TfrmSaldoDetalhado
  Left = 0
  Top = 0
  Caption = 'Saldo Detalhado'
  ClientHeight = 440
  ClientWidth = 986
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 123
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object pgcPeriodo: TcxPageControl
      Left = 0
      Top = 0
      Width = 986
      Height = 123
      Align = alClient
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Properties.ActivePage = cxTabSheet2
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      ClientRectBottom = 123
      ClientRectRight = 986
      ClientRectTop = 24
      object cxTabSheet2: TcxTabSheet
        Caption = 'Intervalo de Data de Verifica'#231#227'o do Saldo'
        ImageIndex = 1
        ParentColor = False
        object Panel2: TPanel
          Left = 908
          Top = 20
          Width = 78
          Height = 79
          Align = alRight
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object cxBtnFechar: TcxButton
            Left = 10
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
        object pgcPesquisa: TcxPageControl
          Left = 0
          Top = 20
          Width = 908
          Height = 79
          Align = alClient
          TabOrder = 1
          Properties.ActivePage = cxTabSheet1
          Properties.CustomButtons.Buttons = <>
          OnChange = pgcPesquisaChange
          ClientRectBottom = 79
          ClientRectRight = 908
          ClientRectTop = 24
          object cxTabSheet1: TcxTabSheet
            Caption = 'Pesquisa Ano/M'#234's'
            ImageIndex = 0
            object rdbAnoMesAtual: TcxRadioButton
              Left = 16
              Top = 9
              Width = 105
              Height = 17
              Caption = 'Ano/M'#234's Atual'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rdbAnoMesAtualClick
            end
            object rdbAnoMesFechamento: TcxRadioButton
              Left = 126
              Top = 9
              Width = 145
              Height = 17
              Caption = 'Ano/M'#234's de Fechamento'
              TabOrder = 1
              OnClick = rdbAnoMesFechamentoClick
            end
            object icxMes: TcxImageComboBox
              Left = 14
              Top = 32
              RepositoryItem = dtmLookup.Combo_Meses
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              StyleDisabled.TextColor = clBlack
              TabOrder = 2
              Width = 121
            end
            object icxAno: TcxImageComboBox
              Left = 140
              Top = 32
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              StyleDisabled.TextColor = clBlack
              TabOrder = 3
              Width = 85
            end
            object btnFecharLivroCaixa: TcxButton
              Left = 264
              Top = 30
              Width = 160
              Height = 22
              Caption = 'Realizar Fechamento'
              Colors.Default = clWhite
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              OptionsImage.Glyph.Data = {
                A6070000424DA60700000000000036040000280000002A000000140000000100
                0800000000007003000000000000000000000001000000000000000000000101
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
                F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFF540200
                000000000000000000000016D5FFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFF
                FFFFFFFF0000FFFFFF03000002010101010200000000000279FFFFFFFFFFFFFF
                FFFFFFDEC0F2FFFFFFFFFFFFFFFFFFFF0000FFFFFF0202032932323232210302
                020302027EFFFFFFFFFFFFFFFFFFE76D32A2FFFFFFFFFFFFFFFFFFFF0000FFFF
                FF03020CC4DAD7D7DAA30302020302027EFFFFFFFFFFFFFFFFF58F210E35DCFF
                FFFFFFFFFFFFFFFF0000FFFFFF0403030303030303030303030303037EFFFFFF
                FFFFFFFFFFBB2B12131264F4FFFFFFFFFFFFFFFF0000FFFFFF03030DBED8D5D4
                D4D5DADADA67040381FFFFFFFFFFFFFFD931111616151A84F6FFFFFFFFFFFFFF
                0000FFFFFF050508292A2828292829292D1B050483FFFFFFFFFFFFE358131614
                15171530ADF9FFFFFFFFFFFF0000FFFFFF050609475253535354535352270505
                83FFFFFFFFFFEA781D1619312717181A4ED2FDFFFFFFFFFF0000FFFFFF060611
                A7B8B3B3B4B3B4B3B860060683FFFFFFFFF69A2C181952BC9D2918181E71EDFF
                FFFFFFFF0000FFFFFF08080908090909090909080908080887FFFFFFFDBD391A
                155AE1FEF7A8191A1B26A1FFFFFFFFFF0000FFFFFF0A0916D5EEEEEEEEEEEEEE
                F07A0A0A88FFFFFFDE4B181E6CFFFFFFFFFFA3271B1B31D1FFFFFFFF0000FFFF
                FF0C0B0D171716171716171718130C0C88FFFFFF8A1F277AF0FFFFFFFFFFF490
                2A1C1B59E5FFFFFF0000FFFFFF0C0C137A8D8C8C8C8D8D8D8D460D0C8AFFFFFF
                3A3391ECFFFFFFFFFFFFFFED8A2A1E2684F1FFFF0000FFFFFF0D0D17838D918F
                888787878C530E0E8AFFFFFFA0B9F2FFFFFFFFFFFFFFFFFFEC85221F39ADFBFF
                0000FFFFFF0F0F0F1212120F1E1D1F1F1E130F0F8CFFFFFFFBFEFFFFFFFFFFFF
                FFFFFFFFFFF2831A2252D3FF0000FFFFFF11122AF1F32A37EDEEEDEEF0831211
                8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7923246DE90000FFFFFF14132F
                FFFF3E151A1B1B1B1C1814148EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
                77282DA10000FFFFFF1615153235151515161515151515158FFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE474273B0000FFFFFF1A16171616171717161716
                1717161996FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE37D5C0000FFFF
                FF721A19191819181918191919191834DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF0E90000}
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnFecharLivroCaixaClick
            end
            object btnReabrirLivroCaixa: TcxButton
              Left = 430
              Top = 30
              Width = 160
              Height = 22
              Caption = 'Reabrir Livro Caixa'
              Colors.Default = clWhite
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              OptionsImage.Glyph.Data = {
                76050000424D760500000000000036040000280000000F000000140000000100
                080000000000400100000000000000000000000100000000000000000000BCBC
                BC005757570028282800FFFFFF0087878700EBEBEB008B8B8B000C0C0C00B0B0
                B000CFCFCF006C6C6C00383838006A6A6A00DBDBDB0012121200505050006666
                6600C5C5C500F7F7F70036363600737373003333330004040400191919009393
                9300CCCCCC0076767600DDDDDD003C3C3C0020202000B5B5B500F1F1F100E3E3
                E300D1D1D1007070700006060600FBFBFB00C9C9C90089898900EFEFEF00BFBF
                BF003A3A3A000E0E0E003F3F3F00D3D3D3005858580078787800B3B3B300F9F9
                F900B7B7B7000909090000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000040E14000000
                000000000000140E04000E160000000000000000000000160E001600000C0D11
                11111111110C0000160000001D2004040404040404281D000000000023040404
                0413040404042300000000000B0404040503050404040B00000000000B040404
                0C000C0404040B00000000000B040404122F120404040B000000000015040404
                0404040404041500000000002E2D0A0A0A0A0A0A0A2D2E0000000000170F2B08
                08080808080F2400000000000000000000000000000000000000050507191927
                0505050505052C0000000404200129040404040404041B000000040407000030
                0404040404041D00000004042900000204040404043217002A000404251D0000
                23060425091800001F00040404263300001E101D0000002F0400040404040103
                000000000017151304000404040404210D0800000C0904040400}
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnReabrirLivroCaixaClick
            end
            object btnPesquisarSaldo: TcxButton
              Left = 231
              Top = 30
              Width = 28
              Height = 22
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
              OnClick = btnPesquisarSaldoClick
            end
            object rdbAnoMesEscolher: TcxRadioButton
              Left = 277
              Top = 9
              Width = 116
              Height = 17
              Caption = 'Ano/M'#234's Escolher'
              TabOrder = 7
              OnClick = rdbAnoMesEscolherClick
            end
          end
          object cxTabSheet3: TcxTabSheet
            Caption = 'Pesquisa Personalizada'
            ImageIndex = 1
            object cxLabel2: TcxLabel
              Left = 11
              Top = 5
              Caption = 'Data Inicial'
              Style.TextColor = 16384
              Transparent = True
            end
            object edtDataInicial: TcxDateEdit
              Left = 12
              Top = 23
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 1
              Width = 90
            end
            object edtDataFinal: TcxDateEdit
              Left = 108
              Top = 23
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 2
              Width = 90
            end
            object cxLabel1: TcxLabel
              Left = 108
              Top = 5
              Caption = 'Data Final'
              Style.TextColor = 16384
              Transparent = True
            end
            object btnPesquisar: TcxButton
              Left = 203
              Top = 21
              Width = 95
              Height = 22
              Caption = 'Verificar'
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
            object chxInativos: TCheckBox
              Left = 315
              Top = 25
              Width = 141
              Height = 17
              Caption = 'Mostrar Caixas Inativos'
              Enabled = False
              TabOrder = 5
              OnClick = chxInativosClick
            end
          end
        end
        object lcxInformacao: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'lcxInformacao'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 16384
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = 16384
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
      end
    end
  end
  object tabDistribuicao: TcxTabControl
    Left = 0
    Top = 123
    Width = 986
    Height = 317
    Align = alClient
    TabOrder = 1
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      'Distribui'#231#227'o Caixas'
      'Distribui'#231#227'o Balancetes'
      'Distribui'#231#227'o de Reservas/Provis'#245'es')
    OnChange = tabDistribuicaoChange
    ClientRectBottom = 317
    ClientRectRight = 986
    ClientRectTop = 24
    object pgcGridPesquisa: TcxPageControl
      Left = 0
      Top = 24
      Width = 986
      Height = 293
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet4
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 293
      ClientRectRight = 986
      ClientRectTop = 24
      object cxTabSheet4: TcxTabSheet
        Caption = 'cxTabSheet4'
        ImageIndex = 0
        object gdrCompromissoAgendado: TcxGrid
          Left = 0
          Top = 0
          Width = 986
          Height = 269
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object cxGridDBTablePrevisao: TcxGridDBTableView
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
            FilterBox.CustomizeDialog = False
            FilterBox.Position = fpTop
            DataController.DataSource = dtsSaldoDetalhado
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'SALDO_ANTERIOR'
                Column = cxGridDBTablePrevisaoSaldoAnterior
              end
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'RECEITAS'
                Column = cxGridDBTablePrevisaoReceitas
              end
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'DESPESAS'
                Column = cxGridDBTablePrevisaoDespesas
              end
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'ENTRADAS'
                Column = cxGridDBTablePrevisaoEntradas
              end
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'SAIDAS'
                Column = cxGridDBTablePrevisaoSaidas
              end
              item
                Format = ',#0.00'
                Kind = skSum
                FieldName = 'VALOR'
                Column = cxGridDBTablePrevisaoSaldo
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
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsSelection.CellMultiSelect = True
            OptionsView.ScrollBars = ssVertical
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            Styles.Group = dtmControles.cxStyle12
            Styles.GroupByBox = dtmControles.cxStyle12
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridDBTablePrevisaoBalancete: TcxGridDBColumn
              Caption = 'Balancete Grupo'
              DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
              RepositoryItem = dtmLookup.Lista_BalanceteGrupoDescricao
              Options.Editing = False
              Options.Focusing = False
              Width = 204
            end
            object cxGridDBTablePrevisaoCaixa: TcxGridDBColumn
              Caption = 'Conta'
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Options.Focusing = False
              Width = 223
            end
            object cxGridDBTablePrevisaoSaldoAnterior: TcxGridDBColumn
              Caption = 'Saldo Anterior'
              DataBinding.FieldName = 'SALDO_ANTERIOR'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 93
            end
            object cxGridDBTablePrevisaoReceitas: TcxGridDBColumn
              Caption = 'Receitas (+)'
              DataBinding.FieldName = 'RECEITAS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 94
            end
            object cxGridDBTablePrevisaoDespesas: TcxGridDBColumn
              Caption = 'Despesas (-)'
              DataBinding.FieldName = 'DESPESAS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 91
            end
            object cxGridDBTablePrevisaoEntradas: TcxGridDBColumn
              Caption = 'Entradas (+)'
              DataBinding.FieldName = 'ENTRADAS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 92
            end
            object cxGridDBTablePrevisaoSaidas: TcxGridDBColumn
              Caption = 'Sa'#237'das (-)'
              DataBinding.FieldName = 'SAIDAS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 94
            end
            object cxGridDBTablePrevisaoSaldo: TcxGridDBColumn
              Caption = 'Saldo (=)'
              DataBinding.FieldName = 'VALOR'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 93
            end
          end
          object cxGridLevel7: TcxGridLevel
            GridView = cxGridDBTablePrevisao
          end
        end
      end
      object cxTabSheet5: TcxTabSheet
        Caption = 'cxTabSheet5'
        ImageIndex = 1
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 986
          Height = 269
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
            FilterBox.CustomizeDialog = False
            FilterBox.Position = fpTop
            DataController.DataSource = dtsReserva
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'SALDO_ANTERIOR'
                Column = cxGridDBReservaSaldoAnterior
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'VALOR_ENTRADA'
                Column = cxGridDBReservaValorEntrada
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'VALOR_SAIDA'
                Column = cxGridDBReservaValorSaida
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'TRANSFERENCIA_ENTRADA'
                Column = cxGridDBReservaTranfEntrada
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'TRANSFERENCIA_SAIDA'
                Column = cxGridDBReservaTranfSaida
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'VALOR_RESERVA'
                Column = cxGridDBReservaValorDisponivel
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                FieldName = 'RESULTADO_MES'
                Column = cxGridDBReservaResultado
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
            OptionsSelection.MultiSelect = True
            OptionsView.ScrollBars = ssVertical
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            Styles.Group = dtmControles.cxStyle12
            Styles.GroupByBox = dtmControles.cxStyle12
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridDBReservaDescricao: TcxGridDBColumn
              Caption = 'Provimento/Reserva'
              DataBinding.FieldName = 'RESERVA_ID'
              RepositoryItem = dtmLookup.Lista_ReservasAtivas
              Options.Editing = False
              Options.Focusing = False
              Width = 234
            end
            object cxGridDBReservaSaldoAnterior: TcxGridDBColumn
              Caption = 'Saldo Anterior'
              DataBinding.FieldName = 'SALDO_ANTERIOR'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 112
            end
            object cxGridDBReservaValorEntrada: TcxGridDBColumn
              Caption = 'Entradas (+)'
              DataBinding.FieldName = 'VALOR_ENTRADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 114
            end
            object cxGridDBReservaValorSaida: TcxGridDBColumn
              Caption = 'Sa'#237'das (-)'
              DataBinding.FieldName = 'VALOR_SAIDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 110
            end
            object cxGridDBReservaResultado: TcxGridDBColumn
              Caption = 'Resultado M'#234's'
              DataBinding.FieldName = 'RESULTADO_MES'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 97
            end
            object cxGridDBReservaTranfEntrada: TcxGridDBColumn
              Caption = 'Transfer'#234'ncias (+)'
              DataBinding.FieldName = 'TRANSFERENCIA_ENTRADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 110
            end
            object cxGridDBReservaTranfSaida: TcxGridDBColumn
              Caption = 'Transfer'#234'ncia (-)'
              DataBinding.FieldName = 'TRANSFERENCIA_SAIDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 103
            end
            object cxGridDBReservaValorDisponivel: TcxGridDBColumn
              Caption = 'Saldo (=)'
              DataBinding.FieldName = 'VALOR_RESERVA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 104
            end
            object cxGridDBReservaBalancete: TcxGridDBColumn
              DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
              RepositoryItem = dtmLookupContabil.Lista_BalanceteGrupoDescricao
              Visible = False
              GroupIndex = 0
              IsCaptionAssigned = True
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
  end
  object ClientSaldoDetalhado: TClientDataSet
    PersistDataPacket.Data = {
      8D0100009619E0BD01000000180000000C0000000000030000008D0108434149
      58415F49440400010000000000095052494E434950414C010049000000010005
      57494454480200020001000556414C4F52080004000000010007535542545950
      450200490006004D6F6E65790009504553534F415F4944040001000000000009
      44455343524943414F0100490000000100055749445448020002005A000E5341
      4C444F5F414E544552494F520800040000000100075355425459504502004900
      06004D6F6E657900085245434549544153080004000000010007535542545950
      450200490006004D6F6E65790008444553504553415308000400000001000753
      5542545950450200490006004D6F6E65790008454E5452414441530800040000
      00010007535542545950450200490006004D6F6E657900065341494441530800
      04000000010007535542545950450200490006004D6F6E6579001242414C414E
      434554455F475255504F5F4944040001000000000005475255504F0100490000
      000100055749445448020002003C000000}
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
        Size = 90
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'RECEITAS'
        DataType = ftCurrency
      end
      item
        Name = 'DESPESAS'
        DataType = ftCurrency
      end
      item
        Name = 'ENTRADAS'
        DataType = ftCurrency
      end
      item
        Name = 'SAIDAS'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 179
    Top = 233
    object IntegerField1: TIntegerField
      FieldName = 'CAIXA_ID'
    end
    object StringField1: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'VALOR'
    end
    object IntegerField2: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object StringField2: TStringField
      DisplayWidth = 90
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'SITUACAO'
      Size = 1
      Calculated = True
    end
    object ClientSaldoDetalhadoSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientSaldoDetalhadoRECEITAS: TCurrencyField
      FieldName = 'RECEITAS'
    end
    object ClientSaldoDetalhadoDESPESAS: TCurrencyField
      FieldName = 'DESPESAS'
    end
    object ClientSaldoDetalhadoENTRADAS: TCurrencyField
      FieldName = 'ENTRADAS'
    end
    object ClientSaldoDetalhadoSAIDAS: TCurrencyField
      FieldName = 'SAIDAS'
    end
    object ClientSaldoDetalhadoBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientSaldoDetalhadoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
  end
  object dtsSaldoDetalhado: TDataSource
    DataSet = ClientSaldoDetalhado
    Left = 177
    Top = 302
  end
  object ClientReserva: TClientDataSet
    PersistDataPacket.Data = {
      A10100009619E0BD01000000180000000A000000000003000000A10111524553
      455256415F44455343524943414F010049000000010005574944544802000200
      5A000D56414C4F525F5245534552564108000400000001000753554254595045
      0200490006004D6F6E6579001242414C414E434554455F475255504F5F494404
      000100000000000D56414C4F525F454E54524144410800040000000100075355
      42545950450200490006004D6F6E6579000B56414C4F525F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000A524553455256
      415F494404000100000000000E53414C444F5F414E544552494F520800040000
      00010007535542545950450200490006004D6F6E6579000D524553554C544144
      4F5F4D4553080004000000010007535542545950450200490006004D6F6E6579
      00155452414E53464552454E4349415F454E5452414441080004000000010007
      535542545950450200490006004D6F6E657900135452414E53464552454E4349
      415F5341494441080004000000010007535542545950450200490006004D6F6E
      6579000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Filter = 
      '(VALOR_RESERVA <> 0) or (VALOR_ENTRADA <> 0) or (VALOR_SAIDA <> ' +
      '0)'
    FieldDefs = <
      item
        Name = 'RESERVA_DESCRICAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_RESERVA'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESERVA_ID'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'RESULTADO_MES'
        DataType = ftCurrency
      end
      item
        Name = 'TRANSFERENCIA_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'TRANSFERENCIA_SAIDA'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 286
    Top = 232
    object ClientReservaRESERVA_DESCRICAO: TStringField
      FieldName = 'RESERVA_DESCRICAO'
      Size = 90
    end
    object ClientReservaVALOR_RESERVA: TCurrencyField
      FieldName = 'VALOR_RESERVA'
    end
    object ClientReservaBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
      Visible = False
    end
    object ClientReservaVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
    end
    object ClientReservaVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
    end
    object ClientReservaRESERVA_ID: TIntegerField
      FieldName = 'RESERVA_ID'
    end
    object ClientReservaSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientReservaRESULTADO_MES: TCurrencyField
      FieldName = 'RESULTADO_MES'
    end
    object ClientReservaTRANSFERENCIA_ENTRADA: TCurrencyField
      FieldName = 'TRANSFERENCIA_ENTRADA'
    end
    object ClientReservaTRANSFERENCIA_SAIDA: TCurrencyField
      FieldName = 'TRANSFERENCIA_SAIDA'
    end
  end
  object dtsReserva: TDataSource
    DataSet = ClientReserva
    Left = 284
    Top = 295
  end
  object ClientSaldoReserva: TClientDataSet
    PersistDataPacket.Data = {
      A10100009619E0BD01000000180000000A000000000003000000A10111524553
      455256415F44455343524943414F010049000000010005574944544802000200
      5A000D56414C4F525F5245534552564108000400000001000753554254595045
      0200490006004D6F6E6579001242414C414E434554455F475255504F5F494404
      000100000000000D56414C4F525F454E54524144410800040000000100075355
      42545950450200490006004D6F6E6579000B56414C4F525F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000A524553455256
      415F494404000100000000000E53414C444F5F414E544552494F520800040000
      00010007535542545950450200490006004D6F6E657900155452414E53464552
      454E4349415F454E545241444108000400000001000753554254595045020049
      0006004D6F6E657900135452414E53464552454E4349415F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000D524553554C54
      41444F5F4D4553080004000000010007535542545950450200490006004D6F6E
      6579000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'RESERVA_DESCRICAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_RESERVA'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESERVA_ID'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'TRANSFERENCIA_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'TRANSFERENCIA_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESULTADO_MES'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 377
    Top = 241
    object ClientSaldoReservaRESERVA_DESCRICAO: TStringField
      FieldName = 'RESERVA_DESCRICAO'
      Size = 90
    end
    object ClientSaldoReservaVALOR_RESERVA: TCurrencyField
      FieldName = 'VALOR_RESERVA'
    end
    object ClientSaldoReservaBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientSaldoReservaVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
    end
    object ClientSaldoReservaVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
    end
    object ClientSaldoReservaRESERVA_ID: TIntegerField
      FieldName = 'RESERVA_ID'
    end
    object ClientSaldoReservaSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientSaldoReservaTRANSFERENCIA_ENTRADA: TCurrencyField
      FieldName = 'TRANSFERENCIA_ENTRADA'
    end
    object ClientSaldoReservaTRANSFERENCIA_SAIDA: TCurrencyField
      FieldName = 'TRANSFERENCIA_SAIDA'
    end
    object ClientSaldoReservaRESULTADO_MES: TCurrencyField
      FieldName = 'RESULTADO_MES'
    end
  end
end
