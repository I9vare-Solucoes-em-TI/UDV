inherited frmQualificacaoTipo: TfrmQualificacaoTipo
  Left = 141
  Top = 134
  Width = 671
  Height = 501
  Caption = 'Qualifica'#231#227'o Tipo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 663
    inherited PanelBotoesBasicos: TPanel
      Width = 602
    end
    inherited PanelBotaoFechar: TPanel
      Left = 604
    end
  end
  inherited StatusBar: TStatusBar
    Top = 453
    Width = 663
  end
  inherited PanelGeral: TPanel
    Width = 663
    Height = 394
    inherited PanelData: TPanel
      Width = 661
      Height = 109
      Visible = False
      object cxLabel1: TcxLabel
        Left = 8
        Top = 57
        Width = 55
        Height = 17
        Caption = 'Descri'#231#227'o:'
        Style.TextColor = clNavy
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 9
        Width = 35
        Height = 17
        Caption = 'Nome:'
        Style.TextColor = clNavy
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 81
        Width = 36
        Height = 17
        Caption = 'Grupo:'
        Style.TextColor = clNavy
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 33
        Width = 31
        Height = 17
        Caption = 'Valor:'
        Style.TextColor = clNavy
      end
      object edtNome: TcxDBTextEdit
        Left = 64
        Top = 7
        Width = 508
        Height = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.TextColor = clNavy
        TabOrder = 4
      end
      object edtValor: TcxDBTextEdit
        Left = 64
        Top = 31
        Width = 508
        Height = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 5
      end
      object edtDescricao: TcxDBTextEdit
        Left = 64
        Top = 55
        Width = 508
        Height = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.TextColor = clNavy
        TabOrder = 6
      end
      object cbxGrupo: TcxComboBox
        Left = 64
        Top = 80
        Width = 305
        Height = 21
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 7
      end
      object chbSituacao: TcxDBCheckBox
        Left = 501
        Top = 79
        Width = 68
        Height = 21
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
        TabOrder = 8
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 110
      Width = 661
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      Control = PanelData
    end
    object cxGridBasica: TcxGrid
      Left = 1
      Top = 118
      Width = 661
      Height = 118
      Align = alTop
      TabOrder = 2
      object cxGridBasicaDBTableView1: TcxGridDBTableView
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = 'Qtd.: 0'
            FieldName = 'NOME'
            Column = cxGridBasicaDBGrupo
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NOME'
            Column = cxGridBasicaDBNome
          end>
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
        object cxGridBasicaDBNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          Width = 159
        end
        object cxGridBasicaDBValor: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VALOR'
          Width = 160
        end
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 229
        end
        object cxGridBasicaDBSituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Ativo'
              ImageIndex = 0
              Value = 'A'
            end
            item
              Description = 'Inativo'
              ImageIndex = 1
              Value = 'I'
            end>
          Width = 77
        end
        object cxGridBasicaDBGrupo: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'GRUPO'
          Visible = False
          GroupIndex = 0
        end
      end
      object cxGridBasicaLevel1: TcxGridLevel
        GridView = cxGridBasicaDBTableView1
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 236
      Width = 661
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      Control = cxGridBasica
    end
    inline fmeEditorSimples: TfmeEditorSimples
      Left = 1
      Top = 244
      Width = 661
      Height = 149
      Align = alClient
      TabOrder = 4
      inherited wptFerramentas: TWPToolBar
        Width = 661
        Height = 28
      end
      inherited WPReguaHorizontal: TWPRuler
        Top = 28
        Width = 661
      end
      inherited wptTexto: TWPRichText
        Top = 54
        Width = 661
        Height = 95
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 437
    Top = 370
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM G_QUALIFICACAO_TIPO'#13#10'WHERE SISTEMA_ID = :SISTEMA_' +
      'ID'#13#10'ORDER BY GRUPO, NOME'
    Params = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Left = 467
    Top = 370
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 499
    Top = 370
  end
  inherited ClientAncestral: TClientDataSet
    Left = 531
    Top = 370
  end
  inherited SourceAncestral: TDataSource
    Left = 563
    Top = 370
  end
end
