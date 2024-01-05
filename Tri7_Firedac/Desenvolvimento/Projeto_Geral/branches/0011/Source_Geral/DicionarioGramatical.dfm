inherited frmDicionarioGramatical: TfrmDicionarioGramatical
  Left = 141
  Top = 168
  BorderStyle = bsSingle
  Caption = 'Dicion'#225'rio Gramatical'
  ClientHeight = 515
  ClientWidth = 763
  OldCreateOrder = True
  ExplicitWidth = 769
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 763
    ExplicitWidth = 763
    inherited PanelBotoesBasicos: TPanel
      Width = 681
      ExplicitWidth = 681
      object Label1: TLabel [0]
        Left = 328
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
      inherited PanelBasicoBotoes: TPanel
        Width = 324
        ExplicitWidth = 324
        inherited cxBtnPesquisar: TcxButton
          Left = 260
          Visible = False
          ExplicitLeft = 260
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
      Left = 683
      ExplicitLeft = 683
    end
  end
  inherited StatusBar: TStatusBar
    Top = 495
    Width = 763
    ExplicitTop = 495
    ExplicitWidth = 763
  end
  inherited PanelGeral: TPanel
    Width = 763
    Height = 439
    Color = clWindow
    ExplicitWidth = 763
    ExplicitHeight = 439
    inherited PanelData: TPanel
      Width = 761
      Height = 110
      Color = clWindow
      ExplicitWidth = 761
      ExplicitHeight = 110
      object edtPalavra: TcxDBTextEdit
        Left = 10
        Top = 28
        DataBinding.DataField = 'PALAVRA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 305
      end
      object edtPrefixo: TcxDBTextEdit
        Left = 319
        Top = 28
        DataBinding.DataField = 'PREFIXO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 302
      end
      object lblPalavra: TcxLabel
        Left = 10
        Top = 10
        Caption = 'Palavra'
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
      object lblPrefixo: TcxLabel
        Left = 319
        Top = 10
        Caption = 'Prefixo'
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
      object grbSufixoMasculino: TcxGroupBox
        Left = 10
        Top = 51
        Caption = ' Sufixos Masculino '
        ParentBackground = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 4
        Height = 50
        Width = 305
        object lblSingularMasc: TcxLabel
          Left = 10
          Top = 20
          Caption = 'Singular:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblPluralMasc: TcxLabel
          Left = 159
          Top = 20
          Caption = 'Plural:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object ediSufixoMS: TcxDBTextEdit
          Left = 60
          Top = 19
          DataBinding.DataField = 'SUFIXO_MS'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 95
        end
        object edtSufixoMP: TcxDBTextEdit
          Left = 197
          Top = 19
          DataBinding.DataField = 'SUFIXO_MP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Width = 95
        end
      end
      object grbSufixoFeminino: TcxGroupBox
        Left = 319
        Top = 51
        Caption = ' Sufixos Feminino '
        ParentBackground = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 5
        Height = 50
        Width = 302
        object edtSufixoFS: TcxDBTextEdit
          Left = 60
          Top = 19
          DataBinding.DataField = 'SUFIXO_FS'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 0
          Width = 95
        end
        object edtSufixoFP: TcxDBTextEdit
          Left = 197
          Top = 19
          DataBinding.DataField = 'SUFIXO_FP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 95
        end
        object lblSingularFem: TcxLabel
          Left = 10
          Top = 20
          Caption = 'Singular:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblPluralFem: TcxLabel
          Left = 159
          Top = 20
          Caption = 'Plural:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
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
      Top = 111
      Width = 761
      Height = 327
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
          DataBinding.FieldName = 'PREFIXO'
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
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_GRAMATICA'#13#10'ORDER BY PALAVRA')
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
      Origin = 'GRAMATICA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object ClientAncestralPALAVRA: TStringField
      FieldName = 'PALAVRA'
      Origin = 'PALAVRA'
      Size = 30
    end
    object ClientAncestralPREFIXO: TStringField
      FieldName = 'PREFIXO'
      Origin = 'PREFIXO'
      Size = 30
    end
    object ClientAncestralSUFIXO_MS: TStringField
      FieldName = 'SUFIXO_MS'
      Origin = 'SUFIXO_MS'
      Size = 10
    end
    object ClientAncestralSUFIXO_MP: TStringField
      FieldName = 'SUFIXO_MP'
      Origin = 'SUFIXO_MP'
      Size = 10
    end
    object ClientAncestralSUFIXO_FS: TStringField
      FieldName = 'SUFIXO_FS'
      Origin = 'SUFIXO_FS'
      Size = 10
    end
    object ClientAncestralSUFIXO_FP: TStringField
      FieldName = 'SUFIXO_FP'
      Origin = 'SUFIXO_FP'
      Size = 10
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
end
