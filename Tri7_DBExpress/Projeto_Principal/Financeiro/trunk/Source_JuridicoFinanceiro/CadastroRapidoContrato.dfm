inherited frmCadastroRapidoContrato: TfrmCadastroRapidoContrato
  ClientHeight = 244
  ClientWidth = 531
  OnActivate = FormActivate
  ExplicitWidth = 537
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 531
    ExplicitWidth = 531
    inherited lblInformaca: TcxLabel
      Caption = 'Contrato'
      Style.IsFontAssigned = True
      ExplicitWidth = 496
      Width = 496
      AnchorY = 19
    end
    inherited btnCancelar: TcxButton
      Left = 320
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 320
      ExplicitTop = 10
    end
    inherited btnConfirmar: TcxButton
      Left = 419
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 419
      ExplicitTop = 10
    end
  end
  inherited Panel1: TPanel
    Width = 531
    Height = 206
    ExplicitWidth = 531
    ExplicitHeight = 206
    object cxLabel28: TcxLabel
      Left = 18
      Top = 11
      Caption = 'Contrato N'#250'mero'
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
      Left = 136
      Top = 11
      Caption = 'Contrato em Nome de Quem?'
      ParentColor = False
      Style.Color = clBtnFace
      Style.TextColor = 4210688
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object lblDemaisClientes: TcxLabel
      Left = 18
      Top = 77
      Caption = 'Cliente(s) Adicionais do Contrato'
      Enabled = False
      ParentColor = False
      Style.Color = clBtnFace
      Style.TextColor = 4210688
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object edtContrato: TcxDBTextEdit
      Left = 18
      Top = 29
      DataBinding.DataField = 'CONTRATO_NUMERO'
      DataBinding.DataSource = SourceAncestral
      Enabled = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      Width = 87
    end
    object btnAlterarContrato: TcxButton
      Left = 106
      Top = 26
      Width = 28
      Height = 24
      Cursor = crHandPoint
      Hint = 'Vincular Partes Financeiras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnAlterarContratoClick
      Colors.Default = clBlue
      Colors.Normal = clBtnFace
      Colors.Pressed = clGreen
      Colors.Disabled = clGray
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      OptionsImage.Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00CC666600EDC8C8009A828200E19C8C008A888600FFFEFD00E5AE
        6500EABE840081786C00DC912800FFEDD20081796E00FFFAF300FFFDFA00FFE4
        B900FFE5BA00FFE6BF00FFE8C300FFE9C700FFEAC700FFEBCC00FFEDD000FFEF
        D500FFF0D900FFFCF700817B70008A8479007A756C0099FFFF00497A7A003D66
        66006BF0FF002B6066006CF0FF002DDBFF001258660016697A00005266000754
        6600B2B2B2009797970060606000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020203
        0303030303030303030302020202020306060606060606060603020202020203
        040F1E1A181513110603020202020203041B281C191714120603020202020203
        051028280E0D1613060329022929022926262725260B17140603290229290229
        2222222422232A1506032902292902292121201F211D19170603020202020203
        040121212C2A2A18060302020202020304012107040404040603020202020203
        04012B1003030303030302020202020304010108030C0C0C0302020202020203
        04010101030A0903020202020202020304010101030A03020202020202020203
        0404040403030202020202020202020303030303030202020202}
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
    end
    object lcxClientePrincipal: TcxDBLookupComboBox
      Left = 136
      Top = 29
      DataBinding.DataField = 'PROCESSO_PARTE_ID'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PROCESSO_PARTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsClientePrincipal
      Properties.OnEditValueChanged = lcxClientePrincipalPropertiesEditValueChanged
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 5
      Width = 378
    end
    object cbxVincular: TcxCheckBox
      Left = 15
      Top = 56
      Caption = 'Vincular Outro(s) Cliente(s)'
      Enabled = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleCheckBox
      TabOrder = 6
      Transparent = True
      OnClick = cbxVincularClick
      Width = 414
    end
    object lcxDemaisClientes: TcxCheckListBox
      Left = 15
      Top = 100
      Width = 496
      Height = 97
      Items = <>
      StyleDisabled.Color = clWindow
      TabOrder = 7
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT * '#13#10'FROM J_PROCESSO_CONTRATO'
    Left = 357
    Top = 135
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 391
    Top = 135
  end
  inherited ClientAncestral: TClientDataSet
    Left = 423
    Top = 135
    object ClientAncestralPROCESSO_CONTRATO_ID: TFMTBCDField
      FieldName = 'PROCESSO_CONTRATO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralPROCESSO_ID: TFMTBCDField
      FieldName = 'PROCESSO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPROCESSO_PARTE_ID: TFMTBCDField
      FieldName = 'PROCESSO_PARTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPARTE_ADICIONAL: TStringField
      FieldName = 'PARTE_ADICIONAL'
      Size = 90
    end
    object ClientAncestralCONTRATO_NUMERO: TFMTBCDField
      FieldName = 'CONTRATO_NUMERO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField
      FieldName = 'PROCESSO_TRAMITE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralADICIONAL: TStringField
      FieldName = 'ADICIONAL'
      Size = 1
    end
    object ClientAncestralADITIVO: TFMTBCDField
      FieldName = 'ADITIVO'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 455
    Top = 135
  end
  object sqlClientePrincipal: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT PP.PROCESSO_PARTE_ID, PP.NOME, P.CPFCNPJ, PP.PRINCIPAL'#13#10'F' +
      'ROM J_PROCESSO_PARTE PP LEFT OUTER JOIN J_PESSOA P ON'#13#10'  PP.PESS' +
      'OA_ID = P.PESSOA_ID'#13#10'WHERE PROCESSO_TRAMITE_ID = :PROCESSO_TRAMI' +
      'TE_ID'#13#10'    AND CLIENTE = '#39'S'#39#13#10'ORDER BY PRINCIPAL DESC, NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'PROCESSO_TRAMITE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 324
    Top = 105
    object sqlClientePrincipalPROCESSO_PARTE_ID: TFMTBCDField
      FieldName = 'PROCESSO_PARTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlClientePrincipalNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlClientePrincipalCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 15
    end
    object sqlClientePrincipalPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
  end
  object dtsClientePrincipal: TDataSource
    DataSet = sqlClientePrincipal
    Left = 324
    Top = 137
  end
  object sqlDemaisPartes: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT PROCESSO_PARTE_ID, NOME'#13#10'FROM J_PROCESSO_PARTE'#13#10'WHERE PRO' +
      'CESSO_TRAMITE_ID = :PROCESSO_TRAMITE_ID'#13#10'  AND NOT PROCESSO_PART' +
      'E_ID = :PROCESSO_PARTE_ID'#13#10'  AND CLIENTE = '#39'S'#39#13#10'ORDER BY NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'PROCESSO_TRAMITE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PROCESSO_PARTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 286
    Top = 105
    object sqlDemaisPartesPROCESSO_PARTE_ID: TFMTBCDField
      FieldName = 'PROCESSO_PARTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlDemaisPartesNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dtsDemaisPartes: TDataSource
    DataSet = sqlDemaisPartes
    Left = 286
    Top = 137
  end
end
