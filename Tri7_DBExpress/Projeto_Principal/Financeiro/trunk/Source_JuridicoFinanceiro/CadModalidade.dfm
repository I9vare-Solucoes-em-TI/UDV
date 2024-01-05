inherited frmCadModalidade: TfrmCadModalidade
  Caption = 'Tipo de Modalidade do Compromisso'
  ClientHeight = 425
  ClientWidth = 770
  ExplicitWidth = 786
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 770
    ExplicitWidth = 770
    inherited PanelBotoesBasicos: TPanel
      Width = 688
      ExplicitWidth = 688
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 690
      ExplicitLeft = 690
      ExplicitTop = 2
      inherited cxBtnFechar: TcxButton
        Left = 6
        ExplicitLeft = 6
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 405
    Width = 770
    ExplicitTop = 405
    ExplicitWidth = 770
  end
  inherited PanelGeral: TPanel
    Width = 770
    Height = 349
    ExplicitWidth = 770
    ExplicitHeight = 349
    inherited PanelData: TPanel
      Width = 768
      Height = 50
      ExplicitWidth = 768
      ExplicitHeight = 50
      object cxLabel1: TcxLabel
        Left = 9
        Top = 4
        Caption = 'Descri'#231#227'o'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object cxLabel2: TcxLabel
        Left = 366
        Top = 4
        Caption = 'Tipo'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object edtDescricao: TcxDBTextEdit
        Left = 9
        Top = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 352
      end
      object icxTipoModalidade: TcxDBImageComboBox
        Left = 367
        Top = 21
        RepositoryItem = dtmLookupFinanceiro.ComboTipoModalidade
        DataBinding.DataField = 'TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 128
      end
      object chbSituacao: TcxDBCheckBox
        Left = 501
        Top = 21
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
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 21
        Width = 59
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 51
      Width = 768
      Height = 297
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridPesquisa: TcxGridDBTableView
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
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = 'R$ ,#0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'VALOR'
          end
          item
            Format = 'R$ ,#0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'calc_ValorDevido'
          end>
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
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          RepositoryItem = dtmLookupFinanceiro.ComboTipoModalidade
          Width = 95
        end
        object cxGridPesquisaColumn1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 257
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 88
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = cxGridPesquisa
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 89
    Top = 214
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM J_TIPO_MODALIDADE'#13#10'ORDER BY DESCRICAO'
    Left = 119
    Top = 214
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 151
    Top = 214
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    Top = 216
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralTIPO_MODALIDADE_ID: TFMTBCDField
      FieldName = 'TIPO_MODALIDADE_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 215
    Top = 214
  end
end
