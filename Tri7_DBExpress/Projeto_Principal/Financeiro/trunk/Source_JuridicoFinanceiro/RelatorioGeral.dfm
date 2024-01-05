object frmRelatorioGeral: TfrmRelatorioGeral
  Left = 0
  Top = 0
  Caption = 'Relatorio'
  ClientHeight = 366
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox6: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Par'#226'metros de Pesquisa'
    ParentFont = False
    Style.BorderStyle = ebsUltraFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Coffee'
    Style.TextColor = clWindow
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Coffee'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Coffee'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Coffee'
    TabOrder = 0
    ExplicitLeft = -44
    ExplicitWidth = 1052
    Height = 105
    Width = 1008
    object cxLabel2: TcxLabel
      Left = 593
      Top = 53
      Caption = 'Respons'#225'vel Principal'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 13
      Top = 53
      Caption = 'Situa'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 164
      Top = 15
      Caption = 'Natureza da A'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 199
      Top = 53
      Caption = 'CNJ / Processo / Pessoa (Cliente, Contratante, Outra Parte...)'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 345
      Top = 15
      Caption = 'Tipo da A'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edtPesquisarResponsavel: TcxLookupComboBox
      Left = 593
      Top = 72
      RepositoryItem = dtmLookupJuridico.ListaResponsavel
      ParentFont = False
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 5
      Width = 407
    end
    object edtPesquisarSituacao: TcxImageComboBox
      Left = 13
      Top = 72
      EditValue = 'S'
      ParentFont = False
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Ativo'
          ImageIndex = 30
          Value = 'A'
        end
        item
          Description = 'Baixado'
          ImageIndex = 17
          Value = 'B'
        end
        item
          Description = #192' Contratar'
          ImageIndex = 43
          Value = 'T'
        end>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 6
      Width = 180
    end
    object edtPesquisarTipoAcao: TcxLookupComboBox
      Left = 345
      Top = 33
      RepositoryItem = dtmLookupJuridico.ListaAcaoTipo
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 7
      Width = 242
    end
    object edtPesquisarNatureza: TcxLookupComboBox
      Left = 164
      Top = 33
      RepositoryItem = dtmLookupJuridico.ListaAcaoNatureza
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 8
      Width = 175
    end
    object btnPesquisar: TcxButton
      Left = 595
      Top = 31
      Width = 95
      Height = 22
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
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
    object btnLimpar: TcxButton
      Left = 696
      Top = 31
      Width = 95
      Height = 22
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Colors.Default = clWhite
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000B00D0000B00D00000001000000000000000000000101
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
        687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
        68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
        FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
        F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
        FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
        39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
    object edtPesquisarCliente: TcxTextEdit
      Left = 199
      Top = 72
      AutoSize = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 11
      Height = 19
      Width = 388
    end
    object cxTextEdit1: TcxTextEdit
      Left = 13
      Top = 33
      AutoSize = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 12
      Height = 19
      Width = 144
    end
    object cxLabel1: TcxLabel
      Left = 13
      Top = 15
      Caption = 'Contrato'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindow
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object btnFechar: TcxButton
      Left = 797
      Top = 31
      Width = 95
      Height = 22
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = btnFecharClick
      Colors.Default = clWhite
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        080000000000900100009B0E00009B0E0000000100000000000000000000D7D7
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
        0000000000000000000000000000000000000000000000000000050505130D00
        000000000000000000002405050505050A06000000000000000000000000001C
        050505050E00212D101010101010101010100C000A0505050F000B0505050505
        05050505050505001A0505050F000B0505050505050505050505050011050505
        0F000B050505050505052D061B050515010505050F000B050505050505051F00
        271E0504230505050F000B05050505050505190000152805050505050F000B05
        052700000000000000000020180505050F000B05051200000000000000000000
        032205050F000B05051200000000000000000000032205050F000B0505270000
        0000000000000020180505050F000B05050B1616161603000000000505050505
        0F000B050505050505051F00271E0504230505050F000B050505050505052C2B
        1B050515010505050F000B05050505050505050505050500110505050F000B05
        0505050505050505050505001A0505051D000705050505050505050505050500
        1A0505050A06000000000000000000000000001C0505050505130D0000000000
        00000000000024050505}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
  end
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 105
    Width = 1008
    Height = 261
    BorderStyle = cxcbsNone
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.GlyphAlignHorz = taCenter
        Caption.GlyphAlignVert = vaCenter
        Caption.Text = 'Partes'
        Styles.Header = dtmControles.cxStyle9
        Width = 455
      end>
    BufferedPaint = False
    DataController.ParentField = 'LIGACAO_ID'
    DataController.KeyField = 'PROCESSO_TRAMITE_ID'
    DragCursor = crDrag
    Images = dtmControles.imgCadBasicos
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsSelection.MultiSelect = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.GridLines = tlglVert
    Preview.LeftIndent = 2
    Preview.MaxLineCount = 2
    Preview.Place = tlppTop
    Preview.Visible = True
    RootValue = -1
    StateImages = dtmControles.imgCadBasicos
    Styles.Inactive = dtmControles.cxStyle10
    Styles.Selection = dtmControles.cxStyle14
    Styles.ContentEven = dtmControles.cxStyle18
    Styles.ContentOdd = dtmControles.cxStyle26
    TabOrder = 1
    ExplicitTop = 63
    ExplicitWidth = 783
    ExplicitHeight = 303
    object cxDBTreeList1cxDBTreeListColumn11: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'TIPO'
      Options.Sorting = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListColumn1: TcxDBTreeListColumn
      RepositoryItem = dtmLookupJuridico.ComboGridContratoSituacao
      Caption.Text = ' '
      DataBinding.FieldName = 'calc_Situacao_Contrato'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 24
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn10: TcxDBTreeListColumn
      PropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 72
          Value = 'S'
        end>
      Caption.Text = ' '
      DataBinding.FieldName = 'FAVORITO'
      Options.Sorting = False
      Width = 34
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn
      RepositoryItem = dtmLookupJuridico.ComboGridContratoSituacao
      Caption.Text = ' '
      DataBinding.FieldName = 'calc_Situacao_Tramite'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 24
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListColumn2: TcxDBTreeListColumn
      Caption.Text = 'Descri'#231#227'o'
      DataBinding.FieldName = 'calc_Tipo'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 117
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn
      Caption.Text = 'CNJ'
      DataBinding.FieldName = 'calc_CNJ'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 61
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn7: TcxDBTreeListColumn
      RepositoryItem = dtmLookupJuridico.ListaTodasPartes
      Caption.Text = 'Polo'
      DataBinding.FieldName = 'TIPO_PARTE_ID'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 63
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListColumn3: TcxDBTreeListColumn
      Caption.Text = 'Cliente'
      DataBinding.FieldName = 'CLIENTE'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 113
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn
      Caption.Text = 'Outra Parte'
      DataBinding.FieldName = 'OUTRA_PARTE'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 98
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListColumn4: TcxDBTreeListColumn
      RepositoryItem = dtmLookupJuridico.ListaPessoasTodas
      Caption.Text = 'Responsavel'
      DataBinding.FieldName = 'RESPONSAVEL_ID'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 83
      Position.ColIndex = 10
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn9: TcxDBTreeListColumn
      Caption.Text = 'Vara'
      DataBinding.FieldName = 'PROCESSO_VARA'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 62
      Position.ColIndex = 11
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn8: TcxDBTreeListColumn
      Caption.Text = 'Comarca'
      DataBinding.FieldName = 'COMARCA'
      Options.Editing = False
      Options.Focusing = False
      Options.Sorting = False
      Width = 62
      Position.ColIndex = 12
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1cxDBTreeListColumn12: TcxDBTreeListColumn
      Caption.Text = 'Identifica'#231#227'o'
      DataBinding.FieldName = 'IDENTIFICACAO'
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
end
