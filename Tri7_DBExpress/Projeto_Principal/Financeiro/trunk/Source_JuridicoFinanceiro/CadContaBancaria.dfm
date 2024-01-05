inherited frmCadContaBancaria: TfrmCadContaBancaria
  Caption = 'Cadastro de Contas'
  ClientHeight = 596
  ClientWidth = 893
  ExplicitWidth = 909
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 893
    ExplicitWidth = 893
    inherited PanelBotoesBasicos: TPanel
      Width = 805
      ExplicitWidth = 805
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          TabOrder = 5
          Visible = False
        end
        inherited cxBtnCancelar: TcxButton
          TabOrder = 4
        end
        inherited cxBtnGravar: TcxButton
          TabOrder = 3
        end
        inherited cxBtnExcluir: TcxButton
          TabOrder = 2
        end
        inherited cxBtnAlterar: TcxButton
          TabOrder = 1
        end
        inherited cxBtnIncluir: TcxButton
          TabOrder = 0
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 807
      ExplicitLeft = 807
    end
  end
  inherited StatusBar: TStatusBar
    Top = 575
    Width = 893
    ExplicitTop = 575
    ExplicitWidth = 893
  end
  inherited PanelGeral: TPanel
    Width = 893
    Height = 515
    TabOrder = 1
    ExplicitWidth = 893
    ExplicitHeight = 515
    inherited PanelData: TPanel
      Width = 891
      Height = 264
      BevelInner = bvNone
      ExplicitLeft = 2
      ExplicitWidth = 891
      ExplicitHeight = 264
      object cxLabel1: TcxLabel
        Left = 14
        Top = 4
        Caption = 
          'Descri'#231#227'o Banco                                                 ' +
          '                                                         N'#250'mero ' +
          '                  Digito   '
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxLabel10: TcxLabel
        Left = 14
        Top = 92
        Caption = 
          'Conv'#234'nio                          Carteira                      ' +
          '       C'#243'd. Cedente             Dig. Ced.  Modalidade'
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxLabel2: TcxLabel
        Left = 14
        Top = 48
        Caption = 
          'Descri'#231#227'o Ag'#234'ncia                                               ' +
          '                                                        N'#250'mero  ' +
          '                 Digito       Ag'#234'ncia UF'
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxLabel3: TcxLabel
        Left = 545
        Top = 92
        Caption = 'N'#250'mero da Conta             D'#237'gito Conta  '
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxLabel4: TcxLabel
        Left = 14
        Top = 214
        Caption = 'Vinculo do Cedente '
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxLabel13: TcxLabel
        Left = 447
        Top = 215
        Caption = 'Layout Padr'#227'o Boleto'
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
      end
      object cxBANCO_NOME: TcxDBTextEdit
        Left = 14
        Top = 23
        DataBinding.DataField = 'BANCO_NOME'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 426
      end
      object cxBANCO_NUMERO: TcxDBTextEdit
        Left = 445
        Top = 23
        DataBinding.DataField = 'BANCO_NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 7
        Width = 96
      end
      object cxBANCO_DIGITO: TcxDBTextEdit
        Left = 545
        Top = 23
        DataBinding.DataField = 'BANCO_DIGITO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 3
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 8
        Width = 46
      end
      object cxAGENCIA_NOME: TcxDBTextEdit
        Left = 14
        Top = 67
        DataBinding.DataField = 'AGENCIA_NOME'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 9
        Width = 426
      end
      object cxAGENCIA_NUMERO: TcxDBTextEdit
        Left = 445
        Top = 67
        DataBinding.DataField = 'AGENCIA_NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 10
        Width = 96
      end
      object cxAGENCIA_DIGITO: TcxDBTextEdit
        Left = 545
        Top = 67
        DataBinding.DataField = 'AGENCIA_DIGITO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 3
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 11
        Width = 46
      end
      object cxAGENCIA_UF: TcxDBComboBox
        Left = 596
        Top = 67
        RepositoryItem = dtmLookup.Combo_UF
        DataBinding.DataField = 'AGENCIA_UF'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 12
        Width = 54
      end
      object cxCONVENIO: TcxDBTextEdit
        Left = 14
        Top = 110
        DataBinding.DataField = 'CONVENIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 13
        Width = 130
      end
      object cxCARTEIRA: TcxDBTextEdit
        Left = 146
        Top = 110
        DataBinding.DataField = 'CARTEIRA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 14
        Width = 131
      end
      object cxCODIGO_CEDENTE_NUMERO: TcxDBTextEdit
        Left = 279
        Top = 110
        DataBinding.DataField = 'CODIGO_CEDENTE_NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 15
        Width = 110
      end
      object cxCODIGO_CEDENTE_DIGITO: TcxDBTextEdit
        Left = 391
        Top = 110
        DataBinding.DataField = 'CODIGO_CEDENTE_DIGITO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 3
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 16
        Width = 49
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 445
        Top = 110
        DataBinding.DataField = 'MODALIDADE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 3
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 17
        Width = 97
      end
      object cxCONTA_NUMERO: TcxDBTextEdit
        Left = 545
        Top = 110
        DataBinding.DataField = 'CONTA_NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 18
        Width = 130
      end
      object cxCONTA_DIGITO: TcxDBTextEdit
        Left = 677
        Top = 110
        DataBinding.DataField = 'CONTA_DIGITO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 10
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 19
        Width = 75
      end
      object cxGroupBox1: TcxGroupBox
        Left = 9
        Top = 139
        Caption = 'Local de Grava'#231#227'o'
        Style.LookAndFeel.Kind = lfFlat
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 20
        Height = 70
        Width = 870
        object cxLabel6: TcxLabel
          Left = 6
          Top = 18
          Caption = 'Boleto'
          Style.TextColor = 4210688
          Style.TextStyle = [fsUnderline]
        end
        object edtLocalBoleto: TcxDBTextEdit
          Left = 5
          Top = 38
          DataBinding.DataField = 'LOCAL_PADRAO'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.MaxLength = 60
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 1
          Width = 427
        end
        object cxLabel7: TcxLabel
          Left = 437
          Top = 18
          Caption = 'Remessa'
          Style.TextColor = 4210688
          Style.TextStyle = [fsUnderline]
        end
        object edtLocalRemessa: TcxDBTextEdit
          Left = 436
          Top = 38
          DataBinding.DataField = 'LOCAL_REMESSA'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.MaxLength = 60
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 3
          Width = 427
        end
      end
      object lcxCedente: TcxDBLookupComboBox
        Left = 14
        Top = 234
        RepositoryItem = dtmLookupFinanceiro.ListaCedenteAtivos
        DataBinding.DataField = 'CEDENTE_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 21
        Width = 426
      end
      object lcxLayout: TcxDBLookupComboBox
        Left = 446
        Top = 235
        RepositoryItem = dtmLookupFinanceiro.ListaLayoutBancario
        DataBinding.DataField = 'CONFIG_RELATORIO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 22
        Width = 425
      end
    end
    object cxGridBanco: TcxGrid
      Left = 1
      Top = 265
      Width = 891
      Height = 249
      Align = alClient
      TabOrder = 1
      object cxGridBancoDBTableView1: TcxGridDBTableView
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
        FilterBox.CustomizeDialog = False
        FilterBox.Position = fpTop
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.MRUItemsListCount = 5
        Filtering.ColumnPopup.MaxDropDownItemCount = 10
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 25
        OptionsView.GroupRowStyle = grsOffice11
        Preview.Visible = True
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBancoDBTableView1BANCO_NOME: TcxGridDBColumn
          Caption = 'Banco'
          DataBinding.FieldName = 'BANCO_NOME'
          Width = 191
        end
        object cxGridBancoDBTableView1CARTEIRA: TcxGridDBColumn
          Caption = 'Carteira'
          DataBinding.FieldName = 'CARTEIRA'
          Width = 58
        end
        object cxGridBancoDBTableView1AGENCIA_NOME: TcxGridDBColumn
          Caption = 'Ag'#234'ncia'
          DataBinding.FieldName = 'AGENCIA_NOME'
          Width = 112
        end
        object cxGridBancoDBTableView1CONVENIO: TcxGridDBColumn
          Caption = 'Conv'#234'nio'
          DataBinding.FieldName = 'CONVENIO'
          Width = 80
        end
        object cxGridBancoDBTableView1CODIGO_CEDENTE_NUMERO: TcxGridDBColumn
          Caption = 'C'#243'd. Cedente'
          DataBinding.FieldName = 'CODIGO_CEDENTE_NUMERO'
          Width = 88
        end
      end
      object cxGridBancoLevel1: TcxGridLevel
        GridView = cxGridBancoDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 21
    Top = 346
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'select '#13#10'  * '#13#10'from '#13#10'  J_BANCO'#13#10'ORDER BY '#13#10'  BANCO_NOME, '#13#10'  AG' +
      'ENCIA_UF'
    Left = 83
    Top = 346
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 115
    Top = 346
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    Left = 146
    Top = 346
    object ClientAncestralBANCO_ID: TFMTBCDField
      FieldName = 'BANCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralBANCO_NUMERO: TStringField
      FieldName = 'BANCO_NUMERO'
      Size = 10
    end
    object ClientAncestralBANCO_DIGITO: TStringField
      FieldName = 'BANCO_DIGITO'
      Size = 3
    end
    object ClientAncestralBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      Size = 60
    end
    object ClientAncestralAGENCIA_NOME: TStringField
      FieldName = 'AGENCIA_NOME'
      Size = 60
    end
    object ClientAncestralAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      Size = 3
    end
    object ClientAncestralAGENCIA_NUMERO: TStringField
      FieldName = 'AGENCIA_NUMERO'
      Size = 10
    end
    object ClientAncestralCONTA_NUMERO: TStringField
      FieldName = 'CONTA_NUMERO'
      Size = 15
    end
    object ClientAncestralCONTA_DIGITO: TStringField
      FieldName = 'CONTA_DIGITO'
      Size = 3
    end
    object ClientAncestralAGENCIA_UF: TStringField
      FieldName = 'AGENCIA_UF'
      Size = 3
    end
    object ClientAncestralCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 10
    end
    object ClientAncestralCODIGO_CEDENTE_NUMERO: TStringField
      FieldName = 'CODIGO_CEDENTE_NUMERO'
      Size = 10
    end
    object ClientAncestralCODIGO_CEDENTE_DIGITO: TStringField
      FieldName = 'CODIGO_CEDENTE_DIGITO'
      Size = 3
    end
    object ClientAncestralNOSSO_NUMERO: TFMTBCDField
      FieldName = 'NOSSO_NUMERO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 10
    end
    object ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Size = 3
    end
    object ClientAncestralLOCAL_PADRAO: TStringField
      FieldName = 'LOCAL_PADRAO'
      Size = 260
    end
    object ClientAncestralLOCAL_REMESSA: TStringField
      FieldName = 'LOCAL_REMESSA'
      Size = 260
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 179
    Top = 346
  end
end
