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
        Height = 91
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
          Top = 60
          Width = 106
          Height = 26
          Cursor = crHandPoint
          Caption = 'Pesquisar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            0800000000009001000000000000000000000001000000000000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
            6100626262006363630064646400656565006666660067676700686868006969
            69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
            7100727272007373730074747400757575007676760077777700787878007979
            79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
            8100828282008383830084848400858585008686860087878700888888008989
            89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
            9100929292009393930094949400959595009696960097979700989898009999
            99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
            A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
            A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
            B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
            B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
            C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
            C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
            D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
            D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
            E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
            E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
            F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
            F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA3379E
            F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAC20022C9EF5FFFFFFFFFFFFFFFFFFFF
            FFFFFCAA2900000146E6FFFFFFFFFFFFFFFFFFFFFFFCAC290200002FB7FAFFFF
            FFFFFFFFFFFFFFFFF7A31E00000338C1FFFFFFFFFFFFFFEAE0E0E7F1A6210000
            0038BEFFFFFFFFFFFFEFAE5F51515B761F0000002CC2FFFFFFFFFFFFEB7E2139
            7175511100000030B7FFFFFFFFFFFFF68E1672E3F1F2E9AF150130B9FBFFFFFF
            FFFFFEC83571F0FFFFFFFFFFB41382F8FFFFFFFFFFFFFA9D2DC0FEFFFFFFFFFF
            E9535DE6FFFFFFFFFFFFF78B3FD4FFFFFFFFFFFFF27651E0FFFFFFFFFFFFF88E
            39D0FFFFFFFFFFFFF17252E0FFFFFFFFFFFFFCA927AEFDFFFFFFFFFFE23864EB
            FFFFFFFFFFFFFFDF543ECEFDFFFFFEF07222AEFEFFFFFFFFFFFFFFFDB6343FAC
            D1D2BD6F147EF0FFFFFFFFFFFFFFFFFFF8B553233B3D2A378BECFFFFFFFFFFFF
            FFFFFFFFFFFCDEA88F8C9BCAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8FAFE
            FFFFFFFFFFFFFFFFFFFF}
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
          Top = 60
          Width = 106
          Height = 25
          Cursor = crArrow
          Caption = 'Planilha'
          Colors.Default = clWhite
          Enabled = False
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF9F9F9EDEDEDECECECEDEDEDEDEDEDEDEDEDEDEDEDEDED
            EDEDEDEDEDEDEDEDEDEDEDEDEDECECECEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFAFAFAF6565656363636464646464646464646969696D6D6D646464
            6767676E6E6E646464636363656565AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF909090E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFFFFFFFFFFFEA
            EAEAFFFFFFFFFFFFE4E4E48D8D8DFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF979797
            D3D3D3D4D4D4CECECECFCFCFCDCDCDAEAEAE989898CCCCCCB9B9B9939393CCCC
            CCD5D5D5D0D0D0989898FFFFFFFFFFFFFFFFFF8484846D6D6D454545C2C2C2C7
            C7C7B1B1B1B3B3B3BABABAA6A6A69B9B9BBDBDBDABABAB999999BBBBBBC7C7C7
            CACACA989898FFFFFFFFFFFFFFFFFF6D6D6DFFFFFFA5A5A5ACACACFFFFFFF3F3
            F3F3F3F3FFFFFFD2D2D2B9B9B9FFFFFFDDDDDDB4B4B4FFFFFFFFFFFFD4D4D496
            9696E0E0E0ACACACA5A5A5737373F8F8F8909090A3A3A3B3B3B39B9B9B9D9D9D
            A1A1A19393938B8B8BA6A6A6969696898989A1A1A1B1B1B1C6C6C69A9A9A9A9A
            9A909090909090818181E1E1E16F6F6FB0B0B0DFDFDFC8C8C8CACACAD2D2D2B3
            B3B3A2A2A2DEDEDEBBBBBB9E9E9ED5D5D5DDDDDDCDCDCD989898949494F5F5F5
            FFFFFF888888FFFFFFBBBBBB9C9C9CB8B8B8A1A1A1A3A3A3A8A8A89797978D8D
            8DB0B0B09C9C9C8B8B8BA9A9A9B7B7B7C7C7C7999999999999CBCBCBB3B3B385
            8585DADADA6B6B6BA9A9A9ABABAB9595959797979A9A9A8C8C8C848484A0A0A0
            8F8F8F8282829A9A9AAAAAAAC5C5C59A9A9A979797D2D2D2ECECEC8B8B8BF5F5
            F5838383ABABABDCDCDCC7C7C7C8C8C8D0D0D0AEAEAE9B9B9BDBDBDBB7B7B797
            9797D1D1D1DBDBDBCCCCCC989898989898CDCDCDD6D6D68C8C8CEAEAEA7C7C7C
            A2A2A28F8F8F7979797B7B7B7D7D7D7777777373738080807979797373737B7B
            7B8F8F8FC0C0C09B9B9B999999C6C6C6A9A9A9898989D5D5D55F5F5FB4B4B491
            91917B7B7B7D7D7D7D7D7D7D7D7D7D7D7D7C7C7C7D7D7D7E7E7E7A7A7A909090
            CFCFCF969696979797D0D0D0F4F4F48F8F8FFAFAFA8F8F8F858585AFAFAFADAD
            ADADADADAEAEAEADADADACACACADADADB0B0B0A1A1A1AEAEAEC2C2C2AEAEAE9E
            9E9E9A9A9AC5C5C59A9A9A898989C0C0C07070704F4F4F515151545454555555
            555555545454555555555555474747838383606060A3A3A3B9B9B9F0F0F09898
            98C9C9C9B8B8B8999999ABABAB5454547E7E7E7E7E7E7D7D7D7A7A7A7C7C7C7D
            7D7D7A7A7A7B7B7B646464D9D9D9939393FFFFFFFFFFFFFFFFFF999999C9C9C9
            BABABA757575C0C0C0AEAEAEB3B3B3B3B3B3B2B2B2B1B1B1B2B2B2B3B3B3AEAE
            AEA6A6A6BDBDBDD3D3D3696969FDFDFDFFFFFFFFFFFF9B9B9BBCBCBC73737347
            47474646465252524E4E4E4E4E4E4F4F4F4F4F4F4E4E4E4D4D4D5C5C5C828282
            6F6F6F9F9F9FBBBBBBFFFFFFFFFFFFFFFFFF919191DADADABFBFBFB5B5B5B8B8
            B8B7B7B7B6B6B6B5B5B5B8B8B8B6B6B6B4B4B4B5B5B5C9C9C9EBEBEBA5A5A5FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD848484949494969696969696969696
            969696969696969696969696969696969696949494848484BDBDBDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
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
        Top = 91
        Width = 693
        Height = 336
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 1
        ExplicitTop = 89
        ExplicitHeight = 338
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
    Caption = 'Sair'
    Colors.Default = clWhite
    LookAndFeel.Kind = lfUltraFlat
    OptionsImage.Glyph.Data = {
      C6050000424DC605000000000000360400002800000014000000140000000100
      0800000000009001000000000000000000000001000000000000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
      1100121212001313130014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      6100626262006363630064646400656565006666660067676700686868006969
      69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
      7100727272007373730074747400757575007676760077777700787878007979
      79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
      8100828282008383830084848400858585008686860087878700888888008989
      89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
      B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
      B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
      C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
      C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
      D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
      D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
      E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
      F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
      3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
      CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
      FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
      B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
      3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
      FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
      64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
      4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
      B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
      BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
      FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
      ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
      33333333333451B8F9FF}
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
      870000009619E0BD01000000180000000300000000000300000087000A555355
      4152494F5F49440C0005000400020008444543494D414C530200020002000557
      494454480200020014000D4E4F4D455F434F4D504C45544F0100490000000100
      05574944544802000200780008484F52415F46494D0100490000000100055749
      445448020002000A000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'USUARIO_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 20
        Size = 2
      end
      item
        Name = 'NOME_COMPLETO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'HORA_FIM'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
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
    Connection = dtmControles.DB
    SQL.Strings = (
      
        'select USUARIO_ID, NOME_COMPLETO, HORA_FIM '#13#10'from G_USUARIO'#13#10'whe' +
        're  CONTROLE_HORARIO = '#39'S'#39#13#10'     and SITUACAO = '#39'A'#39#13#10'order by NO' +
        'ME_COMPLETO')
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
    Connection = dtmControles.DB
    SQL.Strings = (
      'select * '#13#10'from G_HORA_EXTRA'#13#10'where 1=0')
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
