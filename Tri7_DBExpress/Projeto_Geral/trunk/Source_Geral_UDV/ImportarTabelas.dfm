inherited frmImportarTabelas: TfrmImportarTabelas
  Left = 146
  Top = 165
  Caption = 'Importar Tabelas'
  ClientHeight = 366
  ClientWidth = 391
  Color = clWindow
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 397
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 391
    Height = 366
    ExplicitWidth = 391
    ExplicitHeight = 366
    inherited Shape1: TShape
      Width = 379
      Height = 354
      ExplicitLeft = 8
      ExplicitWidth = 379
      ExplicitHeight = 354
    end
    inherited btnCancelar: TcxButton
      Left = 264
      Top = 323
      TabOrder = 1
      LookAndFeel.SkinName = ''
      ExplicitLeft = 264
      ExplicitTop = 323
    end
    object gbxTabelas: TcxGroupBox
      Left = 20
      Top = 13
      Caption = ' Selecione as Tabelas '
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 0
      Height = 132
      Width = 341
      object Label1: TLabel
        Left = 8
        Top = 73
        Width = 75
        Height = 13
        Caption = 'Tabela Destino:'
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
        Width = 72
        Height = 13
        Caption = 'Tabela Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblAviso: TcxLabel
        Left = 8
        Top = 104
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
      object lcxTabelaDestino: TcxLookupComboBox
        Left = 8
        Top = 86
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'EMOLUMENTO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsG_Emolumento_Periodo
        Properties.OnChange = lcxPeriodoDestinoPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        OnExit = lcxTabelaDestinoExit
        Width = 313
      end
      object lcxTabelaOrigem: TcxLookupComboBox
        Left = 8
        Top = 33
        RepositoryItem = dtmLookup.listaG_Emolumento
        ParentFont = False
        Properties.ListColumns = <>
        Properties.OnChange = lcxTabelaOrigemPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        OnExit = lcxTabelaOrigemExit
        Width = 313
      end
      object lblAvisoVazio: TcxLabel
        Left = 293
        Top = 51
        Caption = 'msg'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Properties.LineOptions.InnerColor = clRed
        Properties.LineOptions.OuterColor = clRed
        Transparent = True
        Visible = False
        AnchorX = 321
      end
    end
    object AdvSmoothProgressBar1: TAdvSmoothProgressBar
      Left = 20
      Top = 293
      Width = 341
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
      Appearance.ValueFormat = '%.de%%'
      Version = '1.0.1.1'
    end
    object gbxOpcoes: TcxGroupBox
      Left = 20
      Top = 160
      Caption = ' Op'#231#245'es para Alterar Valor de Emolumento '
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 3
      Height = 122
      Width = 341
      object rdbAlterar1_2: TcxRadioButton
        Left = 8
        Top = 44
        Width = 201
        Height = 17
        Caption = 'Alterar Valor de Emolumento para 1/2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rdbAlterar1_4: TcxRadioButton
        Left = 8
        Top = 67
        Width = 201
        Height = 17
        Caption = 'Alterar Valor de Emolumento para 1/4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object rdbAlterar2x: TcxRadioButton
        Left = 8
        Top = 90
        Width = 201
        Height = 17
        Caption = 'Alterar Valor de Emolumento para 2x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object rdbNaoAlterar: TcxRadioButton
        Left = 8
        Top = 21
        Width = 201
        Height = 17
        Caption = 'N'#227'o Alterar'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = True
      end
    end
    object btnConfirmarItem: TcxButton
      Left = 163
      Top = 323
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
      'SELECT * FROM G_EMOLUMENTO'#13#10'WHERE EMOLUMENTO_ID <> :EMOLUMENTO_I' +
      'D')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EMOLUMENTO_PERIODO_ID'
        ParamType = ptInput
        Value = 0.000000000000000000
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
    object sqlG_Emolumento_PeriodoEMOLUMENTO_ID: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlG_Emolumento_PeriodoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsG_Emolumento_Periodo: TDataSource
    DataSet = sqlG_Emolumento_Periodo
    Left = 236
    Top = 65531
  end
end
