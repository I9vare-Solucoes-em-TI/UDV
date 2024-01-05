inherited frmBanco: TfrmBanco
  Left = 439
  Top = 225
  Caption = 'Bancos'
  ClientHeight = 420
  ClientWidth = 625
  OldCreateOrder = True
  ExplicitWidth = 633
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 625
    ExplicitWidth = 625
    inherited PanelBotoesBasicos: TPanel
      Width = 560
      ExplicitWidth = 560
    end
    inherited PanelBotaoFechar: TPanel
      Left = 562
      ExplicitLeft = 562
    end
  end
  inherited StatusBar: TStatusBar
    Top = 400
    Width = 625
    ExplicitTop = 400
    ExplicitWidth = 625
  end
  inherited PanelGeral: TPanel
    Width = 625
    Height = 341
    ExplicitWidth = 625
    ExplicitHeight = 341
    inherited PanelData: TPanel
      Width = 623
      Height = 63
      ExplicitWidth = 623
      ExplicitHeight = 63
      object cxLabel2: TcxLabel
        Left = 8
        Top = 11
        Caption = 'C'#243'digo:'
        Style.TextColor = clNavy
      end
      object edtCodigo: TcxDBTextEdit
        Left = 67
        Top = 10
        DataBinding.DataField = 'BANCO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 1
        Width = 72
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 35
        Caption = 'Descri'#231#227'o:'
        Style.TextColor = clNavy
      end
      object edtDescricao: TcxDBTextEdit
        Left = 67
        Top = 34
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 4
        Width = 508
      end
      object chbSituacao: TcxDBCheckBox
        Left = 148
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
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        Height = 21
        Width = 59
      end
    end
    object grdBancos: TcxGrid
      Left = 1
      Top = 72
      Width = 623
      Height = 268
      Align = alClient
      TabOrder = 1
      object grdBancosDBTableView1: TcxGridDBTableView
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
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
            Column = grdBancosDBTableView1BANCO_ID
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdBancosDBTableView1BANCO_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'BANCO_ID'
          Width = 80
        end
        object grdBancosDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 430
        end
        object grdBancosDBTableView1SITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 90
        end
      end
      object grdBancosLevel1: TcxGridLevel
        GridView = grdBancosDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 64
      Width = 623
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 63
      Control = PanelData
      ExplicitWidth = 8
    end
  end
  inherited ActionList1: TActionList
    Top = 162
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'select * from G_BANCO'#13#10'order by DESCRICAO'
    Top = 162
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 162
  end
  inherited ClientAncestral: TClientDataSet
    Top = 162
    object ClientAncestralBANCO_ID: TStringField
      FieldName = 'BANCO_ID'
      Required = True
      Size = 10
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
end
