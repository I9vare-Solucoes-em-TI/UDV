object frmLegislacao: TfrmLegislacao
  Left = 0
  Top = 0
  Caption = 'Cadastro de Legisla'#231#227'o'
  ClientHeight = 565
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pagPrincipal: TcxPageControl
    Left = 0
    Top = 59
    Width = 1045
    Height = 506
    Align = alClient
    Color = 14807280
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    Properties.ActivePage = tbsCadastro
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfUltraFlat
    OnPageChanging = pagPrincipalPageChanging
    ClientRectBottom = 506
    ClientRectRight = 1045
    ClientRectTop = 24
    object tbsPesquisa: TcxTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object pnlPesquisaTopo: TPanel
        Left = 0
        Top = 0
        Width = 1045
        Height = 137
        Align = alTop
        BevelInner = bvLowered
        Color = 14807280
        ParentBackground = False
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 235
          Top = 10
          Caption = 'Esfera/N'#237'vel'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object lcxPesqEsferaNivel: TcxLookupComboBox
          Left = 236
          Top = 27
          RepositoryItem = dtmLookup.listaProvimentoEsferaNivel
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 0
          Width = 236
        end
        object cxLabel2: TcxLabel
          Left = 477
          Top = 10
          Caption = 'Origem'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object lcxPesqOrigem: TcxLookupComboBox
          Left = 478
          Top = 27
          RepositoryItem = dtmLookup.listaProvimentoOrigem
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          Width = 236
        end
        object cxLabel3: TcxLabel
          Left = 719
          Top = 10
          Caption = 'Tipo'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object lcxPesqTipo: TcxLookupComboBox
          Left = 720
          Top = 27
          RepositoryItem = dtmLookup.listaProvimentoTipo
          ParentFont = False
          Properties.ListColumns = <>
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 2
          Width = 314
        end
        object cxLabel4: TcxLabel
          Left = 609
          Top = 56
          Caption = 'N'#250'mero'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtPesqNumero: TcxTextEdit
          Left = 609
          Top = 72
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 4
          Width = 105
        end
        object cxLabel5: TcxLabel
          Left = 12
          Top = 94
          Caption = 'Data Legisla'#231#227'o'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtPesqData: TcxDateEdit
          Left = 12
          Top = 111
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 5
          Width = 95
        end
        object cxLabel6: TcxLabel
          Left = 113
          Top = 94
          Caption = 'Assunto'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtPesqAssunto: TcxTextEdit
          Left = 111
          Top = 111
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 6
          Width = 603
        end
        object btnPesquisar: TcxButton
          Left = 916
          Top = 77
          Width = 106
          Height = 25
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
          TabOrder = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarClick
        end
        object btnLimpar: TcxButton
          Left = 916
          Top = 105
          Width = 106
          Height = 25
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
          TabOrder = 9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparClick
        end
        object gbxTipoBusca: TcxGroupBox
          Left = 720
          Top = 63
          Caption = 'Busca'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 7
          Height = 68
          Width = 190
          object rbPesqExata: TcxRadioButton
            Left = 7
            Top = 19
            Width = 77
            Height = 17
            Caption = 'Exata'
            Checked = True
            TabOrder = 0
            TabStop = True
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
          end
          object rbPesqAproximada: TcxRadioButton
            Left = 8
            Top = 42
            Width = 77
            Height = 17
            Caption = 'Aproximada'
            TabOrder = 1
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
          end
        end
        object cxLabel13: TcxLabel
          Left = 12
          Top = 56
          Caption = 'Natureza / '#193'rea'
          ParentFont = False
          Style.StyleController = dtmControles.cxStyleLabel
        end
        object edtPesqNaturezaArea: TcxTextEdit
          Left = 12
          Top = 72
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 3
          Width = 593
        end
        object cxGroupBox1: TcxGroupBox
          Left = 9
          Top = 10
          Caption = 'Data de Inser'#231#227'o'
          ParentFont = False
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 17
          Height = 44
          Width = 221
          object edtPesqDataInsercaoIni: TcxDateEdit
            Left = 8
            Top = 17
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 95
          end
          object edtPesqDataInsercaoFim: TcxDateEdit
            Left = 118
            Top = 17
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 95
          end
          object cxLabel15: TcxLabel
            Left = 105
            Top = 19
            Caption = #224
          end
        end
        object btnImprimirProtocolo: TcxButton
          Left = 916
          Top = 51
          Width = 106
          Height = 22
          Caption = 'Imprimir'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCA3A3A35D5D5D6C6C
            6C64646463636363636363636363636363636363636363636363636369696966
            6666797979E1E1E1FFFFFFFFFFFFFFFFFFA7A7A7474747181818101010000000
            0000000000000000000000000000000000000000000000000606061717171414
            14ABABABFFFFFFFFFFFFFFFFFF9D9D9D3F3F3F0D0D0D272727C5C5C5D8D8D8CC
            CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCE8E8E87A7A7A000000141414A0A0A0
            FFFFFFFFFFFFFFFFFFC6C6C66464641515152828288F8F8F9C9C9C9494949494
            94949494949494949494949494A7A7A75D5D5D0404041E1E1ECCCCCCFFFFFFFF
            FFFFFFFFFFE1E1E18282822222221C1C1C010101000000000000000000000000
            0000000000000000000000000707071A1A1A383838E8E8E8FFFFFFFFFFFFFFFF
            FFFCFCFCA6A6A62020202020202222221E1E1E17171717171718181818181818
            18181A1A1A1313130404041616165C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            C2C2C22222222222222222222323231F1F1F1919191919191A1A1A1A1A1A1414
            14282828565656202020777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E023
            23232323232323232323232525252222221B1B1B1B1B1B1C1C1C090909464646
            D5D5D52F2F2F979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444442525
            252525252525252525252727272424241E1E1E1B1B1B1C1C1C1F1F1F2424241D
            1D1DC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE959595A5A5A5
            ACACACAAAAAAAAAAAAABABABAAAAAAAAAAAAAAAAAAAAAAAA959595BFBFBFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC8787876B6B6B74
            74747474747474747575757474747373735C5C5CA9A9A9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F53434343232325858585A5A
            5A5858585858585D5D5D5353532929296D6D6DFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F93A3A3A3636366A6A6A6C6C6C696969
            6969696F6F6F6161612D2D2D787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9F9F93939393B3B3B7F7F7F8282827E7E7E7E7E7E86
            86867474742E2E2E777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF4F4F43737373636365959595B5B5B5959595959595D5D5D5454
            542F2F2F717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFC9696967D7D7D7F7F7F7E7E7E7F7F7F7F7F7F7E7E7E808080777777
            B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          TabOrder = 18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnImprimirProtocoloClick
        end
      end
      object grdBasica: TcxGrid
        Left = 0
        Top = 137
        Width = 1045
        Height = 345
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        object grdBasicaDBTableView1: TcxGridDBTableView
          OnDblClick = grdBasicaDBTableView1DblClick
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
          DataController.DataModeController.GridModeBufferCount = 50
          DataController.DataSource = SourceProvimento
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Qtd: 0'
              Kind = skCount
              FieldName = 'NUMERO'
              Column = grdBasicaDBTableView1PROVIMENTO_ESFERA_NIVEL_ID
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
          object grdBasicaDBTableView1PROVIMENTO_ESFERA_NIVEL_ID: TcxGridDBColumn
            Caption = 'Esfera/N'#237'vel'
            DataBinding.FieldName = 'PROVIMENTO_ESFERA_NIVEL_ID'
            RepositoryItem = dtmLookup.listaProvimentoEsferaNivel
            Width = 108
          end
          object grdBasicaDBTableView1PROVIMENTO_ORIGEM_ID: TcxGridDBColumn
            Caption = 'Origem'
            DataBinding.FieldName = 'PROVIMENTO_ORIGEM_ID'
            RepositoryItem = dtmLookup.listaProvimentoOrigem
            Width = 121
          end
          object grdBasicaDBTableView1PROVIMENTO_TIPO_ID: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'PROVIMENTO_TIPO_ID'
            RepositoryItem = dtmLookup.listaProvimentoTipo
            Width = 131
          end
          object grdBasicaDBTableView1NATUREZA_AREA: TcxGridDBColumn
            Caption = 'Natureza / '#193'rea'
            DataBinding.FieldName = 'NATUREZA_AREA'
            Width = 340
          end
          object grdBasicaDBTableView1NUMERO: TcxGridDBColumn
            Caption = 'N'#250'mero'
            DataBinding.FieldName = 'NUMERO'
            Width = 98
          end
          object grdBasicaDBTableView1DATA: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ShowTime = False
            Width = 121
          end
          object grdBasicaDBTableView1DATA_INSERCAO: TcxGridDBColumn
            Caption = 'Data Inser'#231#227'o'
            DataBinding.FieldName = 'DATA_INSERCAO'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ShowTime = False
            Width = 110
          end
          object grdBasicaDBTableView1ASSUNTO: TcxGridDBColumn
            Caption = 'Assunto'
            DataBinding.FieldName = 'ASSUNTO'
            Width = 405
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
    end
    object tbsCadastro: TcxTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelData: TPanel
        Left = 0
        Top = 0
        Width = 1045
        Height = 482
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlCadastro: TPanel
          Left = 0
          Top = 0
          Width = 1045
          Height = 125
          Align = alTop
          BevelInner = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object cxLabel7: TcxLabel
            Left = 133
            Top = 5
            Caption = 'Esfera/N'#237'vel'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel8: TcxLabel
            Left = 375
            Top = 5
            Caption = 'Origem'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel9: TcxLabel
            Left = 614
            Top = 5
            Caption = 'Tipo'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel10: TcxLabel
            Left = 702
            Top = 43
            Caption = 'N'#250'mero'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel11: TcxLabel
            Left = 7
            Top = 81
            Caption = 'Data Legisla'#231#227'o'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel12: TcxLabel
            Left = 106
            Top = 81
            Caption = 'Assunto'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel14: TcxLabel
            Left = 7
            Top = 43
            Caption = 'Natureza / '#193'rea'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxLabel16: TcxLabel
            Left = 7
            Top = 5
            Caption = 'Data Inser'#231#227'o'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 8
            Top = 22
            DataBinding.DataField = 'DATA_INSERCAO'
            DataBinding.DataSource = SourceProvimento
            Enabled = False
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 8
            Width = 121
          end
          object lcxEsferaNivel: TcxDBLookupComboBox
            Left = 133
            Top = 22
            RepositoryItem = dtmLookup.listaProvimentoEsferaNivel
            DataBinding.DataField = 'PROVIMENTO_ESFERA_NIVEL_ID'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 9
            Width = 206
          end
          object lcxOrigem: TcxDBLookupComboBox
            Left = 375
            Top = 22
            RepositoryItem = dtmLookup.listaProvimentoOrigem
            DataBinding.DataField = 'PROVIMENTO_ORIGEM_ID'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 10
            Width = 206
          end
          object lcxTipo: TcxDBLookupComboBox
            Left = 615
            Top = 22
            RepositoryItem = dtmLookup.listaProvimentoTipo
            DataBinding.DataField = 'PROVIMENTO_TIPO_ID'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 11
            Width = 206
          end
          object edtNaturezaArea: TcxDBTextEdit
            Left = 8
            Top = 59
            DataBinding.DataField = 'NATUREZA_AREA'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 12
            Width = 690
          end
          object edtNumero: TcxDBTextEdit
            Left = 702
            Top = 59
            DataBinding.DataField = 'NUMERO'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 13
            Width = 119
          end
          object edtData: TcxDBDateEdit
            Left = 7
            Top = 98
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 14
            Width = 95
          end
          object edtAssunto: TcxDBTextEdit
            Left = 106
            Top = 98
            DataBinding.DataField = 'ASSUNTO'
            DataBinding.DataSource = SourceProvimento
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 15
            Width = 715
          end
          object btnAdicionarEsferaNivel: TcxButton
            Left = 341
            Top = 20
            Width = 28
            Height = 23
            Cursor = crHandPoint
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
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
              FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
              000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
              FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
              D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
              00000000000000000000000000D5FFAA00000000000000000000000000000000
              00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
              00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
              FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
              FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
              FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnAdicionarEsferaNivelClick
          end
          object btnAdicionarOrigem: TcxButton
            Left = 583
            Top = 20
            Width = 28
            Height = 23
            Cursor = crHandPoint
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
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
              FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
              000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
              FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
              D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
              00000000000000000000000000D5FFAA00000000000000000000000000000000
              00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
              00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
              FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
              FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
              FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 17
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnAdicionarOrigemClick
          end
          object btnAdicionarTipo: TcxButton
            Left = 823
            Top = 20
            Width = 28
            Height = 23
            Cursor = crHandPoint
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
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
              FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
              000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
              FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
              D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
              00000000000000000000000000D5FFAA00000000000000000000000000000000
              00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
              00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
              FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
              FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
              FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
              FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnAdicionarTipoClick
          end
        end
        object cxPageControl1: TcxPageControl
          Left = 0
          Top = 133
          Width = 1045
          Height = 349
          Align = alClient
          Color = 14807280
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
          Properties.ActivePage = cxTabSheet2
          Properties.CustomButtons.Buttons = <>
          LookAndFeel.Kind = lfUltraFlat
          ClientRectBottom = 349
          ClientRectRight = 1045
          ClientRectTop = 24
          object cxTabSheet2: TcxTabSheet
            Caption = 'Anexo'
            ImageIndex = 1
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 201
              Height = 325
              Align = alLeft
              BevelOuter = bvNone
              Color = 14807280
              ParentBackground = False
              TabOrder = 0
              object pnlAnexar: TPanel
                Left = 0
                Top = 0
                Width = 201
                Height = 31
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object btnAnexarArquivo: TcxButton
                  Left = 47
                  Top = 3
                  Width = 106
                  Height = 25
                  Cursor = crHandPoint
                  Caption = 'Anexar'
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  OptionsImage.Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000000000000000
                    000000000000000000000000000000000000000000001B1B1B8F313131FF3131
                    31FF313131FF1F1F1F9F03030310000000000000000000000000000000000000
                    0000000000000000000000000000000000001919198F252525CF0C0C0C400000
                    000006060620252525CF1D1D1D9F000000000000000000000000000000000000
                    0000000000000000000000000000000000002B2B2BFF0B0B0B40000000000000
                    000000000000060606202B2B2BFF000000000000000000000000000000000000
                    000000000000000000000000000000000000282828FF00000000000000000000
                    00000000000000000000282828FF000000000000000000000000000000000000
                    00000000000000000000222222EF00000000242424FF00000000000000000000
                    0000222222EF00000000242424FF000000000000000000000000000000000000
                    00000000000000000000212121FF00000000212121FF00000000000000000000
                    0000212121FF00000000212121FF000000000000000000000000000000000000
                    000000000000000000001E1E1EFF000000001E1E1EFF00000000000000000000
                    00001E1E1EFF000000001E1E1EFF000000000000000000000000000000000000
                    000000000000000000001B1B1BFF000000001B1B1BFF00000000000000000000
                    00001B1B1BFF000000001B1B1BFF000000000000000000000000000000000000
                    00000000000000000000181818FF01010110181818FF00000000000000000000
                    0000181818FF00000000181818FF000000000000000000000000000000000000
                    00000000000000000000141414FF01010110141414FF00000000000000000101
                    0110141414FF00000000141414FF000000000000000000000000000000000000
                    00000000000000000000111111FF000000000F0F0FDF0B0B0B9F020202200B0B
                    0B9F0F0F0FDF00000000111111FF000000000000000000000000000000000000
                    000000000000010101100E0E0EFF00000000030303300C0C0CDF0E0E0EFF0C0C
                    0CDF03030330000000000E0E0EFF000000000000000000000000000000000000
                    000000000000010101100B0B0BFF010101100000000000000000000000000000
                    000000000000010101100B0B0BFF000000000000000000000000000000000000
                    00000000000000000000070707DF040404800000000000000000000000000000
                    00000000000004040480070707DF000000000000000000000000000000000000
                    0000000000000000000002020250040404FF0202028000000020000000000000
                    00200202028F040404FF02020250000000000000000000000000000000000000
                    000000000000000000000000000001010140010101CF010101FF010101FF0101
                    01FF010101BF0101014000000000000000000000000000000000}
                  TabOrder = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnAnexarArquivoClick
                end
              end
              object FileListBoxEx1: TFileListBoxEx
                Left = 0
                Top = 31
                Width = 201
                Height = 294
                Align = alClient
                ShowGlyphs = True
                TabOrder = 1
                OnChange = FileListBoxEx1Change
                Version = '1.2.1.1'
              end
            end
            object pagArquivoAnexo: TcxPageControl
              Left = 209
              Top = 0
              Width = 836
              Height = 325
              Align = alClient
              TabOrder = 1
              Properties.ActivePage = tbsImagem
              Properties.CustomButtons.Buttons = <>
              LookAndFeel.Kind = lfUltraFlat
              OnPageChanging = pagArquivoAnexoPageChanging
              ClientRectBottom = 325
              ClientRectRight = 836
              ClientRectTop = 24
              object tbsImagem: TcxTabSheet
                Caption = 'Imagem'
                ImageIndex = 0
                inline fmeImagem1: TfmeImagem
                  Left = 0
                  Top = 0
                  Width = 836
                  Height = 301
                  Align = alClient
                  TabOrder = 0
                  ExplicitWidth = 836
                  ExplicitHeight = 301
                  inherited Panel1: TPanel
                    Width = 595
                    Height = 238
                    ExplicitWidth = 608
                    ExplicitHeight = 238
                    inherited ImageView: TImageEnView
                      Width = 606
                      Height = 236
                      ExplicitWidth = 606
                      ExplicitHeight = 236
                    end
                  end
                  inherited sbxPropriedades: TScrollBox
                    Left = 595
                    Height = 238
                    ExplicitLeft = 595
                    ExplicitHeight = 238
                    inherited cxLabel1: TcxLabel
                      ExplicitWidth = 220
                      AnchorX = 110
                    end
                  end
                  inherited StatusBar1: TStatusBar
                    Top = 282
                    Width = 836
                    ExplicitTop = 282
                    ExplicitWidth = 836
                  end
                  inherited BarManager: TdxBarManager
                    DockControlHeights = (
                      0
                      0
                      44
                      0)
                  end
                end
              end
              object tbsPDF: TcxTabSheet
                Caption = 'PDF'
                ImageIndex = 1
                inline fmePDF1: TfmePDF
                  Left = 0
                  Top = 0
                  Width = 836
                  Height = 301
                  Align = alClient
                  TabOrder = 0
                  ExplicitWidth = 836
                  ExplicitHeight = 301
                  inherited gtPDFViewer1: TgtPDFViewer
                    Width = 836
                    Height = 266
                    ExplicitWidth = 836
                    ExplicitHeight = 266
                  end
                  inherited Panel1: TPanel
                    Width = 836
                    ExplicitWidth = 836
                    inherited btnZoomMais: TBitBtn
                      OnClick = fmePDF1btnZoomMaisClick
                    end
                    inherited Panel2: TPanel
                      Left = 717
                      ExplicitLeft = 717
                    end
                  end
                end
              end
            end
            object spl: TcxSplitter
              Left = 201
              Top = 0
              Width = 8
              Height = 325
              HotZoneClassName = 'TcxMediaPlayer9Style'
              Control = Panel3
            end
          end
          object cxTabSheet1: TcxTabSheet
            Caption = 'Texto'
            ImageIndex = 0
            inline fmeTexto: TfmeEditorSimples
              Left = 0
              Top = 0
              Width = 1045
              Height = 325
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 1045
              ExplicitHeight = 325
              inherited wptFerramentas: TWPToolbar
                Width = 1045
                ExplicitWidth = 1045
              end
              inherited WPReguaHorizontal: TWPRuler
                Width = 1045
                ExplicitWidth = 1045
              end
              inherited wptTexto: TWPRichText
                Width = 1045
                Height = 269
                ExplicitWidth = 1045
                ExplicitHeight = 269
              end
            end
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 0
          Top = 125
          Width = 1045
          Height = 8
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 60
          AlignSplitter = salTop
          MinSize = 125
          Control = pnlCadastro
          ExplicitWidth = 8
        end
      end
    end
  end
  object pnlTopoCadastro: TPanel
    Left = 0
    Top = 0
    Width = 1045
    Height = 59
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnGravar: TcxButton
      Left = 137
      Top = 6
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Salvar'
      Colors.Default = clWhite
      Enabled = False
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000021222100E8EA
        E9007E817E003A3B3A00B3B3B30055555500CCCCCC009999990030323000FFFF
        FF006A6B6A00414241002C2D2C00BFC2BF00A3A2A3008B8B8B00DDDFDD00F4F5
        F400292A2900626362007475740035363500B9B9B9004C4D4C00A0A1A000F1F2
        F1004A4C4A00868986002E2F2E00A8A9A8003C3D3C0090939100C5C8C6002424
        2400FAFAFA005A5D5B0048494800D3D3D3007A7D7B00E1E4E200848684003839
        3800BDBDBD00C4C6C5008E8E8E00D0D3D100666666002D2E2D002A2B2A00EDED
        ED0030303000F6F8F7009595950026272600F3F3F300363736006B6E6C004E50
        4F00A5A5A500B5B7B5003B3C3B003E3F3E00C9C9C9002123220056585600ABAD
        AB00D3D6D5002A2C2A00BDC0BD00333333002C2E2C0036363600808381003A3C
        3A00FFFFFF003E3E3E0075777600898989005B5E5C00383A3800F1F3F1002224
        220027282700DDE1DD0020222200A3A5A30024262400484A48008F918F00F3F5
        F3006D6F6D00A4A7A40000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000090909090909
        0909090909090909090909090909090909090909090909090909093333090909
        0909090909090909090909090909090909090948282209090909090909090909
        09090909090909090909073F3F55090909090909090909090909090909090909
        09443721213D2D0909090909090909090909090909090909101A004343212319
        090909090909090909090909090909502E21322F2F2F351B0909090909090909
        090909090909090252323232323230083B090909090909090909090909095B32
        0C083035430808431A100909090909090909090909203D2F451205180B2F4545
        435A3309090909090909090927402F1530131909250332150808070909090909
        09090911381C1512142209090906370829453D2B09090909090909070815304D
        0909090909093E29454F454E010909090909105708430709090909090909092A
        08373C452609090909094C08370409090909090909090909164529293C410909
        090917173E09090909090909090909090904083C293942090909313609090909
        090909090909090909091D1C4B290A3609090909090909090909090909090909
        0909093A083D3D1F090909090909090909090909090909090909090907451E24
        0D09090909090909090909090909090909090909093437031331090909090909
        09090909090909090909090909092C293D580909090909090909090909090909
        090909090909090F452909090909090909090909090909090909090909090909
        0E18090909090909090909090909090909090909090909090909}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnGravarClick
    end
    object btnCancelar: TcxButton
      Left = 201
      Top = 6
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Cancelar'
      Colors.Default = clWhite
      Enabled = False
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000CCCC
        CC00616161003B3B3B002525250099999900FFFFFF00F5F5F5001A1A1A007676
        7600EDEDED005656560013131300ACACAC002E2E2E000B0B0B004C4C4C00BCBC
        BC008F8F8F0008080800D7D7D700464646002121210033333300A0A0A0002828
        28006666660088888800FBFBFB005E5E5E0018181800D4D4D400050505004242
        42008585850050505000C6C6C60036363600747474009F9F9F00101010001E1E
        1E008282820016161600F1F1F100D3D3D3002A2A2A005C5C5C0096969600A6A6
        A6005454540066666600F7F7F700AFAFAF005A5A5A0030303000222222006F6F
        6F00FFFFFF001C1C1C000E0E0E00494949000A0A0A00DBDBDB003C3C3C000606
        0600F3F3F3002C2C2C008B8B8B00B2B2B2001414140060606000F9F9F900EFEF
        EF00383838004E4E4E00D9D9D900A3A3A300585858004A4A4A00444444009191
        9100999999006A6A6A00898989003E3E3E000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000060606060606
        060A27151300001315270A06060606060606060606060642120E000000000000
        00000E1242060606060606060606010E2020202004030304202020200E010606
        0606060606112813130E221F420606421F2A16131328110606060606010C1313
        132306060606060606060A0213130C01060606070E0F0F0F0F0F0B1C06060606
        06060606090F0F37340606303C3C3C3C3C3C3C0B1C0606060606060606473C3C
        30062C25280E0B2828282828361C060606060606060A3828252C31282844062F
        2828282828361C060606060606061B282831230C1E14061C1D460C0C0C0C1D1C
        060606060606142B0C23292B253406061C1D1E2B2B2B2B1D1C06060606060717
        2B29080810060606061C470808080808471C0606060606100808080810060606
        06061C020808080808021C060606061008080429403406060606061C02292929
        29291A1C0606074A29043629383F0606060606061C1A29292929291A1C064C16
        16360D161612060606060606061C1A16161616161A063016160D2C1538252C06
        0606060606061C1A3838383838025538152C061804043906060606060606061C
        1A04040404040404270606341519192206060606060606061C53191919191915
        340606061F172E2E094906060606060606061A2E2E2E171F0606060606241743
        4321303F070606073F051043431724060606060606062D230E0E0E0E3D2F2F3D
        0E0E0E0E232D060606060606060606074D323737373737373737324D07060606
        0606060606060606062C45534A17174A1A352C06060606060606}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object btnExcluir: TcxButton
      Left = 265
      Top = 6
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Excluir'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000D3D3
        D300585858002727270099999900FFFFFF0013131300E6E6E6004A4A4A007171
        7100A1A1A10046464600C7C7C70036363600858585006C6C6C00F5F5F5006A6A
        6A000404040020202000D9D9D900F3F3F300666666001C1C1C00E0E0E000F1F1
        F100404040009F9F9F000707070076767600F8F8F8009D9D9D004C4C4C002323
        23002B2B2B00A4A4A40000000000D5D5D500DBDBDB0087878700060606002424
        24004F4F4F000A0A0A0014141400C9C9C9000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000050505050505
        050505050505050505050505050505050505050505100D0E0505050505050505
        05050505100D0E05050505051020002B0A050505050505050505051520002B23
        050505070B000000121B0505050505050505150B000000122705052617000000
        0000040505050505051E08000000000002050505011700000000121F05050505
        150B0000000000090505050505142100000000121B0505150B00000000001105
        050505050505251300000000000A190800000000000F05050505050505050501
        1700000000062200000000000F05050505050505050505051421000000000000
        000000110505050505050505050505050525030000000000001C0F0505050505
        050505050505050505050C0000000000001A0505050505050505050505050505
        05152A0000000000002C1B050505050505050505050505051E08000000000000
        000000040505050505050505050505150B00000000002B00000000121F050505
        050505050505150B00000000001D0C2900000000121B050505050505051E0800
        000000000F050525130000000000040505050505150B00000000000F05050505
        011700000000120A050505070B00000000001105050505050514210000000012
        2705052617000000000F05050505050505052513000000000205050501170000
        0F05050505050505050505011700000905050505051403110505050505050505
        0505050514031105050505050505180505050505050505050505050505180505
        0505050505050505050505050505050505050505050505050505}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnExcluirClick
    end
    object btnIncluir: TcxButton
      Left = 9
      Top = 6
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Hint = 'Incluir'
      Caption = 'Incluir'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF008A8A8A004B4B4B0099999900000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101010101
        0101010101010101010101010101010101010101010101010101010200000000
        0002010101010101010101010101010101010102000000000002010101010101
        0101010101010101010101020000000000020101010101010101010101010101
        0101010200000000000201010101010101010101010101010101010200000000
        0002010101010101010101010101010101010102000000000002010101010101
        0101010101010101010101040000000000040101010101010101010102020202
        0202020300000000000302020202020202010101000000000000000000000000
        0000000000000000000101010000000000000000000000000000000000000000
        0001010100000000000000000000000000000000000000000001010100000000
        0000000000000000000000000000000000010101000000000000000000000000
        0000000000000000000101010202020202020203000000000003020202020202
        0201010101010101010101040000000000040101010101010101010101010101
        0101010200000000000201010101010101010101010101010101010200000000
        0002010101010101010101010101010101010102000000000002010101010101
        0101010101010101010101020000000000020101010101010101010101010101
        0101010200000000000201010101010101010101010101010101010200000000
        0002010101010101010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010101010101010101}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnIncluirClick
    end
    object Panel1: TPanel
      Left = 891
      Top = 2
      Width = 152
      Height = 55
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object btnPesquisarTop: TcxButton
        Left = 22
        Top = 4
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Hint = 'Pesquisar'
        Caption = 'Pesquisar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000E7E7
          E7008181810042424200BFBFBF00181818006A6A6A00A3A3A300FFFFFF00D0D0
          D00030303000585858000A0A0A008E8E8E00B4B4B400F5F5F5006F6F6F002828
          2800DCDCDC00C9C9C900A6A6A600A1A1A100F3F3F30066666600040404007474
          74003A3A3A0048484800ADADAD001111110087878700EEEEEE00D9D9D900F8F8
          F8001E1E1E00C5C5C50060606000E5E5E500EDEDED00D7D7D700101010009494
          94007B7B7B00363636008C8C8C0046464600CCCCCC00FCFCFC00EAEAEA008585
          8500C3C3C30093939300E0E0E0004C4C4C00161616006C6C6C00060606007070
          70004A4A4A00F1F1F100DBDBDB001B1B1B00A7A7A700C7C7C700838383004444
          4400C1C1C10033333300767676003D3D3D00AFAFAF0014141400FFFFFF000000
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
          0000000000000000000000000000000000000000000000000000080808080808
          0808080808080808080808080808080808080808080808080808080808080808
          080808080F2B3108080808080808080808080808080808080808081635000C07
          080808080808080808080808080808080808161B000000181E08080808080808
          080808080808080808213A00000000000B080808080808080808080808080808
          162D000000000039080808080808080808080808080808161B00000000000608
          0808080808080808080808080808213A00000000003708080808080808080808
          2307070742123A000000000037080808080808080808091B0000000000050000
          00000006080808080808080808321D002D070E1C240000000000370808080808
          08080808343D1807080808080823220018100808080808080808080839002908
          0808080808082E00221608080808080808080830364321080808080808080824
          380408080808080808080827002A0808080808080808081C0015080808080808
          0808082E00020808080808080808080E00070808080808080808082000060808
          080808080808081400070808080808080808083B112226080808080808080803
          3813080808080808080808080D00060808080808080807001B2F080808080808
          080808080F450037260808080F33001D09080808080808080808080808251A00
          363940190A00052308080808080808080808080808083B2C1100000047443C08
          080808080808080808080808080808081F3C2E27010808080808080808080808
          0808080808080808080808080808080808080808080808080808}
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnPesquisarTopClick
      end
      object btnFechar: TcxButton
        Left = 86
        Top = 4
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Caption = 'Sair'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000033333300DFDF
          DF008585850046464600CCCCCC0066666600FFFFFF00B0B0B00066666600ADAD
          AD00F1F1F1005C5C5C00C9C9C9007474740099999900D6D6D600F3F3F3009292
          9200E9E9E900B7B7B700373737007070700051515100FFFFFF00D4D4D400E5E5
          E500BDBDBD006C6C6C0079797900E3E3E300B5B5B5003A3A3A00CFCFCF005F5F
          5F0048484800D5D5D500B3B3B300EBEBEB00D1D1D10000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060606061005
          000000000000000000000000001F110606060606060A15000000000000000000
          000000000000000E0606060606020015230F0F0F0F0F0F0F0F0F0F0F0F0C0300
          0A0606060605002406060606060606060606060606061B001D06060606050009
          0606060606060606060606060606050019060606060500090606060606060606
          0606060606062100190606060605000906060606060606060618151206061300
          0106060606050009060606060606060606070022260606201206060606050009
          0606060606060606061A0000141E06060606060606050009060606090D0D0D0D
          0D0B000000000E0606060606060500090606062200000000000000000000001C
          0606060606050009060606160000000000000000000000000B04060606050009
          060606160000000000000000000000000B040606060500090606062200000000
          000000000000001C0606060606050009060606090D0D0D0D0D0B000000000E06
          06060606060500090606060606060606061A0000141E06060606060606050009
          0606060606060606060700222606062012060606060500090606060606060606
          06261B1206061300010606060605000906060606060606060606060606062100
          1906060606050009060606060606060606060606060605001906060606050024
          06060606060606060606060606061B001D06060606020015230F0F0F0F0F0F0F
          0F0F0F0F0F0C03000A060606060A15000000000000000000000000000000000E
          0606060606061005000000000000000000000000001F11060606}
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnFecharClick
      end
    end
    object btnAlterar: TcxButton
      Left = 73
      Top = 6
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Alterar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000DBDB
        DB008A8A8A003333330012121200C5C5C5005E5E5E00B9B9B900FFFFFF00B5B5
        B50008080800A9A9A9001E1E1E00A5A5A500D1D1D100A0A0A0001A1A1A00BDBD
        BD0021212100E6E6E6003D3D3D000C0C0C00CCCCCC0027272700E2E2E200C1C1
        C1001414140039393900AEAEAE00D3D3D30004040400181818000A0A0A00C8C8
        C800BBBBBB000E0E0E001C1C1C00B7B7B700D5D5D500C7C7C700E9E9E9003E3E
        3E00292929000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000080808000000
        0000000000000000000000000002080808080808080606060606060606060606
        0606060606110808080808080808080808080808080808080808080808080808
        080808080810101A0C190808080808080808080808080808080808080800001E
        0B0827160808080808080808080808080808080808000A1C0819150416080808
        080808080808080808080808080A0D08050400000C0E08080808080808080808
        08080808081108211A000000000C0E080808080808080808080808080808190A
        000000000000101608080808080808080808080808080700000000000000000C
        0E08080808080808080808080808081123000000000000000C0E080808080808
        0808080808080808071500000000000000101608080808080808080808080808
        08092000000000000000121D0808080808080808080808080808222300000000
        0000000C0E080808080808080808080808080807150000000000000024160808
        080808080808080808080808092000000000000000121D080808080808080808
        08080808080723000000000000000C0E0808080808080808080808080808070A
        000000000000000C0E0808080808080808080808080808091500000000000000
        171908080808080808080808080808082515000000000000001B080808080808
        080808080808080808090A000000000029010808080808080808080808080808
        080809150000000313080808080808080808080808080808080808071A001428
        08080808080808080808080808080808080808080F2A18080808}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnAlterarClick
    end
  end
  object DataSetProvimento: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_PROVIMENTO')
    Left = 546
    Top = 249
  end
  object ProviderProvimento: TDataSetProvider
    DataSet = DataSetProvimento
    Left = 470
    Top = 249
  end
  object ClientProvimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderProvimento'
    AfterInsert = ClientProvimentoAfterInsert
    AfterScroll = ClientProvimentoAfterScroll
    Left = 432
    Top = 249
    object ClientProvimentoPROVIMENTO_ID: TBCDField
      FieldName = 'PROVIMENTO_ID'
      Origin = 'PROVIMENTO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientProvimentoPROVIMENTO_ESFERA_NIVEL_ID: TBCDField
      FieldName = 'PROVIMENTO_ESFERA_NIVEL_ID'
      Origin = 'PROVIMENTO_ESFERA_NIVEL_ID'
      Precision = 20
      Size = 2
    end
    object ClientProvimentoPROVIMENTO_ORIGEM_ID: TBCDField
      FieldName = 'PROVIMENTO_ORIGEM_ID'
      Origin = 'PROVIMENTO_ORIGEM_ID'
      Precision = 20
      Size = 2
    end
    object ClientProvimentoPROVIMENTO_TIPO_ID: TBCDField
      FieldName = 'PROVIMENTO_TIPO_ID'
      Origin = 'PROVIMENTO_TIPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientProvimentoNATUREZA_AREA: TStringField
      FieldName = 'NATUREZA_AREA'
      Origin = 'NATUREZA_AREA'
      Size = 260
    end
    object ClientProvimentoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 30
    end
    object ClientProvimentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object ClientProvimentoASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Origin = 'ASSUNTO'
      Size = 260
    end
    object ClientProvimentoTEXTO: TBlobField
      FieldName = 'TEXTO'
      Origin = 'TEXTO'
    end
    object ClientProvimentoDATA_INSERCAO: TSQLTimeStampField
      FieldName = 'DATA_INSERCAO'
      Origin = 'DATA_INSERCAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object SourceProvimento: TDataSource
    DataSet = ClientProvimento
    Left = 508
    Top = 249
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Arquivo PDF ou Imagem|*.jpg;*.jpeg;*.bmp;*.png;*.tif;*.tiff;*.pd' +
      'f|JPG|*.jpg|JPEG|*.jpeg|Bitmap|*.bmp|PNG|*.png|TIFF|*.tif;*.tiff' +
      '|Arquivos PDF|*.pdf'
    Left = 584
    Top = 249
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PrintTitle = 'Elei'#231#227'o Mestre Central - 8'#186' Regi'#227'o'
    Version = 0
    Left = 720
    Top = 19
    object dxComponentPrinter1Link1: TdxGridReportLink
      Active = True
      Component = grdBasica
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43916.689298599540000000
      ReportTitle.Text = 'Resultado da Elei'#231#227'o do Mestre Central - 8'#186' Regi'#227'o'
      ShrinkToPageWidth = True
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      OptionsCards.AutoWidth = True
      OptionsCards.RowBordersHorz = True
      OptionsCards.RowBordersVert = True
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsFormatting.UseNativeStyles = True
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
