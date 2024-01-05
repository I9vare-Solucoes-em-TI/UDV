inherited frmCadGrupoContabil: TfrmCadGrupoContabil
  Caption = 'Grupo Contabil'
  ClientHeight = 557
  ClientWidth = 825
  Color = 16247513
  ExplicitWidth = 841
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 825
    ExplicitWidth = 825
    inherited PanelBotoesBasicos: TPanel
      Width = 743
      ExplicitWidth = 743
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 745
      ExplicitLeft = 745
    end
  end
  inherited StatusBar: TStatusBar
    Top = 537
    Width = 825
    ExplicitTop = 537
    ExplicitWidth = 825
  end
  inherited PanelGeral: TPanel
    Width = 825
    Height = 481
    ExplicitWidth = 825
    ExplicitHeight = 481
    inherited PanelData: TPanel
      Width = 823
      Height = 99
      ExplicitWidth = 823
      ExplicitHeight = 99
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 821
        Height = 97
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
        ExplicitHeight = 108
        ClientRectBottom = 90
        ClientRectLeft = 3
        ClientRectRight = 814
        ClientRectTop = 27
        object pnlDados: TPanel
          Left = 3
          Top = 27
          Width = 811
          Height = 63
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          ExplicitHeight = 73
          object cxLabel2: TcxLabel
            Left = 7
            Top = 13
            Caption = 'Tipo da Opera'#231#227'o:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel1: TcxLabel
            Left = 7
            Top = 40
            Caption = 'Descri'#231#227'o:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 274
            Top = 13
            Caption = 'Ordem:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object icxTipoOperacao: TcxDBImageComboBox
            Left = 102
            Top = 11
            RepositoryItem = dtmLookup.Combo_OperacaoContabil
            DataBinding.DataField = 'OPERACAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 3
            Width = 163
          end
          object edtOrdem: TcxDBTextEdit
            Left = 316
            Top = 11
            DataBinding.DataField = 'ORDEM'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 4
            OnKeyPress = edtOrdemKeyPress
            Width = 51
          end
          object chbSituacao: TcxDBCheckBox
            Left = 375
            Top = 11
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
            TabOrder = 5
            Height = 21
            Width = 60
          end
          object edtDescricao: TcxDBTextEdit
            Left = 102
            Top = 38
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 6
            Width = 514
          end
        end
      end
    end
    object tabGrupo: TcxTabControl
      Left = 1
      Top = 100
      Width = 823
      Height = 380
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 6
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Ativo'
        'Inativo'
        'Todos')
      OnChange = tabGrupoChange
      ExplicitTop = 111
      ExplicitHeight = 369
      ClientRectBottom = 380
      ClientRectRight = 823
      ClientRectTop = 24
      object grdBasica: TcxGrid
        Left = 0
        Top = 24
        Width = 823
        Height = 356
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        ExplicitHeight = 345
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
          object cxGridPesquisaColumn4: TcxGridDBColumn
            Caption = 'Ordem'
            DataBinding.FieldName = 'ORDEM'
            Options.Editing = False
            Options.Focusing = False
            Width = 61
          end
          object cxGridPesquisaColumn1: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 425
          end
          object cxGridPesquisaColumn2: TcxGridDBColumn
            Caption = 'Opera'#231#227'o'
            DataBinding.FieldName = 'OPERACAO'
            RepositoryItem = dtmLookup.Combo_OperacaoContabil
            Width = 105
          end
          object cxGridPesquisaColumn3: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Width = 121
          end
          object cxGridPesquisaColumn5: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'TIPO'
            RepositoryItem = dtmLookup.Combo_EntradaSaida
            Visible = False
            GroupIndex = 0
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = cxGridPesquisa
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 381
    Top = 242
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_CONTABIL_GRUPO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID ' +
      #13#10'     AND BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DE' +
      'SCRICAO')
    Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
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
    Left = 477
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
    object ClientAncestralCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Visible = False
      Precision = 20
      Size = 2
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object ClientAncestralORDEM: TBCDField
      FieldName = 'ORDEM'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 507
    Top = 242
  end
end
