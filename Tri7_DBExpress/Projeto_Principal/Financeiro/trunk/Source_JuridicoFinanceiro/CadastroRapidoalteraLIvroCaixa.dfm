inherited frmCadastroRapidoAlteraLivroCaixa: TfrmCadastroRapidoAlteraLivroCaixa
  ClientHeight = 322
  ClientWidth = 634
  OnActivate = FormActivate
  ExplicitWidth = 640
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 634
    ExplicitWidth = 634
    inherited lblInformaca: TcxLabel
      Caption = ' Altera'#231#227'o de Dados do Lan'#231'amento'
      Style.IsFontAssigned = True
      ExplicitWidth = 339
      Width = 339
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 374
      ExplicitLeft = 374
      inherited btnCancelar: TcxButton
        LookAndFeel.SkinName = ''
      end
      inherited btnConfirmar: TcxButton
        LookAndFeel.SkinName = ''
      end
    end
  end
  inherited Panel1: TPanel
    Width = 634
    Height = 284
    ExplicitWidth = 634
    ExplicitHeight = 284
    object tabBalancete: TcxTabControl
      Left = 2
      Top = 2
      Width = 630
      Height = 280
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
      ClientRectBottom = 279
      ClientRectLeft = 1
      ClientRectRight = 629
      ClientRectTop = 21
      object cxLabel3: TcxLabel
        Left = 17
        Top = 70
        Caption = 'Grupo do Compromisso'
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
      object cxLabel5: TcxLabel
        Left = 268
        Top = 70
        Caption = 'Compromisso'
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
      object cxLabel4: TcxLabel
        Left = 17
        Top = 113
        Caption = 'Hist'#243'rico'
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
      object cxLabel15: TcxLabel
        Left = 17
        Top = 156
        Caption = 'Documento (Cupom, NF...)'
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
      object cxLabel7: TcxLabel
        Left = 268
        Top = 156
        Caption = 'Detalhe'
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
      object lblCliente: TcxLabel
        Left = 17
        Top = 29
        Caption = 'Favorecido (Pagar pra quem?)'
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
      object lcxCliente: TcxDBLookupComboBox
        Left = 17
        Top = 47
        RepositoryItem = dtmLookupContabil.Lista_PessoaTodas
        DataBinding.DataField = 'PESSOA_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.GridMode = True
        Properties.ListColumns = <>
        Properties.ListOptions.ShowHeader = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        Width = 501
      end
      object chbTrocarSenha: TcxDBCheckBox
        Left = 525
        Top = 46
        AutoSize = False
        Caption = 'IR'
        DataBinding.DataField = 'IR'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextColor = 4210688
        Style.IsFontAssigned = True
        TabOrder = 7
        Transparent = True
        Height = 21
        Width = 42
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 567
        Top = 46
        AutoSize = False
        Caption = 'CNJ'
        DataBinding.DataField = 'CNJ'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextColor = 4210688
        Style.IsFontAssigned = True
        TabOrder = 8
        Transparent = True
        Height = 21
        Width = 47
      end
      object lcxGrupoContabil: TcxDBLookupComboBox
        Left = 17
        Top = 88
        DataBinding.DataField = 'CONTABIL_GRUPO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.GridMode = True
        Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsGrupoContabil
        Properties.OnEditValueChanged = lcxGrupoContabilPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 9
        Width = 246
      end
      object lcxCompromisso: TcxDBLookupComboBox
        Left = 268
        Top = 88
        DataBinding.DataField = 'CONTABIL_CONTA_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.GridMode = True
        Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsPlanoContas
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 343
      end
      object edtHistorico: TcxDBTextEdit
        Left = 17
        Top = 130
        DataBinding.DataField = 'HISTORICO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 11
        Width = 594
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 17
        Top = 174
        DataBinding.DataField = 'DOCUMENTO_NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 12
        Width = 246
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 268
        Top = 174
        DataBinding.DataField = 'OBSERVACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 13
        Width = 343
      end
      object cxGroupBox1: TcxGroupBox
        Left = 7
        Top = 201
        Caption = 'Dados Monet'#225'rios'
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
        TabOrder = 14
        Height = 63
        Width = 607
        object cxLabel8: TcxLabel
          Left = 232
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
        object lblDataDespesa: TcxLabel
          Left = 123
          Top = 16
          Caption = 'Data de Lan'#231'amento'
          ParentColor = False
          Style.TextColor = 4210688
          Style.TextStyle = [fsUnderline]
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 376
          Top = 16
          Caption = 'Conta de Lan'#231'amento'
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
        object cxLabel1: TcxLabel
          Left = 8
          Top = 16
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
        object edtValor: TcxDBCurrencyEdit
          Left = 8
          Top = 34
          DataBinding.DataField = 'VALOR'
          DataBinding.DataSource = SourceAncestral
          TabOrder = 4
          Width = 109
        end
        object edtDataLancamento: TcxDBDateEdit
          Left = 123
          Top = 34
          DataBinding.DataField = 'DATA_PAGAMENTO'
          DataBinding.DataSource = SourceAncestral
          TabOrder = 5
          Width = 103
        end
        object icxEspecie: TcxDBImageComboBox
          Left = 232
          Top = 34
          RepositoryItem = dtmLookupContabil.ComboEspeciePagamento
          DataBinding.DataField = 'ESPECIE'
          DataBinding.DataSource = SourceAncestral
          Properties.Items = <>
          TabOrder = 6
          Width = 138
        end
        object lcxConta: TcxDBLookupComboBox
          Left = 376
          Top = 34
          RepositoryItem = dtmLookupContabil.Lista_CaixaTodos
          DataBinding.DataField = 'CAIXA_ID'
          DataBinding.DataSource = SourceAncestral
          Properties.ListColumns = <>
          TabOrder = 7
          Width = 225
        end
      end
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT LIVRO_CAIXA_ID, HISTORICO, ESPECIE, '#13#10'   OBSERVACAO, ANO_' +
      'MES_REGISTRO,'#13#10'   VALOR, DATA_PAGAMENTO, '#13#10'   CONTABIL_CONTA_ID,' +
      ' REFERENCIA, CAIXA_ID, IR, CNJ,'#13#10'   DOCUMENTO_NUMERO,'#13#10'   PESSOA' +
      '_ID, CONTABIL_GRUPO_ID, OPERACAO, BALANCETE_GRUPO_ID,'#13#10'   LIVRO_' +
      'FINANCEIRO_ID'#13#10'FROM J_LIVRO_CAIXA'#13#10'WHERE LIVRO_CAIXA_ID = :LIVRO' +
      '_CAIXA_ID')
    Params = <
      item
        DataType = ftBCD
        Name = 'LIVRO_CAIXA_ID'
        ParamType = ptInput
      end>
    Left = 455
    Top = 221
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 487
    Top = 221
  end
  inherited ClientAncestral: TClientDataSet
    Left = 519
    Top = 221
    object ClientAncestralLIVRO_CAIXA_ID: TBCDField
      FieldName = 'LIVRO_CAIXA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object ClientAncestralESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object ClientAncestralVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object ClientAncestralCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object ClientAncestralCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralANO_MES_REGISTRO: TStringField
      FieldName = 'ANO_MES_REGISTRO'
      Size = 10
    end
    object ClientAncestralIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object ClientAncestralCNJ: TStringField
      FieldName = 'CNJ'
      Size = 1
    end
    object ClientAncestralDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object ClientAncestralCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralLIVRO_FINANCEIRO_ID: TBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 555
    Top = 221
  end
  object sqlPlanoContas: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.IR, CC.CNJ'#13#10'FROM J' +
      '_CONTABIL_CONTA CC LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON'#13#10'  CC.' +
      'CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUACAO = '#39'A' +
      #39#13#10'  AND CC.CONTABIL_GRUPO_ID = :CONTABIL_GRUPO_ID'#13#10'ORDER BY CC.' +
      'DESCRICAO')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTABIL_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 360
    Top = 22
    object sqlPlanoContasCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlPlanoContasCNJ: TStringField
      FieldName = 'CNJ'
      Size = 1
    end
  end
  object dtsPlanoContas: TDataSource
    DataSet = sqlPlanoContas
    Left = 360
    Top = 52
  end
  object sqlGrupoContabil: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = :TIPO'#13#10'  ' +
      '  AND BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DESCRIC' +
      'AO')
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 316
    Top = 21
    object sqlGrupoContabilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoContabil: TDataSource
    DataSet = sqlGrupoContabil
    Left = 316
    Top = 53
  end
end
