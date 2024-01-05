object frmSincronizar: TfrmSincronizar
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Sincroniza'#231#227'o'
  ClientHeight = 500
  ClientWidth = 838
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    Caption = '`'
    Color = clWindow
    TabOrder = 0
    object PanelBotaoFechar: TPanel
      Left = 728
      Top = 0
      Width = 110
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 43
        Top = 4
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
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 54
      Height = 53
      Align = alLeft
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 1
      object imgReceber: TImage
        Left = 2
        Top = 3
        Width = 52
        Height = 50
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000030
          0000003008060000005702F9870000000467414D410000B18F0BFC6105000000
          1974455874536F6674776172650041646F626520496D616765526561647971C9
          653C0000069C494441546843D599CB6F165518C67147628416E2C28D1B172E5C
          60D0206808628C315EF684C4F8179898E8C28DA8D04437BD261A2DB14D812EDA
          04762C68F90B8422B4D0A64921944B2FB494424B2FABE3F99D7ECFF8F67CE79B
          CEB4D1A424BF9C9933EFE579CE996F18861DCEB96D4D72723B919CDC4E6407DD
          DDDD6EAB9C3D7BD6757575053A3B3B5D4747876B6F6F0FE767CE9C71E7CE9D4B
          E689547E5B5BDB092B38263BA0C0ECECAC7BFCF8711805E7737373EB604ED8D8
          999919373636E6868686DC952B578210EA5EBC78D1DDB973C74D4E4E6635CBE4
          B7B6B6FE60455BB2031910B6896DC4716CC83235351544DCBC79D35DBD7A3508
          B87CF9B23B7FFEBC1B1E1E76F7EFDF0F4253B9502BDF9BF8D10A17D9813520D1
          2ACA314DA7A7A7C375E69E3C79E2E6E7E7333857EC83070F8208045397B9FEFE
          7ED7DBDB1B561713D4299BDFD2D2F293150F55060816B6A8CC49BCB022140B0F
          1F3E0CB70D75171717DDA3478F5C5F5F5F3071EBD6AD2032365124BFB9B9F964
          AE0199B042559891464F9F3E5DD758738A65A40E22A8AB187E03972E5D723D3D
          3D6E646424DC2E5A8432F94D4D4DA792062452456254886629745D3188A06E8A
          0B172EB8BB77EF865E9BC9D7D3699D0189B78500F16A5216AD24B703F7343F4C
          9E2E3C52474747C3F5549EC8CB4F1A88C5CB406CE2D9B36781F838053BCBF6DF
          BE7D3BDCFF3C2279E623887B9B98CDE45719D06D42921DEDBCC45AD1B5E6182D
          AC26B70D4F2219E077A0F8B2F9350D48ACD07DAA060B0B0B01DB447316C52B06
          E8C163947E3CEB5959FA6D26BFCA402C3E4EA6288FB4B8893DE7BA8D8945A807
          FD0607078301D52E9B9F34A04025425CDC526B1EF244D0EFC68D1B6E6262225C
          DB4C7E950105000912A7B116CF9F3FCF485DB7CD05FDAE5FBF1E0CECFBEAA540
          D9FC2A03F10EE40997E0A5A5A58C549C56D0360719E0478CF83F87BE0C6399FC
          2A03FA1193101B9060BB4A32601B29C7C6498015423F6E211938FAEB5E777AF0
          8BCC4491FC2A0388D72E20C48A91D8785C5E5E0E316A006A8C98A21C69DBEBDE
          6FDDE34EFFFDAF09212D850D58131448898695959530321F8B270E21BF0F1C77
          7F048E99E3E355C7871BF754A80FE729133280BE0D77C01A0044221661081732
          609B710E8878EF97FADAFC5C2171EDB7BF8E857CD5D62EE41AE0370004D9D594
          28ADBC9001C6D5D5D5702CF13270F054BD3B74B2AE32D6FBB1CE1DF21CF4C787
          98E3B802719CAF8DF5EB76C1EE006CB80376F56B196037B8C688016294270307
          BEAFF3ECAE608E4F54CED78D6BBC73A26EDDEA8B5C03FEF534BC3481DD056D1D
          50D016258658E230C0C8FB0A8B403C228AF2F677BBDC5B1E46CEC9A79E15AD3B
          04D05B6540AFD30468272820C132608DE83AB791CE53508B9AD4A607FD788CF2
          AA8CE0FDDFEE72FBBF59135F343F69400E6582646B402370EB68148AB52B2801
          5A4509E05D487F0FBCF9F5DA4E94C9AF6900E1760740B750CA80C50A20DFAE1A
          2322817EBC16CB0014C967DCD00068F5E59C82A006A055B78D41B112405DFDBE
          10AAD7060CF0A523AE9B97BFA101900189D7B176C236515399508CCCDB550384
          DBD7065EA7892D9A2F9206AC4B99006B48C2D544C788294AFCDA405DBB28D405
          DB5F9A749C6B4026942C38B7A2D58C11215B7D6D9070C094FAC726720DF01C4F
          ED020541826D334044EA9520A3C06B0375D44706245EA00B7D49037C3E4C1990
          70D0CADB468080ADBE36A89684C706241E8D49035C00026580043E7D681E93FA
          382B7332B095D7863CD156BCFA17DA01403CDF31795E73CC3F01F9DBD39A0044
          14257E6D40A015AE6369408F569EBE3C7A93061029A15A71CEEFDDBB17849388
          780C1123A35A2DA13935A79640B07D6DA0765C232F3F770778262314D1DA0D44
          F31D46061881EB5A191AC5E89A6D0A88D66B039F093190AA512B5FD4DC014C20
          54BB40B0CE8173E6D5C0368AE7956373110EF41B1818080654B348BEC6A40184
          0A0502C528AE469CC72BA5180B35AC79C19C0C8C8F8F6735CBE65719D0458B44
          833DAE251A64DC3664648E63769A7EDC4218B075CBE4D734408092941817B730
          2F33765EF9AA2B2480AFCC7CAC257633F9550674510640055245352F03F1757B
          6E9BF33B4B19289B9F34A0204625DAF3143C5A11C2D34A0F010B318CD411F4BB
          76ED5AB885782C6F263F18F07F767A5E64E2FFA6A1A1C1353636F25FA8C9EB1B
          51D1BE66C0B3DBF3B2E715CFAB9ED73CAF7BDEF0ECF3ECF71CF0BCEB39EC39E2
          F9C0F3A1E723CFC79E4F3C9F7A3EF37C1EC11CD78821961C72A9412D6A529B1E
          F4A227BDD1801634A10D8D6845F3CEEC16DAAE2427FF4BFC9F1744EA7A39DC8E
          7F00515D94493ACCFA680000000049454E44AE426082}
        Transparent = True
      end
    end
    object lblInformacaoLancamento: TcxLabel
      Left = 54
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = ' Sincronizar Associados do Reuni'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 53
      Width = 674
      AnchorX = 391
      AnchorY = 27
    end
    object tabExportar: TcxButton
      Left = 706
      Top = 4
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Hint = 'Exportar Dados Excel'
      Caption = 'Exportar'
      Colors.Default = clWhite
      Enabled = False
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
        C5C5C56464643A3A3A3B3B3B3A3A3A3939393838383838383838383838383838
        38383838383838383838383838383838454545838383FFFFFFFFFFFF9A9A9A46
        4646B6B6B6BCBCBCB7B7B7B1B1B1ADADADAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE
        AEAEAEAEAEAEAEAEAEAEAEAE787878464646FFFFFFFFFFFF8A8A8A4B4B4BBBBB
        BB8F8F8FA6A6A6ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC1C1C1373737FFFFFFFFFFFF9696962F2F2F3737371F1F1F
        292929979797FEFEFEFBFBFBF9F9F9F5F5F5EDEDEDE9E9E9E7E7E7E7E7E7E6E6
        E6FFFFFFB1B1B13F3F3FFFFFFFF9F9F98686861F1F1F2424242E2E2E1F1F1F5A
        5A5AD3D3D3C9C9C9C7C7C7D2D2D2E3E3E3E9E9E9E7E7E7E7E7E7E4E4E4FFFFFF
        B4B4B4424242FAFAFAB8B8B84E4E4E2424243636363B3B3B2828282828283535
        35333333333333535353B0B0B0EDEDEDE7E7E7E6E6E6E3E3E3FFFFFFB7B7B745
        4545ADADAD5A5A5A2F2F2F3C3C3C4343434141413C3C3C3333332F2F2F2F2F2F
        2E2E2E2B2B2B7C7C7CF0F0F0E7E7E7E4E4E4E1E1E1FFFFFFB9B9B94949495656
        564D4D4D5656564747474949494949494848484747474747474949494444442A
        2A2A6E6E6EEFEFEFE7E7E7E3E3E3E1E1E1FFFFFFBCBCBC4D4D4D5050505E5E5E
        8282826262624D4D4D4F4F4F6464646F6F6F6E6E6E7070706A6A6A3737377070
        70EDEDEDE6E6E6E1E1E1E0E0E0FFFFFFBFBFBF5151519A9A9A5555555F5F5F8D
        8D8D6464645959597F7F7F9797978D8D8D9292928A8A8A464646787878EAEAEA
        E4E4E4E0E0E0DEDEDEFEFEFEC1C1C1565656EFEFEFA7A7A75555555E5E5E9A9A
        9A6F6F6F4D4D4D4747474A4A4A4949494A4A4A5A5A5AA8A8A8E6E6E6E1E1E1DE
        DEDEDDDDDDFCFCFCC4C4C45A5A5AFFFFFFF0F0F08888883F3F3F686868989898
        4E4E4E5A5A5AA6A6A69E9E9E9E9E9EB9B9B9D5D5D5DEDEDEDDDDDDDBDBDBD8D8
        D8FBFBFBC7C7C75F5F5FFFFFFFFFFFFFA8A8A84B4B4B5555556767675656569B
        9B9BF5F5F5EFEFEFECECECE7E7E7E9E9E9EFEFEFF0F0F0EFEFEFEDEDEDFFFFFF
        D2D2D2606060FFFFFFFFFFFFA7A7A7727272A2A2A26F6F6F818181C2C2C2E3E3
        E3E0E0E0DEDEDEDBDBDBEDEDEDFBFBFBF0F0F0F2F2F2FEFEFEE7E7E7A2A2A271
        7171FFFFFFFFFFFFA8A8A88A8A8AF5F5F5E7E7E7DBDBDBDEDEDEDEDEDEDDDDDD
        DDDDDDDADADAEFEFEFF0F0F0D5D5D5DDDDDDDBDBDB9292926D6D6DAAAAAAFFFF
        FFFFFFFFAAAAAA8F8F8FFBFBFBEFEFEFE0E0E0DEDEDEDDDDDDDBDBDBDBDBDBD8
        D8D8EDEDEDF3F3F3DDDDDDDADADA909090727272B4B4B4F1F1F1FFFFFFFFFFFF
        ADADAD929292F6F6F6E6E6E6D8D8D8DADADADADADAD8D8D8D6D6D6D5D5D5ECEC
        ECFEFEFEDDDDDD9494947A7A7AB7B7B7F2F2F2FFFFFFFFFFFFFFFFFFABABAB98
        9898FFFFFFFEFEFEF6F6F6F6F6F6F6F6F6F6F6F6F5F5F5F5F5F5FFFFFFF0F0F0
        9D9D9D797979BABABAF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFBBBBBB8D8D8DD2D2
        D2D6D6D6D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5B0B0B07C7C7CBB
        BBBBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D99B9B9B818181828282
        828282828282828282828282828282828282828282868686B4B4B4F2F2F2FFFF
        FFFFFFFFFFFFFFFFFFFF}
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
      OnClick = tabExportarClick
    end
  end
  object pgcSincronizar: TcxPageControl
    Left = 0
    Top = 53
    Width = 838
    Height = 447
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabSincronizacao
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OnChange = pgcSincronizarChange
    ClientRectBottom = 447
    ClientRectRight = 838
    ClientRectTop = 24
    object tabSincronizacao: TcxTabSheet
      Caption = 'Realizar Sincroniza'#231#227'o'
      ImageIndex = 1
      object pnlSincronizar: TPanel
        Left = 0
        Top = 0
        Width = 838
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 14807280
        ParentBackground = False
        TabOrder = 0
        object btnSincronizar: TcxButton
          Left = 6
          Top = 10
          Width = 106
          Height = 22
          Cursor = crHandPoint
          Caption = 'Sincronizar Reuni'
          Colors.Default = clBlue
          Colors.Normal = 15513994
          Colors.Hot = 8421440
          Colors.Pressed = clGreen
          Colors.Disabled = clBtnFace
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Black'
          TabOrder = 0
          OnClick = btnSincronizarClick
        end
        object lblSincronizar: TcxLabel
          Left = 339
          Top = 10
          Caption = 'Sincronizando, aguarde!!!'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = 4210688
          Style.IsFontAssigned = True
          Transparent = True
          Visible = False
        end
        object btnConfirma: TcxButton
          Left = 116
          Top = 11
          Width = 106
          Height = 22
          Caption = '&Confirmar'
          Colors.Default = clWhite
          Enabled = False
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
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnConfirmaClick
        end
        object btnCancelar: TcxButton
          Left = 226
          Top = 11
          Width = 106
          Height = 22
          Caption = '&Cancelar'
          Colors.Default = clWhite
          Enabled = False
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
      object cxGridSincroniza: TcxGrid
        Left = 0
        Top = 60
        Width = 838
        Height = 363
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        ExplicitTop = 62
        ExplicitHeight = 361
        object cxGridDBSincronizar: TcxGridDBTableView
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
          DataController.DataSource = dtsVerificar
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'SINCRONIZADO_NOVO'
              Column = cxGridDBColumn1
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'NOME'
              Column = cxGridDBColumn1
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
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Column = cxGridDBSincronizarObservacao
          Preview.Visible = True
          Styles.Group = dtmControles.cxStyle12
          Styles.GroupByBox = dtmControles.cxStyle7
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Associado'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 390
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Grau'
            DataBinding.FieldName = 'GRAU'
            RepositoryItem = dtmLookup.Combo_Grau
            Options.Editing = False
            Options.Focusing = False
            Width = 114
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Situa'#231#227'o Anterior'
            DataBinding.FieldName = 'SINCRONIZADO_SITUACAO_OLD'
            RepositoryItem = dtmLookup.Combo_Situacao
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle39
            Width = 166
          end
          object cxGridDBSincronizarColumn1: TcxGridDBColumn
            Caption = 'Situa'#231#227'o Nova'
            DataBinding.FieldName = 'SINCRONIZADO_SITUACAO_NEW'
            RepositoryItem = dtmLookup.Combo_Situacao
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle39
            Width = 158
          end
          object cxGridDBSincronizarColumn2: TcxGridDBColumn
            Caption = 'Sincroniza'#231#227'o'
            DataBinding.FieldName = 'SINCRONIZADO_NOVO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'Novo(s) Associado(s)'
                ImageIndex = 11
                Value = 'S'
              end
              item
                Description = 'Associado(s) com Altera'#231#227'o'
                ImageIndex = 25
                Value = 'N'
              end
              item
                Description = 'Pend'#234'ncia(s)'
                ImageIndex = 56
                Value = 'P'
              end>
            Visible = False
            GroupIndex = 0
            Options.Editing = False
            Options.Focusing = False
            SortIndex = 0
            SortOrder = soDescending
          end
          object cxGridDBSincronizarObservacao: TcxGridDBColumn
            DataBinding.FieldName = 'SINCRONIZADO_OBSERVACAO'
            Options.Editing = False
            Options.Focusing = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBSincronizar
        end
      end
      object cxProgress: TcxProgressBar
        Left = 0
        Top = 41
        Align = alTop
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 2
        Width = 838
      end
    end
    object tabSincronizacaoAnterior: TcxTabSheet
      Caption = 'Sincroniza'#231#227'o Anterior'
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 0
        Top = 41
        Width = 838
        Height = 382
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        object cxGridDBSincronizacaoAnterior: TcxGridDBTableView
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
          DataController.DataSource = dtsSincronizacaoAnterior
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'SINCRONIZADO_NOVO'
              Column = cxGridDBColumn4
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'NOME'
              Column = cxGridDBColumn4
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
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Column = cxGridDBSincronizacaoAnteriorObservacao
          Preview.Visible = True
          Styles.GroupByBox = dtmControles.cxStyle7
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Associado'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 390
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Grau'
            DataBinding.FieldName = 'GRAU'
            RepositoryItem = dtmLookup.Combo_Grau
            Options.Editing = False
            Options.Focusing = False
            Width = 114
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Situa'#231#227'o Anterior'
            DataBinding.FieldName = 'SINCRONIZADO_SITUACAO_OLD'
            RepositoryItem = dtmLookup.Combo_Situacao
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle39
            Width = 166
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Situa'#231#227'o Nova'
            DataBinding.FieldName = 'SINCRONIZADO_SITUACAO_NEW'
            RepositoryItem = dtmLookup.Combo_Situacao
            Styles.Header = dtmControles.cxStyle39
            Width = 158
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Sincroniza'#231#227'o'
            DataBinding.FieldName = 'SINCRONIZADO_NOVO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                Description = 'Novo(s) Associado(s)'
                ImageIndex = 11
                Value = 'S'
              end
              item
                Description = 'Associado(s) Atualizado(s)'
                ImageIndex = 25
                Value = 'N'
              end>
            Visible = False
            GroupIndex = 0
          end
          object cxGridDBSincronizacaoAnteriorObservacao: TcxGridDBColumn
            DataBinding.FieldName = 'SINCRONIZADO_OBSERVACAO'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBSincronizacaoAnterior
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 838
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 14807280
        ParentBackground = False
        TabOrder = 1
        object lblSincronizaData: TcxLabel
          Left = 11
          Top = 10
          Caption = 'Data Sincroniza'#231#227'o:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = 16384
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lblSincronizaNomeArquivo: TcxLabel
          Left = 291
          Top = 10
          Caption = 'Nome Arquivo:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = 16384
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
    end
  end
  object dtsXmlAtualizador: TDataSource
    DataSet = sqlXmlAtualizador
    Left = 163
    Top = 239
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'XLS; XLSX'
    Filter = '*.xls;*;xlsx'
    Title = ']'
    Left = 48
    Top = 177
  end
  object sqlVerificar: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM T_PESSOA'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER B' +
        'Y NOME')
    Left = 308
    Top = 164
    ParamData = <
      item
        Name = 'CEDENTE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlVerificarNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlVerificarPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlVerificarGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object sqlVerificarSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlVerificarCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object sqlVerificarRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object sqlVerificarEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 90
    end
    object sqlVerificarSINCRONIZADO_SITUACAO_OLD: TStringField
      FieldName = 'SINCRONIZADO_SITUACAO_OLD'
      Size = 1
    end
    object sqlVerificarSINCRONIZADO_DATA: TSQLTimeStampField
      FieldName = 'SINCRONIZADO_DATA'
    end
    object sqlVerificarSINCRONIZA_REUNI_ID: TBCDField
      FieldName = 'SINCRONIZA_REUNI_ID'
      Precision = 20
      Size = 2
    end
    object sqlVerificarSINCRONIZADO_SITUACAO_NEW: TStringField
      FieldName = 'SINCRONIZADO_SITUACAO_NEW'
      Size = 1
    end
    object sqlVerificarSINCRONIZADO_NOVO: TStringField
      FieldName = 'SINCRONIZADO_NOVO'
      Size = 1
    end
    object sqlVerificarCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlVerificarSINCRONIZADO_OBSERVACAO: TStringField
      FieldName = 'SINCRONIZADO_OBSERVACAO'
      Size = 120
    end
    object sqlVerificarSINCRONIZADO_ANOMES_SITUACAO: TStringField
      FieldName = 'SINCRONIZADO_ANOMES_SITUACAO'
      Size = 10
    end
    object sqlVerificarDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object sqlVerificarBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
    object sqlVerificarEMAIL_TERCEIRO: TStringField
      FieldName = 'EMAIL_TERCEIRO'
      Size = 1
    end
    object sqlVerificarPESSOA_GRUPO_ID: TBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlVerificarPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object sqlVerificarEMAIL_GRUPO_PADRAO: TStringField
      FieldName = 'EMAIL_GRUPO_PADRAO'
      Size = 1
    end
    object sqlVerificarPESSOA_TERCEIRO_ID: TBCDField
      FieldName = 'PESSOA_TERCEIRO_ID'
      Precision = 20
      Size = 2
    end
    object sqlVerificarFATURA_TIPO: TStringField
      FieldName = 'FATURA_TIPO'
      Size = 1
    end
  end
  object dtsVerificar: TDataSource
    DataSet = sqlVerificar
    Left = 307
    Top = 219
  end
  object sqlSincronizacaoAnterior: TI9Query
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM T_PESSOA'#13#10'WHERE SINCRONIZA_REUNI_ID = :SINCRONIZA' +
        '_REUNI_ID'#13#10'  AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY NOME')
    Left = 536
    Top = 244
    ParamData = <
      item
        Name = 'SINCRONIZA_REUNI_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'CEDENTE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlSincronizacaoAnteriorNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlSincronizacaoAnteriorPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlSincronizacaoAnteriorGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object sqlSincronizacaoAnteriorSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlSincronizacaoAnteriorCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object sqlSincronizacaoAnteriorRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object sqlSincronizacaoAnteriorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 90
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_SITUACAO_OLD: TStringField
      FieldName = 'SINCRONIZADO_SITUACAO_OLD'
      Size = 1
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_DATA: TSQLTimeStampField
      FieldName = 'SINCRONIZADO_DATA'
    end
    object sqlSincronizacaoAnteriorSINCRONIZA_REUNI_ID: TBCDField
      FieldName = 'SINCRONIZA_REUNI_ID'
      Precision = 20
      Size = 2
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_SITUACAO_NEW: TStringField
      FieldName = 'SINCRONIZADO_SITUACAO_NEW'
      Size = 1
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_NOVO: TStringField
      FieldName = 'SINCRONIZADO_NOVO'
      Size = 1
    end
    object sqlSincronizacaoAnteriorCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_OBSERVACAO: TStringField
      FieldName = 'SINCRONIZADO_OBSERVACAO'
      Size = 120
    end
    object sqlSincronizacaoAnteriorSINCRONIZADO_ANOMES_SITUACAO: TStringField
      FieldName = 'SINCRONIZADO_ANOMES_SITUACAO'
      Size = 10
    end
  end
  object dtsSincronizacaoAnterior: TDataSource
    DataSet = sqlSincronizacaoAnterior
    Left = 535
    Top = 299
  end
  object sqlXmlAtualizador: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 240
      end
      item
        Name = 'CHAVE_GRAU_ATUAL'
        DataType = ftFMTBcd
        Precision = 32
        Size = 12
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 164
    Top = 192
    object sqlXmlAtualizadorNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlXmlAtualizadorCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object sqlXmlAtualizadorDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object sqlXmlAtualizadorSITUACAO: TStringField
      DisplayWidth = 60
      FieldName = 'SITUACAO'
      Size = 60
    end
    object sqlXmlAtualizadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 240
    end
    object sqlXmlAtualizadorCHAVE_GRAU_ATUAL: TFMTBCDField
      FieldName = 'CHAVE_GRAU_ATUAL'
      Size = 12
    end
  end
end
