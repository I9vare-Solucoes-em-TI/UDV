inherited frmMedidaTipo: TfrmMedidaTipo
  Left = 204
  Top = 235
  BorderStyle = bsSingle
  Caption = 'Tipo de Medida'
  ClientHeight = 565
  ClientWidth = 715
  OldCreateOrder = True
  ExplicitWidth = 721
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 715
    ExplicitWidth = 664
    inherited PanelBotoesBasicos: TPanel
      Width = 633
      ExplicitWidth = 582
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 324
          ExplicitLeft = 324
        end
        inherited cxBtnCancelar: TcxButton
          Left = 260
          ExplicitLeft = 260
        end
        inherited cxBtnGravar: TcxButton
          Left = 196
          ExplicitLeft = 196
        end
        inherited cxBtnExcluir: TcxButton
          Left = 132
          ExplicitLeft = 132
        end
        inherited cxBtnAlterar: TcxButton
          Left = 68
          ExplicitLeft = 68
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 635
      ExplicitLeft = 584
    end
  end
  inherited StatusBar: TStatusBar
    Top = 545
    Width = 715
    ExplicitWidth = 664
  end
  inherited PanelGeral: TPanel
    Width = 715
    Height = 489
    Color = clWindow
    ExplicitWidth = 664
    inherited PanelData: TPanel
      Width = 713
      Height = 56
      Color = clWindow
      ExplicitWidth = 703
      ExplicitHeight = 56
      object edtDescricao: TcxDBTextEdit
        Left = 10
        Top = 28
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 0
        Width = 307
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 321
        Top = 28
        DataBinding.DataField = 'SIGLA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 1
        Width = 115
      end
      object lblDescricao: TcxLabel
        Left = 10
        Top = 10
        Caption = 'Descri'#231#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lblSigla: TcxLabel
        Left = 321
        Top = 10
        Caption = 'Sigla'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 57
      Width = 713
      Height = 431
      Align = alClient
      TabOrder = 1
      ExplicitTop = 39
      ExplicitWidth = 662
      ExplicitHeight = 306
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
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.InfoPanel.Width = 80
        Navigator.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glVertical
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
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM G_MEDIDA_TIPO'#13#10'ORDER BY MEDIDA_TIPO_ID')
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
    object ClientAncestralMEDIDA_TIPO_ID: TBCDField
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
