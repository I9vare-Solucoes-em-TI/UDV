inherited frmCadPessoaFuncao: TfrmCadPessoaFuncao
  Caption = 'Pessoa Fun'#231#227'o'
  ClientHeight = 425
  ClientWidth = 657
  ExplicitWidth = 673
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 657
    ExplicitWidth = 657
    inherited PanelBotoesBasicos: TPanel
      Width = 575
      ExplicitWidth = 575
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 577
      ExplicitLeft = 577
    end
  end
  inherited StatusBar: TStatusBar
    Top = 405
    Width = 657
    ExplicitTop = 405
    ExplicitWidth = 657
  end
  inherited PanelGeral: TPanel
    Width = 657
    Height = 349
    ExplicitWidth = 657
    ExplicitHeight = 349
    inherited PanelData: TPanel
      Width = 655
      Height = 50
      ExplicitWidth = 655
      ExplicitHeight = 50
      object cxLabel1: TcxLabel
        Left = 9
        Top = 4
        Caption = 'Descri'#231#227'o'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object lblSigla: TcxLabel
        Left = 367
        Top = 5
        Caption = 'Valor Hora'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object edtDescricao: TcxDBTextEdit
        Left = 9
        Top = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 352
      end
      object edtValor: TcxDBCurrencyEdit
        Left = 367
        Top = 21
        DataBinding.DataField = 'VALOR'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 121
      end
      object chbSituacao: TcxDBCheckBox
        Left = 491
        Top = 22
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
        Style.StyleController = dtmControles.cxEditStyleCheckBox
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 21
        Width = 59
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 51
      Width = 655
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
        object cxGridPesquisaColumn1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 396
        end
        object cxGridPesquisaColumn4: TcxGridDBColumn
          Caption = 'Valor Hora'
          DataBinding.FieldName = 'SIGLA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 200
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 189
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
    CommandText = 'SELECT *'#13#10'FROM J_PESSOA_FUNCAO'#13#10'ORDER BY DESCRICAO'
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
    object ClientAncestralPESSOA_FUNCAO_ID: TFMTBCDField
      FieldName = 'PESSOA_FUNCAO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object ClientAncestralVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 215
    Top = 214
  end
end
