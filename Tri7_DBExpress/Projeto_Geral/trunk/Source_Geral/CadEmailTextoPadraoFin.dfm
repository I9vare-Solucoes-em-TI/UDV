inherited frmCademailTextoPadraoFin: TfrmCademailTextoPadraoFin
  Caption = 'Cadastro de Textos Padr'#245'es de Email'
  ClientHeight = 596
  ClientWidth = 1132
  ExplicitTop = 4
  ExplicitWidth = 1148
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 1132
    ExplicitWidth = 782
    inherited PanelBotoesBasicos: TPanel
      Width = 1050
      ExplicitWidth = 700
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 1052
      ExplicitLeft = 702
    end
  end
  inherited StatusBar: TStatusBar
    Top = 576
    Width = 1132
    ExplicitTop = 576
    ExplicitWidth = 782
  end
  inherited PanelGeral: TPanel
    Width = 1132
    Height = 520
    ExplicitWidth = 782
    ExplicitHeight = 520
    inherited PanelData: TPanel
      Width = 1130
      Height = 65
      ExplicitWidth = 780
      ExplicitHeight = 65
      object cxLabel1: TcxLabel
        Left = 7
        Top = 16
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 7
        Top = 40
        Caption = 'Assunto:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 63
        Top = 11
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 699
      end
      object edtAssunto: TcxDBTextEdit
        Left = 63
        Top = 38
        DataBinding.DataField = 'ASSUNTO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 699
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 66
      Width = 1130
      Height = 453
      Align = alClient
      Color = 14807280
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 780
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 1128
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salTop
        MinSize = 36
        ExplicitWidth = 778
      end
      object grdBasica: TcxGrid
        Left = 1
        Top = 9
        Width = 1128
        Height = 147
        Align = alTop
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        ExplicitLeft = 2
        ExplicitTop = 6
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
            Width = 82
          end
          object cxGridBasicaDBDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 481
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 1
        Top = 156
        Width = 1128
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        HotZone.ArrowHighlightColor = 14807280
        HotZone.ShadowStartColor = 14807280
        AlignSplitter = salTop
        Control = grdBasica
        Color = 14807280
        ParentColor = False
        ExplicitWidth = 778
      end
      inline fmeEditorSimples: TfmeEditor
        Left = 1
        Top = 164
        Width = 1128
        Height = 288
        Align = alClient
        TabOrder = 3
        ExplicitLeft = 1
        ExplicitTop = 164
        ExplicitWidth = 778
        ExplicitHeight = 288
        inherited wptFerramentas: TWPToolbar
          Width = 1128
          ExplicitWidth = 778
          inherited btnGravacaoAutomatica: TSpeedButton
            Left = 23
            ExplicitLeft = 23
          end
          inherited WPToolPanel1: TWPToolPanel
            Left = 44
            ExplicitLeft = 44
          end
          inherited speNumColunas: TcxSpinEdit
            ExplicitHeight = 19
          end
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 1128
          ExplicitWidth = 778
        end
        inherited PanelMarcacao: TPanel
          Width = 1128
          ExplicitWidth = 778
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
          Width = 1102
          Height = 160
          LayoutMode = wplayNormal
          OnKeyDown = fmeEditorSimpleswptTextoKeyDown
          OnKeyPress = fmeEditorSimpleswptTextoKeyPress
          ExplicitWidth = 752
          ExplicitHeight = 160
        end
        inherited WPVertRuler1: TWPVertRuler
          Height = 160
          ExplicitHeight = 160
        end
        inherited StatusBar: TStatusBar
          Top = 269
          Width = 1128
          ExplicitTop = 269
          ExplicitWidth = 778
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
