inherited frmCadSeloGrupo: TfrmCadSeloGrupo
  Left = 276
  Top = 239
  Caption = 'Cadastro Grupo de Selo'
  ClientHeight = 425
  ClientWidth = 829
  OldCreateOrder = True
  ExplicitWidth = 845
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 829
    ExplicitWidth = 829
    inherited PanelBotoesBasicos: TPanel
      Width = 646
      ExplicitWidth = 646
    end
    inherited PanelBotaoFechar: TPanel
      Left = 648
      Width = 179
      ExplicitLeft = 648
      ExplicitWidth = 179
      inherited cxBtnFechar: TcxButton
        Left = 113
        Top = 3
        ExplicitLeft = 113
        ExplicitTop = 3
      end
      object btnValidar: TcxButton
        Left = 13
        Top = 26
        Width = 95
        Height = 22
        Caption = 'Validar Selos'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B0000000100000000000000000000CCCC
          CC007C7C7C00373737001F1F1F00A9A9A900FFFFFF00161616004F4F4F00A0A0
          A000E5E5E5000E0E0E00BDBDBD00606060003030300089898900DDDDDD004444
          4400F3F3F300767676009C9C9C00B5B5B500060606001C1C1C002A2A2A005D5D
          5D00D3D3D300C9C9C9003D3D3D0014141400EDEDED0085858500C7C7C7002424
          2400FBFBFB0066666600AFAFAF00A5A5A500E3E3E30047474700DADADA003C3C
          3C00BBBBBB000B0B0B00000000001818180054545400EBEBEB001E1E1E00D8D8
          D80033333300D0D0D000F1F1F10010101000525252008B8B8B006B6B6B008181
          8100080808003A3A3A0042424200272727004B4B4B002C2C2C00A7A7A700A3A3
          A3001A1A1A002222220040404000ABABAB00B1B1B1003838380050505000BFBF
          BF0063636300F5F5F500787878009F9F9F00B7B7B7005E5E5E00878787004848
          48008D8D8D000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060624040000
          0000000000000000000000230606062435000000000000000000000000000000
          0D4B101716161744111111111111111111033A3A3A4A143A3A08340606060606
          060606060606150B3A3A4D2B2B15060606060606060606060606063F2B2B090B
          0B1B06060606065013060606060606290B0B41353520060606060F3535410606
          0606061C3535411D1D200606061F1D1D1D2D3306060606031D1D2507071B0606
          3907070707073234060606380707252D2D1B060F2D2D2D2D2D2D2D1906060622
          0D2D251717282A1717171717171717170F0606062252400404331E1104040402
          05180404042A060606060543431B062F51434C06061A3243430E260606060521
          210106062F09060606063147212148220606253D3D2A06060606060606060610
          293D3D0206062518182312060606060606060606261118181E0626443F3F3C2E
          2E2E2E2406060606060A44270606060C290E0E0E0E0E0E0E410606060606261B
          06060606493E323232323232321B060606060606060606060606060606060606
          06060606060606060606}
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnValidarClick
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 405
    Width = 829
    ExplicitTop = 405
    ExplicitWidth = 829
  end
  inherited PanelGeral: TPanel
    Width = 829
    Height = 349
    ExplicitWidth = 829
    ExplicitHeight = 349
    inherited PanelData: TPanel
      Width = 827
      Height = 88
      ExplicitWidth = 827
      ExplicitHeight = 88
      object cxLabel1: TcxLabel
        Left = 8
        Top = 9
        Caption = 'Desc. Resumida:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel2: TcxLabel
        Left = 352
        Top = 9
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 62
        Caption = 'Desc. Completa:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel6: TcxLabel
        Left = 463
        Top = 9
        Caption = 'Estoque M'#237'nimo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel4: TcxLabel
        Left = 612
        Top = 9
        Caption = 'Selo Usu'#225'rio:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 92
        Top = 7
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 254
      end
      object edtNumeto: TcxDBTextEdit
        Left = 400
        Top = 7
        DataBinding.DataField = 'NUMERO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 63
      end
      object edtEstoqueMinimo: TcxDBTextEdit
        Left = 546
        Top = 7
        DataBinding.DataField = 'ESTOQUE_MINIMO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 7
        Width = 63
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 679
        Top = 7
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'SELO_USUARIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 73
      end
      object chbSituacao: TcxDBCheckBox
        Left = 760
        Top = 5
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 9
        Transparent = True
        Height = 21
        Width = 58
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 92
        Top = 35
        RepositoryItem = dtmLookup.Lista_SeloTipoCartorio
        DataBinding.DataField = 'TIPO_CARTORIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 254
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 92
        Top = 60
        DataBinding.DataField = 'DESCRICAO_COMPLETA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 11
        Width = 726
      end
      object lblSistema: TcxLabel
        Left = 352
        Top = 35
        Caption = 'Sistema:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object ibxSistema: TcxDBImageComboBox
        Left = 400
        Top = 34
        RepositoryItem = dtmLookup.Combo_Sistema
        DataBinding.DataField = 'SISTEMA_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            Description = 'Registro de Im'#243'veis'
            ImageIndex = 3
            Value = '1'
          end
          item
            Description = 'Tabelionato de Notas'
            ImageIndex = 4
            Value = '2'
          end
          item
            Description = 'RTD & Pessoa Jur'#237'dica'
            Value = '7'
          end
          item
            Description = 'Geral'
            Value = '9'
          end
          item
            Description = 'Registro Civil'
            Value = '12'
          end
          item
            Description = 'Protesto'
            Value = '13'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 13
        Width = 418
      end
    end
    object cxLabel3: TcxLabel
      Left = 9
      Top = 35
      Caption = 'Tipo Cart'#243'rio:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
    end
    object tabGrupo: TcxTabControl
      Left = 1
      Top = 89
      Width = 827
      Height = 259
      Align = alClient
      TabOrder = 2
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Ativos'
        'Inativos'
        'Todos')
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      OnChange = tabGrupoChange
      ClientRectBottom = 259
      ClientRectRight = 827
      ClientRectTop = 24
      object grdBasica: TcxGrid
        Left = 0
        Top = 24
        Width = 827
        Height = 235
        Align = alClient
        TabOrder = 0
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
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDBCodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            Visible = False
            Width = 68
          end
          object grdBasicaDBTableViewNUMERO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'NUMERO'
            Width = 60
          end
          object grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Completa'
            DataBinding.FieldName = 'DESCRICAO_COMPLETA'
            Width = 323
          end
          object grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn
            Caption = 'Tipo Cart'#243'rio'
            DataBinding.FieldName = 'TIPO_CARTORIO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <>
            RepositoryItem = dtmLookup.Lista_SeloTipoCartorio
            Width = 246
          end
          object grdBasicaDBTableView1Column2: TcxGridDBColumn
            Caption = 'Controle Automatico'
            DataBinding.FieldName = 'CONTROLE_AUTOMATICO'
            RepositoryItem = dtmLookup.Combo_SimNao
            Width = 126
          end
          object cxGridBasicaDBSituacao: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            RepositoryItem = dtmLookup.Combo_AtivoInativo
            Width = 99
          end
          object grdBasicaDBTableView1ESTOQUE_MINIMO: TcxGridDBColumn
            Caption = 'Estoque M'#237'nimo'
            DataBinding.FieldName = 'ESTOQUE_MINIMO'
            Width = 110
          end
          object grdBasicaDBTableView1SISTEMA_ID: TcxGridDBColumn
            Caption = 'Sistema'
            DataBinding.FieldName = 'SISTEMA_ID'
            RepositoryItem = dtmLookup.Combo_Sistema
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 245
    Top = 298
    inherited ExecutePesquisa: TAction
      Visible = False
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM G_SELO_GRUPO'#13#10'ORDER BY TIPO_CARTORIO, NUMERO'
    Left = 275
    Top = 298
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 307
    Top = 298
  end
  inherited ClientAncestral: TClientDataSet
    FieldDefs = <
      item
        Name = 'SELO_GRUPO_ID'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NUMERO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTROLE_AUTOMATICO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SISTEMA_ID'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'TIPO_CARTORIO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DESCRICAO_COMPLETA'
        DataType = ftString
        Size = 260
      end
      item
        Name = 'ESTOQUE_MINIMO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'NOME_GRUPO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'ID_GRUPO_SELO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'PAGINA_ACRESCE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SELO_USUARIO'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    Left = 339
    Top = 298
    object ClientAncestralSELO_GRUPO_ID: TFMTBCDField
      FieldName = 'SELO_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralNUMERO: TFMTBCDField
      FieldName = 'NUMERO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTROLE_AUTOMATICO: TStringField
      FieldName = 'CONTROLE_AUTOMATICO'
      Size = 1
    end
    object ClientAncestralTIPO_CARTORIO: TStringField
      FieldName = 'TIPO_CARTORIO'
      Size = 3
    end
    object ClientAncestralDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object ClientAncestralESTOQUE_MINIMO: TFMTBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPAGINA_ACRESCE: TStringField
      FieldName = 'PAGINA_ACRESCE'
      Size = 1
    end
    object ClientAncestralSELO_USUARIO: TStringField
      FieldName = 'SELO_USUARIO'
      Size = 1
    end
    object ClientAncestralSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 371
    Top = 298
  end
end