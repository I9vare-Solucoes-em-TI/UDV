object frmCadBasico: TfrmCadBasico
  Left = 382
  Top = 145
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSizeToolWin
  Caption = 'Basico'
  ClientHeight = 422
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 56
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PanelBotoesBasicos: TPanel
      Left = 2
      Top = 2
      Width = 578
      Height = 52
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object PanelBasicoBotoes: TPanel
        Left = 0
        Top = 0
        Width = 385
        Height = 52
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object cxBtnPesquisar: TcxButton
          Left = 319
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecutePesquisa
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxBtnCancelar: TcxButton
          Left = 256
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecuteCancelar
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxBtnGravar: TcxButton
          Left = 193
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecuteGravar
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxBtnExcluir: TcxButton
          Left = 130
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecuteExcluir
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxBtnAlterar: TcxButton
          Left = 67
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecuteAlterar
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
          TabOrder = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxBtnIncluir: TcxButton
          Left = 4
          Top = 4
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Action = ExecuteIncluir
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          TabOrder = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object PanelBotaoFechar: TPanel
      Left = 580
      Top = 2
      Width = 78
      Height = 52
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object cxBtnFechar: TcxButton
        Left = 12
        Top = 4
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Action = ExecuteFechar
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
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 402
    Width = 660
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Panels = <
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    UseSystemFont = False
  end
  object PanelGeral: TPanel
    Left = 0
    Top = 56
    Width = 660
    Height = 346
    Align = alClient
    Color = 14807280
    ParentBackground = False
    TabOrder = 2
    object PanelData: TPanel
      Left = 1
      Top = 1
      Width = 658
      Height = 116
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Color = 14807280
      Enabled = False
      ParentBackground = False
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 61
    Top = 98
    object ExecuteIncluir: TAction
      Caption = 'Incluir'
      Hint = 'Incluir'
      ImageIndex = 0
      ShortCut = 32841
      OnExecute = ExecuteIncluirExecute
    end
    object ExecuteAlterar: TAction
      Caption = 'Alterar'
      Hint = 'Alterar'
      ImageIndex = 1
      ShortCut = 32833
      OnExecute = ExecuteAlterarExecute
    end
    object ExecuteExcluir: TAction
      Caption = 'Excluir'
      Hint = 'Excluir'
      ImageIndex = 5
      ShortCut = 32837
      OnExecute = ExecuteExcluirExecute
    end
    object ExecuteGravar: TAction
      Caption = 'Salvar'
      Hint = 'Gravar'
      ImageIndex = 6
      ShortCut = 32839
      OnExecute = ExecuteGravarExecute
    end
    object ExecuteCancelar: TAction
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 2
      ShortCut = 32835
      OnExecute = ExecuteCancelarExecute
    end
    object ExecutePesquisa: TAction
      Caption = 'Pesquisar'
      Hint = 'Pesquisar'
      ImageIndex = 3
      ShortCut = 32848
      OnExecute = ExecutePesquisaExecute
    end
    object ExecuteFechar: TAction
      Hint = 'Fechar (Esc)'
      ImageIndex = 4
      SecondaryShortCuts.Strings = (
        '')
      OnExecute = ExecuteFecharExecute
    end
  end
  object DataSetAncestral: TSQLDataSet
    DataSource = SourceAncestral
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmControles.DB
    Left = 123
    Top = 98
  end
  object ProviderAncestral: TDataSetProvider
    DataSet = DataSetAncestral
    UpdateMode = upWhereKeyOnly
    Left = 155
    Top = 98
  end
  object ClientAncestral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderAncestral'
    OnReconcileError = ClientAncestralReconcileError
    Left = 187
    Top = 98
  end
  object SourceAncestral: TDataSource
    DataSet = ClientAncestral
    Left = 219
    Top = 98
  end
end
