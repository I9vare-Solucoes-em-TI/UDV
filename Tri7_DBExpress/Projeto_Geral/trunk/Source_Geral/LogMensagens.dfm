object frmLogMensagens: TfrmLogMensagens
  Left = 0
  Top = 0
  Caption = 'Minhas mensagens'
  ClientHeight = 521
  ClientWidth = 1154
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
  object pnl15: TPanel
    Left = 0
    Top = 0
    Width = 1154
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbl5: TLabel
      Left = 7
      Top = 36
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
    object lbl6: TLabel
      Left = 170
      Top = 36
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
    object lbl7: TLabel
      Left = 8
      Top = 11
      Width = 17
      Height = 13
      Caption = 'De:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl8: TLabel
      Left = 163
      Top = 10
      Width = 25
      Height = 13
      Caption = 'Para:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtDataIniChat: TcxDateEdit
      Left = 44
      Top = 33
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
      StyleFocused.Color = 14807280
      StyleFocused.TextColor = clGreen
      StyleFocused.TextStyle = [fsBold]
      StyleHot.TextStyle = [fsBold]
      TabOrder = 4
      Width = 112
    end
    object edtDataFimChat: TcxDateEdit
      Left = 191
      Top = 33
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
      StyleFocused.Color = 14807280
      StyleFocused.TextColor = clGreen
      StyleFocused.TextStyle = [fsBold]
      StyleHot.TextStyle = [fsBold]
      TabOrder = 5
      Width = 112
    end
    object btnPesquisarLogChat: TcxButton
      Left = 312
      Top = 33
      Width = 115
      Height = 21
      Cursor = crHandPoint
      Caption = 'Pesquisar'
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
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnPesquisarLogChatClick
    end
    object lcxDE: TcxLookupComboBox
      Left = 44
      Top = 6
      RepositoryItem = dtmLookup.Lista_UsuarioSistema
      ParentFont = False
      Properties.ClearKey = 46
      Properties.ListColumns = <>
      Properties.OnChange = lcxDEPropertiesChange
      EditValue = 0c
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      Style.TextColor = clNavy
      Style.TextStyle = []
      TabOrder = 1
      Width = 112
    end
    object lcxPARA: TcxLookupComboBox
      Left = 191
      Top = 6
      RepositoryItem = dtmLookup.Lista_UsuarioSistema
      ParentFont = False
      Properties.ClearKey = 46
      Properties.ListColumns = <>
      Properties.OnChange = lcxPARAPropertiesChange
      EditValue = 0c
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      Style.TextColor = clNavy
      Style.TextStyle = []
      TabOrder = 2
      Width = 112
    end
    object btnLimparPesquisaMensagens: TcxButton
      Left = 312
      Top = 6
      Width = 115
      Height = 21
      Cursor = crHandPoint
      Caption = 'Limpar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
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
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLimparPesquisaMensagensClick
    end
    object Panel1: TPanel
      Left = 1102
      Top = 0
      Width = 52
      Height = 57
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 6
      object btnFechar: TcxButton
        Left = 2
        Top = 2
        Width = 48
        Height = 45
        Cursor = crHandPoint
        Hint = 'Fechar'
        Caption = 'Sair'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000033333300DDDD
          DD007E7E7E004E4E4E00CCCCCC00B3B3B300FFFFFF009F9F9F006C6C6C00F1F1
          F100383838006A6A6A006666660091919100B5B5B50062626200EDEDED007474
          7400B1B1B10049494900FFFFFF00C5C5C500D6D6D6004646460089898900E5E5
          E500D5D5D5007676760070707000E3E3E300D2D2D200BBBBBB00F5F5F5009595
          95007B7B7B006E6E6E00EFEFEF0081818100F3F3F30000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060606060604
          03000000000000000000000000000C0906060606060601130000000000000000
          000000000000001C0906060606060200071616161616161616161616161A1B00
          180606060606080010060606060606060606060606061F000C06060606062300
          190606060606060606060606060605000B060606060623001D06060606060606
          06060606060605000B06060606060F0019061C15060606060606060606060500
          0B0606060606120D201000001206060606060606060605000B06060606060606
          06200A000021060606060606060605000B06061E251111111108000000002206
          06060606060605000B06060800000000000000000000000F1006060606060500
          0B06061C000000000000000000000000171A0606060605000B06061C00000000
          0000000000000000171A0606060605000B06060800000000000000000000000F
          10060606060605000B06061E2511111111080000000022060606060606060500
          0B0606060606060606200A000021060606060606060605000B0606060606120D
          201000001206060606060606060605000B06060606060F001906081506060606
          06060606060605000B060606060623001D060606060606060606060606060500
          0B06060606062300190606060606060606060606060605000B06060606060800
          10060606060606060606060606061F000C060606060602000716161616161616
          16161616161A1B0018060606060601130000000000000000000000000000001C
          090606060606060403000000000000000000000000000C090606}
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
        OnClick = btnFecharClick
      end
    end
  end
  object pnl16: TPanel
    Left = 0
    Top = 57
    Width = 1154
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    Color = 14807280
    ParentBackground = False
    TabOrder = 1
    object lblRegistrosEncontrados: TLabel
      Left = 0
      Top = 0
      Width = 229
      Height = 16
      Align = alTop
      Caption = 'N'#186' de Registros Encontrados: 000'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210688
      Font.Height = -13
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 0
      Top = 16
      Width = 427
      Height = 28
      Align = alTop
      Caption = 
        'Para Excluir a mensagem do Log, basta selecionar e clicar "Ctrl ' +
        '+ Del".'#13#10'Ap'#243's excluir, a informa'#231#227'o s'#243' sair'#225' da tela ao clicar e' +
        'm pesquisar novamente.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grdPesquisa: TcxGrid
      Left = 0
      Top = 44
      Width = 1154
      Height = 290
      Align = alClient
      PopupMenu = popExcluirDoLog
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      object gridPesquisaPedidos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dtsLogChat
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
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object gridPesquisaPedidosDATA: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DATA'
          Options.Editing = False
          Options.Filtering = False
          Width = 135
        end
        object gridPesquisaPedidosUSUARIO_ENVIOU_ID: TcxGridDBColumn
          Caption = 'DE'
          DataBinding.FieldName = 'USUARIO_ENVIOU_ID'
          RepositoryItem = dtmLookup.listaG_Usuario
          Options.Editing = False
          Options.Filtering = False
          Width = 114
        end
        object gridPesquisaPedidosUSUARIO_RECEBEU_ID: TcxGridDBColumn
          Caption = 'PARA'
          DataBinding.FieldName = 'USUARIO_RECEBEU_ID'
          RepositoryItem = dtmLookup.listaG_Usuario
          Options.Editing = False
          Options.Filtering = False
          Width = 107
        end
        object gridPesquisaPedidosMENSAGEM: TcxGridDBColumn
          Caption = 'Mensagem'
          DataBinding.FieldName = 'MensagemCalc'
          Options.Editing = False
          Options.Filtering = False
          Width = 691
        end
      end
      object grdPesquisaLevel1: TcxGridLevel
        GridView = gridPesquisaPedidos
      end
    end
  end
  object cxSplitter5: TcxSplitter
    Left = 0
    Top = 391
    Width = 1154
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 50
    AlignSplitter = salBottom
    Control = edtLogChat
    ExplicitWidth = 8
  end
  object edtLogChat: TMemo
    Left = 0
    Top = 399
    Width = 1154
    Height = 122
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Bookman Old Style'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object sqlLogChat: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM G_CHAT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterScroll = sqlLogChatAfterScroll
    OnCalcFields = sqlLogChatCalcFields
    Left = 301
    Top = 424
    object sqlLogChatCHAT_ID: TFMTBCDField
      FieldName = 'CHAT_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlLogChatUSUARIO_RECEBEU_ID: TFMTBCDField
      FieldName = 'USUARIO_RECEBEU_ID'
      Precision = 15
      Size = 2
    end
    object sqlLogChatUSUARIO_ENVIOU_ID: TFMTBCDField
      FieldName = 'USUARIO_ENVIOU_ID'
      Precision = 15
      Size = 2
    end
    object sqlLogChatMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 260
    end
    object sqlLogChatDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlLogChatRECEBEU: TStringField
      FieldName = 'RECEBEU'
      Size = 1
    end
    object sqlLogChatEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      Size = 1
    end
    object sqlLogChatGRAVAR_PARA_CONSULTA: TStringField
      FieldName = 'GRAVAR_PARA_CONSULTA'
      Size = 1
    end
    object sqlLogChatID_CONTROLE: TFMTBCDField
      FieldName = 'ID_CONTROLE'
      Precision = 15
      Size = 2
    end
    object sqlLogChatMensagemCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'MensagemCalc'
      Size = 2000
      Calculated = True
    end
    object sqlLogChatUsuarioEnviouCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioEnviouCalc'
      Size = 60
      Calculated = True
    end
    object sqlLogChatUsuarioRecebeuCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'UsuarioRecebeuCalc'
      Size = 60
      Calculated = True
    end
    object sqlLogChatMENSAGEM_BLOB: TBlobField
      FieldName = 'MENSAGEM_BLOB'
      Size = 1
    end
    object sqlLogChatMOSTRAR_NO_LOG: TStringField
      FieldName = 'MOSTRAR_NO_LOG'
      Size = 1
    end
  end
  object dtsLogChat: TDataSource
    DataSet = sqlLogChat
    Left = 373
    Top = 424
  end
  object popExcluirDoLog: TPopupMenu
    Left = 284
    Top = 222
    object ExcluirdoLogdeMensagens1: TMenuItem
      Caption = 'Excluir do Log de Mensagens'
      ShortCut = 16430
      OnClick = ExcluirdoLogdeMensagens1Click
    end
  end
end
