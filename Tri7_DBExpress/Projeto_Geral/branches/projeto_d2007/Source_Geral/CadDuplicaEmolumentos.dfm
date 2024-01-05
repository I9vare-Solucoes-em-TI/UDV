inherited frmCadDuplicaEmolumento: TfrmCadDuplicaEmolumento
  Left = 194
  Top = 329
  Caption = 'Duplicar Per'#237'odos de Emolumentos'
  ClientHeight = 368
  ClientWidth = 407
  Color = clWindow
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 413
  ExplicitHeight = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 407
    Height = 368
    ExplicitWidth = 407
    ExplicitHeight = 368
    inherited Shape1: TShape
      Width = 395
      Height = 356
      ExplicitLeft = 3
      ExplicitWidth = 395
      ExplicitHeight = 354
    end
    inherited btnCancelar: TcxButton
      Left = 275
      Top = 322
      LookAndFeel.SkinName = ''
      ExplicitLeft = 275
      ExplicitTop = 322
    end
    object AdvSmoothProgressBar1: TAdvSmoothProgressBar
      Left = 20
      Top = 299
      Width = 361
      Height = 17
      Step = 10.000000000000000000
      Maximum = 100.000000000000000000
      Appearance.BackGroundFill.Color = clWhite
      Appearance.BackGroundFill.ColorTo = 6050636
      Appearance.BackGroundFill.ColorMirror = clNone
      Appearance.BackGroundFill.ColorMirrorTo = clNone
      Appearance.BackGroundFill.BackGroundPictureLeft = 0
      Appearance.BackGroundFill.BackGroundPictureTop = 0
      Appearance.BackGroundFill.PictureLeft = 0
      Appearance.BackGroundFill.PictureTop = 0
      Appearance.BackGroundFill.BorderColor = clSilver
      Appearance.BackGroundFill.Rounding = 0
      Appearance.BackGroundFill.RoundingType = rtNone
      Appearance.BackGroundFill.ShadowColor = clWhite
      Appearance.BackGroundFill.ShadowOffset = 0
      Appearance.BackGroundFill.Angle = 0
      Appearance.ProgressFill.Color = 16382200
      Appearance.ProgressFill.ColorTo = 15000287
      Appearance.ProgressFill.ColorMirror = 13749191
      Appearance.ProgressFill.ColorMirrorTo = 14868187
      Appearance.ProgressFill.GradientMirrorType = gtVertical
      Appearance.ProgressFill.BackGroundPictureLeft = 0
      Appearance.ProgressFill.BackGroundPictureTop = 0
      Appearance.ProgressFill.PictureLeft = 0
      Appearance.ProgressFill.PictureTop = 0
      Appearance.ProgressFill.BorderColor = clBlack
      Appearance.ProgressFill.Rounding = 0
      Appearance.ProgressFill.ShadowOffset = 0
      Appearance.ProgressFill.Angle = 0
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -11
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = []
      Appearance.ProgressFont.Charset = DEFAULT_CHARSET
      Appearance.ProgressFont.Color = clWindowText
      Appearance.ProgressFont.Height = -11
      Appearance.ProgressFont.Name = 'Tahoma'
      Appearance.ProgressFont.Style = []
      Appearance.ValueFormat = '%.0f%%'
      Version = '1.0.1.1'
    end
    object gbxPeriodos: TcxGroupBox
      Left = 20
      Top = 12
      Caption = 'Selecione os Per'#237'odos'
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 2
      Height = 141
      Width = 361
      object Label1: TLabel
        Left = 8
        Top = 65
        Width = 80
        Height = 13
        Caption = 'Per'#237'odo Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 19
        Width = 77
        Height = 13
        Caption = 'Per'#237'odo Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblAviso: TcxLabel
        Left = 8
        Top = 98
        Caption = 'msg'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.LineOptions.InnerColor = clRed
        Properties.LineOptions.OuterColor = clRed
        Transparent = True
        Visible = False
      end
      object lcxPeriodoOrigem: TcxLookupComboBox
        Left = 8
        Top = 34
        RepositoryItem = dtmLookup.ListaG_Emolumento_Periodo
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        OnExit = lcxPeriodoOrigemExit
        Width = 313
      end
      object lcxPeriodoDestino: TcxLookupComboBox
        Left = 8
        Top = 81
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'EMOLUMENTO_PERIODO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsG_Emolumento_Periodo
        Properties.OnChange = lcxPeriodoDestinoPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 313
      end
      object btnAdicionarEmolumentoPeriodo: TcxButton
        Left = 323
        Top = 80
        Width = 25
        Height = 22
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnAdicionarEmolumentoPeriodoClick
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
    end
    object gbxOpcoes: TcxGroupBox
      Left = 20
      Top = 159
      Caption = 'Op'#231#245'es Adicionais'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.StyleController = dtmControles.cxEditStyleGroup
      Style.IsFontAssigned = True
      TabOrder = 3
      Height = 132
      Width = 361
      object chxAltTxJudTitulos: TcxCheckBox
        Left = 4
        Top = 19
        Cursor = crHandPoint
        Caption = 
          'Alterar Tx. Judici'#225'ria de T'#237'tulos ------------------------------' +
          '----------'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 0
        OnClick = chxAltTxJudTitulosClick
        Width = 292
      end
      object chxAltTxJudCertidoes: TcxCheckBox
        Left = 4
        Top = 46
        Cursor = crHandPoint
        Caption = 
          'Alterar Tx. Judici'#225'ria de Certid'#245'es ----------------------------' +
          '---------'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 2
        OnClick = chxAltTxJudCertidoesClick
        Width = 292
      end
      object chxAumentEmolTitulos: TcxCheckBox
        Left = 4
        Top = 73
        Cursor = crHandPoint
        Caption = 'Acrescentar aumento % de Emolumentos de T'#237'tulos -------'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 4
        OnClick = chxAumentEmolTitulosClick
        Width = 292
      end
      object chxAumentEmolCertidoes: TcxCheckBox
        Left = 4
        Top = 100
        Cursor = crHandPoint
        Caption = 'Acrescentar aumento % de Emolumentos de Certid'#245'es ------------'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 6
        OnClick = chxAumentEmolCertidoesClick
        Width = 292
      end
      object cxTextEdit1: TcxTextEdit
        Left = 341
        Top = 73
        TabStop = False
        Enabled = False
        Properties.ReadOnly = True
        TabOrder = 8
        Text = '%'
        Width = 15
      end
      object cxTextEdit2: TcxTextEdit
        Left = 341
        Top = 100
        TabStop = False
        Enabled = False
        Properties.ReadOnly = True
        TabOrder = 9
        Text = '%'
        Width = 15
      end
      object edtAltTxJudTitulos: TcxCurrencyEdit
        Left = 299
        Top = 19
        Enabled = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 1
        Width = 57
      end
      object edtAltTxJudCertidoes: TcxCurrencyEdit
        Left = 299
        Top = 46
        Enabled = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 3
        Width = 57
      end
      object edtAumentEmolTitulos: TcxCurrencyEdit
        Left = 299
        Top = 73
        Enabled = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 5
        Width = 42
      end
      object edtAumentCert: TcxCurrencyEdit
        Left = 299
        Top = 100
        Enabled = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 7
        Width = 42
      end
    end
    object btnConfirmarItem: TcxButton
      Left = 174
      Top = 322
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
      TabOrder = 4
      OnClick = btnConfirmarItemClick
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
  end
  inherited DataSetAncestral: TI9Query
    Left = 291
    Top = 119
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 323
    Top = 119
  end
  inherited ClientAncestral: TClientDataSet
    Left = 291
  end
  inherited SourceAncestral: TDataSource
    Left = 291
    Top = 55
  end
  object sqlG_Emolumento_Periodo: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT * FROM G_EMOLUMENTO_PERIODO'#13#10'WHERE EMOLUMENTO_PERIODO_ID ' +
      '<> :EMOLUMENTO_PERIODO_ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EMOLUMENTO_PERIODO_ID'
        ParamType = ptInput
      end>
    Params = <
      item
        DataType = ftFloat
        Name = 'EMOLUMENTO_PERIODO_ID'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end>
    Left = 264
    Top = 65531
    object sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TBCDField
      FieldName = 'EMOLUMENTO_PERIODO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Emolumento_PeriodoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Emolumento_PeriodoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_Emolumento_Periodo: TDataSource
    DataSet = sqlG_Emolumento_Periodo
    Left = 236
    Top = 65531
  end
end
