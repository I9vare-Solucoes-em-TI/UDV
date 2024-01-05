inherited frmCadastroRapidoOrcTransf: TfrmCadastroRapidoOrcTransf
  ClientHeight = 180
  ClientWidth = 519
  KeyPreview = True
  OnActivate = FormActivate
  ExplicitWidth = 525
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 519
    TabOrder = 1
    ExplicitWidth = 637
    inherited lblInformaca: TcxLabel
      Caption = 'Transfer'#234'ncia de Valores de Or'#231'amento'
      Style.IsFontAssigned = True
      ExplicitLeft = 84
      ExplicitTop = -4
      ExplicitWidth = 222
      Width = 276
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 311
      Width = 208
      ExplicitLeft = 300
      ExplicitWidth = 208
      inherited btnCancelar: TcxButton
        Left = 1
        LookAndFeel.SkinName = ''
        ExplicitLeft = 1
      end
      inherited btnConfirmar: TcxButton
        Left = 103
        LookAndFeel.SkinName = ''
        ExplicitLeft = 103
      end
    end
  end
  inherited Panel1: TPanel
    Width = 519
    Height = 142
    TabOrder = 0
    ExplicitTop = 37
    ExplicitWidth = 519
    ExplicitHeight = 142
    object cxLabel5: TcxLabel
      Left = 14
      Top = 8
      Caption = 'Or'#231'amento Origem'
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
      Left = 14
      Top = 49
      Caption = 'Or'#231'amento Destino'
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
      Left = 14
      Top = 92
      Caption = 'Observa'#231#227'o'
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
      Left = 400
      Top = 49
      Caption = 'Valor a Transferir'
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
      Left = 400
      Top = 5
      Caption = 'Valor Disponivel'
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
    object lcxOrcamentoDestino: TcxDBLookupComboBox
      Left = 13
      Top = 67
      DataBinding.DataField = 'LIVRO_FINANCEIRO_DESTINO_ID'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'LIVRO_FINANCEIRO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'ORCAMENTO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsOrcamentoDestino
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 5
      Width = 381
    end
    object edtValorTransferir: TcxDBCurrencyEdit
      Left = 400
      Top = 67
      DataBinding.DataField = 'VALOR'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 6
      Width = 108
    end
    object edtHistorico: TcxDBTextEdit
      Left = 13
      Top = 110
      DataBinding.DataField = 'OBSERVACAO'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 7
      Width = 496
    end
    object edtOrcamentoOrigem: TcxTextEdit
      Left = 13
      Top = 25
      Enabled = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
      TabOrder = 8
      Width = 381
    end
    object edtValorDisponivel: TcxCurrencyEdit
      Left = 400
      Top = 25
      Enabled = False
      ParentFont = False
      Properties.DisplayFormat = 'R$ ,0.00;'
      Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
      TabOrder = 9
      Width = 108
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT *'#13#10'FROM J_ORCAMENTO_RESERVA'#13#10'WHERE ORCAMENTO_RESERVA_ID =' +
      ' 0'
    Left = 204
    Top = 139
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 236
    Top = 139
  end
  inherited ClientAncestral: TClientDataSet
    Left = 270
    Top = 139
    object ClientAncestralORCAMENTO_RESERVA_ID: TFMTBCDField
      FieldName = 'ORCAMENTO_RESERVA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralLIVRO_FINANCEIRO_ORIGEM_ID: TFMTBCDField
      FieldName = 'LIVRO_FINANCEIRO_ORIGEM_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 120
    end
    object ClientAncestralLIVRO_FINANCEIRO_DESTINO_ID: TFMTBCDField
      FieldName = 'LIVRO_FINANCEIRO_DESTINO_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 300
    Top = 139
  end
  object dtsOrcamentoDestino: TDataSource
    DataSet = ClientOrcamentoDestino
    Left = 296
    Top = 54
  end
  object ClientOrcamentoDestino: TClientDataSet
    PersistDataPacket.Data = {
      540000009619E0BD0100000018000000020000000000030000005400094F5243
      414D454E544F0100490000000100055749445448020002005A00134C4956524F
      5F46494E414E434549524F5F494404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ORCAMENTO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'LIVRO_FINANCEIRO_ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 6
    object ClientOrcamentoDestinoORCAMENTO: TStringField
      FieldName = 'ORCAMENTO'
      Size = 90
    end
    object ClientOrcamentoDestinoLIVRO_FINANCEIRO_ID: TIntegerField
      FieldName = 'LIVRO_FINANCEIRO_ID'
    end
  end
end
