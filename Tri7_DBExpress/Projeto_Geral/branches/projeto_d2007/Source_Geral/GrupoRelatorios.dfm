inherited frmGrupoRelatorio: TfrmGrupoRelatorio
  Caption = 'Grupo de Relat'#243'rios'
  ClientWidth = 646
  OldCreateOrder = True
  ExplicitWidth = 662
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 646
    ExplicitWidth = 646
    inherited PanelBotoesBasicos: TPanel
      Width = 564
      ExplicitWidth = 564
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 566
      ExplicitLeft = 566
    end
  end
  inherited StatusBar: TStatusBar
    Width = 646
    ExplicitWidth = 646
  end
  inherited PanelGeral: TPanel
    Width = 646
    ExplicitWidth = 646
    inherited PanelData: TPanel
      Width = 644
      Height = 61
      ExplicitWidth = 644
      ExplicitHeight = 61
      object cxLabel2: TcxLabel
        Left = 8
        Top = 11
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 34
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtCodigo: TcxDBTextEdit
        Left = 67
        Top = 9
        DataBinding.DataField = 'GRUPO_RELATORIO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 72
      end
      object edtDescricao: TcxDBTextEdit
        Left = 67
        Top = 33
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 508
      end
    end
    object grdGrupoRelatorio: TcxGrid
      Left = 1
      Top = 70
      Width = 644
      Height = 275
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object grdGrupoRelatorioDBTableView1: TcxGridDBTableView
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
            FieldName = 'GRUPO_RELATORIO_ID'
            Column = grdGrupoRelatorioDBTableView1GRUPO_RELATORIO_ID
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
        object grdGrupoRelatorioDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'GRUPO_RELATORIO_ID'
          Width = 80
        end
        object grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 400
        end
      end
      object grdGrupoRelatorioLevel1: TcxGridLevel
        GridView = grdGrupoRelatorioDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 62
      Width = 644
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 60
      Control = PanelData
    end
  end
  inherited ActionList1: TActionList
    Top = 162
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'select *  from G_GRUPO_RELATORIO'#13#10'where SISTEMA_ID =  :SISTEMA_I' +
      'D'#13#10'order by DESCRICAO')
    Params = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Top = 162
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 162
  end
  inherited ClientAncestral: TClientDataSet
    Top = 162
    object ClientAncestralGRUPO_RELATORIO_ID: TBCDField
      FieldName = 'GRUPO_RELATORIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
end
