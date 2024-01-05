inherited frmDicionarioGramatical: TfrmDicionarioGramatical
  Left = 141
  Top = 168
  Caption = 'Dicion'#225'rio Gramatical'
  ClientHeight = 395
  ClientWidth = 842
  OldCreateOrder = True
  ExplicitWidth = 858
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 842
    ExplicitWidth = 842
    inherited PanelBotoesBasicos: TPanel
      Width = 760
      ExplicitWidth = 760
      object Label1: TLabel [0]
        Left = 385
        Top = 30
        Width = 335
        Height = 15
        Caption = '* A "PALAVRA" deve ser sempre registrada no "Masculino Singular"'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 762
      ExplicitLeft = 762
    end
  end
  inherited StatusBar: TStatusBar
    Top = 375
    Width = 842
    ExplicitTop = 375
    ExplicitWidth = 842
  end
  inherited PanelGeral: TPanel
    Width = 842
    Height = 319
    ExplicitWidth = 842
    ExplicitHeight = 319
    inherited PanelData: TPanel
      Width = 840
      Height = 91
      ExplicitWidth = 840
      ExplicitHeight = 91
      object cxLabel1: TcxLabel
        Left = 18
        Top = 9
        Caption = 'Palavra:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
      object edtPalavra: TcxDBTextEdit
        Left = 61
        Top = 8
        DataBinding.DataField = 'PALAVRA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 252
      end
      object cxLabel2: TcxLabel
        Left = 331
        Top = 9
        Caption = 'Prefixo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
      object edtPrefixo: TcxDBTextEdit
        Left = 376
        Top = 8
        DataBinding.DataField = 'PREFIXO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 242
      end
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 32
        Caption = ' Sufixos '
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 4
        Height = 53
        Width = 625
        object Panel1: TPanel
          Left = 5
          Top = 14
          Width = 308
          Height = 36
          BevelInner = bvLowered
          BorderStyle = bsSingle
          Color = 13034466
          ParentBackground = False
          TabOrder = 0
          object cxLabel3: TcxLabel
            Left = 3
            Top = 9
            Caption = 'Masculino Singular:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object ediSufixoMS: TcxDBTextEdit
            Left = 99
            Top = 7
            DataBinding.DataField = 'SUFIXO_MS'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 54
          end
          object cxLabel4: TcxLabel
            Left = 162
            Top = 9
            Caption = 'Masculino Plural:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object edtSufixoMP: TcxDBTextEdit
            Left = 245
            Top = 7
            DataBinding.DataField = 'SUFIXO_MP'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            Width = 54
          end
        end
        object Panel2: TPanel
          Left = 312
          Top = 14
          Width = 308
          Height = 36
          BevelInner = bvLowered
          BorderStyle = bsSingle
          Color = 13034466
          ParentBackground = False
          TabOrder = 1
          object cxLabel5: TcxLabel
            Left = 11
            Top = 9
            Caption = 'Feminino Singular:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object edtSufixoFS: TcxDBTextEdit
            Left = 103
            Top = 7
            DataBinding.DataField = 'SUFIXO_FS'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 54
          end
          object cxLabel6: TcxLabel
            Left = 164
            Top = 9
            Caption = 'Feminino Plural:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
            Transparent = True
          end
          object edtSufixoFP: TcxDBTextEdit
            Left = 243
            Top = 7
            DataBinding.DataField = 'SUFIXO_FP'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            Width = 54
          end
        end
      end
    end
    object cxGridBasica: TcxGrid
      Left = 1
      Top = 92
      Width = 840
      Height = 226
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridBasicaDBTableView1: TcxGridDBTableView
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
            Column = cxGridBasicaDBPalavra
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBPalavra: TcxGridDBColumn
          Caption = 'Palavra'
          DataBinding.FieldName = 'PALAVRA'
          Width = 361
        end
        object cxGridBasicaDBPrefixo: TcxGridDBColumn
          Caption = 'Prefixo'
          DataBinding.FieldName = 'PALAVRA'
          Width = 273
        end
      end
      object cxGridBasicaLevel1: TcxGridLevel
        GridView = cxGridBasicaDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Top = 162
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM G_GRAMATICA'#13#10'ORDER BY PALAVRA')
    Top = 162
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 162
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    Top = 162
    object ClientAncestralGRAMATICA_ID: TBCDField
      FieldName = 'GRAMATICA_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object ClientAncestralSUFIXO_MS: TStringField
      FieldName = 'SUFIXO_MS'
      Size = 10
    end
    object ClientAncestralSUFIXO_MP: TStringField
      FieldName = 'SUFIXO_MP'
      Size = 10
    end
    object ClientAncestralSUFIXO_FS: TStringField
      FieldName = 'SUFIXO_FS'
      Size = 10
    end
    object ClientAncestralSUFIXO_FP: TStringField
      FieldName = 'SUFIXO_FP'
      Size = 10
    end
    object ClientAncestralPALAVRA: TStringField
      FieldName = 'PALAVRA'
      Size = 30
    end
    object ClientAncestralPREFIXO: TStringField
      FieldName = 'PREFIXO'
      Size = 30
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
end
