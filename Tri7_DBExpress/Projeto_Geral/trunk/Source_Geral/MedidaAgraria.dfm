inherited frmMedidaAgraria: TfrmMedidaAgraria
  Left = 164
  Top = 197
  Caption = 'Medidas Agr'#225'rias'
  ClientWidth = 782
  OldCreateOrder = True
  ExplicitWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 782
    ExplicitWidth = 782
    inherited PanelBotoesBasicos: TPanel
      Width = 700
      ExplicitWidth = 700
    end
    inherited PanelBotaoFechar: TPanel
      Left = 702
      ExplicitLeft = 702
    end
  end
  inherited StatusBar: TStatusBar
    Width = 782
    ExplicitWidth = 782
  end
  inherited PanelGeral: TPanel
    Width = 782
    ExplicitWidth = 782
    inherited PanelData: TPanel
      Width = 780
      Height = 38
      ExplicitWidth = 780
      ExplicitHeight = 38
      object cxLabel1: TcxLabel
        Left = 8
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
        TabOrder = 1
        Width = 411
      end
      object chbSituacao: TcxDBCheckBox
        Left = 479
        Top = 9
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
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Transparent = True
        Height = 21
        Width = 59
      end
    end
    object grdMedidaItem: TcxGrid
      Left = 425
      Top = 39
      Width = 496
      Height = 306
      Align = alLeft
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object grdMedidaItemDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dtsMedidaItem
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'MEDIDA_AGRARIA_ID'
            Column = cxGridBasicaDBTipoMedida
          end>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Clique aqui para adicionar um novo registro'
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.Appending = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBTipoMedida: TcxGridDBColumn
          Caption = 'Tipo de Medida'
          DataBinding.FieldName = 'MEDIDA_TIPO_ID'
          RepositoryItem = dtmLookup.Lista_MedidaTipoDescricao
          Width = 170
        end
        object cxGridBasicaDBValor: TcxGridDBColumn
          Caption = 'Valor (ref. a um Alqueire)'
          DataBinding.FieldName = 'VALOR'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Width = 171
        end
      end
      object grdMedidaItemLevel1: TcxGridLevel
        GridView = grdMedidaItemDBTableView1
      end
    end
    object grdMedidaAgraria: TcxGrid
      Left = 1
      Top = 39
      Width = 424
      Height = 306
      Align = alLeft
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView1: TcxGridDBTableView
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
            FieldName = 'DESCRICAO'
            Column = cxGridDBColumn1
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
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'MEDIDA_AGRARIA_ID'
          Width = 68
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 261
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 76
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 445
    Top = 26
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM G_MEDIDA_AGRARIA'#13#10'ORDER BY MEDIDA_AGRARIA_ID'
    Left = 475
    Top = 26
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 507
    Top = 26
  end
  inherited ClientAncestral: TClientDataSet
    Left = 539
    Top = 26
    object ClientAncestralMEDIDA_AGRARIA_ID: TFMTBCDField
      FieldName = 'MEDIDA_AGRARIA_ID'
      Required = True
      Precision = 15
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
  end
  inherited SourceAncestral: TDataSource
    Left = 571
    Top = 26
  end
  object dtsMedidaItem: TDataSource
    DataSet = sqlMedidaItem
    Left = 608
    Top = 27
  end
  object sqlMedidaItem: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT * '#13#10'FROM G_MEDIDA_ITEM'#13#10'WHERE MEDIDA_AGRARIA_ID = :MEDIDA' +
      '_AGRARIA_ID'#13#10'ORDER BY MEDIDA_ITEM_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'MEDIDA_AGRARIA_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'MEDIDA_AGRARIA_ID'
    MasterFields = 'MEDIDA_AGRARIA_ID'
    MasterSource = SourceAncestral
    PacketRecords = 0
    Params = <>
    AfterPost = sqlMedidaItemAfterPost
    OnNewRecord = sqlMedidaItemNewRecord
    Left = 640
    Top = 27
    object sqlMedidaItemMEDIDA_ITEM_ID: TFMTBCDField
      FieldName = 'MEDIDA_ITEM_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlMedidaItemVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object sqlMedidaItemMEDIDA_AGRARIA_ID: TFMTBCDField
      FieldName = 'MEDIDA_AGRARIA_ID'
      Precision = 15
      Size = 2
    end
    object sqlMedidaItemMEDIDA_TIPO_ID: TFMTBCDField
      FieldName = 'MEDIDA_TIPO_ID'
      Precision = 15
      Size = 2
    end
  end
end
