inherited frmEmolumento_Periodo: TfrmEmolumento_Periodo
  Left = 420
  Top = 289
  Caption = 'Per'#237'odo dos Emolumentos'
  ClientWidth = 784
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited PanelBotoesBasicos: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
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
        Style.TextColor = clNavy
      end
      object edtDescricao: TcxDBTextEdit
        Left = 73
        Top = 8
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.TextColor = clNavy
        TabOrder = 0
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
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 21
        Width = 59
      end
      object edtDataInicialPeriodo: TcxDBDateEdit
        Left = 74
        Top = 33
        RepositoryItem = dtmLookup.Formata_DataSEMhora
        DataBinding.DataField = 'DATA_INICIAL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 121
      end
      object cxLabel2: TcxLabel
        Left = 12
        Top = 34
        Caption = 'Data Inicial:'
        Style.TextColor = clNavy
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 62
      Align = alClient
      ParentFont = False
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
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT * FROM G_EMOLUMENTO_PERIODO')
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
    object ClientAncestralEMOLUMENTO_PERIODO_ID: TBCDField
      FieldName = 'EMOLUMENTO_PERIODO_ID'
      Origin = 'EMOLUMENTO_PERIODO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 139
    Top = 282
  end
end
