inherited frmCadSeloGrupo: TfrmCadSeloGrupo
  Left = 276
  Top = 239
  Caption = 'Cadastro Grupo de Selo'
  ClientHeight = 425
  ClientWidth = 829
  OldCreateOrder = True
  ExplicitWidth = 845
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 829
    ExplicitWidth = 829
    inherited PanelBotoesBasicos: TPanel
      Width = 747
      ExplicitWidth = 747
    end
    inherited PanelBotaoFechar: TPanel
      Left = 749
      ExplicitLeft = 749
    end
  end
  inherited StatusBar: TStatusBar
    Top = 405
    Width = 829
    ExplicitTop = 405
    ExplicitWidth = 829
  end
  inherited PanelGeral: TPanel
    Width = 829
    Height = 349
    ExplicitWidth = 829
    ExplicitHeight = 349
    inherited PanelData: TPanel
      Width = 827
      Height = 88
      ExplicitLeft = 2
      ExplicitWidth = 827
      ExplicitHeight = 88
      object cxLabel1: TcxLabel
        Left = 8
        Top = 9
        Caption = 'Desc. Resumida:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 92
        Top = 7
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 1
        Width = 242
      end
      object cxLabel2: TcxLabel
        Left = 337
        Top = 9
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtNumeto: TcxDBTextEdit
        Left = 377
        Top = 7
        DataBinding.DataField = 'NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 63
      end
      object cxLabel4: TcxLabel
        Left = 447
        Top = 9
        Caption = 'Controle Automatico:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 552
        Top = 7
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'CONTROLE_AUTOMATICO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Vari'#225'vel'
            ImageIndex = 0
            Value = 'V'
          end
          item
            Description = 'Qualifica'#231#227'o'
            Value = 'Q'
          end
          item
            Description = 'Pr'#233'-Minuta'
            Value = 'M'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 57
      end
      object chbSituacao: TcxDBCheckBox
        Left = 615
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
        TabOrder = 6
        Transparent = True
        Height = 21
        Width = 59
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 62
        Caption = 'Desc. Completa:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 92
        Top = 60
        DataBinding.DataField = 'DESCRICAO_COMPLETA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 9
        Width = 726
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 92
        Top = 34
        RepositoryItem = dtmLookup.Lista_SeloTipoCartorio
        DataBinding.DataField = 'TIPO_CARTORIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 726
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 89
      Width = 827
      Height = 259
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 2
      ExplicitTop = 88
      object grdBasicaDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.PriorPage.Visible = False
        NavigatorButtons.NextPage.Visible = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
            Column = cxGridBasicaDBCodigo
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'SELO_GRUPO_ID'
          Visible = False
          Width = 68
        end
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o Resumida'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 387
        end
        object grdBasicaDBTableViewNUMERO: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'NUMERO'
          Width = 60
        end
        object grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn
          Caption = 'Tipo Cart'#243'rio'
          DataBinding.FieldName = 'TIPO_CARTORIO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <>
          RepositoryItem = dtmLookup.Lista_SeloTipoCartorio
          Width = 300
        end
        object grdBasicaDBTableView1Column2: TcxGridDBColumn
          Caption = 'Controle Automatico'
          DataBinding.FieldName = 'CONTROLE_AUTOMATICO'
          RepositoryItem = dtmLookup.Combo_SimNao
          Width = 126
        end
        object cxGridBasicaDBSituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 99
        end
        object grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn
          Caption = 'Descri'#231#227'o Completa'
          DataBinding.FieldName = 'DESCRICAO_COMPLETA'
          Width = 400
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = grdBasicaDBTableView1
      end
    end
    object cxLabel3: TcxLabel
      Left = 9
      Top = 35
      Caption = 'Tipo Cart'#243'rio:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
    end
  end
  inherited ActionList1: TActionList
    Left = 245
    Top = 298
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM G_SELO_GRUPO'#13#10'ORDER BY TIPO_CARTORIO, NUMERO')
    Left = 275
    Top = 298
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 307
    Top = 298
  end
  inherited ClientAncestral: TClientDataSet
    Left = 339
    Top = 298
    object ClientAncestralSELO_GRUPO_ID: TBCDField
      FieldName = 'SELO_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralNUMERO: TBCDField
      FieldName = 'NUMERO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTROLE_AUTOMATICO: TStringField
      FieldName = 'CONTROLE_AUTOMATICO'
      Size = 1
    end
    object ClientAncestralTIPO_CARTORIO: TStringField
      FieldName = 'TIPO_CARTORIO'
      Size = 3
    end
    object ClientAncestralDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 260
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 371
    Top = 298
  end
end
