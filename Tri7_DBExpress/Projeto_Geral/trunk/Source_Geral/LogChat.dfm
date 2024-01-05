object frmLogChat: TfrmLogChat
  Left = 0
  Top = 0
  Caption = 'Log do Chat'
  ClientHeight = 716
  ClientWidth = 845
  Color = 16247513
  TransparentColorValue = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pagMovimentacao: TcxPageControl
    Left = 0
    Top = 0
    Width = 845
    Height = 716
    Align = alClient
    Color = 14807280
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    Properties.ActivePage = tbsTitulosAndamento
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Black'
    ClientRectBottom = 711
    ClientRectLeft = 2
    ClientRectRight = 840
    ClientRectTop = 25
    object tbsTitulosAndamento: TcxTabSheet
      Caption = 'Rela'#231#227'o de mensagens enviadas atrav'#233's do sistema'
      ImageIndex = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 838
        Height = 686
        Align = alClient
        BevelOuter = bvNone
        Color = 14807280
        ParentBackground = False
        TabOrder = 0
        object lblRegistrosEncontrados: TLabel
          Left = 0
          Top = 132
          Width = 838
          Height = 16
          Align = alTop
          Caption = 'N'#186' de Registros Encontrados: 000'
          Font.Charset = ANSI_CHARSET
          Font.Color = 4210688
          Font.Height = -13
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 229
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 838
          Height = 132
          Align = alTop
          BevelInner = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object Label2: TLabel
            Left = 15
            Top = 15
            Width = 26
            Height = 13
            Caption = 'Data:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label3: TLabel
            Left = 261
            Top = 15
            Width = 6
            Height = 13
            Caption = #224
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label1: TLabel
            Left = 15
            Top = 40
            Width = 115
            Height = 13
            Caption = 'Funcion'#225'rio que Enviou:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label4: TLabel
            Left = 15
            Top = 65
            Width = 126
            Height = 13
            Caption = 'Funcion'#225'rio que Recebeu:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Panel4: TPanel
            Left = 2
            Top = 89
            Width = 834
            Height = 41
            Align = alBottom
            BevelInner = bvLowered
            Color = 14807280
            ParentBackground = False
            TabOrder = 0
            object btnPesquisar: TcxButton
              Left = 6
              Top = 10
              Width = 106
              Height = 23
              Cursor = crHandPoint
              Caption = 'Pesquisar'
              Colors.Default = clWhite
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
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = btnPesquisarClick
            end
            object btnLimparPesquisa: TcxButton
              Left = 116
              Top = 10
              Width = 106
              Height = 23
              Cursor = crHandPoint
              Caption = 'Limpar'
              Colors.Default = clWhite
              OptionsImage.Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000AF0D0000AF0D0000000100000000000013131300EAEA
                EA006B6B6B0054545400B8B8B80041414100363636007C7C7C002F2F2F00FFFF
                FF008C8C8C005F5F5F00D8D8D8007474740099999900F7F7F700151515005858
                58004B4B4B00393939006666660027272700F3F3F300C9C9C90079797900A6A6
                A600E7E7E700202020006E6E6E00464646008484840092929200FBFBFB008383
                8300767676003E3E3E005C5C5C00F1F1F100626262009E9E9E00EFEFEF00F9F9
                F900444444004E4E4E00F5F5F5006C6C6C004848480066666600565656003030
                30004C4C4C0070707000787878005A5A5A008F8F8F00FFFFFF00EDEDED004242
                4200000000000000000000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                090909090909090909090909090909090909090C1E2121212121212121212109
                090909090909090909091707071C2D0707073302070707090909090909090909
                09040D0D14350B140D021126140D0D090909090909090920192D2D2D1E28160B
                0303010F0A2D2D090909090909090F1F141414140A0F092C343809200E141409
                090909090916212424242424241E2C090909201F2424240909090909090B3203
                030303030332330909091E2E0303030909090909091A2E392B2B2B2B2A122809
                09090F11052B2B09090909090909252B131D1D1D332509292716090F071D1D09
                090909090909090F1131232302160F2223141629342323090909090909090909
                0914150606261C06060624330606060909090909090909090909181B08080808
                0808080808080809090909090909090909090936100000000000000000000009
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909090909090909
                0909090909090909090909090909090909090909090909090909}
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = btnLimparPesquisaClick
            end
            object btnImprimirLog: TcxButton
              Left = 339
              Top = 10
              Width = 106
              Height = 23
              Cursor = crHandPoint
              Caption = 'Imprimir'
              Colors.Default = clWhite
              OptionsImage.Glyph.Data = {
                C6050000424DC605000000000000360400002800000014000000140000000100
                08000000000090010000120B0000120B0000000100000000000000000000D3D3
                D300626262001D1D1D00FFFFFF009595950051515100A4A4A40013131300DEDE
                DE0081818100E2E2E200C0C0C0007E7E7E0025252500B5B5B500B2B2B2000404
                0400EDEDED0029292900DBDBDB009F9F9F00525252006E6E6E005D5D5D002222
                220084848400E9E9E900999999002C2C2C001616160020202000DFDFDF00F0F0
                F000000000000707070000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000040418000000
                000000000000000000000000000204041B131E0D1A0A0A0A0A0A0A0A0A1A0D1E
                132104040F160820040404040404040404042008160F04040000000601091414
                14141414090106000000040400000000030E1919191919190E03000000000404
                0000000000000000000000000000000000000404000000000000000000000000
                000000000000040400000000000000000000000000000000000004040E1D1E00
                1F130E0E0E0E0E0E131F001E1D0E0404140B0A230C20141414141414200C230A
                0B140404040415111B04040404040404041B11150404040404041C0014040404
                040404040414001C040404040404050014040404040404040414000504040404
                040405001404040404040404041400050404040404041C001404040404040404
                0414001C04040404040405231204040404040404041223050404040404040711
                171A0A0A0A0A0A0A1A1711070404040404041000000000000000000000000010
                0404040404040404040404040404040404040404040404040404040404040404
                04040404040404040404}
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = btnImprimirLogClick
            end
          end
          object edtDataIni: TcxDateEdit
            Left = 143
            Top = 12
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            Style.IsFontAssigned = True
            StyleFocused.Color = clSkyBlue
            StyleFocused.TextColor = clGreen
            StyleFocused.TextStyle = [fsBold]
            StyleHot.TextStyle = [fsBold]
            TabOrder = 1
            Width = 112
          end
          object edtDataFim: TcxDateEdit
            Left = 274
            Top = 12
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            Style.IsFontAssigned = True
            StyleFocused.Color = clSkyBlue
            StyleFocused.TextColor = clGreen
            StyleFocused.TextStyle = [fsBold]
            StyleHot.TextStyle = [fsBold]
            TabOrder = 2
            Width = 112
          end
          object lcxFuncionarioEnviou: TcxLookupComboBox
            Left = 143
            Top = 37
            RepositoryItem = dtmLookup.Lista_UsuarioSistema
            ParentFont = False
            Properties.ListColumns = <>
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 243
          end
          object lcxFuncionarioRecebeu: TcxLookupComboBox
            Left = 143
            Top = 62
            RepositoryItem = dtmLookup.Lista_UsuarioSistema
            ParentFont = False
            Properties.ListColumns = <>
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            Style.IsFontAssigned = True
            TabOrder = 4
            Width = 243
          end
        end
        object grdPesquisa: TcxGrid
          Left = 0
          Top = 148
          Width = 838
          Height = 538
          Align = alClient
          TabOrder = 1
          object gridPesquisaPedidos: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dtsChat
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
            OptionsView.CellAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object gridPesquisaPedidosDATA: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DATA'
              Width = 135
            end
            object gridPesquisaPedidosUSUARIO_ENVIOU_ID: TcxGridDBColumn
              Caption = 'DE'
              DataBinding.FieldName = 'USUARIO_ENVIOU_ID'
              RepositoryItem = dtmLookup.listaG_Usuario
              Width = 171
            end
            object gridPesquisaPedidosUSUARIO_RECEBEU_ID: TcxGridDBColumn
              Caption = 'PARA'
              DataBinding.FieldName = 'USUARIO_RECEBEU_ID'
              RepositoryItem = dtmLookup.listaG_Usuario
              Width = 175
            end
            object gridPesquisaPedidosMENSAGEM: TcxGridDBColumn
              Caption = 'Mensagem'
              DataBinding.FieldName = 'MensagemCalc'
              Width = 691
            end
          end
          object grdPesquisaLevel1: TcxGridLevel
            GridView = gridPesquisaPedidos
          end
        end
      end
    end
  end
  object btnFechar: TcxButton
    Left = 747
    Top = 1
    Width = 48
    Height = 47
    Cursor = crHandPoint
    Caption = 'Sair'
    Colors.Default = clWhite
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
  object dtsChat: TDataSource
    DataSet = sqlChat
    Left = 245
    Top = 352
  end
  object sqlChat: TI9Query
    Aggregates = <>
    SQL.Strings = ('SELECT * FROM G_CHAT')
    ParamData = <>
    Params = <>
    OnCalcFields = sqlChatCalcFields
    Left = 245
    Top = 320
    object sqlChatCHAT_ID: TBCDField
      FieldName = 'CHAT_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlChatUSUARIO_RECEBEU_ID: TBCDField
      FieldName = 'USUARIO_RECEBEU_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatUSUARIO_ENVIOU_ID: TBCDField
      FieldName = 'USUARIO_ENVIOU_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 260
    end
    object sqlChatDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlChatRECEBEU: TStringField
      FieldName = 'RECEBEU'
      Size = 1
    end
    object sqlChatEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      Size = 1
    end
    object sqlChatMensagemCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'MensagemCalc'
      Size = 2000
      Calculated = True
    end
    object sqlChatMENSAGEM_BLOB: TBlobField
      FieldName = 'MENSAGEM_BLOB'
      Size = 1
    end
    object sqlChatUsuarioEnviouCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioEnviouCalc'
      Size = 60
      Calculated = True
    end
    object sqlChatUsuarioRecebeuCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioRecebeuCalc'
      Size = 60
      Calculated = True
    end
  end
  object frxLogChat: TfrxDBDataset
    UserName = 'frxLogChat'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MensagemCalc=MensagemCalc'
      'UsuarioEnviouCalc=UsuarioEnviouCalc'
      'UsuarioRecebeuCalc=UsuarioRecebeuCalc'
      'USUARIO_ENVIOU_ID=USUARIO_ENVIOU_ID'
      'DATA=DATA'
      'MENSAGEM_BLOB=MENSAGEM_BLOB')
    DataSet = sqlChatImprimir
    BCDToCurrency = False
    Left = 304
    Top = 320
  end
  object sqlChatImprimir: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT DISTINCT USUARIO_ENVIOU_ID, DATA, MENSAGEM_BLOB FROM G_CH' +
      'AT')
    ParamData = <>
    Params = <>
    OnCalcFields = sqlChatImprimirCalcFields
    Left = 341
    Top = 384
    object sqlChatImprimirMensagemCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'MensagemCalc'
      Size = 2000
      Calculated = True
    end
    object sqlChatImprimirUsuarioEnviouCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioEnviouCalc'
      Size = 60
      Calculated = True
    end
    object sqlChatImprimirUsuarioRecebeuCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioRecebeuCalc'
      Size = 60
      Calculated = True
    end
    object sqlChatImprimirUSUARIO_ENVIOU_ID: TBCDField
      FieldName = 'USUARIO_ENVIOU_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatImprimirDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
end
