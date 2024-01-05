inherited frmConversao: TfrmConversao
  Left = 226
  Top = 292
  Caption = 'Convers'#227'o de Medidas'
  ClientHeight = 239
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 239
    inherited Shape1: TShape
      Height = 227
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 641
      Height = 227
      Align = alClient
      Caption = ' Convers'#227'o de Medidas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 637
        Height = 50
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 0
        object Label1: TLabel
          Left = 523
          Top = 8
          Width = 35
          Height = 13
          Caption = 'Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 371
          Top = 8
          Width = 74
          Height = 13
          Caption = 'Tipo da Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 11
          Top = 8
          Width = 149
          Height = 13
          Caption = 'Designa'#231#227'o da Medida Agr'#225'ria '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxCurrencyEdit1: TcxCurrencyEdit
          Left = 520
          Top = 22
          Width = 65
          Height = 21
          Properties.ValidateOnEnter = True
          TabOrder = 0
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 368
          Top = 22
          Width = 145
          Height = 21
          Properties.ListColumns = <>
          TabOrder = 1
        end
        object cxDBLookupComboBox2: TcxDBLookupComboBox
          Left = 8
          Top = 22
          Width = 353
          Height = 21
          Properties.ListColumns = <>
          TabOrder = 2
        end
      end
      object cxGrid2: TcxGrid
        Left = 2
        Top = 65
        Width = 637
        Height = 160
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        RootLevelStyles.TabsBackground = dtmControles.cxStyle1
        object cxGridDBTableView4: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
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
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Tipo da Medida'
            DataBinding.FieldName = 'calc_NomeRepresentante'
            Width = 165
          end
          object cxGridDBColumn14: TcxGridDBColumn
            Caption = 'Medida em 1 Alqueire'
            DataBinding.FieldName = 'ATO_PARTETIPO_ID'
            RepositoryItem = dtmLookupTab.Lista_Ato_ParteTipo
            Width = 133
          end
          object cxGridDBTableView4DBColumn1: TcxGridDBColumn
            Caption = 'Medida Base de C'#225'lculo'
            Width = 154
          end
          object cxGridDBTableView4DBColumn2: TcxGridDBColumn
            Caption = 'Medida Convertida'
            Width = 141
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
    end
  end
end
