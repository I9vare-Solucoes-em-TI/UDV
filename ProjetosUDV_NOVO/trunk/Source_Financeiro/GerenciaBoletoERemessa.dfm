object frmGerenciaBoletoRemessa: TfrmGerenciaBoletoRemessa
  Left = 0
  Top = 0
  Caption = 'Gerenciador de Boletos'
  ClientHeight = 470
  ClientWidth = 1207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFiltro: TcxPageControl
    Left = 0
    Top = 70
    Width = 1207
    Height = 400
    Align = alClient
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = tbcRemessa
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 6
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Black'
    OnChange = pgcFiltroChange
    ClientRectBottom = 400
    ClientRectRight = 1207
    ClientRectTop = 24
    object tbcBoleto: TcxTabSheet
      Hint = 'Filtro de Pesquisa'
      Caption = 'Boletos'
      Color = clBtnFace
      ImageIndex = 0
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      object tabPrevisoes: TcxTabControl
        Left = 0
        Top = 0
        Width = 1207
        Height = 376
        Align = alClient
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.TabIndex = 2
        Properties.Tabs.Strings = (
          '+'
          'Vencidos/Dia Atual'
          'At'#233' 7 Dias'
          'M'#234's Atual'
          'Pr'#243'ximo M'#234's'
          'At'#233' 2 Meses'
          'At'#233' 6 Meses'
          'At'#233' 12 Meses'
          'At'#233' Final do Ano'
          'Personalizado')
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        OnChange = tabPrevisoesChange
        ClientRectBottom = 372
        ClientRectLeft = 4
        ClientRectRight = 1203
        ClientRectTop = 28
        object cxPageControl1: TcxPageControl
          Left = 366
          Top = 54
          Width = 837
          Height = 318
          Align = alClient
          TabOrder = 3
          Properties.CustomButtons.Buttons = <>
          ExplicitLeft = 362
          ExplicitTop = 50
          ExplicitWidth = 845
          ExplicitHeight = 326
          ClientRectBottom = 318
          ClientRectRight = 837
          ClientRectTop = 0
        end
        object pnlPesquisaPersonalizada: TPanel
          Left = 4
          Top = 28
          Width = 1199
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          Visible = False
          ExplicitLeft = 0
          ExplicitTop = 24
          ExplicitWidth = 1207
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 1199
            Height = 29
            Align = alTop
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 1207
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 368
              Height = 29
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 0
              object cxLabel2: TcxLabel
                Left = 5
                Top = 5
                Caption = 'Nome:'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object edtPesqNome: TcxTextEdit
                Left = 42
                Top = 5
                ParentFont = False
                Properties.CharCase = ecUpperCase
                Properties.OnChange = edtPesqNomePropertiesChange
                Style.BorderStyle = ebsUltraFlat
                Style.LookAndFeel.Kind = lfOffice11
                Style.LookAndFeel.NativeStyle = False
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                StyleDisabled.LookAndFeel.Kind = lfOffice11
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.Kind = lfOffice11
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.Kind = lfOffice11
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 1
                OnExit = edtPesqNomeExit
                OnKeyDown = edtPesqNomeKeyDown
                Width = 320
              end
            end
            object Panel7: TPanel
              Left = 615
              Top = 0
              Width = 225
              Height = 29
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 2
              object btnPesquisar: TcxButton
                Left = 0
                Top = 4
                Width = 95
                Height = 22
                Caption = 'Pesquisar'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  C6050000424DC605000000000000360400002800000014000000140000000100
                  08000000000090010000130B0000130B00000001000000000000000000000101
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
                TabOrder = 0
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnPesquisarClick
              end
              object btnLimpar: TcxButton
                Left = 99
                Top = 4
                Width = 95
                Height = 22
                Caption = 'Limpar'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  C6050000424DC605000000000000360400002800000014000000140000000100
                  08000000000090010000B00D0000B00D00000001000000000000000000000101
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
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
                  687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
                  68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
                  FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
                  F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
                  FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
                  39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF}
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnLimparPesqClick
              end
            end
            object pnlPeriodoPersonalizado: TPanel
              Left = 368
              Top = 0
              Width = 247
              Height = 29
              Align = alLeft
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 1
              object cxLabel10: TcxLabel
                Left = 5
                Top = 5
                Caption = 'Per'#237'odo:'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object edtDataInicial: TcxDateEdit
                Left = 49
                Top = 4
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 0
                Width = 90
              end
              object cxLabel3: TcxLabel
                Left = 141
                Top = 5
                Caption = 'a'
                Style.TextColor = 16384
                Style.TextStyle = []
                Transparent = True
              end
              object edtDataFinal: TcxDateEdit
                Left = 152
                Top = 4
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 1
                Width = 90
              end
            end
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 4
          Top = 54
          Align = alLeft
          Caption = ' Cliente(s) '
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 1
          ExplicitLeft = 0
          ExplicitTop = 50
          ExplicitHeight = 326
          Height = 318
          Width = 362
          object cxGridCliente: TcxGrid
            Left = 2
            Top = 43
            Width = 358
            Height = 273
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            ExplicitHeight = 281
            object cxGridClienteDBTableView2: TcxGridDBTableView
              OnKeyPress = cxGridClienteDBTableView2KeyPress
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
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              OnCustomDrawCell = cxGridClienteDBTableView2CustomDrawCell
              OnFocusedRecordChanged = cxGridClienteDBTableView2FocusedRecordChanged
              DataController.DataSource = dtsPessoaAux
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  FieldName = 'PESSOA_ID'
                end
                item
                  Format = 'Qtd.: 0'
                  Kind = skCount
                  Column = cxGridClienteDBTableView2NOME
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.MRUItemsListCount = 5
              Filtering.ColumnPopup.MaxDropDownItemCount = 10
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnGrouping = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              Styles.Inactive = dtmControles.cxStyle23
              Styles.GroupByBox = dtmControles.cxStyle7
              object cxGridClienteDBTableView2NOME: TcxGridDBColumn
                Caption = 'Nome'
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Options.Grouping = False
                Options.Sorting = False
                Width = 280
              end
              object cxGridClienteDBTableView2SELECIONADO: TcxGridDBColumn
                Caption = 'Selecionar?'
                DataBinding.FieldName = 'SELECIONADO'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Properties.OnChange = cxGridClienteDBTableView2SELECIONADOPropertiesChange
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 76
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridClienteDBTableView2
            end
          end
          object Panel1: TPanel
            Left = 2
            Top = 18
            Width = 358
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitTop = 5
            object lblMarcar: TcxLabel
              Left = 193
              Top = 4
              Cursor = crHandPoint
              Caption = 'Marcar Todos'
              ParentColor = False
              ParentFont = False
              Style.Color = clCream
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clNavy
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              Style.TextColor = clGreen
              Style.TextStyle = []
              Style.IsFontAssigned = True
              Transparent = True
              OnClick = lblMarcarClick
            end
            object lblDesmarcar: TcxLabel
              Left = 264
              Top = 4
              Cursor = crHandPoint
              Caption = 'Desmarcar Todos'
              ParentColor = False
              ParentFont = False
              Style.Color = clCream
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clNavy
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              Style.TextColor = clNavy
              Style.TextStyle = []
              Style.IsFontAssigned = True
              Transparent = True
              OnClick = lblDesmarcarClick
            end
          end
        end
        object Panel4: TPanel
          Left = 366
          Top = 54
          Width = 837
          Height = 318
          Align = alClient
          TabOrder = 2
          ExplicitLeft = 362
          ExplicitTop = 50
          ExplicitWidth = 845
          ExplicitHeight = 326
          object cxGroupBox4: TcxGroupBox
            Left = 1
            Top = 1
            Align = alClient
            Caption = ' Compromisso(s)'
            ParentFont = False
            Style.StyleController = dtmControles.cxEditStyleGroup
            TabOrder = 0
            ExplicitWidth = 843
            ExplicitHeight = 324
            Height = 316
            Width = 835
            object pnSelecionarCompromissos: TPanel
              Left = 2
              Top = 18
              Width = 831
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitTop = 5
              ExplicitWidth = 839
              object Panel6: TPanel
                Left = 608
                Top = 0
                Width = 223
                Height = 25
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                ExplicitLeft = 616
                DesignSize = (
                  223
                  25)
                object lblMarcarCompromisso: TcxLabel
                  Left = 52
                  Top = 4
                  Cursor = crHandPoint
                  Anchors = [akTop, akRight]
                  Caption = 'Marcar Todos'
                  ParentColor = False
                  ParentFont = False
                  PopupMenu = ppmCompromisso
                  Style.Color = clCream
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clNavy
                  Style.Font.Height = -11
                  Style.Font.Name = 'MS Sans Serif'
                  Style.Font.Style = []
                  Style.TextColor = clGreen
                  Style.TextStyle = []
                  Style.IsFontAssigned = True
                  Transparent = True
                  OnClick = lblMarcarCompromissoClick
                end
                object lblDesmarcarCompromisso: TcxLabel
                  Left = 128
                  Top = 4
                  Cursor = crHandPoint
                  Anchors = [akTop, akRight]
                  Caption = 'Desmarcar Todos'
                  ParentColor = False
                  ParentFont = False
                  Style.Color = clCream
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clNavy
                  Style.Font.Height = -11
                  Style.Font.Name = 'MS Sans Serif'
                  Style.Font.Style = []
                  Style.TextColor = clNavy
                  Style.TextStyle = []
                  Style.IsFontAssigned = True
                  Transparent = True
                  OnClick = lblDesmarcarCompromissoClick
                end
              end
            end
            object tabCompromisso: TcxTabControl
              Left = 2
              Top = 43
              Width = 831
              Height = 271
              Align = alClient
              TabOrder = 1
              Properties.CustomButtons.Buttons = <>
              Properties.Style = 6
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'McSkin'
              ExplicitWidth = 839
              ExplicitHeight = 279
              ClientRectBottom = 271
              ClientRectRight = 831
              ClientRectTop = 0
              object cxGridCompromisso: TcxGrid
                Left = 0
                Top = 0
                Width = 839
                Height = 279
                Align = alClient
                PopupMenu = ppmCompromisso
                TabOrder = 0
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                object cxGridCompromissoDBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = True
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  Navigator.Visible = True
                  FilterBox.CustomizeDialog = False
                  FilterBox.Position = fpTop
                  OnCustomDrawCell = cxGridCompromissoDBTableView1CustomDrawCell
                  DataController.DataSource = dtsCompromisso
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'Qtd.: 0'
                      Kind = skCount
                      FieldName = 'PESSOA_ID'
                    end
                    item
                      Format = 'Qtd: ,0'
                      Kind = skCount
                      FieldName = 'CONTABIL_CONTA_ID'
                      Column = cxGridCompromissoDBTableView1CONTA_CONTABIL_ID
                    end
                    item
                      Format = 'Total: #0.00'
                      Kind = skSum
                      FieldName = 'VALOR_AGENDADO'
                      Column = cxGridCompromissoDBTableView1VALOR_AGENDADO
                    end
                    item
                      Format = 'Valor '#224' Pagar: #0.00'
                      Kind = skSum
                      FieldName = 'calc_valor_a_pagar'
                      Column = cxGridCompromissoDBTableView1ANO_MES_REFERENCIA
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnGrouping = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  Preview.Visible = True
                  Styles.Inactive = dtmControles.cxStyle19
                  object cxGridCompromissoDBTableView1NOME: TcxGridDBColumn
                    Caption = 'Cliente'
                    DataBinding.FieldName = 'NOME'
                    Visible = False
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 286
                  end
                  object cxGridCompromissoDBTableView1CONTA_CONTABIL_ID: TcxGridDBColumn
                    Caption = 'Compromisso'
                    DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
                    FooterAlignmentHorz = taLeftJustify
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 291
                  end
                  object cxGridCompromissoDBTableView1CalcTravado: TcxGridDBColumn
                    DataBinding.FieldName = 'gerou_boleto_calc'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 9
                        Value = 'S'
                      end>
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 26
                    IsCaptionAssigned = True
                  end
                  object cxGridCompromissoDBTableView1ATUALIZADO: TcxGridDBColumn
                    Caption = '$'
                    DataBinding.FieldName = 'ATUALIZADO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        ImageIndex = 54
                        Value = 'S'
                      end
                      item
                        ImageIndex = 53
                        Value = 'A'
                      end
                      item
                        ImageIndex = 5
                        Value = 'T'
                      end>
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 30
                  end
                  object cxGridCompromissoDBTableView1OPERACAO: TcxGridDBColumn
                    DataBinding.FieldName = 'OPERACAO'
                    Visible = False
                  end
                  object cxGridCompromissoDBTableView1VALOR_AGENDADO: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'VALOR_AGENDADO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 124
                  end
                  object cxGridCompromissoDBTableView1Ref: TcxGridDBColumn
                    Caption = '+'
                    PropertiesClassName = 'TcxTextEditProperties'
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 33
                  end
                  object cxGridCompromissoDBTableView1ANO_MES_REFERENCIA: TcxGridDBColumn
                    Caption = 'Refer'#234'ncia'
                    DataBinding.FieldName = 'calc_referencia'
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 100
                  end
                  object cxGridCompromissoDBTableView1Column1: TcxGridDBColumn
                    Caption = 'Vencimento'
                    DataBinding.FieldName = 'DATA_VENCIMENTO'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Properties.SaveTime = False
                    Properties.ShowTime = False
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 90
                  end
                  object cxGridCompromissoDBTableView1BOLETA_ID: TcxGridDBColumn
                    Caption = 'Boleto'
                    DataBinding.FieldName = 'BOLETA_ID'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Styles.Content = dtmControles.cxStyle21
                    Width = 59
                  end
                  object cxGridCompromissoDBTableView1SELECIONADO: TcxGridDBColumn
                    Caption = 'Selecionar?'
                    DataBinding.FieldName = 'SELECIONADO'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.Alignment = taCenter
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Properties.OnChange = cxGridCompromissoDBTableView1SELECIONADOPropertiesChange
                    OnCustomDrawCell = cxGridCompromissoDBTableView1SELECIONADOCustomDrawCell
                    FooterAlignmentHorz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Filtering = False
                    Width = 84
                  end
                end
                object cxGridCompromissoLevel1: TcxGridLevel
                  GridView = cxGridCompromissoDBTableView1
                end
              end
            end
          end
        end
      end
    end
    object tbcRemessa: TcxTabSheet
      Caption = 'Remessa'
      ImageIndex = 1
      object tabRemessa: TcxTabControl
        Left = 0
        Top = 0
        Width = 1207
        Height = 376
        Align = alClient
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.TabIndex = 0
        Properties.Tabs.Strings = (
          'Registro'
          'Cancelamento')
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        OnChange = tabRemessaChange
        ClientRectBottom = 372
        ClientRectLeft = 4
        ClientRectRight = 1203
        ClientRectTop = 28
        object gbRegistro: TcxGroupBox
          Left = 4
          Top = 73
          Align = alTop
          Caption = ' Filtro(s)'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 69
          ExplicitWidth = 1207
          DesignSize = (
            1199
            39)
          Height = 39
          Width = 1199
          object cxLabel4: TcxLabel
            Left = 5
            Top = 14
            Caption = 'Nosso N'#250'mero:'
            Style.TextColor = 16384
            Style.TextStyle = []
            Transparent = True
          end
          object btnPesquisaRemessa: TcxButton
            Left = 245
            Top = 12
            Width = 95
            Height = 22
            Caption = 'Pesquisar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000130B0000130B00000001000000000000000000000101
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
            TabOrder = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnPesquisaRemessaClick
          end
          object btnLimparFiltroRemessa: TcxButton
            Left = 344
            Top = 12
            Width = 95
            Height = 22
            Caption = 'Limpar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000B00D0000B00D00000001000000000000000000000101
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
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
              687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
              68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
              FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
              F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
              FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
              39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            TabOrder = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnLimparFiltroRemessaClick
          end
          object edtNossoNumero: TcxTextEdit
            Left = 86
            Top = 13
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsUltraFlat
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.NativeStyle = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            OnKeyDown = edtNossoNumeroKeyDown
            Width = 55
          end
          object btnGerarRemessa: TcxButton
            Left = 445
            Top = 12
            Width = 107
            Height = 22
            Cursor = crArrow
            Caption = 'Gerar Remessa'
            Colors.Default = clWhite
            Enabled = False
            LookAndFeel.Kind = lfUltraFlat
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              080000000000900100000000000000000000000100000000000000000000BBBB
              BB00757575003333330024242400FFFFFF00A5A5A5004848480017171700E5E5
              E50099999900E1E1E1000B0B0B005353530083838300080808002E2E2E006666
              6600F3F3F30036363600CCCCCC001B1B1B002B2B2B003A3A3A00A9A9A9000606
              0600C8C8C8005656560012121200A1A1A10028282800929292003C3C3C00ABAB
              AB0020202000595959003F3F3F004A4A4A009D9D9D00D0D0D000101010006060
              600046464600F5F5F500000000004D4D4D00ADADAD000A0A0A00191919008989
              8900E8E8E800B1B1B1002A2A2A002222220076767600BEBEBE0014141400D5D5
              D5005050500030303000A7A7A70026262600E3E3E3009F9F9F00F7F7F7001818
              18003838380004040400A3A3A3001E1E1E00E9E9E90069696900000000000000
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
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000050505361900
              0000000000000000000000100B050505050F0000434343434343000000000043
              0A0505050519190C070D0D0D0D240F191919191926050505050F0F4539093E3E
              09010C0F0F0F0F0F26050505050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C26050505
              050C0C22273E0B0B0B0B090909310C0C3F050505052828080725070707070707
              2D1328281D050505051C1C304702363636363636022A1C1C1D0505050538381E
              37141A1A1A1A1A1A140E38381D05050505414141413030303030303030414141
              060505050515153B0B121212121212122B0A151506050505054545223B3B3B3B
              3B3B3B3B0316454506050505052222160A18181818181818184722223C050505
              0535353B1D182E2106060606180235353C050505050404041E1E1E0417172020
              1716040418050505051E1E252B402523121212122B1D1E1E180505050516163A
              05052910131313134203161621050505051010100D1B10101010101010101010
              2105050505133B3B3B3B3B3B3B3B3B3B3B3B3B0333050505051F130303030303
              030303030303031B3205}
            TabOrder = 5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = btnGerarRemessaClick
          end
          object cxLabel5: TcxLabel
            Left = 145
            Top = 14
            Caption = 'Boleto:'
            Style.TextColor = 16384
            Style.TextStyle = []
            Transparent = True
          end
          object edtBoletoId: TcxTextEdit
            Left = 186
            Top = 13
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsUltraFlat
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.NativeStyle = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            OnKeyDown = edtBoletoIdKeyDown
            Width = 55
          end
          object chxAgruparDesagrupar: TcxCheckBox
            Left = 1070
            Top = 13
            Anchors = [akTop, akRight]
            Caption = 'Agrupar/Desagrupar'
            TabOrder = 7
            OnClick = chxAgruparDesagruparClick
            ExplicitLeft = 1078
            Width = 124
          end
        end
        object cxGridRemessa: TcxGrid
          Left = 4
          Top = 112
          Width = 1199
          Height = 260
          Align = alClient
          PopupMenu = ppmRemessa
          TabOrder = 1
          ExplicitLeft = 0
          ExplicitTop = 108
          ExplicitWidth = 1207
          ExplicitHeight = 268
          object cxGridRemessaDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.First.Visible = False
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.Prior.Visible = False
            Navigator.Buttons.Next.Enabled = False
            Navigator.Buttons.Next.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Last.Enabled = False
            Navigator.Buttons.Last.Visible = False
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
            FilterBox.CustomizeDialog = False
            FilterBox.Position = fpTop
            OnFocusedRecordChanged = cxGridClienteDBTableView2FocusedRecordChanged
            DataController.DataSource = dtsPesqCompromisso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Qtd: ,0'
                Kind = skCount
                FieldName = 'BOLETA_ID'
                Column = cxGridRemessaDBTableView1CONTABIL_CONTA_ID
              end
              item
                Format = 'Total: #0.00'
                Kind = skSum
                FieldName = 'VALOR_AGENDADO'
                Column = cxGridRemessaDBTableView1VALOR_AGENDADO
              end>
            DataController.Summary.SummaryGroups = <>
            Filtering.MRUItemsListCount = 5
            Filtering.ColumnPopup.MaxDropDownItemCount = 10
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            Styles.Inactive = dtmControles.cxStyle23
            Styles.GroupByBox = dtmControles.cxStyle7
            object cxGridRemessaDBTableView1NOME: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NOME'
              Visible = False
              GroupIndex = 0
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 490
            end
            object cxGridRemessaDBTableView1CONTABIL_CONTA_ID: TcxGridDBColumn
              Caption = 'Compromisso'
              DataBinding.FieldName = 'CONTABIL_CONTA_ID'
              RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
              FooterAlignmentHorz = taLeftJustify
              GroupSummaryAlignment = taLeftJustify
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 568
            end
            object cxGridRemessaDBTableView1ANO_MES_REFERENCIA: TcxGridDBColumn
              Caption = 'Refer'#234'ncia'
              DataBinding.FieldName = 'calc_referencia'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 110
            end
            object cxGridRemessaDBTableView1VALOR_AGENDADO: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VALOR_AGENDADO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 90
            end
            object cxGridRemessaDBTableView1SITUACAO: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SITUACAO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = dtmControles.imgCadBasicos
              Properties.Items = <
                item
                  Description = 'Aberto'
                  ImageIndex = 51
                  Value = '1'
                end
                item
                  Description = 'Cancelado'
                  ImageIndex = 33
                  Value = '3'
                end>
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 73
            end
            object cxGridRemessaDBTableView1NOSSO_NUMERO: TcxGridDBColumn
              Caption = 'Nosso N'#250'mero'
              DataBinding.FieldName = 'NOSSO_NUMERO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              GroupSummaryAlignment = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Styles.Content = dtmControles.cxStyle21
              Width = 90
            end
            object cxGridRemessaDBTableView1BOLETA_ID: TcxGridDBColumn
              Caption = 'Boleto'
              DataBinding.FieldName = 'BOLETA_ID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Styles.Content = dtmControles.cxStyle21
              Width = 60
            end
          end
          object cxGridRemessaLevel1: TcxGridLevel
            GridView = cxGridRemessaDBTableView1
          end
        end
        object gbCancelamento: TcxGroupBox
          Left = 4
          Top = 28
          Align = alTop
          Caption = ' Filtro(s)'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 2
          Visible = False
          ExplicitLeft = 0
          ExplicitTop = 24
          ExplicitWidth = 1207
          Height = 45
          Width = 1199
          object btnCancelarTodosBoletos: TcxButton
            Left = 5
            Top = 15
            Width = 239
            Height = 22
            Caption = 'Cancelar Todos os Boletos em Aberto'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000B00D0000B00D00000001000000000000000000000101
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
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
              687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
              68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
              FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
              F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
              FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
              39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnCancelarTodosBoletosClick
          end
        end
      end
    end
    object tbcRetorno: TcxTabSheet
      Caption = 'Retorno'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 58
        Align = alTop
        Caption = ' Dados do Cedente '
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 0
        Height = 84
        Width = 1207
        object edtAgenciaRetorno: TcxTextEdit
          Left = 5
          Top = 32
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 4
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 60
        end
        object cxLabel6: TcxLabel
          Left = 5
          Top = 13
          Caption = 'Ag'#234'ncia'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object edtContaRetorno: TcxTextEdit
          Left = 69
          Top = 32
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 5
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 100
        end
        object cxLabel8: TcxLabel
          Left = 69
          Top = 13
          Caption = 'Conta'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object edtNomeEmpresaRetorno: TcxTextEdit
          Left = 173
          Top = 32
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Width = 303
        end
        object cxLabel9: TcxLabel
          Left = 173
          Top = 13
          Caption = 'Nome da empresa'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object edtCodBancoRetorno: TcxTextEdit
          Left = 480
          Top = 32
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 3
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 6
          Width = 60
        end
        object cxLabel11: TcxLabel
          Left = 480
          Top = 13
          Caption = 'C'#243'd. Banco'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object edtNomeBancoRetorno: TcxTextEdit
          Left = 544
          Top = 32
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 15
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 8
          Width = 205
        end
        object cxLabel12: TcxLabel
          Left = 544
          Top = 13
          Caption = 'Nome do banco'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object lblMarcarTodosRetorno: TcxLabel
          Left = 5
          Top = 64
          Cursor = crHandPoint
          Caption = 'Marcar Todos'
          ParentColor = False
          ParentFont = False
          Style.Color = clCream
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.TextColor = clGreen
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = lblMarcarTodosRetornoClick
        end
        object lblDesmarcarTodosRetorno: TcxLabel
          Left = 76
          Top = 64
          Cursor = crHandPoint
          Caption = 'Desmarcar Todos'
          ParentColor = False
          ParentFont = False
          Style.Color = clCream
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Transparent = True
          OnClick = lblDesmarcarTodosRetornoClick
        end
        object btnEnviarCaixa: TcxButton
          Left = 173
          Top = 58
          Width = 148
          Height = 22
          Cursor = crArrow
          Caption = 'Enviar para o caixa'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            080000000000900100000000000000000000000100000000000000000000BBBB
            BB00757575003333330024242400FFFFFF00A5A5A5004848480017171700E5E5
            E50099999900E1E1E1000B0B0B005353530083838300080808002E2E2E006666
            6600F3F3F30036363600CCCCCC001B1B1B002B2B2B003A3A3A00A9A9A9000606
            0600C8C8C8005656560012121200A1A1A10028282800929292003C3C3C00ABAB
            AB0020202000595959003F3F3F004A4A4A009D9D9D00D0D0D000101010006060
            600046464600F5F5F500000000004D4D4D00ADADAD000A0A0A00191919008989
            8900E8E8E800B1B1B1002A2A2A002222220076767600BEBEBE0014141400D5D5
            D5005050500030303000A7A7A70026262600E3E3E3009F9F9F00F7F7F7001818
            18003838380004040400A3A3A3001E1E1E00E9E9E90069696900000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000050505361900
            0000000000000000000000100B050505050F0000434343434343000000000043
            0A0505050519190C070D0D0D0D240F191919191926050505050F0F4539093E3E
            09010C0F0F0F0F0F26050505050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C26050505
            050C0C22273E0B0B0B0B090909310C0C3F050505052828080725070707070707
            2D1328281D050505051C1C304702363636363636022A1C1C1D0505050538381E
            37141A1A1A1A1A1A140E38381D05050505414141413030303030303030414141
            060505050515153B0B121212121212122B0A151506050505054545223B3B3B3B
            3B3B3B3B0316454506050505052222160A18181818181818184722223C050505
            0535353B1D182E2106060606180235353C050505050404041E1E1E0417172020
            1716040418050505051E1E252B402523121212122B1D1E1E180505050516163A
            05052910131313134203161621050505051010100D1B10101010101010101010
            2105050505133B3B3B3B3B3B3B3B3B3B3B3B3B0333050505051F130303030303
            030303030303031B3205}
          TabOrder = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btnEnviarCaixaClick
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Caption = ' Filtro(s)'
        ParentFont = False
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 1
        Height = 58
        Width = 1207
        object btnPesquisarRetorno: TcxButton
          Left = 674
          Top = 30
          Width = 34
          Height = 22
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000130B0000130B00000001000000000000000000000101
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
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarRetornoClick
        end
        object cxButton5: TcxButton
          Left = 712
          Top = 30
          Width = 95
          Height = 22
          Caption = 'Limpar'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000B00D0000B00D00000001000000000000000000000101
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
            687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
            68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
            FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
            F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
            FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
            39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton2Click
        end
        object edtRetorno: TcxTextEdit
          Left = 320
          Top = 31
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 350
        end
        object cxLabel7: TcxLabel
          Left = 320
          Top = 12
          Caption = 'Arquivo Retorno:'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 5
          Top = 12
          Caption = 'Dados Banco:'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object cbxDadosBanco: TcxComboBox
          Left = 5
          Top = 31
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Style.StyleController = dtmControles.cxEsc_EditsEspecial
          Style.TextColor = clBlack
          TabOrder = 5
          Width = 311
        end
      end
      object cxGridRetorno: TcxGrid
        Left = 0
        Top = 142
        Width = 1207
        Height = 234
        Align = alClient
        PopupMenu = ppmRemessa
        TabOrder = 2
        object cxGridRetornoDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
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
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          OnCustomDrawCell = cxGridRetornoDBTableView1CustomDrawCell
          OnFocusedRecordChanged = cxGridClienteDBTableView2FocusedRecordChanged
          DataController.DataSource = dtsRetorno
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skCount
              Position = spFooter
              Column = cxGridRetornoDBTableView1TIPO_REGISTRO
            end
            item
              Kind = skCount
              Column = cxGridRetornoDBTableView1TIPO_REGISTRO
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'TIPO_REGISTRO'
              Column = cxGridRetornoDBTableView1TIPO_REGISTRO
            end
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'DIFERENCA'
              Column = cxGridRetornoDBTableView1DIFERENCA
            end
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'VALOR_TITULO'
              Column = cxGridRetornoDBTableView1VALOR_TITULO
            end
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'VALOR_IOF'
              Column = cxGridRetornoDBTableView1VALOR_IOF
            end
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'DESCONTO'
              Column = cxGridRetornoDBTableView1DESCONTO
            end
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'JUROS_MORA'
              Column = cxGridRetornoDBTableView1JUROS_MORA
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          Styles.Inactive = dtmControles.cxStyle23
          Styles.GroupByBox = dtmControles.cxStyle7
          object cxGridRetornoDBTableView1TIPO_REGISTRO: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'TIPO_REGISTRO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Normal'
                ImageIndex = 0
                Value = 'N'
              end
              item
                Description = 'Carn'#234
                Value = 'C'
              end>
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 39
          end
          object cxGridRetornoDBTableView1SELECIONAR: TcxGridDBColumn
            Caption = 'Selecionar?'
            DataBinding.FieldName = 'SELECIONADO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            HeaderAlignmentHorz = taCenter
            Width = 77
          end
          object cxGridRetornoDBTableView1LOCALIZOU: TcxGridDBColumn
            Caption = 'Localizado?'
            DataBinding.FieldName = 'LOCALIZADO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 6
                Value = True
              end
              item
                Description = 'N'#227'o'
                ImageIndex = 7
                Value = False
              end>
            OnCustomDrawCell = cxGridRetornoDBTableView1LOCALIZOUCustomDrawCell
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 75
          end
          object cxGridRetornoDBTableView1SITUACAO: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'N'#227'o Identificado'
                ImageIndex = 4
                Value = ' '
              end
              item
                Description = 'Ativo'
                ImageIndex = 3
                Value = '1'
              end
              item
                Description = 'Baixado'
                ImageIndex = 2
                Value = '3'
              end
              item
                Description = 'Cancelado'
                ImageIndex = 4
                Value = '2'
              end>
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 86
          end
          object cxGridRetornoDBTableView1DOCUMENTO: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'DOCUMENTO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 87
          end
          object cxGridRetornoDBTableView1DIFERENCA: TcxGridDBColumn
            Caption = 'Diferen'#231'a'
            DataBinding.FieldName = 'DIFERENCA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            OnCustomDrawCell = cxGridRetornoDBTableView1DIFERENCACustomDrawCell
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 77
          end
          object cxGridRetornoDBTableView1VALOR_PAGO: TcxGridDBColumn
            Caption = 'Vlr. Pago'
            DataBinding.FieldName = 'VALOR_PAGO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 61
          end
          object cxGridRetornoDBTableView1VALOR_TITULO: TcxGridDBColumn
            Caption = 'Vlr. Documento'
            DataBinding.FieldName = 'VALOR_DOCUMENTO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 95
          end
          object cxGridRetornoDBTableView1VALOR_IOF: TcxGridDBColumn
            Caption = 'Vlr. IOF'
            DataBinding.FieldName = 'VALOR_IOF'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 69
          end
          object cxGridRetornoDBTableView1DESCONTO: TcxGridDBColumn
            Caption = 'Desconto'
            DataBinding.FieldName = 'DESCONTO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 94
          end
          object cxGridRetornoDBTableView1JUROS_MORA: TcxGridDBColumn
            Caption = 'Juros/Multa'
            DataBinding.FieldName = 'JUROS_MORA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 84
          end
          object cxGridRetornoDBTableView1NOSSO_NUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NOSSO_NUMERO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Styles.Content = dtmControles.cxStyle21
            Width = 107
          end
          object cxGridRetornoDBTableView1CARTEIRA: TcxGridDBColumn
            Caption = 'Carteira'
            DataBinding.FieldName = 'CARTEIRA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 48
          end
        end
        object cxGridRetornoLevel1: TcxGridLevel
          GridView = cxGridRetornoDBTableView1
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1207
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object PanelBotaoFechar: TPanel
      Left = 1129
      Top = 0
      Width = 78
      Height = 70
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 10
        Top = 7
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Caption = 'Sair'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          080000000000400200009B0E00009B0E0000000100000000000000000000D7D7
          D7007D7D7D0033333300C3C3C300FFFFFF004C4C4C00A0A0A000181818007777
          7700EDEDED0099999900BCBCBC00444444006666660041414100CCCCCC00DEDE
          DE0026262600F0F0F000A5A5A500030303005252520037373700FBFBFB00ADAD
          AD00DDDDDD00E5E5E500828282003D3D3D00C7C7C7009C9C9C00575757004E4E
          4E00C1C1C100E3E3E3000909090047474700000000001A1A1A00A3A3A300EFEF
          EF005050500049494900C5C5C500C9C9C9000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000005050505130D
          0000000000000000000000000024090505050505050A06000000000000000000
          000000000000001C05050505050E00212D1010101010101010101010100C0800
          0A050505051D0007050505050505050505050505050525001A050505050F000B
          05050505050505050505050505050D001A050505050F000B0505050505050505
          050505050505170011050505050F000B0505050505050505052D061B05051415
          01050505050F000B0505050505050505051F00271E05050423050505050F000B
          0505050505050505051900001528050505050505050F000B0505050B16161616
          160300000000020505050505050F000B05050527000000000000000000000020
          18050505050F000B0505051200000000000000000000000003220505050F000B
          0505051200000000000000000000000003220505050F000B0505052700000000
          000000000000002018050505050F000B0505050B161616161603000000000205
          05050505050F000B0505050505050505051900001528050505050505050F000B
          0505050505050505051F00271E05050423050505050F000B0505050505050505
          052C2B1B0505141501050505050F000B05050505050505050505050505051700
          11050505050F000B05050505050505050505050505050D001A050505051D0007
          050505050505050505050505050525001A050505050E00212D10101010101010
          10101010100C08000A050505050A06000000000000000000000000000000001C
          050505050505130D000000000000000000000000002409050505}
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = cxBtnFecharClick
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alClient
      Caption = 'Op'#231#227'o de Emiss'#227'o de Boleto(s)'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Shadow = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      Style.TransparentBorder = True
      TabOrder = 1
      Height = 70
      Width = 1129
      object chkAgruparPorReferencia: TcxCheckBox
        Left = 350
        Top = 40
        Caption = 'Agrupar Compromissos por Refer'#234'ncia'
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Transparent = True
        Width = 203
      end
      object btnEnviarBoletosEmail: TcxButton
        Left = 674
        Top = 42
        Width = 166
        Height = 22
        Caption = 'Enviar boletos por e-mail '
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          26060000424D2606000000000000360000002800000014000000130000000100
          200000000000F005000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFF2E2E2EFF323232FF333333FF3333
          33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF3131
          31FF343434FFCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1FF1919
          19FF3E3E3EFF292929FF323232FF333333FF333333FF333333FF333333FF3333
          33FF333333FF333333FF313131FF272727FF404040FF343434FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B3B3FF1E1E1EFF636363FF898989FF1B1B1BFF3030
          30FF333333FF323232FF2E2E2EFF333333FF333333FF2B2B2BFF282828FFA8A8
          A8FF353535FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5FF2323
          23FF262626FF7B7B7BFFE5E5E5FF252525FF252525FF202020FF4B4B4BFF2020
          20FF1E1E1EFF575757FFFBFBFBFF2F2F2FFF2F2F2FFF333333FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB5B5B5FF232323FF323232FF212121FF808080FFFFFF
          FFFF6B6B6BFFEDEDEDFFFFFFFFFFA4A4A4FF9C9C9CFFFFFFFFFF2D2D2DFF2E2E
          2EFF333333FF333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5FF2323
          23FF333333FF313131FF080808FFC1C1C1FFFFFFFFFFE3E3E3FF8C8C8CFFFFFF
          FFFFFFFFFFFF515151FF1E1E1EFF323232FF333333FF333333FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB5B5B5FF232323FF2E2E2EFF1F1F1FFFD4D4D4FFFAFA
          FAFF5C5C5CFF1A1A1AFF242424FF212121FF949494FFFFFFFFFF7D7D7DFF1D1D
          1DFF323232FF333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5FF1C1C
          1CFF484848FFDFDFDFFF6E6E6EFF181818FF2B2B2BFF323232FF333333FF3131
          31FF252525FF222222FFB2B2B2FFBCBCBCFF262626FF313131FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAFAFAFFF3A3A3AFF646464FF181818FF2B2B2BFF3232
          32FF333333FF333333FF333333FF333333FF333333FF313131FF242424FF3535
          35FF808080FF333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCFF3939
          39FFF1F1F1FF646464FF202020FF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
          2CFF2C2C2CFF2C2C2CFF2C2C2CFF2A2A2AFF202020FF464646FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424242FFF2F2F2FF919191FF5858
          58FF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5A5A
          5AFF626262FFEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF3F3F3FFF151515FFD0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFECECECFF878787FF606060FF333333FF313131FF171717FFA1A1
          A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696FF151515FF272727FF2C2C
          2CFF323232FF333333FF323232FF161616FF878787FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6
          B6FF151515FF272727FF242424FF222222FF303030FF333333FF2C2C2CFF2424
          24FFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF232323FF262626FF898989FFB2B2B2FFCCCC
          CCFF3D3D3DFF272727FF323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7FF2A2A
          2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF313131FF3F3F3FFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF949494FFE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnEnviarBoletosEmailClick
      end
      object btnGerarBoleto: TcxButton
        Left = 561
        Top = 38
        Width = 107
        Height = 22
        Cursor = crArrow
        Caption = 'Gerar Boleto(s)'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          080000000000900100000000000000000000000100000000000000000000BBBB
          BB00757575003333330024242400FFFFFF00A5A5A5004848480017171700E5E5
          E50099999900E1E1E1000B0B0B005353530083838300080808002E2E2E006666
          6600F3F3F30036363600CCCCCC001B1B1B002B2B2B003A3A3A00A9A9A9000606
          0600C8C8C8005656560012121200A1A1A10028282800929292003C3C3C00ABAB
          AB0020202000595959003F3F3F004A4A4A009D9D9D00D0D0D000101010006060
          600046464600F5F5F500000000004D4D4D00ADADAD000A0A0A00191919008989
          8900E8E8E800B1B1B1002A2A2A002222220076767600BEBEBE0014141400D5D5
          D5005050500030303000A7A7A70026262600E3E3E3009F9F9F00F7F7F7001818
          18003838380004040400A3A3A3001E1E1E00E9E9E90069696900000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000050505361900
          0000000000000000000000100B050505050F0000434343434343000000000043
          0A0505050519190C070D0D0D0D240F191919191926050505050F0F4539093E3E
          09010C0F0F0F0F0F26050505050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C26050505
          050C0C22273E0B0B0B0B090909310C0C3F050505052828080725070707070707
          2D1328281D050505051C1C304702363636363636022A1C1C1D0505050538381E
          37141A1A1A1A1A1A140E38381D05050505414141413030303030303030414141
          060505050515153B0B121212121212122B0A151506050505054545223B3B3B3B
          3B3B3B3B0316454506050505052222160A18181818181818184722223C050505
          0535353B1D182E2106060606180235353C050505050404041E1E1E0417172020
          1716040418050505051E1E252B402523121212122B1D1E1E180505050516163A
          05052910131313134203161621050505051010100D1B10101010101010101010
          2105050505133B3B3B3B3B3B3B3B3B3B3B3B3B0333050505051F130303030303
          030303030303031B3205}
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnGerarBoletoClick
      end
      object edtDataVencimento: TcxDateEdit
        Left = 254
        Top = 39
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 90
      end
      object cxLabel1: TcxLabel
        Left = 11
        Top = 20
        Caption = 
          'Vencimento                                                      ' +
          '                               '
        Style.TextColor = 16384
        Style.TextStyle = [fsUnderline]
        Transparent = True
      end
      object cbxVencimentoTipo: TcxComboBox
        Left = 11
        Top = 37
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Data do Vencimento do Compromisso'
          'Definir Data de Vencimento')
        Properties.OnEditValueChanged = cbxVencimentoTipoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEditStyleGroup
        TabOrder = 5
        Text = 'Data do Vencimento do Compromisso'
        Width = 238
      end
    end
  end
  object sqlPessoa: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT'#13#10' P.PESSOA_ID,'#13#10' P.NOME,'#13#10' P.SELECIONADO,'#13#10' LF.ANO_MES_RE' +
      'FERENCIA,'#13#10' LF.DATA_VENCIMENTO'#13#10'FROM'#13#10'  J_PESSOA P'#13#10#13#10'INNER JOIN' +
      ' J_LIVRO_FINANCEIRO LF'#13#10'ON LF.PESSOA_ID = P.PESSOA_ID'#13#10#13#10'WHERE P' +
      '.UTILIZA_BOLETO = '#39'S'#39#13#10'AND LF.SITUACAO IN ('#39'1'#39','#39'2'#39')'#13#10#13#10'GROUP BY'#13 +
      #10' P.PESSOA_ID,'#13#10' P.NOME,'#13#10' P.SELECIONADO,'#13#10' LF.ANO_MES_REFERENCI' +
      'A,'#13#10' LF.DATA_VENCIMENTO'#13#10#13#10'ORDER BY '#13#10'  P.NOME DESC'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 8
    Top = 185
    object sqlPessoaPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPessoaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object sqlPessoaANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlPessoaDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
  end
  object dtsPessoa: TDataSource
    DataSet = sqlPessoa
    Left = 8
    Top = 233
  end
  object ppmCompromisso: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 753
    Top = 305
    object GerarBoleto: TMenuItem
      Caption = 'Gerar Boleto'
      SubMenuImages = dtmControles.imgCadBasicos
      ImageIndex = 2
      OnClick = GerarBoletoClick
    end
    object CancelarBoleto: TMenuItem
      Caption = 'Cancelar Boleto'
      ImageIndex = 33
      OnClick = CancelarBoletoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object VisualizarImprimiBoleto: TMenuItem
      Caption = 'Visualizar/Imprimir Boleto'
      ImageIndex = 45
      OnClick = VisualizarImprimiBoletoClick
    end
  end
  object sqlCompromisso: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT'#13#10'  LF.*,'#13#10'  P.NOME,'#13#10'  coalesce((SELECT SUM(VALOR) FROM J' +
      '_LIVRO_CAIXA WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID)' +
      ',0) AS VALOR_PAGO_SOMA'#13#10#13#10'FROM'#13#10'  J_LIVRO_FINANCEIRO LF'#13#10#13#10'INNER' +
      ' JOIN J_PESSOA P'#13#10'ON LF.PESSOA_ID = P.PESSOA_ID'#13#10#13#10'WHERE LF.SITU' +
      'ACAO IN ('#39'1'#39','#39'2'#39') '#13#10#13#10'ORDER BY'#13#10'  LF.CONTABIL_CONTA_ID,'#13#10'  LF.DA' +
      'TA_VENCIMENTO,'#13#10'  LF.ANO_MES_REFERENCIA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterScroll = sqlCompromissoAfterScroll
    OnCalcFields = sqlCompromissoCalcFields
    Left = 752
    Top = 209
    object sqlCompromissoLIVRO_FINANCEIRO_ID: TFMTBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlCompromissoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlCompromissoVALOR_AGENDADO: TFMTBCDField
      FieldName = 'VALOR_AGENDADO'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlCompromissoBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object sqlCompromissoBOLETA_ID: TFMTBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlCompromissoVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField
      FieldName = 'PROCESSO_CONTRATO_ITEM_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoPROCESSO_CONTRATO_ID: TFMTBCDField
      FieldName = 'PROCESSO_CONTRATO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object sqlCompromissoPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoVALOR_DOCUMENTO: TFMTBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoLIVRO_REMUNERACAO_ID: TFMTBCDField
      FieldName = 'LIVRO_REMUNERACAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoFINANCEIRO_REMUNERACAO_ID: TFMTBCDField
      FieldName = 'FINANCEIRO_REMUNERACAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlCompromissoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlCompromissoDATA_OPERACAO: TSQLTimeStampField
      FieldName = 'DATA_OPERACAO'
    end
    object sqlCompromissoLIVRO_AGENDAMENTO_ID: TFMTBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlCompromissoCNJ: TStringField
      FieldName = 'CNJ'
      Size = 1
    end
    object sqlCompromissoDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlCompromissoCAIXA_ID: TFMTBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoREGISTRO_PARCIAL: TStringField
      FieldName = 'REGISTRO_PARCIAL'
      Size = 1
    end
    object sqlCompromissoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object sqlCompromissoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlCompromissoVALOR_PAGO_SOMA: TFMTBCDField
      FieldName = 'VALOR_PAGO_SOMA'
      Precision = 20
      Size = 3
    end
    object sqlCompromissocalc_referencia: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Calculated = True
    end
    object sqlCompromissocalc_valor_a_pagar: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_valor_a_pagar'
      Calculated = True
    end
    object sqlCompromissogerou_boleto_calc: TStringField
      FieldKind = fkCalculated
      FieldName = 'gerou_boleto_calc'
      Calculated = True
    end
  end
  object dtsCompromisso: TDataSource
    DataSet = sqlCompromisso
    Left = 752
    Top = 257
  end
  object dtsPessoaAux: TDataSource
    DataSet = cdsPessoaAux
    Left = 74
    Top = 230
  end
  object cdsPessoaAux: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000003000000000003000000700008504553
      534F4149440100490000000100055749445448020002001400044E4F4D450100
      4900000001000557494454480200020078000B53454C4543494F4E41444F0100
      4900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PESSOAID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'SELECIONADO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 76
    Top = 187
    object cdsPessoaAuxPESSOAID: TStringField
      FieldName = 'PESSOAID'
    end
    object cdsPessoaAuxNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsPessoaAuxSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
    end
  end
  object sqlPesqCompromisso: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select'#13#10'  P.NOME,'#13#10'  P.CPFCNPJ,'#13#10'  P.ENDERECO_CIDADE_ID,'#13#10'  P.EN' +
      'DERECO_LOGRADOURO,'#13#10'  P.ENDERECO_BAIRRO,'#13#10'  P.ENDERECO_CIDADE_UF' +
      ','#13#10'  P.ENDERECO_CEP,'#13#10'  P.EMAIL1,'#13#10'  P.TELEFONE,'#13#10'  LF.LIVRO_FIN' +
      'ANCEIRO_ID,'#13#10'  LF.CAIXA_ID,'#13#10'  LF.CONTABIL_CONTA_ID,'#13#10'  LF.ANO_M' +
      'ES_REFERENCIA,'#13#10'  LF.VALOR_AGENDADO,'#13#10'  BO.SITUACAO,'#13#10'  LF.BOLET' +
      'A_ID,'#13#10'  BO.NOSSO_NUMERO,'#13#10'  BO.DATA_EMISSAO,'#13#10'  BO.DATA_VENCIME' +
      'NTO,'#13#10'  BO.CARTEIRA'#13#10'from'#13#10'  J_LIVRO_FINANCEIRO LF'#13#10#13#10'inner join' +
      ' J_PESSOA P'#13#10'on LF.PESSOA_ID = P.PESSOA_ID'#13#10#13#10'inner join J_BOLET' +
      'O BO'#13#10'on LF.BOLETA_ID = BO.BOLETO_ID'#13#10#13#10'where LF.BOLETA_ID is no' +
      't null'#13#10'and LF.SITUACAO <> '#39'2'#39#13#10'and BO.CONT_REMESSA is null'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = sqlPesqCompromissoCalcFields
    Left = 912
    Top = 201
    object sqlPesqCompromissoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPesqCompromissoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlPesqCompromissoVALOR_AGENDADO: TFMTBCDField
      FieldName = 'VALOR_AGENDADO'
      Precision = 20
      Size = 3
    end
    object sqlPesqCompromissoBOLETA_ID: TFMTBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissoNOSSO_NUMERO: TFMTBCDField
      FieldName = 'NOSSO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissocalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 0
      Calculated = True
    end
    object sqlPesqCompromissoDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object sqlPesqCompromissoCAIXA_ID: TFMTBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlPesqCompromissoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 3
    end
    object sqlPesqCompromissoCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 15
    end
    object sqlPesqCompromissoENDERECO_CIDADE_ID: TFMTBCDField
      FieldName = 'ENDERECO_CIDADE_ID'
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissoENDERECO_LOGRADOURO: TStringField
      FieldName = 'ENDERECO_LOGRADOURO'
      Size = 120
    end
    object sqlPesqCompromissoENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      Size = 60
    end
    object sqlPesqCompromissoENDERECO_CIDADE_UF: TStringField
      FieldName = 'ENDERECO_CIDADE_UF'
      Size = 3
    end
    object sqlPesqCompromissoENDERECO_CEP: TStringField
      FieldName = 'ENDERECO_CEP'
      Size = 15
    end
    object sqlPesqCompromissoEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Size = 90
    end
    object sqlPesqCompromissoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 120
    end
    object sqlPesqCompromissoLIVRO_FINANCEIRO_ID: TFMTBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlPesqCompromissoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsPesqCompromisso: TDataSource
    DataSet = sqlPesqCompromisso
    Left = 912
    Top = 248
  end
  object ppmRemessa: TPopupMenu
    Left = 992
    Top = 232
    object GerarRemessa1: TMenuItem
      Caption = 'Gerar Remessa'
    end
  end
  object sqlAgruparReferencia: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT'#13#10'  ANO_MES_REFERENCIA,'#13#10'  sum(VALOR_AGENDADO) AS VALOR'#13#10'F' +
      'ROM'#13#10'  J_LIVRO_FINANCEIRO'#13#10#13#10'WHERE SITUACAO IN ('#39'1'#39','#39'2'#39')'#13#10'AND SE' +
      'LECIONADO = '#39'S'#39#13#10'AND PESSOA_ID = :PESSOA_ID'#13#10'GROUP BY'#13#10'  PESSOA_' +
      'ID,'#13#10'  ANO_MES_REFERENCIA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 993
    Top = 186
    object sqlAgruparReferenciaANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlAgruparReferenciaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
  end
  object OpenDialogRetorno: TOpenDialog
    Left = 912
    Top = 304
  end
  object cdsRetorno: TClientDataSet
    PersistDataPacket.Data = {
      C10200009619E0BD010000001800000014000000000003000000C1020D544950
      4F5F524547495354524F01004900000001000557494454480200020014000C4E
      4F53534F5F4E554D45524F010049000000010005574944544802000200140008
      434152544549524101004900000001000557494454480200020014000E434F44
      5F4F434F5252454E43494101004900000001000557494454480200020014000A
      56454E43494D454E544F01004900000001000557494454480200020014000956
      414C4F525F494F46080004000000010007535542545950450200490006004D6F
      6E6579001056414C4F525F41424154494D454E544F0800040000000100075355
      42545950450200490006004D6F6E65790008444553434F4E544F080004000000
      010007535542545950450200490006004D6F6E6579000F56414C4F525F505249
      4E434950414C080004000000010007535542545950450200490006004D6F6E65
      79000A4A55524F535F4D4F524108000400000001000753554254595045020049
      0006004D6F6E657900084D454E534147454D0100490000000100055749445448
      020002001400094449464552454E434108000400000001000753554254595045
      0200490006004D6F6E657900074147454E434941010049000000010005574944
      544802000200140005434F4E5441010049000000010005574944544802000200
      14000A4C4F43414C495A41444F02000300000000000B53454C4543494F4E4144
      4F01004900000001000557494454480200020014000F56414C4F525F444F4355
      4D454E544F080004000000010007535542545950450200490006004D6F6E6579
      0009444F43554D454E544F01004900000001000557494454480200020014000A
      56414C4F525F5041474F08000400000001000753554254595045020049000600
      4D6F6E65790008534954554143414F0100490000000100055749445448020002
      0014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_REGISTRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOSSO_NUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CARTEIRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'COD_OCORRENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VENCIMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_IOF'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_ABATIMENTO'
        DataType = ftCurrency
      end
      item
        Name = 'DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_PRINCIPAL'
        DataType = ftCurrency
      end
      item
        Name = 'JUROS_MORA'
        DataType = ftCurrency
      end
      item
        Name = 'MENSAGEM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DIFERENCA'
        DataType = ftCurrency
      end
      item
        Name = 'AGENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOCALIZADO'
        DataType = ftBoolean
      end
      item
        Name = 'SELECIONADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_DOCUMENTO'
        DataType = ftCurrency
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_PAGO'
        DataType = ftCurrency
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 336
    object cdsRetornoTIPO_REGISTRO: TStringField
      FieldName = 'TIPO_REGISTRO'
    end
    object cdsRetornoNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
    end
    object cdsRetornoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
    end
    object cdsRetornoCOD_OCORRENCIA: TStringField
      FieldName = 'COD_OCORRENCIA'
    end
    object cdsRetornoVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
    end
    object cdsRetornoVALOR_IOF: TCurrencyField
      FieldName = 'VALOR_IOF'
    end
    object cdsRetornoVALOR_ABATIMENTO: TCurrencyField
      FieldName = 'VALOR_ABATIMENTO'
    end
    object cdsRetornoDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
    end
    object cdsRetornoVALOR_PRINCIPAL: TCurrencyField
      FieldName = 'VALOR_PRINCIPAL'
    end
    object cdsRetornoJUROS_MORA: TCurrencyField
      FieldName = 'JUROS_MORA'
    end
    object cdsRetornoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
    end
    object cdsRetornoDIFERENCA: TCurrencyField
      FieldName = 'DIFERENCA'
    end
    object cdsRetornoAGENCIA: TStringField
      FieldName = 'AGENCIA'
    end
    object cdsRetornoCONTA: TStringField
      FieldName = 'CONTA'
    end
    object cdsRetornoLOCALIZADO: TBooleanField
      FieldName = 'LOCALIZADO'
    end
    object cdsRetornoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
    end
    object cdsRetornoVALOR_DOCUMENTO: TCurrencyField
      FieldName = 'VALOR_DOCUMENTO'
    end
    object cdsRetornoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsRetornoVALOR_PAGO: TCurrencyField
      FieldName = 'VALOR_PAGO'
    end
    object cdsRetornoSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
  end
  object dtsRetorno: TDataSource
    DataSet = cdsRetorno
    Left = 16
    Top = 288
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.Numero = 341
    Banco.TamanhoMaximoNossoNum = 8
    Banco.TipoCobranca = cobItau
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Banco.DensidadeGravacao = '0'
    Cedente.TipoCarteira = tctRegistrada
    Cedente.TipoInscricao = pJuridica
    DirArqRemessa = 'c:\TEMP'
    NumeroArquivo = 0
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 466
    Top = 279
  end
  object sqlBanco: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'select '#13#10'  BANCO_ID,'#13#10'  BANCO_NUMERO,'#13#10'  BANCO_DIGITO,'#13#10'  BANCO_' +
      'NOME,'#13#10'  AGENCIA_NOME,'#13#10'  AGENCIA_NUMERO,'#13#10'  AGENCIA_DIGITO,'#13#10'  ' +
      'CONTA_NUMERO,'#13#10'  CONTA_DIGITO,'#13#10'  AGENCIA_UF'#13#10'from '#13#10'  J_BANCO'#13#10 +
      'ORDER BY '#13#10'  BANCO_ID,'#13#10'  BANCO_NOME, '#13#10'  AGENCIA_UF'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 464
    Top = 232
    object sqlBancoBANCO_ID: TFMTBCDField
      FieldName = 'BANCO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlBancoBANCO_NUMERO: TStringField
      FieldName = 'BANCO_NUMERO'
      Size = 10
    end
    object sqlBancoBANCO_DIGITO: TStringField
      FieldName = 'BANCO_DIGITO'
      Size = 3
    end
    object sqlBancoBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      Size = 60
    end
    object sqlBancoAGENCIA_NOME: TStringField
      FieldName = 'AGENCIA_NOME'
      Size = 60
    end
    object sqlBancoAGENCIA_NUMERO: TStringField
      FieldName = 'AGENCIA_NUMERO'
      Size = 10
    end
    object sqlBancoCONTA_NUMERO: TStringField
      FieldName = 'CONTA_NUMERO'
      Size = 15
    end
    object sqlBancoCONTA_DIGITO: TStringField
      FieldName = 'CONTA_DIGITO'
      Size = 3
    end
    object sqlBancoAGENCIA_UF: TStringField
      FieldName = 'AGENCIA_UF'
      Size = 3
    end
    object sqlBancoAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      Size = 3
    end
  end
  object frxDBDataSetCompromisso: TfrxDBDataset
    UserName = 'frxDBDataSetCompromisso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'LIVRO_FINANCEIRO_ID=LIVRO_FINANCEIRO_ID'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'VALOR_AGENDADO=VALOR_AGENDADO'
      'SITUACAO=SITUACAO'
      'CONTABIL_CONTA_ID=CONTABIL_CONTA_ID'
      'CENTRO_CUSTO_ID=CENTRO_CUSTO_ID'
      'ANO_MES_REFERENCIA=ANO_MES_REFERENCIA'
      'BALANCETE_GRUPO_ID=BALANCETE_GRUPO_ID'
      'ESPECIE=ESPECIE'
      'BOLETA_ID=BOLETA_ID'
      'ATUALIZADO=ATUALIZADO'
      'VALOR_PAGO=VALOR_PAGO'
      'PROCESSO_CONTRATO_ITEM_ID=PROCESSO_CONTRATO_ITEM_ID'
      'PROCESSO_CONTRATO_ID=PROCESSO_CONTRATO_ID'
      'OPERACAO=OPERACAO'
      'PESSOA_ID=PESSOA_ID'
      'VALOR_DOCUMENTO=VALOR_DOCUMENTO'
      'LIVRO_REMUNERACAO_ID=LIVRO_REMUNERACAO_ID'
      'FINANCEIRO_REMUNERACAO_ID=FINANCEIRO_REMUNERACAO_ID'
      'HISTORICO=HISTORICO'
      'OBSERVACAO=OBSERVACAO'
      'DATA_OPERACAO=DATA_OPERACAO'
      'LIVRO_AGENDAMENTO_ID=LIVRO_AGENDAMENTO_ID'
      'DESCONTO=DESCONTO'
      'IR=IR'
      'CNJ=CNJ'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'CAIXA_ID=CAIXA_ID'
      'REGISTRO_PARCIAL=REGISTRO_PARCIAL'
      'SELECIONADO=SELECIONADO'
      'NOME=NOME'
      'VALOR_PAGO_SOMA=VALOR_PAGO_SOMA'
      'calc_referencia=calc_referencia'
      'calc_valor_a_pagar=calc_valor_a_pagar'
      'gerou_boleto_calc=gerou_boleto_calc')
    DataSet = sqlCompromisso
    BCDToCurrency = False
    Left = 632
    Top = 373
  end
  object frxDBDatasetAgruparCompromisso: TfrxDBDataset
    UserName = 'frxDBDatasetAgruparCompromisso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO_MES_REFERENCIA=ANO_MES_REFERENCIA'
      'VALOR=VALOR')
    DataSet = sqlAgruparReferencia
    BCDToCurrency = False
    Left = 780
    Top = 373
  end
end
