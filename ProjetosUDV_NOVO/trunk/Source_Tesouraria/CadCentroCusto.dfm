inherited frmCadCentroCusto: TfrmCadCentroCusto
  Caption = 'Centro de Custos'
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
      ExplicitTop = 2
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
      Height = 88
      ExplicitWidth = 758
      ExplicitHeight = 88
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 756
        Height = 86
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
        ClientRectBottom = 85
        ClientRectLeft = 1
        ClientRectRight = 755
        ClientRectTop = 21
        object pnlDados: TPanel
          Left = 1
          Top = 21
          Width = 754
          Height = 64
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object edtDescricao: TcxDBTextEdit
            Left = 66
            Top = 9
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 0
            Width = 499
          end
          object chbSituacao: TcxDBCheckBox
            Left = 658
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
            TabOrder = 1
            Height = 21
            Width = 59
          end
          object cxLabel1: TcxLabel
            Left = 11
            Top = 11
            Caption = 'Descri'#231#227'o:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object chxPrincipal: TcxDBCheckBox
            Left = 574
            Top = 11
            RepositoryItem = dtmLookup.Check_SimNao
            AutoSize = False
            Caption = 'Principal'
            DataBinding.DataField = 'PRINCIPAL'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Properties.DisplayChecked = 'A'
            Properties.DisplayGrayed = 'I'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'A'
            Properties.ValueUnchecked = 'I'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.TextColor = clGray
            TabOrder = 3
            Height = 21
            Width = 87
          end
        end
        object cxLabel8: TcxLabel
          Left = 11
          Top = 62
          Caption = 
            '* Para modificar o Centro de Custo principal, pressione com o bo' +
            't'#227'o direito do mouse no item desejado.'
          ParentColor = False
          ParentFont = False
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = clBlue
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 89
      Width = 758
      Height = 316
      Align = alClient
      PopupMenu = popCentroCusto
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
        object cxGridPesquisaColumn1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 519
        end
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Principal'
          DataBinding.FieldName = 'PRINCIPAL'
          RepositoryItem = dtmLookup.Combo_SimNao
          Width = 117
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 120
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
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT *'#13#10'FROM T_CENTRO_CUSTO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID '#13#10 +
      '     AND BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DESC' +
      'RICAO'
    Params = <
      item
        DataType = ftFMTBcd
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
    Left = 475
    Top = 242
    object ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
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
  object popCentroCusto: TPopupMenu
    Left = 380
    Top = 284
    object mniDefinirCentroCustoPrincipal: TMenuItem
      Caption = 'Definir como Centro de Custo Principal'
      OnClick = mniDefinirCentroCustoPrincipalClick
    end
  end
end
