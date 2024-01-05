inherited frmCadGrupoTextoModelo: TfrmCadGrupoTextoModelo
  BorderStyle = bsSingle
  Caption = 'Cadastro de Grupos de Textos Modelos'
  ClientHeight = 565
  ClientWidth = 715
  ExplicitWidth = 721
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 715
    ExplicitWidth = 715
    inherited PanelBotoesBasicos: TPanel
      Width = 633
      ExplicitWidth = 633
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 324
          Visible = False
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
      ExplicitLeft = 635
    end
  end
  inherited StatusBar: TStatusBar
    Top = 545
    Width = 715
    ExplicitTop = 545
    ExplicitWidth = 715
  end
  inherited PanelGeral: TPanel
    Width = 715
    Height = 489
    Color = clWindow
    ExplicitWidth = 715
    ExplicitHeight = 489
    inherited PanelData: TPanel
      Width = 713
      Height = 56
      Color = clWindow
      ExplicitWidth = 713
      ExplicitHeight = 56
      object lblDocumento: TcxLabel
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
      object cxLabel1: TcxLabel
        Left = 431
        Top = 10
        Caption = 'Tipo do Grupo'
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
      object edtDescricao: TcxDBTextEdit
        Left = 10
        Top = 28
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 120
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 417
      end
      object icxTipo: TcxDBImageComboBox
        Left = 431
        Top = 28
        DataBinding.DataField = 'TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Geral'
            ImageIndex = 0
            Value = 'G'
          end
          item
            Description = 'Procura'#231#227'o'
            Value = 'P'
          end
          item
            Description = 'Averba'#231#227'o'
            Value = 'A'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.ButtonStyle = btsUltraFlat
        TabOrder = 3
        Width = 126
      end
      object chbSituacao: TcxDBCheckBox
        Left = 563
        Top = 28
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextStyle = [fsBold]
        StyleFocused.TextColor = clRed
        TabOrder = 4
        Transparent = True
        Height = 21
        Width = 54
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 57
      Width = 713
      Height = 184
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
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.InfoPanel.Width = 80
        Navigator.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
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
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Options.Editing = False
          Options.Focusing = False
          Width = 336
        end
        object grdBasicaDBTableView1Column2: TcxGridDBColumn
          Caption = 'Tipo do Grupo'
          DataBinding.FieldName = 'TIPO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Geral'
              ImageIndex = 0
              Value = 'G'
            end
            item
              Description = 'Procura'#231#227'o'
              Value = 'P'
            end
            item
              Description = 'Averba'#231#227'o'
              Value = 'A'
            end
            item
              Description = 'Geral'
            end>
          Options.Editing = False
          Options.Focusing = False
          Width = 68
        end
        object grdBasicaDBTableView1Column3: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Options.Editing = False
          Options.Focusing = False
          Width = 110
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = grdBasicaDBTableView1
      end
    end
    object cxSplitterBasico: TcxSplitter
      Left = 1
      Top = 241
      Width = 713
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      DragThreshold = 2
      NativeBackground = False
      PositionAfterOpen = 59
      MinSize = 59
      Control = grdBasica
      ParentColor = False
    end
    object tbcTexto: TcxTabControl
      Left = 1
      Top = 249
      Width = 713
      Height = 239
      Align = alClient
      TabOrder = 3
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Texto Doc. Principal'
        'Texto Doc. Secund'#225'rio')
      ClientRectBottom = 239
      ClientRectRight = 713
      ClientRectTop = 24
      inline fmeEditor1: TfmeEditor
        Left = 0
        Top = 24
        Width = 713
        Height = 215
        Align = alClient
        TabOrder = 0
        ExplicitTop = 24
        ExplicitWidth = 713
        ExplicitHeight = 215
        inherited wptFerramentas: TWPToolbar
          Width = 713
          ExplicitWidth = 713
          inherited btnGravacaoAutomatica: TSpeedButton
            Left = 467
            ExplicitLeft = 467
          end
          inherited WPToolPanel1: TWPToolPanel
            Left = 488
            ExplicitLeft = 488
          end
          inherited speNumColunas: TcxSpinEdit
            ExplicitHeight = 19
          end
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 713
          ExplicitWidth = 713
        end
        inherited PanelMarcacao: TPanel
          Width = 713
          ExplicitWidth = 713
          inherited lblInfoMarcacaoInterna: TcxLabel
            AnchorX = 657
            AnchorY = 14
          end
          inherited btnDicionarioGramatical: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnMarcacaoAutomatica: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnMarcacaoManual: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnVerificarMarcacao: TcxButton
            LookAndFeel.SkinName = ''
          end
        end
        inherited wptTexto: TWPRichText
          Width = 687
          Height = 87
          ExplicitWidth = 687
          ExplicitHeight = 87
        end
        inherited WPVertRuler1: TWPVertRuler
          Height = 87
          ExplicitHeight = 87
        end
        inherited StatusBar: TStatusBar
          Top = 196
          Width = 713
          ExplicitTop = 196
          ExplicitWidth = 713
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 282
    Top = 238
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT TB_TXMODELOGRUPO_ID,'
      '             DESCRICAO,'
      '             SITUACAO,'
      '             SISTEMA_ID,'
      '             TIPO'
      'FROM G_TB_TXMODELOGRUPO'
      'WHERE SISTEMA_ID = :SISTEMA_ID'
      'ORDER BY TB_TXMODELOGRUPO_ID')
    Left = 282
    Top = 286
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 358
    Top = 238
  end
  inherited ClientAncestral: TClientDataSet
    Left = 320
    Top = 238
    object ClientAncestralTB_TXMODELOGRUPO_ID: TBCDField
      FieldName = 'TB_TXMODELOGRUPO_ID'
      Required = True
      Precision = 18
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
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 18
      Size = 2
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 396
    Top = 238
  end
end
