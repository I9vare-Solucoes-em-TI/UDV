inherited frmCadGrupoContabil: TfrmCadGrupoContabil
  Caption = 'Grupo Contabil'
  ClientHeight = 486
  ClientWidth = 922
  Color = 16247513
  ExplicitWidth = 938
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 922
    ExplicitWidth = 922
    inherited PanelBotoesBasicos: TPanel
      Width = 840
      ExplicitWidth = 840
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 842
      ExplicitLeft = 842
    end
  end
  inherited StatusBar: TStatusBar
    Top = 466
    Width = 922
    ExplicitTop = 466
    ExplicitWidth = 922
  end
  inherited PanelGeral: TPanel
    Width = 922
    Height = 410
    ExplicitWidth = 922
    ExplicitHeight = 410
    inherited PanelData: TPanel
      Width = 920
      Height = 68
      ExplicitWidth = 920
      ExplicitHeight = 68
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 918
        Height = 66
        Align = alClient
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.TabIndex = 0
        Properties.Tabs.Strings = (
          '')
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        OnChange = tabBalanceteChange
        OnChanging = tabBalanceteChanging
        ExplicitLeft = 2
        ExplicitTop = 3
        ClientRectBottom = 65
        ClientRectLeft = 1
        ClientRectRight = 917
        ClientRectTop = 21
        object pnlDados: TPanel
          Left = 1
          Top = 21
          Width = 916
          Height = 44
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object cxLabel2: TcxLabel
            Left = 7
            Top = 11
            Caption = 'Tipo da Opera'#231#227'o:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object icxTipoOperacao: TcxDBImageComboBox
            Left = 102
            Top = 9
            RepositoryItem = dtmLookupContabil.Combo_OperacaoContabil
            DataBinding.DataField = 'OPERACAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 163
          end
          object edtDescricao: TcxDBTextEdit
            Left = 326
            Top = 9
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 2
            Width = 355
          end
          object chbSituacao: TcxDBCheckBox
            Left = 686
            Top = 9
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
            TabOrder = 3
            Height = 21
            Width = 59
          end
          object cxLabel1: TcxLabel
            Left = 271
            Top = 11
            Caption = 'Descri'#231#227'o:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 743
            Top = 9
            RepositoryItem = dtmLookup.Check_SimNao
            AutoSize = False
            Caption = 'Item Balancete Global'
            DataBinding.DataField = 'TIPO_GLOBAL'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayGrayed = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.TextColor = clGray
            TabOrder = 5
            Transparent = True
            Height = 21
            Width = 163
          end
        end
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 69
      Width = 920
      Height = 340
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
          Width = 317
        end
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Opera'#231#227'o'
          DataBinding.FieldName = 'OPERACAO'
          RepositoryItem = dtmLookupContabil.Combo_OperacaoContabil
          Width = 150
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 85
        end
        object cxGridPesquisaColumn5: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          RepositoryItem = dtmLookupContabil.Combo_EntradaSaida
          Visible = False
          GroupIndex = 0
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = cxGridPesquisa
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 381
    Top = 242
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_CONTABIL_GRUPO'#13#10'WHERE ((BALANCETE_GRUPO_ID = :B' +
      'ALANCETE_GRUPO_ID)'#13#10'      OR (TIPO_GLOBAL = '#39'S'#39'))'#13#10'ORDER BY DESC' +
      'RICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Left = 411
    Top = 242
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 443
    Top = 242
  end
  inherited ClientAncestral: TClientDataSet
    Left = 475
    Top = 242
    object ClientAncestralCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object ClientAncestralTIPO_GLOBAL: TStringField
      FieldName = 'TIPO_GLOBAL'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 507
    Top = 242
  end
end
