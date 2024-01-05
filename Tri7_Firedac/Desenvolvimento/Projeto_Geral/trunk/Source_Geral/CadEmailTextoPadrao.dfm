inherited frmCademailTextoPadrao: TfrmCademailTextoPadrao
  Caption = 'Cadastro de Textos Padr'#245'es de Email'
  ClientHeight = 496
  ClientWidth = 982
  ExplicitWidth = 998
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 982
    ExplicitWidth = 982
    inherited PanelBotoesBasicos: TPanel
      Width = 900
      ExplicitWidth = 900
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 902
      ExplicitLeft = 902
    end
  end
  inherited StatusBar: TStatusBar
    Top = 476
    Width = 982
    ExplicitTop = 476
    ExplicitWidth = 982
  end
  inherited PanelGeral: TPanel
    Width = 982
    Height = 420
    ExplicitWidth = 982
    ExplicitHeight = 420
    inherited PanelData: TPanel
      Width = 980
      Height = 65
      ExplicitWidth = 980
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
      object cxLabel2: TcxLabel
        Left = 768
        Top = 16
        Caption = 'Tipo Email:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object icxTipoEmail: TcxDBImageComboBox
        Left = 830
        Top = 11
        DataBinding.DataField = 'TIPO_EMAIL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Padr'#227'o'
            ImageIndex = 0
            Value = 'PAD'
          end
          item
            Description = 'Pend'#234'ncia'
            Value = 'PEN'
          end
          item
            Description = 'Nova Pend'#234'ncia'
            Value = 'NPE'
          end
          item
            Description = 'Baixa Pend'#234'ncia'
            Value = 'BPE'
          end
          item
            Description = 'Finalizado'
            Value = 'FIN'
          end
          item
            Description = 'Geral'
            Value = 'GER'
          end
          item
            Description = 'Entrada'
            Value = 'ENT'
          end>
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.ButtonStyle = btsFlat
        StyleFocused.BorderColor = clRed
        StyleFocused.Color = 13689536
        StyleFocused.TextColor = 4210688
        TabOrder = 5
        Width = 133
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 66
      Width = 980
      Height = 353
      Align = alClient
      Color = 14807280
      ParentBackground = False
      TabOrder = 1
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 978
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        AlignSplitter = salTop
        MinSize = 36
      end
      object grdBasica: TcxGrid
        Left = 1
        Top = 9
        Width = 978
        Height = 178
        Align = alTop
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        ExplicitLeft = 0
        ExplicitTop = 11
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
            Width = 400
          end
          object grdBasicaDBTIPO_EMAIL: TcxGridDBColumn
            Caption = 'Tipo Email'
            DataBinding.FieldName = 'TIPO_EMAIL'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'Padr'#227'o'
                ImageIndex = 44
                Value = 'PAD'
              end
              item
                Description = 'Pend'#234'ncia'
                ImageIndex = 44
                Value = 'PEN'
              end
              item
                Description = 'Nova Pend'#234'ncia'
                ImageIndex = 44
                Value = 'NPE'
              end
              item
                Description = 'Baixa Pend'#234'ncia'
                ImageIndex = 44
                Value = 'BPE'
              end
              item
                Description = 'Finalizado'
                ImageIndex = 44
                Value = 'FIN'
              end
              item
                Description = 'Geral'
                ImageIndex = 44
                Value = 'GER'
              end
              item
                Description = 'Entrada'
                ImageIndex = 44
                Value = 'ENT'
              end>
            Options.Editing = False
            Options.Focusing = False
            Width = 120
          end
          object grdBasicaDBTableView1ASSUNTO: TcxGridDBColumn
            Caption = 'Assunto'
            DataBinding.FieldName = 'ASSUNTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 300
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 1
        Top = 187
        Width = 978
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 60
        HotZone.ArrowHighlightColor = 14807280
        HotZone.ShadowStartColor = 14807280
        AlignSplitter = salTop
        Control = grdBasica
        Color = 14807280
        ParentColor = False
      end
      inline fmeEditorSimples: TfmeEditor
        Left = 1
        Top = 195
        Width = 978
        Height = 157
        Align = alClient
        TabOrder = 3
        ExplicitLeft = 1
        ExplicitTop = 195
        ExplicitWidth = 978
        ExplicitHeight = 157
        inherited wptFerramentas: TWPToolbar
          Width = 978
          ExplicitWidth = 978
          inherited btnGravacaoAutomatica: TSpeedButton
            Left = 199
            ExplicitLeft = 199
          end
          inherited WPToolPanel1: TWPToolPanel
            Left = 220
            ExplicitLeft = 220
          end
          inherited speNumColunas: TcxSpinEdit
            ExplicitHeight = 19
          end
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 978
          ExplicitWidth = 978
        end
        inherited PanelMarcacao: TPanel
          Width = 978
          ExplicitWidth = 978
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
          Width = 952
          Height = 29
          OnKeyDown = fmeEditorSimpleswptTextoKeyDown
          OnKeyPress = fmeEditorSimpleswptTextoKeyPress
          ExplicitWidth = 952
          ExplicitHeight = 29
        end
        inherited WPVertRuler1: TWPVertRuler
          Height = 29
          ExplicitHeight = 29
        end
        inherited StatusBar: TStatusBar
          Top = 138
          Width = 978
          ExplicitTop = 138
          ExplicitWidth = 978
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 479
    Top = 233
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_EMAIL_TEXTO_PADRAO'#13#10'ORDER BY DESCRICAO')
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
    object ClientAncestralEMAIL_TEXTO_PADRAO_ID: TBCDField
      FieldName = 'EMAIL_TEXTO_PADRAO_ID'
      Origin = 'EMAIL_TEXTO_PADRAO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
      Origin = 'TEXTO'
    end
    object ClientAncestralASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Origin = 'ASSUNTO'
      Size = 90
    end
    object ClientAncestralTIPO_EMAIL: TStringField
      FieldName = 'TIPO_EMAIL'
      Origin = 'TIPO_EMAIL'
      Size = 3
    end
    object ClientAncestralASSUNTO_PADRAO: TStringField
      FieldName = 'ASSUNTO_PADRAO'
      Origin = 'ASSUNTO_PADRAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 605
    Top = 233
  end
end
