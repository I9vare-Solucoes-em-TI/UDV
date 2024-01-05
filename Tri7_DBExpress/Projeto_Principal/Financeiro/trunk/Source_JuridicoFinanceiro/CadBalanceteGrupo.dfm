inherited frmCadGrupoBalancete: TfrmCadGrupoBalancete
  Caption = 'Grupo de Balancete'
  ClientHeight = 569
  ClientWidth = 850
  ExplicitWidth = 866
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 850
    ExplicitWidth = 850
    inherited PanelBotoesBasicos: TPanel
      Width = 762
      ExplicitWidth = 762
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 764
      ExplicitLeft = 764
    end
  end
  inherited StatusBar: TStatusBar
    Top = 548
    Width = 850
    ExplicitTop = 548
    ExplicitWidth = 850
  end
  inherited PanelGeral: TPanel
    Width = 850
    Height = 488
    ExplicitWidth = 850
    ExplicitHeight = 488
    inherited PanelData: TPanel
      Width = 848
      Height = 57
      ExplicitWidth = 848
      ExplicitHeight = 57
      object cxLabel1: TcxLabel
        Left = 10
        Top = 11
        Caption = 'Descri'#231#227'o:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object cxLabel8: TcxLabel
        Left = 10
        Top = 31
        Caption = 
          '* Para modificar o balancete principal, clique com o bot'#227'o direi' +
          'to do mouse no item desejado.'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Times New Roman'
        Style.Font.Style = []
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lblSigla: TcxLabel
        Left = 579
        Top = 11
        Caption = 'Sigla:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object chxPrincipal: TcxDBCheckBox
        Left = 661
        Top = 10
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
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 3
        Height = 22
        Width = 94
      end
      object chbSituacao: TcxDBCheckBox
        Left = 743
        Top = 10
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
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 22
        Width = 64
      end
      object edtDescricao: TcxDBTextEdit
        Left = 72
        Top = 10
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 501
      end
      object edtSigla: TcxDBTextEdit
        Left = 612
        Top = 10
        DataBinding.DataField = 'SIGLA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 43
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 58
      Width = 848
      Height = 177
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = popBalancete
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
          Width = 466
        end
        object cxGridPesquisaColumn4: TcxGridDBColumn
          Caption = 'Sigla'
          DataBinding.FieldName = 'SIGLA'
          Width = 66
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Principal'
          DataBinding.FieldName = 'PRINCIPAL'
          Width = 113
        end
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 76
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = cxGridPesquisa
      end
    end
    inline fmeEditorSimples1: TfmeEditorSimples
      Left = 1
      Top = 243
      Width = 848
      Height = 244
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 243
      ExplicitWidth = 848
      ExplicitHeight = 244
      inherited wptFerramentas: TWPToolbar
        Width = 848
        Height = 30
        ExplicitWidth = 848
        ExplicitHeight = 30
      end
      inherited WPReguaHorizontal: TWPRuler
        Top = 30
        Width = 848
        ExplicitTop = 30
        ExplicitWidth = 848
      end
      inherited wptTexto: TWPRichText
        Top = 56
        Width = 848
        Height = 188
        ExplicitTop = 56
        ExplicitWidth = 848
        ExplicitHeight = 188
      end
    end
    object splGrdBasica: TcxSplitter
      Left = 1
      Top = 235
      Width = 848
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      Control = grdBasica
    end
  end
  inherited ActionList1: TActionList
    Left = 89
    Top = 214
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM J_BALANCETE_GRUPO'#13#10'ORDER BY DESCRICAO'
    Left = 119
    Top = 214
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 151
    Top = 214
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 183
    Top = 214
    object ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
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
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
    object ClientAncestralCABECALHO: TBlobField
      FieldName = 'CABECALHO'
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 215
    Top = 214
  end
  object popBalancete: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 84
    Top = 256
    object mniDefinircomoBalanceteprincipal: TMenuItem
      Caption = 'Definir como Balancete Principal'
      ImageIndex = 45
      OnClick = mniDefinircomoBalanceteprincipalClick
    end
  end
end
