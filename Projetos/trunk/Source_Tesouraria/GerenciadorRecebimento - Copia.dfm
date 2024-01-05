object frmGerenciadorRecebimento: TfrmGerenciadorRecebimento
  Left = 0
  Top = 0
  Caption = 'Gerenciador de Recebimentos'
  ClientHeight = 552
  ClientWidth = 1008
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
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 21
    Width = 1008
    Height = 531
    Align = alClient
    TabOrder = 0
    object pgcGerenciador: TcxPageControl
      Left = 1
      Top = 1
      Width = 1006
      Height = 529
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tabGeracao
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      OnChange = pgcGerenciadorChange
      ClientRectBottom = 529
      ClientRectRight = 1006
      ClientRectTop = 24
      object tabGeracao: TcxTabSheet
        Caption = 'Gerenciador de Compromissos'
        Color = 14807280
        ImageIndex = 0
        ParentColor = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1006
          Height = 505
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object PanelBotoes: TPanel
            Left = 0
            Top = 0
            Width = 1006
            Height = 33
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Color = 14807280
            ParentBackground = False
            TabOrder = 0
            object Panel12: TPanel
              Left = 2
              Top = 2
              Width = 735
              Height = 29
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Shape1: TShape
                Left = 0
                Top = 0
                Width = 735
                Height = 29
                Align = alClient
                Brush.Color = clWindow
                Pen.Color = clRed
                Pen.Mode = pmMask
                Pen.Style = psDot
                ExplicitTop = 1
              end
              object cxLabel5: TcxLabel
                Left = 136
                Top = 6
                Caption = 'Vencimento:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -13
                Style.Font.Name = 'Times New Roman'
                Style.Font.Style = []
                Style.TextColor = 4210688
                Style.IsFontAssigned = True
                Transparent = True
              end
              object btnGerarBoleto: TcxButton
                Left = 9
                Top = 3
                Width = 120
                Height = 25
                Cursor = crArrow
                Action = actGerarBoleto
                Caption = 'Gerar Fatura'
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
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 4210688
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtDataVencimento: TcxDateEdit
                Left = 206
                Top = 5
                ParentFont = False
                Properties.SaveTime = False
                Properties.ShowTime = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 2
                Width = 107
              end
              object edtValorTaxa: TcxCurrencyEdit
                Left = 317
                Top = 5
                Enabled = False
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 3
                Width = 57
              end
              object chxCobrarBoleto: TCheckBox
                Left = 379
                Top = 7
                Width = 177
                Height = 18
                Alignment = taLeftJustify
                Caption = '<--- Cobrar Valor do Boleto'
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                State = cbChecked
                TabOrder = 4
              end
              object lcxCalculoMedia: TcxLabel
                Left = 562
                Top = 6
                Caption = 'Lan'#231'ar Valor M'#233'dio Associado'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -13
                Style.Font.Name = 'Times New Roman'
                Style.Font.Style = []
                Style.TextColor = 4210688
                Style.IsFontAssigned = True
                Transparent = True
              end
            end
            object Panel13: TPanel
              Left = 737
              Top = 2
              Width = 267
              Height = 29
              Align = alClient
              TabOrder = 1
              object btnEnviarBoletosEmail: TcxButton
                Left = 3
                Top = 2
                Width = 120
                Height = 25
                Action = CAD_ENVIAR_EMAIL
                Caption = 'Enviar Faturas'
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
                TabOrder = 0
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object btnGerarRemessa: TcxButton
                Left = 128
                Top = 2
                Width = 120
                Height = 25
                Cursor = crHandPoint
                Caption = 'Remessa Boleto'
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                OptionsImage.Glyph.Data = {
                  E6040000424DE604000000000000360000002800000014000000140000000100
                  180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFF9F9F9EDEDEDECECECEDEDEDEDEDEDEDEDEDEDEDEDEDED
                  EDEDEDEDEDEDEDEDEDEDEDEDEDECECECEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFAFAFAF6565656363636464646464646464646969696D6D6D646464
                  6767676E6E6E646464636363656565AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF909090E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFFFFFFFFFFFEA
                  EAEAFFFFFFFFFFFFE4E4E48D8D8DFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF979797
                  D3D3D3D4D4D4CECECECFCFCFCDCDCDAEAEAE989898CCCCCCB9B9B9939393CCCC
                  CCD5D5D5D0D0D0989898FFFFFFFFFFFFFFFFFF8484846D6D6D454545C2C2C2C7
                  C7C7B1B1B1B3B3B3BABABAA6A6A69B9B9BBDBDBDABABAB999999BBBBBBC7C7C7
                  CACACA989898FFFFFFFFFFFFFFFFFF6D6D6DFFFFFFA5A5A5ACACACFFFFFFF3F3
                  F3F3F3F3FFFFFFD2D2D2B9B9B9FFFFFFDDDDDDB4B4B4FFFFFFFFFFFFD4D4D496
                  9696E0E0E0ACACACA5A5A5737373F8F8F8909090A3A3A3B3B3B39B9B9B9D9D9D
                  A1A1A19393938B8B8BA6A6A6969696898989A1A1A1B1B1B1C6C6C69A9A9A9A9A
                  9A909090909090818181E1E1E16F6F6FB0B0B0DFDFDFC8C8C8CACACAD2D2D2B3
                  B3B3A2A2A2DEDEDEBBBBBB9E9E9ED5D5D5DDDDDDCDCDCD989898949494F5F5F5
                  FFFFFF888888FFFFFFBBBBBB9C9C9CB8B8B8A1A1A1A3A3A3A8A8A89797978D8D
                  8DB0B0B09C9C9C8B8B8BA9A9A9B7B7B7C7C7C7999999999999CBCBCBB3B3B385
                  8585DADADA6B6B6BA9A9A9ABABAB9595959797979A9A9A8C8C8C848484A0A0A0
                  8F8F8F8282829A9A9AAAAAAAC5C5C59A9A9A979797D2D2D2ECECEC8B8B8BF5F5
                  F5838383ABABABDCDCDCC7C7C7C8C8C8D0D0D0AEAEAE9B9B9BDBDBDBB7B7B797
                  9797D1D1D1DBDBDBCCCCCC989898989898CDCDCDD6D6D68C8C8CEAEAEA7C7C7C
                  A2A2A28F8F8F7979797B7B7B7D7D7D7777777373738080807979797373737B7B
                  7B8F8F8FC0C0C09B9B9B999999C6C6C6A9A9A9898989D5D5D55F5F5FB4B4B491
                  91917B7B7B7D7D7D7D7D7D7D7D7D7D7D7D7C7C7C7D7D7D7E7E7E7A7A7A909090
                  CFCFCF969696979797D0D0D0F4F4F48F8F8FFAFAFA8F8F8F858585AFAFAFADAD
                  ADADADADAEAEAEADADADACACACADADADB0B0B0A1A1A1AEAEAEC2C2C2AEAEAE9E
                  9E9E9A9A9AC5C5C59A9A9A898989C0C0C07070704F4F4F515151545454555555
                  555555545454555555555555474747838383606060A3A3A3B9B9B9F0F0F09898
                  98C9C9C9B8B8B8999999ABABAB5454547E7E7E7E7E7E7D7D7D7A7A7A7C7C7C7D
                  7D7D7A7A7A7B7B7B646464D9D9D9939393FFFFFFFFFFFFFFFFFF999999C9C9C9
                  BABABA757575C0C0C0AEAEAEB3B3B3B3B3B3B2B2B2B1B1B1B2B2B2B3B3B3AEAE
                  AEA6A6A6BDBDBDD3D3D3696969FDFDFDFFFFFFFFFFFF9B9B9BBCBCBC73737347
                  47474646465252524E4E4E4E4E4E4F4F4F4F4F4F4E4E4E4D4D4D5C5C5C828282
                  6F6F6F9F9F9FBBBBBBFFFFFFFFFFFFFFFFFF919191DADADABFBFBFB5B5B5B8B8
                  B8B7B7B7B6B6B6B5B5B5B8B8B8B6B6B6B4B4B4B5B5B5C9C9C9EBEBEBA5A5A5FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD848484949494969696969696969696
                  969696969696969696969696969696969696949494848484BDBDBDFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF}
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnGerarRemessaClick
              end
            end
          end
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 33
            Align = alTop
            Caption = '   Sele'#231#227'o dos Compromissos (Filtro)'
            Ctl3D = True
            ParentBackground = False
            ParentColor = False
            ParentCtl3D = False
            Style.Color = 14807280
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Black'
            Style.TextStyle = [fsBold]
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 1
            Height = 77
            Width = 1006
            object cxGroupBox2: TcxGroupBox
              AlignWithMargins = True
              Left = 6
              Top = 18
              Align = alLeft
              Caption = '   M'#234's Refer'#234'ncia  '
              ParentColor = False
              Style.Color = 14807280
              TabOrder = 0
              Transparent = True
              Height = 46
              Width = 260
              object rdbSomente: TcxRadioButton
                Left = 62
                Top = 25
                Width = 75
                Height = 17
                Caption = 'Somente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 4210688
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Transparent = True
              end
              object rdbAte: TcxRadioButton
                Left = 14
                Top = 24
                Width = 43
                Height = 17
                Caption = 'At'#233
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 4210688
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TabStop = True
                Transparent = True
              end
              object cbxMes: TcxComboBox
                Left = 140
                Top = 20
                Properties.DropDownListStyle = lsFixedList
                Style.TextColor = 4210688
                TabOrder = 2
                Width = 113
              end
            end
            object cxGroupBox3: TcxGroupBox
              AlignWithMargins = True
              Left = 272
              Top = 18
              Align = alClient
              Caption = '  Op'#231#227'o de Marcar/Desmarcar Item selecionado ou todos  '
              ParentColor = False
              Style.Color = 14807280
              TabOrder = 1
              Transparent = True
              Height = 46
              Width = 657
              object rdbMarcar: TcxRadioButton
                Left = 13
                Top = 24
                Width = 67
                Height = 17
                Caption = 'Marcar '
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TabStop = True
                Transparent = True
              end
              object rdbDesmarcar: TcxRadioButton
                Left = 86
                Top = 24
                Width = 89
                Height = 17
                Caption = 'Desmarcar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 4210688
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                Transparent = True
              end
              object lcxCompromissos: TcxLookupComboBox
                Left = 171
                Top = 20
                RepositoryItem = dtmLookup.Lista_CompReceitassTodos
                Enabled = False
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.KeyFieldNames = 'Compromisso'
                Properties.ListColumns = <
                  item
                    FieldName = 'Compromisso'
                  end>
                Properties.ListOptions.ShowHeader = False
                TabOrder = 2
                Width = 294
              end
              object chxTodos: TcxCheckBox
                Left = 465
                Top = 21
                Caption = 'Todos'
                State = cbsChecked
                Style.TextStyle = [fsBold]
                TabOrder = 3
                Transparent = True
                OnClick = chxTodosClick
                Width = 58
              end
              object btnMarcar: TcxButton
                Left = 529
                Top = 18
                Width = 120
                Height = 25
                Caption = 'Aplicar Filtro'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                TabOrder = 4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnMarcarClick
              end
            end
            object PanelBotaoFechar: TPanel
              Left = 932
              Top = 15
              Width = 71
              Height = 52
              Align = alRight
              BevelOuter = bvNone
              Color = 14807280
              ParentBackground = False
              TabOrder = 2
              object cxBtnFechar: TcxButton
                Left = 4
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
          end
          object TPanel
            Left = 0
            Top = 110
            Width = 1006
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Color = 14807280
            ParentBackground = False
            TabOrder = 2
            object cxProgress: TcxProgressBar
              Left = 182
              Top = 0
              Align = alClient
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Blue'
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Blue'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Blue'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Blue'
              TabOrder = 0
              Width = 824
            end
            object pnlImpressao: TPanel
              Left = 0
              Top = 0
              Width = 182
              Height = 20
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Imprimindo Grupo de Associados...'
              Color = 14807280
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
            end
          end
          object Panel3: TPanel
            Left = 484
            Top = 130
            Width = 522
            Height = 375
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 3
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 522
              Height = 28
              Align = alTop
              BevelOuter = bvNone
              Color = 14807280
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = #39
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              OnClick = Panel8Click
              object btnRecebimentoRecibo: TcxButton
                Left = 0
                Top = 2
                Width = 120
                Height = 25
                Caption = 'Pagamento Recibo'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  E6040000424DE604000000000000360000002800000014000000140000000100
                  180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
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
                OnClick = btnRecebimentoReciboClick
              end
              object btnEditarCompromissos: TcxButton
                Left = 124
                Top = 2
                Width = 165
                Height = 25
                Caption = 'Editar Compromissos'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  E6040000424DE604000000000000360000002800000014000000140000000100
                  180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFF9F9F9EDEDEDECECECEDEDEDEDEDEDEDEDEDEDEDEDEDED
                  EDEDEDEDEDEDEDEDEDEDEDEDEDECECECEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFAFAFAF6565656363636464646464646464646969696D6D6D646464
                  6767676E6E6E646464636363656565AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF909090E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFFFFFFFFFFFEA
                  EAEAFFFFFFFFFFFFE4E4E48D8D8DFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF979797
                  D3D3D3D4D4D4CECECECFCFCFCDCDCDAEAEAE989898CCCCCCB9B9B9939393CCCC
                  CCD5D5D5D0D0D0989898FFFFFFFFFFFFFFFFFF8484846D6D6D454545C2C2C2C7
                  C7C7B1B1B1B3B3B3BABABAA6A6A69B9B9BBDBDBDABABAB999999BBBBBBC7C7C7
                  CACACA989898FFFFFFFFFFFFFFFFFF6D6D6DFFFFFFA5A5A5ACACACFFFFFFF3F3
                  F3F3F3F3FFFFFFD2D2D2B9B9B9FFFFFFDDDDDDB4B4B4FFFFFFFFFFFFD4D4D496
                  9696E0E0E0ACACACA5A5A5737373F8F8F8909090A3A3A3B3B3B39B9B9B9D9D9D
                  A1A1A19393938B8B8BA6A6A6969696898989A1A1A1B1B1B1C6C6C69A9A9A9A9A
                  9A909090909090818181E1E1E16F6F6FB0B0B0DFDFDFC8C8C8CACACAD2D2D2B3
                  B3B3A2A2A2DEDEDEBBBBBB9E9E9ED5D5D5DDDDDDCDCDCD989898949494F5F5F5
                  FFFFFF888888FFFFFFBBBBBB9C9C9CB8B8B8A1A1A1A3A3A3A8A8A89797978D8D
                  8DB0B0B09C9C9C8B8B8BA9A9A9B7B7B7C7C7C7999999999999CBCBCBB3B3B385
                  8585DADADA6B6B6BA9A9A9ABABAB9595959797979A9A9A8C8C8C848484A0A0A0
                  8F8F8F8282829A9A9AAAAAAAC5C5C59A9A9A979797D2D2D2ECECEC8B8B8BF5F5
                  F5838383ABABABDCDCDCC7C7C7C8C8C8D0D0D0AEAEAE9B9B9BDBDBDBB7B7B797
                  9797D1D1D1DBDBDBCCCCCC989898989898CDCDCDD6D6D68C8C8CEAEAEA7C7C7C
                  A2A2A28F8F8F7979797B7B7B7D7D7D7777777373738080807979797373737B7B
                  7B8F8F8FC0C0C09B9B9B999999C6C6C6A9A9A9898989D5D5D55F5F5FB4B4B491
                  91917B7B7B7D7D7D7D7D7D7D7D7D7D7D7D7C7C7C7D7D7D7E7E7E7A7A7A909090
                  CFCFCF969696979797D0D0D0F4F4F48F8F8FFAFAFA8F8F8F858585AFAFAFADAD
                  ADADADADAEAEAEADADADACACACADADADB0B0B0A1A1A1AEAEAEC2C2C2AEAEAE9E
                  9E9E9A9A9AC5C5C59A9A9A898989C0C0C07070704F4F4F515151545454555555
                  555555545454555555555555474747838383606060A3A3A3B9B9B9F0F0F09898
                  98C9C9C9B8B8B8999999ABABAB5454547E7E7E7E7E7E7D7D7D7A7A7A7C7C7C7D
                  7D7D7A7A7A7B7B7B646464D9D9D9939393FFFFFFFFFFFFFFFFFF999999C9C9C9
                  BABABA757575C0C0C0AEAEAEB3B3B3B3B3B3B2B2B2B1B1B1B2B2B2B3B3B3AEAE
                  AEA6A6A6BDBDBDD3D3D3696969FDFDFDFFFFFFFFFFFF9B9B9BBCBCBC73737347
                  47474646465252524E4E4E4E4E4E4F4F4F4F4F4F4E4E4E4D4D4D5C5C5C828282
                  6F6F6F9F9F9FBBBBBBFFFFFFFFFFFFFFFFFF919191DADADABFBFBFB5B5B5B8B8
                  B8B7B7B7B6B6B6B5B5B5B8B8B8B6B6B6B4B4B4B5B5B5C9C9C9EBEBEBA5A5A5FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD848484949494969696969696969696
                  969696969696969696969696969696969696949494848484BDBDBDFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF}
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnEditarCompromissosClick
              end
            end
            object tabBoleto: TcxTabControl
              Left = 0
              Top = 28
              Width = 522
              Height = 347
              Hint = 'Duplo Clique para Pagar'
              Align = alClient
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Properties.CustomButtons.Buttons = <>
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Pink'
              OnChange = tabBoletoChange
              OnDblClick = tabBoletoDblClick
              ClientRectBottom = 341
              ClientRectLeft = 3
              ClientRectRight = 516
              ClientRectTop = 3
              object cxGroupBox4: TcxGroupBox
                Left = 3
                Top = 3
                Align = alClient
                Caption = ' Compromissos Vencidos do Associado'
                ParentFont = False
                Style.LookAndFeel.NativeStyle = False
                Style.LookAndFeel.SkinName = 'Office2007Pink'
                Style.TextStyle = [fsBold]
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.SkinName = 'Office2007Pink'
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.SkinName = 'Office2007Pink'
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.SkinName = 'Office2007Pink'
                TabOrder = 0
                Height = 338
                Width = 513
                object grdCompromissoVencido: TcxGrid
                  Left = 3
                  Top = 15
                  Width = 507
                  Height = 313
                  Align = alClient
                  PopupMenu = popCompromissos
                  TabOrder = 0
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = ''
                  object cxGridDBTableCompromissos: TcxGridDBTableView
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
                    OnCustomDrawCell = cxGridDBTableCompromissosCustomDrawCell
                    DataController.DataSource = dtsCompromissos
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Format = 'R$ ,#0.00'
                        Kind = skSum
                        Position = spFooter
                        FieldName = 'VALOR_ATUAL'
                        Column = cxGridDBValor
                      end
                      item
                        Format = 'Valor '#224' Pagar: ,#0.00'
                        Kind = skSum
                        Position = spFooter
                        FieldName = 'calc_ValorPagar'
                        Column = cxGridDBCompromisso
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = 'Total: ,#0.00'
                        Kind = skSum
                        FieldName = 'VALOR_ATUAL'
                        Column = cxGridDBValor
                      end
                      item
                        Format = 'Valor '#224' Pagar: ,#0.00'
                        Kind = skSum
                        FieldName = 'calc_ValorPagar'
                        Column = cxGridDBCompromisso
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
                    object cxGridDBCompromisso: TcxGridDBColumn
                      Caption = 'Compromisso'
                      DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                      RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                      Options.Editing = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 159
                    end
                    object cxGridDBTableView1Column4: TcxGridDBColumn
                      DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                      Options.Editing = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 29
                      IsCaptionAssigned = True
                    end
                    object cxGridDBTableView1Column2: TcxGridDBColumn
                      DataBinding.FieldName = 'calc_travado'
                      PropertiesClassName = 'TcxImageComboBoxProperties'
                      Properties.Images = dtmControles.imgCadBasicos
                      Properties.Items = <
                        item
                          ImageIndex = 9
                          Value = 'S'
                        end>
                      Options.Editing = False
                      Options.Filtering = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 20
                      IsCaptionAssigned = True
                    end
                    object cxGridDBTableAtualizado: TcxGridDBColumn
                      Caption = '$'
                      DataBinding.FieldName = 'ATUALIZADO'
                      PropertiesClassName = 'TcxImageComboBoxProperties'
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
                      Options.Sorting = False
                      Width = 20
                    end
                    object cxGridDBValor: TcxGridDBColumn
                      Caption = 'Valor'
                      DataBinding.FieldName = 'VALOR_ATUAL'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Options.Editing = False
                      Options.Filtering = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 57
                    end
                    object cxGridDBTableDiferenca: TcxGridDBColumn
                      Caption = '#'
                      DataBinding.FieldName = 'DIFERENCA'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      RepositoryItem = dtmLookup.Combo_SimNaoDiferenca
                      HeaderAlignmentHorz = taCenter
                      HeaderGlyphAlignmentHorz = taCenter
                      Options.Editing = False
                      Options.Filtering = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 21
                    end
                    object cxGridDBTableQtdAdicional: TcxGridDBColumn
                      Caption = '+'
                      DataBinding.FieldName = 'QTD_ADICIONAL'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Properties.Alignment.Vert = taBottomJustify
                      Properties.DisplayFormat = '0'
                      HeaderAlignmentHorz = taCenter
                      HeaderGlyphAlignmentHorz = taCenter
                      Options.Editing = False
                      Options.Filtering = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 29
                    end
                    object cxGridDBColumn4: TcxGridDBColumn
                      Caption = 'Refer'#234'ncia'
                      DataBinding.FieldName = 'calc_referencia'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      HeaderAlignmentHorz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Width = 64
                    end
                    object cxGridDBTableView1Column1: TcxGridDBColumn
                      Caption = 'Boleto'
                      DataBinding.FieldName = 'BOLETA_ID'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      HeaderAlignmentHorz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Options.Sorting = False
                      Styles.Content = dtmControles.cxStyle20
                      Width = 52
                    end
                    object cxGridDBTableView1Column3: TcxGridDBColumn
                      Caption = 'Selecionar'
                      DataBinding.FieldName = 'SELECIONADO'
                      PropertiesClassName = 'TcxCheckBoxProperties'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Properties.OnChange = cxGridDBTableView1Column3PropertiesChange
                      OnCustomDrawCell = cxGridDBTableView1Column3CustomDrawCell
                      HeaderAlignmentHorz = taCenter
                      Options.Sorting = False
                      Width = 56
                    end
                    object cxGridDBCompromissoPessoa: TcxGridDBColumn
                      DataBinding.FieldName = 'PESSOA_ID'
                      RepositoryItem = dtmLookup.Lista_Pessoas
                      Visible = False
                      Options.ShowCaption = False
                      Options.Sorting = False
                      SortIndex = 0
                      SortOrder = soDescending
                      IsCaptionAssigned = True
                    end
                    object cxGridDBTableCompromissosValorPagar: TcxGridDBColumn
                      DataBinding.FieldName = 'calc_ValorPagar'
                      Visible = False
                      Options.Sorting = False
                    end
                  end
                  object cxGridLevel2: TcxGridLevel
                    GridView = cxGridDBTableCompromissos
                  end
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 130
            Width = 484
            Height = 375
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 4
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 484
              Height = 50
              Align = alTop
              BevelOuter = bvNone
              Color = 14807280
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = #39
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              object sbnLimparFiltro: TSpeedButton
                Left = 301
                Top = 25
                Width = 22
                Height = 20
                Cursor = crHandPoint
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF000000
                  B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF000000
                  B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00FF000000
                  B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF000000D6000000BD000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
                  FF000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF000000B5000000B5000000B500FF00FF000000B5000000
                  B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF000000B5000000C6000000C6000000CE000000
                  B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF000000C6000000C6000000DE00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF000000B5000000D6000000CE000000DE000000
                  EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF000000E7000000DE000000D600FF00FF00FF00FF000000
                  E7000000EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000FF000000DE000000EF00FF00FF00FF00FF00FF00FF00FF00
                  FF000000FF000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF000000F7000000F7000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF000000
                  F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF000000F700FF00FF00FF00FF000000F7000000
                  F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000
                  F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OnClick = sbnLimparFiltroClick
              end
              object cxLabel1: TcxLabel
                Left = 4
                Top = 24
                Caption = 'Grupo:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.IsFontAssigned = True
              end
              object lcxGrupoAssociado: TcxLookupComboBox
                Left = 55
                Top = 23
                RepositoryItem = dtmLookup.Lista_GrupoAssociadoAtivo
                Properties.DropDownListStyle = lsFixedList
                Properties.GridMode = True
                Properties.KeyFieldNames = 'FAMILIA'
                Properties.ListColumns = <
                  item
                    FieldName = 'FAMILIA'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.OnEditValueChanged = lcxGrupoAssociadoPropertiesEditValueChanged
                TabOrder = 1
                Width = 244
              end
              object rdbRegistroSocio: TcxRadioButton
                Left = 5
                Top = 2
                Width = 124
                Height = 17
                Caption = 'Registros de S'#243'cios'
                Checked = True
                TabOrder = 2
                TabStop = True
                OnClick = rdbRegistroSocioClick
              end
              object rdbRegistroAvulso: TcxRadioButton
                Left = 135
                Top = 0
                Width = 116
                Height = 17
                Caption = 'Registros Avulsos'
                TabOrder = 3
                OnClick = rdbRegistroAvulsoClick
              end
            end
            object cxGroupBox5: TcxGroupBox
              Left = 0
              Top = 50
              Align = alClient
              Caption = ' Associados Ativos '
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Black'
              Style.TextStyle = [fsBold]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Black'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Black'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Black'
              TabOrder = 1
              Height = 325
              Width = 484
              object lblMarcar: TcxLabel
                Left = 306
                Top = -4
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
                Left = 386
                Top = -4
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
              object cxGridAssociados: TcxGrid
                Left = 3
                Top = 36
                Width = 478
                Height = 279
                Hint = 'Duplo Clique - Cadastro do Associado'
                Align = alClient
                PopupMenu = popMarcarGrupo
                TabOrder = 2
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                object cxGridDBTableView1: TcxGridDBTableView
                  OnDblClick = cxGridDBTableView1DblClick
                  OnKeyPress = cxGridDBTableView1KeyPress
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
                  OnCustomDrawCell = cxGridDBTableView1CustomDrawCell
                  OnFocusedRecordChanged = cxGridDBTableView1FocusedRecordChanged
                  DataController.DataSource = dtsAssociadosAtivos
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'Qtd.: 0'
                      Kind = skCount
                      FieldName = 'NOME'
                      Column = cxGridDBNome
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
                  object cxGridDBNome: TcxGridDBColumn
                    Caption = 'Associado'
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 197
                  end
                  object cxGridDBGrupo: TcxGridDBColumn
                    Caption = 'Grupo'
                    DataBinding.FieldName = 'PESSOA_GRUPO_ID'
                    RepositoryItem = dtmLookup.Lista_GrupoAssociadoTodos
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 120
                  end
                  object cxGridDBTableView1Column6: TcxGridDBColumn
                    Caption = 'Fatura Tipo'
                    DataBinding.FieldName = 'FATURA_TIPO'
                    RepositoryItem = dtmLookupContabil.Combo_FaturaTipo
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 65
                  end
                  object cxGridDBSecionado: TcxGridDBColumn
                    Caption = 'Selecionar'
                    DataBinding.FieldName = 'SELECIONADO'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.DisplayGrayed = 'False'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Properties.OnChange = cxGridDBSecionadoPropertiesChange
                    OnCustomDrawCell = cxGridDBSecionadoCustomDrawCell
                    Options.Filtering = False
                    Options.Sorting = False
                    Width = 45
                  end
                  object cxGridDBTableView1Column5: TcxGridDBColumn
                    Width = 49
                  end
                end
                object cxGridLevel1: TcxGridLevel
                  GridView = cxGridDBTableView1
                end
              end
              object edtPesquisar: TcxTextEdit
                Left = 3
                Top = 15
                Align = alTop
                Properties.CharCase = ecUpperCase
                Properties.OnChange = edtPesquisarPropertiesChange
                TabOrder = 3
                Visible = False
                OnExit = edtPesquisarExit
                OnKeyDown = edtPesquisarKeyDown
                Width = 478
              end
            end
          end
        end
      end
      object tabRecebimento: TcxTabSheet
        Caption = 'Gerenciador de Faturas'
        ImageIndex = 1
        object pgcRegistro: TcxPageControl
          Left = 0
          Top = 0
          Width = 1006
          Height = 149
          Align = alTop
          TabOrder = 0
          Properties.ActivePage = cxTabSheet1
          Properties.CustomButtons.Buttons = <>
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Office2007Black'
          OnChange = pgcRegistroChange
          ClientRectBottom = 143
          ClientRectLeft = 3
          ClientRectRight = 1000
          ClientRectTop = 26
          object cxTabSheet1: TcxTabSheet
            Caption = 'Registro Manual da Fatura'
            ImageIndex = 0
            object cxGroupBox6: TcxGroupBox
              Left = 0
              Top = 0
              Align = alClient
              Caption = ' Registrar Entrada da Fatura'
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Black'
              Style.TextStyle = [fsBold]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Black'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Black'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Black'
              TabOrder = 0
              Height = 117
              Width = 997
              object cxLabel3: TcxLabel
                Left = 9
                Top = 27
                Caption = 'Nosso N'#250'mero:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.TextStyle = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object lblDataRecebimento: TcxLabel
                Left = 447
                Top = 28
                Caption = 'Data da Entrada:'
                Enabled = False
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Times New Roman'
                Style.Font.Style = []
                Style.TextColor = clNavy
                Style.IsFontAssigned = True
                Transparent = True
              end
              object chxValorBoleta: TcxCheckBox
                Left = 7
                Top = 56
                Caption = 'Registrar Valor da Boleta'
                Properties.DisplayGrayed = 'False'
                TabOrder = 2
                Transparent = True
                OnClick = chxValorBoletaClick
                Width = 149
              end
              object lblValorBoleto: TcxLabel
                Left = 9
                Top = 81
                Caption = 'Valor do Boleto:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.TextStyle = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object edtValorBoleto: TcxCurrencyEdit
                Left = 88
                Top = 78
                EditValue = 2.000000000000000000
                Enabled = False
                StyleDisabled.TextColor = clBlack
                TabOrder = 4
                Width = 71
              end
              object cxLabel6: TcxLabel
                Left = 289
                Top = 27
                Caption = 'Refer'#234'ncia:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.TextStyle = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object edtNossoNumero: TcxTextEdit
                Left = 88
                Top = 25
                TabOrder = 6
                Text = 'edtNossoNumero'
                OnEnter = edtNossoNumeroEnter
                OnKeyDown = edtNossoNumeroKeyDown
                OnKeyPress = edtNossoNumeroKeyPress
                Width = 71
              end
              object btnPesquisarBoleto: TcxButton
                Left = 163
                Top = 23
                Width = 120
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
                TabOrder = 7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnPesquisarBoletoClick
              end
              object edtMesReferencia: TcxTextEdit
                Left = 352
                Top = 25
                Enabled = False
                Properties.MaxLength = 6
                StyleDisabled.Color = clSilver
                StyleDisabled.TextColor = clWindowText
                TabOrder = 8
                Width = 89
              end
              object edtDataRecebimento: TcxDateEdit
                Left = 530
                Top = 25
                Enabled = False
                Properties.SaveTime = False
                Properties.ShowTime = False
                TabOrder = 9
                OnKeyDown = edtDataRecebimentoKeyDown
                Width = 121
              end
              object btnRegistrarBoleto: TcxButton
                Left = 655
                Top = 23
                Width = 120
                Height = 25
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
                TabOrder = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnRegistrarBoletoClick
              end
              object btnCancelarRegistro: TcxButton
                Left = 781
                Top = 23
                Width = 120
                Height = 25
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
                TabOrder = 11
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnCancelarRegistroClick
              end
            end
          end
          object tabRetorno: TcxTabSheet
            Caption = 'Importar Retorno Boleto'
            ImageIndex = 2
            object edtRetorno: TcxTextEdit
              Left = 16
              Top = 23
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
              Width = 447
            end
            object cxLabel2: TcxLabel
              Left = 16
              Top = 4
              Caption = 'Arquivo Retorno'
              Style.TextColor = 16384
              Style.TextStyle = []
              Transparent = True
            end
            object btnPesquisarRetorno: TcxButton
              Left = 467
              Top = 22
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
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnPesquisarRetornoClick
            end
            object btnConfirmarRetorno: TcxButton
              Left = 507
              Top = 20
              Width = 120
              Height = 25
              Caption = 'Confirmar Registro'
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
              TabOrder = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnConfirmarRetornoClick
            end
            object btnCancelarRetorno: TcxButton
              Left = 633
              Top = 20
              Width = 120
              Height = 25
              Caption = 'Cancelar'
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
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnCancelarRetornoClick
            end
            object lblDadosBanco: TcxLabel
              Left = 16
              Top = 47
              Caption = 'Dados do Banco: '
              Style.TextColor = 16384
              Style.TextStyle = []
              Transparent = True
              Visible = False
            end
            object cxProgressRetorno: TcxProgressBar
              Left = 16
              Top = 68
              Style.BorderStyle = ebsNone
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
              TabOrder = 6
              Visible = False
              Width = 735
            end
            object lblInformacao: TcxLabel
              Left = 16
              Top = 92
              Caption = 
                'Confira, Selecione e Pressione em CONFIRMAR para Registrar os Bo' +
                'letos!!!'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.TextColor = clRed
              Style.TextStyle = []
              Style.IsFontAssigned = True
              Transparent = True
              Visible = False
            end
          end
          object cxTabSheet2: TcxTabSheet
            Caption = 'Cancelamento de Faturas'
            ImageIndex = 1
            object cxGroupBox7: TcxGroupBox
              Left = 0
              Top = 0
              Align = alTop
              Caption = ' Cancelamento de Boletos'
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Office2007Pink'
              Style.TextStyle = [fsBold]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Pink'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Office2007Pink'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Office2007Pink'
              TabOrder = 0
              Height = 117
              Width = 997
              object lblReferenciaMulta: TcxLabel
                Left = 229
                Top = 25
                Caption = 'Referencia <='
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.TextStyle = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cbxReferenciaMulta: TcxComboBox
                Left = 306
                Top = 24
                Properties.DropDownListStyle = lsFixedList
                Style.TextColor = clNavy
                TabOrder = 1
                Width = 81
              end
              object btnCancelarTodos: TcxButton
                Left = 15
                Top = 19
                Width = 208
                Height = 25
                Caption = 'Cancelar Todos os Boletos em Aberto'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                TabOrder = 2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnCancelarTodosClick
              end
            end
          end
        end
        object pgcRegistroBoleto: TcxPageControl
          Left = 0
          Top = 149
          Width = 1006
          Height = 356
          Align = alClient
          TabOrder = 1
          Properties.ActivePage = tabRegistroManual
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 356
          ClientRectRight = 1006
          ClientRectTop = 24
          object tabRegistroManual: TcxTabSheet
            Caption = 'tabRegistroManual'
            ImageIndex = 0
            object gbxBoletoCompromissos: TcxGroupBox
              Left = 0
              Top = 0
              Align = alLeft
              Caption = 'Compromissos da Fatura'
              ParentFont = False
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Office2007Pink'
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Pink'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Office2007Pink'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Office2007Pink'
              TabOrder = 0
              Height = 332
              Width = 353
              object cxGrid1: TcxGrid
                Left = 3
                Top = 15
                Width = 347
                Height = 307
                Align = alClient
                TabOrder = 0
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                object cxGridDBRegistroBoleto: TcxGridDBTableView
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
                  DataController.DataSource = dtsRegistrarCompromissos
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'VALOR_ATUAL'
                      Column = cxGridDBColumn6
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'Total: ,#0.00'
                      Kind = skSum
                      FieldName = 'VALOR_ATUAL'
                      Column = cxGridDBColumn6
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
                  object cxGridDBColumn1: TcxGridDBColumn
                    Caption = 'Compromisso'
                    DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                    RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                    Options.Editing = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 205
                  end
                  object cxGridDBColumn2: TcxGridDBColumn
                    DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
                    Options.Editing = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 46
                    IsCaptionAssigned = True
                  end
                  object cxGridDBColumn6: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'VALOR_ATUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 105
                  end
                  object cxGridDBColumn7: TcxGridDBColumn
                    Caption = '#'
                    DataBinding.FieldName = 'DIFERENCA'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    RepositoryItem = dtmLookup.Combo_SimNaoDiferenca
                    HeaderAlignmentHorz = taCenter
                    HeaderGlyphAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 21
                  end
                  object cxGridDBColumn8: TcxGridDBColumn
                    Caption = '+'
                    DataBinding.FieldName = 'QTD_ADICIONAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taBottomJustify
                    Properties.DisplayFormat = '0'
                    HeaderAlignmentHorz = taCenter
                    HeaderGlyphAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 22
                  end
                  object cxGridDBColumn9: TcxGridDBColumn
                    Caption = 'Refer'#234'ncia'
                    DataBinding.FieldName = 'calc_referencia'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Focusing = False
                    Options.Sorting = False
                    Width = 64
                  end
                  object cxGridDBColumn12: TcxGridDBColumn
                    DataBinding.FieldName = 'PESSOA_ID'
                    RepositoryItem = dtmLookup.Lista_Pessoas
                    Visible = False
                    GroupIndex = 0
                    Options.ShowCaption = False
                    Options.Sorting = False
                    SortIndex = 0
                    SortOrder = soDescending
                    IsCaptionAssigned = True
                  end
                end
                object cxGridLevel4: TcxGridLevel
                  GridView = cxGridDBRegistroBoleto
                end
              end
            end
            object pgcBoletosRegistrados: TcxPageControl
              Left = 353
              Top = 0
              Width = 653
              Height = 332
              Align = alClient
              TabOrder = 1
              Properties.ActivePage = tabBoletosRegistrados
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 332
              ClientRectRight = 653
              ClientRectTop = 24
              object tabBoletosRegistrados: TcxTabSheet
                Caption = 'Faturas Registradas'
                ImageIndex = 0
                object gbxBoletoRegistrado: TcxGroupBox
                  Left = 0
                  Top = 0
                  Align = alClient
                  Caption = ' Faturas Emitidas, Registradas e Canceladas'
                  ParentFont = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.LookAndFeel.SkinName = 'Black'
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleDisabled.LookAndFeel.SkinName = 'Black'
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleFocused.LookAndFeel.SkinName = 'Black'
                  StyleHot.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.SkinName = 'Black'
                  TabOrder = 0
                  Height = 308
                  Width = 653
                  object cxGridBoletosPagos: TcxGrid
                    Left = 3
                    Top = 71
                    Width = 647
                    Height = 227
                    Align = alClient
                    PopupMenu = popBoletos
                    TabOrder = 0
                    LookAndFeel.Kind = lfUltraFlat
                    LookAndFeel.NativeStyle = False
                    LookAndFeel.SkinName = ''
                    object cxGridDBTableView3: TcxGridDBTableView
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
                      DataController.DataSource = dtsBoletosRegistrados
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <
                        item
                          Format = 'Qtd.: 0'
                          Kind = skCount
                          FieldName = 'calc_Nome'
                          Column = cxGridDBTableView3Column1
                        end
                        item
                          Format = 'Total: ,#0.00'
                          Kind = skSum
                          FieldName = 'VALOR'
                          Column = cxGridDBTableView3Column4
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
                      Styles.GroupByBox = dtmControles.cxStyle7
                      object cxGridDBTableView3Column1: TcxGridDBColumn
                        Caption = 'Associado/Grupo'
                        DataBinding.FieldName = 'calc_Nome'
                        Options.Editing = False
                        Options.Focusing = False
                        Options.Grouping = False
                        Width = 219
                      end
                      object cxGridDBTableView3Column6: TcxGridDBColumn
                        Caption = 'Refer'#234'ncia'
                        DataBinding.FieldName = 'calc_referencia'
                        Options.Editing = False
                        Options.Focusing = False
                        Width = 72
                      end
                      object cxGridDBTableView3Column4: TcxGridDBColumn
                        Caption = 'Valor'
                        DataBinding.FieldName = 'VALOR'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Options.Editing = False
                        Options.Filtering = False
                        Options.Focusing = False
                        Width = 48
                      end
                      object cxGridDBTableView3Column5: TcxGridDBColumn
                        Caption = 'Situa'#231#227'o'
                        DataBinding.FieldName = 'SITUACAO'
                        RepositoryItem = dtmLookup.Combo_SituacaoBoleto
                        Options.Editing = False
                        Options.Filtering = False
                        Options.Focusing = False
                        Width = 71
                      end
                      object cxGridDBTableView3Column2: TcxGridDBColumn
                        Caption = 'Data Situa'#231#227'o'
                        DataBinding.FieldName = 'calc_DataSituacao'
                        PropertiesClassName = 'TcxDateEditProperties'
                        Properties.Alignment.Horz = taCenter
                        GroupSummaryAlignment = taCenter
                        HeaderAlignmentHorz = taCenter
                        Options.Editing = False
                        Options.Focusing = False
                        SortIndex = 0
                        SortOrder = soDescending
                        Width = 78
                      end
                      object cxGridDBTableView3Column3: TcxGridDBColumn
                        Caption = 'Fatura'
                        DataBinding.FieldName = 'BOLETA_ID'
                        PropertiesClassName = 'TcxTextEditProperties'
                        Properties.Alignment.Horz = taCenter
                        HeaderAlignmentHorz = taCenter
                        Options.Editing = False
                        Options.Filtering = False
                        Options.Focusing = False
                        Width = 43
                      end
                    end
                    object cxGridLevel3: TcxGridLevel
                      GridView = cxGridDBTableView3
                    end
                  end
                  object Panel7: TPanel
                    Left = 3
                    Top = 15
                    Width = 647
                    Height = 56
                    Align = alTop
                    BevelOuter = bvLowered
                    Color = clWindow
                    ParentBackground = False
                    TabOrder = 1
                    object btnPesquisarBoletosRegistrados: TSpeedButton
                      Left = 559
                      Top = 23
                      Width = 26
                      Height = 30
                      Cursor = crHandPoint
                      Hint = 'Adicionar Associado ao Agendamento Selecionado'
                      Flat = True
                      Glyph.Data = {
                        4A040000424D4A040000000000000A0200002800000018000000180000000100
                        08000000000040020000120B0000120B0000750000007500000000000000FFFF
                        FF00FF00FF00B4AAB200CC666600EDC8C800E29F9300E9B2A500E6A89600EAB6
                        A800EFC1B300EDBDA800F8D5C500F1BDA000F5C9B000F1C6AD00F4CCAF00BCB8
                        B500F5D1B300F7D4B800F9D4B000FEDBBA00FFFCF900FFFEFD00F9D6AD00DC91
                        2E00FEECD500FFF2E100FFF5E800E5AF6300FFE1B500FAE0B900F5E1C300FFEF
                        D700FFEFD800EEE1CE00FFF5E700FFE4BB00F3DBB400FFE8C300FDE6C300FFEB
                        CB00FFECCD00FFEED400E6D8C200FFF1DA00FCF1E000FDE5B900F7E0B600FFE7
                        BE00FCE9C700FCEACA00FFEFD300ECDEC500FDF5E700FFE9BD00E0CFAE00FFEE
                        CD00FFEFD100FFF2DA00F4F1EB00FFF2D600FFEEC700FFEFCA00FFF5DE00FFF7
                        E400D4CAAA00CEC5A800E1DCCC00FFFAEA00D2CCB300FFFAE600FFFBEC00BFBE
                        A600FFFFF900FFFFFE00ACB19D00C1C5B900E3E5DF0096A49900B0BBB300899D
                        980083989400B2C1C10003E2E800A3B7BA000C6F8B0058808C000492C300317A
                        940093A6AD009CACB200386C80003D6F83004B7C8F004C7B8D0058839500779E
                        AE0089A9B600A4BDC7008E9DA3001B5A76001E5F7D001F5D7800255F7A002A62
                        7B002E69840047788F0089A5B200044C6F000E537400155878008BABBB000078
                        BB000062A000004A9400004CA400020202020202020202020202020202020202
                        026D6D0202020202020202020202020202020202020202026D72746D02020202
                        0202020202020202020202020202026D7271746D020202020202020202020202
                        0202020202026D7371746D020202020202020202020202026D6D6D6D6D6D5958
                        746D0202020202020202020202026D6D502D472E556856546D02020202020202
                        04040404046D51150E0B090A0C486A6D020202020202020204050503694F3115
                        1312120F0724366F6D0202020202020204054E7067423E3A34393F10081C4553
                        6D0202020202020204054E616F302921222B3910061C47446D02020202020202
                        04054E616F2F2A3B3B3D3910062441446D020202020202020405016265382023
                        23443310061B404D6D020202020202020405015A5F522520352C3210081A3A52
                        6D02020202020202040501016C6F2631282027140D3F466D0202020202020202
                        040501115B5E6F431F1F371E18496F6D02020202020202020405013C3C636B5C
                        524C4C4F576D6D02020202020202020204050111111164605D6E66666D020202
                        020202020202020204050101010101014E4E4E05040202020202020202020202
                        04050101014A4A01050505050402020202020202020202020405010117164B01
                        040404040402020202020202020202020405010101170101041D190402020202
                        02020202020202020405010101010101041D0402020202020202020202020202
                        0405050505050505040402020202020202020202020202020404040404040404
                        0402020202020202020202020202}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnPesquisarBoletosRegistradosClick
                    end
                    object btnImprimir: TSpeedButton
                      Left = 587
                      Top = 23
                      Width = 26
                      Height = 30
                      Cursor = crHandPoint
                      Hint = 'Adicionar Associado ao Agendamento Selecionado'
                      Flat = True
                      Glyph.Data = {
                        B6020000424DB602000000000000760000002800000018000000180000000100
                        08000000000040020000120B0000120B0000100000001000000000000000FFFF
                        FF00FF00FF00669A3200FEFEFE00EEEEEE00DEDEDE00CECECE00B6B6B600AEAE
                        AE009A9A9A008A8A8A007A7A7A006E6E6E005E5E5E0044444400020202020202
                        020202020202020202020202020202020202020202020F0F0F0F0F0F0F0F0F0F
                        0F0F0F0F0F0F02020202020202020F04040404040404040404040404040F0202
                        0202020202020F04040404040404040404040404040F02020202020202020F04
                        040404040404040404040404040F0202020202020F0F0F050505050505050505
                        05050505050F0F0F0202020F0A070D06060606060606060606060606060D070A
                        0F02020F08080C0E0E0E0E0E0E0E0E0E0E0E0E0E0E0C08080F02020F0B0B0B0B
                        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0F02020F080808080808080808080808
                        08080808080808080F02020F0707070707070707070707070707070703030707
                        0F02020F07070707070707070707070707070707070707070F02020F06060606
                        060606060606060606060606060606060F02020F0606090B0B0B0B0B0B0B0B0B
                        0B0B0B0B0B0906060F02020F0606090505050505050505050505050505090606
                        0F02020F08060905050505050505050505050505050906080F0202020F0F0C05
                        060506050605060506050605060C0F0F0202020202020F060506050605060506
                        05060507080F02020202020202020F0606060606060606060607090A0A0F0202
                        0202020202020F06060606060606060606070505060F02020202020202020F07
                        070707070707070707070404080F02020202020202020F060606060606060606
                        060605080F0202020202020202020F0F0F0F0F0F0F0F0F0F0F0F0F0F02020202
                        0202020202020202020202020202020202020202020202020202}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnImprimirClick
                    end
                    object lblPesqRefInicial: TcxLabel
                      Left = 113
                      Top = 30
                      Caption = 'Ref.Inicial:'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clBlue
                      Style.Font.Height = -11
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = [fsBold]
                      Style.TextColor = 4210688
                      Style.TextStyle = []
                      Style.IsFontAssigned = True
                      Transparent = True
                    end
                    object lblPesqRefFinal: TcxLabel
                      Left = 257
                      Top = 30
                      Caption = 'Ref.Final:'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clBlue
                      Style.Font.Height = -11
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = [fsBold]
                      Style.TextColor = 4210688
                      Style.TextStyle = []
                      Style.IsFontAssigned = True
                      Transparent = True
                    end
                    object lblPesqRefSituacao: TcxLabel
                      Left = 391
                      Top = 30
                      Caption = 'Situa'#231#227'o:'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clBlue
                      Style.Font.Height = -11
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = [fsBold]
                      Style.TextColor = 4210688
                      Style.TextStyle = []
                      Style.IsFontAssigned = True
                      Transparent = True
                    end
                    object lblPesqBoleto: TcxLabel
                      Left = 7
                      Top = 30
                      Caption = 'Fatura:'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clBlue
                      Style.Font.Height = -11
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = [fsBold]
                      Style.TextColor = 4210688
                      Style.TextStyle = []
                      Style.IsFontAssigned = True
                      Transparent = True
                    end
                    object edtBoletoNumPesquisa: TcxTextEdit
                      Left = 48
                      Top = 28
                      TabOrder = 4
                      OnKeyDown = edtBoletoNumPesquisaKeyDown
                      OnKeyPress = edtBoletoNumPesquisaKeyPress
                      Width = 61
                    end
                    object cbxBoletoRegMesIni: TcxComboBox
                      Left = 168
                      Top = 28
                      Properties.DropDownListStyle = lsFixedList
                      Properties.OnChange = cbxBoletoRegMesIniPropertiesChange
                      Style.TextColor = clNavy
                      TabOrder = 5
                      Width = 81
                    end
                    object cbxBoletoRegMesFim: TcxComboBox
                      Left = 306
                      Top = 28
                      Properties.DropDownListStyle = lsFixedList
                      Properties.OnChange = cbxBoletoRegMesFimPropertiesChange
                      Style.TextColor = clNavy
                      TabOrder = 6
                      Width = 81
                    end
                    object icxSituacaoBoleto: TcxImageComboBox
                      Left = 440
                      Top = 28
                      RepositoryItem = dtmLookup.Combo_SituacaoBoleto
                      Properties.Items = <>
                      Properties.OnChange = icxSituacaoBoletoPropertiesChange
                      TabOrder = 7
                      Width = 113
                    end
                    object rdbPesquisaBoleto: TRadioButton
                      Left = 8
                      Top = 6
                      Width = 125
                      Height = 17
                      Caption = 'Pesquisar por Boleto'
                      TabOrder = 8
                      OnClick = rdbPesquisaBoletoClick
                    end
                    object rdbPesquisaReferencia: TRadioButton
                      Left = 132
                      Top = 6
                      Width = 189
                      Height = 17
                      Caption = 'Pesquisar Referencia e Situa'#231#227'o'
                      Checked = True
                      TabOrder = 9
                      TabStop = True
                      OnClick = rdbPesquisaReferenciaClick
                    end
                  end
                end
              end
              object cxTabSheet4: TcxTabSheet
                Caption = 'Remessas/Retornos'
                ImageIndex = 1
                object cxGrid2: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 653
                  Height = 308
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = ''
                  object cxGridDBTableView4: TcxGridDBTableView
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
                    DataController.DataSource = dtsRetornoRemessa
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = 'Qtd.: 0'
                        Kind = skCount
                        FieldName = 'calc_Nome'
                      end
                      item
                        Format = 'Total: ,#0.00'
                        Kind = skSum
                        FieldName = 'VALOR'
                      end>
                    DataController.Summary.SummaryGroups = <>
                    Filtering.MRUItemsListCount = 5
                    Filtering.ColumnPopup.MaxDropDownItemCount = 10
                    Images = dtmControles.imgCadBasicos
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
                    Styles.GroupByBox = dtmControles.cxStyle7
                    object cxGridDBTableView4Column1: TcxGridDBColumn
                      Caption = 'C'#243'digo'
                      DataBinding.FieldName = 'BOLETA_REMESSA_RETORNO_ID'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 47
                    end
                    object cxGridDBTableView4Column2: TcxGridDBColumn
                      Caption = 'Data'
                      DataBinding.FieldName = 'DATA'
                      PropertiesClassName = 'TcxDateEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 81
                    end
                    object cxGridDBTableView4Column3: TcxGridDBColumn
                      Caption = 'Tipo do Arquivo'
                      DataBinding.FieldName = 'TIPO'
                      PropertiesClassName = 'TcxImageComboBoxProperties'
                      Properties.Images = dtmControles.imgCadBasicos
                      Properties.Items = <
                        item
                          Description = 'Remessa'
                          ImageIndex = 44
                          Value = '1'
                        end
                        item
                          Description = 'Retorno'
                          ImageIndex = 45
                          Value = '2'
                        end>
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 99
                    end
                    object cxGridDBTableView4Column4: TcxGridDBColumn
                      Caption = 'Qtd Remessa'
                      DataBinding.FieldName = 'QTD_REG_REMESSA'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 73
                    end
                    object cxGridDBTableView4Column5: TcxGridDBColumn
                      Caption = 'Qtd Registrados'
                      DataBinding.FieldName = 'QTD_REG_CONFIRMADO'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 76
                    end
                    object cxGridDBTableView4Column6: TcxGridDBColumn
                      Caption = 'Qtd Pago'
                      DataBinding.FieldName = 'QTD_REG_PAGO'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 56
                    end
                    object cxGridDBTableView4Column8: TcxGridDBColumn
                      Caption = 'Qtd Baixado'
                      DataBinding.FieldName = 'QTD_REG_BAIXADO'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 77
                    end
                    object cxGridDBTableView4Column7: TcxGridDBColumn
                      Caption = 'Arquivo'
                      DataBinding.FieldName = 'NOME_ARQUIVO'
                      Options.Editing = False
                      Options.Focusing = False
                      Width = 142
                    end
                  end
                  object cxGridLevel6: TcxGridLevel
                    GridView = cxGridDBTableView4
                  end
                end
              end
            end
          end
          object tabRegistroAutomatico: TcxTabSheet
            Caption = 'tabRegistroAutomatico'
            ImageIndex = 1
            object tabConfimacaoBoletos: TcxTabControl
              Left = 0
              Top = 0
              Width = 1006
              Height = 332
              Align = alClient
              TabOrder = 0
              Properties.CustomButtons.Buttons = <>
              Properties.TabIndex = 1
              Properties.Tabs.Strings = (
                'Faturas Pagas'
                'Confirma'#231#227'o de Envio/Outro'
                'Baixas Decurso Prazo/Outro')
              OnChange = tabConfimacaoBoletosChange
              ClientRectBottom = 332
              ClientRectRight = 1006
              ClientRectTop = 24
              object cxGridRetorno: TcxGrid
                Left = 0
                Top = 24
                Width = 1006
                Height = 308
                Align = alClient
                TabOrder = 0
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
                      FieldName = 'VALOR_DOCUMENTO'
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
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      FieldName = 'VALOR_PAGO'
                      Column = cxGridRetornoDBTableView1VALOR_PAGO
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
                    Width = 43
                  end
                  object cxGridRetornoDBTableView1SELECIONAR: TcxGridDBColumn
                    Caption = 'Selecionar?'
                    DataBinding.FieldName = 'SELECIONADO'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.DisplayGrayed = 'False'
                    Properties.ValueChecked = 'True'
                    Properties.ValueUnchecked = 'False'
                    Properties.OnChange = cxGridRetornoDBTableView1SELECIONARPropertiesChange
                    HeaderAlignmentHorz = taCenter
                    Width = 59
                  end
                  object cxGridRetornoDBTableView1DATA_PAGAMENTO: TcxGridDBColumn
                    Caption = 'Data Pagamento'
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 93
                  end
                  object cxGridRetornoDBTableView1DATA_COMPENSACAO: TcxGridDBColumn
                    Caption = 'Data Entrada'
                    DataBinding.FieldName = 'DATA_CREDITO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 77
                  end
                  object cxGridRetornoDBTableView1NOME: TcxGridDBColumn
                    Caption = 'Associado/Grupo'
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 178
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
                    FooterAlignmentHorz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 52
                  end
                  object cxGridRetornoDBTableView1SITUACAO: TcxGridDBColumn
                    Caption = 'Situa'#231#227'o'
                    DataBinding.FieldName = 'SITUACAO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = dtmControles.imgCadBasicos
                    Properties.Items = <
                      item
                        Description = 'N'#227'o Identificado'
                        Value = ' '
                      end
                      item
                        Description = 'Ativo (Aguardando Pag.)'
                        ImageIndex = 3
                        Value = '1'
                      end
                      item
                        Description = 'Boleto Registrado'
                        ImageIndex = 2
                        Value = '2'
                      end
                      item
                        Description = 'Boleto Cancelado no Sistema'
                        ImageIndex = 4
                        Value = '3'
                      end
                      item
                        Description = 'Boleto Baixado'
                        ImageIndex = 46
                        Value = '4'
                      end
                      item
                        Description = 'Liquida'#231#227'o Confirmada'
                        ImageIndex = 30
                        Value = '5'
                      end>
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 94
                  end
                  object cxGridRetornoDBTableView1VALOR_TITULO: TcxGridDBColumn
                    Caption = 'Vlr. Documento'
                    DataBinding.FieldName = 'VALOR_DOCUMENTO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 66
                  end
                  object cxGridRetornoDBTableView1VALOR_PAGO: TcxGridDBColumn
                    Caption = 'Vlr. Pago'
                    DataBinding.FieldName = 'VALOR_PAGO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 63
                  end
                  object cxGridRetornoDBTableView1DIFERENCA: TcxGridDBColumn
                    Caption = 'Diferen'#231'a'
                    DataBinding.FieldName = 'DIFERENCA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 50
                  end
                  object cxGridRetornoDBTableView1VALOR_IOF: TcxGridDBColumn
                    Caption = 'Vlr. IOF'
                    DataBinding.FieldName = 'VALOR_IOF'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 44
                  end
                  object cxGridRetornoDBTableView1DESCONTO: TcxGridDBColumn
                    Caption = 'Desconto'
                    DataBinding.FieldName = 'DESCONTO'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 51
                  end
                  object cxGridRetornoDBTableView1JUROS_MORA: TcxGridDBColumn
                    Caption = 'Juros/Multa'
                    DataBinding.FieldName = 'JUROS_MORA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Width = 59
                  end
                  object cxGridRetornoDBTableView1NOSSO_NUMERO: TcxGridDBColumn
                    Caption = 'Nosso N'#250'mero'
                    DataBinding.FieldName = 'NOSSO_NUMERO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Options.Editing = False
                    Options.Filtering = False
                    Options.Focusing = False
                    Styles.Content = dtmControles.cxStyle21
                    Width = 75
                  end
                end
                object cxGridRetornoLevel1: TcxGridLevel
                  GridView = cxGridRetornoDBTableView1
                end
              end
            end
          end
        end
      end
      object tabRealizado: TcxTabSheet
        Caption = 'Movimenta'#231#227'o Realizada'
        Color = 14807280
        ImageIndex = 2
        ParentColor = False
        object cxGridRealizado: TcxGrid
          Left = 0
          Top = 49
          Width = 1006
          Height = 456
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          object cxGridDBTableView2: TcxGridDBTableView
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
            DataController.DataSource = dtsCompromissoRealizado
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'VALOR'
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'calc_ValorDevido'
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total = ,#0.00'
                Kind = skSum
                FieldName = 'VALOR_ATUAL'
                Column = cxGridDBColumn13
              end
              item
                Format = 'Qtd.: 0'
                Kind = skCount
                FieldName = 'COMPROMISSO_VENCIDO_ID'
                Column = cxGridDBColumn3
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
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            object cxGridDBTableView2Column1: TcxGridDBColumn
              Caption = 'Associado'
              DataBinding.FieldName = 'PESSOA_NOME'
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 222
            end
            object cxGridDBTableView2Column2: TcxGridDBColumn
              Caption = 'S'#243'cio'
              DataBinding.FieldName = 'calc_NaoAssociado'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = dtmControles.imgCadBasicos
              Properties.Items = <
                item
                  ImageIndex = 13
                  Value = 'True'
                end
                item
                  Value = 'False'
                end>
              GroupSummaryAlignment = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 43
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = 'Compromisso'
              DataBinding.FieldName = 'CONTABIL_CONTA_ID'
              RepositoryItem = dtmLookup.Lista_PlanoContasTodos
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 221
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = 'G.C.'
              DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              RepositoryItem = dtmLookup.Lista_BalanceteGrupoSigla
              GroupSummaryAlignment = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 51
            end
            object cxGridDBColumn10: TcxGridDBColumn
              Caption = 'Data de Realiza'#231#227'o'
              DataBinding.FieldName = 'DATA_REALIZACAO'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 98
            end
            object cxGridDBColumn11: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SITUACAO'
              RepositoryItem = dtmLookup.Combo_SituacaoPagamento
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 79
            end
            object cxGridDBColumn13: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VALOR_ATUAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 71
            end
            object cxGridDBColumn14: TcxGridDBColumn
              Caption = '#'
              DataBinding.FieldName = 'DIFERENCA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              RepositoryItem = dtmLookup.Combo_SimNaoDiferenca
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 21
            end
            object cxGridDBColumn15: TcxGridDBColumn
              Caption = '+'
              DataBinding.FieldName = 'QTD_ADICIONAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taBottomJustify
              Properties.DisplayFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 21
            end
            object cxGridDBColumn16: TcxGridDBColumn
              Caption = 'Refer'#234'ncia'
              DataBinding.FieldName = 'calc_referencia'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 70
            end
            object cxGridDBColumn17: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'calc_TipoDocumento'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = dtmControles.imgCadBasicos
              Properties.Items = <
                item
                  Description = 'Boleto'
                  ImageIndex = 51
                  Value = '1'
                end
                item
                  Description = 'Recibo'
                  ImageIndex = 47
                  Value = '2'
                end
                item
                end>
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 57
            end
            object cxGridDBColumn18: TcxGridDBColumn
              Caption = 'Numero'
              DataBinding.FieldName = 'calc_NumeroDocumento'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 50
            end
          end
          object cxGridLevel5: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 1006
          Height = 49
          Align = alTop
          BevelOuter = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 1
          object cxLabel4: TcxLabel
            Left = 5
            Top = 10
            Caption = 'Data Inicial:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 4210688
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel7: TcxLabel
            Left = 185
            Top = 10
            Caption = 'Data Final:'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 4210688
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object Panel11: TPanel
            Left = 449
            Top = 1
            Width = 556
            Height = 47
            Align = alRight
            BevelOuter = bvNone
            Color = 14807280
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #39
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            object btnReimprimirRecibo: TcxButton
              Left = 306
              Top = 3
              Width = 120
              Height = 25
              Cursor = crHandPoint
              Caption = 'Reimprimir Recibo'
              Colors.Default = clBlue
              Colors.Normal = 15513994
              Colors.Hot = 8421440
              Colors.Pressed = clGreen
              Colors.Disabled = clBtnFace
              Enabled = False
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Blue'
              TabOrder = 0
              OnClick = btnReimprimirReciboClick
            end
            object btnEstornarRecibo: TcxButton
              Left = 430
              Top = 3
              Width = 120
              Height = 25
              Cursor = crHandPoint
              Caption = 'Estornar Recibo'
              Colors.Default = clBlue
              Colors.Normal = 15513994
              Colors.Hot = 8421440
              Colors.Pressed = clGreen
              Colors.Disabled = clBtnFace
              Enabled = False
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Black'
              TabOrder = 1
              OnClick = btnEstornarReciboClick
            end
            object rdbReciboSelecionado: TcxRadioButton
              Left = 33
              Top = 9
              Width = 115
              Height = 17
              Caption = 'Recibo Selecionado'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object rdbReciboTodos: TcxRadioButton
              Left = 152
              Top = 9
              Width = 150
              Height = 17
              Caption = 'Todos Recibos do Per'#237'odo'
              TabOrder = 3
            end
            object lblReciboGerando: TcxLabel
              Left = 153
              Top = 28
              Caption = 'AGUARDE, GERANDO RECIBOS....'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.TextColor = clRed
              Style.TextStyle = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
              Visible = False
            end
          end
          object edtDataRealizadoIni: TcxDateEdit
            Left = 69
            Top = 7
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 3
            Width = 104
          end
          object edtDataRealizadoFim: TcxDateEdit
            Left = 240
            Top = 7
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 4
            OnKeyDown = edtDataRealizadoFimKeyDown
            Width = 104
          end
          object btnPesquisarRealizados: TcxButton
            Left = 348
            Top = 7
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
            TabOrder = 5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnPesquisarRealizadosClick
          end
        end
        object chxSelecaoMultipla: TcxCheckBox
          Left = 0
          Top = 505
          Align = alBottom
          Caption = 'Sele'#231#227'o Multipla (Exporta'#231#227'o)'
          Style.TextColor = clWindowText
          TabOrder = 2
          OnClick = chxSelecaoMultiplaClick
          Width = 1006
        end
      end
      object tbcRecibos: TcxTabSheet
        Caption = 'Recibos - Encaminhar Email'
        ImageIndex = 3
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1006
          Height = 49
          Align = alTop
          BevelOuter = bvLowered
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object Panel14: TPanel
            Left = 449
            Top = 1
            Width = 556
            Height = 47
            Align = alRight
            BevelOuter = bvNone
            Color = 14807280
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #39
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            object btnEnviarRecibo: TcxButton
              Left = 431
              Top = 15
              Width = 120
              Height = 25
              Action = CAD_ENVIAR_EMAIL
              Caption = 'Enviar Recibos'
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
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = btnEnviarReciboClick
            end
          end
          object cxLabel8: TcxLabel
            Left = 8
            Top = 6
            Caption = 'M'#234's Inicial'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 4210688
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel9: TcxLabel
            Left = 134
            Top = 6
            Caption = 'M'#234's Final'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 4210688
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel10: TcxLabel
            Left = 261
            Top = 6
            Caption = 'Ano'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 4210688
            Style.TextStyle = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object icxMesInicial: TcxImageComboBox
            Left = 8
            Top = 23
            RepositoryItem = dtmLookup.Combo_Meses
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.TextColor = clBlack
            TabOrder = 4
            Width = 121
          end
          object icxMesFinal: TcxImageComboBox
            Left = 134
            Top = 23
            RepositoryItem = dtmLookup.Combo_Meses
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.TextColor = clBlack
            TabOrder = 5
            Width = 121
          end
          object icxAno: TcxImageComboBox
            Left = 261
            Top = 23
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            StyleDisabled.TextColor = clBlack
            TabOrder = 6
            Width = 85
          end
          object btnPesquisarRecibos: TcxButton
            Left = 349
            Top = 21
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
            TabOrder = 7
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnPesquisarRecibosClick
          end
        end
        object cxGridRecibos: TcxGrid
          Left = 0
          Top = 49
          Width = 1006
          Height = 456
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          object cxGridDBTableView5: TcxGridDBTableView
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
            DataController.DataSource = dtsReciboAgrupado
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'VALOR'
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'calc_ValorDevido'
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total = ,#0.00'
                Kind = skSum
                FieldName = 'VALOR_RECIBO'
                Column = cxGridDBValorRecibo
              end
              item
                Format = 'Qtd.: 0'
                Kind = skCount
                FieldName = 'NOME_RECIBO'
                Column = cxGridDBAssociadoRecibo
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
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            object cxGridDBAssociadoRecibo: TcxGridDBColumn
              Caption = 'Associado/Grupo'
              DataBinding.FieldName = 'CALC_APRESENTANTE'
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 398
            end
            object cxGridDBColumn23: TcxGridDBColumn
              Caption = 'Data de Realiza'#231#227'o'
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 143
            end
            object cxGridDBValorRecibo: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VALOR_RECIBO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 234
            end
            object cxGridDBColumn30: TcxGridDBColumn
              Caption = 'Numero'
              DataBinding.FieldName = 'RECIBO_NUMERO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Header = cxStyle1
              Width = 100
            end
            object cxGridDBTableView5Column1: TcxGridDBColumn
              Caption = 'Encaminhar Email'
              DataBinding.FieldName = 'CALC_EMAIL'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = dtmControles.imgCadBasicos
              Properties.Items = <
                item
                  Description = 'N'#227'o Encaminhar'
                  ImageIndex = 7
                  Value = 'N'
                end
                item
                  Description = 'Encaminhado'
                  ImageIndex = 50
                  Value = 'S'
                end
                item
                  Description = 'Aguardando'
                  ImageIndex = 8
                  Value = 'A'
                end>
              Width = 129
            end
          end
          object cxGridLevel7: TcxGridLevel
            GridView = cxGridDBTableView5
          end
        end
      end
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblInformacaoLancamento: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = #168' Gerenciador de Recebimentos '#168
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = 4210688
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
      Height = 21
      Width = 1008
      AnchorX = 504
      AnchorY = 11
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = actGerarBoleto
                Caption = '&Gerar Boleto'
              end
              item
                Caption = '-'
              end
              item
                Action = actImprimir
              end
              item
                Caption = '-'
              end
              item
                Action = CAD_ENVIAR_EMAIL
              end>
            Caption = '&Op'#231#245'es do Boleto'
          end>
      end>
    Left = 12
    Top = 352
    StyleName = 'XP Style'
    object actGerarBoleto: TAction
      Category = 'Op'#231#245'es do Boleto'
      Caption = 'Gerar Boleto'
      OnExecute = actGerarBoletoExecute
    end
    object actImprimir: TAction
      Category = 'Op'#231#245'es do Boleto'
      Caption = 'Impress'#227'o em Lote'
    end
    object CAD_ENVIAR_EMAIL: TAction
      Category = 'Op'#231#245'es do Boleto'
      Caption = 'Enviar Boletos'
      OnExecute = CAD_ENVIAR_EMAILExecute
    end
  end
  object sqlAssociadosAtivos: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT NOME, PESSOA_ID, PESSOA_GRUPO_ID, SELECIONADO, CPF, SITUA' +
      'CAO, FATURA_TIPO'#13#10'FROM T_PESSOA'#13#10'WHERE SITUACAO IN ('#39'1'#39', '#39'3'#39')'#13#10'O' +
      'RDER BY NOME')
    ParamData = <>
    Params = <>
    BeforeEdit = sqlAssociadosAtivosBeforeEdit
    AfterPost = sqlAssociadosAtivosAfterPost
    Left = 12
    Top = 237
  end
  object dtsAssociadosAtivos: TDataSource
    DataSet = sqlAssociadosAtivos
    Left = 12
    Top = 268
  end
  object popMarcarGrupo: TPopupMenu
    Left = 12
    Top = 312
    object popMarcarDesmarcarGrupo: TMenuItem
      Caption = 'Marcar/Desmarcar Grupo Selecionado'
      OnClick = popMarcarDesmarcarGrupoClick
    end
  end
  object sqlCompromissos: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_COMPROMISSO_VENCIDO'#13#10'ORDER BY ANO_MES_REFERENCI' +
      'A, CONTABIL_CONTA_ID')
    ParamData = <>
    Params = <>
    AfterPost = sqlCompromissosAfterPost
    AfterScroll = sqlCompromissosAfterScroll
    OnCalcFields = sqlCompromissosCalcFields
    Left = 48
    Top = 236
    object sqlCompromissosCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlCompromissosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissosLANCAMENTO_COMPROMISSO_ID: TBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosRECIBO_NUMERO: TBCDField
      FieldName = 'RECIBO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosDIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlCompromissosQTD_ADICIONAL: TBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlCompromissosVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissosVALOR_ANTERIOR: TBCDField
      FieldName = 'VALOR_ANTERIOR'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoscalc_travado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_travado'
      Size = 1
      Calculated = True
    end
    object sqlCompromissosDATA_REALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_REALIZACAO'
    end
    object sqlCompromissosOBRIGATORIO: TStringField
      FieldName = 'OBRIGATORIO'
      Size = 1
    end
    object sqlCompromissosCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoscalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlCompromissosSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object sqlCompromissoscalc_ValorPagar: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'calc_ValorPagar'
    end
  end
  object dtsCompromissos: TDataSource
    DataSet = sqlCompromissos
    Left = 48
    Top = 268
  end
  object frxDBDatasetCompromisso: TfrxDBDataset
    UserName = 'frxDBDatasetCompromisso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'calc_referencia=calc_referencia'
      'ANO_MES_REFERENCIA=ANO_MES_REFERENCIA'
      'VALOR_ATUAL=VALOR_ATUAL'
      'QTD_ADICIONAL=QTD_ADICIONAL'
      'DIFERENCA=DIFERENCA'
      'COMPROMISSO_VENCIDO_ID=COMPROMISSO_VENCIDO_ID'
      'DESCRICAO=DESCRICAO'
      'PESSOA_NOME=PESSOA_NOME')
    DataSet = sqlCompromissoBoleto
    BCDToCurrency = False
    Left = 180
    Top = 352
  end
  object frxDBDatasetSocio: TfrxDBDataset
    UserName = 'frxDBDatasetSocio'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NOME=Nome'
      'PESSOA_ID=PESSOA_ID'
      'PESSOA_GRUPO_ID=PESSOA_GRUPO_ID'
      'SELECIONADO=SELECIONADO'
      'CPF=Cpf')
    DataSet = sqlAssociadoBoleto
    BCDToCurrency = False
    Left = 148
    Top = 352
  end
  object sqlAssociadoBoleto: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT NOME, PESSOA_ID, PESSOA_GRUPO_ID, SELECIONADO, CPF, FATUR' +
      'A_TIPO'#13#10'FROM T_PESSOA'#13#10'WHERE SITUACAO IN ('#39'1'#39', '#39'3'#39')'#13#10'ORDER BY NO' +
      'ME')
    ParamData = <>
    Params = <>
    AfterScroll = sqlAssociadoBoletoAfterScroll
    Left = 180
    Top = 236
  end
  object sqlCompromissoBoleto: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT CV.ANO_MES_REFERENCIA, CV.VALOR_ATUAL, CV.PESSOA_NOME,'#13#10' ' +
      '      CV.QTD_ADICIONAL, CV.DIFERENCA, COMPROMISSO_VENCIDO_ID,'#13#10' ' +
      '      CC.DESCRICAO'#13#10'FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOI' +
      'N T_CONTABIL_CONTA CC'#13#10'   ON CV.CONTABIL_CONTA_ID = CC.CONTABIL_' +
      'CONTA_ID'#13#10'WHERE CV.PESSOA_ID = :PESSOA_ID'#13#10'  AND CV.TIPO_OPERACA' +
      'O = '#39'C'#39#13#10'  AND CV.SELECIONADO = '#39'N'#39)
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    Params = <>
    OnCalcFields = sqlCompromissoBoletoCalcFields
    Left = 216
    Top = 236
    object sqlCompromissoBoletocalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoBoletoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlCompromissoBoletoVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoBoletoQTD_ADICIONAL: TBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoBoletoDIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlCompromissoBoletoCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoBoletoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlCompromissoBoletoPESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      Size = 120
    end
  end
  object dtsCompromissoBoleto: TDataSource
    DataSet = sqlCompromissoBoleto
    Left = 216
    Top = 272
  end
  object dtsAssociadoBoleto: TDataSource
    DataSet = sqlAssociadoBoleto
    Left = 180
    Top = 272
  end
  object popCompromissos: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 48
    Top = 312
    object popBoletaCancelar: TMenuItem
      Caption = 'Cancelar Fatura'
      ImageIndex = 33
      OnClick = popBoletaCancelarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popBoletaVisualizar: TMenuItem
      Caption = 'Visualizar/Imprimir Fatura'
      ImageIndex = 45
      OnClick = popBoletaVisualizarClick
    end
  end
  object sqlRegistrarCompromissos: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT C.ANO_MES_REFERENCIA, C.VALOR_ATUAL, C.BOLETA_ID,'#13#10'      ' +
      ' C.QTD_ADICIONAL, C.DIFERENCA, C.COMPROMISSO_VENCIDO_ID,'#13#10'      ' +
      ' C.PESSOA_ID, C.SITUACAO, C.BALANCETE_GRUPO_ID, C.CONTABIL_CONTA' +
      '_ID,'#13#10'       B.PESSOA_GRUPO_ID, PG.DESCRICAO AS GRUPO'#13#10'FROM T_CO' +
      'MPROMISSO_VENCIDO C'#13#10'     LEFT OUTER JOIN T_BOLETA B ON'#13#10'     C.' +
      'BOLETA_ID = B.BOLETA_ID'#13#10'     LEFT OUTER JOIN T_PESSOA_GRUPO PG ' +
      'ON'#13#10'     B.PESSOA_GRUPO_ID = PG.PESSOA_GRUPO_ID'#13#10'WHERE C.BOLETA_' +
      'ID = :BOLETA_ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BOLETA_ID'
        ParamType = ptInput
      end>
    Params = <>
    OnCalcFields = sqlRegistrarCompromissosCalcFields
    Left = 476
    Top = 248
    object sqlRegistrarCompromissoscalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlRegistrarCompromissosANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlRegistrarCompromissosVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlRegistrarCompromissosBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosQTD_ADICIONAL: TBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosDIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlRegistrarCompromissosCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlRegistrarCompromissosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosPESSOA_GRUPO_ID: TBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegistrarCompromissosGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
  end
  object dtsRegistrarCompromissos: TDataSource
    DataSet = sqlRegistrarCompromissos
    Left = 476
    Top = 280
  end
  object sqlBoletosRegistrados: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT B.BOLETA_ID, B.VALOR, B.PESSOA_ID,'#13#10'             B.PESSOA' +
      '_GRUPO_ID, B.DATA_EMISSAO,'#13#10'             P.NOME, G.DESCRICAO, B.' +
      'DATA_PAGAMENTO, '#13#10'             B.ANO_MES_BOLETO, B.SITUACAO,'#13#10'  ' +
      '           B.DATA_CANCELADO, B.BOLETA_COMPROMISSOS_ID'#13#10'FROM T_BO' +
      'LETA B'#13#10'  LEFT OUTER JOIN T_PESSOA P'#13#10'  ON B.PESSOA_ID = P.PESSO' +
      'A_ID'#13#10'  LEFT OUTER JOIN T_PESSOA_GRUPO G'#13#10'  ON B.PESSOA_GRUPO_ID' +
      ' = G.PESSOA_GRUPO_ID'#13#10'WHERE B.SITUACAO = '#39'2'#39#13#10'     AND B.CEDENTE' +
      '_ID = :CEDENTE_ID'#13#10'     AND B.ANO_MES_BOLETO = :ANO_MES_BOLETA'#13#10 +
      'ORDER BY P.NOME, G.DESCRICAO')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANO_MES_BOLETA'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlBoletosRegistradosAfterScroll
    OnCalcFields = sqlBoletosRegistradosCalcFields
    Left = 512
    Top = 248
    object sqlBoletosRegistradosBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlBoletosRegistradosVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlBoletosRegistradosPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 3
    end
    object sqlBoletosRegistradosPESSOA_GRUPO_ID: TBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlBoletosRegistradosDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object sqlBoletosRegistradosNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlBoletosRegistradosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlBoletosRegistradosDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlBoletosRegistradoscalc_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome'
      Size = 120
      Calculated = True
    end
    object sqlBoletosRegistradosANO_MES_BOLETO: TStringField
      FieldName = 'ANO_MES_BOLETO'
      Size = 10
    end
    object sqlBoletosRegistradoscalc_DataSituacao: TSQLTimeStampField
      FieldKind = fkCalculated
      FieldName = 'calc_DataSituacao'
      Calculated = True
    end
    object sqlBoletosRegistradosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlBoletosRegistradosDATA_CANCELADO: TSQLTimeStampField
      FieldName = 'DATA_CANCELADO'
    end
    object sqlBoletosRegistradoscalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlBoletosRegistradosBOLETA_COMPROMISSOS_ID: TStringField
      FieldName = 'BOLETA_COMPROMISSOS_ID'
      Size = 260
    end
  end
  object dtsBoletosRegistrados: TDataSource
    DataSet = sqlBoletosRegistrados
    Left = 512
    Top = 280
  end
  object popBoletos: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 84
    Top = 312
    object popEstornarRegistro: TMenuItem
      Caption = 'Estornar Registro da Fatura'
      OnClick = popEstornarRegistroClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popRecuperarBoleto: TMenuItem
      Caption = 'Recuperar Boleto Cancelado'
      Enabled = False
      OnClick = popRecuperarBoletoClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mniRefazerLivroCaixa: TMenuItem
      Caption = 'Refazer Lan'#231'amentos Livro Caixa'
      OnClick = mniRefazerLivroCaixaClick
    end
  end
  object frxReportNAoAss: TfrxReport
    Version = '6.8.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38715.516369351900000000
    ReportOptions.LastChange = 39779.901028530100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 388
    Datasets = <
      item
        DataSet = frxDBDatasetCompromisso
        DataSetName = 'frxDBDatasetCompromisso'
      end
      item
        DataSet = frxDBDatasetSocio
        DataSetName = 'frxDBDatasetSocio'
      end>
    Variables = <
      item
        Name = 'TituloRelatorio'
        Value = 
          #39'Cobran'#231'a - BANCO DO BRASIL - Sacado: PROTRAUMA SERVI'#199'OS MEDICOS' +
          ' S/C LTDA'#39
      end
      item
        Name = 'NomeBanco'
        Value = #39'BANCO DO BRASIL'#39
      end
      item
        Name = 'CodigoBanco'
        Value = #39'001-9'#39
      end
      item
        Name = 'LocalPagamento'
        Value = #39'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'#39
      end
      item
        Name = 'DataVencimento'
        Value = #39'04/01/2006'#39
      end
      item
        Name = 'NomeCedente'
        Value = #39'REAL LIMP COM. DE MAT. DE LIMP. LTDA'#39
      end
      item
        Name = 'AgenciaCodigoCedente'
        Value = #39'03884-9 / 000000014684-6'#39
      end
      item
        Name = 'DataDocumento'
        Value = #39'20/12/2005'#39
      end
      item
        Name = 'NumeroDocumento'
        Value = #39'005423/1-1'#39
      end
      item
        Name = 'EspecieDocumento'
        Value = #39'DM'#39
      end
      item
        Name = 'Aceite'
        Value = #39'N'#39
      end
      item
        Name = 'DataProcessamento'
        Value = #39'16/07/2006'#39
      end
      item
        Name = 'NossoNumero'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'Carteira'
        Value = #39'17'#39
      end
      item
        Name = 'EspecieMoeda'
        Value = #39'R$'#39
      end
      item
        Name = 'ValorDocumento'
        Value = #39'88,08'#39
      end
      item
        Name = 'Instrucoes'
        Value = #39#13#10'PROTESTAR AP'#211'S 7 DIAS DO VENCIMENTO.'#13#10#39
      end
      item
        Name = 'SacadoNome'
        Value = #39'PROTRAUMA SERVI'#199'OS MEDICOS S/C LTDA'#39
      end
      item
        Name = 'SacadoCPFCGC'
        Value = #39'CNPJ: 00.588.915/0001-60'#39
      end
      item
        Name = 'SacadoRuaNumeroComplemento'
        Value = #39'AVENIDA BRASIL 3114,    '#39
      end
      item
        Name = 'SacadoCEPBairroCidadeEstado'
        Value = #39'42850-000    CENTRO    DIAS D'#39#39'AVILA    BA'#39
      end
      item
        Name = 'CodigoBaixa'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'LinhaDigitavel'
        Value = #39'00190.00009 01051.039004 00001.806173 5 30110000008808'#39
      end
      item
        Name = 'CodigoBarra'
        Value = #39'00195301100000088080000001051039000000180617'#39
      end>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clNavy
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 8.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 737.008350000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Width = 536.693260000000000000
          Height = 64.252010000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CENTRO ESP'#205'RITA BENEFICENTE UNI'#195'O DO VEGETAL'
            'N'#250'cleo Rei Inca - 8'#186' Regi'#227'o')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 3.779529999999991000
          Width = 105.826840000000000000
          Height = 79.370130000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765B4DE0000FFD8FFE000104A46494600010101012C01
            2C0000FFDB0043000302020302020303030304030304050805050404050A0707
            06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
            1816141812141514FFC0000B08022B02C101011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00FD53A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A293AD2D7C5BFB567EDD5
            E25FD9E3E3FF0086FC0D178774B9341BF5B3BBB8D52F1E4690DB49318E5D8AA5
            42B2EC7C13B8742476AFB454E403EB515E45E7DA4F1EE29BD197729C1191D457
            E60FFC129BE20F897C43F1B7C71A5F8835FD4F5865D18CAABA85E493ED64B88D
            491BC9C7DFAFD44AF8E3FE0A9DE38D5FC0DFB3B6953E89AADE68FA85D7886DED
            C5C585C3C1285F2677237290719415E97FB086A5ABEB3FB28780B50D7B53BDD6
            355BA82E2696F750B879E6901B994A6E77249C2ED039E0002BDF2BE42F8A7FB7
            9CFF000EFF006AFD3BE0ED978423D7D2F27B0B26BC8EF8C32C13DC953CAEC60C
            AAB221EA3BF35F5ED14514514514514514514514514514514514514514514514
            5145145145145145145145145145145145145145145145145145145145145145
            145791FED6561E28BEFD9E3C6EDE0CD5EF744F125AD835E5ADD69F21498F9444
            8E8A4720B22B28C60E48AF9B3FE0945F1C6FFE207C3CF14F8475ED4EE353D674
            5BEFB7453DE4CD24B25BCF927E6624B6D915C93FF4D057DDF5F99DFF00058DF0
            6ED97E1C78B628F9C5D6993C98F4D92443FF004757DEBF01BC65FF000B0FE0AF
            81BC485FCC9752D1AD6E2639CFEF4C4BE60FC1B70FC2BBA71953F4AFC9CFF826
            D9FF00847BF6E0F1E699F777586A769B7FDCBC85BFF64AFD65AFCF8FF82C56A9
            E57C2FF00E9D9FF5FABCD718F5F2E12BFF00B52BEA6FD8FB4BFEC8FD977E1741
            8DBBF40B49F1FF005D23127FECD5EC04E0135F927FB378FF0085F3FF000537D6
            FC4EDFE9361A7EA3A8EA8ADD7F7308305B9FC0B43F957EB6D78DFED79F17FF00
            E147FECF5E2FF13C13F91AA2DA9B4D3981C37DAA6FDDC6CBEEA5B7FD10D790FF
            00C1343E22FC4BF8ABF08F59D7FC7DAF4BAE58ADF0B2D224BA8904DB635CCACD
            2000C80B3AA82D93946E6BEC2A28A28A28A28A28A28A28A28A28A28A28A28A28
            A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
            28A2BF35BFE0A15F15BE2D7C03FDA2BC13E2AB2F11DF4DE052D1DE586931B795
            6C658B0B716F28503CCDCAD9DCF9204A40C6DAFD0AF00F8DB4BF891E0AD13C51
            A2CE2E34BD5AD23BBB77EFB5D41C11D987423B10456EC91ACB1B23A864604152
            3208AFC88F82B237EC7BFF00051CBCF0ACAC6D740D4AFE4D214138536B74564B
            439E9C318327B61ABF5E6BE46FF82A3F82FF00E12AFD94753BF54DF2E83A8DAE
            A4B81CE0B981BF49C93F4A97FE097DE34FF84AFF0064ED1EC9A4F326D0AFEEB4
            D724F206FF003947E0B3A8FC2BEB3AFC9AFD93CFFC23FF00F0540F1869FF0075
            65D5B5FB751EAA1E571FA20AFD66AFCCBFF82CAEA7BEEBE1569CA7EEAEA33B8F
            A9B655FE4D5FA03F05B4CFEC5F83DE06D3F1B7EC9A158C18F4DB022FF4A8FE37
            F8D87C38F83DE34F13EFF2E4D2B48BABA88FAC8B13141F52DB47E35F9FFF00F0
            474F0519B53F88DE32990E523B7D2E090F7DC5A59467FE030FE75FA6F5F98BFF
            000572F8A33EB9E26F04FC2AD299AE248FFE26B776F17CC5E69098ADD303F880
            F34E3FE9A2D7DF1FB3EFC2E83E0BFC17F08F836154126976091DC32747B86F9E
            671F5919CFE35E85D2BF3BBC45FB6EFC45F1A7EDC965E00F85B2D96A1E1786E9
            748B8B5BB804904E6325AEAE8BAE1D4200E0156C11183839C57E880A5A28A28A
            28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A2A2BB9FECB6B34DE5BCBE5A17F2E21966C0CE0
            0EE4D7C97FB387FC142341F8F5F1A35DF025CE893785645CFF0062FDBDF13DD9
            8F3E6C72AF48E4C0DC1013C2B027239FAE6BC37F6CCF8071FED0FF000235CF0F
            430ABEBB68BFDA1A4487A8BA8C1DA99EC1D4B467FDFCF6AF94FF00E0937F1F24
            6B4D6FE0EEBB2B477760D26A1A424F90C10B7FA44001E85588703AFCD21ED5FA
            3D5F98FF00F0577F85F2E93AFF0081FE2869AAD0C8F9D22EE78BE5292A132DBB
            647F111E70CFFB0B5F7AFECF7F1422F8CDF057C1FE328D95A4D534F8DEE42744
            B85F92651F4915C7E14EFDA0FC19FF000B0BE06F8F3C3A23F326D4345BA8615C
            67F7BE5318CFE0E14FE15F0A7FC11C7C67FBAF88FE12964FBAD6BA9C11E7D77C
            729FD21AFD2CAFC99F01FF00C537FF000572BA53F28975FD4323D7CEB398FF00
            3715FACD5F945FF057ABC7D43E36F807488FE691346F3557DE4B8751FF00A2EB
            F54F4BB34D3B4CB4B58FFD5C11244BF40001FCABE51FF82A278E3FE112FD94B5
            4B049364FE20D42D74D5C1E768633B7E1B6120FF00BDEF4EFF00825EF81FFE11
            1FD94749BE78FCB9F5FBFBAD4DF239C6EF253F02B0823EB5F58DD5D45656D35C
            4F22C3044864924738555032493D8015F91BFB38DB4BFB607FC142F52F1C5E46
            D3E87A65EC9AD8120E16080AC76487B672212477DAD5FAEF5F397EDE3FB430FD
            9F3E046A575617221F146B7BB4CD242B61D1D94EF987FD734C907FBC501EB5E0
            DFF04A0FD9E4F873C21A97C57D6AD88D4F5DDD67A579A3E68ED15BF7920CF791
            D71F48F3D1ABF41ABCA3F685FDA5BC19FB3478734ED5FC5D713EDD42ED6D6DAD
            2CD0493C9C8F3240A48F9514E58FB81D5803DDF827C6BA27C46F0AE9BE24F0E6
            A316ABA26A3179D6D770E76C8B920F0704104104100820820115B94514514514
            5145145145145145145145145145145145145145145145145145145145145145
            14514514514514514514515F97DFF0527FD9AB50F863E35B3F8EFE0112E9E1AF
            239B5536636B59DE86063BB5C740EC006FF6F079DE71F687EC81FB4AE9FF00B4
            D7C24B3D755A283C4365B6D359B1438F26E00FBEA3AEC71F32FE2B9254D7B8D7
            E48FEDBFE04D57F646FDAD741F8B7E1287C8D3758BBFED58D53E58C5D29C5DC0
            D8E8B2062C7D44AE07DDAFD4CF877E3BD2BE27781B43F15E89379FA5EAF691DD
            C0DDC06192ADE8CA72A476208AF35FDB33E137FC2E6FD9C3C67E1F861F3B528E
            D0DFD80032DF6883F788ABEEDB4A7D1CD7CB9FF0483F8B3FDA9E0BF16FC3BBB9
            B33E9570BAA59231E4C32FCB2A8F657553F596BF43986E047AD7E4A7EC587FE1
            49FF00C1457C4DE0B3FB8B5BC9F55D16353C2944733C47F1102E3FDEF7AFD6CA
            FC99F887FF0014E7FC15C6CD87CAB36BDA6E0FAF9D69083FAB9AFD66AFC99FF8
            2851FF0084ABF6F6F03691F7F6C3A4D86DFF007EE9DB1FF916BF59546140F6AF
            CC7FF82C578D4DC6B1F0E7C1B0B92D1C571AA4F10FE2DECB14471FF009BF3AFD
            04F829E0A1F0E3E10F833C31B023E93A45ADA48077916250E7EA5B71FC6BC6FF
            00E0A23F17BFE152FECC5E2216F3795AAF8871A25A60E1BF7A0F9A477E225939
            EC4AD79AFF00C1277E10FF00C21DF03F52F1ADDC3B2FFC55784C2CC39FB24059
            13E9990CC7DC6D35F711214127802BF1FF00E38F88350FDBF7F6D8D37C1BA05C
            BBF84B4C9DB4FB7B888E523B58DB75D5D8ED972A769EE0443AD7EB7F873C3DA7
            F84BC3FA6E89A55B259E99A75BC7696D6F18F9638D142AA8FA002A0F18F8BB49
            F00F85B54F116BB7B1E9FA469B6EF73737329E111464FD4F600724900726BF22
            F49B2F147FC14CFF006AF96EEE85CE9DE08D348320078D3F4E563B6307A79D29
            CF3CF258F2A981FAF9E1CF0EE9BE12D074FD1747B38B4FD2F4F812DAD6D61184
            8A34002A8FA015A3451451451451451451451451451451451451451451451451
            4514514514514514514514514514514514514514514565F8A21D5A7F0DEA91E8
            1716D69ADBDB48B633DEC6648239F69D8CEAA412A1B1900F4AFCBFFD9F3F6CEF
            883FB37FC77D7FC09F1E2EEFAEAC350D419AF2EEF4977D3A77C6268C8E0DBB0D
            A76AFCA170C83A86FD4EB3BC8351B486EAD668EE6DA7459229A260C9221190CA
            4704107208AA3E28F0CE99E33F0EEA5A16B3671EA1A56A36EF6D756D30CAC91B
            02181FC0F5ED5F90D049E25FF82677ED6CD1BFDA750F046A4793DAFF004D76E0
            FA79D11FA7CCA7A2BF3FAF7E1BF1169BE2ED034FD6F47BC8AFF4AD4204B9B5BA
            84E5258DC06561F506BC97F6C3F80B0FED11F02B5DF0D471236B702FDBF4891B
            194BB8C12AB9EC1C168C9EC1C9ED5F23FF00C1277E3D4B07F6EFC1BD7A5786EA
            D1E4D43488E7CAB2F38B98307A10D8902F5E653DABF48C8C820F7AFC86F0B93F
            B1BFFC14A24D3CFF00A1F86F53D48DA81F763FB0DF61A2E7FBB1BB264FFD3135
            FAF20E457E4A7ED703FE148FFC149BC3BE2E1FE8F677D79A56B0E4700C595827
            FCFCA933F535FAD60E403EB5F935FB5B0FF847BFE0A77E0ED47EE89355D06E49
            F5024890FE895FACA39AFC99F8F47FE128FF0082AFE83663E74B3D7B445C76C4
            715BCAC3F3CD7EB3D7E497ED127FE17CFF00C14EB45F0D2FFA4E9FA7EA7A7E98
            CBD7F730813DC0FC09987E15FAD8060015F949FF000534F19DFF00C67FDA5BC1
            DF08F407FB43E9A61B5F294F06FAED93838ECB1F93CF6DCD5FA79F0FBC1961F0
            EBC0DA0785F4C4D961A3D8C3630F18256340B93EE7193EE4D7CE9FF0517FDA23
            FE1477C0ABAD374CB9F27C51E290FA6D96C6C3C30E3F7F30F4DAAC1411C86914
            F6AE0BFE095FFB3BFF00C2BFF86173F11B57B6D9AE78A942D9F98BF34360A72A
            47A79AC37FBAAC66BEE8E95F95BFF050AFDA3755F8F9F1374FF817F0E7CCD4EC
            A0BE4B7BD16873FDA17FBB022CFF00CF388F5278DC093C2035F76FECA5FB38E9
            5FB33FC27B0F0D5A08EE7589B173ABEA2ABCDCDC91CE0F5D8BF7547A0CF5273E
            CB5F1AFEDD7FB785BFECF56C3C25E0D92DB51F8837015E53201243A644704348
            BDE461F750F40771E3686FA27E01F8FF005DF8A3F08FC37E27F12F8725F0AEB3
            A8DB0967D3A539C7A3A8EAAAE30C15BE601B07D4FA0D14514514514514514514
            5145145145145145145145145145145145145145145145145145145145145145
            1452060490082475A5AF9A7F6D6FD8EB4AFDA7FC19F69B15874EF1DE97131D33
            51618132F27ECF311D509CE0F54272382C1BE47FD863F6C3D5BE0378B1FE0AFC
            5C33E99A6DBDC9B3B2BBD40ED7D267CE3C8949FF00962C7A3745CE73B0E57F53
            5583A8652083C822BC27F6C7FD99EC3F69BF84977A3058A0F12E9FBAEF45BD7E
            3CB9C0E6363FDC900DADE9F2B609515F1DFF00C134FF00698BFF0087DE2CBBF8
            11E3C696C185D4B16902F3E56B4BB0C7CDB36CF40CC0951FDFDC392E31FA775F
            929FB76780355FD947F6ACD03E2FF8462FB3D86B177FDA88106235BC423ED30B
            63F86556DC7D7CC900E95FA8BF0D7C7FA57C54F00E83E2DD125F3B4CD5ED12EA
            139E5770E51BD194E548EC4115F9FF00FF00057FF852C6D7C15F12ECA222481D
            B45BE953AE0EE96DCF1D3044C33FED2D7DA3FB2DFC565F8D5F00BC19E2C6944B
            7B7762B15E9CF3F6A8F31CD9F4CBA311EC457C3FFF00058DF06F9779F0E3C5B1
            272C975A64EF8E98292443FF001E9BF2AFBF3E06F8CBFE161FC1AF047894BF99
            26A9A3DADD4A739C48D129707DC36E1F857E69FF00C14ABFE29EFDB6BC07AA7D
            D074ED36EB77BA5E4C3FF6415FAC69CA8FA57E4D7873FE2AEFF82B94A7EFF93A
            FDCFE1F67B37FE5E557EB0DDDCC7656B35C4CE238624323BB1C05503249AFC9D
            FF008275DB49F18FF6DCF187C42B942CB6D1EA1AB8761F765B99762AFB7C92C9
            FF007CD7EA978B3C4D63E0BF0BEAFAFEA72F91A7697692DEDCC9FDD8E342EC7F
            206BF2BFFE09E3E19BEFDA17F6BDF157C57D762F363D2DE7D51B77CCAB7772CC
            B0A0F654F348F4F2D6BF58A79E3B68649A5758E28D4B3BB9C05039249EC2BF1F
            3C4D777BFF000512FDB8E1D3AD2495BC13612185244240874B81B324BECD2B13
            83D419501FBB5FAFDA6E9B6BA3E9D6B61650476B676B12C10C112ED48D1400AA
            07600002BE4CFF0082877ED6CBF003E1E7FC235E1EBB09E3BF10C2C96ED1B7CF
            616C72AF707D18F2A9EF93FC183C07FC1323F6496F03F87D7E2CF8B2D0FF00C2
            47ACC27FB2209D7E6B4B471CCC73D1E51D3B84FF007C81F7DD7C97FB74FEDB56
            1FB37F871FC3DE1D9A1BEF889A8C398213874D3A33C79F28F5FEE21EA793C0C1
            F9F3F609FD89AFFC7FAD45F1A3E2D4536A02EA6FB7E97A76A59792F6563BBED7
            386E4AE79553F7BEF1F971BBF4D80C0A5A28A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A290F438EB5
            F939F193C67FB417EC4BFB476A9E3BD67527F14787FC4577BA49F0C34ED4211F
            7202993F679113851D400705D7767F42FF00675FDA63C1BFB4B783D759F0C5E7
            977B08517FA45C301736521ECCBDD4F3B5C7071D88207ACD7C81FB79FEC496BF
            B43F87A4F15785ADE2B5F889A6C3F26308BAA44A3FD4B9E81C7F039FF74F0415
            F18FF827CFEDB777A46A16DF063E28CF2D9DF5AC9F61D1B51D4329246EA76FD8
            A7DDC8208DA84FFB87F86BF49ABF383FE0A7DFB2CDC44F17C6EF064325BEA164
            D1FF006EA5A655C6D204578B8E432E15588EC11B8DAC6BE8CFD85FF6A783F696
            F85311D4668D7C69A22A5AEAF00C0329C7C972A3FBB200738E8C1874C67ADFDA
            EBE0441FB447C0CD7FC2EB1A1D6113EDBA4CAFC797771825067B0605A327B073
            5F1DFF00C127FE3BCFA7DDEBDF067C4123C17303C97FA4C571F2B23038B9B7C1
            E841FDE05FFAEA6BED2FDAA7E140F8D5F003C67E144884B7D7362D3588C73F6A
            8B12438F4CBA2A9F6635F19FFC1203E2BB3D878D3E1ADECA4496D22EB5631B1E
            769DB14E3D8022138F576AF67FF82A5F82FF00E128FD94F50D4563DF2E81A9DA
            EA2081C85663037E189F27E9ED573FE0987E34FF0084B3F64CD0ED1A4F326D0A
            F6EB4C724F3FEB3CE507E89328FA015F29FF00C15F6D1AD3E34780B524F95DF4
            63186F74B876FF00D9EBF5534DBB5BED36D6E53EE4D12C83E84035F943FB240F
            F84A7FE0A75E2FD547CEB0EA9AF5DA9F452F2C63F4900AFD04FDB0FC71FF000A
            F3F663F88DAC893CA986932DA42F9C15967C40847B86901FC2BE57FF00823C78
            1FEC3F0EFC77E2E923C3EA5A943A746CC39DB047BCE3D89B8FFC77DABBDFF82A
            87C5EFF8407F67A4F0C5A4FE5EA7E2DBB169B54E185AC7892661F53E521F690D
            741FF04D2F843FF0AC3F666D2B51B983CAD57C532B6B13961F30898058173E9E
            5AAB8F790D61FF00C14DFF00688FF854BF05CF8474AB9F2FC49E2F0F69FBB6F9
            E0B21C4EFEDB81118F50EC47DDA3FE098FFB3BFF00C2A5F8303C5DAADB797E24
            F1784BBFDE2FCF0590E604F6DC0990FA87407EED7D1BF1CBE32E85F013E1A6B1
            E32F104B8B4B18F10DBAB0125D4E788E14FF00698FE4324F00D7E627ECA5F07B
            C41FB767ED11ACFC52F88686EBC2D617827BB8D81F26E251830D9460FF00CB34
            5DBB873F2800F2F9AFD768E358A35445088A30AAA3000F4AF9A3F6D6FDB2B49F
            D987C23F63B068752F1EEA711FECED398E5605E47DA2603A2039C0EAE4607018
            8F923F621FD8E359FDA03C58FF001A3E2FFDA352D2EE6E4DE59DA6A1CBEAF367
            3E7480FF00CB00470BD1B006360C37EA7222C48A88A151460281800555D5F58B
            1F0FE9775A96A779069FA7DAC6D34F7573208E38900C96663C0007735F9C7F19
            BFE0A67E26F167C59D0FC29F02F476D6AD21BF4124D25A9925D6483CC31A6331
            C44672FC3F7F94039FD1CD1EEEE6FF0048B2B9BCB26D3AF2681249ACDDD5DA07
            2A0B465949562A72320E0E38AB94514514514514514514514514514514514514
            51451451451451451451451451451451451451451451451587E34F04E85F117C
            337FE1EF126976FAC68D7D198E7B4B94DCAE3B1F5041E430C104020822BF2A3F
            681FD93FE227EC37E385F89FF09F53BEB9F0AC121637117CF358213CC37498C4
            909E06E231D0300704FDA9FB1F7EDCDE18FDA6B4B8B49BEF27C3FE3E823CDC69
            2CF84BA00732DB13CB2F7287E65E7A81B8FD3F5F09FF00C1423F6185F8AD6375
            F123C056413C6D671EFD434FB75C1D52351F7940FF0096EA071FDF031D42E697
            FC13D7F6E73F10ADED3E187C43BD29E2EB55F2B4BD4EE9B0751451FEAA427FE5
            B281C13F7C0E7E60777DE1A969B6BACE9D75617D6F1DDD95D44D0CF6F3286492
            360432B03C1041208AFC7FF897E16F11FF00C136BF6AFB0F12787926B9F056A4
            EF25AC6CC76DD59330F3ACDDBFBF1FCB8273D237EE457EB4F803C75A37C4DF06
            691E29F0FDDADF68FAADBADCDBCCBD4A9EAAC3B3039523A82083D2BF2E3F6F9F
            879AAFECB7FB52787BE3178423FB3596AF76352528311A5F211F688DB1FC32A9
            DC73F7B7C83A0AFD3EF85FF10F4AF8B5F0F340F17E8B2799A6EB168973182725
            091F346DFED2B0653EEA6BF2BB5F07F637FF008294A5E0FF0043F0D6A7A90B83
            FC31FD86FB224FF80C4ECF8FFAE22BF4D7F689F068F887F023C7BE1E58FCD96F
            F45BA8E05C67F7C23668CFE0E14D7C37FF000471F19E6CFE23F84A5931E5C96B
            A9C099EBB83C729FFC761FCEB33FE0B2961E56B7F0AEFB1FEB60D46127FDC6B7
            3FFB3D7E887C2BD43FB53E15F846FB3BBED1A35A4D9F5DD0A9FEB5F98BFF0004
            BAFF008A97F6BCF1D6B8DF3A7F645F5C06FF006A4BC831FA16AFA07FE0AE3E38
            FEC2F803A278762936CFAEEB085D33F7A18519DBFF001F30D7AE7FC13F7C0FFF
            000827EC99E0381E3D971A8DB3EAB29C63779F234887FEFDB463F0AF85BF6C6D
            4EE7F6ADFDBC744F86DA5CCD269BA5DCC3A16E88E42107CCBD971EA83783FF00
            5C457EAFA2E99E0DF0D819874DD1F4AB4C658ED8E08234F5ECAAABF90AFC8BF0
            CDA5EFFC144BF6E49B51BB8E66F04D84826747040874B81B11C5ECD331191D41
            95C8FBB5FAFE4DB697624931DADA5BC7C938448D147E40003F0AFC87FDA37E28
            788FFE0A0DFB4B691F0EFC0AEEDE11D3EE1A1B29707CA651FEBEFE51FDDC03B7
            3CEDC0186720FEA6FC1EF84FA17C12F875A3783BC3B0793A769D084F3180DF3C
            879795CF7666C93F5C0C00057997ED81FB5BE85FB2DF81CDC398B52F17EA08CB
            A4E8E5BEFB74F3A5C72B129EBDD8FCA3B91F0CFEC7FF00B297893F6BCF88575F
            187E2E4B737DE1B96E8CEAB75956D5E5538D8A3F86DD3014E300E362F43B7F58
            6D2D21B0B586DADA14B7B7850471C512855450301401C000718AE47E2CFC5FF0
            A7C11F075DF89BC5FAB45A5E9900C2EE39967931C4712757738E00F72700123F
            2B7E267C6BF8B9FF00051EF88C3C15E07D367D2FC190CA24161BCAC31C60F171
            7D28E09EE10640230A19B93FA09FB2A7EC6BE0EFD97B410D651AEB3E2EB98C2D
            F6BF71181237AC710E7CB8F3D81C9C0DC4E063E81A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2BE50
            FF00828278D7E347823C0BA1EA5F09AC2EBECB67746F358D4AC15669E1441F22
            184825A23962E70400833804D707FB2EFF00C1507C2FF11CDA787FE2625BF83F
            C48D88D353048D3AE9BDC939818FFB44AFFB43815F74433C7730A4B148B2C4EA
            195D0E4303D083DC536E6DA1BDB696DEE2249E0954A49148A195D48C1041E082
            3B57E697ED83FF0004ECD4BC1DAA4BF12FE0725CDA4D6B27DB27F0FE9EEC93DB
            3A9DDE6D995E783CF96391FC19E14777FB15FF00C146ECFE21BD97817E29DC45
            A4F8B4116F69AD4804506A0DD024A3811CC7F0563C0DA700FDEDD457E737FC14
            2BF61FB896E6EBE317C31B592DB58B67FB66B3A6D8655DD94EE37906DE44808C
            B81D71B8721B77A7FEC0BFB705BFC7CD0E2F06F8BEE63B7F885A7C3F2CAF855D
            56151CC8A3FE7A81F7D475FBC38DC17DCBF69DFD9FB48FDA4BE136A7E13D4764
            17C47DA34CBF65C9B4BA50763FFBA7255877563DF047E7FF00FC13F7F681D5FF
            00671F8BBAA7C0EF889BF4DD3EEEFDADADC5D37161A8676ED07FE79CDC608E37
            1461C331AFBE3F6B2F8176FF00B43FC0ED7FC28513FB53CBFB669533E3F75791
            8263E7B06C9427FBAED5F187FC128BE3ADC68BABF883E0B7889DEDAE12496FB4
            A86E3E568E55E2E6DF07A1E3785EDB653DEB7BFE0AFBF09BFB4BC1FE11F88B69
            0E67D2EE1B4ABE751CF932E5E263ECAEAE3EB2D7D51FB1D7C571F1ABF670F06F
            88269BCED44598B0D409396FB443FBB766F76DA1FE8E2BF3F7F6206FF852BFF0
            50DF13F825BF736F772EABA246A7852B1B99A23F8AC031FEF7BD7AA7FC16474F
            F33C23F0D2FB1FEA6FAF61CFFBE911FF00DA75F58FC13F11F91FB1FF0082F59D
            FF0035BF82ED6666CFF1259AE4FE6A6BE18FF823A699E778FF00E23EA58FF51A
            75B419F4F32576FF00DA7553FE0ABFE20B9F1C7ED01E00F0169E7CF9AD2C54A4
            60F4B8BB9B6EDFAED8A23F88AFD11F1DF89F4CFD9DFE01EA5AB10A34FF000AE8
            812DE26E048628C2431FD59822FE35F9FDFF0004A0F87177E38F8A7E36F8B3AD
            EEBA96D035AC17328C992F2E18BCD203FDE09C1FFAED5EC3FF000550FDA23FE1
            5FFC30B6F873A45CECD77C54A4DE796DF34360A70C0FA79AC367BAAC82BBDFF8
            273FECEFFF000A3BE055AEA7A9DB793E29F1484D46F77AE1E1871FB884FA6D56
            2C41E4348C3B578EFF00C14EBF6B29342D3CFC1BF07DCB49AD6A88A35C9AD8E5
            E181F1B2D4639DF2020B0FEE1039DFC7B1FEC03FB26C7FB3A7C351AAEB76CBFF
            0009DEBF1A4BA8330CB59C5D52D81ED8EAF8EADC72154D7A07ED53FB517873F6
            5FF0049AC6A6C97BAE5D868F49D1D5F125DCA0753FDD8D720B376E00C9201FCF
            3FD993F673F187EDDFF15EFBE2A7C51B8B87F08ADCE657398FEDECA7E5B5B71F
            C10A74661D3A03B8965FD6BD2749B2D074CB4D374EB586C6C2D22582DEDADD02
            47146A30AAAA3800000002BC53F6A3FDAF7C1BFB2FF873CDD5661AA789AE632D
            61A05B4804D3760EE79F2E3CF56239C1DA188C57E767813E167C60FF008294FC
            4B3E2BF15DF4BA4F82AD65319BDD856D6D533CDBD9C44FCEFD32C49EC5D89C03
            FA9FF073E0A7847E03F836DBC35E0FD2E3D3AC63F9A594FCD3DCC98C19257EAE
            C7D7A0E8000001DD57997C71FDA3BC05FB3CE82752F196B7159CAEA5ADB4D871
            25E5D11DA3881C919E371C28EE457937EC7FFB72587ED55E29F16E8C34093C3F
            369A16EAC15A43299ED49084C8C005590360ED1D9C633B493F53514514514514
            5145145145145145145145145145145145145145145145145145145145145145
            145148466BE45FDA8BFE09CBE05F8EBF6BD73C38B1782FC67265CDD5AC5FE897
            6FD7F7D10E849FE34C1E4921FA57C6DE0FF8DBF1F3FE09DFE2883C2DE32D326D
            63C1C5C886C2F24692D2540796B3B9C1D87BECE833F32026BF48BF67CFDAB7E1
            F7ED25A38B8F0B6AA23D56340F75A25E911DE5BFA9299F9D7FDB425791C83C57
            B157C4BFB6A7FC13BF4AF8D497BE31F00C56FA278EC032CF6A311DB6AA7A9DDD
            9253FDFE8C7EF75DC3C3FF0064EFDBF3C43F0475F1F0B3E38C57D15958CA2CE2
            D56FA36377A611C08E707E6922C630DCB28C7DE5C6DFD40D3353B3D734DB6BFD
            3EEA1BEB0BA8D6586E6DE412472A30C86561C1041C822BF317F6F3FD8D353F84
            3E243F1AFE12A4DA6DADB5C0BED46CB4ECABE993039FB5420748C9E5947DC3CF
            DD242FD47FB107ED99A6FED37E11FECDD59E1B0F1FE9710FB7D92E156E90607D
            A621FDD271B947DD27D0A93E4FFF00053CFD93CF8E7C347E2BF85AD09F116890
            81AB4302FCD7566BD25E3ABC5DCF74CF3F2015E81FF04F0FDAC07C7FF86DFF00
            08EEBF7624F1CF876258EE5A46F9EFADBEEC771EEDD15FFDAC13F7C0AF953FE0
            A0BF0DF55FD99FF699F0F7C65F0827D92D757BB5BFDC8311C7A84641991B1FC3
            2AFCC41FBDBA5EC2BEF2F18DBE8DFB62FEC99A87F649596D7C55A299ACC3907C
            8BA51B9158FAC73A00DEEA6BE3BFF82437C51974CD67C71F0BF51668646C6B16
            7049F295910886E1707BE3C938FF0061AB88FDAB07FC290FF8296F87FC563FD1
            ECEFAFB4BD59C8E0792C5609FF003F2A5FCCD7BCFF00C1606C3CEF813E0FBEC7
            FA9F112C59FF007EDA63FF00B25777F0BBC47E47FC13286A61FE6B6F035FA29C
            FF001470CC807E6A0578BFFC11AF4CF2F42F8A3A891FEBEE74F801FF00716763
            FF00A30579959FFC5FDFF82ADBC9FEBECB4BD7D9B3D51534E8B00FD0C900FA97
            F7AF6BFF0082BAFC5EFEC2F873E1AF877673EDBAD7AE8DFDEA29E7ECD091B158
            7A34A411EF09AF79FD907C05A7FECD9FB25686FAE3269852C24F106B53CA31E5
            B48BE6B6FF00748C221FF72BE08F81DE1FD43F6FDFDB6352F18EBD6CEFE12D32
            75D42E2DE5E523B58DB6DADA1ED972A370EE04A7AD7E877ED7DFB4B69BFB317C
            26BAD698C53F88AF435AE8BA7B9FF5D3E3EFB0EBE5A0219BF05C82C2BE2EFF00
            82717ECCFA97C59F1C5DFC77F88425D4635BC927D2CDE0CB5F5EEE25EE9B3D55
            1B217FDBC918D9CFDDDFB487ED17E19FD9A7E1E5C7897C41289AE5F3169DA5C6
            E04D7D3E3845F451C166E8A3D4900FE697C0EF831E3AFF00828BFC6ABFF881E3
            FB99EDBC1B6B384B99E2CA47B14E56C6D01E8003F337380C5892CC33FAE1E1AF
            0DE97E0ED02C344D16C60D3349B08560B6B4B74DB1C48A300015F1F7ED9DFF00
            0511D17E0825E7847C0AF6FAFF008F30629A7C892D74B3D0EFC70F28FF009E63
            807EF74DA7E7EFD977F60DF167ED17E23FF85A5F1BEEF50FECBBF905DA595DBB
            2DEEA9DC339EB1438C0006095FBBB5704FEA3683A069BE16D1ACF49D22C6DF4C
            D32CE310DBDA5AC6238A241D1554700537C43E23D2BC25A35D6ADADEA36BA4E9
            76A8649EF2F2658A2897D5998802BF3BFF00692FF82A879B753785BE09D8BEA3
            7D2B7903C45756E58172703ECD0119724E30CE3FE007835C5FC0FF00F8272FC4
            2F8F3AFF00FC273F1CB5AD4B4BB7BC6133D9DCCA64D56EC760E5B2205C700105
            8018DABC1AFD28F865F09FC25F073C350E81E0ED0AD343D323C131DBA7CF2B74
            DF239CB3B7FB4C49AEB68A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28A28A28A28A28A2BE5CF8BDFF000509F877F04BE374BF
            0F7C496F7FE5DBDB4525D6B164A268ED66932DE5C918F9B010A3165DC7E7C6DE
            335EF7F0FF00E27F84FE2AE889ABF847C4161E20D3DB1996C660E509FE175EA8
            DFECB007DABA8AC1F1B7813C3DF123C3975A0F89F47B4D7348B91896D2F220E8
            7D08F461D986083C822BF36BF683FF008266F8A7E186B07C6FF02755BE9BEC6E
            6E13475B831EA1684739B79811E601CFCA487C719726B5BF66EFF82A2DFE817F
            1F83FE39584F6F736EFF00666F10C56C5268581C11756E00391DD90678E50F26
            BF467C35E28D23C65A1DA6B3A16A56BABE95769E64179672ACB148BEA181C578
            6FED65FB18F84BF6A1D00CB3AA68BE32B588AD8EBB0C796F68A61FF2D23CFE2B
            9CA9E483F02FC1EFDA0FE297FC13CBE22C9F0FBE22E9975A8F838C9BCD8EFDE1
            232DFF001F36321E0A9E494E01390763648FD55F007C42F0AFC67F04DB6BFE1B
            D46DB5ED03508CAEF5F987230D1C88795619C156191DC57E627ED8BFB2BF88BF
            644F88B69F18BE12C97161E1C8EEC4EC96A32748998E3630EF6EF92A33C0DDB1
            B82B9FBA3F647FDAB3C3FF00B557C3D372AB0D9789ECA358B59D189CEC6231E6
            203CB44FCE3D3953D327E00FDA6BE16EBFFB027ED2FA3FC49F01C4D1784F50B9
            6B8B38867C98C9FF005F61263F80A93B7FD9231F32135F77FC49D0FC33FB797E
            C993BE832C727F6ADA0BDD31E5237D95FC79C46FFDD21B746DFECB36320835F2
            C7FC129BE395CF86FC47E21F829E2467B59FCD96F34B82E3E568A74E2E6DF07A
            1C2EF03B6C90F535E75F1891BF63CFF828F5A789E206D3C3FA96A11EACC40C29
            B4BBDD1DD0C74F958CF81FECAF4AF40FF82C4F8400D47E1B78C6050CB2C573A6
            CD2AF6DA5258867DF7CBF9576DFB7C788C7C4FFF00827E780FC565C4B25DCFA5
            6A321CE4891EDA45707DC339159BE05F1CD95AFF00C124AF626BE816F974ABEB
            2301957CCF9EFE44036E73F75C558FF8258EA96BE07FD977E25F8B2ECA882CB5
            3B9B89B2707CB82CE2909FA7CC6BCE3FE092BE1B9FC5DF1B7E20F8F2FF00F7F2
            D9D8794D2B0FF96F7536F2C3DF10B8FF00815733E3027F6D1FF829045A5AFF00
            A678634CD40599FE28FEC1644B4BCFF76471260FFD3515EE9FF055DFDA14F86B
            C1DA67C27D12E31A96B816EF55F28FCD1DA2B7EEE238FF009E8EB9FA478E8D5E
            C5FB1E7C25D23F641FD984EAFE2B922D2751B9B73AE7882EA718307C99484F7F
            DDA61768CE5CB63EF57C2F636FE28FF829A7ED60F3CDF69D3BC11A6905803C69
            FA72B7083B79D29CFAF249E5538FD37F8A5F143C0BFB257C1E8F50BF58B4BD0B
            4AB74B2D334AB5C0927655C47044A7A920724F400B13804D7E657C3CF017C43F
            F82997C78BAF13F89E79B4BF0569F2049E68B3E4D9419CADA5B6786958725B1C
            67737F0A9FD67F0B785FC35F093C0F69A3E936D69A0786B47B6DA8BB8471431A
            8259DD89FAB3331C924927A9AFCE9FDADBFE0A27ABFC43D5DFE1A7C0C17739BC
            93EC72EBD631B1B9BC7271E55A28F9941E9E67DE3FC381F31F43FD8C7FE09BB6
            3F0F5ECBC6FF0015208758F15E44F6BA2B912DB583750D29E44B28FC554F4DC7
            047DEDC01E82BE58FDA6FF00E0A15F0FBF67F175A469D2AF8C7C651E53FB2EC2
            51E55B3FFD3798642E3FB832DEA06735F0EE97E10FDA1FFE0A43E258F52D56E5
            F4AF04C53131DC4CAD6FA55A8CE08822EB3C83919F98F667518AFD08FD9B7F62
            4F875FB36DAC375A658FF6E78A76E25F106A481A7C91C8897A42BD785E71C166
            AFA0A8AE597E297841FC711F8353C49A6C9E2A789E71A44772AD721171B8B203
            95EB9E719E71D0D7534514514514514514514514514514514514514514514514
            51451451451451451451451451451457897C73FD8DFE167ED04B35C7897C3D1D
            BEB720C0D734B22DEF01C60166031263B0903015F067C40FF82737C66FD9EF5C
            7F14FC1CF13DCEBB1C19651A74C6CB5244EBB4A6EDB28F501B2DFDCED5B1F09F
            FE0A9DE37F871AA7FC237F1A3C273EA12DB308A7BDB7B7FB16A309EFE640C151
            CFB0F2FF001AFBE7E0E7ED2BF0DFE3CD8ACDE0DF1459EA372137C9A748DE4DE4
            3EBBA16C3607F7802BE84D7A7D7837ED23FB197C3CFDA56C24975AB0FECAF12A
            A6D83C41A7284B95C0E049DA541FDD6E40CED2B9CD7E776ADE0EFDA0FF00E09B
            7E299354D22E5F56F044D30DF710A34DA5DD8CE009E2CE61908C0CE41ECAEC33
            5F757ECC1FB7EF803F6894B5D26E665F09F8CDC053A35FCA365C37FD3BCBC093
            FDD387EBC10335EB3F1D7E00F83BF688F05CDE1DF1769E2E22E5AD6F62C2DCD9
            C847FAC89F1C1E991C838C10457E5C6A7A37C63FF82627C5517D632B6B7E08D4
            660BE6E1BEC1A9C6324248BCF933819C1EA39C175C83FA53F03FE3F7C3EFDAE3
            E1C5D4BA6186F229A036DABF87B500AD2DBEF5219244E8C8DCE187CAC33DC103
            F39BF689F811E33FF827DFC66D3FE257C37B89CF83E7B822DA46CC8906EE5ECA
            E7FBC8C01DA4F240EBB9735F727877C55F0FBFE0A2BFB36EA1A7B6DB796E2311
            DE59B10F73A3DF0194917A6403CAB701D720E3E651F137EC7BF1975DFD89BF68
            5D6BE12FC447365E1CBFBD16D70F231F2AD6E4E0437684FF00CB2914A863C7CA
            558FDCC5697FC143FE1A6A7FB3A7ED1DE1CF8D3E0F5FB25B6AD7697A648C7C91
            6A31105C363F8655F988FE23E6F6AB3FF0513F1F7847F686F83FF0EFE22786DC
            9D4ED576DDC58CB450CCAA4A3B0E098E65D98C8E4B71820D713F133E2978AFF6
            95FD8FBC3960D6526AD37862E6DE392486166983C69E402C470432C8AC78272D
            D7D134FF00867F11BC65FB1C4D60F6CF6B65A6DEC76D2473DCAAAB05943A1650
            7276F9D8191C7356B4BF823E365FD8FF0053D38EA36696E75216AB07DA5F6F32
            24C78C63D69BE1FF0085DF113C0DFB21788AC6D26DF69AB6A0F6DF64B6BDDB1C
            DB847B8B212013B51BB7F08A67C04F17F8E3F653FD9EBC67E208B4FB9D32E756
            9E4B6B79668DCA349E588E374C1DA4A333B739FBA6B5FF00E09B3E33F09FC15B
            3F1E7C47F169992436E6CE0B854DC52241E6CCA3B96761080381F29E6A3FD923
            C1BAA7EDB1FB626B5F13BC57019743D22E9755B885FE68C3838B3B51EAAA1013
            EAB1107EF5751FF050FF00DA3F54F8E9F11EC3E057C3AF3352B486F92DEF8599
            CFF685FEEC2C20FF007223D73C6F049E101AFAD3E167833C0BFF0004F5FD9ADE
            EBC437B0C73C6A2E756BE8C665D42F59788610705B18D88BC700B1C658D7C17A
            669BF11BFE0A7DF1FDEEEF1A5D17C13A5B619972D6FA55A9390899E1E7931D7B
            9193855007E9F2BFC37FD90FE0E431C935AF85BC21A2C5B14C872F2B9E4F4F9A
            595CE4F0092735F9A5F193F68EF8A7FF000505F880BF0F7E1BE9777A77840C9B
            BEC2AFB3CD8C1FF8F8BE9470A8382133B41C01BDB06BEEDFD927F624F097ECC3
            A425F111EBDE38B88F6DDEB9347FEA811CC56EA7EE27A9FBCDDCE30A3D33E34F
            ED03E05F801E1E3AB78D35D874E5607ECF669FBCBABA61FC3144396EC33C28CF
            2457E6AFC54FDB67E327ED89E2693C0BF08343D4744D1AE72860D39BFD3678FA
            16B8B8185853D402A067059857BAFECC9FF04B2F0F782CDAF883E2ACD0F8AF5C
            1891745849FB040DD7121383391E8709D410C39AFBCECAC6DF4DB486D2D208AD
            6D61411C50C28111140C055038000EC296EEF20B0B696E6EA68EDEDE252F24B2
            B055451C9249E0015F27FC70FF0082987C25F84FF68B2D16F1FC7BAE479516FA
            330FB32B7FB7727E5C7BA6FF00A57C77ABFED31FB4FF00EDA9A8CFA3F8034BBD
            D134076F2E48FC3CA6DE2407B4F7AE41CE3A80CA08FE135F407EC95FF04D5D57
            E10F8EB45F883E31F19BB788F4F90CF169DA2F31EE652ACB2CD20CB865660CAA
            A3A9F98D7DF54514514514514514514514514514514514514514514514514514
            5145145145145145145145149919A5A2BCFF00E2C7C04F007C70D2FEC3E35F0C
            58EB402958AE644D9730FF00D739970E9F40707BD7C0DF193FE093FAEF862F9B
            5FF837E2A9659A07F3A1D2F539BC8BA8D8723C9B94C293E9B82631F78D71DE0D
            FDBCBE3E7ECB5ADC5E19F8B9E1DBBF1059C5F284D6D0C17BB071BA2BA008947F
            B4C1F3FDE15F73FC0BFDBA7E12FC7916F69A66BEBA1EBF2E07F62EB78B79D9BD
            23249493E88C4FA815EF77F616BAB58CF677B6F0DE59CE8639609D03C7229182
            ACA78208EC6BE01FDA7FFE0967A47895EE7C4BF08678FC39AC82656D02772B67
            3375FDCBF585BD14E53A636015E49F05FF006FBF8A1FB2FF008917C03F1B345D
            4F57D3AD0888BDEAE353B44E8195D8E2E13D371E7B3E0015FA27E1FF0015FC32
            FDAC3E195D258DCE9BE32F0B6A11F95776920CB464F2164438789C7519C30201
            1D8D7E6D7ED01FB287C44FD86BC729F13FE13EA77D73E158242C6E231BE6B042
            7986E93189213C0DE463A0600E09FAEFF671FDACFE1FFEDB9E02BDF03F8BEC2C
            ECFC49756A61D47C3D72DFBABC4C732DB313920637633BD08CE4E031F8AFE227
            817C7FFF0004CEF8FD69E26F0CCD36A7E0AD464296F2CC4F937B6F9CBDA5C606
            04AA390D8E701947DE51ECBFB68E93E01FDB03F67FD1FE327822F614F14E991F
            933593605CCB1F592D6451CF991925D7D416C643023C67E19F8FBC63FB63FC21
            5F83FA84C6FB56D16D54E9D7139C2C822CF94CEE7A3A83B091CB2609DC4135DE
            FECB9F01F47FEC6F10FC3AF17C8754BBD46091ECA19F2905BDDA0CEDC753CA86
            E703E43C64D7A27C115B6B7F0CF8E3C0BF668ED62BCD3A4B8B6B68D360171002
            C142818C9C64FF00B951F81356F33E0EFC46D1D9CEEDB67771C7DB02750E7FF4
            0A22BB0BFB374D006F98F89C647B1B6C8FD54D3FC63A98B4F817E02D263619BA
            9EEEFA64EF9595A343F916FCAACFC59D40699F0FBC07E0B85BCC58EC86A5751F
            50649B2CAA47AA867FC1C5725FB497C25F0CDBF80FC3DF0EB4FB71A5EA9140B7
            7AA4F6181BA77F9846CA3861B98B6319C6CE6BCE7C6D0F8D7F610F84F0E81A1D
            F4D16B9AF4667B9BDB163B6DF7F1BDC7557518453D0956392320F57FF04F3F0D
            7807E0AF84FC41F1A3E236A90DA6B515BB358457232F6F6CC399501E5E5949DA
            A073838FF9698AF3DD775BF88DFF00053DF8FD169DA6A4BA378274B7DC88F968
            34BB527065931C3CF263819E48C0C2A961F78F8CBE24FC26FF008276FC18D3F4
            2B58C1B8588B5968F0329BED4E7E8D34AD8E0123E6908C0002A8E156BE0FF0FF
            00847E32FF00C14D7E279D6358B96D1BC1361314FB46C6163A721C1314084FEF
            66231939CF4DC546D15FA75F09FE0F7C3DFD957E1C4961A3476BA16916B1F9FA
            8EB1A84AA924EC0732CF33607AFA28CE0002BE3CFDA5BFE0AA56B633CFE19F83
            367FDB1A93B7927C45770930AB1E3FD1E123321CF4670173FC2C0E6BCE3E0B7F
            C13D7E26FED1FE211E3AF8DDADEA7A3D9DE112B4378FBF55BA5ECBB5B22DD3B0
            0C323A040306BF4A7E157C1CF077C13F0D47A1783342B5D12C17064F25732CEC
            07DF96439676F7627D3A568F8EBE23785FE1968B26AFE2BD7F4FF0FE9C99FDFD
            FCEB1063FDD504E59BD8649F4AF867E37FFC15BFC37A11B8D3BE186832F896F0
            655756D555ADED01ECCB1712483EBE5D7845AFC2CFDAABF6EBBA8EF3C47757BA
            4F852660E8DAB1361A72AF5063B751BA5E3A3ED6F76AFAC3E07FFC12D7E187C3
            8FB3DFF8B9E6F1FEB29862B7ABE4D8A37B40A4EEFF0081B303FDD15F62691A35
            8787F4E834FD32CADF4EB08176436B6912C5146BE8AAA0003D855CA28A28A28A
            28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A2BE13FDB83E067ED11E31F8AB65E36F853AC4B069DA7E9B1D9C563A4EAED67
            74583BBC8CEAC511812C06371C851C5780E9BFB7E7ED29FB3E5EC5A6FC4CF0BB
            6AB029D9FF0013FD31ECE6703FE79CD18556FF0078ABE6BE88F865FF000568F8
            5BE29F2A0F16697AB782EEDB1BA564FB6DAAFF00C0E31BFF00F21D7D5DF0FBE3
            4F80FE2ADB09BC23E2DD235F1B7718ACAED1E541FED479DCBF8815DA56178CBC
            09E1DF889A24DA3F89F44B1D7B4C97EF5ADFC0B2A67D4061C11D88E476AF85FE
            3A7FC1253C33E21371A97C2FD6E4F0BDF1CB2E93A9B34F66C7D164E648C7D7CC
            FA0AF05D3FE31FED49FB095F43A778AACAF358F0AC6C238E3D6035ED83AF610D
            D29CC671D1370C774ED5F607C0BFF829BFC2BF8ADF67B0F114CFE00D764C298B
            5570D66EDFEC5C80140FFAE813F1AF75F8BBF037E1FF00ED1FE124D3FC53A55A
            EB566E9BECF51B760278370E1E1997919E0F7538190457E6B7C54FD8E3E337EC
            55E2797C79F09B5BD4359D02DF2EF75A7AE6EA0881C94BAB7E5658C77600AF19
            2A9C57D0DFB33FFC14DBC21F15ADE1F0BFC52B7B4F0AEBB3AF906F64E74CBDC8
            C10C5B3E493E8E4AFF00B4320579BFED77FF0004F3BEF0ADFB7C50F813E7C260
            717D2E85A6C844B6EC3E6F3AC994E48EFE58E47F06461441F0BBF6E9F09FED01
            F09356F85DF1E74E4975892DFC9B6D496308B7B28E109C0FDCDC29C10C30AC7F
            BBD0FCF5F0BBE19F8C7E147C55923432B7844B869A77188EF61CFDD4EC2519EB
            FC27AE4101BEA9F10F81F48F85573A378CBE1AAAD9F876F25F3A1312E1ADAE47
            2F1483DF9E0F18C81C019B3F1135049F58D1FE22F8787D905FCA259E34E7ECB7
            F1E0C8A7D9B8719FBD93C76A8F59F12C5E1FF8A7A578CF4E42965A8B47A99895
            B246F256E62CE3FBE255FA11EB591A52FF00617883C59A345224D0CD67796BE6
            A9CAB2C67CD5607DFC918FAD652EACC3C0B2699BBE56D456E36FB88CAFF5AD3D
            551B5ED5BC23A1EE58445696D6A1D8E1479CE652C4F6FF005DFA56DE9DAF5B78
            ABE2C6A3E2BBF8FF00E251A6B36A262C01FBA8B0B6F163A72DE4A7E352780AFA
            3D4FC53ABFC42F139F3ED34D93ED663271F69BB624C30A7D082DC64009C8C54B
            E11D093E2EF8A359F1778E248C7866D0F9FA93CC3F772F64B751C9208C0C0C9C
            6075615F3A7ED0FF000C7C43F1BFC6E8DE0AB596DFC2B0B6EFECB5E52C621C1B
            87C75183D3B6428CE727D4B4BFDB1BC13FB1C7C0C5F01FC3FD161D43C7BBDBED
            17127CD10948E6E2E181CBBF658C630060E001BB9CFD9B3F627F1C7ED6BE2A3F
            14FE346A3A8C5A05F38B855B962979AAAFF0841C7930638040195C040010C3EB
            2F8E1FB68FC24FD903C391F83BC376B6BAB6B5A745E45B7867442A915A63B4F2
            00447CF247CCE49C91CE6BE25B6D2FF688FF008292F8916E2E646D2BC1114DC3
            B07B7D22D3079D8BC99E41CF3F330CF2541AFBFF00F66AFD85BE1D7ECE10417F
            6D683C47E2D55F9F5FD4A305D1BBF909C88475E996C1C1635D97C67FDAABE187
            C04B793FE12DF145ADBEA0ABB9349B53E7DE3FA7EE972541ECCDB57DEBE0EF8A
            5FF054DF1F7C4BD57FE11CF835E119B4D92E58C705D4D6FF006ED4A6F431C2A0
            A21F6224FAD63F817FE09D7F1B7F687D6E3F137C60F13DC68514DF331D52737B
            A8B275DAB1EEDB10ED82C36FF73B57DCDF043F61CF849F0205BDCE91E1D4D5F5
            C8B07FB675AC5CDC061FC49901233EE8AA7DCD7BE818E9C504E2BCF7E22FED0D
            F0D7E132C9FF0009678D746D1A641936B2DD2B5C1FA42B973F82D7CAFF00123F
            E0AE1F0CFC39E6C3E11D0B58F17DCAE76CD201636CDE9F33E64FCE31527EC69F
            B7678E7F696F8CF7BA2EB3E14B5D2BC2C74F964B69F4EB79A4F26E15908134EC
            4AF29BF1C2F38F5AFB9E8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28A28A28A28A2AAEA5A5596B3652D9EA16905F5A4A36C9
            05CC624471E854820D7CEDF137FE09E5F03BE26F9B2C9E124F0DDF499FF4BF0E
            C9F632B9F48C0317E695F297C41FF8243F88B43B93A87C37F1F4371244DBE1B6
            D6236B59908E989A2DC0B7BED5AE2FFE133FDB4BF6553B753835CD7344B7EAD7
            D10D66D0A0E99994B3C6BEDBD7E95E9DF0D3FE0B0B6AC62B6F885E0496D9FA49
            7DE1F9B78CFF00D70948207FDB435F597C32FDB73E0B7C57F2A2D23C73A7D9DF
            49802C757636536EFEE812ED0E7FDC2D5ED3776763AE69F25BDD436FA858DC26
            D78A5559239508E841C8208AF907E3AFFC12FBE17FC4FF00B46A1E15127C3FD7
            1F2C0E9E9E658BB7FB56E480BFF6CCA81E86BE46BBF873FB53FEC17772DEE837
            377AB7842162EEFA76EBFD3197A932C0C3743EEFB57D98D7D0FF0002FF00E0AC
            BE0FF157D9F4DF897A449E11D45B0A753B256B8B173EACBCC91FD30E3D58574B
            F1DBF614F851FB5768B2F8CFE1BEAFA668DAFDD0322EA9A33A4DA7DEBF52268D
            0E0313D5D70C0925831E2BE51F077C71F8F7FF0004F1F1441E15F1A6973EB1E0
            F2E443617B2192D658C1E5ACEE403B3D7672067E6404D37C7FE0FF0009FEDE1F
            12EEB5FF008676B07877C433A8B8BED2A50B13CA807EF24719DA6427F8D4ED24
            8DC72735EE5E04F1158687E118BE18F8D2D268749B2FDCDADF4919377A74A38D
            CC0F2EBEA3AE323918020B7B8BBF865A95FF008735C4FED2F0D6A91A997ECCE1
            9268CFFABBAB76E8586323B1C156F6C5493FE11E9751D12E278EEB48D4155E3B
            94CEC2464C370BDC632430C64067520374C492F5CE982C25FF0097799A48FA7C
            A5800E3DF3B53D860FAD4725FCAF7026CED7F284476F191B361FCC7F3AAFBCEC
            D9FC39CD588F50912E0CE4EE711189777381B360FC874FA54B15EBA696D61083
            BAE6657970065B6E422FAF56624743F2FA56DC92BEBDFD9BE1CB19E3834CB3DD
            2CB3C84AC6D2100CD70E7AE00014719DA8BC6E273B5797B77F106E74EF07785E
            136FE1FB1CBA094EC1211FEB2EEE1BA038C9E7851851EFBBAAFC42B1F03684FE
            0DF87FBAE67B9C47A86BAA9FBDBC90F1B611D428C900FB9C727737CF7E27FD9B
            741FD9AB5DD37E2378E4DAFD86E6717165A05C279DB250776D923E7767B2F419
            F98E7A6A7C51FDBB7E2FFED5BAD2780FE0F6817FA0D8DD2F96D169677DFDC274
            2D24C30208FD70463BB90715EC9FB367FC12D742F08243E27F8C5790EBFA9A0F
            3FFB121908B180F5CCF2706523B8E13839DE2BD5FE2F7FC1437E0B7C06D3FF00
            B1341B88BC53A859A7930E93E1A54FB2C1B46029987EED5463184DC463EED7C7
            7AF7ED73FB4BFED8BAADC687F0D746BDD0B4776F2DE2F0EA9428A7A79F7CF8D9
            F818C1F4AF4AF833FF0004919AF6E23D63E2E78A9E79E46F364D274572CCCC79
            3E6DCB8E4FA855FA3D7DE5F0B7E07780FE0AE97F60F05F8634FD0A22A1649608
            F33CD8FF009E92B65DFF00E044D74DE21F1568BE11D39EFF005CD5EC746B14FB
            D73A85CA411AFD598815F377C49FF82947C0DF87BE6C5078867F165EA647D9FC
            3F6C66527FEBAB158C8FA31AF977C75FF0574F17788EECE9DF0E7C016B672CA7
            CB866D4E47BD9DFDD628F600DED96AE4FF00E110FDB5BF6A1E7519F5FD0F479F
            EF2DE4ABA2DB043D330AEC7917FE02D5E87F0EBFE08F52CCF1DCFC40F1FE589C
            CB67A05BE49F5C4F2FFF001BAFA9FE1BFEC01F03BE1A7952DB782ADB5CBD4C7F
            A5EBEC6F598FAEC7FDD83F4415F4069DA659E916915A58DAC3676B10DB1C36F1
            84441E814702ACD1451451451451451451451451451451451451451451451451
            4514514514514514514514572BF147E24E8DF087C05AC78C3C40D3268FA54425
            B836E9BE4C160A02AE464E5877AF14F0BFFC145FE00F8A3622F8E174C9DBFE59
            6A76371063EAE5367FE3D5EB9E18F8E7F0E7C69B0685E3BF0E6ACEDD23B4D520
            91FE8543641F622BB7575700AB0607D0D3A90807AF35E63F12FF00665F85BF17
            C4ADE2BF03E93A9DCC9F7AF560F26E8FFDB68F6BFF00E3D5F26FC4DFF8242782
            B59F36E3C0FE2CD4FC3539CB2DA6A28B7B6F9FEE82363A8F725ABC3E5FD953F6
            B8FD982469FC09ACDF6ADA5C27704F0E6A267848EDBACE60371F608D5B1E14FF
            0082A6FC5BF863A8AE8FF143C0D06A7343C4A26824D2AF87A9652A53F008B5F5
            07C33FF829F7C14F1F08A0D5750BEF06DF3E018B59B62622DED2C7B940F77DB5
            A5F12FF63CF807FB5669936B9A37F66C1A8CFF0030F107846E62F9DCF3991533
            1C84F72C377FB42BE37F167EC47FB437EC97AD4DE24F851AFDE78834F8FE6697
            4062972C83A09ACD89128FF657CCFA0AA7AE7FC146B52F88BF0EAFFE1EFC5EF0
            4DA5F4CF22C73EA1041B2452879DF6EFF764CFF12B2E39C2835D9FC1AFD9B6D7
            43F08AF8BFE1AEB1FDAD75798BC7B18E431EA1651F540A38623BF40DC81F375A
            ECF52F1CD9F8FAD96C3C6909B3D72DC7950EBF0C5890638D973181F3AFFB4A37
            2E3A3720F39797377A45A0D0F56C5E699932DA4D130904449C79903F42A48F99
            7A1C1076B00579F9656F2C40584888C4A30ED9EB8F63E9FF00D7A8BAD2514528
            38E953C37322C2F6E8C224948F31BFBC072013E80F38EE71D7031D0585F5EEA1
            64DE1FD0A330DBCF87BC999846D381DE572404897AE09DA3A924E31D1E95E30D
            1BE16C67FE11C8E2D6FC4ECBB5B5BB88C982DB23916F1B0CB1EDBD80E9C0C1A4
            D63E005FFC5DF0FDFEA7F1335AFEC1D22F133F6CD4A4FF004A91872BE5A374C6
            38F6C6148AF14F87FF00B69E85FB225AF887C2DE01F08C7AB5DBB085EEEFF30A
            79C848F31881E64A0F3F29D9DB0474A643E13FDAB7F6F39927D4E6BCD2BC1F3B
            0656BC2DA7694ABD415880DD381D9B121FF6ABEA4F823FF04ACF86FF000FC41A
            8F8E6F27F1DEAC986304A0DB582375FF0056A773E3FDA6C1FEE8AF6EF157ED35
            F02BF67FD25349B8F16787B4482CD7647A3E8A16578BFD9104018A7E200AF99B
            E247FC1603C25A5F9B6FE07F066A5AF4C32AB75AACCB670E7FBC1577B30F63B4
            D78BC9FB58FED71FB4BBB43E05D12F74AD3263B43F8734B3144076CDDCDBB69F
            70EB5A5E1EFF0082617C6CF8B5A8A6ADF13BC6D06972C9F7DEFAF24D56F573D7
            3F36CFCA4AFA47E1BFFC129FE0EF83FCA9BC40DAB78D2ED70585EDC9B7B727DA
            38B6B63D99DABEA1F02FC25F05FC32B516FE14F0AE91E1E8F6ED63A7D9C713BF
            FBCC0658FB926BADA28A63CA91A96775550324938C52413C773124B0C8B2C4E3
            2AE87208F5045494514514514514514514514514514514514514514514514514
            5145145145145145145145731F12BE1B787BE2EF82B52F09F8AAC5B52D075008
            2E6D9679212FB1D645F9A3656186453C1EDCE457CA1E28FF00824C7C1AD6B7BE
            997BE24F0FC87EEADB5EA4B18FA8963663FF007D0AF23F13FF00C11BE45DF278
            73E2603FDD8352D2F1F9C8927FECB5C437FC13B3F69AF8624BF837C696F22A73
            1AE87AFDC59BFE4CB1807F1A4FED6FDBC7E12F1243E29D4E28FAAF916DACEE1F
            5512B7E4735241FF000535FDA07E1D48B078CFC13A74801C37F69E937363313F
            50C147FDF35E83E18FF82C858BEC4F11FC34B8B7C7DE9B4DD5164CFD11E35C7F
            DF55EB9E17FF0082AD7C10D7760D41F5FF000EB1FBC6FF004EF3147E30B4848F
            C2BD77C2FF00B6AFC0DF17ECFB07C4CD0622FD17509CD913F84E12BBBBEB3F00
            FC63D19ADAEE2F0F78D34B61931C821BD8B9EFFC43F1AF9D3E26FF00C12F7E0A
            F8F3CD9F48B2BFF065F3E5849A3DC9684B7BC52EE007B26DAF987C53FF0004B8
            F8BFF0B3526D63E1778E61D5268B989ADEE64D2AFBD8290C53F1320FA56443FB
            59FED6BFB3148B6FE3DD12F756D2E23B37F88F4E32C4477DB7716371F72EDF4A
            E7FC51FB46781BF6C2F8A1A48F1BF81E5D12EAE3CAB76B9D2A459648D132CEDB
            F08C78DC70436381CE335F4349F0BED45C457BF0EBC5B6BAAB44DFB8B4F3BEC7
            7F191D362B6DDD81DC60FA0AC2F12789EF75299EC7C67A53B6A9100BF6F31791
            7A9C600938C4A3A7DE1B8F6715C94F2794A618A733DB13B9430C60FAE3B1E067
            1F99AAD451451451572DA592588DB1B85B6B52433E73862070481CB1EB8F4C9E
            9935D4685E2C83C313C6BE18D285D6B0CC047A9DFC426995B3C1861E510FD779
            F423A574FF00F0AB7C47E25B95D5BC7BE2187C3B0C8BB84BADDCE6E5D79E1212
            73C7F74EDF615E1BF18F5AF843F003E25E93E25D174EBBF16EA7304B9179736E
            3CBF3E22B9003ED0A31B790A4F27935B5E26FF0082A6FC5BF8957E748F865E04
            B5D3269788D61825D52F7D8A80AABF818CD642FECDFF00B61FED38DE678C756D
            4B49D2AE3964F106A3F63B7E7AFF00A2420907EB18AF5FF86FFF00047BF0F597
            9571E3BF1BDFEAD2705ACF45816DA307D0C8FBD987D154D7D51F0DFF00632F83
            1F0AC452689E02D2E4BB8F045EEA519BD9C37F7834C5B69FF7715EBD7BA969DA
            1DA79B77756DA7DAA0C6F9A458D147D4E00AF3AF11FED4BF083C27BC6A7F12BC
            310489F7A14D5229651FF00462DFA57967893FE0A5FF00007C3FB961F165CEB3
            2AF58F4ED32E1BF2674553F81AF2CF127FC160BE1CD96F5D0FC1DE24D5187437
            7E45AA37D08773FA57977887FE0B17E25BC2CBE1EF86DA759127086FF5092EB3
            F82247F966B00FEDCBFB5BFC4AFF00915BC1D35B2C9F75F43F0BCD385F7CCA24
            1F89A4FF008457F6F2F8A1CCD77E28D36293EF3FDBEDB49DA3FDD468DBF214F4
            FF008268FED11F109849E2EF1BE9C8AC72E354D66E6F25FC82329FFBEABF493F
            67EF86FA87C20F835E15F06EA9A8C5AADEE8D69F657BB810A2480312B8079E14
            81F857A151451451451451451451451451451451451451451451451451451451
            451451451451451451451454735B45731B472C492C6C30CAEA0823DC579EF89F
            F671F859E32DE759F879E1ABF91BACD26970897FEFB0A187E75E47E28FF826AF
            C02F126F68FC253E8B3375974CD4674FC9599907E0B5E45E28FF00823D7806F7
            79F0FF008DBC41A4B1E82FE286ED57F0558CE3F1AF29D77FE0909F103449FCFF
            000AFC44D1EF258CE637BC8A7B17FC0A79B83F8D657FC3357EDAFF000AF9D07C
            41AD6A76B1744D3BC4A258BF08A69173FF007CD1FF000D39FB6AFC2B38F10787
            B58D4ADA2EAFA9F86449163DE585173FF7D56A68FF00F0577F1C69E5ED3C5DF0
            DF45D4481B2686D659AC891DC11279B8FCAB8CF81DF11BE16FC50F89DAC6B3AE
            7812E748B816D2CA2E34774564924907F08D8A782C3241AF6BD47C31E05BF579
            743F184D60C4FC969ADD948081EF2C2187FE3A2B1F53935BB3B18AD66D46DF57
            B000AC31ADCA5D2A2F72A84968B3EB8535CCB9CB13B42FFB23B5368A28A28A29
            CA406048DC3D335D868575E2748D63D1F6E830CB9C5CA3A59EE07A8370E4311C
            742E47B5695A7C3DD17CFF0037C4BE3ED2EC8B8DCC2C849A84B9F42506DFC431
            AE1FF68A8BE08F877C1F617CF6DAD78AAE6CEF13F7B2C6163019483842538242
            F0D9AB3E01FF0082A37837E12F80F4ED07C33F0A9DE6B68F648C9710D8472104
            E1888E37C9C63AFBD66EA9FF00056FF8A1E22B836DE15F87FA25BCAFF763956E
            2F641F4D8C993F85523FB48FEDB7F12CE344F0F6B9A65BCBD1EC7C30B14447B4
            B34671F8351FF0CFDFB707C4BE757D775FD32DA5EAB77E254B78CFD6286427F3
            5AB5A7FF00C1267E2CF89EE05CF8AFC7DA243237DE7135CDECA3EBB91067F1AF
            47F0E7FC11C3C3F06D3AFF00C48D4AFF00FBCBA769D1DB7E00BBC9F9E2BD4FC3
            7FF04A9F81BA26DFB6C1AF6BE475FED0D4B603FF007E563AF53F0E7EC43F02BC
            2BB7EC5F0CF449B6F4FED089AF7F3F399F35EA3E1EF87BE16F09281A1F86F48D
            180E00B0B18A0C7FDF2A2B7C281D0014B4514514514514514514514514514514
            514514514514514514514514514514514514514514515E41FB45FED45E10FD98
            749D1F50F1741A9CF06AB33C100D320495832A863B833AE060FBD784FF00C3DA
            BE0AFF00CF878AFF00F05F0FFF001EA3FE1ED5F057FE7C3C57FF0082F87FF8F5
            1FF0F6AF82BFF3E1E2BFFC17C3FF00C7A8FF0087B57C15FF009F0F15FF00E0BE
            1FFE3D47FC3DABE0AFFCF878AFFF0005F0FF00F1EA3FE1ED5F057FE7C3C57FF8
            2F87FF008F51FF000F6AF82BFF003E1E2BFF00C17C3FFC7A8FF87B57C15FF9F0
            F15FFE0BE1FF00E3D47FC3DABE0AFF00CF878AFF00F05F0FFF001EA3FE1ED5F0
            57FE7C3C57FF0082F87FF8F507FE0AD3F050F5D3FC567FEE1F0FFF001EAE73C6
            DFF0533FD9FBC67A1DED9EA1E18D6B5392481E3885FE8D6D2A862A40FBD29C73
            5E31FB35FC42F81FACEA7E259A7F065F070900DD6902DB8392FD9255F4F4AF56
            D4AE3E0D5E33B5B5BF8B6C49FBAB1790CA3FEFA624FE75C86A565E1008EDA7EA
            FAC33FF0C773A6C407E2C273FCAB9B902AB1D8DB97B123069B4514514514A0E0
            F071EF5A3A65BE9534806A37F756C9DCDB5A2CC7F23225755A55B7C3485BFE26
            5A8789EEC7A5B59DBC3FCE57AC1F8DDAAFC10B2F857AA9B8D0FC49A914784837
            4E8307CD51FC12AFAD63FC0EFDA9FF00656F877E188E0D67E1935EEB2B33B0BC
            7D02D6E5C21C6D01E49370AF75D2FF00E0A9DF00F44B71069DA07886C201D22B
            6D26DE35FC84A055EFF87B57C151FF002E1E2BFF00C17C3FFC7A8FF87B57C15F
            F9F0F15FFE0BE1FF00E3D47FC3DABE0AFF00CF878AFF00F05F0FFF001EA3FE1E
            D5F057FE7C3C57FF0082F87FF8F51FF0F6AF82BFF3E1E2BFFC17C3FF00C7A8FF
            0087B57C15FF009F0F15FF00E0BE1FFE3D47FC3DABE0AFFCF878AFFF0005F0FF
            00F1EA3FE1ED5F057FE7C3C57FF82F87FF008F51FF000F6AF82BFF003E1E2BFF
            00C17C3FFC7A8FF87B57C15FF9F0F15FFE0BE1FF00E3D5F42FECF5FB44785FF6
            97F065E789FC270EA10E9D697EFA748BA942B149E6AC71C8480ACC36E255E73D
            73C57A8514514514514514514514514514514514514514514514514514514514
            514514514514515E7DF17BE01F80FE3CD869F67E3AD0135EB6D3E469AD91EE26
            87CB760031CC6EA4E401D735E61FF0EEBFD9E7FE89DC3FF833BDFF00E3D47FC3
            BAFF00679FFA2770FF00E0CEF7FF008F51FF000EEBFD9E7FE89DC3FF00833BDF
            FE3D47FC3BAFF679FF00A2770FFE0CEF7FF8F51FF0EEBFD9E7FE89DC3FF833BD
            FF00E3D47FC3BAFF00679FFA2770FF00E0CEF7FF008F51FF000EEBFD9E7FE89D
            C3FF00833BDFFE3D47FC3BAFF679FF00A2770FFE0CEF7FF8F51FF0EEBFD9E7FE
            89DC3FF833BDFF00E3D55AFBFE09FDFB376996ED3DE781ACED205FBD24FABDDA
            28FA933D79D788FE047EC3DE13DC35597C256D22F584789E77947FC016E0B7E9
            5E4FE30D47F600D0ACEE63B4D3BFB4EF3CB60834F3AABE1B1C10CCE10F3EF5E5
            DFB37F8FFE0D5AEBFAF5A69DE04BEBD792DD24FDFDF4B029DAC471891BFBE3B5
            7B26A9E35F08CC7FE25BF0F2CED47FD3CEA77537FE82E95CF6A4EDA944D716DE
            1E874FB71D5AD44EC83F1776FE758D4945145145152DBC823954B42B38FEE3E7
            07F220D753A7F8AB43B5755BFF0003E9B72ABC36CBABC89CFE3E7103F2AEBB4B
            F1B7C279640351F877756B1F76B6D52698FE4593F9D73BF1DB5DFD9F6EBE19DC
            453E9575A635C5CC3128BB7BA393BB77549187F0D69FECF9F02BF643F1CF822C
            A4D564F0CDDEBD2C926FB79BC47341385DC428F2BCF53D003D3BD7BCDAFF00C1
            3DBF670BE8126B6F01DB5C42E32B245ABDE32B0F6227A9FF00E1DD1FB3CFFD13
            B8BFF0697BFF00C7A8FF0087747ECF3FF44EE2FF00C1A5EFFF001EA3FE1DD1FB
            3CFF00D13B8BFF000697BFFC7A8FF87747ECF3FF0044EE2FFC1A5EFF00F1EA3F
            E1DD1FB3CFFD13B8BFF0697BFF00C7A8FF0087747ECF3FF44EE2FF00C1A5EFFF
            001EA3FE1DD1FB3CFF00D13B8BFF000697BFFC7A8FF87747ECF3FF0044EE2FFC
            1A5EFF00F1EA3FE1DD1FB3CFFD13B8BFF0697BFF00C7A8FF0087747ECF3FF44E
            E2FF00C1A5EFFF001EAF5AF849F05FC1BF02FC3971A0F81F465D0F49B8BA6BD9
            6DD67966DD3322216DD2331FBB1A0C671C74EB5DBD1451451451451451451451
            45145145145145145145145145145145145145145145145145148481D4E2B1F5
            DF19E81E168FCCD675CD3B498F19DD7D771C231F5622BCC3C47FB66FC10F0AEE
            FB77C4DF0F4857A8B1BB17847E10EEAF2CF11FFC152FE04687BBEC7AA6B1AFE3
            A7F67696EB9FA79DE5D796788FFE0B1BE13B6DDFD81F0F358D47FBBFDA37B15A
            67EBB04B5E69AB7FC15D7E24EBB71F67F0BFC3ED12DA57E123B83717AFF80431
            E4FE159FFF000D3FFB6B7C4BFF00900F86F59D3A093A49A7785C245F849346D8
            FF00BEA947C0CFDB93E2673AA6B7E21D2EDA5EBF69F11C76919FAC50C99FCD6A
            CD8FFC1283E3078B2E16E7C59E3DD12176EACD73737B30F5CEE451FF008F57A1
            F877FE08E1A25BED6F107C4ABFBCFEF269FA6A5BE3D833C8FF009E299E24FD93
            FF00635F819BD7C69E3AB9D4AEE1FF00596371AC09AE33E861B440E3F2FC6BE7
            FF0087BF17FE0D781BE3684F05781BFB4F4CBA927B4B6B8D565754D8C498B28E
            CE5B9080EEC1AFA5AD3C73E36F174EEBE15F0F5AE949C2B7FC23FA52C7B3DCCB
            82CBF5DC2B91F12E9D7B1DDBCDE20D723BBD473878D2E7ED937D4BA929C7420B
            E47A5732719E338F7A4A28A28A28A72052C3712ABEA066BB1F0F5978A0C0A340
            B9FED88233B8D8DB9171CE3249B6719603B9D847BD69DB7C44D312616DE29F01
            6937C63F95CDAC6DA74F9FF6BCBC2FFE3A2BCB3F691B9F825E30FEC3D17ED7AC
            7852E2466BA7826981881C6D5C390FC72FCB11D2BADD27FE093FE19F1EF8574F
            D63C21F16D26F3E047622D62BE87CC2A09512452AF009F435CCDD7FC12DFE39F
            80E77B9F06F8E749948E41B3D46E6C6763DB809B7FF1EA87FE10EFDBBFE137CD
            6F7BE28D5218FEEBAEA16FAB8207A23B48DF815A51FB7E7ED51F0BB8F1878384
            E89C3BEBFE1C9ED491EB98FCB1F8E315D7F863FE0B217D16C4F11FC33826FEF4
            DA6EA8D1E3E88F1B67FEFAAF5CF0BFFC15BBE10EAFB1356D27C4BA14A7EF3C96
            B14F10FA1490B1FF00BE6BD77C2FFB7C7C05F166C16BF1174FB476EA9A9C5359
            ED3EE65451FAD7ADF867E27783FC6814F87FC57A2EB81BEEFF00676A114F9FFB
            E18D74A083D0E6968A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A28AF1FFDACBC71E35F86FF0002F5FF0011FC3E
            B31A8789ACDEDFC8B5FB235D348AF3A46FB635E4901C9FC0D7E7B7FC2C9FDBB7
            E271DB69A6F89B4B824FBA8BA341A681F4792346C7BEEA5FF8637FDB1BE2571E
            25F165FD9472758F58F153C91AFF00C0216900FC056C683FF047BF1A6A52799E
            24F88DA45948E732358DACD7873F573166BD3FC37FF0478F01DA6D3AF78E7C41
            A991D7EC10C36A0FFDF4B257A9F86FFE0989F00F41D86E7C3BA86B8EBFC5A8EA
            930CFD444C80FE55EA7E1CFD927E0CF85369D3BE19F8683A7DD92E74E8EE1C7D
            1A40C7F5AF4BD23C3DA56816FE4699A6D9E9D07FCF3B481625FC940ACFF177C4
            0F0C7C3FB037BE26F10E97E1FB4C1C4DA95DC76EA7E8588C9F615F32FC49FF00
            82A17C13F0379B0E977FA8F8CAF5323668F6A4441BDE5976291EEBBABE64F177
            FC1573E2778FEFCE95F0D7C0769A74D36562DC926A7787DD5542A83EC55AB047
            C0BFDB2FF69FF9FC53A8EAFA3E9371F7935CBD1A6DB60FADA44037E7157A2F86
            3FE093BE13F05694DADFC57F89C2DEC205DF70B6023B3822FF007AE262D91FF0
            05AF10F8DBE39FD9DFE11F88ECA2F839A1A78A2F2CD07997D7C2496DC5C2B644
            81E6C96EDF7142FCBC1E735F417857C6DF10FF00696F0A59EAB69BEDBC3D2C3B
            A448B169A7DB85FBEACC480C108E84B100564EAF61E1CF0BEEB78AEFFE127D4C
            70F243BA3B18CF43B4F0F2FD46C1FEF0AC1D4ACEEA0DB25EA8B792401D202A15
            B69190760FBA08C11D3390464735428A28A28A2AFDAC32C101BBFB3A5DDA2B05
            903025549E81B0415CF63919C1C13835D3E87E11B4F164919F0CEA82CF590414
            D2F50944523B6463C99B85739E70DB08EDBB19AE94FC54F11785651A478FF408
            7C436D0A91E56B9062E1179C94988CFF00C08EEE9C1AF9F2CFC07F07FF006C3F
            8D0D65A46BD73E099AE1CDBC16F753A901114E0C6B213E616392155F3CF415D2
            F887FE099DF1CBE0E6A2FABFC2DF1A45AB3A728FA6DEC9A55EB63A705B67FE44
            AA56BFB6AFED4FFB365C4767F117C3D3EAB6084206F11E98C9B87FD33B98B687
            3FED12F5EFBF0CBFE0AE7F0EFC45E55BF8CFC3DAAF846E5B01AE2DF17D6ABEA4
            950B20FA043F5AFABFE1CFC7FF0086FF00176343E12F1968FAE4AC33F6586E54
            5C01EF0B61D7F1515A3E26F837E02F1AEE3AFF0082FC3FAD17EAD7FA643337D7
            2CA4E7DEBC8FC51FF04F5F805E2ADED2F806DF4F99BA49A65D4F6DB7E8A8E17F
            315E45E28FF82447C2BD4F7BE8BE22F12E8B29E88F3437112FE0630DFF008F57
            92F897FE08E7AF5A967F0DFC4AB1BC3D523D4B4E92DB1F564793F3C57327F626
            FDAF3E167FC8A9E2CB9BC8E3FBB1E85E27921461FEE4C6207E8451FF000B5FF6
            E8F851F2EA1A5F89354B58BEF09F4487514FA9962466C7BEEAB7A77FC157BE2F
            F842E56D3C61E03D1A7917EF235BDC58CE7D73B9987E4B5E9DE18FF82C6F862E
            760F117C3BD5B4DFEF369B7D15DFE203AC5F966BEECF86DE3DB0F8A3E02D0BC5
            BA5C1756DA6EB36A9796F15EA049846E32BB829201C73C135D2D145145145145
            1451451451451451451451451451451451451451451451451451451451451451
            51CF7115AC2F2CD22431202CCEEC15540EA4935E1DF123F6DFF829F0BBCD8F55
            F1E69D79791E47D8F48637D2EEFEE9F283053FEF115F2BFC48FF0082C36956E6
            5B7F01F812EAFDB9097BAEDC2C2A0FAF931EE2C3FE06B5E547E387ED99FB4F9D
            BE17D3B57D1B49B8FB8FA2590D36DB07FBB77290DF94B5BDE10FF8250FC4CF1E
            DF8D57E2578F2D34D9A621A5F2DE4D4EF1BD9998AA83EE19ABE9BF86FF00F04B
            EF827E06F2A6D534ED43C637A983E66B174445BBDA28B6291ECDBABD7BC4FE37
            F839FB2AF873FD3E7F0EF80EC0AEE8ECACA08E2967C7F7218977C87DC29F7AF8
            AFE337FC15B2EF51B97D1BE117851E49A56F2A2D5B5942F23B1E07956C87AFA1
            663EE9DABCE7C3FF00B1F7ED29FB606AD06BDF1375BBCD074973BD25F11310E8
            A7AF916298D9F422307D6BBBF8A3F063F661FD8C7C1D7963AE5D5C78EBE254B0
            66DA091D659A293AAB98462385338399373E33B7757927C02F8BBE3CF8D9E257
            F08089AD3C31732836B0C64C765692703123FF0011200EB9391F2819AFA03599
            BC39F0D7FD0742962F11F8907136B12206B6B56EE2DD0E43B67FE5A367180540
            278C0D6B4397C391FDA75E66975EBC1E7258CC4B49186E7CD9F3C8639C843C9C
            EE6C0C07E7EF2C66B31179E0A4D2A89046DF78291952476C8391EC41E8455620
            A920F51C52514528058E00CF7AB305B486DDAEA3559522204A87F841E848F43D
            33D8FA6467A1B2B1BCD36C7FE124F0FCA65B68488EF212A1DADF771B654230F1
            374048DA7A100F5E8F4CF0668FF156167F0CBC5A2F89D14BC9A14D2621B9C0C9
            6B67639078CEC627193CE0579F7C63FDA8350F867A03FC3DF1D69475C1763C97
            8AFE3FF4BB184F05D58F272090B939C746000ACAF08FFC13BFC2FF00B427C2F4
            F187C2DF1DD9DBEA6EED9D26E5CCD045FDD8E46199217E33F306E08E3BD6369D
            F1AFF6A3FD856FA1D33C5D6379AC785A3711C71EB21AF2C9D7B086E94E50E3A2
            6EE3BA76AFAFBE0AFF00C14A3E117C67B78F49F1430F046AD70BE5C969AE157B
            2949EA16E31B71FF005D027E35DC7C42FD857E057C60B637B27842C74E9EE177
            C7A97871FEC8581E77811FEEDF3D72CA6BE54F88FF00F047DBBB495EF3E1D78F
            81743BA2B3D7E128CA4723F7F083CFFDB315E7FF00F19A9FB2A9FF0098FEBBA1
            DBFD35BB4F2C7FDF6F12FF00DF15E83F0E3FE0B0377692A59FC45F0082E876CB
            79A04C51948E0FEE263D7FEDA0AFAC3E197EDEBF047E2979515978D6D746BF93
            03EC5AF0364E09E8373FEED8FB2B1AF7DB5BB82FADE39EDA68EE20914324B130
            65607A104751535155351D22C758B66B7BFB2B7BDB76FBD15C44B229FA82315E
            63E27FD937E0DF8C379D53E1AF86E491FEF4D6FA7C76F21FABC615BF5AF47F0D
            F8774EF08787B4CD0F48B55B2D2B4DB68ECED2D9092228A350A8A09249C28032
            4935A54514514514514514514514514514514514514514514514514514514514
            514514514514515C5F8FFE34780FE15C0D278B7C5DA3E8042EE115EDE224AE3F
            D98F3B9BF006BE5AF891FF000562F849E14F361F0CD9EAFE34BA5CEC7821FB25
            B13EEF2E1C7E119AF9D35BFF008294FC7CF8CFA849A5FC31F06C7A5B370ABA4E
            9F26A97899F566529F8F962AA41FB18FED5BFB47CC973F107C4173A5D84843EC
            F11EACCCAA3FD8B68B7043EC552BDC3E1BFF00C120FC0FA37953F8D7C59AAF89
            27182D6DA7C6B65013E849DEEC3DC32D7D53F0E3F657F84DF09BCA7F0C780F47
            B2BA8B1B2F6683ED1723E934BB9C7E75EABC28EC057CFF00F1BFF6E8F847F028
            5C5AEA9E214D6B5C8B23FB1B44C5CDC061FC2E410919F67607D8D7C37E38FF00
            8286FC71FDA375B93C33F083C3373A0C337CA174984DE6A050F1B9E62BB621EE
            AABB7FBF5B7F0AFF00E095DE39F88BAA7FC245F197C5D369D2DCB0967B4B7B8F
            B76A331EE249D89443EE3CCAFB2741F857F01FF628F08C9AF1B2D27C310C2BB5
            F5AD49BCEBE9DB1CAA3B65D98FFCF38C73D96BE30F8E9FF0523F1DFC6DD77FE1
            07F819A2EA3A6C378E608EFE084CBAA5DFAF94AB910AE3273CB01CE53915B1F0
            4BFE09AB63E1FD3EE3E21FED13AFC76F6D0A9BEBAD24DEE157BB35DDCE79249E
            550F271F39CE2BC4BF694F8F161F1B3C6D6FE09F813E159B4BF0F431FD8E35D2
            EDBCA92FD53F8962503CA8F00939E48E5B032B5EB7F08BC7DA37C2AD02D2C7C4
            D35B6A9F161E2DD6513FCD6F6E838131CFDE9463BF7191D093D969BA19D37459
            7C77E2B06F24BB91BFB36CAE8E5AFE7EA65901E4C4A4E4FF0078E0743CE22D9C
            F168B73E2AD51DE4B9BE9DE2B1321F9A697ACB37D1320678F9D97FBAC2B1EFB4
            C6D3F4DB069011717AA6755F48B2554FB12439C1EC14F7A8AEF4D7B5D46EAD1F
            01EDB72C841C80CBC1E7D370FD6ABB5ABADA457047EEE4768C1F750A4FFE842A
            C269724B7B776A8A649A1591C05E72101663F40AAC7F0A963B2906911EA96F9C
            DBDC0865207DC620B464FF00BDB5C63FE99FBD6E4E9FF08CDCE99E20B2823B9D
            1B52460D6AF931E4713DB3F248C6720E73B591810DD362F6CEF3E196A3A6F8B3
            C3531BDF0E6A2A442F3AEE5653FEB2D2E17A123041ECD8DCBD38A1F179346D2B
            C1A3E20780CC86ED4E64F0DC3213756B7039CC4472501E72391DBFBABE35F02F
            E20F82BF6B5F1E47E19F8E97B1D9EAB741A3B3D5CE2179A43C244B2E31137A03
            F2B600C64E0EB7C51FD903E33FEC4BE2797C77F0A75BBFD67C3D065DEF34E4CD
            C431039D9756FCAC918EEC032F192138AFA1FF0066FF00F8295F827E3358C5E1
            2F8AD6761E1AD6AE57C86B8B850DA55F67821B7E7CA27FBAF95FF6B902B7FE38
            7FC1303E177C548E6D53C1CEDE03D6261E62B69CA25B0949E413012368E9FEAD
            940F435F265D7807F6A8FD826E64BBD16E2EF56F07C2C5DDEC0B6A1A5B2F5264
            8586E873DDB6A7B31AFA2BE05FFC1597C1DE2C36FA6FC49D265F076A4D853A95
            986B8B173EA579922E7B61C7AB0AFB83C2BE2FD0FC73A2C1AB787B57B2D6F4B9
            C663BBB09D6689BDB729233EDDAB96F88FFB3F7C38F8B91B8F17783348D6E561
            8FB54D6CAB7007B4CB875FC1857C9FF137FE0919F0EFC45E6DC7833C43AAF846
            E5B256DEE317D6ABE80062B20FA973F4AF01BAFD8ABF6A7FD9B2E24BCF875E21
            9F55B0462E57C39A9B26E1FF004D2DA5DA1CFF00B203D5EF0F7FC14CBE397C1C
            D4A3D23E28F82E3D55E3FBE9A95949A55EB63A9C85D9FF0090EBE99F867FF055
            0F839E35F260D79F53F055EB601FED1B7335BEEF6922DC71EECAB5F52F833E23
            F857E22E9E2FBC2FE23D2FC4169804CBA6DDA4E173D9B69383EC79AE8E8A28A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
            A28A2BE28F8FBFF04D4D33E3E7C78D57C7779E2E9743D2F518A0371A7D959879
            A4952311B30919B6A82A8BFC2DCE6BBCF86FFF0004E5F819F0E7CA95BC2C7C51
            7A98FF0049F10CC6EB77D621B623FF007C57D17A2787F4BF0D69F1D8E91A75A6
            97651F096D6502C31AFD154002B42A96B3ADE9DE1DD367D4755BFB6D36C2DD77
            CD757732C5146BEACCC4003EB5F1C7C70FF82A6FC32F875F68B0F07453F8FB59
            4CA87B56F22C51BDE6604BFF00C01581FEF0AF94AE7E247ED57FB76DCC969A05
            B5EE93E12998A3AE980E9FA6AAF42249D8EE9BDD3737B2D7BE7C10FF008248F8
            5FC3FF0067D47E276BB2F8A2F4619B4AD2CB5BD983DD5A4E24907B8F2FE95F70
            783FC09E14F857E1E1A7787345D37C35A440BBDA3B385214181CBB918C9C7566
            E7D4D7C7BFB4E7FC150BC27F0D8DDE83F0DE383C69E245CC6DA8EE274DB66F66
            073391E8842FFB7C62BE6EF871FB25FC70FDB8BC4D078DFE286B57BA2F87653B
            A3BDD4D312BC44E765A5AF0110F1F310ABCE46F39AFBA2D3C37F043FE09F1F0C
            27D50410E92A53CB6BC9B13EA9AACA06446A782C49E76AED45EB851935F0278C
            3E21FC63FF008297FC4C1E1CF0E59BE8FE09B394482D37B0B3B24C9027BA900F
            DE484670A07A855FBC4FD29E2C7F85DFF04C2F840D6BA3DB5BF89BE286B96E63
            49AF1419AE8F4324801FDD5B29E880FCC4019272C3E47F849FB36F8C3E2BE85A
            EFC78F1C4CD69E1AB595F506B9B993C97BE2849774E9889718E319236AF22BB5
            F85FFB41DE7ED23F1321D2BC467FB3349B551145A8228586D2CD3801C0E039F5
            1C127B0191ED6FF65F8D9F1374FD2F40648BC2F6A82DAD2484831C5651E4B4B9
            F56F99B27A96009A4D12483C69F156FB588EDC1D17488A4D4160DBF2ADADAA7E
            E6323D0848D0FD4D73FE1BB1FB47847C69AACC03F9705BDBAB3751249708D9FF
            00BE6271F8D45AA59887E1BF87AE31869B52BEE7D408ED80FEB5B37F696FE1CF
            88BE1BB8B98C8D36F2D74FB9994FF1C52C3189BF3CC82ACF84BC3A9A67C45D67
            C0DAA48A90EA3E6E98267070B306DD04A07BBAA7E0E7D6AC7C33B38EFB51D67E
            1C78849B45BF9196DDE4FF00974BF8F2148FF7B9438E4FCA2BCFA3FDA1F46F83
            BAFEB3F0CFC4B0A6A71EA329B59ED4BFEEACAE7A24DBFA0FE1E476DA7200E7E7
            9F18C7E3EFD9EBE2869DE2DD76DEEF54F0EEAB2110CD22B4705FDB2B02D129E8
            8CA0F6E9D464135F5C7C5DFD8DBE1F7ED7BF0AEC3E27FC0D9EDF4ED7DE0CCB60
            C4471DE48A3E78A65E90DC03C6EFBADC67821C721FB26FEDFBE20F82BAF0F859
            F1CA2BE8ACEC6516716AB7D1B7DAF4D23811DC03F33C5D30DCB28FEF2E36FBF7
            ED1FFF0004F0F877FB4469CDE2BF035CD9F85FC497B1FDA62BED3807D3B50DC3
            706911381BB39F323F52487AF91FC13F1EFE3CFF00C13D7C510784BC6FA55C6B
            1E110C443A7DF485EDDE30796B2B900EDEC76720679404D7E92FC00FDA9BE1F7
            ED25A28BAF0AEACA3528D035D68B7B88EF2DBD77264EE5FF006D495F7CF15C6F
            C75FD80FE127C72FB45E4FA20F0C6BF2E5BFB5B420B03B37AC91E364993D495D
            C7FBC2BE1FF14FEC53FB44FEC8FACCFE23F857AF5E6BFA6C677B4BA0315B8651
            D04D66D9120FF657CC1F4AF41F82DFF0569BCD32E9344F8C1E179229E26F265D
            5F478CA488C383E6DB39EBEA5587B257DF1F0BFE35F81BE3468E352F05F89AC3
            5EB7001912DE4C4D0E7A09226C3A1F6602BB7ACBF10F85B46F1769D269FAE693
            63ACD849F7ED6FEDD2789BEAAC0835F33FC4CFF8267FC10F885E6CD65A25D783
            EFDF27CFD06E0C699EDFBA70D181ECAAB5F2D78CFF00E0943F123C05A81D5FE1
            8F8F2DF519A125A2595E4D36F17D91D0B293EE592BE80FD83AC3F68ED23C59E2
            6D27E32DDEAADA0E9B651AD926ADE55C34D70EFF00792E9773481551811BCE37
            AF4AFB468A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28AE2FE26FC66F047C1BD20EA5E33F1369FA05B104A2DD
            4BFBD971D44718CBB9F6504D7C1FF1ABFE0AE111965D27E13785DEFAE1CF969A
            BEB68429278063B743B9B3D8B30F7535E55A37ECBDFB4EFEDA1A941ACFC42D56
            F743D09DBCC8E5F10B1823407BC1648060E0F52A808FE235F637C0FF00F826A7
            C24F84BF67BDD5EC5FC77AE4786375ADA836EADFEC5B0F931FEFEF23D6BEAEB5
            B586C6DE3B7B789208225089146A15554700003802BC4BF68BFDB17E1D7ECD96
            0E9AFEA6350F10B26E8340D38892E9F2382E3388D4FF0079C8C8CE031E2BF3AB
            C4BF16BF682FF828B78967F0F785B4F9748F06AC8166B2B491A1B0817A837770
            46656C60EDEF8CAC79AFB33F663FF8270F80BE06FD935AF11AC7E37F18478717
            57917FA25ABF5FDCC2720907F8DF2780405E95DA7ED5FF00B68783FF0065ED0D
            A09DD35BF195C45BACB4182401803D2498FF00CB38FF0056FE107923E03F853F
            01BE2C7FC1457E22378EFC7FA9DCE99E0D490A7DBCA6C8C461B9B7B188F181D0
            B9C807258BB641FB97E2DFC50F869FF04F6F8236FA7681A55B417922B2693A24
            4DFBEBF9F0034D33FDE2A382F21F651CED15F157ECB7FB35F8B7F6E3F8A57DF1
            63E2ADC5C4DE13FB4EF919F31FF693A9E2DA01FC1027DD2474C6D1F36E2BD07F
            C1413F681B8F899E2ED27F67AF85B6C26D2AC6E61B1BBB6D3142A5D5DA90B1DA
            205E04711C6474DC3B7960987F69CF847E13FD8CBF65CD0BC2B04FF6BF895E27
            CADEDD44FC32E3370D8C67CB50CB12838CE770C1DF9F36F06D8F8E7F659FD9B6
            7F1D3B4DA7CDE338D2D6C22B9C32182419C043C82F1EE7DC3B6CE4106BACF871
            FB465BF867F67CF11EB9E22D1E5B6BCD7678B4FB6B8B2C30F295F2E7693901B0
            E0F3FC02BAED2FE2E78313F6707BF3AAADA4FAAEBC883ED11BA6E8D227C738C7
            0C1FBD6A78B7C6FE138BE03F80EF17C41A77EF6EEF99B370A392E17D7D23AADF
            1AFE2BF83ADBC13F0E35C935FB790CBA4FD848843484792DC7DD07FBE7F2AE73
            F692FDA4B4AB0BBF0978E741B3BABDB9D5EC2DE77B9C88916EA355E73C91C6CC
            0C0FBA6BCF7F6ABF1E78DBC71A3685F1534849B47F0FEAC902DCB69C8C91C575
            B372E65EE4852319EA9EF5D878EBF6684FDA27F658B3F8D5E129C5F78A2CA266
            D4B4C813E77488959E3C724BA603A9CE590918CEDCFB2FEC73F127C2BFB69FEC
            FDA87C14F89114771AFE8D6E3C89F859E680711DD46DDA68CB0563DF20B6EDEC
            2BE7EF0A789BE217FC131BF6829F46D6639B57F056A6E1A5488110EA56A0E16E
            21C9C2CC99E549EB9527055ABEE7F8EDFB367C35FDBBBE1969BE2CD06FADE0D6
            67B5F3349F135A264B0E7F7370BC1650D9054E190E718F981F89FE0E7ED0BF14
            7FE09E7F111FE1EFC46D32EB50F0719371B2DDBC246CDFF1F36321C0653C929C
            02720EC6C91FA716773F0E3F6A7F85B1CEB1E9BE34F086A899D92A6F0AC07208
            3F34722E7D994FA57E7F7ED01FF04D3F17FC25D6BFE139F815AB6A176B66E6E1
            34A8E731EA568473982418F340E7E5E1F1C7CE4D6FFECD9FF0548B9D2AF62F08
            FC70B196D2EE07FB39F11436C51E3607045D4006410739641F54EA6BF45FC3BE
            24D2BC5DA2DA6AFA26A36BAB6977682482F2CE55962957D5594906BCE3E34FEC
            B1F0CBE3EDAB8F177862DAE7502BB5356B51E45EC7E989570580FEEB6E5F6AF8
            1BE28FFC1303E247C23D60F89FE0BF8AEE3556B626486DFED1F61D4E1F649148
            493DF9427A05350FC36FF82977C56F821AD2F85FE33F856E75916E424925C5B9
            B1D4E25E9B882024A3038C8527AEF35F7AFC11FDAE3E177C7F8235F0B78960FE
            D565CB68D7F8B7BD4F51E5B1F9F1DCA161EF5EC7451451451451451451451451
            451451451451451451451451451451451451451451451451451451457E65FED2
            5FB6F7C77D73E2EF887E147C38F09CBA16A3A7DDBD997D3ADDAFF509D01F9655
            62BB634752AE0EDC80C0EE1581F0CBFE097DF12BE2D6AE3C4BF19BC5B3692F72
            4493406E3EDFA9CBECF231289EC72F8FEE8AFBC3E0AFEC8FF0B7E01C513F85BC
            2F6E3544186D62FC7DA2F58F72246FB99EE1028F6AF63AE6FE207C47F0CFC2BF
            0DDC6BFE2CD6ED342D2601F35CDDC9B413D95475763D954127B0AFCDBF8F9FF0
            530F187C58D67FE109F817A3DFDA0BC736F1EA8B6E65D4AEC9E3104433E503CF
            CDCBE39F908AD7FD9D3FE096FA9788EFD3C5DF1CB539E6B8B87FB43E8105C992
            7998F24DD5C024E4F75424F3F7C1C8AFD19F09F84344F01E816BA2F87B4AB4D1
            749B55DB0D9D944B14683E83B9EA4F527935F167ED9FFF00051DD33E159BDF05
            FC349ADF5BF190CC373AA2E25B5D35BA10BDA5947A7DD53F7B2415AF26FD943F
            E09EDAFF00C5CD717E277C7392FA482F64FB647A35F48DF6CD418F3E65CB1F99
            10F64E18F7DA00DDF707ED05F1F7C1BFB25FC2C5D4EF61821F2E3FB2E8DA0598
            589AE5D57E58D140C246A31B9B1851EA4A83F9C7F013E0778E3FE0A1DF19AFFE
            22FC44B99E2F06DBCE16E668F28922A9CAD8DA8FE1500FCCC3A0249259B27EBF
            FDB93F693D2BF64CF83965E0BF04A5BE99E27D4AD3EC7A4DA5A00A34DB5036B4
            E1474C7DD4F56C9E76915E67FF0004D2FD9623F03F8765F8D7E398D61D56FEDD
            E5D245EF1F64B42097BA62DD1A419C1EC9939F9F8F04816F7FE0A29FB7297613
            37822C24C9072043A540DC0FF65A666FA8698F65AEC3FE0A85E339FE207C6AF0
            2FC1AF0CC6AEBA5470C62CA01B54DE5D1558A3DA3A6D8C478F4F34D2FF00C14B
            7C1DE1DF82FF000A3E117C3AD0ED625B98D1E6B9B90BFBC944114712B313CFCE
            D248D81C6431C66B95FDAEFE075B7C1AFD91FE126FB973A96A2F6D2CF6BB36AC
            521B57926C924E4EF9001D3BF073C657C76F81AFE12FD853E1778BFCD56FB65D
            5B398C372AB3C53C99C6D18C90BDCF5AD0F1D7C0AB4D4FFE09C7E13F88D6F2CA
            F7963708F2202A51633732DB371B723E729DEBAAF06FC15D1FE37FFC1366F75D
            D3E1924F167860DC4A76B6E5636D2B48D818C826DA4C601C1214E33D7B9FF827
            E47A37ED21FB23F8FBE0D6BA2313D948CB1CBB0178E29B32412FAB3473239FA0
            51D2B87FF82707C52D4FE027C7EF12FC13F1813670EA97525BC714A7E4875287
            2BC13C62545233FC4562C75AC9FDB1BE0C6BBFB14FED07A37C5CF87686CBC3B7
            F7A6E6058D4F9569727266B4703FE5948BBCA8E3E52EA3EE66BEDFD5341F87BF
            F050FF00D9B2C6EDD4449791992DEE570D73A3DF28C3AF6CED3C15E03A9078CA
            91F077C0BF8C9E37FF008274FC6FD43E1FF8FEDE79FC1B77386BA862CBC7B18E
            12FAD73D4103E651D429520328C7E95FC55F843F0F3F6B4F8616D6BAB241ACE8
            F7B08BAD3358B161E6C05972B2C32738ED90720E30C0D7E64EA3A47C63FF0082
            61FC5517967236B7E08D4660BE6618586A718E424839F26703383D47382EB907
            F4DBF676FDA5BC1BFB4B783975AF0C5E6CBC842ADFE9170C05CD9487B3AF753C
            E1C7071EA081CCFED29FB15FC3CFDA56CA5B8D56CBFB1BC50136C1E21D3902CE
            3038128E92AF4E1B903EEB2E6BF3C750F0E7ED09FF0004D9F14BDFE9F3B6ABE0
            99E71BE68D5A7D2AF327004A9D60908C0CFCA78C06600D7DE5FB30FEDEFF000F
            FF0068C8ADB4B9265F0AF8C9800DA25FCA313B77FB3C9C097FDDC06EBF2E066B
            E9AAE3FE24FC21F067C60D15B4AF197872C3C416783B05DC40BC44F531C830C8
            7DD4835F057C6DFF0082492C73CBAC7C23F12BD8DC2379B1E8DACC870A472045
            70A3231D83A9F7715E5FE1DFDAEFF692FD8DF57B7D03E2668B7BAF68E876243E
            200599D475F22F9776FF00C4C807A0AFBABF66EFDBABE1CFED297B0E8DA54979
            A378ADA3691B45D4223B9828CBB4722E51947B90DFEC8AFA2E8A28A28A28A28A
            28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28AA
            96FA5595A5EDD5E4167043777654DC4F1C4AB24C546D52EC065B000033D00C55
            BA6C922431B3C8C111465998E001EA6BE26FDA73FE0A75E0DF855F6BD0BC00B0
            78DFC50998DAE91F3A75ABFF00B4EBCCC47F750E3FDB0462BE5CF00FECC9F1DB
            F6F4F12DBF8CBE22EB377A3785E43BA1BFD4A32A3CA273B6CED460053C7CDF2A
            9EB9639AFD23F807FB2E7C3DFD9C746169E12D1956FE440975AC5DE25BDB9FF7
            A4C0C0FF006542AFB66BD3F58D66C3C3DA5DD6A7AA5E41A7E9F691B4D3DD5CC8
            238E240325998F0001DCD7E5FF00ED55FB7FF897E38EBE7E17FC0D82FDACAFA5
            36926A9651B0BDD4C9E0A4007CD1C58CE5B8623AED19CFB67EC61FF04E7D27E0
            F0B1F18FC438ADF5DF1B8C4D6F607125AE96DD411DA4947F7BEEA9FBB92031FA
            63E3E7C79F0BFECEBF0F6F3C55E26B9DB1C7FBBB4B18C8F3AF6723E58A31EA7B
            9E8A0127815F97BF0C3E1C7C41FF0082967C75BCF16F8B6E26D3BC1561284B89
            E1C88AD610772D9DA83C1720E4B76C966C92AADFA73E35F157823F64BF8213EA
            06D61D1BC2FE1EB4115A69F6D80D2BF448933F79DD8F53C924B31EA6BF34FF00
            666F853E21FDBF7F691D5FE24F8F91A5F0969F74B3DE4673E4C8473058459FE0
            0B8DD8E76F5F99C1AFA7BFE0A83FB4147F0AFE0FDB7C3DD0E65B7D6FC5319865
            484ED36FA7AF12703A79871181D0AF99E95B1FF04F9F82767FB38FECE377E35F
            1222D8EAFAEDB1D6B509A5186B5B2442F121F4C26E908EB9720FDDAF967F614D
            0EF3F69BFDB67C47F1475985A4B3D2A69F5A6593E6549A56296B17FC017257FE
            B88A77EDE5237C6DFDBEBC2DE02898C905AB699A23AA9E14CD209A46FC16719F
            F77DABD17FE0B217EB6DA27C2AD2A3C2A3CDA84DB1780022DBA8E3FE066BA4FD
            B1FC39F62FF8268780EDB6E1B4CB2D099BEBE42C64FE6E6AC7ECE1E1CFF8599F
            F04B1D5BC3A17CD9974DD5D604EB9992E259E21FF7DEDAE6BFE08FBE298B54F0
            6FC49F055D859218AE60BF5824E56459A368A5E3D3F73183F515E51FB30DD4BF
            B24FFC142B54F01DE48D068FA95E4DA10321FBD14C44B64FF563E48CFF00D346
            AEE7FE0AA5F04AF3C17E34F0E7C6DF0C07B39A59E2B6D467B718686EE2F9ADAE
            323B954DB9E80C69DDABEB8F00EB1E17FDBB7F651B7FEDA863921D6ACFECBA8C
            51637D95F4780CC99FBA55C075CF552B9E0E2BE06FD9A7E27F883F600FDA6758
            F871E3B95A3F09EA172B6F7B31CF9299FF00517F1E7F8482377FB24E72C800FD
            0BFDAAFF0065EF0E7ED55F0E4E9D72D15A6BB6A8D368DAD22EE304847DD247DE
            89F0030FA11C815F01FEC97FB4D78A3F62AF8A17DF08FE2B43716BE16176637F
            3B2E74B958E44F11FE281F21881C60EF5E7706FD4DF147857C35F15FC1B71A46
            B56567E21F0E6AB00DD14989229A361957561F81565391C107A1AFCADF8FFF00
            B297C45FD867C72BF13FE13EA77D73E158242C6E631BE6B0427986E93A4909E0
            6F231D03007693F6BFEC7FFB727863F69AD2A2D2EF4C3A078F6DE3CDCE90EFF2
            5C803996DC9E597B95FBCBDF206E3F4A6A5A659EB36171637F6B0DF595C218E6
            B6B88C491C88460AB29C8208EC6BF3F3F69DFF00825969BAEC973E26F83B3A68
            3AB29333787AE242B6D2B75FDC487989B3D14E5738C1402BCB7E09FF00C1413E
            25FECD5E231E02F8DDA36A7AB585991134D789B754B34ECC19B8B84F42C72472
            1C8C0AFD2EF85FF173C23F19BC310EBFE0DD72D75BD364C06681B0F0B633B244
            38646FF658035D8566788BC33A478BF48B8D2B5CD2ECF58D32E06D96CEFA059A
            2907BAB020D794FC24FD907E19FC0EF887ABF8C7C1DA349A56A1A95AFD91ADFC
            F324102170EFE52B64A6E2172338F94000739F69A28A28A28A28A28A28A28A28
            A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28AF17FDA1BF
            6B7F879FB36698CFE26D545C6B4E9BEDB42B0C497937A12B9C22FF00B4E40E0E
            3278AFCE3F187C74F8FDFF00050AF12DC785BC17A5CFA3F840B6D9AC2C2431DA
            C719E86F2E481BF8E76700E3E542457D79FB31FF00C1357C0BF063EC9ADF8BFC
            9F1C78B531206B98FF00D06D1FAFEEA23F7C83FC6F9E8085535F63AA85000000
            1D85719F16BE307853E08783AEBC4DE2FD562D2F4D83E550DCCB3C98C88E24EA
            EE71D07B9380091F95BF12BE347C5CFF00828FFC475F05F8274E9F4AF0643289
            058F985608A3078B8BE94704F70A32011850CDC9FD07FD957F637F077ECBDA00
            3631AEB1E2DB98C2DF6BF7118123FAC710E7CB8F3D81C9C0DC4E063D1FE32FC6
            3F0CFC09F00EA1E2DF155E8B4D3AD57091AE0CB73290764512FF0013B6381DB0
            49200247E54E81A1FC46FF00829EFC7E9752D4DE5D1BC13A5BED91E3CB41A5DA
            93910C59E1E77C7271C919202A851FACDF0F7E1F7873E0FF0081F4FF000D7872
            C61D2742D321DA91838E072CEEC7EF31392CC7924935F959FB517C5BF107EDED
            FB46E8FF000CBE1FBB4FE14B0BA682CE404F93338E26BE931FC0ABBB6F7DA38E
            5C8AFD34F85FF0E7C29FB32FC1CB5D0EC1E3B0D0742B37B9BCBF9F0A652AA5E6
            B894FA9C127D0600E0015F985F0B347BFF00F82847EDBD7BE24D62091BC1BA74
            C2F278251958AC216C5BDB1ED990E3701D774AC3A57D8BFF00053CF8B6BF0D3F
            66CB8D06CE510EA7E2A9D74B8D50E196DC7CF3B0F6DA1633FF005D68FF008260
            FC22FF00856FFB375BEBD750F97AA78AEE1B5372C30C2DC7C902FD0A86907FD7
            5AF947F64B1FF0BDFF00E0A49E20F181FF0049B1B1BCD4F5842791E50260B7E7
            DBCD8B1FEED6E7FC162B53F3BE22FC3AD3739F234DB89F1E9E64AABFFB4EBEA0
            FDBDBC39F63FD833C4560170DA6DA696147A6CB9B753FA66B07FE094D76BA9FE
            CA735AB81225BEB7796ECADC8C1489F1FF008FD7CC9FF04F895BE0EFEDD9E2DF
            014CC523B85D4F4658D8FDE7B797CC56F7F9217C7B3574BFF0569F87173E12F8
            8BE07F8A9A46EB696E5458DC5C443063B981BCC81F3FDE2A580F68457DBB6D6F
            A17ED87FB2CDB2DF2A7F67F8BB444690A0DDF65B9DA0E57FDA8A65E3DD2BE09F
            F82757C4FD53F677FDA2BC47F05BC5EC6CE0D56EDED16391BE487528B210A93F
            C32A8DA0FF0011F2ABEA8FF8286FEC9EBFB40FC35FF848340B40FE3AF0EC4D2D
            A08D7E7BDB7FBD25B9F53D593FDAC8E37935E75FF04C3FDAC1BC6FE1C1F09BC5
            5767FE122D16127489A76F9AEAD17AC3CF578BB0EE98E3E426BD9FF6D4FD8EF4
            9FDA83C17F68B35874EF1DE97131D3352618128E4FD9E623AA31E87AA1391C16
            0DF21FEC35FB616AFF0000BC5CFF00057E2E19F4CD32DEE4D9D9DD6A070DA4CF
            9C793213FF002C589E1BA2E739D872BFA95716F06A1692433C71DCDB4C851E39
            14323A9182083C10457E697ED81FF04EED4FC15AAC9F133E0725CDACB692FDB6
            7D034F7659ED5D4EEF36CC8E703AF96391FC191851DF7EC57FF051BB3F88CF65
            E06F8A3710E93E2E044169ACC80456FA83740920E04731FC158F4DA700FDE80E
            6BCE3E36FECF3E04FDA0FC3A749F19E8915FEC07ECD7D1FEEEEED58FF14528E5
            7B1C1CA9C0C835F9A3F143F644F8D3FB10F89E5F1D7C2BD6EFF59F0F419692F3
            4E4CCF1440E765DDB72B220EEC032F192138AFA4FF0065DFF829E784FE27FD93
            C3FF001196DFC19E276C4697E588D3AEDBFDE639858FA392BFED64E2BEE08A54
            9A359236574600AB29C823D41A7D145145145145145145145145145145145145
            14514514514514514514514514514514514514514515F3A7C7FF00D86BC01FB4
            5FC4AD03C5FE256BB825B080DBDE5AD8B08C6A280831AC8FD576E58657E62180
            C8DA2BDBBC17E06F0FFC3AF0F5AE85E19D1ED343D22D8622B4B2884683D49C75
            63DD8E493C926B76BC23F6A4FDAFFC1BFB2F7877CDD5651AAF89AE632D61A05B
            4804D3760EE79F2E3CFF00111CE0ED0C4115F9DBE02F855F183FE0A51F128F8B
            3C5B7F2E93E0BB594C66F7CB2B6B6C99E6DECE227E77E99624E319762700FEA8
            7C1DF82BE11F811E0DB6F0CF83F4A8F4EB08BE69653F34D7326399257EAEC7D7
            A0E8000001A1F137E267877E10782B53F1578A7504D3747B08F7C92372CE7F85
            117AB3B1C00A3A935F933A96A1F11FFE0A7FF1FD2D6D165D17C13A5B6555B2D6
            FA55A93CBBF679E4C74EA48C0C2A923F573E10FC23F0D7C0FF0001E9DE12F0AD
            8AD969966BCB1C196790FDE9646FE2763D4FD00C0000F8C3FE0A73FB5AB78434
            56F845E11BB27C41ABC43FB6A7B7396B6B671C4031D1E50791D90FFB608F4CFF
            00827B7EC94BFB3DFC3AFF0084835FB40BE3CF10C4B25D875F9AC6DF864B61E8
            7A33FF00B581CEC06BCEFF00E0AB7FB447FC21FE02B0F85DA3DCEDD5FC4405CE
            A4636F9A2B156F950FA798EB8FF763707EF57B0FFC13FBF678FF008505F022C0
            EA36DE4F8A7C43B753D537AE1E2CAFEE603FEE21E476677AF8AFF6EDD72F3F69
            AFDB63C37F0B746999ED34B9A0D15593E6549A560F752FFC017686FF00AE26BF
            477E31EB765F047F671F14DEE9AAB656BE1EF0F4B15846A7011921D9020FF816
            C15F117FC11CFC1198FE22F8C658FEF35B6956F263D374B28FD61AE1FF00E0A7
            7FF1537ED8DE04D117E65FECAB0B629FED4979367F465AFBB7F6E4D3FF00B47F
            648F8930E33B74BF3BFEF8747FFD96BC1FFE08FDA879BF013C5B659C987C48F2
            E3D37DB403FF0064AF02F8FA3FE147FF00C150F46F102FFA3586A1AB69D7E5BA
            6219D561B86FCFCE35F77FEDD3F0987C62FD993C5FA6430F9DA9E9F07F6BD800
            32DE6C1972147AB279883FDFAF00FF0082457C59FEDFF85FE24F005DCD9BAF0F
            DE0BCB4463CFD9A7CEE551E8B2AB93FF005D4570BFF0557F81F75E16F14F877E
            35F8695ED2769A2B3D4E7B7E1A2B98F9B6B8C8E8485D84F631C7DCD7DBDFB2DF
            C70B4FDA17E09787BC5F1320BF962FB36A5027FCB1BB8C012AE3B0270E07F75D
            6BE01FF8282FECFBABFECEBF16B4CF8E5F0EF7E9B61777EB71726D578B0D433B
            B791FF003CE6E720F1B8B03C328AFBF7F660FDA0F48FDA4FE13699E2BD3F6417
            F8FB3EA760AD936974A06F4FF74E4329EEAC3BE40F1CFDBCFF00625B4FDA23C3
            AFE28F0BC115AFC44D361FDD91845D4E25FF0096321E81C7F039FF0074F0415F
            14FF00827CFEDB577A2EA36FF063E294F2D9DEDACBF61D1F51D4329244EA76FD
            8A7DDC8208DA84F4FB87F86BF49FA8AF897F6D4FF8277E95F1A56F7C65E008AD
            F44F1DE0CB7168311DB6AA7A9DDDA394FF007FA31FBDD770F12FD937F6FEF107
            C15D787C2DF8E315F45696328B38B56BE8DBED7A6B0E047700FCCF1F4C372CA3
            FBCB8DBFA7DA66A769AD69F6D7F61750DED8DCC6B2C1736F2078E5461956561C
            1041C822AC9191835F1E7ED45FF04DCF047C6DFB5EB9E1310F827C62F991A5B7
            8B16576FD7F7B12FDD627F8D39E4921CD76BFB0A7C0DF1CFC07F847368BE3CD7
            26D475092F1CDB69DF69F3EDF4FB752551626F47C17C0E00651807767E8FA28A
            28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A28A28A28A28A2BE2AFDB3BFE0A25A37C115BDF08F811EDF5FF001DE0C535C6
            4496BA5B743BF1C3CA3FB83807EF74DA7C03F65BFD82FC57FB44788FFE168FC7
            0BAD43FB2EFE417696379232DEEA99E43487AC50E300018257EEED5C13FA8BA1
            683A7785F47B3D2748B1B7D374CB38C436F696B188E2890701554700551F1C78
            DF43F86FE14D4BC49E23D461D2B46D3A2335C5D4C701547400752C4E00519249
            00024D7E48FC42F1E7C43FF82997C78B5F0C786619B4BF04E9D2178219B3E4D9
            419C35DDCE38695870141E33B57F898FEA47C09F819E18FD9EFE1F58F84FC2F6
            BE5DBC437DCDDC8079D79310374B211D58E3A7400003000AE63F6B4FDA474BFD
            997E13DEF886E0C773AE5CE6D747D3DCF3717247048EBB13EF31F400672C2BE1
            BFF8276FECDDAA7C70F88B7DF1D7E2209752B58AF9EE34F37833F6FBFDD969C8
            EE911E98E378007DC22BF4DBC61E2BD33C09E15D5BC45ACDCADA695A5DAC9777
            3337F0C68A58E3D4E0703B9C0AFC9CFD98FC29A9FEDD1FB66EAFF10FC4D6ED27
            86F4AB95D52E6093E68D554EDB3B4F423E404F6611BE796AFD52F8A3E3DB1F85
            BF0E7C49E2DD448FB1E8D6135E32138DE5149541EEC70A3DC8AFCD5FF8259F80
            AF7E287C76F1A7C5CD781BA9AC04852E1C7DFBEBB6632383EA23F3011FF4D457
            D21FF0551F1C7FC22DFB2D5CE94926D9BC43AA5B586D07928A4CEC7E9FB9507F
            DEF7AD8FF8266781FF00E10EFD933C3F72F1F9771AEDD5CEAB28C73F33F9487F
            18E243F8D7C87FB569FF0084A3FE0A83E12D2CFCEB06ADA0DB30F452D148DFA3
            935FA2BFB52E9FFDA5FB35FC51B7C6E27C33A8328F52B6EEC3F502BE3CFF0082
            37EA1E6782FE24D8E7FD4DFDA4D8FF007E3907FED3AE3FFE0B0DE117D3FC69F0
            E7C6302957B8B49F4E79538286191658F9FF00B6CF8FA1AFD1BF85FE2B8FE21F
            C30F0B788C6D78F59D26DAF48038FDEC4AC463FE04462BF2C3E0F3B7EC79FF00
            051EBBF0C4A4DA787F52D41F49504E14DA5DED92D79E9F2B98327FD96E95FA95
            F16FE1AE95F187E1B7887C1BACA6EB0D5ED1EDD9F19313F54917FDA470AC3DD4
            57E667FC13D3E256ABFB367ED29E22F831E2F7FB25B6AD76D6215CFC916A3112
            2265CFF0CABF2823EF13176AFD43F1EF81B46F897E0DD5FC2FE20B45BED1F54B
            76B6B885BBA9EE0F6607041EA080474AFC94F871E26F11FF00C1363F6B0BEF0E
            F881E7BAF056A4E91DD48AA76DDD8B31F26ED17FBF19DD903D245EE0D7EC0699
            A9DA6B5A6DAEA163711DDD95D44B3C1710B064963600AB291C1041041AF87FFE
            0A11FB0CAFC58B0B9F88DE03B209E36B38F7DFE9F6EB83AA44A3EF281FF2DD40
            E3FBE063A85ACEFF00827A7EDCEDE3F82D3E177C43BD31F8B6D57C9D2F53BA6C
            36A08A3FD4C84FFCB6503827EF81CFCC3E6FBEEBE77FDACFF630F097ED43A0B4
            D32A68BE33B588AD8EBB0C7963E914C07FAC8F3F8AE72A7920FC11F073F686F8
            A3FF0004F4F888FF000F7E23E9975A87838C9B8D916DE238D9BFE3E6C643C329
            E494E0139076364D7EACFC39F893E1BF8B3E11B1F137853558358D1EF1731CF0
            9E54F74753CAB0E85480477AE9A8A28A28A28A28A28A28A28A28A28A28A28A28
            A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2B13C6FE19FF0084CF
            C21ACE84351BDD20EA36925B0BFD3A5315C5B965203C6C3A30CE457C6BFB2A7F
            C133B45F84BE2297C53F10EEAD7C61AF5BDCBB69B6A884DA42A18EC9DD5B9790
            8C30078427F8880C3EE40302B37C4BE25D2FC1DA05FEB7ADDF43A6693610B4F7
            37770DB5224519249AFC8FF8E1F19BC77FF0518F8D763E00F005B4F6DE0DB59C
            BDB412E523D8A70D7D76474001F9579C060A016639FD2EFD9C3F675F0CFECD5F
            0F2DBC35E1F884D72F89751D5244026BE9F1CBB7A28E42AF451EA4927D07C4FE
            26D33C1BE1ED475DD6AF22D3F49D3A07B9BABA98E1638D46589FC074AFC85B99
            7C51FF000534FDAC1628FED3A6F8234D3C13D34FD395B96EE3CF94FD7E623AAA
            71FAEFE12F0A695E06F0CE99E1FD0ECE3D3F48D36DD2DADADA21858D14600F73
            EA4F24E49E6BF3FF00FE0AC3FB41BD9691A4FC1FD0A767BED50A5FEB0B09CB08
            437EE2038EEEE3791D7E44ECD5F4D7EC4BFB3E27ECEDF02748D1EEA058FC47A8
            81A8EB0F8F985C3A8C459F48D42A7A6431FE2AF09FF82B6FC5EFF8463E11689E
            02B39B6DEF896EFCFBA453CFD96021B0476DD298C8FF00AE6D5ED3FB027C21FF
            00853DFB32785AD2787C9D575843AD5F6461BCC9C02808EC56211291EAA6BE47
            FF0082C2F8C9F51F187C39F055B92F2416B3EA52429C9733388A2E3D4793263F
            DE35FA2DF09BC1A9F0F3E17F84BC308A14691A55B589DBDDA389549FC4827F1A
            FCC4D5FF00E2AEFF0082B947FC7E56BF0FFE4BD9AFF2F2ABF4E7E2F587F6AFC2
            7F1A596377DA745BC871EBBA071FD6BF3D3FE08D57FE5EA9F15AC49FF59169D3
            01FEEB5C83FF00A18AF6AFF82AF782FF00E122FD98E3D611332E81AC5BDD3381
            C88E40D011F42D2C7F90AEC7FE09B9E34FF84C7F648F0923BF9973A43DC69929
            CF4D92B320FC2378EBE67FF82BCFC2E974CD67C0FF001434E468646CE8F793C7
            F29591099ADDB23BE3CE19FF00616BEF0FD9DBE28C5F19FE09783FC628EAD36A
            7611B5C84E8B70BF24CA3E922B8FC2BE13FF0082ADFC0CB9D035DF0F7C6AF0E2
            3DB5C2CB1596AB35BFCAD1CC9CDB5C6474385D85BB6D8C77AFB53F652F8E76DF
            B437C10F0FF8B55D06A6D1FD9354853FE595E46009063B06E1C0FEEBAD719FB7
            37ECB36FFB4B7C289534F8634F19E8A1EEB47B83806438F9EDD8FF007640063D
            1829E99CFCDFFF0004C3FDA9AE2DA697E0878D2692DB50B3693FB09EF32AE369
            265B36CF2194866507B075E30A2BF486BF39FF00E0A15FB0FCF717177F187E19
            5AC96DAD5B37DB359D32C32AF2153B8DE40179120C65C0EB8DC3E60777A5FEC0
            7FB7041F1EB448BC17E30BA8EDFE2169F0FC92BE146AD0A8E6451FF3D40FBEA3
            AFDE1C6E0BF66D79BFC76F801E0EFDA23C192F877C5DA78B88C65AD6FA2C2DCD
            9C847FAC89F1C1E990720E304115F07FECF5FB327C7EFD96BF6A3B3F0F786AE8
            5F780B51733DFEAB2A31D3AE2CD08DC644CE63B90080AA0E72782C9B8D7E9C51
            4514514514514514514514514514514514514514514514514514514514514514
            514514514514514514514554D5B56B2D074BBBD4B51BA86C6C2D2269EE2E6E1C
            247146A32CCCC7800004926BF24FF69AFDA2FC61FB787C58B1F857F0BADAE1FC
            22B73889066317CCA7E6BAB83FC10A75553D3A91B8855FD0DFD95FF65EF0E7EC
            BFF0FE3D1B4B54BDD72EC2C9AB6B0C9892EE503A0FEEC6B92157B649392493ED
            55F971FF00051BFDA5B52F8BDE3BB3F813F0F0CBA8C297B1C1A98B33937D7DB8
            04B65C7558DB1BBB6FEB8D993F6B7EC85FB3469BFB31FC27B4D0A3115C7886F7
            6DD6B3A820FF005D7047DC53D7CB4076A8FA9C02C6BD33E24F8FF49F859E03D7
            7C5BAE4DE4E97A45A3DD4C7BB6D1C22FAB31C281DC902BF2DBF622F006ADFB5E
            7ED61AEFC5CF1843F68D2F48BC1AA4AAF931B5D13FE8B6EB9EAB1AA86F611203
            F7ABF5B7A57E43FC6291FF006CBFF828C5A785E16375E1DD32F93493B4E545A5
            A167BA39E9F3309B07BEE5EB5FAED14490C691A2844401555460003B57E4AFC6
            43FF000BEFFE0A93A5E86BFE93A7E9DAC595914EBFB9B44135C2FF00DF4B357E
            B60E057E4CFECF9FF1547FC156FC417DF7D2CF5DD75C1EDB5239E153FA8AFD5C
            D5ECD751D2AF6D1BEECF0BC473E8548FEB5F95FF00F047EBD36DF183C7DA7B7C
            AD268E92953EA93AAFFECF5FA09FB567833FE1607ECE1F1174411F9B34DA2DC4
            B0A633BA6897CD8C7FDF68B5F1FF00FC11CFC67F68F07FC42F09C9260D95F5BE
            A71213D7CE431B91F4F2133F515F577ED8DF09BFE173FECE5E33F0EC50F9DA92
            D99BEB00065BED10FEF1157DDB694FA39AF95BFE0905F163FB4BC21E2EF87577
            3667D32E1755B1463CF932E12551ECAEA87EB2D7DCFF00153E1CE95F173E1DF8
            83C1FAD47BF4ED5ED1EDA42064C648CA48BFED230561EEA2BF313F600F88DAAF
            ECC3FB4F7887E0DF8BE4FB2DA6AF7674E21CE238EFE3244122E7F86553B411F7
            B7C47A0AFD66AFCC6FF82977ECCD7DE02F14DA7C77F01ACB60EB75149AC1B2F9
            5AD6E830F2AF171D373050C7FBDB4F258E3EC1FD8DBF699B1FDA6FE125AEB0CD
            143E26D3B6DA6B5649C7973E389147649002C3D0EE5E769AF772322BF2FBF6F4
            FD8CF52F84BE233F1AFE1324DA75B5B5C0BED4ACB4ECABE9B303BBED5081D232
            79651F70F3F749DBF507EC3FFB66E9BFB4D7844699ABC90D87C40D2E21F6FB31
            855BB4181F69887F749C6E51F749F42B9FA8A8A28A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2B
            CA7F69CF816BFB457C21D5BC19FDB577A0CB7056686E6D9C8432272AB320FBF1
            938CAFA804720572DFB217EC91A0FECB5E08FB347E56A7E2DD4115B55D602FDF
            23911459E56253D3BB1F98F603DFEBE52FF8280FED669FB3AFC363A3E8574A3C
            77E2089A2B00872D650F47B923B11F7533D5B9E42B0AF22FF8262FEC992787B4
            C1F18FC616CCFAE6A91B7F61C17232F040FF007AE4E79DF202429FEE1279DFC7
            E8557E67FF00C1563E3CDCEBBACE85F053C34EF7370F2C579AB436DF3349339F
            F46B6C0EA79F30AF7DD17A57D9BFB25FC07B6FD9DBE08685E1508875664FB66A
            D3A73E6DE4801939EE170A80FF0075056A7ED33F15E3F825F02BC61E302EA975
            6362CB661BF8AE64FDDC231DC798CA4FB035F10FFC121BE1449753F8D3E28EA3
            1B492C8C346B19A4E4B12565B86C9EA7FD48CFFBC3D6BF49352BF874AD3AEAF6
            E64115BDB44D34921E8AAA0927F215F947FF0004D2B09BE2C7ED83E35F8857D1
            926DEDEF7522EDC95B8BA9B007FDF0F37E55FAC8C70A4FB57E4D7FC13AC7FC25
            5FB76F8EB58FBFB6D755BEDDFEFDDC6B9FFC895FAC8FCA37D2BF273FE0997FF1
            4FFEDA1E3CD2CFCA0E97A8DB05F74BC80FF2535FAC371025CC124322878E452A
            CAC320823041AFC9AFF8277CCFF07FF6E3F17F806762A93C7A968EA8C7EF496F
            3798ADEFF24327E0D5FAD046462BF21B4227F637FF0082943D99FF0043F0D6A7
            A91B703EEC7F61BEC14FF80C4EC99FFAE26BF5E41C8AFCD3FF0082AFFC09B8D2
            B51D03E3478791EDEE22922B0D5A5B7CAB248A736D7191D0F1E596F68857D93F
            B24FC7683F687F81BA078ABCC4FED654FB16AB0A607977918024E3B06CAB81FD
            D715EA7E22F0F69DE2CD0750D1757B48AFF4BD4207B6B9B59865258DC15653F5
            04D7E425E41E24FF0082677ED6C93442E750F03EA44951DAFF004D76E54F6F3A
            13F4E541E15F9FD77F0B789F4CF1A78734DD7B45BC8F50D2751B74B9B5B988E5
            648D86548FC0F4EA2B46E2DE2BB8248278D26864528F1BA865652304107A8AFC
            D6F8BFFF0004F9F1DFC3BFDA33C39E30F80D3AE95A75F5F79DB8CA113449392F
            B81FBF6ECBB80500F52841CAE7F49AC12E23B1B75BC9639AED635134B1214477
            C7CC5549254139C0C9C7A9A9E8A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28AE2FE31FC59D
            0BE087C38D67C65E219BCBD3F4E84B88D48DF3C878489077666200FAE4E0026B
            F2D3F66DF859E22FF82817ED29ABFC46F1E23BF84B4FB959EF63E7C9703982C2
            2FF64281BB1CEDC9386704FEBDC10476B0470C31AC50C6A11234185551C0000E
            82B8EF8CFF0014F4AF82BF0C3C43E34D6187D8F4AB569845BB06694FCB1C4A7D
            5DCAA8FAD7E6B7FC13B7E166ABFB45FED0DE21F8D5E32537B6FA55E3DDA4922F
            C936A527CC8141FE1854EE03F84F958E2BF57ABF36BFE0AF9F169BECDE0DF863
            6129696E1CEB37F1275206E8ADD78EB926638F55535F677ECB3F0957E08FC03F
            077849A2115F5AD92CD7D8EA6EA5FDE4D93DF0EC547B28AC8FDB5BC6FF00F0AF
            BF659F88DAAAC9E5CD2696F611303821EE088011EE3CDCFE15F36FFC11F7C11F
            D99F0A7C69E2B923DB26AFAAC7648C472D1DBC7BB23DB74EE3FE035F7A6B17CB
            A66937B78FF72DE0795BE8AA4FF4AFCB0FF8240D8B5EFC64F1FEACFF0033C7A3
            AC4CFEF25C2B7FED3AFD5A3C8AFC9AFD8F8FFC23DFF0533F19E9BF743EA5AF5A
            81EA1659187FE815FACD5F925F1C07FC28EFF82A4691AEAFFA358EA3ABE9F7A5
            FA7EEAE5161B86FF00BE8CD5FAD80E457E6E7FC15FFE1433D8782FE255944449
            6D2368B7D228E76B66580FB0044C33EAEB5F667ECADF15C7C6AF801E0CF15BCA
            25BEB9B1586F8E79FB54598E6CFA65D0B0F6615D8FC4EF87BA57C56F87FAF784
            75A8BCDD3757B47B5970325323E575FF00695B0C0FAA8AFCBDFD837E216ABFB2
            B7ED51E20F83DE2E97ECD63AC5D9D31B79C4697A84FD9E55CFF0CAADB47AF991
            93D2BF5A6BC3FF006BDFD9B34EFDA6BE125EE82E2283C4167BAEF46BF71FEA6E
            00FBAC7AEC71F2B7E0704A8AF8B7FE09B5FB49EA3F0B7C6F7BF023C7E65D395A
            F24874A5BC3B5ACEF431125A9CF40EC095FF006F20677D7EA151451451451451
            4514514514514514514514514514514514514514514514514514514514514514
            51451451451451451456578A3C2DA478D741BDD135ED36DB57D26F2331DC59DD
            C6248E45F420FE60F62322B1BE167C29F0BFC17F07DB785FC21A5A693A340EF2
            AC2AC5D99DD8B3333B12CC7B64927000E80575D5F971FF000541F8D57FF137E2
            67877E07F848BDF3DADCC2F7D05B9C9B8BF970B043EFB15F3F5939E56BEFAFD9
            BFE0AD87ECFF00F073C3DE0CB208F359C224BDB941FF001F174FF34B27AE0B12
            067A2851DABD2DDC468CCC40503249ED5F90FF000E55BF6CFF00F828EDC6BAE0
            DDF86B4CBF6D446794FB0D9954B718E9891C4591FF004D1ABF5EBA57C1FF00F0
            579F1C7F637C10F0C786639364DADEB1E73AE7EFC30464B0FF00BEE488FE15EE
            5FB07F81FF00E102FD943E1ED93C7B27BCB1FED4949182C6E1DA65CFD15D47E1
            5E91F1C353FEC5F82FE3DD433B7EC9A0DFCF9F4DB6EEDFD2BE04FF0082356999
            93E2AEA2C3B69D0237FE04B37FECB5FA635F933F0C3FE29CFF0082B7DFC67E55
            9F5ED5323D7CDB59D87EAC2BF59ABF2DFF00E0B07E137D2FC79F0E7C656E0A49
            73673E9ED327055A091644E7D7F7EF8FF74D7E917C32F16A78F7E1C785BC4B19
            05357D2EDAFC6DE83CC895F1FF008F5721FB527C295F8D5F00FC67E135884B7B
            7762D2D90C73F6A8F1243F4CBA283EC4D7C5BFF0480F8ACC6DBC6BF0D2F65224
            81D75AB189CF201DB15C0E7A60884E3FDA6AFD27AFCD8FF82B0FC069ACE5D07E
            336811BC1736CF1E9FABCB6F956420E6DAE323A107F765BDE21DABEBEFD907E3
            CC3FB447C0BD07C4CF221D6624FB0EAD12E06CBB8C00E71D8382B201D8381DAB
            DA6BE72F8A5FB0A7C3BF8B5F1C74CF895AC25DC3796F1AFDAF4FB393C98EFA68
            C8F2A591D70C0A8183B482D84E46D3BBE8C030314B4514514514514514514514
            5145145145145145145145145145145145145145145145145145145145145145
            14514514514532557689C46C11CA90AC46403D8E3BD7C41FB397EC03AEFC34FD
            A6F5EF893E3AF1059F8B82196EF4BBC4464966BB9D9BCC9A58CE4232A96C0058
            664041F96BEE2AF9FBF6EDF8BDFF000A6FF667F166A504DE4EABA9C5FD8F6041
            C379D382A594FAAC7E638FF72BC17FE091BF087FE11EF85DE21F883790E2EFC4
            377F64B3761CFD960243303FED4A5C1FFAE42BEFBAFCA0FF0082A66B171F11BF
            69AF027C3FD3DFCC96D6CA08113AEDB9BB9F18C7FBAB09FC6BF54340D1EDBC3B
            A169DA559A79769636F1DB429FDD4450AA3F202BCAFF006C6D53FB23F65AF8A1
            3E76EFD06EADF3FF005D10C7FF00B3D7CBDFF0476D2FCAF853E3BD471FEBF598
            EDF3EBE5C2ADFF00B52BF412BF267C63FF0014D7FC15CADCFDC12EBD65FF0091
            ACE2FF00E395FACD5F167FC158BC17FF00090FECCF6FAD22665D0758B7B967C7
            48A40D0B0FC5A48FF215DC7FC138BC69FF000997EC91E0F0F279973A49B8D325
            E7A7972B18C7FDFB68EBE9A2322BF21BC520FEC6FF00F05278F511FE87E1BD4F
            521744FDD8FEC37D95978FEEC6ED2607FD3115FAF20E4023BD739F11FC05A57C
            51F026BBE13D6E1F3B4BD5ED24B4980EAA1870CBE8CA70C0F6201AF8AFFE09DD
            FB37FC5FFD9EFE20F8DADFC45696D69E06B967B6065B81E65D4F148445730C63
            3842A5F3BB692197AEDAFBE28A28A28A28A28A28A28A28A28A28A28A28A28A28
            A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
            28AF8CBFE0A2FF00B33FC4DFDA3B4BF0B41E097D3AE74BD1DA69AE34C9EEBC89
            A79DF6AABA961B08550C39607E73D6BE9FF847F0F2CFE13FC31F0CF83EC429B7
            D1AC22B4DEA31E63AA8DF21F766DCC7DD8D75D5F923E0EFF008BF9FF000557BA
            BE3FE9163A66BB34FE60E5447611948987B17863FF00BEB35FADD5F36FFC145B
            54FECAFD8EBE20B83879A3B48147AEFBB854FE84D79E7FC12574BFB07ECC57F7
            18C1BDF115D4D9F5022813FF006435F6AD7E4CFED4BFF14FFF00C1523C257FF7
            567D67409D8FAAEE8633FA21AFD66AF25FDACFC19FF09FFECD7F11B4511F9B2C
            BA34F3C298CEE9625F3631FF007DC6B5F237FC11D3C67F6AF04FC41F09BBF363
            A841A94684F51346637C7D3C85FCC57E89D7C29FF0539FD97FC4BF1AAD3C11E2
            0F0468736B7E22B3B87D32E2DEDB6866B7901747666202AA3AB0C9207EF6BEB4
            F8256DE28B2F847E12B4F1A5BADB78AADB4D86DF51449965065450A5B7292096
            C6E3838C935DBD14514514514514514514514514514514514514514514514514
            5145145145145145145145145145145145145145145145145145145145145148
            46411EB5F367ECFF00FB0C784FF678F8B1ACF8E745D7756D5EEB52B396D4C3AB
            796ED19925491DC3A2AE4928074E84F35F4A57CDBFF0503F873E2CF8ADFB38EA
            3E1BF06E912EB7AB5D5F5ABB5AC322237948FBD9B2EC0705578CE6AC7EC09F0C
            B5DF84BFB33681A1789B4C9747D705CDDCD73673E37C7BA77DB9C123950A7E84
            57D155F9BDFB6BFECF1F11BC6BFB64F843C5FE12F09DFEB3A45AC1A6CD3DF5B8
            511C6F15CB960492390A14FE22BF4817EE8A8EE6DE3BBB69609504914A851D18
            643023041AF97BF648FD85ACFF00655F176B7AFDB78C2EB5F9354B56B46B46B3
            582245F315D4FDF62CCBB48CE40F98F15F535145145145145145145145145145
            14514514514514514514514514514514514514514514514514515F2478ABFE0A
            41E04F0A7C7E97E184FA46A12BC3AAC5A44DAD24918B68A562AAE482776D4762
            ADFEE9AFAD81C8A5A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
            A28A28A28A28A28A28A28A28A28A28A290903A9A4DEBFDE1F9D1BD7FBC3F3A5C
            E6968A28A28A28A28A28A28A28A28A28A28A28A28A28AE3FE307C43B4F84DF0B
            BC51E30BDDA61D1F4F96EC231C798EAA7627D59B6A8F735F80F79E0FF14F8AFC
            1FAFFC51B847B8D3935A8ED2F2F5B3B9EEA759262DF86CE4FAC89EB5FB9DFB28
            FC581F1AFF0067EF0678A9E5135FCF64B05F9CF3F6A8BF77293E99642C3D9857
            AD51451451451451451451451451451451451451451451451451451451451451
            45145145145155EFF50B5D2ACE6BBBDB986D2D6152F24F3B844451D4963C015F
            32FC55FF0082907C12F860D2DBC3AFCBE2FD463C836DE1D885C2E7FEBB12B111
            F4627DABE59F197FC15DFC61E20BC363F0FF00E1ED95A3C87642FA94B25ECCFE
            E238F6007DB2DF8D73A3E237EDD1F1971FD9DA7F88F49B497945834C874A8F07
            B896554623DF71A7AFEC6BFB6378DFF79AEF8C750B52FD5354F1649205FC2367
            03F0AE67C63FB067C4CF05C7E6F8CBE357813C3E186EC6ADE26B98DCFD03C232
            7E95E33E20F09DC78224616DF1F7C377B3A1E1348BCD5A427E8EB69B3FF1EAC8
            B2FDA23E29783661FD8FF16BC413229E16DF55BC319FF8048003F88AF4DF07FF
            00C14AFE3D784DA359BC536FAFDBA748357B08A4CFD5D155CFFDF55F44FC3CFF
            0082C5CA1E387C75E0046438DF79E1FBA208F5C432E73FF7F057D6DF09BF6EBF
            831F181A1B7D2FC5F6FA4EA72E00D375C1F639B71E8A0BFC8E7D919ABDF5583A
            82A4303C822968A28A28A28A28A28A28A28A28A28A28A28AF81FFE0AE3F16FFE
            11DF851E1FF00DA4DB6EFC4579F6ABA453FF002EB0608047FB52B4647FD7335D
            37C29FD93D2EFF00E09DB2F8026B50BAF788B4B7D6D830C30BE7C4D6E1BD0A84
            810FFBA6BC9BFE0907F159E16F1B7C31BF90A4B130D66CA193820FCB15C2E0F4
            C1F24E3FDE35FA57451451451451451451451451451451451451451451451451
            4514514514514514514514567EBFE21D33C2BA45D6ABACEA16BA56996A8649EF
            2F2658A2897D59988007D6BE08FDA0BFE0AC5A078765B8D1BE14E943C4FA8826
            3FEDAD451A3B353D331C630F2FD4EC1E9B85785E97FB3D7ED47FB6E5EC5AB78D
            B53BDD17C392B09236D799AD2D957B186CD0649C7462A01E3E735F527C26FF00
            8252FC2AF04AC173E2CB9D43C75A8AE0B2DC39B5B4CFA88A33BBF067607D2BE9
            ED2BC27F0EFE05786AE2EAC34AF0FF0082344B64DD3DCC70C36712AFABBE067E
            A4F35F22FC72FF0082B1F827C1D25C69BF0EF499BC69A8A653FB42E0B5B58A9F
            55C8F324E7B6141ECC6BE7A8BC69FB63FED867CCD1D757D17C3971CABE9C3FB2
            2C361EB899887957DB73FD2BB2F05FFC1207C4FAD482F3C77F10ECECE790EF96
            1D2EDE4BC7627AE6590A60FBED6AF6DF0D7FC1257E0E69088753D47C4BAE4BFC
            426BC8E28C9F611C608FFBE8D76D69FF0004CFFD9EEDD02C9E0CB8B923F8A5D6
            2F013FF7CCA2A2BEFF008264FECFB768562F095DD99FEF41ABDD13FF008FC8D5
            E7FE28FF008244FC2AD511DB45F10F897449CFDD0F3437112FFC04C61BFF001E
            AF03F885FF000483F1E688924FE0FF0017691E258D79105EC6F633B0F41CBA13
            F565AF35D17E227ED3FF00B0DDE456FA8DB6B361A144C10586B319BDD2A4FF00
            652404AAFF00DB2753D2BED5FD9F3FE0A93F0FBE263DAE93E3987FE101D7A4C2
            7DA6793CCD3656E07137062C9C9C4802803EF9AFB4ECEF20D42D61BAB59E3B9B
            69904914D0B864752321948E08239C8A9A8A28A28A28A28A28A28A28A28A28A2
            8AFC86F8CD237ED89FF051BB3F0B42C6EBC3FA65FC7A4B60E545A5A1692ECE7A
            7CCC2700F7DCBD6BF5DE38D628D63450A8A368503000AFC87F88A0FEC6DFF052
            2B7D717FD0FC37A9EA2BA8B1E89F62BCDC971C74C23B4B81FF004CD6BF5E5583
            A8607208C834B451451451451451451451451451451451451451451451451451
            451451451451451457CF5FB52FEDABE07FD98B4D7B6BD946B9E2F963DF6BE1FB
            4900939E8F3372224F72093FC2A79C7E7CE9BE1CFDA07FE0A53E2B5BFD42E1B4
            9F044131DB348AD0E95678EAB126733CA06467E63D9994115F7F7ECEBFB08FC3
            2FD9EA1B6BDB6D357C49E298C066D77568D5E447F5863E5621D7047CDCE0B1AF
            A33A57CC5FB57FEDE5E0BFD9AE09B48B6D9E27F1C14F9346B697096D91C35C38
            CEC1DF68CB1E3800EEAF857C3DF0CFF685FF00828D78863D77C43A83E93E0B49
            898AEAE95A1D3ADC67045AC00E6560323773D30CE2BEF2F809FF0004FDF851F0
            323B6BCFEC85F16788E3C31D5F5B4594AB7AC517DC8F07A1C161FDE35F4AAA85
            0000001D852D1451451505ED8DB6A5692DADDDBC5756D2A949219903A3A9EA08
            3C115F1EFED01FF04C4F86BF1523B9D47C2283C01E216CB03611EEB195BD1E0C
            809F58CAE3AE1ABE3AD1FC6DFB427FC1377C530695AD5B3EA9E0B9A63B2D2691
            A7D2EEC649636F2E330C87938C29E8591862BF49BF66DFDAC7C0DFB4E787FED5
            E1CBC369ADDBC61AFB42BC60B756C7A138E8E99C61D78E46769F947B45145145
            14514514514514514514515E71FB45FC528BE0BFC12F1878C5DD566D36C1DAD4
            3F46B97F9215FC646415F097FC121FE16CBA96ADE37F8A1A9234D202347B39E4
            E4B48C44B70D93DF1E48CFFB4D5FA695F9F9FF000577F84BFDB9F0E3C33F106D
            21CDCE85766C2F1D473F679FEE331F4591401EF31AFA2FF61FF8B5FF000B93F6
            69F07EB134DE76A7656FFD957E49CB79F07C9B9BDD9023FF00C0EBDE28A28A28
            A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2BE16F
            DB87FE0A196BF08DEF7C09F0E668B52F1B9CC379A9281243A593C1551C87987A
            7DD53D7272B5E55FB277FC13A757F897A9A7C49F8E725ECCB7CFF6C8B43BC95F
            ED77ACC73E65DB93B954F5D99DC7F88A8183FA65A3E8D61E1ED2ED74DD2ECE0D
            3B4FB58C4505ADAC6238A24030155400001E82AE57E7EFEDC9FF00050A7F065E
            5DFC36F853702F3C52CC6D750D6ADC7982C9C9DA61831F7A6CF05B90878196FB
            9CF7EC81FF0004D87BF9A0F1FF00C6D8A5BFD42E9BED70786EEDCB31663BBCCB
            C6272CC49CF97FF7DE7951FA3B6767069F690DADAC31DB5B428238E18942A228
            180A00E0003B0A9A8A28A28A28A28AC7F16F84344F1E787AF342F10E976BAC69
            1789E5CF67791878DC7D0F71D411C82011CD7E5AFED43FB0DF8BBF659F112FC5
            4F831A86A2DA269D21BA78AD9CB5E6923B9CFF00CB58319073921490E1865ABE
            ABFD897F6EED27F690D3E3F0D788FC8D1BE225B4596B753B61D491465A5833D1
            8004B47D40CB0C8CEDFADE8A28A28A28A28A28A28A28A28A2BF3A3FE0AFBF168
            D87863C21F0E2CE6C4FA8CCDABDF229E7CA8F290A9F50CED21FAC42BEB3FD903
            E128F82BFB3B7837C352C3E4EA22CC5E6A008C37DA66FDE480FAED2DB3E882BD
            92B87F8DDF0DADBE2FFC24F15F83AE82EDD5F4F96DE3771C472E3313FF00C05C
            237E15F9E9FF000495F89373E14F1FF8E3E156AE5ADA5B906FEDEDE53831DCC0
            7CB9D31FDE2A54FD2135FA874514514514514514514514514514514514514514
            51451451451451451451451457C13FF0507FDBA64F86D1DCFC31F879785FC637
            4823D4B53B66CB69C8C3FD54647FCB7607AFF003C7CC46DADFB05FEC011F8263
            B1F895F13ACBED5E2B9B173A768D76BB869F9E44D303D673D403F73A9F9FEEFD
            FF00457C1FFF000515FDB665F85F652FC32F025E91E32BF880D46FED9B2FA742
            E388D08E93383D7AAA90472CA427FC13FF00F60F87E1A5958FC48F885622E3C6
            772A27D3B4DB95CFF65A9E43B83FF2DC839E7EE74FBD9C7DE345145145145145
            14514D74591191D432B0C1523208AFCB6FDBCBF627BCF83FAC1F8C7F09639F4C
            D3ED675BCD42C34D251F4B943645CC1B7958F38240FB8791F2FDCFA8FF00615F
            DB2ECFF698F081D235B921B4F883A4420DF5BAE116F621802E635F7240751C2B
            11D0328AFAA28A28A28A28A28A28A28A28A2909C0CD7E434B9FDB2FF00E0A51B
            7FE3F3C33A66A58FEF47F60B1EBFF019645FCE6AFD79030314B457E457ED3F6B
            2FEC91FF000508D2BC7B651B43A36A7790EBA4463EF4531315EA7D49F38E3B79
            8B5FADF697515F5AC373048B341320923910E55948C820F70454D45145145145
            1451451451451451451451451451451451451451451451451457CB3FB79FED75
            0FECD7F0F869BA2CD1C9E3CD72264D3A3E1BEC91F46B971EDD141EADEA15857C
            FF00FF0004E3FD8DE6D5AE60F8D9F11A092F6FAEA5377A1DA5FE5DDD98E4DF4B
            BB966249299FF7FBA9AFD26A2BC3BF6C1FDA42CBF667F83F7DAFE629BC41799B
            3D1ACE439F36E08FBEC3BA20F99BE81720B0AF8AFF00E09C5FB2FDEFC58F17DD
            7C74F886B26A718BD927D296F7E637B79BC992E9F3D551B217D5C13C6CE7F516
            8A28A28A28A28A28A28A2A1BBB482FED66B6B9852E2DE6431C914AA195D48C15
            20F0411C62BF1CBF6B6F81DE20FD86BE3F691E3EF87F2CB61E1DBBBA377A44E9
            965B4947FADB393D50A93807EF2311C95635FA77FB32FED0BA27ED2BF0B34FF1
            5E95B6DAF3FE3DF52D38B6E6B3B9006E43EAA72195BBA91D0E40F58A28A28A28
            A28A28A28A28A2BC77F6BAF8B23E0AFECF1E33F13453793A8A599B4B020FCDF6
            99BF77191EBB4B6FFA29AF923FE0903F098D9F877C61F122F21C4DA84CBA3D8B
            B0E7CA4C49311EA19CC63EB11AFD19A28AF86FFE0AC9F093FE12FF0081FA5F8D
            2D21DF7DE15BD1E7328E7ECB39547FAE24109F61BABD37FE09E1F16FFE16C7EC
            BFE1A371379BAA6819D0EEF2727F7207944F7E6168B9EE735F4BD14514514514
            514514514514514514514514514514514514514514514514572DF147E23E8DF0
            8BC01AE78BFC413FD9F4AD26DDA7948FBCE7A2C6A3BB3315503B9615F94FFB38
            FC35D7BFE0A0BFB4FEB3F103C708EFE13D3AE16E6F61C9311507FD1EC233FDDC
            0F9B1CED0C4E19C1AFD7DB7B78AD208E186358A18D422468005550300003A015
            252120024F415F8FDF1A75ED4FFE0A05FB6B58783B43BA7FF84474C9DAC6DAE2
            2E522B48CE6EAEC76CB953B49EBFBA535FAD9E14F0BE99E09F0D699A068B691D
            8E95A6DBA5ADB5BC630B1C680003F21D7BD6B514514514514514514514515E6F
            FB437C14D2BF681F84BAEF83354544379117B3BA65C9B5B95C98A51DF86EB8EA
            A5877AFC81FD94BE396B9FB197ED0D77A6F88966B5D19AEDB48F11E9E7276047
            2BE701DDA36CB023AA9603EF57EDFD8DEDBEA56505DDACC9716B3C6B2C5344C1
            91D18643023A820839A9E8A28A28A28A28A28A28A2BF337FE0AF3F14E4BFD43C
            11F0BF4E7696424EB179047C9676262B75C0EFFEB8E3FDA5AFBA7F670F8591FC
            16F81FE0EF072A2A4FA75820BA2BD1AE5FE799BE86467C7B62BD268A2B9BF891
            E08B2F895E00F1178575100D96B161359487192A1D0AEE1EE09047B815F999FF
            0004B9F1BDF7C29FDA0BC69F0975D26DA6D404B18818FDDBEB3660EA3EB1F9A4
            FAF96B5FAAF45145145145145145145145145145145145145145145145145145
            14514515F975FF00053FF8D9A97C4BF897E1FF0081BE112F7A60B985EFA0B739
            3737F2E04107BEC57071D3749CF295F797ECCFF02F4EFD9DFE0F687E0EB111C9
            750C7E7EA376831F69BB700CB27AE33855CF45551DABD4E8AF9D3F6F9F8D2DF0
            4FF66DF10DED9DC1835BD600D1B4E653865926077B8F42B189181F50B5E21FF0
            497F81EBE18F867ABFC49D420C6A5E2394DA58BBAF29671361883FEDCA1B3FF5
            C94D7DF5451451451451451451451451457E4EFF00C15AFE07A785FE22689F12
            74EB7D965E228FEC7A8145E16EE251B18FBBC581FF006C58F7AF78FF008257FE
            D18DF10FE1A5D7C39D66EBCDD73C2C81AC4C8DF34DA793851EFE531D9ECAD18E
            D5F75514514514514514514514D7758D19D885551924F402BF223E11237ED8DF
            F051DBBF134A0DDF87B4CBF7D5549E5459DA6D4B518E986710E47FB4DD6BF5E6
            8A28A2BF24BF6EDD1AEFF668FDB6FC37F143488592D35496DF5A558FE5579A26
            11DCC5FF0003500B7FD7635FABFA16B369E23D134FD5B4F996E2C2FADE3BAB79
            97A3C6EA19587D4106AF51451451451451451451451451451451451451451451
            45145145145145719F193E25D8FC1DF85BE26F19EA386B6D1ECA4B911938F364
            C6238C1F5772AA3DDABF377FE0991F0BAFFE337C72F157C67F1529BE3A6DC492
            433CA389B52B8259DC76F91198E3B19108E95FAAB4515F95DFF055DF19DEF8F3
            E36780FE18E924DC496902CA6043F7EEEEA4088A7DC2A211FF005D0D7E967C34
            F03D97C34F87BE1CF0A69E07D8F47B086CA36031BF62052C7DD8824FB935D2D1
            4514514514514514514514515E01FB777C2E5F8AFF00B2F78D2C121F36FF004D
            B63AC59E0658496F97217DDA31227FC0EBF1CBF660F8CD71F00FE387863C611B
            3FD8ED6E443A8449FF002D6D24F9265C77214961FED2A9ED5FD0359DDC3A85A4
            1756D2A4F6F322C91CB19CABA919041EE0835352330452CC40503249ED5E3CDF
            B627C12562A7E28786720E0FFC4C13FC693FE1B17E08FF00D150F0CFFE07A7F8
            D1FF000D8BF047FE8A87867FF03D3FC68FF86C5F823FF4543C33FF0081E9FE34
            7FC362FC11FF00A2A1E19FFC0F4FF1A3FE1B17E08FFD150F0CFF00E07A7F8D1F
            F0D8BF047FE8A87867FF0003D3FC68FF0086C5F823FF004543C33FF81E9FE347
            FC362FC11FFA2A1E19FF00C0F4FF001A3FE1B17E08FF00D150F0CFFE07A7F8D1
            FF000D8BF047FE8A87867FF03D3FC6BC8FF6B1FDB67E1CE9BFB3EF8C63F0678E
            748D6FC4D7F6674FB3B6D3AE964954CC7CB69001D36233367D545707FF00048C
            F849FF0008F7C2CF1178FEEE1DB77E21BCFB25A3B0E7ECD0641653FED4ACE0FF
            00D7215F7DD1451457C73FF0549F849FF0B07F67293C436D0F99A9F84EE96FD4
            A8CB1B77C47328F6E51CFB455CCFEC15FB64780ECBF671D0F40F1CF8CB4BD035
            BD024934D48B52B9113CD6EA4342EA0F550AE23FFB675F44FF00C362FC11FF00
            A2A1E19FFC0F4FF1A3FE1B17E08FFD150F0CFF00E07A7F8D1FF0D8BF047FE8A8
            7867FF0003D3FC68FF0086C5F823FF004543C33FF81E9FE347FC362FC11FFA2A
            1E19FF00C0F4FF001A3FE1B17E08FF00D150F0CFFE07A7F8D1FF000D8BF047FE
            8A87867FF03D3FC68FF86C5F823FF4543C33FF0081E9FE347FC362FC11FF00A2
            A1E19FFC0F4FF1A3FE1B17E08FFD150F0CFF00E07A7F8D1FF0D8BF047FE8A878
            67FF0003D3FC6BD6B4DD4AD759D3AD6FEC6E23BBB2BA896782E226DC9246C015
            6523A820820D59A28A28A28A28A28A28A28A28A28A28A28A28A28AFCF2FF0082
            BD7C5B6D27C11E14F877673ED9B58B86D4EF914F3E445F2C4ADECD2316FAC35F
            4EFEC5DF0857E0A7ECE3E10D0A487C9D4EE2D86A5A8E461BED3380ECADEE80AC
            7F4415EE14515F927E115FF85E9FF055BBBBB9FF00D22CF4BD7EE25DDD42AE9F
            114888F6DF0C7F9E6BF5B28A28A28A28A28A28A28A28A28A2A1BBB58AF6D26B7
            9D165866468DD18643291820D7F3B3E39F004DE16F881E38F0DAE4CDE1FBDBA8
            3695CBB8867F2DB1F45CB1F6535FB15FF04E2F8B6DF153F661D061BA9FCED53C
            38EDA25C963F3158C0309FA794D18CF72A6BEA2AC8F18680DE2AF09EB5A2A5EC
            DA6BEA3653598BDB700C901910AF98B9E372E7233DC57E1B7ED39FB16F8FBF66
            6D4A4B8D4ED4EB7E147936DBF886C63261393C2CABC989FD9B827EEB362BD33F
            65CFD977E04FED2B690E9F1FC41D7BC39E320999B41BD5B7CC840E5ADDF6812A
            F5E000C3072B8E4FD23FF0E76F02FF00D0F7E20FFBF307F851FF000E76F02FFD
            0F7E20FF00BF307FF1347FC39DBC0BFF0043DF883FEFCC1FFC4D1FF0E76F02FF
            00D0F7E20FFBF307FF001347FC39DBC0BFF43DF883FEFCC1FF00C4D1FF000E76
            F02FFD0F7E20FF00BF307FF1347FC39DBC0BFF0043DF883FEFCC1FFC4D1FF0E7
            6F02FF00D0F7E20FFBF307FF001347FC39DBC0BFF43DF883FEFCC1FF00C4D1FF
            000E76F02FFD0F7E20FF00BF307FF135F6C7C2BF873A67C23F875E1FF0768FB8
            E9DA35A25AC724806F9481F348D8E373312C71DD8D757451451597E29F0DD8F8
            C7C33AB683A9C5E7E9DA9DA4B657319FE28E4428C3F226BE103FF0477F0293FF
            0023DF883FEFCC1FE147FC39DBC0BFF43DF883FEFCC1FF00C4D1FF000E76F02F
            FD0F7E20FF00BF307FF1347FC39DBC0BFF0043DF883FEFCC1FFC4D1FF0E76F02
            FF00D0F7E20FFBF307FF001347FC39DBC0BFF43DF883FEFCC1FF00C4D1FF000E
            76F02FFD0F7E20FF00BF307FF1347FC39DBC0BFF0043DF883FEFCC1FFC4D1FF0
            E76F02FF00D0F7E20FFBF307FF001347FC39DBC0BFF43DF883FEFCC1FF00C4D7
            85FED29FB1D7C07FD99B496FEDBF891AFEA7E23923DF6BE1FB18EDDAE65F467E
            31127FB4DD79DA188C57CFBFB3D7ECA1E3BFDA5FC40D6FE15D31AD7438A5DB75
            ADDFE56D6D87A1703F78F8C7CAA33C82401C8FDC7F839F0F5BE13FC2EF0C7839
            F559B5B3A258C7642FA7408D2AA0C0F9467000C00327000E4F5AECA8A28A28A2
            8A28A28A28A28A28A28A28A28A28A2BF23BE3621FDA77FE0A6DA7F85CFFA5693
            A6EA76FA5346791F67B45335D2FE2C2E3F3AFD7003000F4A5A2992B0489D89C0
            00924D7E4EFF00C12CA33E2FFDAB7C73E269C6F71A4DDDC063DA49AEA239FCB7
            FE75FACB451451451451451451451451451457E3B7C4CF05DA4BFF000534F117
            85AE408ED3C417F2D8CA48E82FEC0AB37D7FD2091EF5DCFF00C126BC5F77E0AF
            8CFE3FF86FA9E6092EED4CFE4B1FB9736B298DD47B959589FF00AE75FAA14555
            D534BB3D6F4FB8B0D42D20BEB1B98CC535B5CC6248E542305594E41047635F9D
            5FB51FFC12F8A5DCDE31F8253369BA8C2FF696F0DB4E506F073BAD2527E46CF2
            118E3D197016B9DFD9BBFE0A55E24F863AC0F01FC77B1BF716727D99B5A9A065
            BFB3238DB731119900E3E6037F721C9AFD2BF0B78B346F1BE8367ADE81A9DAEB
            1A4DE279905E59CA248E45F623F223A83C1AD6A28A28A28A28A28A28A28A28A2
            8A28A28AA7ABEB161E1FD32E751D4EF20D3F4FB58CCB3DD5D48238A241C96662
            40007A9AFCE6FDA83FE0A7D3EA37B2F833E07DBC97D7B3BFD98F88CC05D9DC9C
            05B4848CB12780EC3E8A786AC9FD9ABFE099FAEFC40D557C75F1DEF6F4B5DC9F
            6A3A14970CD7974C79DD752E7299EE80EFF52A462BF4A3C35E18D27C1BA1D9E8
            DA169B6BA4E9566823B7B3B38847146BE814715A745145145145145145145145
            145145145145145155755D460D234BBCBEB97F2EDED6179A47FEEAAA924FE42B
            F29FFE0975A64DF123F6A7F1C78F350432CD6F6573765CF3B6E6EA71CE7FDDF3
            87E35FAC545159BE24664F0F6A8C9CB8B5948FAEC35F979FF0477553F137E21B
            1FBC34B840FA79C73FC857EAAD14514514514514514514514514515F933F1EBF
            77FF000564D09A3E59B5ED0B77FDF9B607F4A86E147C0DFF0082B0AF95FB8B4D
            4FC40BECAE3518467F0125C1FC57DABF5B28A28AF11FDA47F643F00FED33A398
            FC4163F61D7E28CADA6BF62A16EA1F4563D244CFF037A9C152735F9C3A8683F1
            EFFE09A3E336BDB098EAFE08BA9C6E9915A5D2EF87612A67304D81D720F180CC
            A0D7E83FECC3FB6D780BF698B18AD6C6E0683E2E54DD71E1FBE9079A7039685B
            812A75E46180EAA2BE85A28A28A28A28A28A28A28A28A28A28AF15FDA3BF6B6F
            00FECCFA299BC47A87DAF5C9A32D67A0D9307BA9FD091D234CFF001B60707193
            C57E6EEABE29F8F5FF00052DF19B69BA5DBB691E08B69C16B78DDA3D2EC8750D
            3498CCD2E3A0C13D4AAA8CD7E817ECBFFB10780BF668B28AF6D601E20F18326D
            9F5FBE8C6F5C8E5604E444BD7A12C7BB11C0FA2A8A28A28A28A28A28A28A28A2
            8A28A28A28A28A28A2BCB7F6A6D78F867F66FF00899A82B6D923F0F5EA46DE8E
            F0B229FCD857C77FF0470F0F883C1BF1235C2BF35DDFDA5986FF00AE51BBE3FF
            00230AFD16A28A8AEE15B9B59A27194910A91EC462BF28BFE092B70DA1FED11E
            3BD0673B273A2CB953C65A2BA8948FFC7CD7EB15145145145145145145145145
            14515F931E313FF0997FC15C6D845FBC106BF65C2F6FB35A465BF2311A5FF829
            C27FC209FB61F81FC5510DA1B4EB1BE2C3AF9905D480FF00E3AA95FAC4932145
            3BD791EB525145154B5AD134FF0011E9575A66AB636FA969D75198A7B4BB8964
            8A543D559581047B1AFCE2FDA7BFE098779A2DFC9E35F81B7335A5DDBBFDA4F8
            77ED052589C1C86B4989C820F2118E7D1BA2D52FD9A3FE0A67ACF827544F037C
            76B3BB496D64FB29D7DEDD92EAD9871B6EE1C65B1DDD46EE3956249AFD25F0EF
            88F4AF1768B69AC689A8DB6ABA5DDC625B7BCB3944914AA7BAB0E0D695145145
            14514514514514514556D4B52B4D1EC2E2FAFEEA1B2B2B7432CD7171208E38D0
            0C96663C0007735F9DDFB52FFC150921B99FC21F0522FED4D4E57FB3B7891E1D
            E81C9C6DB5888FDE36780EC31E8AD906B94FD9CBFE09B5E29F8B1AD0F1F7C77D
            4350852F64172DA3CF3B36A17A4F39B9909CC4A78F947CF8E3E422BF4B7C27E1
            0D13C09E1FB3D0FC3DA5DAE8DA45A26C82CECE211C683E83B9EA4F52793CD6C5
            14514514514514514514514514514514514514514515F3DFEDFF0078D63FB207
            C47914E0B59C317E0F73129FD1ABC83FE090F66B07ECDFE209F1F3CFE27B8C9F
            616D6C07F5FCEBEE3A28A43C8AFC95FD9FDFFE14D7FC151B5CD0E63F67B4D475
            7D4EC57771FBB9D5E6807E27CA1F8D7EB5D14514514514514514514514514523
            1DA09F4AFC96FD8A4FFC2E1FF828C78A3C6719F3AD6D67D5F598DC72A2391DA0
            8C7FDF338C7D2B7BFE0B1966B1F8F3E1B5D81F3CBA7DD444FB2CA847FE866BE8
            A4F8C37FB17FD27B7AD7D8545145145783FED2FF00B1AF807F69AD31DF58B3FE
            C9F13471EDB5F10D8A017098E8B20E92A7FB2DC8E7695CE6BF3A8A7C7CFF0082
            67F8D3233ABF822EE7EBF3CBA55F0FE704D81ECDC7F1A8E7F44FF666FDB33C03
            FB4D69891E9176348F14471EEB9F0F5F38170981CB467A4A9FED2F238DC1738A
            F7AA28A28A28A28A28A28A28AF1FFDA1BF6A9F017ECD7A0FDB3C51A909354990
            B59E896643DDDD1F50B9F9573D5DB0BEE4F07F357C47F113E3C7FC149BC65268
            5E1EB27D1FC1504C0BD9C52347A75A2E72AF7536332C9DC2E09E32A839AFBD7F
            65AFD84FC09FB365B41A91897C4BE3429FBDD72F621FB924722DE3E4443B6796
            39396C703E95A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2BE73F
            F8286C267FD8EBE22A8EA20B56FCAEE13FD2BCC3FE091D3097F665D5D463F77E
            26B953FF0080F6C7FAD7DB7451457E4DFF00C148B48BBF82DFB617837E27E9D1
            102F52D35357E81EE6D245565FFBE160CFFBD5FAA9E1FD72CFC4FA0E9BAC69F3
            0B8B0D42DA3BAB7957A3C6EA195BF1041AD0A28A28A28A28A28A28A28A28A2BC
            9FF6ACF8969F08FF00679F1D789BCE10DD5BE9B24168D9E7ED12FEEA1C7AE1DD
            4FD01AF8F3FE08F3F0E5AD7C37E3CF1D5C4447DB6E62D26D5C8C7CB1AF992E3D
            413245F8A1AE57FE0B21306F16FC318BBADA5EB7E6F08FE95E8A9E0D9F68F95F
            A7BD7E805145145145677887C3BA5F8B346BBD235AD3EDB55D2EEE3315C59DE4
            4B2452A9ECCA460D7E6DFED31FF04C9D5FC1DA93F8E3E055DDD4735AC9F6AFEC
            05B864BAB661CEEB49B3938EC8C7771C331216ACFECC5FF053BBED07508FC13F
            1CED67B5BAB793ECA3C45F6729342C0E36DDC38CE41E0BA8CFAAF56AFD1ED135
            CD3BC4BA4DAEA9A4DF5BEA5A6DD462582EED255922950F465652411EE2AF5145
            14514514514543797B6FA75A4D75753C76D6D0A19259A670888A064B313C0007
            735F9EFF00B547FC150ECB459AE7C27F06963D6F5866F21FC46F1F996F131E31
            6E87FD7367A31F93A603835E7DFB3CFF00C13A3C67F1C35EFF008581F1D752D4
            AD2DEF5C5CB69B732B1D4AFBD3CE63CC298C0DBF7F1C613835FA65E0AF03681F
            0E7C3969A0786749B5D1747B45DB0DA59C61117D49F527A963924F24935BB451
            4514514514514514514514514514514514514514514515E31FB66E8EDAE7ECAF
            F13ED957794D12E2E71ED10F349FFC72BE66FF00823C6B2B3FC21F1C6921B2F6
            BAE25D15F412C08A0FFE413F957E80514515F20FFC14F7E0E3FC4CFD9CAE35CB
            280CBAAF84A71A9A6D1966B62365C2FD029590FF00D72A8BFE097FF1A57E25FE
            CF50F86EEE7F3359F084BFD9F22B1F99AD5B2D6EDF4037463FEB957D87451451
            451451451451451451457E6BFF00C15D3E3199D7C27F0A74B94CB71348357D46
            28B96EF1DBC7C75249918AFB21EE2BED0FD95BE110F81DF00FC1FE1278C25FDB
            5989AFF1DEEA5264979EF8662A0FA28AFCF7FF0082B5DD3EBDFB42780FC3D6E7
            7CEBA3465547669AE64503EBF20FD2BF4DE3F877A3796BFE8FD87A5753451451
            4514515F3E7ED3BFB14780BF699D3E4B9D42D8687E2C44DB6FE20B18C79BC0E1
            665E04A9D383823F85979AFCEFF805E35F8B7FB27FED4D17C1DD0B5BB4F10DBC
            DACC3A75DE99BDE5B093CCDA5A54CE1A27546CB15C60A90C182D7EC90E94B451
            451451451457E457EDC5F15FE2B7C5BFDA5AE7E095DEAB6DE1ED05B5582C2C2C
            A391A0B6B9598A1826B97192F90E848E5548E172093F6A7ECADFB03781BF6728
            6DB58BB44F1578DC2866D62EE21B2D9BB8B78CE427A6F3963CF201DB5F50D145
            14514514514514514514514514514514514514514514514560F8FBC38BE31F03
            788B4172026A9A75C59313D31246C9FF00B357E687FC11F7C4AFA47C49F88FE1
            29F31CD776105EF94FD435BCAD1B0FFC981F957EA6D145155B52D3ADB58D3AEA
            C2F604B9B3BA89A09A190656446043291DC1048AFC81F87FAADEFF00C13C7F6E
            0BCD17549655F05DFC9F659669338974D99B305C7B98980DC47F72451D6BF612
            19A3B9852589D6489D432BA1C8607A1069F4514514514514514514514573FE3F
            F1C693F0D3C17ACF8A75DB816BA4E936AF757121EBB54670A3BB1380077240EF
            5F959FB20784356FDB37F6C8D67E29F89E067D1747BB1AB4C8FF00346B2038B2
            B507B84080FB884E7EF57EB9D7E4AFED0AC7E2FF00FC151B42D0E3FDF5AE9FAB
            69764D8E731C2A93CE3F02651F857EB481814B451451451451581E3FF1958FC3
            CF03EBDE27D49B6586916335F4DCE0958D0B103DCE303DC8AFCC2FF82637836F
            BE31FED29E32F8B5AEAFDA24D37CEB9F398706FAF19F919F48FCEE3B6E5AFD5C
            A28A28A28A28A28AFCC6FF0082BAFC2F9B46F11781FE29698AD048FF00F129BB
            9E2F94A4B1932DBB647F111E68CFFD335AFBDFF67DF89F0FC66F82FE10F1944C
            A64D52C2392E153A25C2FC9328FA48AE3F0AF42A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28A28A28A43C8AFC90F876FF00F0CE3FF0548BED2A6FF4
            4D3354D6A7B354E8A61BE5F32DD47B079211FF0001AFD70A28A28AF91FFE0A2D
            FB2DB7C7BF85635FD06D3CEF1A78651E7B548D7E7BCB6EB2C1EA5B8DC839E410
            3EF9AE03FE098DFB59A78F3C291FC29F145E63C4BA243FF1299A76F9AF2CD7FE
            5973D5E21C63BA63FB8C6BEF7A28A28A28A28A28A28A28A2BF2CBFE0A35FB486
            A1F1ABE2069DF033E1EF99AA5BC37C90EA02CCEE37D7FBB6A5B8C7558C9E73C6
            FEB8D80D7DD9FB297ECFB61FB36FC1CD27C2B6FE5CDAA30FB5EAB7883FE3E2ED
            C0DE41FEEAE022FF00B2A3B935EB3A85F41A5D85CDE5D4AB0DB5BC6D2CB2B9C0
            4551924FB002BF27BFE09F16937C6FFDB8BC5BF11EE62630DA0D43580CE32125
            B990C71A7FDF12C98FF72BF5A68A28A28A28A28AF893FE0ABBF16FFE10AF80B6
            5E10B59B66A1E2CBD11C8A0E0FD9602B2487F17F257DC31AEF3FE09C9F093FE1
            55FECC1E1F96E21F2B54F11B36B77391CED940108FA794B19C762C6BE9FA28A2
            8A28A28A28AF15FDB27E12FF00C2E8FD9C7C65E1E861F3B524B437FA78032DF6
            887F788ABEEDB4A7D1CD7CB1FF000483F8B5FDA7E0EF16FC3ABC9B33E9570BAA
            D8A31E7C997092A8F657553F59ABF4468A28A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28AFCB8FF82B47C3FBBF08FC4EF027C51D2775BBDCC42C
            A59E318F2EE6DDFCC85C9FEF157207FD72AFD16F83BF112D3E2CFC2DF0B78C2C
            CAF93AC69F15D3221C88E42A3CC8FEAAFB94FBAD763451451D6BF2D7F6FCFD95
            359F823E3B8BE3A7C2E1369F64B76B79A8C76230DA6DDEECFDA147FCF2763F30
            E8189FE16C0FAF7F633FDB0345FDA83C12A93BC3A778E34D8946ABA5038DDDBC
            F841E4C6C7B7552707F84B7D1B451451451451451451457C3BFF000506FDB921
            F83FA45DFC3EF03DF2CBE3ABE8B65E5E40D9FEC98587A8E93303F28EAA0EE383
            B739BFF04E0FD8C26F86DA747F147C716457C5BA9444E976372BF3E9F038E647
            07A4B203D3AAA9C1E5980FBD2BE6DFF8284FC575F853FB2EF8A5E29845A96BA8
            344B419C1267044A47D21129CFA815E55FF0496F858DE14F81DAC78CAE62D975
            E29BF221623ADB5BEE8D4FFDFC69FF00215F73D14514514514515F919FB5BDF4
            FF00B57FEDFBA37C3BD3E56974AD32EA1D08988FDC54265BD931EABFBC07FEB9
            0AFD6BB0B1834CB1B7B3B58960B6B78D628A2418544518000F400558A28A28A2
            8A28A28A4232315F90DA3E7F634FF8293BDA9FF43F0CEA7A91847F0C7F61BEC1
            4FF80C4ECBFF007E4D7EBC83914B451451451451451451451451451451451451
            4514514514514515E15FB6C7C163F1D3F675F13E856B6FF68D66D23FED3D3140
            CB1B984160ABEEEBBE3FF81D7CCDFF00048EF8DC356F087883E16EA33FFA6E8F
            236A7A6A39E4DB48C04C807A248437FDB63E95FA1D45145155F50D3ED756B0B8
            B2BDB78AEECEE636866B79D03C72230C32B29E08209041AFCA4FDAABF63FF17F
            EC8FE3A4F8B9F072E2F22F0E5ACC6E592D4979B4727EF2B8E7CCB72091939C03
            B5F2396FADFF0063DFDBCFC31FB47E9F6DA1EB4F07877E204698974E76DB0DE9
            0397B624F3EA632770E7EF005ABEACA28A28A28A28A28A4240193C0AF81BF6D3
            FF00828F5878123BDF03FC2ABB8B57F15BE60BAD721C496F607A158BA8925F7E
            554FA9C81CE7EC2FFB025F1D5EDFE2BFC60B696E758965FB6E9DA26A39790484
            EE17375BB92F93B821E41E5B9E07E8E018A5AFCA0FF8292F8FEFFE3D7ED25E15
            F83FE173F6B3A4CD1D99443F2BEA172577671D913CB04FF09327BD7E9D7C36F0
            2E9FF0C7C01E1FF09E96BB6C347B28ACA238C1708A0163EEC72C7DC9AE968A28
            A28A28A2B8DF8C7F112D3E12FC2CF14F8C2F3698747D3E5BA54638124814F971
            FD59CAA8FF007ABF3A3FE093DF0EEEBC6FF14FC6FF0015F5ADD7535A2B5AC371
            28C992EEE18BCD203FDE08307FEBB57EA4D14514579CFC6EFDA07C0FFB3E7861
            B5BF196B11D8A3022DACA3F9EEAED87F0C51E72C7A64F0A323240AFCE1D5FF00
            E0ADBE3D9BE2747ACE99E1BB28BC0303790DA1CC3334CA4E43B5C01F24B80700
            0DA06410D8CD7E83FECF9FB52780BF693D03EDDE15D4C2EA31206BCD1AEF0979
            6A7FDA4CFCCB9E8EB953EB9C81EBB4514515F9C1FF00057EF84E67D1FC1BF12A
            CA13E759CADA35F48A39D8D992027D006128CFAC82BEC3FD93FE2C8F8D7FB3EF
            833C5324BE75FCF64B6F7E73CFDAA2FDDCA4FA6594B0F6615EB9451451451451
            4514514514514514514514514514514514514514846457E427ED19E1ED4FF613
            FDB674CF1F6816EE3C33AB5CB6A90411FCA9243236DBCB4F4E373151D143C67A
            8AFD66F09F8A34CF1BF8674BD7F46BA4BDD2B53B68EEEDAE13A3C6EA194FB707
            A76AD6A28A28A8E7823B985E19A35962914ABA38CAB03D411DC57E777ED65FF0
            4C8FB7DFDC78DBE0A95D2B5647FB4CBE1B593C98D9C1CEFB47C811B679D8485F
            EE95C053C4FC01FF00829678C3E106A9FF00083FC73D1B51BE162E2DDF53784C
            7A9DA638C4F1B63CD038F9B87C73F3935FA39F0D3E2E783BE316809ACF837C43
            65AFD8363735AC9F3C44FF000C8870C8DECC01AEBE8A28A28A28AF2EF8D9FB4B
            FC3BFD9FB4B6BAF18F88ADECEE590B41A6407CDBCB8F4D910E71DB71C28EE457
            E6EFC5CFDB2FE307EDA9E2393E1FFC27D06FF47D06EB2925A58B66EAE62CE0B5
            CCFC2C51FAA82179C333715F52FEC7DFF04E8F0F7C0B7B3F1578D1ADFC4FE395
            0248976EEB3D35BFE99023E7907FCF46031FC206327ECEA2BCCBF690F8D9A77E
            CFDF07BC41E32BF6479AD6131D8DB39FF8F9BA7E228FD705B938E8A18F6AF81F
            FE0973F06B51F891F137C49F1BFC53E65E3DB5C4D1595C4E326E2FE6CB4F37FC
            051C8FACA7FBB5FA8B451451451451457C0BFF000572F8B5FF0008F7C2BF0F78
            06D26DB77E22BCFB5DDA29E7ECD0608523FDA95908FF00AE46BDE7F611F849FF
            000A7BF664F08E9D3C3E4EA9A9C3FDB17E08C379B380C030F558FCB43FEE57D0
            34514D7758D4B310AA0649270057C33FB577FC14DBC37F0C7ED9E1AF86BF66F1
            678A573149A9677E9F64DD0E083FBE71E8A768EEC7056BE7DF825FB0FF00C51F
            DAEFC4EBF113E32EB3A9697A2DE11279979C5FDEC7D42C3191B608B9E0950304
            6D420E47E8EE91FB357C32D13E183FC3DB7F076987C272AE26B1962DE667C63C
            D773F3349E8F9DC38C11815F9F3FB41FFC13BBC71F017C41FF000B07E05EA7A9
            DEDA5939B85B0B5948D4EC7D7CB2BFEBD31918FBD83821F935E93FB2AFFC150F
            4FF114B6DE14F8C4B1683AD2910C7E2244F2ED666E98B84FF962D9EAC3E4EB90
            8057E825A5DC17F6B0DCDB4D1DC5BCC8248E6898323A9190411C10477A9A8A2B
            CC7F698F8549F1ABE0578CBC2063592EAFEC1DACF77F0DCC7892139EDFBC45CF
            B66BE21FF82427C557B797C6DF0C35091A392361ACD943270411B62B85C1FF00
            B6271FEF1AFD2CA28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
            8A2BC1FF006CEFD9CA0FDA4FE0B6A3A1C11C6BE24B0CDF68D70F81B6E141FDD9
            3D9645CA1EC0956FE115F24FFC12FBF6979FC3DA9DE7C0DF1948F65730CD2B68
            82EF28D14A1899ECC83D0E433A83DFCC1D4A8AFD2EA28A28A28AF2BF8E5FB327
            C3CFDA1F4A169E31D062B9BB8D0ADBEAB6DFBABCB7FF007251CE3BED6CAFA835
            F9F3F10BFE09B1F17BE05EBCDE27F831E29B8D656025A35B4B9FB06A51AF5DA7
            E60928C75C30DDFDCED50F83FF00E0A63F1A7E0A6A49A07C57F077F6D49070E3
            50B67D2F50C74C9217630F7F2F9F5AFA63C03FF0554F82DE2B48935B9757F085
            CB70E350B233440FB3C3BC91EE5457B97873F6ACF83BE2C446D37E267862467F
            BB14FA9C50487FE012156FD2BB4B5F88DE14BE40F6DE26D1EE14F468AFE2607F
            26A8AFBE28783B4C42F79E2CD12D507569B518507EAD5C0F8A3F6C9F825E0F8D
            DB50F89BE1E7D9F792C2F05E38FF0080C3BCFE95E05F10FF00E0AD7F0ABC3692
            C5E17D275AF17DD0CEC7110B3B66FABC9F38FF00BF75F38EB7FB70FED29FB515
            FCBA27C32F0F5C68967236C61E1CB56966453FF3D6EDF88FFDE5F2EBB5F839FF
            0004A5F11F8B7541E22F8D1E299639677F3A7D334FB8FB4DE4CDDFCEB96CA83E
            BB77E47F10AFD0AF85FF00087C1DF063C391E87E0CD02D342D3D705D6DD3F793
            30FE292439691BDD8935D8D1484850493802BF233F6C4F8B5AC7EDB3FB49685F
            0A3C0127DB7C3FA6DE1B4B6963398AE2E3FE5E2ED88EB1C6A1803CFCAACC3EFE
            2BF50FE10FC2FD1FE0C7C37D07C1BA147B34FD2AD9610E400D33F5795B1FC4EC
            598FBB5763451451451451457E437C6076FDB17FE0A3B69E18889BBF0F6997E9
            A4B0072A2D2D37497473D3E6713E0FFB4BD6BF5DE345891514055518000C0029
            D45703F193E3A782FE02785A4D7BC67AD43A65B7220B7077DC5D381F7228C72E
            7A7B0CE49039AFCC3F8ADFB55FC63FDBB7C592F807E1868D7BA4F86262564B1B
            37C493459C799793F0A89FEC642F383BCE2BEB2FD947FE09C1E11F821F63F10F
            8C3ECFE31F1AA6244691336562FD7F748C3E7607FE5A38CF008553D7EC70314B
            457CB1FB557EC01E07FDA2A3BAD674E48FC27E3860586AB6B10F2AEDBB0B88C6
            3767FBE30C38C96036D7C3FE08F8D3F1CFFE09CFE318BC27E31D326D5FC1CF21
            31E9F73297B59933CC9657183B0F392B8C73F3202723F4CFE01FED2DE04FDA3B
            C38353F08EAAB2DCC6A0DDE957388EF2D09ED2479E99E8CB953D8F5AF54A28EB
            5F90DF12D4FEC6FF00F0521B6D7D01B3F0E6A7A826A4C7A27D8AF3725C71D308
            E66C0FFA66BD2BF5E1583A8607208C822968A28A28A28A28A28A28A28A28A28A
            28A28A28A28A28A28A28A28AFCD0FF008295FECAD7FE1AD7A2F8E9E018A5B4B8
            8268E6D6D2C72B25BCCA47977A98E9C801C8E842B77623E9DFD88BF6B5B0FDA7
            3E1D22DFCB0DB78E748458B56B25C2F9BD96E635FEE3F703EEB6474DA4FD2545
            14514514562F8A7C17E1FF001CE9ADA7F88B43D3B5EB16EB6DA95AA5C47FF7CB
            822BE72F1DFF00C1347E0478D9E4961F0E5D7866E5CE5A5D0EF5E21F846FBE31
            F828AF13F117FC11C3C3372EC742F88FAAE9CB9F946A1A7C77440F728F1571D7
            5FF046FD71188B6F89F632AF632E92E87F2129A96CBFE08D9AB48E05E7C52B58
            57B98746790FEB32D777E19FF823BF822CDD0EBFE3BD775403EF2D85BC3681BF
            EFA12D7BAF803FE09EBF027E1F3C5343E0A875CBB4FF00978D7667BCDDF58D8F
            97FF008E57D07A4E8D61A0D84563A658DBE9D6510DB1DBDAC4B14683D02A8005
            5CA28A2BE0DFF8292FED90BF0E7C3F71F0B7C1D7A1BC59AB43B354BAB76CB69F
            6CE3FD5823A4B203F55539E0B29AE93FE09C9FB21B7C0EF04B78D3C5365E5F8E
            35F846D8655F9F4EB438658B1D9DF019FD30ABC1073F67514514514514515E6F
            FB46FC528FE0B7C10F18F8C59D527D36C1CDA86E8D72FF00242BF432320FA66B
            E14FF82437C2D9750D4FC6FF001435146964C8D1ECE79392CEC44B70D93DFF00
            D48CFF00B4D5FA67484850493803BD7C4DFB57FF00C14B7C2DF08BED9E1BF87F
            F66F17F8BD731C974AFBAC2C5FBEE653FBD71FDD5381DD811B6BE68F837FB1AF
            C59FDB4BC549F10BE2E6B5A8E95E1FBA21D6E6F1717775167212DA1236C5173C
            310179CAAB64D7E9E7C26F835E0FF821E1587C3FE0DD16DF47B04C191A31996E
            1F18DF2C87E676F727D86060576B4514515CDFC41F871E1AF8ABE18BAF0F78B3
            46B5D7347B91F3DB5D26707B329EA8C33C329047635F98FF001EFF00E09FFF00
            10BF66CF119F887F04356D4F51D3AC98CE2DED1C8D4EC17B8017FD7C78E08033
            8E1948C9AF5FFD94FF00E0A81A3F8D1AD3C2FF0016441E1BF1064451EBAA3CBB
            2B96E9FBD1FF002C18FAFDCEBF73815F7CC13C7750C734322CB148A192443956
            079041EE2A4AFCFEFF0082BB7C24FEDDF86BE1AF883690EEBAD06ECD8DE3A8E7
            ECD3E36B31F4591540FF00AEA6BE87FD877E2D7FC2E3FD9A3C1FAB4D379DA9D8
            DBFF00655F9272DE74184DCDEEC811FF00E075EF545145145145145145145145
            14514514514514514514514514514557D42C2DB55B1B8B2BDB78EEACEE636866
            82640C92230C32B03C104120835F91FF00B4BFC01F187EC13F196C3E297C3292
            64F084B73BA06E644B366FBF677033F344C32149EA38CEE50C7F44BF65FF00DA
            7FC31FB4F780A2D6747916CF59B6554D534691C196CE523FF1E8DB04ABE30471
            C1040F66A28A28A28A28A28A28A28A28A2BE51FDB87F6DCD2FF66DF0EC9A0E83
            2C1A97C44BF8BFD1AD7874D3D18713CC3D7FBA87EF1E4F039F9DBFE09FBFB1BE
            A7E3EF11A7C6FF008A914F7A6E2737FA45A6A39692F662DBBED936792B9E501F
            BC7E6E81777E9BF4A28A28A28A28A28AFCE7FF0082BEFC5A365E1BF07FC37B39
            B136A1336AF7C8A79F2A3CC7083EA19CC87EB10AFAD7F643F84A3E0AFECEFE0C
            F0CCB0F93A8AD98BBBF0461BED337EF2407D7696D9F4415D67C5CF8D1E0EF81B
            E1597C41E32D6A0D22C57222473BA6B87C6764518F99DBD80E3A9C0C9AFCC2F8
            C3FB61FC5CFDB67C54FF000F7E1368BA8693E1DB9251AD2CDB1757316705EEA6
            076C51F3CA82179C333F15F4F7ECA3FF0004D5F0AFC1EFB1F88FC79F66F1878C
            1312470326EB0B17FF0061587EF5C7F7DC6071850466BED5030303814B451451
            451457C99FB567FC13CFC17FB40ADDEBBA108BC23E38605CDFDBC7FE8D7AFF00
            F4F118EE7FE7A2FCDCF3BB0057C61F0F3F683F8DBFF04F6F1845E0BF1EE9373A
            BF84431F2B4FBB90B4462CF3258DC7200E73B391CE0AAB1247E9BFC0CFDA27C0
            DFB4478646B1E0ED5D2ED900FB569F3623BBB463FC32C79C8EF86195383826B5
            7E367C37B6F8BDF09BC57E0EBA0A1357D3E5B78DDC64472E3313FF00C05C2B7E
            15F9E3FF000497F89173E12F887E38F855AC6EB696E54DF5BDBCA7063BA81BCB
            9D31FDE2A549F684D7EA25145145145145145145145145145145145145145145
            1451451451456578ABC2BA478DFC3BA8683AEE9F06A9A45FC2D05CDA5C2EE491
            0F507F9823904023915F935F1EFF0066FF00889FB027C4B8BE267C2FBEBBB8F0
            78970B720190DAAB119B6BB4E8F1B70039E0F1F758293F777EC99FB6AF843F69
            ED123B54923D0FC6D6F16EBDD0A69396C7592027FD647FF8F2F71D09FA328A28
            A28A28A28A28A28A28AF8A7F6D2FF828768DF04E0BDF08F80E7B7D77C7A418A6
            B85C496DA51E84BF6794764E80FDEE9B4F89FEC69FB086B7F173C46BF16FE362
            DD5DDB5E4DF6EB5D2B5224CFA9484EE135C03C88BA1087EFF19C26037E9FC512
            4112471A2C71A00AAAA30001D0014FA28A28A28A28A2909C0CD7E4303FF0D95F
            F0527C9FF4CF0CE97A97FBD1FD82C7FF00659645FCE6AFAB7F6AEFF8291784BE
            098BCF0E782FECFE30F19A663731BEEB1B17E9FBD753F3B03FC087B105948C1F
            953E12FEC99F187F6E8F15C7E3FF008A5AD5FE93E199C864BDBC4C4D3C59CF97
            670602C71FA3E02F3901CE6BF4F3E0EFC0FF00067C07F0AC7A0783345874BB41
            8334C06E9EE9C0FBF2C87976FAF03A000715DE514514514514514572BF12BE16
            F857E2FF0085AE7C3BE2FD16DB5BD267EB15C2FCD1B6387461F3230CF0CA411E
            B5F989F1CBF612F899FB29F899BE227C16D6353D4F49B3265C599FF898D8A752
            B220189E2C75C0E99DC98049F75FD947FE0A77E1FF0088A6CFC33F143ECFE16F
            12B6228B571F2585E374F9C9FF0050E7DFE43CF2B90B5F3C7ED4103FEC9FFF00
            0503D1FE2169CA5344D56EA1D7B30F2248A5263BD404752DFBE3F4916BF5C6CE
            EE1BFB486E6DE459A0991648E4439565232083DC115351451451451451451451
            4514514514514514514514514514514514556D4B4CB4D674FB9B0BFB586F6CAE
            6368A7B6B88C3C72A30C32B29E0820E0835F9A3FB537FC13775BF02EB6FF0010
            BE044B770BDAC9F6B6D02D2664BAB471CEFB37072C07FCF3CEE1FC25B2146AFE
            CC1FF054536D341E10F8DB6F2585F40DF671E248E02BF3038C5D42065581E0BA
            0FAA8E5ABF44B41F10699E29D22D755D1B50B5D574CBA41241796732CB14AA7B
            AB29208FA568514514514514514515CBFC44F89DE15F84DE1B9F5EF176B967A0
            E9517067BB9305CFF75147CCEC7B2A824FA57E67FED07FF050DF1CFED09AE7FC
            2BDF81FA56A7A7D95FB9B71796C84EA77E3BEC0BFEA131C920EEC0C9651915EC
            DFB1E7FC135B4DF86D3DA78C7E2925BEBFE2B044D6DA3E44B6960FD43487A4D2
            8FFBE14F4DC70C3EF10302968A28A28A28A28A2BC77F6BCF8B07E0BFECEDE34F
            1343298B504B336960CA7E617331F2A361FEE96DFF004535F899F03E3F895AF6
            BBA8F85FE1945A84BAC7886DFEC77634C1B666B6DC1995A5E3CB8890A5C92A0E
            00271C57E98FECA3FF0004CBF0D7C2CFB1F897E23FD9BC5BE2B5C4B1E9FB77E9
            F64DDBE523F7CE3D586D1D9720357DC6AA1142A80AA380076A5A28A28A28A28A
            28A28A4EB5F207ED5DFF0004E7F077C77179E20F0B791E0FF1BBE6469E28F167
            7CFD7F7D1AFDD627FE5A28CF2490FC57E5D7C79F0E7C54F868749F87DF1261BE
            8A0D09A56D205E7EF63589F687FB3CDFC511D8A76824291D149607F5BBFE09DF
            F164FC57FD97BC36D71299753D0376877449E7F7207947DF30B45CFAE6BE97A2
            8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28AF9EBF694
            FD87FE1D7ED270CB7BA8D99D07C55B311EBFA6A2ACCC71C0997A4ABD3EF7CD81
            80CB5F00EABF0A7F697FF827DEAD71AB7862F2E358F072C864967D395AEB4E95
            7D6E2DCF311C6017C0C740E6BE8DF81DFF000565F0578AD20D3FE246953783B5
            33856D42D15AE6C5CFA9001923FA61C7AB57DADE0CF883E19F88BA4A6A7E17D7
            B4ED7EC180FDFE9D72932827B1DA4E0FB1E6BA0A28A28A28A2B86F899F1C3C05
            F0734F6BCF1978AB4DD0536EE58AE66067907FB112E5DFFE02A6BE16F8DFFF00
            056D859E5D1FE11F86E4BFBA90F949ACEB3190BB8F00C56EA77375E0B91CF543
            5E67E03FD8AFE3CFED85E2383C5DF1735CBFD074893E659B5819BA319392B6F6
            8302153EE1073901ABF46BE03FECCDE00FD9CF43361E0FD1921BA9542DD6AB75
            892F2EB1FDF931D3BED50147602BD528A28A28A28A28A28A2B33C4BE19D2BC63
            A15EE8BAE69D6DAAE937B198AE2CEEE312472A9EC54D72BF08BE04F817E04E89
            2E95E08F0F5B68B6F33F993489992698E4E37CAC4BB633C02703B62BBDA28A28
            A28A28A28A28A28A28AE3FE297C23F08FC68F0BCDE1FF196896DAD69B272AB30
            C3C2DFDF8DC6191BDD483DBA568780FC01E1EF863E17B2F0E785F49B6D1746B3
            5DB0DADB2E00F5627AB31EA589249E4935D05145145145145145145145145145
            145145145145145145145145145145148406182323D0D7CE5F1B3F603F83FF00
            1B1EE2F2EB40FF0084735C9724EABA0116CECDEAF1E0C6E49EA4AEE3EB5F1A78
            BFFE097DF17FE136AC75AF84FE364D5658B26236F74FA55F8EF80776C3F5DEB9
            F4AC98BF6AFF00DAF7F673CDBF8D341BED574FB7E0CBE22D21A58B1DF1750EDD
            FF0052ED5E87E12FF82C7A6123F14FC367423EFDC695A9673F48A4418FFBEEBD
            5344FF0082B5FC19D4917EDBA778A34993F8BCFB18A451F4292B13F957536FFF
            00053DF8033005FC49A8419ED26937071F929A8EEFFE0A85F00EDD098F5ED4EE
            88FE18B4A9813FF7D015C7EBDFF0574F847A7AB2E9BA178A75597B1FB2C10C67
            F16973FF008ED791F8BBFE0B15AC5E6F87C23F0DED6DA42711CFAB5F3DC6E3DB
            31C6A9F96FAE364F8ABFB6A7ED347C9D0F4FD7343D2A7E8DA5D98D22DF07B8B9
            936B1FA090D75FF0DFFE0927E2AF14DF8D5FE2A78E52D6499BCC9ED74B2D7775
            267AEF9E4C2AB7B85715F6FF00C16FD91BE167C0458E5F0AF85EDD75555C36AF
            7FFE9378DEA448DF733DC2051ED5EC7451451451451451451451451451451451
            4514514514514514514514514514514514514514514514514514514514514514
            51451451451451451451485437500FD6B81F167C00F869E3B677D7FC05E1DD56
            56E4CF73A642D2FE0FB770FCEBC7BC71FF0004FEF8033E9B737A3E1EDB4170A3
            20DB5FDDC2A3FE029281FA57C9DE2EFD94BE16E973CCB6DE18F2C2B1007DBEE4
            FF00392B67E1FF00EC85F0975BD42DE3BDF0A79C8E4647F685D2E7F29457D5FE
            19FD813E016890C3341F0E2C2690A863F6DB9B8B919FA4B230AF5CF097C23F03
            F8082FFC237E0FD0F412BD1B4ED3A281BF35504D758063A52D14514514514514
            57FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 56.692950000000000000
          Width = 536.693260000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Fatura Mensal')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 90.708720000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 483.779840000000000000
        Top = 544.252320000000100000
        Width = 737.008350000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 22.677180000000020000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 68.031540000000400000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 45.354360000000380000
          Width = 188.476500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftBottom]
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 23.177180000000020000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 14.779530000000000000
          Top = 128.504020000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Color = clGray
          Frame.ShadowWidth = 3.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 555.252320000000000000
          Top = 3.779530000000136000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Recibo do Sacado')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 27.456709999999820000
          Width = 98.267780000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 47.133889999999720000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 68.531540000000400000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 98.267780000000130000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 102.046985350000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 529.634200000000000000
          Height = 113.606370000000000000
          Frame.Typ = [ftRight]
        end
        object Memo91: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 264.228510000000000000
          Top = 207.874150000000000000
          Width = 104.606370000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 367.834880000000000000
          Top = 208.374150000000000000
          Width = 69.252010000000000000
          Height = 22.177180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 207.874150000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 230.551330000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 211.315090000000000000
          Top = 230.551330000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 263.728510000000000000
          Top = 230.551330000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 230.551330000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 162.519789999999900000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 207.874150000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 230.551330000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 185.196970000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 343.937229999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Uso do Banco')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 152.401670000000000000
          Top = 208.374150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'  do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 369.614410000000000000
          Top = 207.374150000000000000
          Width = 45.354360000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Aceite')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do Processamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Carteira')
          ParentFont = False
          WordWrap = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 215.094620000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie')
          ParentFont = False
          WordWrap = False
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 438.425480000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Instru'#231#245'es de responsabilidade do cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 139.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Left = 430.527830000000000000
          Top = 241.889920000000000000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 541.165740000000000000
          Top = 162.519789999999900000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 185.696970000000000000
          Width = 113.385900000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Ag'#234'ncia/C'#243'digo do Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 208.874150000000000000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
          WordWrap = False
        end
        object Memo133: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 232.051330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Desconto/Abatimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Outras Dedu'#231#245'es')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo137: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Outros Acr'#233'scimos')
          ParentFont = False
          WordWrap = False
        end
        object Memo138: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 345.437229999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Memo139: TfrxMemoView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 367.287350309999100000
          Width = 438.425480000000000000
          Height = 10.343846670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 412.645950000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 412.645625349999000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 12.166666670000000000
          Top = 366.781076669999000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo144: TfrxMemoView
          AllowVectorExport = True
          Left = 387.953000000000000000
          Top = 217.653680000000000000
          Width = 35.336810390000000000
          Height = 11.677180000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Aceite]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '18')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          AllowVectorExport = True
          Left = 210.815090000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          AllowVectorExport = True
          Left = 90.429190000000000000
          Top = 162.578850000000000000
          Width = 445.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          AllowVectorExport = True
          Left = 90.370130000000000000
          Top = 49.133889999999720000
          Width = 445.984540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome]')
          ParentFont = False
          WordWrap = False
        end
        object Memo149: TfrxMemoView
          AllowVectorExport = True
          Left = 91.929190000000010000
          Top = 27.980173390000000000
          Width = 446.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
          WordWrap = False
        end
        object Memo156: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 397.527830000000000000
          Width = 438.425480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacador/Avalista')
          ParentFont = False
          WordWrap = False
        end
        object Memo165: TfrxMemoView
          AllowVectorExport = True
          Left = 639.913730000000000000
          Top = 34.527373540000210000
          Width = 83.240260000000000000
          Height = 10.397650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo169: TfrxMemoView
          AllowVectorExport = True
          Left = 45.295300000000000000
          Top = 188.476500000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Centro Esp'#237'rita Beneficiente Uni'#227'o do Vegetal - N'#250'cleo Rei Inca')
          ParentFont = False
          WordWrap = False
        end
        object Memo172: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 216.944542600000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo173: TfrxMemoView
          AllowVectorExport = True
          Left = 640.075140000000000000
          Top = 239.110390000000100000
          Width = 80.740260000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo177: TfrxMemoView
          AllowVectorExport = True
          Left = 607.342920000000000000
          Top = 168.578850000000000000
          Width = 115.870130000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15066597
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo180: TfrxMemoView
          AllowVectorExport = True
          Left = 442.145950000000000000
          Top = 216.944542600000000000
          Width = 90.708720000000000000
          Height = 12.897650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DataProcessamento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo181: TfrxMemoView
          AllowVectorExport = True
          Left = 590.563390000000000000
          Top = 194.756030000000000000
          Width = 132.283550000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[AgenciaCodigoCedente]')
          ParentFont = False
          WordWrap = False
        end
        object Memo182: TfrxMemoView
          AllowVectorExport = True
          Left = 589.472790000000000000
          Top = 217.933210000000000000
          Width = 133.342610000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 162.519789999999900000
          Width = 716.445270000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 12.208720000000000000
          Top = 23.177180000000020000
          Width = 717.901980000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo185: TfrxMemoView
          AllowVectorExport = True
          Left = 219.874150000000000000
          Top = 141.622139999999900000
          Width = 501.409710000000000000
          Height = 17.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[LinhaDigitavel]')
          ParentFont = False
          WordWrap = False
        end
        object Memo186: TfrxMemoView
          AllowVectorExport = True
          Left = 218.874150000000000000
          Top = 3.779530000000136000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
          WordWrap = False
        end
        object Memo154: TfrxMemoView
          AllowVectorExport = True
          Left = 543.913730000000000000
          Top = 442.882189999999000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Ficha de Compensa'#231#227'o')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          AllowVectorExport = True
          Left = 49.074830000000000000
          Top = 272.008040000000100000
          Width = 476.220780000000000000
          Height = 64.252010000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Instrucoes]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 41.333333340000000000
          Top = 380.107296670000000000
          Width = 566.929500000000000000
          Height = 16.230983330000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome] - [SacadoCPFCGC]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 268.000000000000000000
          Top = 215.735930000000100000
          Width = 96.675400390000000000
          Height = 15.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[EspecieDocumento]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 539.500000000000000000
          Top = 45.389610000000290000
          Width = 192.500000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 17.000000000000000000
          Top = 214.735930000000100000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DataDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 2.389609999999948000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 142.235930000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 26.118120000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nosso Numero')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo178: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 75.811070000000440000
          Width = 94.488250000000000000
          Height = 13.397650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 264.567100000000000000
        Width = 737.008350000000000000
        Columns = 1
        FooterAfterEach = True
        RowCount = 0
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 3.220470000000000000
          Top = 26.456709999999990000
          Width = 729.449290000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Familia"'
        StartNewPage = True
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Familia"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 491.338900000000000000
        Width = 737.008350000000000000
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 737.008350000000000000
        Columns = 2
        ColumnWidth = 377.952755905512000000
        RowCount = 0
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999966000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'Compromisso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Compromisso"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779529999999966000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Data_Compromisso'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '####/##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Data_Compromisso"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Valor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Valor"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 362.834880000000000000
        Width = 737.008350000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 737.008350000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Nome"'
        KeepTogether = True
        StartNewPage = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          DataField = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Nome"]')
          ParentFont = False
        end
      end
    end
  end
  object sqlCompromissoRealizado: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_COMPROMISSO_VENCIDO'#13#10'WHERE SITUACAO IN ('#39'2'#39', '#39'3' +
      #39')'#13#10'  AND TIPO_OPERACAO = '#39'C'#39#13#10'ORDER BY DATA_REALIZACAO DESC, AN' +
      'O_MES_REFERENCIA, CONTABIL_CONTA_ID')
    ParamData = <>
    Params = <>
    AfterScroll = sqlCompromissoRealizadoAfterScroll
    OnCalcFields = sqlCompromissoRealizadoCalcFields
    Left = 544
    Top = 248
    object sqlCompromissoRealizadoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoRealizadoBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoRECIBO_NUMERO: TBCDField
      FieldName = 'RECIBO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoDIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlCompromissoRealizadoVALOR_ORIGEM: TBCDField
      FieldName = 'VALOR_ORIGEM'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoRealizadoQTD_ADICIONAL: TBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_REALIZACAO'
    end
    object sqlCompromissoRealizadocalc_TipoDocumento: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_TipoDocumento'
      Size = 1
      Calculated = True
    end
    object sqlCompromissoRealizadocalc_NumeroDocumento: TStringField
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'calc_NumeroDocumento'
      Size = 6
      Calculated = True
    end
    object sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlCompromissoRealizadocalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoRealizadoPESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      Size = 120
    end
    object sqlCompromissoRealizadocalc_NaoAssociado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_NaoAssociado'
      Calculated = True
    end
    object sqlCompromissoRealizadoQUITADO_GRUPO_ID: TBCDField
      FieldName = 'QUITADO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoANO_MES_REALIZADO: TStringField
      FieldName = 'ANO_MES_REALIZADO'
      Size = 10
    end
  end
  object dtsCompromissoRealizado: TDataSource
    DataSet = sqlCompromissoRealizado
    Left = 544
    Top = 280
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 416
    Top = 172
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
  object frxDBDatasetcABECALHO: TfrxDBDataset
    UserName = 'frxDBDatasetCabecalho'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BALANCETE_GRUPO_ID=BALANCETE_GRUPO_ID'
      'CABECALHO=CABECALHO'
      'TEXTO_CABECALHO=TEXTO_CABECALHO')
    DataSet = dtmLookup.sqlCabecalho
    BCDToCurrency = False
    Left = 212
    Top = 352
  end
  object sqlAjusteProgramado: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT CT.DESCRICAO, P.NOME, LC.VALOR_ATUAL'#13#10'FROM T_PROGRAMACAO_' +
      'AJUSTE PA LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA ON'#13#10'  PA.COM' +
      'PROMISSO_AGENDADO_ID = CA.COMPROMISSO_AGENDADO_ID'#13#10'  LEFT OUTER ' +
      'JOIN T_CONTABIL_CONTA CT ON'#13#10'  CA.CONTABIL_CONTA_ID = CT.CONTABI' +
      'L_CONTA_ID'#13#10'  LEFT OUTER JOIN T_PESSOA P ON'#13#10'  PA.PESSOA_ID = P.' +
      'PESSOA_ID'#13#10'  LEFT OUTER JOIN T_LANCAMENTO_COMPROMISSO LC ON'#13#10'  C' +
      'A.LANCAMENTO_COMPROMISSO_ID = LC.LANCAMENTO_COMPROMISSO_ID'#13#10'WHER' +
      'E PA.SITUACAO = '#39'R'#39#13#10'  AND PA.PESSOA_ID = :PESSOA_ID'#13#10'  AND ANO_' +
      'MES = :ANOMES'#13#10'ORDER BY PA.PROGRAMACAO_AJUSTE_ID')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end>
    Params = <>
    Left = 252
    Top = 240
    object sqlAjusteProgramadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlAjusteProgramadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlAjusteProgramadoVALOR_ATUAL: TBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
  end
  object dtsAjusteProgramado: TDataSource
    DataSet = sqlAjusteProgramado
    Left = 252
    Top = 272
  end
  object frxDBDatasetAjuste: TfrxDBDataset
    UserName = 'frxDBDatasetAjuste'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DESCRICAO=DESCRICAO'
      'NOME=NOME'
      'VALOR_ATUAL=VALOR_ATUAL')
    DataSet = sqlAjusteProgramado
    BCDToCurrency = False
    Left = 244
    Top = 352
  end
  object popExportacao: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 335
    Top = 176
    object ExportalExcel1: TMenuItem
      Caption = 'Exportal Excel'
      ImageIndex = 61
      OnClick = ExportalExcel1Click
    end
  end
  object frxReport1: TfrxReport
    Version = '6.8.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38715.516369351900000000
    ReportOptions.LastChange = 39779.901028530100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 552
    Top = 360
    Datasets = <
      item
      end
      item
      end>
    Variables = <
      item
        Name = 'TituloRelatorio'
        Value = 
          #39'Cobran'#231'a - BANCO DO BRASIL - Sacado: PROTRAUMA SERVI'#199'OS MEDICOS' +
          ' S/C LTDA'#39
      end
      item
        Name = 'NomeBanco'
        Value = #39'BANCO DO BRASIL'#39
      end
      item
        Name = 'CodigoBanco'
        Value = #39'001-9'#39
      end
      item
        Name = 'LocalPagamento'
        Value = #39'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'#39
      end
      item
        Name = 'DataVencimento'
        Value = #39'04/01/2006'#39
      end
      item
        Name = 'NomeCedente'
        Value = #39'REAL LIMP COM. DE MAT. DE LIMP. LTDA'#39
      end
      item
        Name = 'AgenciaCodigoCedente'
        Value = #39'03884-9 / 000000014684-6'#39
      end
      item
        Name = 'DataDocumento'
        Value = #39'20/12/2005'#39
      end
      item
        Name = 'NumeroDocumento'
        Value = #39'005423/1-1'#39
      end
      item
        Name = 'EspecieDocumento'
        Value = #39'DM'#39
      end
      item
        Name = 'Aceite'
        Value = #39'N'#39
      end
      item
        Name = 'DataProcessamento'
        Value = #39'16/07/2006'#39
      end
      item
        Name = 'NossoNumero'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'Carteira'
        Value = #39'17'#39
      end
      item
        Name = 'EspecieMoeda'
        Value = #39'R$'#39
      end
      item
        Name = 'ValorDocumento'
        Value = #39'88,08'#39
      end
      item
        Name = 'Instrucoes'
        Value = #39#13#10'PROTESTAR AP'#211'S 7 DIAS DO VENCIMENTO.'#13#10#39
      end
      item
        Name = 'SacadoNome'
        Value = #39'PROTRAUMA SERVI'#199'OS MEDICOS S/C LTDA'#39
      end
      item
        Name = 'SacadoCPFCGC'
        Value = #39'CNPJ: 00.588.915/0001-60'#39
      end
      item
        Name = 'SacadoRuaNumeroComplemento'
        Value = #39'AVENIDA BRASIL 3114,    '#39
      end
      item
        Name = 'SacadoCEPBairroCidadeEstado'
        Value = #39'42850-000    CENTRO    DIAS D'#39#39'AVILA    BA'#39
      end
      item
        Name = 'CodigoBaixa'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'LinhaDigitavel'
        Value = #39'00190.00009 01051.039004 00001.806173 5 30110000008808'#39
      end
      item
        Name = 'CodigoBarra'
        Value = #39'00195301100000088080000001051039000000180617'#39
      end>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clNavy
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 8.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 737.008350000000000000
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 90.708720000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 483.779840000000000000
        Top = 544.252320000000000000
        Width = 737.008350000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 22.677180000000020000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 68.031540000000400000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 45.354360000000380000
          Width = 188.476500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftBottom]
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 23.177180000000020000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 14.779530000000000000
          Top = 128.504020000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Color = clGray
          Frame.ShadowWidth = 3.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 555.252320000000000000
          Top = 3.779530000000136000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Recibo do Sacado')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 27.456709999999820000
          Width = 98.267780000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 47.133889999999720000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 68.531540000000400000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 98.267780000000130000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 102.046985350000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 529.634200000000000000
          Height = 113.606370000000000000
          Frame.Typ = [ftRight]
        end
        object Memo91: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 264.228510000000000000
          Top = 207.874150000000000000
          Width = 104.606370000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 367.834880000000000000
          Top = 208.374150000000000000
          Width = 69.252010000000000000
          Height = 22.177180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 207.874150000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 230.551330000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 211.315090000000000000
          Top = 230.551330000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 263.728510000000000000
          Top = 230.551330000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 230.551330000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 162.519789999999900000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 207.874150000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 230.551330000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 185.196970000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 343.937229999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Uso do Banco')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 152.401670000000000000
          Top = 208.374150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'  do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 369.614410000000000000
          Top = 207.374150000000000000
          Width = 45.354360000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Aceite')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do Processamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Carteira')
          ParentFont = False
          WordWrap = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 215.094620000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie')
          ParentFont = False
          WordWrap = False
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 438.425480000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Instru'#231#245'es de responsabilidade do cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 139.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Left = 430.527830000000000000
          Top = 241.889920000000000000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 541.165740000000000000
          Top = 162.519789999999900000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 185.696970000000000000
          Width = 113.385900000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Ag'#234'ncia/C'#243'digo do Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 208.874150000000000000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
          WordWrap = False
        end
        object Memo133: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 232.051330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Desconto/Abatimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Outras Dedu'#231#245'es')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo137: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Outros Acr'#233'scimos')
          ParentFont = False
          WordWrap = False
        end
        object Memo138: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 345.437229999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Memo139: TfrxMemoView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 367.287350309999100000
          Width = 438.425480000000000000
          Height = 10.343846670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 412.645950000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 412.645625349999000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 12.166666670000000000
          Top = 366.781076669999000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo144: TfrxMemoView
          AllowVectorExport = True
          Left = 387.953000000000000000
          Top = 217.653680000000000000
          Width = 35.336810390000000000
          Height = 11.677180000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Aceite]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '18')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          AllowVectorExport = True
          Left = 210.815090000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          AllowVectorExport = True
          Left = 90.429190000000000000
          Top = 162.578850000000000000
          Width = 445.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          AllowVectorExport = True
          Left = 90.370130000000000000
          Top = 49.133889999999720000
          Width = 445.984540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome]')
          ParentFont = False
          WordWrap = False
        end
        object Memo149: TfrxMemoView
          AllowVectorExport = True
          Left = 91.929190000000010000
          Top = 27.980173390000000000
          Width = 446.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
          WordWrap = False
        end
        object Memo156: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 397.527830000000000000
          Width = 438.425480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacador/Avalista')
          ParentFont = False
          WordWrap = False
        end
        object Memo165: TfrxMemoView
          AllowVectorExport = True
          Left = 639.913730000000000000
          Top = 34.527373540000210000
          Width = 83.240260000000000000
          Height = 10.397650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo169: TfrxMemoView
          AllowVectorExport = True
          Left = 45.295300000000000000
          Top = 188.476500000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Centro Esp'#237'rita Beneficiente Uni'#227'o do Vegetal - N'#250'cleo Rei Inca')
          ParentFont = False
          WordWrap = False
        end
        object Memo172: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 216.944542600000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo173: TfrxMemoView
          AllowVectorExport = True
          Left = 640.075140000000000000
          Top = 239.110390000000100000
          Width = 80.740260000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo177: TfrxMemoView
          AllowVectorExport = True
          Left = 607.342920000000000000
          Top = 168.578850000000000000
          Width = 115.870130000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15066597
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo180: TfrxMemoView
          AllowVectorExport = True
          Left = 442.145950000000000000
          Top = 216.944542600000000000
          Width = 90.708720000000000000
          Height = 12.897650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DataProcessamento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo181: TfrxMemoView
          AllowVectorExport = True
          Left = 590.563390000000000000
          Top = 194.756030000000000000
          Width = 132.283550000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[AgenciaCodigoCedente]')
          ParentFont = False
          WordWrap = False
        end
        object Memo182: TfrxMemoView
          AllowVectorExport = True
          Left = 589.472790000000000000
          Top = 217.933210000000000000
          Width = 133.342610000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 162.519789999999900000
          Width = 716.445270000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 12.208720000000000000
          Top = 23.177180000000020000
          Width = 717.901980000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo185: TfrxMemoView
          AllowVectorExport = True
          Left = 219.874150000000000000
          Top = 141.622139999999900000
          Width = 501.409710000000000000
          Height = 17.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[LinhaDigitavel]')
          ParentFont = False
          WordWrap = False
        end
        object Memo186: TfrxMemoView
          AllowVectorExport = True
          Left = 218.874150000000000000
          Top = 3.779530000000136000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
          WordWrap = False
        end
        object Memo154: TfrxMemoView
          AllowVectorExport = True
          Left = 543.913730000000000000
          Top = 442.882189999999000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Ficha de Compensa'#231#227'o')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          AllowVectorExport = True
          Left = 49.074830000000000000
          Top = 272.008040000000100000
          Width = 476.220780000000000000
          Height = 64.252010000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Instrucoes]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 41.333333340000000000
          Top = 380.107296670000000000
          Width = 566.929500000000000000
          Height = 16.230983330000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome] - [SacadoCPFCGC]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 268.000000000000000000
          Top = 215.735930000000100000
          Width = 96.675400390000000000
          Height = 15.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[EspecieDocumento]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 539.500000000000000000
          Top = 45.389610000000290000
          Width = 192.500000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 17.000000000000000000
          Top = 214.735930000000100000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DataDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 2.389609999999948000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 142.235930000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 26.118120000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nosso Numero')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo178: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 75.811070000000440000
          Width = 94.488250000000000000
          Height = 13.397650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 264.567100000000000000
        Width = 737.008350000000000000
        Columns = 1
        FooterAfterEach = True
        RowCount = 0
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 3.220470000000000000
          Top = 26.456709999999990000
          Width = 729.449290000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Familia"'
        StartNewPage = True
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Familia"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 491.338900000000000000
        Width = 737.008350000000000000
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 737.008350000000000000
        Columns = 2
        ColumnWidth = 377.952755905512000000
        RowCount = 0
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999966000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'Compromisso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Compromisso"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779529999999966000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Data_Compromisso'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '####/##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Data_Compromisso"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Valor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Valor"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 362.834880000000000000
        Width = 737.008350000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 737.008350000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Nome"'
        KeepTogether = True
        StartNewPage = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          DataField = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Nome"]')
          ParentFont = False
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 733
    Top = 252
  end
  object cdsRetorno: TClientDataSet
    PersistDataPacket.Data = {
      320300009619E0BD01000000180000001900000000000300000032030D544950
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
      14000A4C4F43414C495A41444F02000300000000000F56414C4F525F444F4355
      4D454E544F080004000000010007535542545950450200490006004D6F6E6579
      0009444F43554D454E544F01004900000001000557494454480200020014000A
      56414C4F525F5041474F08000400000001000753554254595045020049000600
      4D6F6E65790008534954554143414F0100490000000100055749445448020002
      001400044E4F4D4501004900000001000557494454480200020078000E444154
      415F504147414D454E544F0400060000000000075245544F524E4F0200030000
      0000000B53454C4543494F4E41444F02000300000000000B544158415F424F4C
      45544F080004000000010007535542545950450200490006004D6F6E6579000C
      444154415F4352454449544F04000600000000000000}
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
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DATA_PAGAMENTO'
        DataType = ftDate
      end
      item
        Name = 'RETORNO'
        DataType = ftBoolean
      end
      item
        Name = 'SELECIONADO'
        DataType = ftBoolean
      end
      item
        Name = 'TAXA_BOLETO'
        DataType = ftCurrency
      end
      item
        Name = 'DATA_CREDITO'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeEdit = cdsRetornoBeforeEdit
    Left = 792
    Top = 368
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
    object cdsRetornoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsRetornoDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsRetornoRETORNO: TBooleanField
      FieldName = 'RETORNO'
    end
    object cdsRetornoSELECIONADO: TBooleanField
      FieldName = 'SELECIONADO'
    end
    object cdsRetornoTAXA_BOLETO: TCurrencyField
      FieldName = 'TAXA_BOLETO'
    end
    object cdsRetornoDATA_CREDITO: TDateField
      FieldName = 'DATA_CREDITO'
    end
  end
  object dtsRetorno: TDataSource
    DataSet = cdsRetorno
    Left = 792
    Top = 320
  end
  object OpenDialogRetorno: TOpenDialog
    Left = 912
    Top = 304
  end
  object sqlRetornoRemessa: TI9Query
    Aggregates = <>
    SQL.Strings = ('SELECT *'#13#10'FROM T_BOLETA_REMESSA_RETORNO'#13#10'ORDER BY DATA DESC')
    ParamData = <>
    Params = <>
    OnCalcFields = sqlCompromissoRealizadoCalcFields
    Left = 448
    Top = 376
    object sqlRetornoRemessaBOLETA_REMESSA_RETORNO_ID: TBCDField
      FieldName = 'BOLETA_REMESSA_RETORNO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlRetornoRemessaDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlRetornoRemessaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object sqlRetornoRemessaQTD_REG_CONFIRMADO: TBCDField
      FieldName = 'QTD_REG_CONFIRMADO'
      Precision = 20
      Size = 2
    end
    object sqlRetornoRemessaQTD_REG_REMESSA: TBCDField
      FieldName = 'QTD_REG_REMESSA'
      Precision = 20
      Size = 2
    end
    object sqlRetornoRemessaQTD_REG_PAGO: TBCDField
      FieldName = 'QTD_REG_PAGO'
      Precision = 20
      Size = 2
    end
    object sqlRetornoRemessaNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 60
    end
    object sqlRetornoRemessaQTD_REG_BAIXADO: TBCDField
      FieldName = 'QTD_REG_BAIXADO'
      Precision = 20
      Size = 2
    end
  end
  object dtsRetornoRemessa: TDataSource
    DataSet = sqlRetornoRemessa
    Left = 448
    Top = 424
  end
  object sqlCompromissosAntigos: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT DISTINCT(boleta_id) as recibo'#13#10'FROM T_COMPROMISSO_VENCIDO' +
      #13#10'WHERE ANO_MES_REALIZADO between 201701 and 201704'#13#10' AND NOT bo' +
      'leta_id IS NULL')
    ParamData = <>
    Params = <>
    Left = 628
    Top = 388
    object sqlCompromissosAntigosRECIBO: TBCDField
      FieldName = 'RECIBO'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompromissosAntigos: TDataSource
    DataSet = sqlCompromissosAntigos
    Left = 628
    Top = 448
  end
  object sqlReciboAgrupado: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'SELECT SUM(CV.VALOR_ATUAL) AS VALOR_RECIBO,'#13#10'       CAST(CV.DATA' +
      '_REALIZACAO AS DATE) AS DATA,'#13#10'       CV.RECIBO_NUMERO,'#13#10'       ' +
      'CV.EMAIL_ENCAMINHAR,'#13#10'       CV.QUITADO_GRUPO_ID,'#13#10'       CASE W' +
      'HEN CV.QUITADO_GRUPO_ID IS NULL'#13#10'          THEN TRIM(CV.PESSOA_N' +
      'OME)'#13#10'       ELSE '#39#39#13#10'        END AS NOME_RECIBO'#13#10'       '#13#10'FROM ' +
      'T_COMPROMISSO_VENCIDO CV'#13#10'WHERE CV.ANO_MES_REALIZADO BETWEEN :AN' +
      'O_MES_INICIAL AND :ANO_MES_FINAL'#13#10'  AND NOT RECIBO_NUMERO IS NUL' +
      'L'#13#10'GROUP BY CV.RECIBO_NUMERO, DATA, CV.EMAIL_ENCAMINHAR, CV.QUIT' +
      'ADO_GRUPO_ID, NOME_RECIBO'#13#10'ORDER BY  CV.RECIBO_NUMERO DESC')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANO_MES_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ANO_MES_FINAL'
        ParamType = ptInput
      end>
    Params = <>
    AfterPost = sqlReciboAgrupadoAfterPost
    OnCalcFields = sqlReciboAgrupadoCalcFields
    Left = 343
    Top = 376
    object sqlReciboAgrupadoVALOR_RECIBO: TBCDField
      FieldName = 'VALOR_RECIBO'
      Precision = 20
      Size = 3
    end
    object sqlReciboAgrupadoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqlReciboAgrupadoRECIBO_NUMERO: TBCDField
      FieldName = 'RECIBO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlReciboAgrupadoEMAIL_ENCAMINHAR: TStringField
      FieldName = 'EMAIL_ENCAMINHAR'
      Size = 1
    end
    object sqlReciboAgrupadoQUITADO_GRUPO_ID: TBCDField
      FieldName = 'QUITADO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlReciboAgrupadoNOME_RECIBO: TStringField
      FieldName = 'NOME_RECIBO'
      Size = 120
    end
    object sqlReciboAgrupadoCALC_APRESENTANTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_APRESENTANTE'
      Size = 120
      Calculated = True
    end
    object sqlReciboAgrupadoCALC_EMAIL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_EMAIL'
      Size = 1
    end
  end
  object dtsReciboAgrupado: TDataSource
    DataSet = sqlReciboAgrupado
    Left = 344
    Top = 424
  end
  object PopupRecibos: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 347
    Top = 258
    object MenuItem1: TMenuItem
      Caption = 'Refazer Lan'#231'amentos Livro Caixa'
      ImageIndex = 61
      OnClick = MenuItem1Click
    end
  end
end
