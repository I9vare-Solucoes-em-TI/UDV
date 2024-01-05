inherited frmCademailTextoPadraoFin: TfrmCademailTextoPadraoFin
  Caption = 'Cadastro de Textos Padr'#245'es de Email'
  ClientHeight = 642
  ClientWidth = 744
  ExplicitWidth = 760
  ExplicitHeight = 681
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 744
    ExplicitWidth = 1219
    inherited PanelBotoesBasicos: TPanel
      Width = 656
      ExplicitWidth = 1131
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 658
      ExplicitLeft = 1133
    end
  end
  inherited StatusBar: TStatusBar
    Top = 621
    Width = 744
    ExplicitTop = 621
    ExplicitWidth = 1219
  end
  inherited PanelGeral: TPanel
    Width = 744
    Height = 561
    ExplicitWidth = 1219
    ExplicitHeight = 561
    inherited PanelData: TPanel
      Width = 742
      Height = 70
      ExplicitWidth = 1217
      ExplicitHeight = 70
      object cxLabel1: TcxLabel
        Left = 8
        Top = 17
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 43
        Caption = 'Assunto:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 68
        Top = 12
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 544
      end
      object edtAssunto: TcxDBTextEdit
        Left = 68
        Top = 41
        DataBinding.DataField = 'ASSUNTO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 332
      end
      object cxLabel2: TcxLabel
        Left = 406
        Top = 43
        Caption = 'Tipo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 439
        Top = 40
        DataBinding.DataField = 'TIPO_EMAIL'
        DataBinding.DataSource = SourceAncestral
        Properties.Items = <
          item
            Description = 'Padr'#227'o de Boleto'
            ImageIndex = 0
            Value = 'B'
          end
          item
            Description = 'Padr'#227'o de Recibo'
            Value = 'R'
          end
          item
            Description = 'Padr'#227'o de Relatorio'
            Value = 'O'
          end
          item
            Description = 'Geral'
            Value = 'G'
          end>
        TabOrder = 5
        Width = 173
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 71
      Width = 742
      Height = 489
      Align = alClient
      Color = 14807280
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 1217
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 740
        Height = 9
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salTop
        MinSize = 36
        ExplicitWidth = 1215
      end
      object grdBasica: TcxGrid
        Left = 1
        Top = 10
        Width = 740
        Height = 158
        Align = alTop
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        ExplicitTop = 6
        ExplicitWidth = 1008
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
          Navigator.Visible = True
          DataController.DataSource = SourceAncestral
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total:0'
              Kind = skCount
              FieldName = 'NATUREZA_ID'
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDBCodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'EMAIL_TEXTO_PADRAO_ID'
            Options.Editing = False
            Options.Focusing = False
            Width = 82
          end
          object cxGridBasicaDBDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Options.Editing = False
            Options.Focusing = False
            Width = 481
          end
          object grdBasicaDBTableView1Column1: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'TIPO_EMAIL'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Padr'#227'o de Boleto'
                ImageIndex = 0
                Value = 'B'
              end
              item
                Description = 'Padr'#227'o de Recibo'
                Value = 'R'
              end
              item
                Description = 'Padr'#227'o de Relatorio'
                Value = 'O'
              end
              item
                Description = 'Geral'
                Value = 'G'
              end>
            Options.Editing = False
            Options.Focusing = False
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 1
        Top = 168
        Width = 740
        Height = 9
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        HotZone.ArrowHighlightColor = 14807280
        HotZone.ShadowStartColor = 14807280
        AlignSplitter = salTop
        Control = grdBasica
        Color = 14807280
        ParentColor = False
        ExplicitWidth = 1215
      end
      inline fmeEditorSimples: TfmeEditor
        Left = 1
        Top = 177
        Width = 740
        Height = 311
        Align = alClient
        TabOrder = 3
        ExplicitLeft = 1
        ExplicitTop = 177
        ExplicitWidth = 1215
        ExplicitHeight = 311
        inherited wptFerramentas: TWPToolbar
          Top = 31
          Width = 740
          ExplicitTop = 31
          ExplicitWidth = 1215
          inherited btnGravacaoAutomatica: TSpeedButton
            Left = 423
            Width = 22
            Height = 22
            ExplicitLeft = 423
            ExplicitWidth = 22
            ExplicitHeight = 22
          end
          inherited WPToolPanel1: TWPToolPanel
            Left = 445
            Width = 97
            Height = 22
            ExplicitLeft = 445
            ExplicitWidth = 97
            ExplicitHeight = 22
            inherited btnSaveImagem: TWPToolButton
              Left = 25
              Width = 22
              Height = 22
              ExplicitLeft = 25
              ExplicitWidth = 22
              ExplicitHeight = 22
            end
            inherited btnInserirImagem: TWPToolButton
              Width = 23
              Height = 22
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
            inherited btnConfigPagina: TWPToolButton
              Left = 50
              Width = 22
              Height = 22
              ExplicitLeft = 50
              ExplicitWidth = 22
              ExplicitHeight = 22
            end
            inherited btnSalvarConfiguracao: TWPToolButton
              Left = 74
              Width = 23
              Height = 22
              ExplicitLeft = 74
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          inherited cxLabel7: TcxLabel
            Left = 614
            Top = 33
            ExplicitLeft = 614
            ExplicitTop = 33
          end
          inherited speNumColunas: TcxSpinEdit
            Left = 655
            Top = 30
            ExplicitLeft = 655
            ExplicitTop = 30
            ExplicitWidth = 44
            ExplicitHeight = 20
            Width = 44
          end
        end
        inherited WPReguaHorizontal: TWPRuler
          Top = 85
          Width = 740
          ExplicitTop = 85
          ExplicitWidth = 1215
        end
        inherited PanelMarcacao: TPanel
          Width = 740
          Height = 31
          ExplicitWidth = 1215
          ExplicitHeight = 31
          inherited chkShowMarcacaoInterna: TCheckBox
            Left = 443
            Top = 8
            Width = 122
            Height = 18
            ExplicitLeft = 443
            ExplicitTop = 8
            ExplicitWidth = 122
            ExplicitHeight = 18
          end
          inherited lblInfoMarcacaoInterna: TcxLabel
            Left = 571
            ExplicitLeft = 571
            ExplicitWidth = 272
            ExplicitHeight = 26
            Height = 26
            Width = 272
            AnchorX = 707
            AnchorY = 15
          end
          inherited btnDicionarioGramatical: TcxButton
            Width = 140
            Height = 24
            LookAndFeel.SkinName = ''
            Font.Height = -12
            ExplicitWidth = 140
            ExplicitHeight = 24
          end
          inherited btnMarcacaoAutomatica: TcxButton
            Left = 151
            Width = 140
            Height = 24
            LookAndFeel.SkinName = ''
            Font.Height = -12
            ExplicitLeft = 151
            ExplicitWidth = 140
            ExplicitHeight = 24
          end
          inherited btnMarcacaoManual: TcxButton
            Left = 295
            Width = 140
            Height = 24
            LookAndFeel.SkinName = ''
            Font.Height = -12
            ExplicitLeft = 295
            ExplicitWidth = 140
            ExplicitHeight = 24
          end
          inherited btnVerificarMarcacao: TcxButton
            Left = 844
            Width = 29
            Height = 24
            LookAndFeel.SkinName = ''
            Font.Height = -12
            ExplicitLeft = 844
            ExplicitWidth = 29
            ExplicitHeight = 24
          end
        end
        inherited wptTexto: TWPRichText
          Top = 111
          Width = 714
          Height = 181
          LayoutMode = wplayNormal
          OnKeyDown = fmeEditorSimpleswptTextoKeyDown
          OnKeyPress = fmeEditorSimpleswptTextoKeyPress
          ExplicitTop = 111
          ExplicitWidth = 705
          ExplicitHeight = 181
        end
        inherited WPVertRuler1: TWPVertRuler
          Top = 111
          Height = 181
          ExplicitTop = 111
          ExplicitHeight = 181
        end
        inherited StatusBar: TStatusBar
          Top = 292
          Width = 740
          ExplicitTop = 292
          ExplicitWidth = 1215
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 479
    Top = 233
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM G_EMAIL_TEXTO_PADRAO'#13#10'ORDER BY DESCRICAO'
    Left = 509
    Top = 233
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 541
    Top = 233
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 573
    Top = 233
    object ClientAncestralEMAIL_TEXTO_PADRAO_ID: TFMTBCDField
      FieldName = 'EMAIL_TEXTO_PADRAO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
    end
    object ClientAncestralASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 90
    end
    object ClientAncestralTIPO_EMAIL: TStringField
      FieldName = 'TIPO_EMAIL'
    end
    object ClientAncestralASSUNTO_PADRAO: TStringField
      FieldName = 'ASSUNTO_PADRAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 605
    Top = 233
  end
end
