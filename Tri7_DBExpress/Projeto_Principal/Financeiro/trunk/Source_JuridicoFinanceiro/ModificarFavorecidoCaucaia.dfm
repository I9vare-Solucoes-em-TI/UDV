inherited frmModificarFavorecidoCaucaia: TfrmModificarFavorecidoCaucaia
  ClientHeight = 164
  ClientWidth = 566
  KeyPreview = True
  OnActivate = FormActivate
  ExplicitWidth = 572
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 566
    TabOrder = 1
    ExplicitWidth = 566
    inherited lblInformaca: TcxLabel
      Caption = 'Modificar Favorecido'
      Style.IsFontAssigned = True
      ExplicitWidth = 317
      Width = 317
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 352
      Width = 214
      ExplicitLeft = 352
      ExplicitWidth = 214
      inherited btnCancelar: TcxButton
        Left = 7
        Top = 10
        LookAndFeel.SkinName = ''
        ExplicitLeft = 7
        ExplicitTop = 10
      end
      inherited btnConfirmar: TcxButton
        Left = 108
        LookAndFeel.SkinName = ''
        ExplicitLeft = 108
      end
    end
  end
  inherited Panel1: TPanel
    Width = 566
    Height = 126
    TabOrder = 0
    ExplicitWidth = 566
    ExplicitHeight = 126
    object lblCliente: TcxLabel
      Left = 11
      Top = 23
      Caption = 'Favorecido Atual'
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
      Left = 11
      Top = 70
      Caption = 'Favorecido Novo'
      ParentColor = False
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
    object lcxFavorecidoAtual: TcxLookupComboBox
      Left = 11
      Top = 41
      RepositoryItem = dtmLookupFinanceiro.ListaPessoasTodas
      Enabled = False
      ParentFont = False
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 2
      Width = 542
    end
    object lcxFavorecidoNovo: TcxLookupComboBox
      Left = 11
      Top = 88
      RepositoryItem = dtmLookupFinanceiro.ListaPessoasTodas
      ParentFont = False
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      Width = 542
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT * '#13#10'FROM J_LIVRO_AGENDAMENTO'#13#10'WHERE LIVRO_AGENDAMENTO_ID ' +
      '= 0'
    Left = 228
    Top = 50
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 260
    Top = 50
  end
  inherited ClientAncestral: TClientDataSet
    Left = 294
    Top = 50
    object ClientAncestralLIVRO_AGENDAMENTO_ID: TFMTBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
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
    object ClientAncestralQTD: TFMTBCDField
      FieldName = 'QTD'
      Precision = 20
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField
      FieldName = 'PROCESSO_TRAMITE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDATA_REGISTRO: TSQLTimeStampField
      FieldName = 'DATA_REGISTRO'
    end
    object ClientAncestralVALOR_PROLABORE: TFMTBCDField
      FieldName = 'VALOR_PROLABORE'
      Precision = 20
      Size = 3
    end
    object ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object ClientAncestralCNJ: TStringField
      FieldName = 'CNJ'
      Size = 1
    end
    object ClientAncestralCAIXA_ID: TFMTBCDField
      FieldName = 'CAIXA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object ClientAncestralREGISTRO_PARCIAL: TStringField
      FieldName = 'REGISTRO_PARCIAL'
      Size = 1
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 324
    Top = 50
  end
end