object frmVisualizarSROCorreios: TfrmVisualizarSROCorreios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Visualizar SRO Correios'
  ClientHeight = 510
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object wbrRastreamento: TWebBrowser
    Left = 0
    Top = 35
    Width = 710
    Height = 475
    Align = alClient
    TabOrder = 0
    OnDocumentComplete = wbrRastreamentoDocumentComplete
    ExplicitWidth = 599
    ExplicitHeight = 305
    ControlData = {
      4C00000061490000183100000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Color = 14807280
    ParentBackground = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 590
      Top = 0
      Width = 120
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object btnFechar: TcxButton
        Left = 9
        Top = 5
        Width = 106
        Height = 24
        Cursor = crArrow
        Caption = 'Sair'
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
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnFecharClick
      end
    end
    object btnImprimirApontamento: TcxButton
      Left = 8
      Top = 5
      Width = 106
      Height = 24
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
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnImprimirApontamentoClick
    end
  end
  object pnlEntrada: TPanel
    Left = 8
    Top = 232
    Width = 694
    Height = 56
    BevelOuter = bvNone
    Caption = 'Carregando Aguarde!'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Image1: TImage
      Left = 184
      Top = 4
      Width = 48
      Height = 48
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003000
        00003008060000005702F987000000097048597300000B1300000B1301009A9C
        180000000467414D410000B18E7CFB519300000E234944415478DADD5A0B705C
        55DDFFEDFBEE33BBD9BC5F4D9A34491F4993160651C736C2C743186C45B42833
        14790CE3A7923A1FCF0FA5A23C4425E9E7C8F7F96C456080A1A454452B9D366D
        29B4686D28B45F689A6437EF64937D65DFBB77AFFF7377EF3E922549233AA367
        E6E4DCDC3DF7DCDFEFFF3E6757260802FE959BECDF86804C265BF6229D27F916
        1A36D34A9B683D765DCD96656B4BF211AF011B0D3D747D84C6EE8736697A96FB
        CE14EEE51220D0661AB653BF87D6A8562B800A930C85BAC4987E536208D378DA
        1987C72FC0E98D231A13C9112161178D7B1EB942EBFEA71060C0E9897602768F
        5A21986B2D326C2865C0177E3E1007CE86216A842EE12522F68918A69C3C23E3
        4E12E9FCEE55FA2511591681A74FC4B6D0B05BA380B9B5442E02A7EB25352F0F
        9C0B25141217D244C251014344646422CA88D88438763C7EAD61DF474EE0476F
        C73A68686712BFA6560E8D7269C0A5E68C250908D9247821711D2193EAED0F63
        C61563E03ABF7F9D69C74742E0876F4599AD1FA6592DD7D62AB0B66879CE6E27
        F3B18513E08524E8789208EB7C3C31065D51FCA52FC40076D3BCAD4FDF9097D3
        A49644E0A9E35133DD3D4C0EDAB26D9D0245FAE547AA4192FE40D20724F39188
        F019E33556C0EDE7F193E37E0422028B586DBBB65AE691581281EFBF19394C36
        BEF9E626E5DF059EB5F7FDC05824693A995AC8005FAA013E6E4ECC1FF5F0F8F1
        311F0251A1FBC79FB3B45D3481278E86459BFFCA06D5DF0D9EB5935E60263AC7
        8933CCC844C1A02D1F50C9D3CF8C1089270E7AD8439DCFDC64CDF28905093C7E
        24CCA24DD7750D4A3417CB17C3B668F39003BF453822F1B4F4850CF07914103E
        3D07BCD44E90E3EC79C7C7E66FFDD9B6825474FA5002DFEB0E31259EAEB7CAAB
        6F5AA7BA68B02E971F5E6F087E7F183CF3CC8CE6D368E1D21AE0576952A6A425
        D0D71602EA05E4F4CC9B5E9C1E8ED8E282D0FAAB2F17B91724F0E8A1E04E4E29
        7BE4EB976BC05D44A864C0A7A666C56BA351475D0BB53A2D009EE7313BEBC7CC
        8C0FD34A2D86F51651034A7AEDCD650BAF4DCE8CFB5E9B61E37776DF52B4F343
        09EC3C18304386C186129579DB9AA5A16752B6DB67100C465158688656CB6174
        D40387C39F301F85060AAD068D15069418E4343F8AE1E1698C430DBBC18A3A2A
        3D2EB32CAC01D6F69DF1A3EB5D1F656CD4FCE6D612774E02DF7E23D04E043A62
        051CEEA893A146BFF0A2A1501403030E02AD81C592079BCD85BEBE6904152A9C
        371462426D4404F294C35E5F0EDC50415257C6D1DF3F81615E852BD758A150A4
        D17BC9D12729DC4E52D87553D4BABE2CAD851D7B1DF087E33B9EBFADB4332781
        870FF807794E59CD9BD428A09076EFEAC5C1E7E519E85915DE7EDB8E40208281
        BC12F41B8B52CE5A66020A4910465A6F8694F21FF971341804180C32BCFBEE30
        A28C6075251C04DA484A2FA479471D94B92389E4F6854AA0D19478E7FF1DF3E0
        485FC0F6E2ED6535F308FCF7013F2B834F07CC5AC8281C2849285795005796CC
        071F89C4D0FBC104ACF979F49F02070FF6615650E06C492DFCE4A8AC359263D6
        525262EBF0C94C1BA3AE226A5768A2309994E4337E0C0D4DC2586C46735D416A
        7D7B00E871516825176A2B4ABFD74671F8FE2E07134EEBCB7794F5641178F00F
        BE764126EBF0E6EBC59732AD32077B682D6051671338776E8C1C544DA6A3C31B
        6F9C8753A6C199B27AF00A05AC24ED6622AD5367675AD6198128F5CDAA3095DC
        72518BC3C31EF87C5E6CDAD4B0A8BF05A920BCFBB971F8C88CF6DE55DE9945E0
        FED767BBC22AE5163F450F91802C213D664AD7901DAE25616B29D98C8C382992
        045059598C3FFEB117EE008FB72B9B10572A504AAA5E43E0A58C92996D63492D
        30029F5206516751888E3F36E683D339838D1BAB909F6F5894C4930766707230
        B0AFEBEECAAD5904EEFD9D77D0C769AA833A8D287951034922ACEB499D9BF2A3
        D0D96D58B5AA02A74E8D91F4DC3851BA9ACC468755A4EA1253023C8BC8D24E2C
        45209E20C1C6EB553E54E6ABE07687285A056874A1BEBE003535458B1278F1CF
        1EBCF067AF6DFF572B6BB2087C73BF479836E8C1AB94291392B4204F9268894C
        A1850B51C4B188A6D3672A437F5E29CA290C969B13F318F82C0D3012F1B40971
        54F06F5179515EAEA748E422F389C2E371A2961CA6B1B16C5102EF8D86F060D7
        247EF7B515B22C02EDFBDCC294DE80985A99B27F8984347ED6D78BF5AB2BD1D3
        33818191591C2C6E82918A98AAFC04F84C02D2514166B9CC34D0280BE1727580
        B468C6F1E3A362426204D690EDAD5A55B22402F7EF9DC4EBDF9843E0EBAFBA84
        09BD11D11C1A606349DC8FAB63C358B7AE16AFBE7A0667F5247D732956B03240
        91982F994F4A03C8AE3615F4AECF295D445845F3047CF0815324E07239B07973
        238A8A4C8B12383312C2BDAF8CE3407B4D3681FF7CC5298CEA4D2281791AA0BE
        3E3281CDC63085BF3C1C3DDA8F7D962618AC6A90CF8B9FCB99A92D42E012B91F
        972A7C686A2AC08913A3943762884623A48119DCF8F9CB28B22D9EFD1304C670
        F09B2BB309DCFDF28C30AC3321A252E534A196D018AE29E0290728F0DE7BE3F8
        4DC14614E7A73594CB8432B78F564A595F56CFA0AC4C4FA0790AC5D3E41B0215
        7D5EB8390EF597AD45059515BD5476F752E5DA4A6B7F32874FBF3712C40344E0
        D07FD56613B8EBC569C1A6CB439808E4B2FFABC9FE371653885572D8DFE3C1A1
        C27AE8B569A22902C82090246194F1B84DE3804527273BB7A0BBDB4E82E0C53A
        CAED9EC25F2BD6C3A935CFDB9DDD594721B7783E8187F68EE2C87D75D904EE78
        C13138A9D6574F73BA9C045A8323B8CE1A213BB5E2B5EE21BC5CD404A6F14C0D
        48D297B6166CE93C02FF450D495E15C3A59796E0C811BB183E59640A04663126
        53E254D58694A64402C9A8C5916F3D4EF541219726F0D249275E3C39633BF6C0
        AAEC307ADB73535D1EA5668B5D9B978EFF193EB08E4CE80AF91456AFAEC1F9F3
        0E3C16AC4240A14ECDC93421A995CAA3B84B37059D42404B4B91683683836ED1
        7113B63F8D532B2EC18CCE92B5C197A21623F1701325C7BCF49A3FF8FD184E0E
        F8F6BDF5507D7622BBF5D9C9F618641D670C45F37C8001CB8B87F0F9E9770848
        0339AC1CAF5D88E0D77C798A6026019D2C8E366E1657731EE8290336365A29F1
        8D53D69D15C133D3F178A6D067AD415F615DD6EE6CAE16BE3587C0577E7E812A
        527EC789871BB24B895BF64CB4B0D3BF735A2BC24AD53C0DB0FEB1D90BB84470
        50CCAE13811C752AF1BAD780B321B5F8F95A2E8C8D5C00976BFC94B078141468
        C9E47414EF87C5B24102EFF54EC36E2CC699F2E69C472C99C72C77D7530590F4
        83A1E9301E7CC9C62E5BDFF956437631C7CAE96DBF1C1B7428B5D536CE9C4540
        CAC41C62F88CE31456703C65CE2A7A462E4692EC1E270DC9505565C2F4748062
        FD8C788F7DC6F33102EFC4146724BBBF1411DA374880B37C20430356AAC59EDA
        40A50CF9DB2F0E8DE358AFC7766AE7EA9A9CFB819B7E3E2A9AD1695D31043293
        4C0D3012152A1B2E27B35839314B408258B9B2123A9D2E8B00836234AA455B67
        D5265B9F810987035436B860CFAB404F65EBBC13BA4C2D48D297C8DC54459BFE
        421EF73DDF0F19CFEF38FDE89ADC1B9A1B7F3A62A6FF07875426F388C6944560
        2DD783E72BDB70CAF93A4A2B6A69F7E5A07C60A30AD242769E278267A15192B6
        74BC1E898429D67B108CF33855B11163A6D279271373CF88E686534ECE828803
        83171C6E0A7335EF7E77ADFB4337F59F7D6668670CF247DED195A6B4D0ACEDC1
        2B2BDA602AAF4677EF0FC901F3C9444A6933E2406FAF8D00C8A0A18D8C4A45FA
        865C3495582C42520F8227D59DB5D4E27C7E1DA20A5556825B2A0121C6A378B0
        8F49FF3BEF3FB66E6722447F08811B7E32648E0BC26987425B7D8E2B44BED28D
        DFAE6CC33ADA00C9683F1B09DF80374F6EA79068105FECD13A704CF824BE6476
        203C1B48450BA3D58C37F902BCC197A6EE09C93F99492ED3FE73122086056343
        D0FABCCC7B5BCF3ED1B4F0B10A6B9FF91FDB16BADD35AA53624FC3F5682EE881
        82B22255035452B219F5B00F5F055BCF3886341C7E6F790E8FB5A6435D8F931C
        EF7D6022949D4525C9039877C498194A33C3A8DEEB42E1E4087B64EBFF3FD9BC
        F8C196D4AEEA18EC68AFBDB7FDCAAA57A05A9514994420484E49F2189E31E356
        FF617C62650B6E5F95786EF78544C79CA24E423ED78472495FEAAA700895C37D
        E2D1E2074F352FFD6891B5D071740872B473EB926F8D250944E8DF51606A1C78
        D4DF813D91766CA4CDFBFF7E2CF1DC8DDD24F920723609B4A48D4CFBCF24C2EE
        A9C97F2AC60620E7F9EEBE1FACBFB8C3DDC0516C275FDCADA17DB65C9D217936
        4E00D34460BF6F0BEE0C74A56A9FFD5700B4B9C22DC7929297CD472F200D3E97
        26A4A621F0E52362C864C9AAADFF472D4B3F5EF775630BEDFABAB4045EA1CB00
        CE46B26DAF1D787FB61AD7064EC32B98530BDEBC3281F98581F9D83335B05833
        52A22B9C1866934997D83AF074CBD2BFE0F01E042B270E733530AB2D73244F01
        26D20F8CD3725F0A1DC25BF16CAD1A93C7A0B3D125A0CCD1E494270AC787A0F3
        7998463A6D1DAD17FF1593EB005C5C19CC5CE91CC987C93649B223D3C05ED7ED
        EE673DF7992775F998D25B28CE2FF15BBE05809B9C0EB1CBF8988D6EEDB0776E
        58DE977CCE3F41B0ACA77FF83904868049B27D6F083DDB46CEB5D113ED425CB8
        27265398DD5A03A60D5684D4DC62EFCC6ACC491968EDAC9BD93AD5D8D845B73B
        87766D58FED7AC13AFC24545A259C7B672B2240107F90511180B802DDCDA7017
        9894D0FCF05956766CA7A4770F2D51CD34C1CE87824424C0490754E9D8C9AEB8
        800FEA50101ADAC8507411BFE8A6DBBBE8B33DC34B04BE20819197B09DAA80DD
        663D60D226084469597B500C6F5B097C4ED5AE7EE04C0B7DBE99D6DA44CBB530
        42D2BAF1EC9F1B883F35A0CB2374AB9B407F743F3590DAE0B3B22D44A2832CBB
        9AF9253B0A8C0AD8537FA770DB725FF68F6CFFF2BF56F91BD4B36419DD74BAE2
        0000000049454E44AE426082}
    end
  end
end