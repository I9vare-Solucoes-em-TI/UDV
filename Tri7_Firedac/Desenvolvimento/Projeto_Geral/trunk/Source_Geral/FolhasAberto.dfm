object frmFolhasAberto: TfrmFolhasAberto
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'Sele'#231#227'o da(s) Folha(s) do Livro'
  ClientHeight = 426
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 25
    Top = 30
    Width = 97
    Height = 13
    Caption = 'Total de Folhas: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4210688
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 761
    Height = 42
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 381
    object Label1: TLabel
      Left = 144
      Top = 19
      Width = 9
      Height = 19
      Caption = '+'
      Color = clBlack
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 296
      Top = 19
      Width = 9
      Height = 19
      Caption = '='
      Color = clBlack
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label130: TLabel
      Left = 6
      Top = 3
      Width = 132
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ' Qtd. Folhas Lacuna '
      Color = 4210688
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 158
      Top = 3
      Width = 133
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ' Qtd. Folhas Correta  '
      Color = 4210688
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 310
      Top = 3
      Width = 115
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ' Total de Folhas  '
      Color = 4210688
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object gbxIndisponibilidade: TcxGroupBox
      Left = 5
      Top = 10
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 2
      Transparent = True
      Height = 30
      Width = 134
      object lblQtdFolhasLacuna: TLabel
        Left = 50
        Top = 9
        Width = 27
        Height = 19
        Caption = '000'
        Color = 14807280
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = 4210688
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
    object btnConfirmar: TcxButton
      Left = 526
      Top = 13
      Width = 106
      Height = 25
      HelpType = htKeyword
      Caption = 'Confirmar'
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
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TcxButton
      Left = 635
      Top = 13
      Width = 106
      Height = 25
      Caption = 'Cancelar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      ModalResult = 2
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
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFDE7
        B55F180101185FB5E7FDFFFFFFFFFFFFFFF4BB56160209131309021656BBF4FF
        FFFFFFFFEE93290A2859829A9A825823092993EEFFFFFFF49420081275E4F8FE
        FEF8E3B854092094F4FFFEBD2A0B0B0D35B7FEFFFFFFFFFDE9550B2BBEFEE95E
        1118100E0E2CAEF9FFFFFFFFFFE8550F5EE9BB212F783A10101031AFFEFFFFFF
        FFFDB82A21BB691363E5BA3112121230BAFEFFFFFFFFE561126A2B1D8CF9FEB1
        351515153FB5FEFFFFFFF88A1C2B1B29A3FFFFF9B23619191B41BBFEFFFFFEA2
        291B1C2AA4FFFFFFFEBB421D1B1B39B4F9FFFEA32A1C332591F9FFFFFFFDB746
        1E1E1E3EB5FEF98E253372206BE6FFFFFFFFFEBD3C2020203DBDE76C2173BF32
        3BC0FEFFFFFFFFFEB54022222248823E32C0EB6D2765EBFFFFFFFFFFF9B54025
        25272D276DEBFEC5442969EBFDFFFFFFFFFEBF4D2A282944C5FEFFF5A33F2B6C
        C2E8F9FFFEF9E888332B3FA3F5FFFFFFF1A3492F467396ABAB96734A304AA3F1
        FFFFFFFFFFF5C6733F2F353E3E352F3F73C6F5FFFFFFFFFFFFFFFDECC47E4534
        34447CC3ECFDFFFFFFFF}
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object cxGroupBox1: TcxGroupBox
      Left = 157
      Top = 10
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 3
      Transparent = True
      Height = 30
      Width = 135
      object lblFolhaCorreta: TLabel
        Left = 52
        Top = 9
        Width = 27
        Height = 19
        Caption = '000'
        Color = clBlack
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = 4210688
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 309
      Top = 10
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.LookAndFeel.SkinName = ''
      Style.StyleController = dtmControles.cxEditStyleGroup
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 4
      Transparent = True
      Height = 30
      Width = 117
      object lblTotalFolhas: TLabel
        Left = 43
        Top = 9
        Width = 27
        Height = 19
        Caption = '000'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = 4210688
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
  object cxTabControl1: TcxTabControl
    Left = 0
    Top = 23
    Width = 761
    Height = 361
    Align = alClient
    TabOrder = 1
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      'Folhas')
    ClientRectBottom = 361
    ClientRectRight = 761
    ClientRectTop = 24
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 0
      Top = 24
      Width = 761
      Height = 337
      Align = alClient
      ColCount = 10
      Color = 13034466
      DataSource = dtsFolhas
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      PanelHeight = 67
      PanelWidth = 74
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      RowCount = 5
      SelectedColor = 16025154
      OnPaintPanel = DBCtrlGrid1PaintPanel
      object imgFolhasQuePularam: TImage
        Left = 26
        Top = 36
        Width = 20
        Height = 20
        Center = True
        Picture.Data = {
          07544269746D617036040000424D360400000000000036000000280000001000
          0000100000000100200000000000000400000000000000000000000000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF009FDAF10040B7E50000ACE50000B7
          EC0000B6EC0000ABE50040B7E4009FD8F000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00DFF3FB0030B7E60000C0F00000D8FF0000D6FF0000D5
          FF0000D4FF0000D3FF0000D2FF0000B9EE0030B0E200DFF2FA00FF00FF00FF00
          FF00FF00FF00DFF4FB0010B7EA0000D6FB0000DBFF0000DAFF0000D9FF0000D8
          FF0000D7FF0000D6FF0000D5FF0000D4FF0000CCFA0010AAE200DFF2FA00FF00
          FF00FF00FF0030C1ED0000DAFC0000DFFF0000DEFF0000DDFF0000DCFF0000DB
          FF0000DAFF0000D9FF0000D8FF0000D7FF0000D5FF0000CDFA0030B1E200FF00
          FF009FE2F7002CD5F6004AEBFF0045EAFF0034E7FF0010E1FF0000DFFF0000DD
          FF0000DCFF0000DBFF0000DAFF0000D9FF0000D8FF0000D7FF0000BCEE009FD8
          F00048CEF3005EF2FF0052EDFF004DECFF0048EBFF0043EAFF0018E4FF0000E0
          FF0000DFFF0000DEFF0000DDFF0000DCFF0000DBFF0000DAFF0000D9FF0040B7
          E4002ED1F6005EF1FF005AF0FF0055EFFF0050EEFF004BEDFF0042EBFF0009E4
          FF0000E2FF0000E1FF0000E0FF0000DFFF0000DEFF0000DCFF0000DBFF0000AF
          E60050E0FA0066F4FF0062F3FF005DF2FF0058F1FF0053EFFF004EEEFF002FEA
          FF0000E4FF0000E3FF0000E2FF0000E1FF0000E0FF0000DFFF0000DEFF0000BE
          EE0055E2FB006EF6FF006AF5FF0065F4FF0060F3FF005BF1FF0056F0FF0051EF
          FF000AE8FF0000E6FF0000E5FF0000E4FF0000E3FF0000E2FF0000E1FF0000C1
          EF0038D9FC0082F9FF0071F7FF006DF6FF0068F5FF0063F4FF005EF3FF0059F2
          FF003BEFFF0000E9FF0000E8FF0000E7FF0000E6FF0000E4FF0000E3FF0000BA
          EC004BDBFD00A1FCFF0079F9FF0075F8FF0070F7FF006BF6FF0066F5FF0061F4
          FF005CF3FF0022EEFF0000EAFF0000E9FF0000E8FF0000E7FF0005E8FF0040C4
          ED009FECFF006FEAFF008EFBFF007DFAFF0078F9FF0073F8FF006EF7FF0069F6
          FF0064F5FF005FF4FF0029F0FF0000ECFF0000EBFF0000EAFF000BD3F6009FE1
          F600FF00FF003CDBFF00A5F8FF0089FCFF0080FBFF007BFAFF0076F9FF0071F8
          FF006CF8FF0067F7FF0063F6FF0052F4FF0028F0FF002AEBFD0036C7F100FF00
          FF00FF00FF00DFF8FF0037DBFF00ADF9FF0099FDFF0083FCFF007EFBFF0079FA
          FF0074F9FF006FF9FF006BF8FF006AF7FF0075F3FE002ECCF400DFF6FD00FF00
          FF00FF00FF00FF00FF00DFF8FF003CDBFF0076EAFF00C3FEFF00A9FEFF0093FC
          FF008FFCFF0094FCFF00A3FDFF0064E5FC003BD0F700DFF6FD00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF009FECFF004CDEFF0041DEFF0067E7
          FF0066E7FF003FDCFE004CDAFC009FE9FC00FF00FF00FF00FF00FF00FF00FF00
          FF00}
        Stretch = True
        Transparent = True
      end
      object imgFolhasDisponiveis: TImage
        Left = 26
        Top = 36
        Width = 20
        Height = 20
        Center = True
        Picture.Data = {
          07544269746D617036040000424D360400000000000036000000280000001000
          0000100000000100200000000000000400000000000000000000000000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00A3CFA700479F4E000A871100098D
          0F00088C0E0007830C0044984700A0C9A200FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00E1F0E2003C9E45000F9818000FA817000FA816000EA7
          15000EA714000DA614000DA613000A900F00348F3800DFEDE000FF00FF00FF00
          FF00FF00FF00E1F1E300219A2F0014A91F0014AD1E0014AD1D0013AC1C0012AB
          1B0012AB1B0011AA1A0011AA190010A918000FA2160017871D00DFEDE000FF00
          FF00FF00FF0042AB520019AF260019B2250018B1240018B1240017B0230017B0
          220016AF210016AF200015AE200015AE1F0014AD1E0012A61B0036933C00FF00
          FF00A9DAB10045BC58005FCC6A005ACA65004BC557002ABA37001CB52A001BB4
          29001BB428001AB327001AB3260019B2250018B1250018B1240011991B00A2CC
          A5005DC0710076DB860069D1750065D0710060CE6C005BCC680036C0440020B9
          300020B92F001FB82E001EB72D001EB72D001DB62C001DB62B001CB52A0048A1
          500049C5660078D9850074D781006FD57C006AD4780066D273005ECF6C002CC0
          3E0024BD370024BD360023BC350023BC340022BB330021BA320021BA31001393
          1F0065D8830082DE90007EDC8C0079DB870074D9830070D87F006CD67B0051CE
          62002AC33F0029C23E0028C13D0028C13C0027C03B0026BF3A0026BF39001AA2
          2A0069DB88008CE29A0087E1960083E092007FDE8E007ADD8A0076DB860072DA
          820037CA4E002EC746002EC745002DC644002CC543002CC542002BC441001EA7
          300054D2750099EBAB0091E6A1008DE59D0088E3990084E2950080E191007CDF
          8D0063D9770034CD4E0033CC4D0032CB4C0032CB4B0031CA4A0030C949001DA2
          30006AD68600A9F6BE009AEAAA0096E9A70092E8A3008EE79F0089E59B0086E4
          980081E3940053D86C0039D2550038D1540037D0530037D0520039D2550053B4
          6300B1EAC0007BE79B00A6F1B8009FEDB0009BECAD0097EBA90093EAA6008FE9
          A2008BE89E0087E79B005DDE77003ED75D003DD65C003CD55B0033C35000A9DA
          B100FF00FF0061DA8300A5F6BD00A8F2BB00A4F0B600A0F0B3009CEFAF0098EE
          AC0094ECA90090EBA5008DEAA20080E8970060E17C0054DE75004DBB6300FF00
          FF00FF00FF00E5F9EB005ADD8000A8F8C100AFF7C300A9F3BC00A5F2B900A1F2
          B5009DF1B2009AF0AF0096EFAB0093EFA90088EDA40048C36400E3F4E600FF00
          FF00FF00FF00FF00FF00E5F9EB0064DF880081ECA200B7FDCE00B1FAC700ACF8
          C200A8F7BF00A6F8BE00A6FAC00070E18F0058CA7300E3F5E700FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00B4EFC50071E292005FE1850076E8
          980073E6950059DA7D006AD68700AFE7BD00FF00FF00FF00FF00FF00FF00FF00
          FF00}
        Stretch = True
        Transparent = True
      end
      object DBText1: TDBText
        Left = 17
        Top = 13
        Width = 38
        Height = 17
        Alignment = taCenter
        DataField = 'Pagina'
        DataSource = dtsFolhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = DBText1Click
      end
      object imgFolhaSelecionada: TImage
        Left = 26
        Top = 36
        Width = 20
        Height = 20
        Center = True
        Picture.Data = {
          07544269746D617036040000424D360400000000000036000000280000001000
          0000100000000100200000000000000400000000000000000000000000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00A3A5E000464EC5000619C300041F
          D300031ED2000416C0004349C000A1A2DC00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00E1E2F5003C45C6000E2DDD00093BFF000336FF000133
          FF000033FF000033FF000033FF000322D800353CBD00E0E0F400FF00FF00FF00
          FF00FF00FF00E1E3F6002435CB001B47F6001748FF001244FF000D3FFF00083A
          FF000336FF000033FF000033FF000033FF00012FF5001725C000E0E1F400FF00
          FF00FF00FF004451D2002854F7002656FF002051FF001B4CFF001648FF001143
          FF000C3EFF000739FF000235FF000033FF000033FF00022FF5003942C400FF00
          FF00A9AFEB004F69E7006F90FF00678AFF00557CFF00325FFF002050FF001A4C
          FF001547FF001042FF000B3DFF000638FF000134FF000033FF000728DF00A5A8
          E3005F6CDF0088A7FF007B9BFF007495FF006C8FFF006588FF003D69FF002454
          FF001F4FFF00194BFF001446FF000F41FF000A3CFF000537FF000134FF004D57
          D1004D63E4008DAAFF0088A6FF0080A0FF00799AFF007293FF00678AFF003462
          FF002858FF002353FF001E4FFF00184AFF001345FF000E40FF00093BFF00112A
          D5006A82EF0093AFFF0090ACFF008CA9FF0085A4FF007F9EFF007798FF005B82
          FF003161FF002C5CFF002757FF002253FF001D4EFF001749FF001244FF001435
          E4006E86F20099B3FF0096B1FF0092AEFF008EABFF008AA8FF0084A2FF007D9C
          FF004270FF003665FF003060FF002B5BFF002656FF002152FF001C4DFF001B3C
          E7005871F100A3BBFF009BB5FF0098B2FF0094B0FF0091ADFF008DAAFF0088A6
          FF006F93FF003F6EFF003A69FF003564FF002F5FFF002A5AFF002556FF00213E
          E3006C81F500B0C7FF00A1B9FF009DB6FF009AB4FF0096B1FF0093AEFF008FAC
          FF008CA9FF006088FF004372FF003E6DFF003968FF003463FF003362FF005B6D
          E700B2BDFB00809AFB00AAC1FF00A3BBFF009FB8FF009CB5FF0099B3FF0095B0
          FF0092AEFF008EABFF00678EFF004775FF004271FF003D6CFF00395EF300AEB7
          F400FF00FF00647DFC00AAC0FF00AAC0FF00A5BCFF00A2BAFF009EB7FF009BB4
          FF0098B2FF0094AFFF0091ADFF0085A4FF00668DFF005B83FD00586EEE00FF00
          FF00FF00FF00E6EAFF005D79FF00ADC3FF00AFC5FF00A7BEFF00A4BBFF00A0B9
          FF009DB6FF009AB4FF0096B1FF0094B0FF008FABFE00536EF500E5E8FD00FF00
          FF00FF00FF00FF00FF00E6EAFF00667FFF00859FFF00BCD1FF00B3C9FF00ABC2
          FF00A8BFFF00A7C0FF00AAC3FF007995FE00627AFA00E5E9FD00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00B4C0FF00728AFF00627FFF007B96
          FF007995FF00607DFF007289FF00B4C0FF00FF00FF00FF00FF00FF00FF00FF00
          FF00}
        Stretch = True
        Transparent = True
      end
    end
  end
  object lbTitulo: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    AutoSize = False
    Caption = 'Livro XXXX - Descri'#231#227'o da Natureza do Livro XXXXXX'
    ParentColor = False
    Style.BorderStyle = ebsUltraFlat
    Style.Color = 4210688
    Style.Shadow = True
    Style.TextColor = clWindow
    Style.TextStyle = [fsBold]
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Height = 23
    Width = 761
    AnchorX = 381
    AnchorY = 12
  end
  object dtsFolhas: TDataSource
    DataSet = cdsFolhas
    Left = 36
    Top = 183
  end
  object cdsFolhas: TClientDataSet
    PersistDataPacket.Data = {
      540000009619E0BD010000001800000003000000000003000000540006506167
      696E610400010000000000054C6976726F040001000000000008536974756163
      616F01004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 128
    object cdsFolhasPagina: TIntegerField
      FieldName = 'Pagina'
    end
    object cdsFolhasLivro: TIntegerField
      FieldName = 'Livro'
    end
    object cdsFolhasSituacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
  end
end