inherited frmIndexacaoTipo: TfrmIndexacaoTipo
  Left = 52
  Top = 143
  Caption = 'Tipo Indexa'#231#227'o'
  ClientWidth = 638
  OldCreateOrder = True
  ExplicitWidth = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 638
    ExplicitWidth = 638
    inherited PanelBotoesBasicos: TPanel
      Width = 556
      ExplicitWidth = 556
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 558
      ExplicitLeft = 558
    end
  end
  inherited StatusBar: TStatusBar
    Width = 638
    ExplicitWidth = 638
  end
  inherited PanelGeral: TPanel
    Width = 638
    ExplicitWidth = 638
    inherited PanelData: TPanel
      Width = 636
      Height = 84
      ExplicitWidth = 636
      ExplicitHeight = 84
      object cxLabel2: TcxLabel
        Left = 8
        Top = 9
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 33
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 56
        Caption = 'Sigla:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel4: TcxLabel
        Left = 95
        Top = 56
        Caption = 'Grupo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtCodigo: TcxDBTextEdit
        Left = 67
        Top = 8
        DataBinding.DataField = 'INDEXACAO_TIPO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 4
        Width = 72
      end
      object chbSituacao: TcxDBCheckBox
        Left = 149
        Top = 8
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
        TabOrder = 5
        Transparent = True
        Height = 21
        Width = 61
      end
      object edtDescricao: TcxDBTextEdit
        Left = 67
        Top = 32
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        Width = 508
      end
      object edtSigla: TcxDBTextEdit
        Left = 67
        Top = 56
        DataBinding.DataField = 'SIGLA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        Width = 22
      end
      object icx: TcxDBImageComboBox
        Left = 131
        Top = 56
        DataBinding.DataField = 'GRUPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Documento'
            ImageIndex = 0
            Value = 'D'
          end
          item
            Description = 'Ficha'
            Value = 'F'
          end
          item
            Description = 'Livro'
            Value = 'L'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 121
      end
      object cxLabel5: TcxLabel
        Left = 257
        Top = 57
        Caption = 'Usar Banco de Dados:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 370
        Top = 56
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'BD'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 51
      end
    end
    object grdGrupoRelatorio: TcxGrid
      Left = 1
      Top = 93
      Width = 636
      Height = 252
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object grdGrupoRelatorioDBTableView1: TcxGridDBTableView
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
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdGrupoRelatorioDBTableView1INDEXACAO_TIPO_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'INDEXACAO_TIPO_ID'
          Width = 80
        end
        object grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 380
        end
        object grdGrupoRelatorioDBTableView1SIGLA: TcxGridDBColumn
          Caption = 'Sigla'
          DataBinding.FieldName = 'SIGLA'
          Width = 60
        end
        object grdGrupoRelatorioDBTableView1GRUPO: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'GRUPO'
          Width = 130
        end
        object grdGrupoRelatorioDBTableView1SITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <>
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          MinWidth = 70
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 70
        end
        object grdGrupoRelatorioDBTableView1BD: TcxGridDBColumn
          DataBinding.FieldName = 'BD'
          RepositoryItem = dtmLookup.Combo_SimNao
          Width = 50
        end
      end
      object grdGrupoRelatorioLevel1: TcxGridLevel
        GridView = grdGrupoRelatorioDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 85
      Width = 636
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 84
      Control = PanelData
      ExplicitWidth = 8
    end
  end
  inherited ActionList1: TActionList
    Left = 109
    Top = 210
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'select *  from  G_INDEXACAO_TIPO'#13#10'where SISTEMA_ID =  :SISTEMA_I' +
      'D'#13#10'order by DESCRICAO'
    Params = <
      item
        DataType = ftString
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Left = 139
    Top = 210
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 171
    Top = 210
  end
  inherited ClientAncestral: TClientDataSet
    Left = 203
    Top = 210
    object ClientAncestralINDEXACAO_TIPO_ID: TFMTBCDField
      FieldName = 'INDEXACAO_TIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 1
    end
    object ClientAncestralGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 1
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralBD: TStringField
      FieldName = 'BD'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 235
    Top = 210
  end
end
