inherited frmAporte: TfrmAporte
  ClientHeight = 186
  ClientWidth = 550
  ExplicitWidth = 556
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 550
    inherited lblInformaca: TcxLabel
      Caption = ' Aporte'
      Style.IsFontAssigned = True
      Width = 515
      AnchorY = 19
    end
    inherited btnCancelar: TcxButton
      Left = 339
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 339
      ExplicitTop = 10
    end
    inherited btnConfirmar: TcxButton
      Left = 438
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 438
      ExplicitTop = 10
    end
  end
  inherited Panel1: TPanel
    Width = 550
    Height = 148
    object cxLabel10: TcxLabel
      Left = 11
      Top = 94
      Caption = 'Valor'
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
    object cxLabel16: TcxLabel
      Left = 140
      Top = 94
      Caption = 'Data Vencimento'
      ParentColor = False
      Style.Color = clBtnFace
      Style.TextColor = 4210688
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 235
      Top = 48
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
    object cxLabel5: TcxLabel
      Left = 11
      Top = 48
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
    object lblCliente: TcxLabel
      Left = 11
      Top = 7
      Caption = 'Pessoa que fez o Aporte?'
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
    object cxLabel2: TcxLabel
      Left = 235
      Top = 94
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
    object lcxCliente: TcxDBLookupComboBox
      Left = 11
      Top = 26
      RepositoryItem = dtmLookupFinanceiro.ListaPessoasTodas
      DataBinding.DataField = 'PESSOA_ID'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 6
      Width = 522
    end
    object lcxCompromisso: TcxDBLookupComboBox
      Left = 11
      Top = 66
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
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 7
      Width = 218
    end
    object edtHistorico: TcxDBTextEdit
      Left = 235
      Top = 66
      DataBinding.DataField = 'HISTORICO'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 8
      Width = 298
    end
    object edtValorFixo: TcxDBCurrencyEdit
      Left = 10
      Top = 112
      DataBinding.DataField = 'VALOR_PARCELA'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 9
      Width = 123
    end
    object edtDataVencimentoFixa: TcxDBDateEdit
      Left = 139
      Top = 112
      DataBinding.DataField = 'DATA_INICIAL'
      DataBinding.DataSource = SourceAncestral
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 10
      Width = 90
    end
    object lcxConta: TcxDBLookupComboBox
      Left = 235
      Top = 112
      DataBinding.DataField = 'CAIXA_ID'
      DataBinding.DataSource = SourceAncestral
      Properties.ListColumns = <>
      TabOrder = 11
      Width = 298
    end
  end
  inherited DataSetAncestral: TI9Query
    Left = 175
    Top = 9
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 207
    Top = 9
  end
  inherited ClientAncestral: TClientDataSet
    Left = 239
    Top = 9
  end
  inherited SourceAncestral: TDataSource
    Left = 271
    Top = 9
  end
end
