object fmeCompromisso: TfmeCompromisso
  Left = 0
  Top = 0
  Width = 1024
  Height = 124
  Color = 16247513
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object tabBalancete: TcxTabControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 124
    Align = alClient
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      '')
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    OnChange = tabBalanceteChange
    ClientRectBottom = 123
    ClientRectLeft = 1
    ClientRectRight = 1023
    ClientRectTop = 21
    object Panel1: TPanel
      Left = 1
      Top = 21
      Width = 1022
      Height = 102
      Align = alClient
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object cxLabel7: TcxLabel
        Left = 9
        Top = 26
        Caption = 'Compromisso:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 10
        Top = 70
        Caption = 'Per'#237'odo:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 187
        Top = 70
        Caption = 'M'#234's/Ano Inicial:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 570
        Top = 70
        Caption = 'Valor:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 10
        Top = 45
        Caption = 
          'Ocorr'#234'ncia                                                      ' +
          '                                  ______________________________' +
          '___            '
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
        Left = 475
        Top = 23
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = clNavy
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 382
        Top = 70
        Caption = 'M'#234's/Ano Final:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 382
        Top = 26
        Caption = 'Centro Custo:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1022
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 14807280
        ParentBackground = False
        TabOrder = 8
        object Panel3: TPanel
          Left = 837
          Top = 0
          Width = 185
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
        end
        object btnEfetuarPagamento: TcxLabel
          Left = 855
          Top = 3
          Cursor = crHandPoint
          Hint = 'Vai para a Tela de Gerenciamento de Receitas'
          Caption = 'Clique para Efetuar Pagamento'
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          Style.Color = clBtnFace
          Style.TextColor = clRed
          Style.TextStyle = [fsUnderline]
          StyleFocused.TextColor = clMaroon
          Transparent = True
        end
        object rdbCompromissosDiversos: TcxRadioButton
          Left = 64
          Top = 7
          Width = 137
          Height = 17
          Caption = 'Compromissos Diversos'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rdbCompromissosDiversosClick
        end
        object rdbCompromissosMensais: TcxRadioButton
          Left = 224
          Top = 7
          Width = 245
          Height = 17
          Caption = 'Compromissos Fixos e Mensais Agendados'
          TabOrder = 3
          OnClick = rdbCompromissosMensaisClick
        end
      end
      object lblReserva: TcxLabel
        Left = 699
        Top = 26
        Caption = 'Reserva:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object lcxCompromisso: TcxLookupComboBox
        Left = 79
        Top = 25
        RepositoryItem = dtmLookup.Lista_ContasAgendadasMensal
        ParentFont = False
        Properties.ListColumns = <>
        Properties.OnEditValueChanged = lcxCompromissoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 10
        Width = 291
      end
      object lcxCentroCusto: TcxLookupComboBox
        Left = 459
        Top = 25
        RepositoryItem = dtmLookup.Lista_CentroCustoAtivo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 11
        Width = 234
      end
      object lcxReserva: TcxLookupComboBox
        Left = 747
        Top = 24
        RepositoryItem = dtmLookup.Lista_ReservasAtivas
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 12
        Width = 262
      end
      object icxPeriodo: TcxImageComboBox
        Left = 79
        Top = 67
        RepositoryItem = dtmLookup.Combo_Periodo
        ParentFont = False
        Properties.Items = <>
        Properties.OnEditValueChanged = icxPeriodoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 13
        Width = 101
      end
      object cbxMesAnoInicial: TcxComboBox
        Left = 266
        Top = 67
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnEditValueChanged = cbxMesAnoInicialPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 14
        Width = 104
      end
      object cbxMesAnoFinal: TcxComboBox
        Left = 459
        Top = 67
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 15
        Width = 104
      end
      object edtValor: TcxCurrencyEdit
        Left = 604
        Top = 67
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 16
        Width = 89
      end
      object btnConfirmarCompromisso: TcxButton
        Left = 813
        Top = 65
        Width = 95
        Height = 22
        Caption = 'Confirmar'
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
        TabOrder = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnConfirmarCompromissoClick
      end
      object btnLimparCompromisso: TcxButton
        Left = 914
        Top = 65
        Width = 95
        Height = 22
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
        TabOrder = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnLimparCompromissoClick
      end
    end
  end
end
