object FmeRemuneracao: TFmeRemuneracao
  Left = 0
  Top = 0
  Width = 741
  Height = 327
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object pnlDadosRemuneracao: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 128
    Align = alTop
    TabOrder = 0
    object cxLabel5: TcxLabel
      Left = 18
      Top = 17
      Caption = 'Tipo da Remunera'#231#227'o'
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
      Left = 324
      Top = 16
      Caption = 'Realizar Pagamento?'
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
    object icxTipoRenumeracao: TcxDBImageComboBox
      Left = 20
      Top = 34
      RepositoryItem = dtmLookupJuridico.ComboRenumeracaoTipo
      DataBinding.DataField = 'TIPO_REMUNERACAO'
      DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
      ParentFont = False
      Properties.Items = <>
      Properties.OnChange = icxTipoRenumeracaoPropertiesChange
      Properties.OnEditValueChanged = icxTipoRenumeracaoPropertiesEditValueChanged
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 2
      Width = 298
    end
    object rdbPagamentoIndependente: TcxRadioButton
      Left = 324
      Top = 36
      Width = 201
      Height = 17
      Caption = 'Independente da Quita'#231#227'o do Cliente'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = rdbPagamentoIndependenteClick
    end
    object rdbPagamentoQuitacao: TcxRadioButton
      Left = 533
      Top = 36
      Width = 140
      Height = 17
      Caption = 'Ap'#243's Quita'#231#227'o do Cliente'
      TabOrder = 4
      OnClick = rdbPagamentoQuitacaoClick
    end
    object cxGroupBox1: TcxGroupBox
      Left = 14
      Top = 59
      Caption = 'Preencha os Dados da Remunera'#231#227'o do Respons'#225'vel'
      Style.BorderStyle = ebs3D
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = 4210688
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Height = 64
      Width = 710
      object cxLabel10: TcxLabel
        Left = 111
        Top = 17
        Caption = '% e Valor a Remunerar              '
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
        Left = 7
        Top = 17
        Caption = 'Valor Item Contrato'
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
        Left = 400
        Top = 17
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
      object cxLabel9: TcxLabel
        Left = 579
        Top = 17
        Caption = 'Data Prevista'
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
      object cxLabel1: TcxLabel
        Left = 276
        Top = 17
        Caption = 'Valor j'#225' Remunerado'
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
      object edtValorTotalCliente: TcxDBCurrencyEdit
        Left = 7
        Top = 34
        DataBinding.DataField = 'VALOR_DOCUMENTO'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        Enabled = False
        ParentColor = True
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 101
      end
      object edtPercentual: TcxDBCurrencyEdit
        Left = 112
        Top = 34
        DataBinding.DataField = 'PERCENTUAL'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        ParentFont = False
        Properties.DisplayFormat = '% ,0.00;'
        Properties.OnEditValueChanged = edtPercentualPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        OnExit = edtPercentualExit
        Width = 57
      end
      object edtValorMoeda: TcxDBCurrencyEdit
        Left = 173
        Top = 34
        DataBinding.DataField = 'VALOR_PROLABORE'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        ParentFont = False
        Properties.OnChange = edtValorMoedaPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        OnExit = edtValorMoedaExit
        Width = 100
      end
      object edtValorRepassado: TcxDBCurrencyEdit
        Left = 277
        Top = 34
        DataBinding.DataField = 'VALOR_PAGO'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        Enabled = False
        ParentColor = True
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 117
      end
      object edtQtd: TcxDBSpinEdit
        Left = 399
        Top = 34
        DataBinding.DataField = 'QTD'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        Enabled = False
        ParentFont = False
        Properties.MinValue = 1.000000000000000000
        Properties.OnEditValueChanged = edtQtdPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 9
        OnExit = edtValorMoedaExit
        Width = 73
      end
      object edtValorParcela: TcxDBCurrencyEdit
        Left = 478
        Top = 34
        DataBinding.DataField = 'VALOR_PARCELA'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 97
      end
      object edtDataPrevista: TcxDBDateEdit
        Left = 579
        Top = 34
        DataBinding.DataField = 'DATA_PREVISTA'
        DataBinding.DataSource = dtmLookupServico.dtsRemuneracao
        ParentFont = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 11
        Width = 113
      end
    end
    object btnRemuneracaoConfirmar: TcxButton
      Left = 679
      Top = 41
      Width = 28
      Height = 23
      Cursor = crHandPoint
      Hint = 'Registrar Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = btnRemuneracaoConfirmarClick
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
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
    end
    object lblInformacao: TcxLabel
      Left = 18
      Top = -1
      Caption = 
        'J'#225' existe pagamento(s) realizado(s) neste item. Altera'#231#227'o n'#227'o pe' +
        'rmitida!!!'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clRed
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
      Transparent = True
      Visible = False
    end
    object lblDataContrato: TcxLabel
      Left = 549
      Top = 0
      Caption = 'Data Contrato: 00/00/2014'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = 4210688
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
      Transparent = True
    end
  end
  object pgcParcelas: TcxPageControl
    Left = 0
    Top = 128
    Width = 741
    Height = 199
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabParcelas
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    ClientRectBottom = 195
    ClientRectLeft = 4
    ClientRectRight = 737
    ClientRectTop = 4
    object tabParcelas: TcxTabSheet
      Caption = 'tabParcelas'
      ImageIndex = 0
      object cbxParcelas: TcxGroupBox
        Left = 3
        Top = 13
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
        Height = 173
        Width = 726
        object gridParcelas: TDBCtrlGrid
          Left = 2
          Top = 35
          Width = 722
          Height = 136
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          DataSource = dtmLookupServico.dtsParcelas
          PanelBorder = gbNone
          PanelHeight = 22
          PanelWidth = 705
          TabOrder = 0
          RowCount = 6
          object edtParcelaDataVencimento: TcxDBDateEdit
            Left = 12
            Top = 3
            DataBinding.DataField = 'DATA_VENCIMENTO'
            DataBinding.DataSource = dtmLookupServico.dtsParcelas
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = edtParcelaDataVencimentoPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 101
          end
          object edtParcelaSituacao: TcxDBImageComboBox
            Left = 282
            Top = 3
            RepositoryItem = dtmLookupContabil.Combo_SituacaoPagamento
            DataBinding.DataField = 'SITUACAO'
            DataBinding.DataSource = dtmLookupServico.dtsParcelas
            Enabled = False
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 413
          end
          object edtParcelaValor: TcxDBCurrencyEdit
            Left = 117
            Top = 3
            DataBinding.DataField = 'VALOR_PARCELA'
            DataBinding.DataSource = dtmLookupServico.dtsParcelas
            ParentFont = False
            Properties.OnChange = edtParcelaValorPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 2
            Width = 161
          end
        end
        object HeaderControl1: THeaderControl
          Left = 2
          Top = 18
          Width = 722
          Height = 17
          Sections = <
            item
              ImageIndex = -1
              Text = '    Data Prevista'
              Width = 120
            end
            item
              ImageIndex = -1
              Text = 'Valor Parcela'
              Width = 165
            end
            item
              ImageIndex = -1
              Text = 'Situa'#231#227'o'
              Width = 351
            end>
        end
        object edtTotalParcelas: TcxCurrencyEdit
          Left = 340
          Top = 9
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.Color = clWindow
          StyleDisabled.TextColor = 16384
          TabOrder = 3
          Width = 97
        end
        object edtRestante: TcxCurrencyEdit
          Left = 447
          Top = 9
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.Color = clWindow
          StyleDisabled.TextColor = clRed
          TabOrder = 2
          Width = 97
        end
      end
      object imgSituacaoEdicao: TcxImage
        Left = 198
        Top = 5
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
        TabOrder = 1
        Transparent = True
        Height = 24
        Width = 32
      end
      object btnAdicionarParcela: TcxButton
        Left = 242
        Top = 6
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
        TabOrder = 2
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
      object btnExcluirParcela: TcxButton
        Left = 272
        Top = 6
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
        TabOrder = 3
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
      object btnDuplicarParcela: TcxButton
        Left = 302
        Top = 6
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
        TabOrder = 4
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
      object lblRestante: TcxLabel
        Left = 348
        Top = -1
        Caption = 'Total Parcelas            Restante '#224' Definir da Remunera'#231#227'o'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        StyleDisabled.TextStyle = [fsUnderline]
        Transparent = True
      end
    end
    object tabVazio: TcxTabSheet
      Caption = 'tabVazio'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
