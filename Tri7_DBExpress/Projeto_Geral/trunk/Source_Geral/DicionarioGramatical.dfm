inherited frmDicionarioGramatical: TfrmDicionarioGramatical
  Left = 141
  Top = 168
  BorderStyle = bsSingle
  Caption = 'Dicion'#225'rio Gramatical'
  ClientHeight = 555
  ClientWidth = 822
  OldCreateOrder = True
  ExplicitWidth = 769
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 822
    ExplicitWidth = 822
    inherited PanelBotoesBasicos: TPanel
      Width = 733
      ExplicitWidth = 733
      object Label1: TLabel [0]
        Left = 353
        Top = 32
        Width = 374
        Height = 15
        Caption = '* A "PALAVRA" deve ser sempre registrada no "Masculino Singular"'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      inherited PanelBasicoBotoes: TPanel
        Width = 349
        ExplicitWidth = 349
        inherited cxBtnPesquisar: TcxButton
          Left = 280
          Visible = False
          ExplicitLeft = 280
        end
        inherited cxBtnCancelar: TcxButton
          Left = 280
          ExplicitLeft = 280
        end
        inherited cxBtnGravar: TcxButton
          Left = 211
          ExplicitLeft = 211
        end
        inherited cxBtnExcluir: TcxButton
          Left = 142
          ExplicitLeft = 142
        end
        inherited cxBtnAlterar: TcxButton
          Left = 73
          ExplicitLeft = 73
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 736
      ExplicitLeft = 736
    end
  end
  inherited StatusBar: TStatusBar
    Top = 534
    Width = 822
    ExplicitTop = 533
    ExplicitWidth = 822
  end
  inherited PanelGeral: TPanel
    Width = 822
    Height = 474
    Color = clWindow
    ExplicitWidth = 822
    ExplicitHeight = 474
    inherited PanelData: TPanel
      Width = 820
      Height = 118
      Color = clWindow
      ExplicitWidth = 820
      ExplicitHeight = 118
      object edtPalavra: TcxDBTextEdit
        Left = 11
        Top = 30
        DataBinding.DataField = 'PALAVRA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 328
      end
      object edtPrefixo: TcxDBTextEdit
        Left = 344
        Top = 30
        DataBinding.DataField = 'PREFIXO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 325
      end
      object lblPalavra: TcxLabel
        Left = 11
        Top = 11
        Caption = 'Palavra'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lblPrefixo: TcxLabel
        Left = 344
        Top = 11
        Caption = 'Prefixo'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object grbSufixoMasculino: TcxGroupBox
        Left = 11
        Top = 55
        Caption = ' Sufixos Masculino '
        ParentBackground = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 4
        Height = 54
        Width = 328
        object lblSingularMasc: TcxLabel
          Left = 11
          Top = 22
          Caption = 'Singular:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblPluralMasc: TcxLabel
          Left = 171
          Top = 22
          Caption = 'Plural:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object ediSufixoMS: TcxDBTextEdit
          Left = 65
          Top = 20
          DataBinding.DataField = 'SUFIXO_MS'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 102
        end
        object edtSufixoMP: TcxDBTextEdit
          Left = 212
          Top = 20
          DataBinding.DataField = 'SUFIXO_MP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Width = 102
        end
      end
      object grbSufixoFeminino: TcxGroupBox
        Left = 344
        Top = 55
        Caption = ' Sufixos Feminino '
        ParentBackground = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 5
        Height = 54
        Width = 325
        object edtSufixoFS: TcxDBTextEdit
          Left = 65
          Top = 20
          DataBinding.DataField = 'SUFIXO_FS'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 0
          Width = 102
        end
        object edtSufixoFP: TcxDBTextEdit
          Left = 212
          Top = 20
          DataBinding.DataField = 'SUFIXO_FP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 102
        end
        object lblSingularFem: TcxLabel
          Left = 11
          Top = 22
          Caption = 'Singular:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblPluralFem: TcxLabel
          Left = 171
          Top = 22
          Caption = 'Plural:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -12
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
    end
    object cxGridBasica: TcxGrid
      Left = 1
      Top = 119
      Width = 820
      Height = 354
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 120
      ExplicitHeight = 352
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
        object cxGridBasicaDBPalavra: TcxGridDBColumn
          Caption = 'Palavra'
          DataBinding.FieldName = 'PALAVRA'
          Width = 367
        end
        object cxGridBasicaDBPrefixo: TcxGridDBColumn
          Caption = 'Prefixo'
          DataBinding.FieldName = 'PALAVRA'
          Width = 392
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
