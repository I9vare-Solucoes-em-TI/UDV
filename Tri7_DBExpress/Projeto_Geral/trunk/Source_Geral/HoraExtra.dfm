object frmHoraExtra: TfrmHoraExtra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Hora Extra'
  ClientHeight = 451
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    693
    451)
  PixelsPerInch = 96
  TextHeight = 13
  object pagControle: TcxPageControl
    Left = 0
    Top = 0
    Width = 693
    Height = 451
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tbsCadastro
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 451
    ClientRectRight = 693
    ClientRectTop = 24
    object tbsPesquisa: TcxTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Par'#226'metros para Pesquisa'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 0
        Height = 89
        Width = 693
        object gbxPeriodo: TcxGroupBox
          Left = 3
          Top = 16
          Caption = 'Per'#237'odo'
          ParentFont = False
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.IsFontAssigned = True
          TabOrder = 0
          Height = 43
          Width = 214
          object Label8: TLabel
            Left = 103
            Top = 18
            Width = 6
            Height = 13
            Caption = #224
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object edtDtPesqIni: TcxDateEdit
            Left = 9
            Top = 15
            AutoSize = False
            ParentFont = False
            Properties.DateButtons = []
            Properties.InputKind = ikMask
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleFocused.Color = clSkyBlue
            StyleFocused.TextColor = clGreen
            StyleFocused.TextStyle = [fsBold]
            StyleHot.TextStyle = [fsBold]
            TabOrder = 0
            Height = 19
            Width = 91
          end
          object edtDtPesqFim: TcxDateEdit
            Left = 114
            Top = 15
            AutoSize = False
            ParentFont = False
            Properties.DateButtons = []
            Properties.InputKind = ikMask
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleFocused.Color = clSkyBlue
            StyleFocused.TextColor = clGreen
            StyleFocused.TextStyle = [fsBold]
            StyleHot.TextStyle = [fsBold]
            TabOrder = 1
            Height = 19
            Width = 91
          end
        end
        object cxGroupBox4: TcxGroupBox
          Left = 223
          Top = 16
          Caption = 'Usu'#225'rio'
          ParentFont = False
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.IsFontAssigned = True
          TabOrder = 1
          Height = 42
          Width = 338
          object lcbUsuarioPesquisa: TcxLookupComboBox
            Left = 6
            Top = 14
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'USUARIO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME_COMPLETO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsUsuarioHorario
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 325
          end
        end
        object btnPlanilha: TcxButton
          Left = 343
          Top = 61
          Width = 106
          Height = 26
          Cursor = crHandPoint
          Caption = 'Pesquisar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000002D4B600077
            C6FF4D7E94FCDA9859FFDFA66FFFDEA56DFFDEA46CFFDDA26BFFDDA169FFDCA0
            68FFDC9F67FFDB9E65FFD58D4AFFC7782DF600000000000000000077C6FF00B8
            F7FF0088D2FF60AADBFFFFFFFFFFFFFFFEFFFFFEFDFFFFFEFCFFFFFDFBFFFFFD
            FBFFFFFCFAFFFFFCF9FFFFFEFDFFD6904EFF0000000000000000004A7B9F0097
            DEFF00C8FFFF0097DEFF60A9DAFFFFFBF6FFFFF9F2FFFFF7EEFFFFF5EBFFFFF3
            E7FFFFF1E3FFFFEFE0FFFFFBF7FFDDA36CFF000000000000000000000000004A
            7B9F0099DEFF00D3FFFF0099DEFF60A7D4FFFFF4E8FFFFF2E5FFFFF0E1FFFFEE
            DDFFFFECD9FFFFEAD6FFFFFAF4FFDFA770FF0000000000000000000000000000
            0000578FADFF008BD2FF00D4F9FF697185FFA46559FFBC7545FFB36B44FF9552
            4EFFFFE7CFFFFFE5CCFFFFF8F2FFE1AA75FF0000000000000000000000000000
            0000E8B989FF60A9D8FF6E768CFFCA8C5AFFFFB33AFFFFB632FFFFB32CFFF9A4
            2AFFAC694BFFFFE1C2FFFFF7EFFFE2AD79FF0000000000000000000000000000
            0000EABD8DFFFFFAF4FFB6847AFFFFC15AFFFFC75AFFFFC557FFFFBE44FFFFBA
            3BFFEBA03DFFA36861FFFFF6EDFFE4B17DFF0000000000000000000000000000
            0000EBC091FFFFF8F2FFD5A888FFFFE19EFFFFE19FFFFFE09AFFFFDB8FFFFFC9
            5DFFFFBF46FFB07461FFFFF5EAFFE6B482FF0000000000000000000000000000
            0000EDC496FFFFF7EFFFDABBADFFFFEFC2FFFFEFC0FFFFEEBDFFFFEBB8FFFFE5
            AAFFFFC85AFFB0796EFFFFF3E8FFE7B886FF0000000000000000000000000000
            0000EFC79AFFFFF6EDFFD5B8B7FFFFF7DCFFFFF9DBFFFFF8D9FFFFF5D4FFFFF3
            D0FFEDB874FFBB897FFFFFF2E6FFE9BB8BFF0000000000000000000000000000
            0000F0CA9EFFFFF5EAFFFFD5AAFFEAD7D3FFFFFDEFFFFFFEEEFFFFFDEAFFFAED
            DDFFBF938BFFFFCC99FFFFF2E6FFEBBE8FFF0000000000000000000000000000
            0000F2CDA3FFFFF3E8FFFFD0A0FFFFCE9DFFE0C7C3FFE6D3D1FFE4D0CDFFD2B5
            B3FFFFFFFFFFFFFFFFFFFEF7F0FFE9B882FF0000000000000000000000000000
            0000F3D1A7FFFFF2E6FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFFF
            FFFFFFFFFFFFFEFAF7FFEDC291FFC79964DB0000000000000000000000000000
            0000F5D4ABFFFFF2E6FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFFF
            FFFFFEFBF7FFEFC697FFCA9E6BDB000000000000000000000000000000000000
            0000F6D4A9FFFFFFFFFFFFF2E6FFFFF2E6FFFFF2E6FFFFF2E6FFFFF2E6FFFEF8
            F1FFF1CB9DFFCCA271DB00000000000000000000000000000000000000000000
            0000ECC795F6F7D7ACFFF7D9B1FFF7D8B0FFF6D7AFFFF6D6ADFFF5D5ACFFF1C5
            8EFFCEA778DB0000000000000000000000000000000000000000}
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnPlanilhaClick
        end
        object btnExcel: TcxButton
          Left = 455
          Top = 61
          Width = 106
          Height = 25
          Cursor = crArrow
          Caption = 'Planilha'
          Colors.Default = clWhite
          Enabled = False
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000004E2C
            166B894A23BCAE5F2EEDB4632EF7B4632EF7B4632EF7B4622EF7B4622EF7B362
            2DF7B3622DF7B3612DF7AD5E2BEF884921BD472612630000000000000000A45B
            2CDEEBE5DEF2F5EADDFDF6EBDEFFF6EADEFFF6EADCFFF6EADCFFFAF3EBFFFAF3
            EBFFFAF2EAFFFCF7F3FFFAF6F2FDEFEFEEF0995023D50000000000000000B86D
            36F5F4EADEFEFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4
            D1FFFCE4D1FFFCE4D1FFFCE4D1FFFBF9F6FDB05F2BF30000000000000000BB74
            3AF7F7EDE3FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4D1FFFCE4
            D1FFFCE4D1FFFCE4D1FFFCE4D1FFFBF7F4FFB5642FF70000000000000000BE78
            3EF7F7F0E6FFFCE4D1FFFCE4D1FFE5D9C2FF689E70FF579665FF599766FF6CA0
            73FFFCE4D1FFFCE4D1FFFCE4D1FFFCF9F5FFB96C34F70000000017692EE41A75
            33FF197533FF197433FF448A52FF619B6BFFBBD6C3FF78BB84FF61AB6AFF5796
            64FFFCE2CCFFFBE0C9FFFBE1C8FFFDFAF7FFBB7239F7000000000A2F14661B75
            33FF5BA06EFF49965CFF47905BFFC7DDCDFF5DB671FF67AE75FF448D58FF1B75
            33FFFCE2CDFFFBE1CBFFFBE1C9FFFBF7F2FFBF783DF700000000000000007D7C
            3EFA1F7837FF48915DFFC7DDCDFF6AC084FF71B682FF448E59FFB1C1A1FFFBE4
            D0FFFBE3CCFFFADFC7FFFADFC6FFFAF2EAFFC07C40F70000000000000000BC84
            47F7619E71FFC5DCCCFF76C997FF73BC87FF438D58FF559360FFF5E0CCFFFBE1
            CCFFFAE0C7FFF9DDC3FFF8DCC2FFFAF4EDFFC07E43F700000000020402076E89
            52FCC0D9C8FF82D3A3FF6DC18AFF549563FF4B9660FF519764FF679A68FFF4DC
            C3FFF8DCC2FFF6DABDFFF6D8BBFFFAF4EFFFC07F44F7000000002D5F3BACB5D3
            BEFF9CDAB5FF74C895FF549563FF4A935FFF5DA474FF59A16EFF509764FF6297
            62FFE9D1B4FFF3D4B5FFF1D2B3FFF8F4F0FFBE7E44F7000000003A7B4DDE558B
            56FE539666FF549563FFA1B995FF8DAE83FF2E7F42FF2E7F41FF3A8448FF3682
            45FF90B490FFF7F2ECFFFBF7F3FFF5EFE9FFBF7C44FB0000000000000000BF84
            49F6F9F5F1FFFCE3CDFFFBE3CEFFFBE3CDFFFBE2CBFFF9E0C8FFF8DCC2FFF5D6
            BAFFFDFBF8FFFCE6CDFFFAE5C9FFE2B684FF7C4F2BA60000000000000000B57D
            45EAF7F3EFFCFAE0C7FFFBE1C9FFFBE2C9FFFBE0C8FFF9DFC5FFF8DBC1FFF4D6
            B8FFFFFBF8FFF6D8B4FFE1B07DFFD38D60F60503020700000000000000009666
            38C3E5E0DAECF5F1EBFCF8F4EDFFF8F3EDFFF8F3EDFFF8F3EDFFF8F2ECFFF7F2
            ECFFF2E6D7FFE2B27DFFD28E61F505030207000000000000000000000000492F
            1A60936638BBBB834AEEC1874CF6C2884DF7C2884DF7C2894DF7C3884DF7C187
            4DF7A4723ED46F43229104020106000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExcelClick
        end
      end
      object grdPesquisa: TcxGrid
        Left = 0
        Top = 89
        Width = 693
        Height = 338
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 1
        ExplicitTop = 92
        object gridPesquisa: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
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
          Navigator.Visible = True
          DataController.DataSource = dtsHoraExtra
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object gridPesquisaDATA_HORA_EXTRA: TcxGridDBColumn
            Caption = 'Dt. Hora Extra'
            DataBinding.FieldName = 'DATA_HORA_EXTRA'
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object gridPesquisaUSUARIO_ID: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'USUARIO_ID'
            RepositoryItem = dtmLookup.listaG_Usuario
            Options.Editing = False
            Options.Focusing = False
            Width = 300
          end
          object gridPesquisaHORA_INICIO: TcxGridDBColumn
            Caption = 'Hora Inicio'
            DataBinding.FieldName = 'HORA_INICIO'
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
          object gridPesquisaHORA_FIM: TcxGridDBColumn
            Caption = 'Hora Fim'
            DataBinding.FieldName = 'HORA_FIM'
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
          object gridPesquisaTOTAL: TcxGridDBColumn
            Caption = 'Hora Extra'
            DataBinding.FieldName = 'TOTAL'
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
        end
        object grdPesquisaLevel1: TcxGridLevel
          GridView = gridPesquisa
        end
      end
    end
    object tbsCadastro: TcxTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 347
        Top = 0
        Width = 346
        Height = 427
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 344
          Height = 43
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 
            'Aten'#231#227'o: Solicitar que o usu'#225'rio entre novamente no sistema para' +
            ' ativar a Hora Extra.'
          Color = 14807280
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 2
          ExplicitTop = -5
        end
        object grdListagem: TcxGrid
          Left = 1
          Top = 44
          Width = 344
          Height = 292
          Align = alClient
          TabOrder = 0
          ExplicitTop = 47
          object grdListagemDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = True
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.Visible = True
            DataController.DataSource = dtsUsuario
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total:0'
                Kind = skCount
                FieldName = 'NOME_COMPLETO'
                Column = grdListagemDBTableView1NOME_COMPLETO
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.CancelOnExit = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object grdListagemDBTableView1NOME_COMPLETO: TcxGridDBColumn
              Caption = 'Usu'#225'rio'
              DataBinding.FieldName = 'NOME_COMPLETO'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.FilteringWithFindPanel = False
              Options.Focusing = False
              Width = 250
            end
            object grdListagemDBTableView1HORA_FIM: TcxGridDBColumn
              Caption = 'Hora Final'
              DataBinding.FieldName = 'HORA_FIM'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.FilteringWithFindPanel = False
              Options.Focusing = False
              Width = 80
            end
          end
          object grdListagemLevel1: TcxGridLevel
            GridView = grdListagemDBTableView1
          end
        end
        object pnlGravar: TPanel
          Left = 1
          Top = 336
          Width = 344
          Height = 90
          Align = alBottom
          Color = 14807280
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object cxLabel4: TcxLabel
            Left = 6
            Top = 12
            Caption = 'Dt. Hora Extra:'
            Style.TextColor = clGreen
            Style.TextStyle = [fsBold]
          end
          object edtDtHoraExtra: TcxDateEdit
            Left = 8
            Top = 28
            ParentFont = False
            Properties.DateButtons = []
            Properties.InputKind = ikMask
            Style.StyleController = dtmControles.cxEsc_EditsEspecial
            TabOrder = 1
            Width = 87
          end
          object cxLabel5: TcxLabel
            Left = 97
            Top = 12
            Caption = 'Hora Inicio'
            Style.TextColor = clGreen
            Style.TextStyle = [fsBold]
          end
          object edtHoraInicio: TcxMaskEdit
            Left = 99
            Top = 27
            ParentFont = False
            Properties.EditMask = '!90:00:00;1;_'
            Style.StyleController = dtmControles.cxEsc_EditsEspecial
            TabOrder = 3
            Text = '  :  :  '
            Width = 75
          end
          object btnConfirmar: TcxButton
            Left = 227
            Top = 55
            Width = 106
            Height = 25
            Cursor = crArrow
            Caption = 'Confirmar'
            Colors.Default = clWhite
            OptionsImage.Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              000000000000000000000530086007600EBF0A8711FF098D0FFF088C0EFF0783
              0CFF045807BF022B036000000000000000000000000000000000000000000000
              0000021104200C6E16CF0F9818FF0FA817FF0FA816FF0EA715FF0EA714FF0DA6
              14FF0DA613FF0A900FFF056008CF010E01200000000000000000000000000312
              0520128B20EF14A91FFF14AD1EFF14AD1DFF13AC1CFF12AB1BFF12AB1BFF11AA
              1AFF11AA19FF10A918FF0FA216FF07770DEF010F01200000000000000000137B
              22CF19AF26FF19B225FF18B124FF18B124FF17B023FF17B022FF16AF21FF16AF
              20FF15AE20FF15AE1FFF14AD1EFF12A61BFF06640CCF000000000A3B126045BC
              58FF5FCC6AFF5ACA65FF4BC557FF2ABA37FF38BE44FF7ED486FF29B835FF1AB3
              27FF1AB326FF19B225FF18B125FF18B124FF11991BFF032E06601E8031BF76DB
              86FF69D175FF65D071FF60CE6CFF7AD684FFF1FBF2FFFFFFFFFFD5F2D8FF2DBC
              3BFF1EB72DFF1EB72DFF1DB62CFF1DB62BFF1CB52AFF096110BF49C566FF78D9
              85FF74D781FF6FD57CFF86DC91FFF5FCF6FFFFFFFFFFFFFFFFFFFFFFFFFFD6F2
              D9FF31C041FF23BC34FF22BB33FF21BA32FF21BA31FF13931FFF65D883FF82DE
              90FF7EDC8CFF92E19DFFF6FDF7FFFFFFFFFFFFFFFFFFDAF5DEFFFFFFFFFFFFFF
              FFFFD6F3DAFF35C548FF27C03BFF26BF3AFF26BF39FF1AA22AFF69DB88FF8CE2
              9AFF87E196FFE0F7E4FFFFFFFFFFFFFFFFFFAAE9B4FF72DA82FFBAEDC2FFFFFF
              FFFFFFFFFFFFD7F4DBFF39C94EFF2CC542FF2BC441FF1EA730FF54D275FF99EB
              ABFF91E6A1FFC0F0C9FFF1FCF3FFB3EDBDFF80E191FF7CDF8DFF63D977FFB3ED
              BDFFFFFFFFFFFFFFFFFFD8F5DDFF3ECD55FF30C949FF1DA230FF2B9746BFA9F6
              BEFF9AEAAAFF96E9A7FF92E8A3FF8EE79FFF89E59BFF86E498FF81E394FF53D8
              6CFFB5EFC0FFFFFFFFFFFFFFFFFF69DB7DFF39D255FF137523BF124C22607BE7
              9BFFA6F1B8FF9FEDB0FF9BECADFF97EBA9FF93EAA6FF8FE9A2FF8BE89EFF87E7
              9BFF5DDE77FF9FECAFFFB7F0C3FF49D865FF33C350FF0A3B12600000000032AA
              54CFA5F6BDFFA8F2BBFFA4F0B6FFA0F0B3FF9CEFAFFF98EEACFF94ECA9FF90EB
              A5FF8DEAA2FF80E897FF60E17CFF54DE75FF1D8C34CF0000000000000000071A
              0C204BCD70EFA8F8C1FFAFF7C3FFA9F3BCFFA5F2B9FFA1F2B5FF9DF1B2FF9AF0
              AFFF96EFABFF93EFA9FF88EDA4FF38B354EF0416082000000000000000000000
              0000071B0D2035AF58CF81ECA2FFB7FDCEFFB1FAC7FFACF8C2FFA8F7BFFFA6F8
              BEFFA6FAC0FF70E18FFF299A43CF051709200000000000000000000000000000
              000000000000000000001551266031A352BF5FE185FF76E898FF73E695FF59DA
              7DFF2B9747BF11481F6000000000000000000000000000000000}
            TabOrder = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnConfirmarClick
          end
          object cxLabel1: TcxLabel
            Left = 177
            Top = 12
            Caption = 'Hora Fim'
            Style.TextColor = clGreen
            Style.TextStyle = [fsBold]
          end
          object edtHoraFim: TcxMaskEdit
            Left = 179
            Top = 27
            ParentFont = False
            Properties.EditMask = '!90:00:00;1;_'
            Style.StyleController = dtmControles.cxEsc_EditsEspecial
            TabOrder = 6
            Text = '  :  :  '
            OnExit = edtHoraFimExit
            Width = 75
          end
          object cxLabel2: TcxLabel
            Left = 256
            Top = 12
            Caption = 'Hora Extra'
            Style.TextColor = clGreen
            Style.TextStyle = [fsBold]
          end
          object edtHoraExtra: TcxMaskEdit
            Left = 258
            Top = 27
            ParentFont = False
            Properties.EditMask = '!90:00:00;1;_'
            Style.StyleController = dtmControles.cxEsc_EditsEspecial
            TabOrder = 8
            Text = '  :  :  '
            Width = 75
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 313
        Height = 427
        Align = alLeft
        ParentBackground = False
        TabOrder = 1
        object cxGrid1: TcxGrid
          Left = 1
          Top = 44
          Width = 311
          Height = 382
          Align = alClient
          TabOrder = 0
          ExplicitLeft = -3
          ExplicitTop = 47
          object cxGridDBTableView1: TcxGridDBTableView
            OnDblClick = cxGridDBTableView1DblClick
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
            DataController.DataSource = dtsUsuarioHorario
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total:0'
                Kind = skCount
                FieldName = 'LOGIN'
                Column = cxGridDBTableView1NOME_COMPLETO
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
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridDBTableView1NOME_COMPLETO: TcxGridDBColumn
              Caption = 'Usu'#225'rio'
              DataBinding.FieldName = 'NOME_COMPLETO'
              Options.Editing = False
              Options.Focusing = False
              Width = 294
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object cxGroupBox1: TcxGroupBox
          Left = 1
          Top = 1
          Align = alTop
          Caption = 'Usu'#225'rio'
          ParentFont = False
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.StyleController = dtmControles.cxEditStyleGroup
          Style.IsFontAssigned = True
          TabOrder = 1
          Height = 43
          Width = 311
          object lcbUsuarioSelecao: TcxLookupComboBox
            Left = 6
            Top = 15
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'USUARIO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME_COMPLETO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsUsuarioHorario
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 300
          end
        end
      end
      object Panel4: TPanel
        Left = 313
        Top = 0
        Width = 34
        Height = 427
        Align = alLeft
        Color = 14807280
        ParentBackground = False
        TabOrder = 2
        object btnUsuario: TBitBtn
          Left = 1
          Top = 16
          Width = 28
          Height = 25
          Hint = 'Adicionar'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000002320470057908FF047807FF0245
            049F000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000043C07800B9911FF0AA00FFF077F
            0BFF0348069F0000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000063F0A8010A019FF10A918FF0EA7
            15FF0A8910FF06610BCF0107011000000000000000000000000008370E600F6B
            1BBF0E6A19BF0D6819BF0D6717BF0C6616BF0D7418DF16A622FF17B022FF15AE
            1FFF13AC1CFF0D9016FF08640FCF01080110000000000000000027A53EFF59DD
            79FF2DC644FF2BC440FF28C13CFF26BF38FF23BC35FF21BA31FF1EB72DFF1CB5
            2AFF1AB326FF17B023FF129D1DFF0B7815EF02180430000000003AB856FF65E8
            89FF36CF51FF33CC4DFF31CA49FF2EC745FF2BC441FF29C23DFF26BF39FF24BD
            35FF21BA31FF1FB82EFF1CB52AFF16A223FF0E7F19EF031905303DBE5CFF6AED
            8FFF3FD85EFF3CD55AFF39D256FF36CF52FF34CD4EFF31CA49FF2EC745FF2CC5
            41FF29C23DFF26BF3AFF24BD36FF21BA32FF1DB02CFF10811EEF40C562FF6EF1
            96FF48E16CFF45DE68FF42DB63FF3FD85FFF3DD65BFF3AD357FF37D052FF34CD
            4EFF31CA4AFF2FC846FF2CC542FF29C23EFF4FD76BFF2FAC48FF44CC68FF73F6
            9EFF52EB7BFF4FE876FF4CE572FF49E26DFF46DF69FF43DC64FF40D960FF3DD6
            5CFF3AD357FF37D053FF35CE4FFF67E88AFF56CE77FF137322BF47D36FFF88FD
            B3FF5FF58CFF59F285FF55EE80FF52EB7CFF4FE877FF4CE572FF49E26EFF46DF
            69FF43DC65FF40D961FF72EF98FF4AC86BFF18852DCF020A031035C45EEF74F0
            9FFF7AF2A5FF7AF2A4FF79F1A4FF79F1A3FF79F0A3FF8CFBB6FF53EC7CFF50E9
            78FF51E777FF74F19CFF4ECF72FF166C299F020B0410000000000A2813301B69
            31801A6830801A672F8019662E8018652D80249642BF79F1A4FF5DF68BFF5DF3
            8AFF80F8ABFF3EC963FF1A742F9F000000000000000000000000000000000000
            0000000000000000000000000000000000001B6931807BF3A6FF76FEA5FF7DF8
            A9FF43D36CFF17622B8000000000000000000000000000000000000000000000
            0000000000000000000000000000000000001D6E35807CF6A8FF81F8ADFF3CD7
            6AFF144F24600000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000001B64327048E77BFF3ED56EEF1245
            2250000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnUsuarioClick
        end
      end
    end
  end
  object btnFechar: TcxButton
    Left = 582
    Top = 5
    Width = 106
    Height = 25
    Cursor = crArrow
    Anchors = [akTop, akRight]
    Caption = 'Fechar'
    Colors.Default = clWhite
    LookAndFeel.Kind = lfUltraFlat
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      1A3F00004EBF000068FF000068FF000068FF000068FF000068FF000068FF0000
      68FF000068FF000068FF000068FF00004EBF00001A3F0000000000001B3F0006
      76FF0046D1FF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066
      FFFF0066FFFF0066FFFF0066FFFF003FC8FF000676FF00001B3F000064DF004C
      DBFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066
      FFFF0066FFFF0066FFFF0066FFFF0066FFFF004CDBFF000064DF000077FF0066
      FFFF0066FFFF0739DFFF538BF5FF1645E1FF002EDBFF002EDBFF002EDBFF002E
      DBFF1B48E1FF6C9AF5FF093ADFFF0066FFFF0066FFFF00067FFF00007CFF0066
      FFFF076AFFFF649AF8FF7EB4FFFF7BAFFCFF1A4DE4FF0034DEFF0034DEFF1D4F
      E4FF92BCFCFFA0C8FFFF87AEF8FF0B6CFFFF0066FFFF000684FF000080FF0066
      FFFF559AFFFF8CBCFFFF91BFFFFF95C1FFFF91BCFDFF1E54E7FF2055E7FF9FC4
      FDFFAECFFFFFB2D2FFFFB7D5FFFF75ADFFFF0066FFFF000080FF000085FF0066
      FFFF096BFFFF7FADFAFFA3C9FFFFA8CCFFFFACCFFFFFA6C8FDFFABCBFDFFBBD7
      FFFFC0DAFFFFC5DDFFFFA2C1FAFF0C6DFFFF0066FFFF000085FF00008AFF0066
      FFFF0066FFFF0A4EEBFF92B9FBFFB9D6FFFFBED9FFFFC3DCFFFFC8DFFFFFCDE2
      FFFFD2E4FFFFC9DDFDFF0D50EBFF0066FFFF0066FFFF00008AFF00008FFF0066
      FFFF0066FFFF0C55EFFFA3C3FBFFCCE1FFFFD1E4FFFFD5E7FFFFDAE9FFFFDFEC
      FFFFE4EFFFFFBED3FBFF0F56EFFF0066FFFF0066FFFF00008FFF000093FF0066
      FFFF287EFFFFAECAFCFFD9E9FFFFDEEBFFFFE3EEFFFFD8E7FEFFDDEAFEFFF1F7
      FFFFF6FAFFFFFAFCFFFFCDDDFCFF0F6FFFFF0066FFFF000093FF000098FF0066
      FFFF9BC3FFFFE6F0FFFFEBF3FFFFF0F6FFFFE5EFFEFF2D76F7FF2F76F7FFEEF4
      FEFFFFFFFFFFFFFFFFFFFFFFFFFF9FC5FFFF0066FFFF000098FF00009DFF0066
      FFFF0E6EFEFFC9DDFEFFFBFDFFFFEEF4FEFF2F7CFAFF005DF9FF005DF9FF2F7C
      FAFFEFF5FEFFFFFFFFFFCFE1FEFF0F6FFFFF0066FFFF00009DFF0000A2FF297F
      FFFF0065FEFF0F6DFDFFAFCFFEFF2F81FEFF0063FDFF0063FDFF0063FDFF0063
      FDFF2F81FEFFAFCFFEFF0F6DFDFF0066FFFF297FFFFF0000A2FF000091DF7995
      E9FF2D81FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066
      FFFF0066FFFF0066FFFF0066FFFF2D81FFFF7995E9FF000091DF0000354F0B0D
      B0FF8EA2EAFFBED8FFFFBED8FFFFBED8FFFFBED8FFFFBED8FFFFBED8FFFFBED8
      FFFFBED8FFFFBED8FFFFBED8FFFF8EA2EAFF0B0DB0FF0000354F000000000000
      364F00009ADF0000B0FF0000B0FF0000B0FF0000B0FF0000B0FF0000B0FF0000
      B0FF0000B0FF0000B0FF0000B0FF00009ADF0000364F00000000}
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnFecharClick
  end
  object sqlUsuario: TClientDataSet
    PersistDataPacket.Data = {
      870000009619E0BD02000000180000000300000000000300000087000A555355
      4152494F5F49440C0012000400020008444543494D414C530200020002000557
      494454480200020014000D4E4F4D455F434F4D504C45544F0100490000000100
      05574944544802000200780008484F52415F46494D0100490000000100055749
      445448020002000A000000}
    Active = True
    Aggregates = <>
    Params = <>
    AfterDelete = sqlUsuarioAfterDelete
    Left = 440
    Top = 200
    object sqlUsuarioUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlUsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlUsuarioHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
  end
  object dtsUsuario: TDataSource
    DataSet = sqlUsuario
    Left = 480
    Top = 200
  end
  object sqlUsuarioHorario: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'select USUARIO_ID, NOME_COMPLETO, HORA_FIM '#13#10'from G_USUARIO'#13#10'whe' +
      're  CONTROLE_HORARIO = '#39'S'#39#13#10'     and SITUACAO = '#39'A'#39#13#10'order by NO' +
      'ME_COMPLETO')
    ParamData = <>
    Params = <>
    Left = 440
    Top = 168
    object sqlUsuarioHorarioUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlUsuarioHorarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlUsuarioHorarioHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
  end
  object dtsUsuarioHorario: TDataSource
    DataSet = sqlUsuarioHorario
    Left = 480
    Top = 168
  end
  object sqlHoraExtra: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = ('select * '#13#10'from G_HORA_EXTRA'#13#10'where 1=0')
    ParamData = <>
    Params = <>
    Left = 56
    Top = 176
    object sqlHoraExtraHORA_EXTRA_ID: TBCDField
      FieldName = 'HORA_EXTRA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlHoraExtraDATA_HORA_EXTRA: TSQLTimeStampField
      FieldName = 'DATA_HORA_EXTRA'
    end
    object sqlHoraExtraUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlHoraExtraHORA_INICIO: TStringField
      FieldName = 'HORA_INICIO'
      Size = 10
    end
    object sqlHoraExtraHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object sqlHoraExtraTOTAL: TStringField
      FieldName = 'TOTAL'
      Size = 10
    end
  end
  object dtsHoraExtra: TDataSource
    DataSet = sqlHoraExtra
    Left = 96
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 320
    Top = 240
    object EcluirHoraExtraSelecionada1: TMenuItem
      Caption = 'Ecluir Hora Extra Selecionada'
      ImageIndex = 7
      OnClick = EcluirHoraExtraSelecionada1Click
    end
  end
end
