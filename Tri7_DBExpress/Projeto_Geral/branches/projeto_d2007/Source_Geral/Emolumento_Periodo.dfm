inherited frmEmolumento_Periodo: TfrmEmolumento_Periodo
  Left = 420
  Top = 289
  Caption = 'Per'#237'odo dos Emolumentos'
  ClientWidth = 784
  OldCreateOrder = True
  ExplicitWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited PanelBotoesBasicos: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 704
      ExplicitLeft = 704
    end
  end
  inherited StatusBar: TStatusBar
    Width = 784
    ExplicitWidth = 784
  end
  inherited PanelGeral: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited PanelData: TPanel
      Width = 782
      Height = 61
      ExplicitWidth = 782
      ExplicitHeight = 61
      object cxLabel1: TcxLabel
        Left = 12
        Top = 9
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel2: TcxLabel
        Left = 12
        Top = 36
        Caption = 'Data Inicial:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel3: TcxLabel
        Left = 201
        Top = 36
        Caption = 'Ano:'
      end
      object edtDescricao: TcxDBTextEdit
        Left = 73
        Top = 8
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 384
      end
      object chbSituacao: TcxDBCheckBox
        Left = 462
        Top = 9
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Transparent = True
        Height = 21
        Width = 59
      end
      object edtDataInicialPeriodo: TcxDBDateEdit
        Left = 74
        Top = 34
        RepositoryItem = dtmLookup.Formata_DataSEMhora
        DataBinding.DataField = 'DATA_INICIAL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 227
        Top = 34
        DataBinding.DataField = 'ANO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        Width = 71
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 62
      Align = alClient
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 1
      Height = 283
      Width = 782
      object grdBasica: TcxGrid
        Left = 2
        Top = 5
        Width = 778
        Height = 276
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object grdBasicaDBTableView1: TcxGridDBTableView
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
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdBasicaDBTableView1DESCRICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o do Per'#237'odo'
            DataBinding.FieldName = 'DESCRICAO'
            Options.Editing = False
            Options.Filtering = False
            Width = 344
          end
          object grdBasicaDBTableView1DATA_INICIAL: TcxGridDBColumn
            Caption = 'Data Inicial'
            DataBinding.FieldName = 'DATA_INICIAL'
            RepositoryItem = dtmLookup.Formata_DataSEMhora
            Options.Editing = False
            Options.Filtering = False
            Width = 125
          end
          object grdBasicaDBTableView1SITUACAO: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Options.Editing = False
            Options.Filtering = False
            Width = 113
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 13
    Top = 282
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'SELECT * FROM G_EMOLUMENTO_PERIODO'
    Left = 43
    Top = 282
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 75
    Top = 282
  end
  inherited ClientAncestral: TClientDataSet
    Left = 107
    Top = 282
    object ClientAncestralEMOLUMENTO_PERIODO_ID: TFMTBCDField
      FieldName = 'EMOLUMENTO_PERIODO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
    end
    object ClientAncestralANO: TStringField
      FieldName = 'ANO'
      Size = 10
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 139
    Top = 282
  end
end
