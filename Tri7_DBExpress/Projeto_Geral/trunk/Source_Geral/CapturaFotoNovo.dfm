object frmCapturaFotoNovo: TfrmCapturaFotoNovo
  Left = 165
  Top = 309
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Preview'
  ClientHeight = 350
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImageEnView1: TImageEnView
    Left = 0
    Top = 0
    Width = 441
    Height = 350
    Background = clBtnFace
    ParentCtl3D = False
    MouseInteract = [miMoveLayers, miResizeLayers]
    OnMediaFoundationNotify = ImageEnView1MediaFoundationNotify
    EnableInteractionHints = True
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 441
    Top = 0
    Width = 369
    Height = 350
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 15
      Top = 290
      Width = 16
      Height = 13
      Caption = '----'
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 0
      Width = 354
      Height = 215
      Caption = '  Fonte: '
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 20
        Width = 86
        Height = 13
        Caption = 'Entrada de v'#237'deo:'
      end
      object Label4: TLabel
        Left = 9
        Top = 197
        Width = 16
        Height = 13
        Caption = '----'
      end
      object Label5: TLabel
        Left = 9
        Top = 85
        Width = 106
        Height = 13
        Caption = 'Formatos suportados:'
      end
      object SpeedButton1: TSpeedButton
        Left = 9
        Top = 171
        Width = 337
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Capturar'
        Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          080000000000900100000000000000000000000100000000000000000000EBEB
          EB00999999005A5A5A003F3F3F00CCCCCC002E2E2E00FFFFFF0079797900B3B3
          B3001F1F1F00DCDCDC00F0F0F00018181800666666004C4C4C008D8D8D001414
          1400BFBFBF00D7D7D7009E9E9E00F7F7F7004A4A4A00363636002A2A2A007D7D
          7D006F6F6F00E6E6E60047474700505050005E5E5E000F0F0F0087878700E4E4
          E40024242400A7A7A700FBFBFB00EDEDED00D0D0D000F3F3F3009D9D9D00B8B8
          B800C5C5C500444444000A0A0A00E2E2E2001A1A1A0033333300DBDBDB00A2A2
          A200B7B7B700080808007B7B7B00C2C2C2007373730054545400636363003838
          38004E4E4E00EFEFEF00F5F5F500F9F9F90016161600E9E9E900666666005C5C
          5C00404040007A7A7A00202020008F8F8F008080800048484800525252006060
          6000D3D3D3001C1C1C0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          072A3435210125250101010101253010280707241418443938371D1D3A0F0F0F
          0F1D173E2202071B0D0F32190217110D0D0D0D0D0D2E3349302B07151A17031D
          1E422F17171717171739170F0E20070724013F013F250C0C0C2715153D270130
          451207070707070707070707070707012602030A223207070707070707070701
          05310E061F334B0E2D0707070707073C053136040D2C3E1C4609130707070707
          24231E162F22181646290B270707070707070707242837392F084A1507070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          07070707070707070707}
        OnClick = SpeedButton1Click
      end
      object cbxManterConfiguracao: TcxCheckBox
        Left = 9
        Top = 62
        Caption = 'Manter Configura'#231#245'es'
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        OnClick = cbxManterConfiguracaoClick
        Width = 131
      end
      object ListBox1: TcxListBox
        Left = 9
        Top = 102
        Width = 337
        Height = 65
        ItemHeight = 13
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
      end
      object ComboBox1: TcxComboBox
        Left = 9
        Top = 37
        ParentFont = False
        Properties.OnChange = ComboBox1PropertiesChange
        Style.BorderStyle = ebsUltraFlat
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 337
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 221
      Width = 354
      Height = 67
      Caption = '  Exibi'#231#227'o: '
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 22
        Width = 30
        Height = 13
        Caption = 'Zoom:'
      end
      object TrackBar1: TcxTrackBar
        Left = 44
        Top = 15
        ParentFont = False
        Position = 200
        Properties.Max = 400
        Properties.OnChange = TrackBar1PropertiesChange
        Style.BorderStyle = ebsNone
        Style.HotTrack = False
        Style.Shadow = False
        Style.TextStyle = []
        TabOrder = 0
        Height = 42
        Width = 303
      end
    end
    object cxButton1: TcxButton
      Left = 137
      Top = 290
      Width = 110
      Height = 22
      Caption = 'Salvar '
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000021222100E8EA
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
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = cxButton1Click
    end
    object btnCancelar: TcxButton
      Left = 250
      Top = 290
      Width = 110
      Height = 22
      Caption = 'Cancelar'
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
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 616
    Top = 120
  end
end
