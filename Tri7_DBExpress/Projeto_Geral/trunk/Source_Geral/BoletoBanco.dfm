inherited frmBoletoBanco: TfrmBoletoBanco
  Left = 439
  Top = 225
  Caption = 'Boletos - Bancos'
  ClientHeight = 508
  ClientWidth = 591
  OldCreateOrder = True
  ExplicitWidth = 607
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 591
    ExplicitWidth = 591
    inherited PanelBotoesBasicos: TPanel
      Width = 509
      ExplicitWidth = 509
    end
    inherited PanelBotaoFechar: TPanel
      Left = 511
      ExplicitLeft = 511
    end
  end
  inherited StatusBar: TStatusBar
    Top = 488
    Width = 591
    ExplicitTop = 488
    ExplicitWidth = 591
  end
  inherited PanelGeral: TPanel
    Width = 591
    Height = 432
    ExplicitWidth = 591
    ExplicitHeight = 432
    inherited PanelData: TPanel
      Width = 589
      Height = 125
      ExplicitWidth = 589
      ExplicitHeight = 125
      object cxLabel8: TcxLabel
        Left = 5
        Top = 10
        Caption = 'Banco:'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 280
        Top = 10
        Caption = 'Ag'#234'ncia:'
        Transparent = True
      end
      object cxLabel10: TcxLabel
        Left = 412
        Top = 10
        Caption = 'Conta:'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 5
        Top = 40
        Caption = 'Carteira:'
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 184
        Top = 40
        Caption = 'C'#243'digo Cedente:'
        Transparent = True
      end
      object cxLabel14: TcxLabel
        Left = 412
        Top = 40
        Caption = 'Conv'#234'nio:'
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 5
        Top = 96
        Caption = 'Modelo do Boleto Banc'#225'rio:'
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 542
        Top = 10
        Caption = '-'
        Transparent = True
      end
      object icxBanco: TcxDBImageComboBox
        Left = 52
        Top = 8
        DataBinding.DataField = 'DB_CODIGO_BANCO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'BANCO DO BRASIL'
            ImageIndex = 0
            Value = '001-9'
          end
          item
            Description = 'HSBC'
            Value = '399-9'
          end
          item
            Description = 'ITA'#218
            Value = '341-7'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 217
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 327
        Top = 8
        DataBinding.DataField = 'DB_AGENCIA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 9
        Width = 78
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 463
        Top = 8
        DataBinding.DataField = 'DB_CONTA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 10
        Width = 78
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 551
        Top = 8
        DataBinding.DataField = 'DB_DIGITO_CONTA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 11
        Width = 26
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 52
        Top = 38
        DataBinding.DataField = 'DB_CARTEIRA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 12
        Width = 125
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 267
        Top = 38
        DataBinding.DataField = 'DB_CODIGO_CEDENTE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 13
        Width = 138
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 463
        Top = 38
        DataBinding.DataField = 'DB_CONVENIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 14
        Width = 114
      end
      object lcbModeloBoleto: TcxDBLookupComboBox
        Left = 145
        Top = 94
        DataBinding.DataField = 'CONFIG_RELATORIO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.KeyFieldNames = 'CONFIG_RELATORIO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListSource = dtsRelatorio
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 16
        Width = 260
      end
      object chbSituacao: TcxDBCheckBox
        Left = 410
        Top = 94
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 17
        Height = 21
        Width = 59
      end
      object cxLabel1: TcxLabel
        Left = 5
        Top = 68
        Caption = 'Cedente:'
        Transparent = True
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 52
        Top = 66
        DataBinding.DataField = 'DB_CEDENTE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 15
        Width = 525
      end
    end
    object grdBancos: TcxGrid
      Left = 1
      Top = 134
      Width = 589
      Height = 297
      Align = alClient
      TabOrder = 1
      object grdBancosDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdBancosDBTableView1Column1: TcxGridDBColumn
          Caption = 'Banco'
          DataBinding.FieldName = 'DB_NOME_BANCO'
          Width = 556
        end
      end
      object grdBancosLevel1: TcxGridLevel
        GridView = grdBancosDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 126
      Width = 589
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 63
      Control = PanelData
      ExplicitWidth = 8
    end
  end
  inherited ActionList1: TActionList
    Left = 113
    Top = 386
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM C_BOLETO_BANCO'
    Left = 143
    Top = 386
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 175
    Top = 386
  end
  inherited ClientAncestral: TClientDataSet
    Left = 207
    Top = 386
    object ClientAncestralBOLETO_BANCO_ID: TFMTBCDField
      FieldName = 'BOLETO_BANCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralDB_NOME_BANCO: TStringField
      FieldName = 'DB_NOME_BANCO'
      Size = 30
    end
    object ClientAncestralDB_CODIGO_BANCO: TStringField
      FieldName = 'DB_CODIGO_BANCO'
      Size = 10
    end
    object ClientAncestralDB_AGENCIA: TStringField
      FieldName = 'DB_AGENCIA'
      Size = 10
    end
    object ClientAncestralDB_CONTA: TStringField
      FieldName = 'DB_CONTA'
      Size = 10
    end
    object ClientAncestralDB_DIGITO_CONTA: TStringField
      FieldName = 'DB_DIGITO_CONTA'
      Size = 3
    end
    object ClientAncestralDB_CODIGO_CEDENTE: TStringField
      FieldName = 'DB_CODIGO_CEDENTE'
      Size = 10
    end
    object ClientAncestralDB_CARTEIRA: TStringField
      FieldName = 'DB_CARTEIRA'
      Size = 10
    end
    object ClientAncestralDB_CONVENIO: TStringField
      FieldName = 'DB_CONVENIO'
      Size = 10
    end
    object ClientAncestralDB_DIGITO_BANCO: TStringField
      FieldName = 'DB_DIGITO_BANCO'
      Size = 3
    end
    object ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralDB_CEDENTE: TStringField
      FieldName = 'DB_CEDENTE'
      Size = 120
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 239
    Top = 386
  end
  object sqlRelatorio: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT DESCRICAO, CONFIG_RELATORIO_ID'#13#10'FROM G_CONFIG_RELATORIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 206
    Top = 420
    object sqlRelatorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsRelatorio: TDataSource
    DataSet = sqlRelatorio
    Left = 239
    Top = 420
  end
end
