inherited frmCadRegimeComunhao: TfrmCadRegimeComunhao
  Caption = 'Cadastro de Regime de Comunh'#227'o'
  ClientHeight = 496
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 771
    ExplicitWidth = 771
    inherited PanelBotoesBasicos: TPanel
      Width = 689
      ExplicitWidth = 689
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 691
      ExplicitLeft = 691
    end
  end
  inherited StatusBar: TStatusBar
    Top = 476
    Width = 771
    ExplicitTop = 476
    ExplicitWidth = 771
  end
  inherited PanelGeral: TPanel
    Width = 771
    Height = 420
    ExplicitWidth = 771
    ExplicitHeight = 420
    inherited PanelData: TPanel
      Width = 769
      Height = 43
      ExplicitWidth = 769
      ExplicitHeight = 43
      object cxLabel1: TcxLabel
        Left = 7
        Top = 15
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 372
        Top = 15
        Caption = 'Regime de Bens:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 63
        Top = 13
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 303
      end
      object lcxRegimeBens: TcxDBLookupComboBox
        Left = 458
        Top = 13
        DataBinding.DataField = 'TB_REGIMEBENS_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <
          item
            FieldName = 'TB_ESTADOCIVIL_ID'
          end>
        Properties.ListOptions.ShowHeader = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 241
      end
      object chbSituacao: TcxDBCheckBox
        Left = 705
        Top = 13
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
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Transparent = True
        Height = 21
        Width = 54
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 44
      Width = 769
      Height = 375
      Align = alClient
      Color = 14807280
      ParentBackground = False
      TabOrder = 1
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 767
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salTop
        MinSize = 36
        ExplicitWidth = 8
      end
      object grdBasica: TcxGrid
        Left = 1
        Top = 9
        Width = 767
        Height = 178
        Align = alTop
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object grdBasicaDBTableView1: TcxGridDBTableView
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDBCodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'TB_REGIMECOMUNHAO_ID'
            Width = 68
          end
          object cxGridBasicaDBDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 389
          end
          object grdBasicaDBTableView1Column1: TcxGridDBColumn
            Caption = 'Regime de Bens'
            DataBinding.FieldName = 'TB_REGIMEBENS_ID'
            Width = 197
          end
          object cxGridBasicaDBSituacao: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Width = 80
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 1
        Top = 187
        Width = 767
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        HotZone.ArrowHighlightColor = 14807280
        HotZone.ShadowStartColor = 14807280
        AlignSplitter = salTop
        Control = grdBasica
        Color = 14807280
        ParentColor = False
        ExplicitWidth = 8
      end
      inline fmeEditorSimples: TfmeEditorSimples
        Left = 1
        Top = 195
        Width = 767
        Height = 179
        Align = alClient
        TabOrder = 3
        ExplicitLeft = 1
        ExplicitTop = 195
        ExplicitWidth = 767
        ExplicitHeight = 179
        inherited wptFerramentas: TWPToolBar
          Width = 767
          ExplicitWidth = 767
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 767
          ExplicitWidth = 767
        end
        inherited wptTexto: TWPRichText
          Width = 767
          Height = 124
          OnChange = fmeEditorSimpleswptTextoChange
          ExplicitWidth = 767
          ExplicitHeight = 124
        end
        inherited popMinuta: TPopupMenu
          object MarcacaomAnual1: TMenuItem
            Caption = 'Marca'#231#227'o Manual'
            ShortCut = 16461
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 479
    Top = 233
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM G_TB_REGIMECOMUNHAO'#13#10'ORDER BY DESCRICAO')
    Left = 509
    Top = 233
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 541
    Top = 233
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 573
    Top = 233
    object ClientAncestralTB_REGIMECOMUNHAO_ID: TBCDField
      FieldName = 'TB_REGIMECOMUNHAO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralTB_REGIMEBENS_ID: TBCDField
      FieldName = 'TB_REGIMEBENS_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 605
    Top = 233
  end
end
