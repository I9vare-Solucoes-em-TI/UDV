inherited frmValoresDiversos: TfrmValoresDiversos
  Left = 364
  Top = 251
  Caption = 'Inser'#231#227'o de Valores Diversos'
  ClientHeight = 308
  ClientWidth = 652
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 658
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 652
    Height = 308
    ExplicitWidth = 652
    ExplicitHeight = 308
    inherited Shape1: TShape
      Width = 640
      Height = 296
      ExplicitLeft = 4
      ExplicitTop = 8
      ExplicitWidth = 640
      ExplicitHeight = 296
    end
    inherited btnCancelar: TcxButton
      Left = 529
      Top = 267
      LookAndFeel.SkinName = ''
      ExplicitLeft = 529
      ExplicitTop = 267
    end
    object pgvValores: TcxPageControl
      Left = 9
      Top = 8
      Width = 632
      Height = 253
      TabOrder = 1
      Properties.ActivePage = tabMoeda
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 253
      ClientRectRight = 632
      ClientRectTop = 24
      object tabMoeda: TcxTabSheet
        Caption = 'Sistema Monet'#225'rio e Data'
        ImageIndex = 0
        object grdMoeda: TcxGrid
          Left = 0
          Top = 0
          Width = 632
          Height = 193
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          object cxGridTableMoedas: TcxGridDBTableView
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
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dtsMoedas
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridMoeda: TcxGridDBColumn
              DataBinding.FieldName = 'Moeda'
              Width = 157
            end
            object cxGridSimbolo: TcxGridDBColumn
              DataBinding.FieldName = 'Simbolo'
              Width = 79
            end
            object cxGridVigencia: TcxGridDBColumn
              Caption = 'Vig'#234'ncia'
              DataBinding.FieldName = 'Vigencia'
              Width = 196
            end
            object cxGridConversao: TcxGridDBColumn
              Caption = 'Convers'#227'o'
              DataBinding.FieldName = 'Conversao'
              Width = 169
            end
          end
          object cxGridMoedas: TcxGridLevel
            GridView = cxGridTableMoedas
          end
        end
        object cxLabel13: TcxLabel
          Left = 2
          Top = 205
          Caption = 'Valor:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtValorNumero: TcxCurrencyEdit
          Left = 34
          Top = 203
          ParentFont = False
          Properties.OnChange = edtValorNumeroPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 122
        end
        object cxLabel1: TcxLabel
          Left = 162
          Top = 204
          Caption = 'Extenso:'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtValorExtenso: TcxCurrencyEdit
          Left = 210
          Top = 201
          Enabled = False
          ParentFont = False
          Style.Shadow = True
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.TextColor = clNavy
          TabOrder = 2
          Width = 418
        end
      end
      object tabData: TcxTabSheet
        Caption = 'Tipos de Data'
        ImageIndex = 1
        object cxLabel7: TcxLabel
          Left = 14
          Top = 14
          Caption = 'Data Lavratura'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtPesqDataInicial: TcxDateEdit
          Left = 16
          Top = 30
          ParentFont = False
          Properties.DateButtons = []
          Properties.InputKind = ikMask
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 115
        end
        object icxPesqSituacao: TcxImageComboBox
          Left = 16
          Top = 53
          ParentFont = False
          Properties.Items = <
            item
              Description = 'Data de Lavratura Modelo 1 * 01/01/2007'
              ImageIndex = 0
              Value = '1'
            end
            item
              Description = 'Data de Lavratura Modelo 2  *  01 de janeiro de 2006'
              Value = '2'
            end
            item
            end>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 441
        end
      end
      object tabPartes: TcxTabSheet
        Caption = 'Partes'
        ImageIndex = 2
        object cxDBTreeList1: TcxDBTreeList
          Left = 0
          Top = 0
          Width = 632
          Height = 229
          Align = alClient
          Bands = <
            item
              Caption.AlignHorz = taCenter
              Caption.GlyphAlignHorz = taCenter
              Caption.Text = 'Partes do Ato'
              Styles.Header = dtmControles.cxStyle24
              Width = 604
            end>
          DataController.DataSource = SourceAncestral
          DataController.ParentField = 'AUXILIAR_ID'
          DataController.KeyField = 'ATO_VINCULOPARTE_ID'
          DragCursor = crHandPoint
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          Navigator.Buttons.CustomButtons = <>
          OptionsData.Deleting = False
          OptionsSelection.MultiSelect = True
          OptionsView.Bands = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = tlglVert
          Preview.LeftIndent = 2
          Preview.MaxLineCount = 2
          Preview.Place = tlppTop
          Preview.Visible = True
          RootValue = -1
          TabOrder = 0
          object cxDBTreeListColumn1: TcxDBTreeListColumn
            Caption.Text = 'V'#237'nculo'
            DataBinding.FieldName = 'TIPO_VINCULO'
            Options.Editing = False
            Width = 43
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListColumn3: TcxDBTreeListColumn
            Caption.Text = 'Nome'
            DataBinding.FieldName = 'PESSOA_NOME'
            Options.Editing = False
            Options.Sorting = False
            Width = 232
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListColumn4: TcxDBTreeListColumn
            Caption.Text = 'Tipo'
            DataBinding.FieldName = 'ATO_PARTETIPO_ID'
            Options.Editing = False
            Options.Sorting = False
            Width = 114
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeListColumn5: TcxDBTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Caption.Text = 'N'#186' Im'#243'veis Vinculados'
            DataBinding.FieldName = 'calc_Quantidade'
            Options.Editing = False
            Width = 110
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            Caption.Text = 'Selecionar'
            DataBinding.FieldName = 'calc_Selecionado'
            Width = 61
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
      end
      object tabImovel: TcxTabSheet
        Caption = 'Imovel'
        ImageIndex = 3
        object grdImovel: TcxGrid
          Left = 0
          Top = 0
          Width = 632
          Height = 229
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelOptions.DetailTabsPosition = dtpTop
          RootLevelStyles.Tab = dtmControles.cxStyle14
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          object cxGridUrbano: TcxGridDBTableView
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
            FilterBox.Visible = fvNever
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridUrbanoImovel: TcxGridDBColumn
              Caption = 'Im'#243'vel'
              DataBinding.FieldName = 'NUMERO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 59
            end
            object cxGridUrbanoEstado: TcxGridDBColumn
              DataBinding.FieldName = 'UF'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 39
            end
            object cxGridUrbanoQuadra: TcxGridDBColumn
              Caption = 'Quadra'
              DataBinding.FieldName = 'QUADRA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 53
            end
            object cxGridUrbanoLote: TcxGridDBColumn
              Caption = 'Lote'
              DataBinding.FieldName = 'NUMERO_UNIDADE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 43
            end
            object cxGridUrbanoBairro: TcxGridDBColumn
              Caption = 'Bairro'
              DataBinding.FieldName = 'TB_BAIRRO_ID'
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 152
            end
            object cxGridUrbanoTipoImovel: TcxGridDBColumn
              Caption = 'Tipo Im'#243'vel'
              DataBinding.FieldName = 'TIPO_IMOVEL'
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 93
            end
            object cxGridUrbanoComplemento: TcxGridDBColumn
              Caption = 'Unidade'
              DataBinding.FieldName = 'COMPLEMENTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 54
            end
            object cxGridUrbanoClasse: TcxGridDBColumn
              DataBinding.FieldName = 'TIPO_CLASSE'
              Visible = False
              Options.Editing = False
            end
            object cxGridUrbanoDBColumn1: TcxGridDBColumn
              Caption = 'Selecionar'
              DataBinding.FieldName = 'calc_Selecionado'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayGrayed = 'False'
              Properties.NullStyle = nssUnchecked
              Width = 67
            end
            object cxGridUrbanoMostrar: TcxGridDBColumn
              DataBinding.FieldName = 'calc_Mostrar'
              Visible = False
            end
          end
          object cxGridRural: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FilterBox.Visible = fvNever
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridRuralImovel: TcxGridDBColumn
              Caption = 'Im'#243'vel'
              DataBinding.FieldName = 'NUMERO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 60
            end
            object cxGridRuralNomeIdentificacao: TcxGridDBColumn
              Caption = 'Nome Identifica'#231#227'o'
              DataBinding.FieldName = 'LOGRADOURO'
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 227
            end
            object cxGridRuralCaracteristicas: TcxGridDBColumn
              Caption = 'Caracter'#237'sticas'
              DataBinding.FieldName = 'CARACTERISTICA'
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 129
            end
            object cxGridRuralArea: TcxGridDBColumn
              Caption = #193'rea (m2)'
              DataBinding.FieldName = 'AREA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;(,0.00)'
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Styles.Header = dtmControles.cxStyle11
              Width = 86
            end
            object cxGridRuralClasse: TcxGridDBColumn
              DataBinding.FieldName = 'TIPO_CLASSE'
              Visible = False
              Options.Editing = False
            end
            object cxGridRuralDBColumn1: TcxGridDBColumn
              Width = 28
            end
            object cxGridRuralDBColumn2: TcxGridDBColumn
              Caption = 'Selecionar'
              DataBinding.FieldName = 'calc_Selecionado'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayGrayed = 'False'
              Properties.NullStyle = nssUnchecked
            end
            object cxGridRuralMostrar: TcxGridDBColumn
              DataBinding.FieldName = 'calc_Mostrar'
              Visible = False
            end
          end
          object cxGridLevelUrbano: TcxGridLevel
            Caption = 'Urbano'
            GridView = cxGridUrbano
            Options.DetailFrameWidth = 0
            Options.DetailTabsPosition = dtpTop
          end
          object cxGridLevelRural: TcxGridLevel
            Caption = 'Rural'
            GridView = cxGridRural
            Options.DetailFrameWidth = 0
            Options.DetailTabsPosition = dtpTop
          end
        end
      end
    end
    object btnCadastrar: TcxButton
      Left = 428
      Top = 267
      Width = 95
      Height = 22
      HelpType = htKeyword
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCadastrarClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000130B0000130B00000000000000000000FFFFFFFFFFFF
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
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    Left = 496
    Top = 76
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 528
    Top = 76
  end
  inherited ClientAncestral: TClientDataSet
    Left = 560
    Top = 76
  end
  inherited SourceAncestral: TDataSource
    Left = 592
    Top = 76
  end
  object sqlMoedas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = sqlMoedasAfterScroll
    Left = 33
    Top = 159
    Data = {
      8B0000009619E0BD0100000018000000040000000000030000008B00054D6F65
      646101004900000001000557494454480200020014000753696D626F6C6F0100
      49000000010005574944544802000200050008566967656E6369610100490000
      000100055749445448020002001E0009436F6E76657273616F01004900000001
      000557494454480200020032000000}
    object sqlMoedasMoeda: TStringField
      FieldName = 'Moeda'
    end
    object sqlMoedasSimbolo: TStringField
      FieldName = 'Simbolo'
      Size = 5
    end
    object sqlMoedasVigencia: TStringField
      FieldName = 'Vigencia'
      Size = 30
    end
    object sqlMoedasConversao: TStringField
      FieldName = 'Conversao'
      Size = 50
    end
  end
  object dtsMoedas: TDataSource
    DataSet = sqlMoedas
    Left = 65
    Top = 159
  end
  object sqlImoveis: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT V.*,'#13#10'       I.TIPO_CLASSE, I.NUMERO, I.UF, TB_BAIRRO_ID,' +
      ' I.IMOVEL_ID,'#13#10'       U.NUMERO_UNIDADE, U.QUADRA, U.AREA, U.TIPO' +
      '_IMOVEL,'#13#10'       U.LOGRADOURO, U.CARACTERISTICA, U.COMPLEMENTO'#13#10 +
      'FROM T_ATO_VINCULOIMOVEL V'#13#10'LEFT OUTER JOIN T_IMOVEL_UNIDADE U'#13#10 +
      '  ON V.IMOVEL_UNIDADE_ID = U.IMOVEL_UNIDADE_ID'#13#10'LEFT OUTER JOIN ' +
      'T_IMOVEL I'#13#10'  ON U.IMOVEL_ID = I.IMOVEL_ID'#13#10'WHERE V.ATO_ID = :AT' +
      'O_ID'#13#10'ORDER BY V.ATO_VINCULOIMOVEL_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'ATO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 33
    Top = 198
    object sqlImoveisATO_VINCULOIMOVEL_ID: TFMTBCDField
      FieldName = 'ATO_VINCULOIMOVEL_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlImoveisATO_ID: TFMTBCDField
      FieldName = 'ATO_ID'
      Precision = 15
      Size = 2
    end
    object sqlImoveisREGISTRO_NUMERO: TStringField
      FieldName = 'REGISTRO_NUMERO'
      Size = 15
    end
    object sqlImoveisIMOVEL_UNIDADE_ID: TFMTBCDField
      FieldName = 'IMOVEL_UNIDADE_ID'
      Precision = 15
      Size = 2
    end
    object sqlImoveisTIPO_CLASSE: TStringField
      FieldName = 'TIPO_CLASSE'
      Size = 1
    end
    object sqlImoveisNUMERO: TFMTBCDField
      FieldName = 'NUMERO'
      Precision = 15
      Size = 2
    end
    object sqlImoveisUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object sqlImoveisTB_BAIRRO_ID: TFMTBCDField
      FieldName = 'TB_BAIRRO_ID'
      Precision = 15
      Size = 2
    end
    object sqlImoveisIMOVEL_ID: TFMTBCDField
      FieldName = 'IMOVEL_ID'
      Precision = 15
      Size = 2
    end
    object sqlImoveisNUMERO_UNIDADE: TStringField
      FieldName = 'NUMERO_UNIDADE'
      Size = 10
    end
    object sqlImoveisQUADRA: TStringField
      FieldName = 'QUADRA'
      Size = 15
    end
    object sqlImoveisAREA: TFMTBCDField
      FieldName = 'AREA'
      Precision = 15
      Size = 2
    end
    object sqlImoveisTIPO_IMOVEL: TFMTBCDField
      FieldName = 'TIPO_IMOVEL'
      Precision = 15
      Size = 2
    end
    object sqlImoveisLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 90
    end
    object sqlImoveisCARACTERISTICA: TStringField
      FieldName = 'CARACTERISTICA'
      Size = 120
    end
    object sqlImoveisCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 10
    end
    object sqlImoveiscalc_Selecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Selecionado'
    end
    object sqlImoveiscalc_Mostrar: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Mostrar'
    end
  end
  object dtsImoveis: TDataSource
    DataSet = sqlImoveis
    Left = 65
    Top = 198
  end
end
