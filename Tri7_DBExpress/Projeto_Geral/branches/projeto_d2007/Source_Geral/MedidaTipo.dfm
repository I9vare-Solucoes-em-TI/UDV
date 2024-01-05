inherited frmMedidaTipo: TfrmMedidaTipo
  Left = 204
  Top = 235
  Caption = 'Tipo de Medida'
  ClientWidth = 664
  OldCreateOrder = True
  ExplicitWidth = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 664
    ExplicitWidth = 664
    inherited PanelBotoesBasicos: TPanel
      Width = 582
      ExplicitWidth = 582
    end
    inherited PanelBotaoFechar: TPanel
      Left = 584
      ExplicitLeft = 584
    end
  end
  inherited StatusBar: TStatusBar
    Width = 664
    ExplicitWidth = 664
  end
  inherited PanelGeral: TPanel
    Width = 664
    ExplicitWidth = 664
    inherited PanelData: TPanel
      Width = 662
      Height = 38
      ExplicitWidth = 662
      ExplicitHeight = 38
      object cxLabel1: TcxLabel
        Left = 5
        Top = 10
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 62
        Top = 8
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 0
        Width = 251
      end
      object cxLabel2: TcxLabel
        Left = 320
        Top = 10
        Caption = 'Sigla:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 350
        Top = 8
        DataBinding.DataField = 'SIGLA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 1
        Width = 115
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 39
      Width = 662
      Height = 306
      Align = alClient
      TabOrder = 1
      object grdBasicaDBTableView1: TcxGridDBTableView
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
            FieldName = 'DESCRICAO'
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
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'MEDIDA_TIPO_ID'
          Width = 68
        end
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 364
        end
        object cxGridBasicaDbSigla: TcxGridDBColumn
          Caption = 'Sigla'
          DataBinding.FieldName = 'SIGLA'
          Width = 159
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = grdBasicaDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 453
    Top = 186
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM G_MEDIDA_TIPO'#13#10'ORDER BY MEDIDA_TIPO_ID'
    Left = 483
    Top = 186
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 515
    Top = 186
  end
  inherited ClientAncestral: TClientDataSet
    Left = 547
    Top = 186
    object ClientAncestralMEDIDA_TIPO_ID: TFMTBCDField
      FieldName = 'MEDIDA_TIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 10
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 579
    Top = 186
  end
end
