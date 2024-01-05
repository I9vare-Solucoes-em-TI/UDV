object fmeCompromisso: TfmeCompromisso
  Left = 0
  Top = 0
  Width = 1022
  Height = 106
  Color = 14872024
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object tabBalancete: TcxTabControl
    Left = 0
    Top = 0
    Width = 1022
    Height = 106
    Align = alClient
    Color = 14872024
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
    ClientRectBottom = 105
    ClientRectLeft = 1
    ClientRectRight = 1021
    ClientRectTop = 21
    object Panel1: TPanel
      Left = 1
      Top = 21
      Width = 1020
      Height = 84
      Align = alClient
      BevelOuter = bvNone
      Color = 14872024
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 1012
      ExplicitHeight = 72
      object cxLabel7: TcxLabel
        Left = 7
        Top = 5
        Caption = 'Compromisso:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 7
        Top = 47
        Caption = 'Per'#237'odo:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 196
        Top = 47
        Caption = 'M'#234's/Ano Inicial:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 690
        Top = 7
        Caption = 'Valor:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Style.TextStyle = []
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 425
        Top = 6
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = clNavy
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 382
        Top = 47
        Caption = 'M'#234's/Ano Final:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 382
        Top = 5
        Caption = 'Centro de Custo:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 578
        Top = 47
        Caption = 'Dia do M'#234's:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 826
        Top = 7
        Caption = 'Esp'#233'cie:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Style.TextStyle = []
        Transparent = True
      end
      object lcxCompromisso: TcxLookupComboBox
        Left = 78
        Top = 4
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 9
        Width = 299
      end
      object lcxCentroCusto: TcxLookupComboBox
        Left = 468
        Top = 4
        RepositoryItem = dtmLookupContabil.Lista_CentroCustoAtivo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 10
        Width = 215
      end
      object edtValor: TcxCurrencyEdit
        Left = 722
        Top = 6
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 11
        Width = 97
      end
      object icxEspecie: TcxImageComboBox
        Left = 870
        Top = 7
        RepositoryItem = dtmLookupContabil.ComboEspeciePagamento
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 12
        Width = 116
      end
      object icxPeriodo: TcxImageComboBox
        Left = 78
        Top = 45
        ParentFont = False
        Properties.Items = <>
        Properties.OnEditValueChanged = icxPeriodoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 13
        Width = 112
      end
      object cbxMesAnoInicial: TcxComboBox
        Left = 277
        Top = 45
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnEditValueChanged = cbxMesAnoInicialPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 14
        Width = 100
      end
      object cbxMesAnoFinal: TcxComboBox
        Left = 467
        Top = 45
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 15
        Width = 100
      end
      object edtDia: TcxSpinEdit
        Left = 640
        Top = 45
        ParentFont = False
        Properties.MaxValue = 31.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 16
        Value = 1
        Width = 43
      end
      object btnConfirmarCompromisso: TcxButton
        Left = 690
        Top = 42
        Width = 106
        Height = 25
        Caption = 'Confirmar'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2007Black'
        OptionsImage.Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF0000990000009500000093000000910000008F0000008C0000008A
          00000088000000860000008400000083000000810000007A0000007500000072
          000000700000006C00000066000000630000005D00000059000000520000004F
          000000490000003B0000019A0200029B0300028B020002880200028202000273
          02000259020002480200029B0500039C060003520500056D070009890D000546
          0700049D0900069F0B0007A00E000C9612000AA314000BA416000C89130016AC
          20000DA61B000EA71D000C5E140013761D0010A9200014AD2700149C230020AB
          30001FA22E0025B93700158A260029C23D0017B02E0019B031002EC7460031C9
          490035CE4F001BB4360017992E001DB63A00207D300036CD52002078300032B7
          4B0024823600157F2A0022B3430025BE4A002D91430046DF69004AE26E0026B9
          4D0021A142004DE573004ADC6E0039A955004FE7750052EA7A004FE2760041BD
          620040B6600048C96C0046C2690053E07C0052D77A0061F69200FFFFFF000000
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
          1B1B1B1B02020202020202020202021B5A5E4A521B0202020202020202021B5A
          5E46384D1B02020202020202021B5A5E461F2B3F511B0202020202021B5A5E46
          2109032F454B1B020202021B5A5E4822110E061D364C1B0202021B4E5D482317
          14100B042A3E3C1B02021B4E583D271916130F0A032E431B0202021B4E573B26
          1815281E071C33441B0202021B5C563A1A3542310C0525371B020202021B5549
          342954412D0A032C381B020202021B1B1B1B4A5340200803321B020202020202
          02021B5B50390D06241B0202020202020202021B5F4F300A0F1B020202020202
          020202021B5947121B0202020202020202020202021B1B1B0202}
        TabOrder = 17
        OnClick = btnConfirmarCompromissoClick
      end
      object btnLimparCompromisso: TcxButton
        Left = 802
        Top = 42
        Width = 106
        Height = 25
        Caption = 'Limpar'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2007Black'
        OptionsImage.Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00AC460000EE6C0000FD790000FF7F0000FF800000FA7D0000FF85
          0000FB810000FB820000FF8C0000FE870000FD870000FF8F0000F5961D00FFA1
          2600E2993D00FF940000FFA01A00EC9E2F00FF9B0200FF9F0C00FFA00C00FFA5
          1500FFA51600FFA71600FFA81900FFA81B00FFAB1F00FFAE2900FFAF1E00FFAC
          2000FFAD2200FFAE2300FFB12300FFAE2400FFB32C00FFB22F00FFB53300FFB7
          3800FDC45C00FFBC4000FFC44B00FFCA5900FED47C00FFD98300000000000000
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
          0000000000000000000000000000000000000000000000000000020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          020202020202020202020203030303030303030303030303030203152624201B
          1716130F0D0907050403032A2623211D191816130F0E0B080503032E2B25221E
          1D1A1716130C0E0A060303122F2D2C2B2B2928271F1C14111003020303030303
          0303030303030303030202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202}
        TabOrder = 18
        OnClick = btnLimparCompromissoClick
      end
      object cxLabel6: TcxLabel
        Left = 7
        Top = 25
        Caption = 
          'Ocorr'#234'ncia                                                      ' +
          '                                                                ' +
          '                                                                ' +
          '                      '
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
    end
  end
end
