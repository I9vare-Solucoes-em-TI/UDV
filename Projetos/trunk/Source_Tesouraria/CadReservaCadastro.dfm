inherited frmCadReservaCadastro: TfrmCadReservaCadastro
  Caption = 'Cadastro de Grupos de Reserva/Provis'#227'o'
  ClientHeight = 482
  ClientWidth = 760
  Color = 16247513
  ExplicitWidth = 776
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 760
    ExplicitWidth = 760
    inherited PanelBotoesBasicos: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 680
      ExplicitLeft = 680
    end
  end
  inherited StatusBar: TStatusBar
    Top = 462
    Width = 760
    ExplicitTop = 462
    ExplicitWidth = 760
  end
  inherited PanelGeral: TPanel
    Width = 760
    Height = 406
    ExplicitWidth = 760
    ExplicitHeight = 406
    inherited PanelData: TPanel
      Width = 758
      Height = 68
      ExplicitWidth = 758
      ExplicitHeight = 68
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 756
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
        ClientRectBottom = 59
        ClientRectLeft = 3
        ClientRectRight = 749
        ClientRectTop = 27
        object pnlDados: TPanel
          Left = 3
          Top = 27
          Width = 746
          Height = 32
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object cxLabel1: TcxLabel
            Left = 11
            Top = 11
            Caption = 'Descri'#231#227'o:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 585
            Top = 11
            Caption = 'Ordem:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object edtDescricao: TcxDBTextEdit
            Left = 66
            Top = 9
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 2
            Width = 513
          end
          object edtOrdem: TcxDBTextEdit
            Left = 629
            Top = 9
            DataBinding.DataField = 'ORDEM'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 3
            OnKeyPress = edtOrdemKeyPress
            Width = 51
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
            TabOrder = 4
            Height = 21
            Width = 59
          end
        end
      end
    end
    object tabGrupo: TcxTabControl
      Left = 1
      Top = 69
      Width = 758
      Height = 336
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Ativos'
        'Inativos'
        'Todos')
      OnChange = tabGrupoChange
      ClientRectBottom = 336
      ClientRectRight = 758
      ClientRectTop = 24
      object grdBasica: TcxGrid
        Left = 0
        Top = 24
        Width = 758
        Height = 312
        Align = alClient
        TabOrder = 0
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
          object cxGridPesquisaColumn1: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 450
          end
          object cxGridPesquisaColumn2: TcxGridDBColumn
            Caption = 'Ordem'
            DataBinding.FieldName = 'ORDEM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Width = 71
          end
          object cxGridPesquisaColumn3: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Width = 235
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
      'SELECT *'#13#10'FROM T_RESERVA'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID '#13#10'     ' +
      'AND BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DESCRICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
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
    object ClientAncestralRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object ClientAncestralORDEM: TBCDField
      FieldName = 'ORDEM'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 507
    Top = 242
  end
end
