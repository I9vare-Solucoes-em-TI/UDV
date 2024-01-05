inherited frmCadastroRapidoTransfProvisao: TfrmCadastroRapidoTransfProvisao
  ClientHeight = 182
  ClientWidth = 715
  KeyPreview = True
  OnActivate = FormActivate
  ExplicitWidth = 721
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 715
    TabOrder = 1
    ExplicitWidth = 715
    inherited lblInformaca: TcxLabel
      Caption = 'Transfer'#234'ncia de Provisao'
      Style.IsFontAssigned = True
      ExplicitWidth = 422
      Width = 422
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 457
      Width = 258
      ExplicitLeft = 457
      ExplicitWidth = 258
      inherited btnCancelar: TcxButton
        Left = 44
        LookAndFeel.SkinName = ''
        ExplicitLeft = 44
      end
      inherited btnConfirmar: TcxButton
        Left = 146
        Top = 9
        LookAndFeel.SkinName = ''
        ExplicitLeft = 146
        ExplicitTop = 9
      end
    end
  end
  inherited Panel1: TPanel
    Width = 715
    Height = 144
    TabOrder = 0
    ExplicitWidth = 715
    ExplicitHeight = 144
    object tabBalancete: TcxTabControl
      Left = 2
      Top = 2
      Width = 711
      Height = 140
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        '')
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'iMaginary'
      OnChange = tabBalanceteChange
      ClientRectBottom = 139
      ClientRectLeft = 1
      ClientRectRight = 710
      ClientRectTop = 21
      object cxLabel4: TcxLabel
        Left = 20
        Top = 24
        Caption = 'Motivo da Transferencia de Provis'#227'o'
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
        Left = 468
        Top = 25
        Caption = 'Valor'
        ParentColor = False
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
      object lblDataDespesa: TcxLabel
        Left = 583
        Top = 25
        Caption = 'Data da Transfer'#234'ncia'
        ParentColor = False
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Transparent = True
      end
      object edtHistorico: TcxTextEdit
        Left = 18
        Top = 42
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 446
      end
      object edtValor: TcxCurrencyEdit
        Left = 468
        Top = 42
        ParentFont = False
        Properties.DisplayFormat = 'R$ ,0.00;'
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 4
        Width = 111
      end
      object edtDataLancamento: TcxDateEdit
        Left = 583
        Top = 42
        ParentFont = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 111
      end
      object cxGroupBox1: TcxGroupBox
        Left = 11
        Top = 69
        Caption = 'Provis'#227'o'
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = 4210688
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Height = 63
        Width = 692
        object cxLabel2: TcxLabel
          Left = 9
          Top = 18
          Caption = 'Origem'
          ParentColor = False
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
          Left = 348
          Top = 19
          Caption = 'Destino'
          ParentColor = False
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
        object lcxProvisaoOrigem: TcxLookupComboBox
          Left = 7
          Top = 35
          RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 2
          Width = 335
        end
        object lcxProvisaoDestino: TcxLookupComboBox
          Left = 348
          Top = 35
          RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 3
          Width = 335
        end
      end
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    Left = 340
    Top = 83
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 372
    Top = 83
  end
  inherited ClientAncestral: TClientDataSet
    Left = 406
    Top = 83
  end
  inherited SourceAncestral: TDataSource
    Left = 436
    Top = 83
  end
  object dtsPlanoContas: TDataSource
    DataSet = sqlPlanoContas
    Left = 224
    Top = 125
  end
  object sqlPlanoContas: TSimpleDataSet
    Aggregates = <>
    AutoCalcFields = False
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.CONTABIL_GRUPO_ID'#13 +
      #10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON' +
      #13#10'  CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUAC' +
      'AO = '#39'A'#39#13#10'  AND CC.BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'  A' +
      'ND CG.OPERACAO = '#39'7'#39#13#10'ORDER BY CC.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 224
    Top = 79
    object sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 15
      Size = 2
    end
  end
end
