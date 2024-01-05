inherited frmFeriado: TfrmFeriado
  Left = 10
  Top = 137
  Caption = 'Cadastro de Feriados'
  ClientHeight = 474
  ClientWidth = 804
  OldCreateOrder = True
  ExplicitWidth = 820
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 804
    ExplicitWidth = 804
    inherited PanelBotoesBasicos: TPanel
      Width = 722
      ExplicitWidth = 722
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 724
      ExplicitLeft = 724
    end
  end
  inherited StatusBar: TStatusBar
    Top = 454
    Width = 804
    ExplicitTop = 403
    ExplicitWidth = 804
  end
  inherited PanelGeral: TPanel
    Width = 804
    Height = 398
    ExplicitWidth = 804
    ExplicitHeight = 398
    inherited PanelData: TPanel
      Top = 69
      Width = 802
      Height = 0
      ExplicitTop = 61
      ExplicitWidth = 802
      ExplicitHeight = 0
    end
    object pnlDadosFeriado: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 68
      Align = alTop
      BevelInner = bvLowered
      Color = 14807280
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      object cxLabel1: TcxLabel
        Left = 12
        Top = 41
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel2: TcxLabel
        Left = 12
        Top = 13
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel3: TcxLabel
        Left = 128
        Top = 13
        Caption = 'Tipo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtCodigo: TcxDBTextEdit
        Left = 68
        Top = 12
        DataBinding.DataField = 'FERIADO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 56
      end
      object edtNome: TcxDBTextEdit
        Left = 67
        Top = 38
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 8
        Width = 466
      end
      object chbSituacao: TcxDBCheckBox
        Left = 537
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
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 9
        Height = 21
        Width = 60
      end
      object edtTipo: TcxDBImageComboBox
        Left = 159
        Top = 12
        DataBinding.DataField = 'TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Fixo'
            ImageIndex = 0
            Value = 'F'
          end
          item
            Description = 'Vari'#225'vel'
            Value = 'V'
          end>
        Properties.OnEditValueChanged = edtTipoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Width = 118
      end
      object cxLabel4: TcxLabel
        Left = 285
        Top = 13
        Caption = 'Dia:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 367
        Top = 13
        Caption = 'M'#234's:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel6: TcxLabel
        Left = 454
        Top = 13
        Caption = 'Ano:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtAno: TcxDBTextEdit
        Left = 480
        Top = 12
        DataBinding.DataField = 'ANO'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Properties.MaxLength = 4
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        Width = 51
      end
      object edtDia: TcxDBComboBox
        Left = 309
        Top = 12
        DataBinding.DataField = 'DIA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31')
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 51
      end
      object edtMes: TcxDBComboBox
        Left = 395
        Top = 12
        DataBinding.DataField = 'MES'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        Width = 51
      end
    end
    object grdFeriado: TcxGrid
      Left = 1
      Top = 69
      Width = 802
      Height = 328
      Align = alClient
      TabOrder = 2
      ExplicitLeft = -78
      ExplicitTop = 125
      ExplicitHeight = 285
      object grdFeriadoDBTableView1: TcxGridDBTableView
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
            FieldName = 'FERIADO_ID'
            Column = grdFeriadoDBTableView1FERIADO_ID
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
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdFeriadoDBTableView1FERIADO_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'FERIADO_ID'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 80
        end
        object grdFeriadoDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 350
        end
        object grdFeriadoDBTableView1TIPO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Fixo'
              ImageIndex = 0
              Value = 'F'
            end
            item
              Description = 'Vari'#225'vel'
              Value = 'V'
            end>
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 80
        end
        object grdFeriadoDBTableView1DIA: TcxGridDBColumn
          Caption = 'Dia'
          DataBinding.FieldName = 'DIA'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 45
        end
        object grdFeriadoDBTableView1MES: TcxGridDBColumn
          Caption = 'M'#234's'
          DataBinding.FieldName = 'MES'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 45
        end
        object grdFeriadoDBTableView1ANO: TcxGridDBColumn
          Caption = 'Ano'
          DataBinding.FieldName = 'ANO'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 60
        end
        object grdFeriadoDBTableView1SITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              ImageIndex = 0
              Value = 'A'
            end
            item
              ImageIndex = 1
              Value = 'I'
            end>
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Options.Focusing = False
          Width = 70
        end
      end
      object grdFeriadoLevel1: TcxGridLevel
        GridView = grdFeriadoDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 306
    Top = 182
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT * FROM G_FERIADO')
    Left = 442
    Top = 154
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 443
    Top = 209
  end
  inherited ClientAncestral: TClientDataSet
    Left = 441
    Top = 265
    object ClientAncestralFERIADO_ID: TBCDField
      FieldName = 'FERIADO_ID'
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
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralDIA: TBCDField
      FieldName = 'DIA'
      Precision = 20
      Size = 2
    end
    object ClientAncestralMES: TBCDField
      FieldName = 'MES'
      Precision = 20
      Size = 2
    end
    object ClientAncestralANO: TBCDField
      FieldName = 'ANO'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 441
    Top = 323
  end
end
