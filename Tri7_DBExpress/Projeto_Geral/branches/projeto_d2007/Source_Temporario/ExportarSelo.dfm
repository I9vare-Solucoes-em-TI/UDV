object frmExportarSelo: TfrmExportarSelo
  Left = 0
  Top = 0
  Caption = 'Exportar Selo'
  ClientHeight = 476
  ClientWidth = 968
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
  object pnlConvenio: TPanel
    Left = 0
    Top = 0
    Width = 968
    Height = 116
    Align = alTop
    BevelInner = bvLowered
    Color = 14807280
    ParentBackground = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 896
      Top = 2
      Width = 70
      Height = 112
      Align = alRight
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 10
        Top = 7
        Width = 55
        Height = 45
        Cursor = crHandPoint
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cxBtnFecharClick
        Colors.Default = clWhite
        Glyph.Data = {
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
        Layout = blGlyphTop
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
      end
    end
    object gbxPeriodo: TcxPageControl
      Left = 380
      Top = 9
      Width = 225
      Height = 78
      ActivePage = tbcPeriodo
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Office2007Blue'
      Style = 1
      TabOrder = 1
      OnChange = gbxPeriodoChange
      ClientRectBottom = 74
      ClientRectLeft = 4
      ClientRectRight = 221
      ClientRectTop = 24
      object tbcPeriodo: TcxTabSheet
        Caption = 'Per'#237'odo'
        ImageIndex = 0
        object cxGroupBox5: TcxGroupBox
          Left = 4
          Top = 2
          Style.TextStyle = [fsBold]
          TabOrder = 0
          Height = 45
          Width = 209
          object edtDataInicio: TcxDateEdit
            Left = 10
            Top = 15
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 83
          end
          object edtDataFinal: TcxDateEdit
            Left = 114
            Top = 15
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 83
          end
          object cxLabel11: TcxLabel
            Left = 99
            Top = 16
            Caption = 'a'
            Transparent = True
          end
        end
      end
      object tbcExportados: TcxTabSheet
        Caption = 'Selos Exportados'
        ImageIndex = 1
        object cxGroupBox2: TcxGroupBox
          Left = 4
          Top = 2
          Style.TextStyle = [fsBold]
          TabOrder = 0
          Height = 45
          Width = 209
          object lcxExportacao: TcxLookupComboBox
            Left = 8
            Top = 16
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'CODIGO_EXPORTACAO'
            Properties.ListColumns = <
              item
                FieldName = 'DATA'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsDataExportacao
            TabOrder = 0
            Width = 193
          end
        end
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 12
      Top = 10
      Caption = ' Tipo da Pesquisa'
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Black'
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 2
      Transparent = True
      Height = 45
      Width = 360
      object rdbSelosNaoExp: TcxRadioButton
        Left = 12
        Top = 20
        Width = 125
        Height = 17
        Caption = 'Selos N'#227'o Exportados'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rdbSelosNaoExpClick
        Transparent = True
      end
      object rdbSelosTodos: TcxRadioButton
        Left = 144
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Todos os Selos'
        TabOrder = 1
        OnClick = rdbSelosTodosClick
        Transparent = True
      end
      object rdbSelosExp: TcxRadioButton
        Left = 248
        Top = 20
        Width = 105
        Height = 17
        Caption = 'Selos Exportados'
        TabOrder = 2
        OnClick = rdbSelosExpClick
        Transparent = True
      end
    end
    object gbxPesquisaFiltro: TcxGroupBox
      Left = 12
      Top = 72
      Caption = ' Filtro de Pesquisa'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 3
      Transparent = True
      Height = 43
      Width = 361
      object rdbPeriodoSelecionado: TcxRadioButton
        Left = 135
        Top = 21
        Width = 125
        Height = 17
        Caption = 'Per'#237'odo Selecionado'
        TabOrder = 0
        OnClick = rdbPeriodoSelecionadoClick
        Transparent = True
      end
      object rdbPeriodoQualquer: TcxRadioButton
        Left = 12
        Top = 21
        Width = 117
        Height = 17
        Caption = 'Qualquer Per'#237'odo'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rdbPeriodoQualquerClick
        Transparent = True
      end
    end
    object btnMarcar: TcxButton
      Left = 379
      Top = 91
      Width = 110
      Height = 19
      Cursor = crHandPoint
      Caption = 'Marcar Todos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnMarcarClick
      Colors.Default = clBlue
      Colors.Normal = 15513994
      Colors.Hot = 8421440
      Colors.Pressed = clGreen
      Colors.Disabled = clBtnFace
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object btnDesmarcar: TcxButton
      Left = 495
      Top = 91
      Width = 110
      Height = 19
      Cursor = crHandPoint
      Caption = 'Desmarcar Todos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnDesmarcarClick
      Colors.Default = clBlue
      Colors.Normal = 15513994
      Colors.Hot = 8421440
      Colors.Pressed = clGreen
      Colors.Disabled = clBtnFace
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Pink'
    end
    object btnPesquisar: TcxButton
      Left = 611
      Top = 54
      Width = 105
      Height = 22
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnPesquisarClick
      Colors.Default = clWhite
      Glyph.Data = {
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
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
    object btnXML: TcxButton
      Left = 722
      Top = 54
      Width = 105
      Height = 22
      Caption = 'Gerar XML'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnXMLClick
      Colors.Default = clWhite
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFCECECECECECED1D1D1CECECED1D1D1D3D3D3E0E0E0E1E1E1D5D5D5D2D2
        D2CECECED2D2D2CDCDCDCDCDCDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4CECECEE7
        E7E7E9E9E9E5E5E5E7E7E7E2E2E2E2E2E2D7D7D7D7D7D7E1E1E1E1E1E1E7E7E7
        E5E5E5E9E9E9E6E6E6CACACAE8E8E8FFFFFFFFFFFFE8E8E8D1D1D1ECECECDCDC
        DCDFDFDFE0E0E0E0E0E0E1E1E1E2E2E2E2E2E2E1E1E1E0E0E0E0E0E0DFDFDFDE
        DEDEE1E1E1D4D4D4DADADAFFFFFFFFFFFFF2F2F2D0D0D0EAEAEAE0E0E0E2E2E2
        E2E2E2E1E1E1E5E5E5E9E9E9E9E9E9E5E5E5E1E1E1E3E3E3E2E2E2E3E3E3E3E3
        E3CECECEE8E8E8FFFFFFFFFFFFF9F9F9D6D6D6EAEAEAE1E1E1E5E5E5E4E4E4E6
        E6E6F4F4F4E3E3E3E1E1E1E5E5E5E6E6E6E3E3E3E5E5E5E3E3E3E5E5E5CFCFCF
        EFEFEFFFFFFFFFFFFFFDFDFDD5D5D5EEEEEEE4E4E4E5E5E5D4D4D4FFFFFF9B9B
        9B7878788F8F8FACACACF1F1F1D8D8D8DEDEDEE9E9E9E7E7E7D4D4D4F4F4F4FF
        FFFFFFFFFFFFFFFFD7D7D7EBEBEBE9E9E9D9D9D9F0F0F0B8B8B81717174E4E4E
        7D7D7D9B9B9BCECECEE5E5E5D0D0D0EBEBEBEBEBEBD6D6D6F9F9F9FFFFFFFFFF
        FFFFFFFFDCDCDCEDEDEDE4E4E4D9D9D9FFFFFF5959593030304E4E4E7A7A7A8D
        8D8D7F7F7FECECECDADADADBDBDBF1F1F1D5D5D5FEFEFEFFFFFFFFFFFFFFFFFF
        E5E5E5E8E8E8EBEBEBDADADAECECECBBBBBB8B8B8B7575756060604343437E7E
        7EFBFBFBD6D6D6E7E7E7EBEBEBD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFEAEAEAEA
        EAEAF1F1F1E7E7E7DCDCDCFCFCFCCACACA9F9F9F656565474747F3F3F3E9E9E9
        DEDEDEF5F5F5EAEAEADDDDDDFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAEBEBEBEFEF
        EFF3F3F3EBEBEBF5F5F5F4F4F4E4E4E4CFCFCFD7D7D7FFFFFFE9E9E9F1F1F1F1
        F1F1EDEDEDDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6EDEDEDF1F1F1F3F3F3
        F4F4F4F1F1F1F5F5F5FCFCFCFFFFFFFDFDFDF0F0F0F4F4F4F3F3F3F3F3F3F1F1
        F1D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFDDDDDDFBFBFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6
        FEFEFEFFFFFFFFFFFFFFFFFFDDDDDDECECECC3C3C3BCBCBCB9B9B9BFBFBFB5B5
        B5B7B7B7B7B7B7C2C2C2B8B8B8A4A4A4C2C2C2C5C5C5E2E2E2E0E0E0F9F9F9FF
        FFFFFFFFFFFFFFFFE7E7E7BBBBBB0000002C2C2C3030302121213B3B3B2E2E2E
        3535350C0C0C2727277373731C1C1C0000007F7F7FF4F4F4F4F4F4FFFFFFFFFF
        FFF9F9F9EAEAEAC5C5C50000002A2A2AA9A9A97C7C7C5656569E9E9EB3B3B35D
        5D5D8585859696962323230000008E8E8EF3F3F3F1F1F1FFFFFFFFFFFFF5F5F5
        E9E9E9D2D2D22B2B2B242424C6C6C69F9F9F6C6C6CCBCBCB6F6F6FD2D2D28E8E
        8E6464643232322B2B2BA6A6A6F1F1F1E8E8E8FFFFFFFFFFFFEAEAEAE5E5E5DB
        DBDB3333337474748C8C8C737373AAAAAA9A9A9A3C3C3CA6A6A67F7F7F737373
        4E4E4E393939ACACACFAFAFADBDBDBFFFFFFFFFFFFF2F2F2D7D7D7FFFFFFDFDF
        DFE0E0E0D5D5D5D2D2D2D3D3D3C4C4C4D0D0D0C7C7C7D2D2D2DDDDDDE0E0E0DD
        DDDDF7F7F7D9D9D9E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFD6D6D6F1F1F1ECECEC
        E5E5E5E5E5E5DFDFDFE6E6E6E8E8E8E2E2E2E4E4E4E3E3E3EBEBEBF1F1F1DBDB
        DBFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
  end
  object Panel11: TPanel
    Left = 0
    Top = 190
    Width = 968
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Color = 14807280
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    object Image1: TImage
      Left = 11
      Top = 3
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004A0000004A0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004A0000089C1800089C1800004A
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004A000018B5310010A52100089C180010A5
        2100004A0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004A000029C6520021BD420010942100004A00000894
        1800089C1800004A0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004A000031CE5A0039D6630018A53100004A0000FF00FF00004A
        000008841000089C1800004A0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004A000029B54A00004A0000FF00FF00FF00FF00FF00
        FF00FF00FF00004A000008941800004A0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004A0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004A000008841000004A0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004A0000004A0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004A0000004A0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00}
      Transparent = True
    end
    object Image2: TImage
      Left = 103
      Top = 4
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00636363005A5A
        5A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006B6B6B0084848400FFA5A500FF9C
        9C00FF9C9C00FFA5A5004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00FFCECE00FFCECE00FFCECE005A5A
        5A00FFCECE00FFBDBD00FF9C9C00FFA5A5004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00FFCECE00FFA5A500FFCECE00FFCECE008484
        8400FFCECE00FFCECE00FFCECE00FFBDBD00FF9C9C004A4A4A00FF00FF00FF00
        FF00FF00FF006B6B6B00FFCECE00FFBDBD00FFCECE00FFCECE00FFCECE00FFCE
        CE00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FFA5A5004A4A4A00FF00
        FF00FF00FF006B6B6B00FFBDBD00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
        CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FF9C9C004A4A4A00FF00
        FF006B6B6B00FFA5A500FFEFEF00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
        CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FFA5A5004A4A
        4A006B6B6B00FFCECE00848484005A5A5A00FFCECE00FFCECE00FFCECE005A5A
        5A0042424200424242004242420042424200FFCECE0042424200FF9C9C004A4A
        4A0084848400FFCECE00FFFFFF00FFEFEF00FFCECE00FFCECE00FFCECE005A5A
        5A00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FF9C9C004A4A
        4A0084848400FFA5A500FFFFFF00FFEFEF00FFCECE00FFCECE00FFCECE005A5A
        5A00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FFA5A5004A4A
        4A00FF00FF0084848400FFEFEF00FFFFFF00FFEFEF00FFCECE00FFCECE005A5A
        5A00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FF9C9C004A4A4A00FF00
        FF00FF00FF0084848400FFCECE00FFEFEF00FFFFFF00FFEFEF00FFCECE005A5A
        5A00FFCECE00FFCECE00FFCECE00FFCECE00FFBDBD00FF9C9C004A4A4A00FF00
        FF00FF00FF00FF00FF0084848400FFCECE00FFEFEF00FFFFFF00FFEFEF00FFCE
        CE00FFCECE00FFCECE00FFCECE00FFBDBD00FF9C9C004A4A4A00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00FFCECE00FFEFEF00FFFFFF005A5A
        5A00FFCECE00FFCECE00FFBDBD00FF9C9C004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006B6B6B006B6B6B00FFA5A500FFCE
        CE00FFCECE00FFA5A5004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A
        4A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00}
      Transparent = True
    end
    object cxLabel10: TcxLabel
      Left = 36
      Top = 3
      Caption = 'Exportado'
      Style.TextColor = clGreen
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 125
      Top = 3
      Caption = 'Aguardando'
      Style.TextColor = clRed
      Transparent = True
    end
  end
  object pnlPesquisaSistema: TPanel
    Left = 0
    Top = 116
    Width = 968
    Height = 46
    Align = alTop
    BevelOuter = bvLowered
    Color = 13034466
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 146
      Top = 1
      Caption = 'Serventia'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object icxTipoSistema: TcxImageComboBox
      Left = 146
      Top = 17
      ParentFont = False
      Properties.Items = <>
      Properties.OnEditValueChanged = icxTipoSistemaPropertiesEditValueChanged
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 225
    end
    object lcxTipoSelo: TcxLookupComboBox
      Left = 377
      Top = 18
      Enabled = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO_COMPLETA'
        end
        item
          FieldName = 'NUMERO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoSelo
      Properties.OnEditValueChanged = lcxTipoSeloPropertiesEditValueChanged
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      Style.TextColor = clWindowText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 492
    end
    object cxLabel4: TcxLabel
      Left = 378
      Top = 1
      Caption = 'Tipo do Selo'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object chxFiltroSistema: TCheckBox
      Left = 21
      Top = 21
      Width = 119
      Height = 17
      Caption = 'Filtro por Sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = chxFiltroSistemaClick
    end
    object cxLabel2: TcxLabel
      Left = 875
      Top = 1
      Caption = 'Lote'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Style.TextStyle = [fsUnderline]
      Transparent = True
    end
    object lcxLote: TcxLookupComboBox
      Left = 875
      Top = 18
      Enabled = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'SELO_LOTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOTA_FISCAL'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsSeloLote
      Properties.OnEditValueChanged = lcxTipoSeloPropertiesEditValueChanged
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      Style.TextColor = clWindowText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 84
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 214
    Width = 968
    Height = 262
    ActivePage = tabSelosPesquisados
    Align = alClient
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    Style = 6
    TabOrder = 3
    ClientRectBottom = 262
    ClientRectRight = 968
    ClientRectTop = 24
    object tabSelosPesquisados: TcxTabSheet
      Caption = 'Selos Pesquisados'
      ImageIndex = 0
      object gridExportar: TcxGrid
        Left = 0
        Top = 0
        Width = 968
        Height = 238
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object gridSelos: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Cancel.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          OnCustomDrawCell = gridSelosCustomDrawCell
          DataController.DataSource = dtsSelos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total: 0'
              Kind = skCount
              FieldName = 'NOTA_FISCAL'
              Column = gridSelosNOTA_FISCAL
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.Navigator = True
          OptionsView.Footer = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Preview.Column = gridSelosColumn1
          Preview.Visible = True
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object gridSelosColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'CALC_CORRIGIDO'
          end
          object gridSelosEXPORTAR: TcxGridDBColumn
            Caption = 'Exportar'
            DataBinding.FieldName = 'CALC_SELECIONADO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Width = 60
          end
          object gridSelosExportado: TcxGridDBColumn
            DataBinding.FieldName = 'CALC_EXPORTADO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                ImageIndex = 6
                Value = True
              end
              item
                ImageIndex = 8
                Value = 'False'
              end>
            Options.Editing = False
            Options.Focusing = False
            Width = 24
            IsCaptionAssigned = True
          end
          object gridSelosNOTA_FISCAL: TcxGridDBColumn
            Caption = 'Id Pedido'
            DataBinding.FieldName = 'NOTA_FISCAL'
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
          object gridSelosNUMERO_AGRUPADOR: TcxGridDBColumn
            Caption = 'C'#243'digo Selo'
            DataBinding.FieldName = 'NUMERO_AGRUPADOR'
            Options.Editing = False
            Options.Focusing = False
            Width = 150
          end
          object gridSelosNUMERO_SELO: TcxGridDBColumn
            Caption = 'C'#243'digo Ato'
            DataBinding.FieldName = 'cal_numero_selo'
            Options.Editing = False
            Options.Focusing = False
            Width = 150
          end
          object gridSelosTIPO_ATO: TcxGridDBColumn
            Caption = 'Tipo Ato'
            DataBinding.FieldName = 'TIPO_ATO'
            Options.Editing = False
            Options.Focusing = False
            Width = 60
          end
          object gridSelosDATA: TcxGridDBColumn
            Caption = 'Data/Hora'
            DataBinding.FieldName = 'DATA'
            Options.Editing = False
            Options.Focusing = False
            Width = 120
          end
          object gridSelosAPRESENTANTE: TcxGridDBColumn
            Caption = 'Nome Civil'
            DataBinding.FieldName = 'APRESENTANTE'
            Options.Editing = False
            Options.Focusing = False
            Width = 162
          end
          object gridSelosNOME_COMPLETO: TcxGridDBColumn
            Caption = 'Nome Serventu'#225'rio'
            DataBinding.FieldName = 'NOME_COMPLETO'
            Options.Editing = False
            Options.Focusing = False
            Width = 250
          end
          object gridSelosIP_MAQUINA: TcxGridDBColumn
            Caption = 'IP M'#225'quina'
            DataBinding.FieldName = 'IP_MAQUINA'
            Options.Editing = False
            Options.Focusing = False
            Width = 80
          end
          object gridSelosVALOR_EMOLUMENTO: TcxGridDBColumn
            Caption = 'Valor Emolumento'
            DataBinding.FieldName = 'VALOR_EMOLUMENTO'
            Options.Editing = False
            Options.Focusing = False
            Width = 120
          end
          object gridSelosVALOR_TAXA_JUDICIARIA: TcxGridDBColumn
            Caption = 'Valor Tx. Judici'#225'ria'
            DataBinding.FieldName = 'VALOR_TAXA_JUDICIARIA'
            Options.Editing = False
            Options.Focusing = False
            Width = 120
          end
          object gridSelosVALOR_FUNDESP: TcxGridDBColumn
            Caption = 'Valor Fundesp'
            DataBinding.FieldName = 'VALOR_FUNDESP'
            Options.Editing = False
            Options.Focusing = False
            Width = 120
          end
          object gridSelosVALOR_TOTAL: TcxGridDBColumn
            Caption = 'Valor Total'
            DataBinding.FieldName = 'VALOR_TOTAL'
            Options.Editing = False
            Options.Focusing = False
          end
        end
        object gridExportarLevel1: TcxGridLevel
          GridView = gridSelos
        end
      end
    end
    object tabSelosEstoque: TcxTabSheet
      Caption = 'ATEN'#199#195'O: Selos no estoque m'#237'nimo (Pressione para verificar)'
      Highlighted = True
      ImageIndex = 1
      TabVisible = False
      object grdBasica: TcxGrid
        Left = 0
        Top = 0
        Width = 968
        Height = 238
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object grdBasicaDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Cancel.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total:0'
              Kind = skCount
              FieldName = 'NATUREZA_ID'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.Navigator = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDDGrupo: TcxGridDBColumn
            Caption = 'Grupo'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'SELO_GRUPO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO_COMPLETA'
              end>
            RepositoryItem = dtmLookup.Lista_SeloGrupo
            Width = 214
          end
          object grdBasicaDBTableView1SELO_GRUPO_ID: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.KeyFieldNames = 'SELO_GRUPO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'NUMERO'
              end>
            Width = 43
          end
          object grdBasicaDBTableView1TIPO_CARTORIO: TcxGridDBColumn
            Caption = 'Tipo Cart'#243'rio'
            DataBinding.FieldName = 'SELO_GRUPO_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'SELO_GRUPO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO_TIPO_CARTORIO'
              end>
            Width = 149
          end
          object grdBasicaDBTableView1DATA_LOTE: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA_LOTE'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 55
          end
          object grdBasicaDBTableView1SIGLA: TcxGridDBColumn
            Caption = 'Sigla'
            DataBinding.FieldName = 'SIGLA'
            Width = 64
          end
          object grdBasicaDBTableView1CALC_NUMERO_INI: TcxGridDBColumn
            Caption = 'N'#186' Inicial'
            DataBinding.FieldName = 'CALC_NUMERO_INI'
            Width = 65
          end
          object grdBasicaDBTableView1CALC_NUMERO_FIM: TcxGridDBColumn
            Caption = 'N'#186' Final'
            DataBinding.FieldName = 'CALC_NUMERO_FIM'
            Width = 66
          end
          object cxGridBasicaDBSituacao: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'SITUACAO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'Aguardando Uso'
                ImageIndex = 8
                Value = 'A'
              end
              item
                Description = 'Fechado'
                ImageIndex = 9
                Value = 'F'
              end
              item
                Description = 'Ativado'
                ImageIndex = 47
                Value = 'I'
              end>
            Width = 66
          end
          object grdBasicaDBTableView1NOTA_FISCAL: TcxGridDBColumn
            Caption = 'Nota Fiscal'
            DataBinding.FieldName = 'NOTA_FISCAL'
            Width = 62
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
    end
  end
  object pnlImpressaoTexto: TPanel
    Left = 0
    Top = 162
    Width = 968
    Height = 28
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Registros n'#227'o validados. Verifique!!!'
    Color = 13034466
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object sqlSelos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT SO.NOTA_FISCAL,'#13#10'       SL.SELO_LIVRO_ID, '#13#10'       SL.COD' +
      'IGO_EXPORTACAO,'#13#10'       SL.NUMERO_AGRUPADOR,'#13#10'       SL.SIGLA, S' +
      'L.NUMERO,'#13#10'       SG.NUMERO AS TIPO_ATO,'#13#10'       SL.APRESENTANTE' +
      ','#13#10'       U.NOME_COMPLETO,'#13#10'       SL.DATA,'#13#10'       SL.IP_MAQUIN' +
      'A,'#13#10'       SL.VALOR_TOTAL,'#13#10'       SL.VALOR_EMOLUMENTO,'#13#10'       ' +
      'SL.VALOR_TAXA_JUDICIARIA,'#13#10'       SL.VALOR_FUNDESP'#13#10'FROM G_SELO_' +
      'LIVRO SL'#13#10'LEFT JOIN G_SELO_LOTE SO ON'#13#10'  SL.SELO_LOTE_ID = SO.SE' +
      'LO_LOTE_ID'#13#10'LEFT JOIN G_SELO_GRUPO SG ON'#13#10'  SO.SELO_GRUPO_ID = S' +
      'G.SELO_GRUPO_ID'#13#10'LEFT JOIN G_USUARIO U ON'#13#10'  SL.USUARIO_ID = U.U' +
      'SUARIO_ID'#13#10'WHERE SL.CAMPO_ID = 4120'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = sqlSelosCalcFields
    Left = 44
    Top = 224
    object sqlSelosNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 30
    end
    object sqlSelosNUMERO_AGRUPADOR: TStringField
      FieldName = 'NUMERO_AGRUPADOR'
      Size = 30
    end
    object sqlSelosSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 30
    end
    object sqlSelosNUMERO: TFMTBCDField
      FieldName = 'NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlSelosTIPO_ATO: TFMTBCDField
      FieldName = 'TIPO_ATO'
      Precision = 20
      Size = 2
    end
    object sqlSelosAPRESENTANTE: TStringField
      FieldName = 'APRESENTANTE'
      Size = 120
    end
    object sqlSelosNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlSelosDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlSelosIP_MAQUINA: TStringField
      FieldName = 'IP_MAQUINA'
      Size = 30
    end
    object sqlSelosVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      currency = True
      Precision = 20
      Size = 3
    end
    object sqlSelosVALOR_EMOLUMENTO: TFMTBCDField
      FieldName = 'VALOR_EMOLUMENTO'
      currency = True
      Precision = 20
      Size = 3
    end
    object sqlSelosVALOR_TAXA_JUDICIARIA: TFMTBCDField
      FieldName = 'VALOR_TAXA_JUDICIARIA'
      currency = True
      Precision = 20
      Size = 3
    end
    object sqlSelosVALOR_FUNDESP: TFMTBCDField
      FieldName = 'VALOR_FUNDESP'
      currency = True
      Precision = 20
      Size = 3
    end
    object sqlSeloscal_numero_selo: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'cal_numero_selo'
      Size = 30
      Calculated = True
    end
    object sqlSelosCALC_SELECIONADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SELECIONADO'
    end
    object sqlSelosSELO_LIVRO_ID: TFMTBCDField
      FieldName = 'SELO_LIVRO_ID'
      Precision = 20
      Size = 2
    end
    object sqlSelosCALC_EXPORTADO: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CALC_EXPORTADO'
      Calculated = True
    end
    object sqlSelosCODIGO_EXPORTACAO: TFMTBCDField
      FieldName = 'CODIGO_EXPORTACAO'
      Precision = 20
      Size = 2
    end
    object sqlSelosVALIDADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'VALIDADO'
    end
    object sqlSelosNOME_CORRIGIDO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOME_CORRIGIDO'
      Size = 120
      Calculated = True
    end
  end
  object dtsSelos: TDataSource
    DataSet = sqlSelos
    Left = 76
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    Filter = 'XML|*.XML'
    Left = 108
    Top = 224
  end
  object SqlDataExportacao: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT FIRST 30 DISTINCT(DATA_EXPORTACAO) AS DATA, CODIGO_EXPORT' +
      'ACAO'#13#10'FROM G_SELO_LIVRO'#13#10'WHERE NOT DATA_EXPORTACAO IS NULL'#13#10'ORDE' +
      'R BY DATA_EXPORTACAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 44
    Top = 264
    object SqlDataExportacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object SqlDataExportacaoCODIGO_EXPORTACAO: TFMTBCDField
      FieldName = 'CODIGO_EXPORTACAO'
      Precision = 20
      Size = 2
    end
  end
  object dtsDataExportacao: TDataSource
    DataSet = SqlDataExportacao
    Left = 75
    Top = 263
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 264
    object actCorrigirNome: TMenuItem
      Caption = 'Corrigir Nome Civil'
      OnClick = actCorrigirNomeClick
    end
    object CorrigirTodosPesquisados1: TMenuItem
      Caption = 'Corrigir Todos Pesquisados'
      OnClick = CorrigirTodosPesquisados1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CorrigirServenturio1: TMenuItem
      Caption = 'Corrigir Serventu'#225'rio'
      OnClick = CorrigirServenturio1Click
    end
  end
  object sqlTipoSelo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT SELO_GRUPO_ID, DESCRICAO_COMPLETA, NUMERO'#13#10'FROM G_SELO_GR' +
      'UPO'#13#10'WHERE TIPO_CARTORIO = :TIPO_CARTORIO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'TIPO_CARTORIO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 158
    Top = 236
    object sqlTipoSeloSELO_GRUPO_ID: TFMTBCDField
      FieldName = 'SELO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlTipoSeloDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object sqlTipoSeloNUMERO: TFMTBCDField
      FieldName = 'NUMERO'
      Precision = 20
      Size = 2
    end
  end
  object dtsTipoSelo: TDataSource
    DataSet = sqlTipoSelo
    Left = 159
    Top = 268
  end
  object sqlSeloLote: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT SELO_LOTE_ID, NOTA_FISCAL, SELO_GRUPO_ID'#13#10'FROM G_SELO_LOT' +
      'E'#13#10'WHERE SELO_GRUPO_ID = :SELO_GRUPO_ID'#13#10'ORDER BY NOTA_FISCAL'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SELO_GRUPO_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'SELO_GRUPO_ID'
    MasterFields = 'SELO_GRUPO_ID'
    MasterSource = dtsTipoSelo
    PacketRecords = 0
    Params = <>
    Left = 193
    Top = 236
    object sqlSeloLoteSELO_LOTE_ID: TFMTBCDField
      FieldName = 'SELO_LOTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlSeloLoteNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 30
    end
    object sqlSeloLoteSELO_GRUPO_ID: TFMTBCDField
      FieldName = 'SELO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsSeloLote: TDataSource
    DataSet = sqlSeloLote
    Left = 193
    Top = 269
  end
end
