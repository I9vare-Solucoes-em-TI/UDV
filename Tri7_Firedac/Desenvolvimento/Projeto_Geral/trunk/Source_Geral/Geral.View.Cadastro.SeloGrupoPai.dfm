inherited frmCadastroSeloGrupoPai: TfrmCadastroSeloGrupoPai
  Caption = 'Cadastro de Selo Grupo Pai'
  ClientHeight = 561
  ClientWidth = 784
  FormStyle = fsMDIChild
  Visible = True
  OnDestroy = FormDestroy
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited PanelBotoesBasicos: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 704
      ExplicitLeft = 704
    end
  end
  inherited StatusBar: TStatusBar
    Top = 541
    Width = 784
    ExplicitTop = 541
    ExplicitWidth = 784
  end
  inherited PanelGeral: TPanel
    Width = 784
    Height = 485
    ExplicitWidth = 784
    ExplicitHeight = 485
    inherited PanelData: TPanel
      Width = 782
      Height = 57
      ExplicitWidth = 782
      ExplicitHeight = 57
      object lblSeloGrupo: TcxLabel
        Left = 10
        Top = 10
        Caption = 'Selo Grupo'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 4210688
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
      end
      object lcbSeloGrupo: TcxDBLookupComboBox
        Left = 10
        Top = 28
        RepositoryItem = Lista_SeloGrupo
        DataBinding.DataField = 'SELO_GRUPO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 244
      end
    end
    object grdSeloGrupoPai: TcxGrid
      Left = 1
      Top = 58
      Width = 370
      Height = 426
      Align = alClient
      TabOrder = 1
      object grdSeloGrupoPaiDBTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = True
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
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdSeloGrupoPaiDBTableViewSELO_GRUPO_PAI_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'SELO_GRUPO_ID'
          RepositoryItem = Lista_SeloGrupoNumero
        end
        object grdSeloGrupoPaiDBTableViewSELO_GRUPO_ID: TcxGridDBColumn
          Caption = 'Selo Grupo'
          DataBinding.FieldName = 'SELO_GRUPO_ID'
          RepositoryItem = Lista_SeloGrupo
          Width = 300
        end
      end
      object grdSeloGrupoPaiLevel: TcxGridLevel
        GridView = grdSeloGrupoPaiDBTableView
      end
    end
    object grbSeloGrupoFilho: TcxGroupBox
      Left = 379
      Top = 58
      Align = alRight
      Caption = ' Selo Grupo Filho '
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 3
      Transparent = True
      Height = 426
      Width = 404
      object pnlSeloGrupoFilhoOpcoes: TPanel
        Left = 2
        Top = 18
        Width = 400
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object btnConfirmar: TcxButton
          Left = 284
          Top = 14
          Width = 106
          Height = 25
          Caption = 'Confirmar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFEFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFE7E8E7D0D2D1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFEEEEEE8E8F8E515452B9BBBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
            AAABAA3D3E3D232423565756E5E7E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECD4A4C4A27
            2827292B29282928848785F7F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E5E35253522929292F2F2F2E2E
            2E2E2E2E353635A1A2A1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFEBECEB797B792A2B2A2F302F2D2D2D2E2E2E303130
            2C2E2C4F514FC3C4C3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFF0F1F0979897393A392F302F3334335252524546452F312F31323133
            3433707270DEDFDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9F9
            B3B5B34B4C4B323332333433747574CECFCEB6B7B6484948323232323332393B
            39919391F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDCED0CF5A5C5A34
            35342D2E2D7C7D7CEAEAEAFEFEFEFAFAFABFBFBF343534333533353535444544
            B9BABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E8E76D6E6D3233323A3A3A8D8D
            8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC4546453536353536354F5250DD
            DFDEFFFFFFFFFFFFFFFFFFFFFFFFA6A8A63B3D3B4547459A9A9AF4F4F4FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8ACACAC494A493839383636367A7C7BECED
            ECFFFFFFFFFFFFFFFFFF5A5C5B545554ADADADF2F2F2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF3F3F3A7A7A7494A49393A39444544A1A2A2F4F5F5
            FFFFFFFFFFFFB9B9B9CCCCCCF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF2F2F2A2A3A23F403F3D3D3D595B5AC2C3C3FCFCFCFF
            FFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF6F6F6A1A2A1343634404140737573E0E0E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9999994041404142418C8F8CEFF0EFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFF3F3F39797974647464C4D4CBABABAFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFECECEC9494944647465C5E5CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFECECEC9C9C9C7E7F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFF5F5F5EFF0EF}
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btnConfirmarClick
        end
        object grbNumero: TcxGroupBox
          Left = 0
          Top = 0
          Align = alLeft
          Caption = ' N'#250'mero '
          ParentBackground = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 0
          Height = 45
          Width = 280
          object edtNumeroInicial: TcxCurrencyEdit
            Left = 10
            Top = 20
            ParentFont = False
            Properties.AssignedValues.DisplayFormat = True
            Properties.DecimalPlaces = 0
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 121
          end
          object cxLabel1: TcxLabel
            Left = 135
            Top = 20
            Caption = #224
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object edtNumeroFinal: TcxCurrencyEdit
            Left = 149
            Top = 20
            ParentFont = False
            Properties.AssignedValues.DisplayFormat = True
            Properties.DecimalPlaces = 0
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 2
            Width = 121
          end
        end
      end
      object grdSeloGrupoFilho: TcxGrid
        Left = 2
        Top = 63
        Width = 400
        Height = 361
        Align = alClient
        TabOrder = 1
        object grdSeloGrupoFilhoDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = dtsSeloGrupoFilho
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdSeloGrupoFilhoDBTableViewSELO_GRUPO_FILHO_ID: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            RepositoryItem = Lista_SeloGrupoNumero
          end
          object grdSeloGrupoFilhoDBTableViewSELO_GRUPO_ID: TcxGridDBColumn
            Caption = 'Selo Grupo'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            RepositoryItem = Lista_SeloGrupo
            Width = 300
          end
        end
        object grdSeloGrupoFilhoLevel: TcxGridLevel
          GridView = grdSeloGrupoFilhoDBTableView
        end
      end
    end
    object cxSplitter: TcxSplitter
      Left = 371
      Top = 58
      Width = 8
      Height = 426
      HotZoneClassName = 'TcxMediaPlayer9Style'
      Control = grbSeloGrupoFilho
    end
  end
  inherited ActionList1: TActionList
    Top = 141
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      
        'SELECT'#13#10'    G_SGP.SELO_GRUPO_PAI_ID,'#13#10'    G_SGP.SELO_GRUPO_ID'#13#10'F' +
        'ROM'#13#10'    G_SELO_GRUPO_PAI G_SGP'#13#10'ORDER BY'#13#10'    G_SGP.SELO_GRUPO_' +
        'PAI_ID')
    Left = 61
    Top = 189
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 61
    Top = 237
  end
  inherited ClientAncestral: TClientDataSet
    Left = 61
    Top = 285
    object ClientAncestralSELO_GRUPO_PAI_ID: TBCDField
      FieldName = 'SELO_GRUPO_PAI_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralSELO_GRUPO_ID: TBCDField
      FieldName = 'SELO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 61
    Top = 333
  end
  object dtsSeloGrupo: TDataSource
    AutoEdit = False
    DataSet = qrySeloGrupo
    Left = 251
    Top = 66
  end
  object qrySeloGrupo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '    G_SG.SELO_GRUPO_ID,'
      '    G_SG.DESCRICAO_COMPLETA,'
      '    G_SG.NUMERO,'
      '    G_SG.SISTEMA_ID'
      'FROM'
      '    G_SELO_GRUPO G_SG'
      'WHERE'
      '    G_SG.SITUACAO = :P_SITUACAO'
      'ORDER BY'
      '    G_SG.DESCRICAO')
    Left = 183
    Top = 66
    ParamData = <
      item
        Name = 'P_SITUACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'A'
      end>
    object qrySeloGrupoSELO_GRUPO_ID: TBCDField
      FieldName = 'SELO_GRUPO_ID'
      Origin = 'SELO_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object qrySeloGrupoNUMERO: TBCDField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 18
      Size = 2
    end
  end
  object cxEditRepository: TcxEditRepository
    Left = 144
    Top = 141
    object Lista_SeloGrupo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o Completa'
          Width = 300
          FieldName = 'DESCRICAO_COMPLETA'
        end
        item
          Caption = 'N'#250'mero'
          FieldName = 'NUMERO'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
    object Lista_SeloGrupoNumero: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          Caption = 'N'#250'mero'
          FieldName = 'NUMERO'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
  end
  object qrySeloGrupoFilho: TI9Query
    IndexFieldNames = 'SELO_GRUPO_PAI_ID'
    MasterSource = SourceAncestral
    MasterFields = 'SELO_GRUPO_PAI_ID'
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '    G_SGF.SELO_GRUPO_FILHO_ID,'
      '    G_SGF.SELO_GRUPO_PAI_ID,'
      '    G_SGF.SELO_GRUPO_ID'
      'FROM'
      '    G_SELO_GRUPO_FILHO G_SGF'
      'ORDER BY'
      '    G_SGF.SELO_GRUPO_PAI_ID')
    Left = 360
    Top = 208
    object qrySeloGrupoFilhoSELO_GRUPO_FILHO_ID: TBCDField
      FieldName = 'SELO_GRUPO_FILHO_ID'
      Origin = 'SELO_GRUPO_FILHO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoFilhoSELO_GRUPO_PAI_ID: TBCDField
      FieldName = 'SELO_GRUPO_PAI_ID'
      Origin = 'SELO_GRUPO_PAI_ID'
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoFilhoSELO_GRUPO_ID: TBCDField
      FieldName = 'SELO_GRUPO_ID'
      Origin = 'SELO_GRUPO_ID'
      Precision = 18
      Size = 2
    end
  end
  object dtsSeloGrupoFilho: TDataSource
    AutoEdit = False
    DataSet = qrySeloGrupoFilho
    Left = 452
    Top = 208
  end
end
