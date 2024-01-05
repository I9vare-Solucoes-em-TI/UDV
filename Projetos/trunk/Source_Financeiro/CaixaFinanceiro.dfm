inherited frmCaixaFinanceiro: TfrmCaixaFinanceiro
  Left = 140
  Top = 215
  Caption = 'Caixas Financeiros'
  ClientHeight = 567
  ClientWidth = 853
  OldCreateOrder = True
  ExplicitWidth = 869
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 853
    ExplicitWidth = 853
    inherited PanelBotoesBasicos: TPanel
      Width = 771
      ExplicitWidth = 771
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 773
      ExplicitLeft = 773
    end
  end
  inherited StatusBar: TStatusBar
    Top = 547
    Width = 853
    ExplicitTop = 547
    ExplicitWidth = 853
  end
  inherited PanelGeral: TPanel
    Width = 853
    Height = 491
    ExplicitWidth = 853
    ExplicitHeight = 491
    inherited PanelData: TPanel
      Width = 851
      Height = 92
      ExplicitWidth = 851
      ExplicitHeight = 92
      object Label1: TLabel
        Left = 281
        Top = 48
        Width = 65
        Height = 13
        Caption = 'Tipo do Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cxLabel1: TcxLabel
        Left = 9
        Top = 6
        Caption = 'Descri'#231#227'o Completa'
        Style.TextColor = 4210688
      end
      object cxLabel2: TcxLabel
        Left = 10
        Top = 46
        Caption = 'Descri'#231#227'o Resumida (Mostra nas Grid)'
        Style.TextColor = 4210688
      end
      object cxLabel3: TcxLabel
        Left = 531
        Top = 5
        Caption = 'Grupo (Demonstrativo)'
        Style.TextColor = 4210688
      end
      object edtDescricao: TcxDBTextEdit
        Left = 10
        Top = 23
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 515
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 531
        Top = 23
        DataBinding.DataField = 'GRUPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Width = 303
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 10
        Top = 64
        DataBinding.DataField = 'RESUMO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 266
      end
      object lcxTipoCaixa: TcxDBImageComboBox
        Left = 280
        Top = 63
        RepositoryItem = dtmLookupFinanceiro.ComboTipoCaixa
        DataBinding.DataField = 'TIPO_CAIXA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Conta Banc'#225'ria'
            ImageIndex = 0
            Value = '1'
          end
          item
            Description = 'Caixa Interno'
            Value = '2'
          end
          item
            Description = 'Caixa de Aplica'#231#227'o'
            Value = '3'
          end
          item
            Description = 'Outros Caixas'
            Value = '4'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 245
      end
      object chbSituacao: TcxDBCheckBox
        Left = 529
        Top = 64
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        TabOrder = 7
        Height = 21
        Width = 59
      end
    end
    object tabGrupo: TcxTabControl
      Left = 1
      Top = 93
      Width = 851
      Height = 397
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Ativos'
        'Inativos'
        'Todos')
      OnChange = tabGrupoChange
      ClientRectBottom = 397
      ClientRectRight = 851
      ClientRectTop = 24
      object grdServico: TcxGrid
        Left = 0
        Top = 24
        Width = 851
        Height = 373
        Align = alClient
        PopupMenu = popPrincipal
        TabOrder = 0
        object grdServicoDBTableView1: TcxGridDBTableView
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdServicoDBTableView1DESCRICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Completa'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 196
          end
          object grdServicoDBTableView1Column2: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Resumida'
            DataBinding.FieldName = 'RESUMO'
            Width = 153
          end
          object grdServicoDBTableView1Column3: TcxGridDBColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'GRUPO'
            Options.Editing = False
            Options.Focusing = False
            Width = 116
          end
          object grdServicoDBTableView1PRINCIPAL: TcxGridDBColumn
            Caption = 'Principal'
            DataBinding.FieldName = 'PRINCIPAL'
            RepositoryItem = dtmLookup.Combo_SimNao
            Width = 116
          end
          object grdServicoDBTableView1Column1: TcxGridDBColumn
            Caption = 'TipoCaixa'
            DataBinding.FieldName = 'TIPO_CAIXA'
            RepositoryItem = dtmLookupFinanceiro.ComboTipoCaixa
            Options.Editing = False
            Width = 145
          end
          object grdServicoDBTableView1SITUACAO: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Width = 123
          end
        end
        object grdServicoLevel1: TcxGridLevel
          GridView = grdServicoDBTableView1
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Top = 162
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_CAIXA'#13#10'ORDER BY DESCRICAO')
    Top = 162
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 162
  end
  inherited ClientAncestral: TClientDataSet
    Top = 162
    object ClientAncestralRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
    object ClientAncestralINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 1
    end
    object ClientAncestralVALIDACAO: TBCDField
      FieldName = 'VALIDACAO'
      Precision = 18
      Size = 2
    end
    object ClientAncestralBANCO_ID: TBCDField
      FieldName = 'BANCO_ID'
      Precision = 18
      Size = 2
    end
    object ClientAncestralCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Required = True
      Precision = 18
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
    object ClientAncestralRESPONSAVEL_ID: TBCDField
      FieldName = 'RESPONSAVEL_ID'
      Precision = 18
      Size = 2
    end
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientAncestralTIPO_CAIXA: TStringField
      FieldName = 'TIPO_CAIXA'
      Size = 1
    end
    object ClientAncestralGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
  object popPrincipal: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 92
    Top = 204
    object mniDefinirCentroCustoPrincipal: TMenuItem
      Caption = 'Definir como Caixa Principal'
      ImageIndex = 45
      OnClick = mniDefinirCentroCustoPrincipalClick
    end
  end
end
