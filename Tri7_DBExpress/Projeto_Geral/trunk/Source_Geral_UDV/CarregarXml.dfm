object frmCarregarXml: TfrmCarregarXml
  Left = 0
  Top = 0
  Caption = 'Carregar e Validar Xml Selos'
  ClientHeight = 474
  ClientWidth = 1023
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConvenio: TPanel
    Left = 0
    Top = 0
    Width = 1023
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    Color = 14807280
    ParentBackground = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 951
      Top = 2
      Width = 70
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 6
        Top = 4
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
      end
    end
    object ProgressBar1: TcxProgressBar
      Left = 456
      Top = 18
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Width = 170
    end
    object btnCarregar: TcxButton
      Left = 12
      Top = 18
      Width = 105
      Height = 22
      Caption = 'Carregar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCarregarClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000016161600DEDE
        DE00858585003E3E3E00C7C7C700363636004C4C4C00BCBCBC00303030009999
        99005C5C5C0022222200FFFFFF00FFFFFF004444440056565600B7B7B700F8F8
        F800606060003C3C3C0029292900CCCCCC007070700094949400464646005151
        51003A3A3A001E1E1E00D8D8D800A5A5A500424242002E2E2E00BEBEBE002424
        24004A4A4A005A5A5A0054545400333333002B2B2B001A1A1A00404040005E5E
        5E00C9C9C90038383800878787006262620026262600BDBDBD00585858002A2A
        2A00484848005252520000000000000000000000000000000000000000000000
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
        00000000000000000000000000000000000000000000000000000C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C15072020202020202020
        2020200710040C0C0C0C0C0C0C17001B1B1B1B1B1B1B1B1B1B1B1B1B1B00020C
        0C0C0C0C0C2414250825252525252525252525250826060C0C0C0C0C0C231F25
        252525252525252525252525251F240C0C0C0C0C0C2308050505050505050505
        0505050505080F0C0C0C0C0C0C0A251A1A1A1A1A1A1A1A1A1A1A1A1A1A25230C
        0C0C0C0C0C0A05030303030303030303030303030305230C0C0C0C0C0C291A28
        2828282828281E1E1E1E1E1E1E1A0A0C0C0C0C0C0C12030E0E0E0E0E0E0E0E0E
        0E0E0E0E0E130A0C0C0C0C0C0C121E2222222222220E1E03030303031325240C
        0C0C0C0C0C120E060606060618132E0B210B0B0B0B27090C0C0C0C0C0C24130E
        0E0E0E1E1F2502202A2A2A2A041C0C0C0C0C0C0C0C022108080808080A010C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C1116190A292D1D0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
    end
    object btnValidar: TcxButton
      Left = 123
      Top = 18
      Width = 105
      Height = 22
      Caption = 'Validar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnValidarClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200009B0E00009B0E0000000100000000000000000000E5E5
        E500737373002C2C2C00AFAFAF005B5B5B000E0E0E008E8E8E00FFFFFF00127D
        1200C8C8C8003E3E3E008B8B8B00F3F3F3001C1C1C00A0A0A000DDDDDD00C1C1
        C10006060600DBFFDB00EFEFEF00787878004D424D00F8F4F800141414009999
        99003737370060606000494949000A0A0A0024242400A9A9A90081818100EDED
        ED0033333300959595000C000C00CFCFCF00B5B5B50022222200FFFFFF004D4D
        4D00181818000404040012121200CCCCCC00E1E1E100FCFCFC0008080800C3C3
        C3005C5C5C008D8D8D0010101000F1F1F10099999900B1B1B100DFDFDF006262
        6200000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000080808080808
        0808080808080808080808080808080808080808080808080808081317080808
        0808080808080808080808080808080808080809162F08080808080808080808
        080808080808080808080C24001C080808080808080808080808080808080808
        080C0000001D0108080808080808080808080808080808080700000000001E2E
        080808080808080808080808080808082C0000000000001E0108080808080808
        0808080808080805120000000000000004080808080808080808080808083200
        00000000000000001D11080808080808080808080839000000000B231E000000
        0012110808080808080808080D2A000000291408250E00000000020808080808
        08080814220000001B2F0808080A18000000000C080808080808351A00000015
        0808080808083118000000340808080808081100000033080808080808080826
        1D0000120508080808080600341F08080808080808080808041D000000320D08
        08080322110808080808080808080808081F1200000010080808210D08080808
        08080808080808080808190000001A0D08080808080808080808080808080808
        080808230000002238080808080808080808080808080808080808080C000000
        0F08080808080808080808080808080808080808082000002A2D080808080808
        08080808080808080808080808081500002C0808080808080808080808080808
        0808080808080802000008080808080808080808080808080808080808080808
        2319080808080808080808080808080808080808080808080808}
    end
    object btnExportar: TcxButton
      Left = 234
      Top = 18
      Width = 105
      Height = 22
      Caption = 'Exportar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnExportarClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000120B0000120B0000000100000000000000000000B6B6
        B6005D5D5D0024242400FFFFFF009292920018181800E9E9E9004A4A4A001010
        100075757500D7D7D7002C2C2C000B0B0B0033333300A7A7A7001F1F1F00C9C9
        C9008D8D8D00F4F4F4000808080037373700E5E5E50066666600060606002A2A
        2A00A1A1A100C2C2C20086868600B2B2B200141414006666660028282800F1F1
        F100303030001B1B1B003F3F3F0056565600C1C1C1009D9D9D0022222200FAFA
        FA000D0D0D007D7D7D00121212001A1A1A00DBDBDB00F9F9F900CFCFCF006F6F
        6F009999990051515100A9A9A90090909000CCCCCC0020202000ECECEC00A5A5
        A500C6C6C600262626000E0E0E0016161600EBEBEB00E7E7E700404040006A6A
        6A00F3F3F300B9B9B9005E5E5E00D9D9D90039393900B3B3B300DDDDDD00ABAB
        AB00000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000040A18000000
        000000000000000D3C2429040404041400000000000000000000080B16120704
        040404181818181818181818180907130B040404040404141414141414141414
        1414291B140F04040404040D0D0D0D0D0D0D0D0E311C04110D0D0F040404042A
        2A2A2A2A2A2A0204040404362A2A2A390404040909090909091E482F44332524
        090909093404042C2C2C2C2C2C10213F2C2C2C2C2C2C2C2C1E2B041E1E1E1E1E
        1E28213F1E1E1E1E1E1E1E1E1E0E040606060606061038072003031006060606
        412F042323232323232327040404130123232317040404101010101010102805
        263A04301010410404040437373737373737373737282F363741040404040428
        2828282828282828280C292E12040404040404030303030303030303033B1A04
        0421040404040420202020202020202020202017174304040404040C0C0C0C0C
        0C0C0C0C0C0C0C0C320404040404040C0C0C0C0C0C0C0C0C0C0C0C3404040404
        0404040E222222222222222222461D040404040404040435150E0E0E0E0E0E0E
        401D0404040404040404}
    end
    object btnXML: TcxButton
      Left = 345
      Top = 18
      Width = 105
      Height = 22
      Caption = 'Gerar XML'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnXMLClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
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
    end
  end
  object gridImportar: TcxGrid
    Left = 0
    Top = 57
    Width = 1023
    Height = 417
    Hint = 'Duplo click no link para pesqusar os selo'
    Align = alClient
    PopupMenu = pm1
    TabOrder = 1
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object gridXml: TcxGridDBTableView
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
      DataController.DataSource = dsXml
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total: 0'
          Kind = skCount
          FieldName = 'identificacao_pedido'
          Column = gridXmlidentificacao_pedido
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'valor_entrada'
          Column = gridXmlValor_Entrada
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'emolumento'
          Column = gridXmlEmolumento
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'taxa_judiciario'
          Column = gridXmlTaxa_Judiciario
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'fundesp_ato'
          Column = gridXmlFundesp_Ato
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object gridXmlvalidado: TcxGridDBColumn
        Caption = 'Val.'
        DataBinding.FieldName = 'validado'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dtmControles.imgCadBasicos
        Properties.Items = <
          item
            Description = 'Localizado'
            ImageIndex = 6
            Value = 'S'
          end
          item
            Description = 'N'#227'o Localizado'
            ImageIndex = 7
            Value = 'N'
          end
          item
            Description = 'N'#227'o Pesquisado'
            ImageIndex = 56
            Value = 'I'
          end>
        Properties.ShowDescriptions = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 30
      end
      object gridXmlidentificacao_pedido: TcxGridDBColumn
        Caption = 'Identifica'#231#227'o Pedido'
        DataBinding.FieldName = 'identificacao_pedido'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 123
      end
      object gridXmlCod_Selo: TcxGridDBColumn
        Caption = 'C'#243'digo Selo'
        DataBinding.FieldName = 'codigo_selo'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 195
      end
      object gridXmlCod_Ato: TcxGridDBColumn
        Caption = 'C'#243'digo Ato'
        DataBinding.FieldName = 'codigo_ato'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Properties.ReadOnly = True
        Properties.UsePrefix = upNever
        Properties.OnStartClick = gridXmlCod_AtoPropertiesStartClick
        Properties.Prefix = ''
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 168
      end
      object gridXmlTipo_Ato: TcxGridDBColumn
        Caption = 'Tipo do Ato'
        DataBinding.FieldName = 'tipo_ato'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 72
      end
      object gridXmlNome_Civil_Ato: TcxGridDBColumn
        Caption = 'Nome do Civil do Ato'
        DataBinding.FieldName = 'nome_civil_ato'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 141
      end
      object gridXmlNome_Serventuario: TcxGridDBColumn
        Caption = 'Nome Serventu'#225'rio'
        DataBinding.FieldName = 'nome_serventuario'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 131
      end
      object gridXmlData_Solicitacao: TcxGridDBColumn
        Caption = 'Data Solicita'#231#227'o'
        DataBinding.FieldName = 'data_solicitacao'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 112
      end
      object gridXmlIp: TcxGridDBColumn
        Caption = 'Ip '
        DataBinding.FieldName = 'Ip'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object gridXmlValor_Entrada: TcxGridDBColumn
        Caption = 'Valor Entrada'
        DataBinding.FieldName = 'valor_entrada'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 83
      end
      object gridXmlEmolumento: TcxGridDBColumn
        Caption = 'Emolumento do Ato'
        DataBinding.FieldName = 'emolumento'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 115
      end
      object gridXmlTaxa_Judiciario: TcxGridDBColumn
        Caption = 'Taxa Judici'#225'ria'
        DataBinding.FieldName = 'taxa_judiciario'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 92
      end
      object gridXmlFundesp_Ato: TcxGridDBColumn
        Caption = 'Fundesp'
        DataBinding.FieldName = 'fundesp_ato'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
      end
    end
    object gridImportarLevel1: TcxGridLevel
      GridView = gridXml
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'XML|*.XML'
    Left = 168
    Top = 120
  end
  object dsXml: TDataSource
    DataSet = cdsXml
    Left = 120
    Top = 120
  end
  object cdsXml: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'identificacao_pedido'
        DataType = ftInteger
      end
      item
        Name = 'codigo_ato'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'tipo_ato'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'nome_civil_ato'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'data_solicitacao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'valor_entrada'
        DataType = ftCurrency
      end
      item
        Name = 'taxa_judiciario'
        DataType = ftCurrency
      end
      item
        Name = 'emolumento'
        DataType = ftCurrency
      end
      item
        Name = 'fundesp_ato'
        DataType = ftCurrency
      end
      item
        Name = 'nome_serventuario'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'codigo_selo'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Ip'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'validado'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 88
    Data = {
      F00100009619E0BD01000000180000000D000000000003000000F00114696465
      6E74696669636163616F5F70656469646F04000100000000000A636F6469676F
      5F61746F0100490000000100055749445448020002007800087469706F5F6174
      6F01004900000001000557494454480200020078000E6E6F6D655F636976696C
      5F61746F010049000000010005574944544802000200780010646174615F736F
      6C696369746163616F0100490000000100055749445448020002001E000D7661
      6C6F725F656E7472616461080004000000010007535542545950450200490006
      004D6F6E6579000F746178615F6A75646963696172696F080004000000010007
      535542545950450200490006004D6F6E6579000A656D6F6C756D656E746F0800
      04000000010007535542545950450200490006004D6F6E6579000B66756E6465
      73705F61746F080004000000010007535542545950450200490006004D6F6E65
      7900116E6F6D655F73657276656E74756172696F010049000000010005574944
      54480200020078000B636F6469676F5F73656C6F010049000000010005574944
      5448020002007800024970010049000000010005574944544802000200780008
      76616C696461646F010049000000010005574944544802000200010001000D44
      454641554C545F4F524445520200820000000000}
    object cdsXmlidentificacao_pedido: TIntegerField
      FieldName = 'identificacao_pedido'
    end
    object cdsXmlCodigo_ato: TStringField
      DisplayWidth = 120
      FieldName = 'codigo_ato'
      Size = 120
    end
    object cdsXmlTipo_ato: TStringField
      FieldName = 'tipo_ato'
      Size = 120
    end
    object cdsXmlNome_Civil_Ato: TStringField
      FieldName = 'nome_civil_ato'
      Size = 120
    end
    object cdsXmlData_Solicitacao: TStringField
      FieldName = 'data_solicitacao'
      Size = 30
    end
    object cdsXmlvalor_entrada: TCurrencyField
      FieldName = 'valor_entrada'
    end
    object cdsXmltaxa_judiciario: TCurrencyField
      FieldName = 'taxa_judiciario'
    end
    object cdsXmlemolumento: TCurrencyField
      FieldName = 'emolumento'
    end
    object cdsXmlfundesp_ato: TCurrencyField
      FieldName = 'fundesp_ato'
    end
    object cdsXmlnome_serventuario: TStringField
      FieldName = 'nome_serventuario'
      Size = 120
    end
    object cdsXmlcodigo_selo: TStringField
      DisplayWidth = 120
      FieldName = 'codigo_selo'
      Size = 120
    end
    object cdsXmlIp: TStringField
      FieldName = 'Ip'
      Size = 120
    end
    object cdsXmlvalidado: TStringField
      FieldName = 'validado'
      Size = 1
    end
  end
  object XMLDocument1: TXMLDocument
    NodeIndentStr = '    '
    XML.Strings = (
      '<?xml version="1.0"?>'
      '<selo_eletronico>'
      #9'<lote_dos_pedidos>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>122</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>82</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
      
        #9#9#9'<codigo_inicial_do_selo>03951208130933082000000</codigo_inici' +
        'al_do_selo>'
      
        #9#9#9'<codigo_final_do_selo>03951208130933082000999</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>1000</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>123</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>62</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
      
        #9#9#9'<codigo_inicial_do_selo>03951208130934062000000</codigo_inici' +
        'al_do_selo>'
      
        #9#9#9'<codigo_final_do_selo>03951208130934062001999</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>2000</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>124</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>70</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
      
        #9#9#9'<codigo_inicial_do_selo>03951208130934070000000</codigo_inici' +
        'al_do_selo>'
      
        #9#9#9'<codigo_final_do_selo>03951208130934070000499</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>500</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>125</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>5</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
      
        #9#9#9'<codigo_inicial_do_selo>03951208130935005000000</codigo_inici' +
        'al_do_selo>'
      
        #9#9#9'<codigo_final_do_selo>03951208130935005000499</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>500</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9'</lote_dos_pedidos>'
      
        #9'<hash_conferencia_do_arquivo_xml>3df829f52cb17f3210f25c7ed67539' +
        '0787ae2516</hash_conferencia_do_arquivo_xml>'
      '</selo_eletronico>')
    Left = 168
    Top = 88
    DOMVendorDesc = 'MSXML'
  end
  object pm1: TPopupMenu
    Left = 208
    Top = 88
    object ExportarparaExcel1: TMenuItem
      Caption = 'Exportar para Excel'
      OnClick = ExportarparaExcel1Click
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 120
  end
  object SaveDialog1: TSaveDialog
    Filter = 'XML|*.XML'
    Left = 220
    Top = 152
  end
end
