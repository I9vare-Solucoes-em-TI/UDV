inherited frmFeriado: TfrmFeriado
  Left = 10
  Top = 137
  Caption = 'Cadastro de Feriados'
  ClientHeight = 566
  ClientWidth = 865
  OldCreateOrder = True
  ExplicitWidth = 881
  ExplicitHeight = 605
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 865
    ExplicitWidth = 865
    inherited PanelBotoesBasicos: TPanel
      Width = 783
      ExplicitWidth = 783
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 785
      ExplicitLeft = 785
    end
  end
  inherited StatusBar: TStatusBar
    Top = 546
    Width = 865
    ExplicitTop = 546
    ExplicitWidth = 865
  end
  inherited PanelGeral: TPanel
    Width = 865
    Height = 490
    ExplicitWidth = 865
    ExplicitHeight = 490
    inherited PanelData: TPanel
      Top = 161
      Width = 863
      Height = 0
      ExplicitTop = 161
      ExplicitWidth = 863
      ExplicitHeight = 0
    end
    object pnlDadosFeriado: TPanel
      Left = 1
      Top = 1
      Width = 863
      Height = 160
      Align = alTop
      BevelInner = bvLowered
      Color = 14807280
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      object cxLabel1: TcxLabel
        Left = 12
        Top = 40
        Caption = 'Nome:'
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
        TabOrder = 0
        Width = 56
      end
      object edtNome: TcxDBTextEdit
        Left = 67
        Top = 37
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 298
      end
      object chbSituacao: TcxDBCheckBox
        Left = 299
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
        TabOrder = 8
        Height = 21
        Width = 60
      end
      object edtTipo: TcxDBImageComboBox
        Left = 162
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
        TabOrder = 1
        Width = 128
      end
      object gpxFim: TcxGroupBox
        Left = 11
        Top = 108
        Caption = ' Fim '
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 5
        Height = 42
        Width = 354
        object LblDiaFim: TcxLabel
          Left = 7
          Top = 20
          Caption = 'Dia:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object LblMesFim: TcxLabel
          Left = 118
          Top = 20
          Caption = 'M'#234's:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object LblAnoFim: TcxLabel
          Left = 233
          Top = 20
          Caption = 'Ano:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtAnoFim: TcxDBTextEdit
          Left = 263
          Top = 16
          DataBinding.DataField = 'ANO_FIM'
          DataBinding.DataSource = SourceAncestral
          Enabled = False
          ParentFont = False
          Properties.MaxLength = 4
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 80
        end
        object edtDiaFim: TcxDBComboBox
          Left = 34
          Top = 16
          DataBinding.DataField = 'DIA_FIM'
          DataBinding.DataSource = SourceAncestral
          Enabled = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            ''
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
          TabOrder = 0
          Width = 80
        end
        object edtMesFim: TcxDBComboBox
          Left = 149
          Top = 16
          DataBinding.DataField = 'MES_FIM'
          DataBinding.DataSource = SourceAncestral
          Enabled = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            ''
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
          TabOrder = 1
          Width = 80
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 11
        Top = 60
        Caption = ' In'#237'cio '
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 4
        Height = 42
        Width = 354
        object LblDia: TcxLabel
          Left = 7
          Top = 20
          Caption = 'Dia:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object LblMes: TcxLabel
          Left = 118
          Top = 20
          Caption = 'M'#234's:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object LblAno: TcxLabel
          Left = 233
          Top = 20
          Caption = 'Ano:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtAno: TcxDBTextEdit
          Left = 263
          Top = 16
          DataBinding.DataField = 'ANO'
          DataBinding.DataSource = SourceAncestral
          Enabled = False
          ParentFont = False
          Properties.MaxLength = 4
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 80
        end
        object edtDia: TcxDBComboBox
          Left = 34
          Top = 16
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
          TabOrder = 0
          Width = 80
        end
        object edtMes: TcxDBComboBox
          Left = 149
          Top = 16
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
          TabOrder = 1
          Width = 80
        end
      end
    end
    object grdFeriado: TcxGrid
      Left = 1
      Top = 161
      Width = 863
      Height = 328
      Align = alClient
      TabOrder = 2
      object grdFeriadoDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
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
        object grdFeriadoDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Nome'
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
      object grdFeriadoBandedTableView1: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Bands = <
          item
          end>
      end
      object grdFeriadoDBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = True
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
            Column = grdFeriadoDBBandedTableView1FERIADO_ID
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.Appending = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.cxGridBandedTableViewStyleSheet1
        Bands = <
          item
            Width = 383
          end
          item
            Caption = 'Inicio'
            Width = 180
          end
          item
            Caption = 'Fim'
            Width = 180
          end
          item
            Width = 104
          end>
        object grdFeriadoDBBandedTableView1FERIADO_ID: TcxGridDBBandedColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'FERIADO_ID'
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1DESCRICAO: TcxGridDBBandedColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 258
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1TIPO: TcxGridDBBandedColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          Width = 63
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1DIA: TcxGridDBBandedColumn
          Caption = 'Dia'
          DataBinding.FieldName = 'DIA'
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1MES: TcxGridDBBandedColumn
          Caption = 'M'#234's'
          DataBinding.FieldName = 'MES'
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1ANO: TcxGridDBBandedColumn
          Caption = 'Ano'
          DataBinding.FieldName = 'ANO'
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1DIA_FIM: TcxGridDBBandedColumn
          Caption = 'Dia'
          DataBinding.FieldName = 'DIA_FIM'
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1MES_FIM: TcxGridDBBandedColumn
          Caption = 'M'#234's'
          DataBinding.FieldName = 'MES_FIM'
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1ANO_FIM: TcxGridDBBandedColumn
          Caption = 'Ano'
          DataBinding.FieldName = 'ANO_FIM'
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdFeriadoDBBandedTableView1SITUACAO: TcxGridDBBandedColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object grdFeriadoLevel1: TcxGridLevel
        GridView = grdFeriadoDBTableView1
        Visible = False
      end
      object grdFeriadoLevel2: TcxGridLevel
        GridView = grdFeriadoDBBandedTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 306
    Top = 182
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT * FROM G_FERIADO')
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
      Origin = 'FERIADO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object ClientAncestralDIA: TBCDField
      FieldName = 'DIA'
      Origin = 'DIA'
      Precision = 20
      Size = 2
    end
    object ClientAncestralMES: TBCDField
      FieldName = 'MES'
      Origin = 'MES'
      Precision = 20
      Size = 2
    end
    object ClientAncestralANO: TBCDField
      FieldName = 'ANO'
      Origin = 'ANO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDIA_FIM: TBCDField
      FieldName = 'DIA_FIM'
      Precision = 18
      Size = 2
    end
    object ClientAncestralMES_FIM: TBCDField
      FieldName = 'MES_FIM'
      Precision = 18
      Size = 2
    end
    object ClientAncestralANO_FIM: TBCDField
      FieldName = 'ANO_FIM'
      Precision = 18
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 441
    Top = 323
  end
end
