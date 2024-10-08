object frmAuditoria: TfrmAuditoria
  Left = 128
  Top = 95
  Caption = 'Auditoria'
  ClientHeight = 544
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter4: TcxSplitter
    Left = 0
    Top = 351
    Width = 1008
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salTop
  end
  inline fmeEditorSimples1: TfmeEditorSimples
    Left = 0
    Top = 359
    Width = 1008
    Height = 185
    Align = alClient
    TabOrder = 1
    ExplicitTop = 359
    ExplicitWidth = 1008
    ExplicitHeight = 185
    inherited wptFerramentas: TWPToolbar
      Width = 1008
      Visible = False
      sel_ActionIcons = [SelSave, SelZoomIn, SelZoomOut]
      ExplicitWidth = 1008
    end
    inherited WPReguaHorizontal: TWPRuler
      Width = 1008
      ExplicitWidth = 1008
    end
    inherited wptTexto: TWPRichText
      Width = 1008
      Height = 129
      Readonly = True
      ExplicitTop = 62
      ExplicitWidth = 1008
      ExplicitHeight = 129
    end
  end
  object tbcSistemas: TcxTabControl
    Left = 0
    Top = 0
    Width = 1008
    Height = 114
    Align = alTop
    TabOrder = 2
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      'Sistemas')
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OnChange = tbcSistemasChange
    ClientRectBottom = 114
    ClientRectRight = 1008
    ClientRectTop = 24
    object Panel4: TPanel
      Left = 0
      Top = 24
      Width = 861
      Height = 90
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label3: TLabel
        Left = 15
        Top = 4
        Width = 489
        Height = 13
        Caption = 
          'Per'#237'odo  - In'#237'cio           Fim                               Us' +
          'u'#225'rio                                                           ' +
          '                   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 15
        Top = 46
        Width = 489
        Height = 13
        Caption = 
          'Observa'#231#227'o                                                      ' +
          '                                                              ID' +
          '                        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object lblNumero: TLabel
        Left = 527
        Top = 4
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object edtDataInicio: TcxDateEdit
        Left = 15
        Top = 20
        ParentFont = False
        Properties.DateButtons = []
        Properties.InputKind = ikMask
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 103
      end
      object edtDataFim: TcxDateEdit
        Left = 124
        Top = 20
        ParentFont = False
        Properties.DateButtons = []
        Properties.InputKind = ikMask
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 103
      end
      object lcxUsuario: TcxLookupComboBox
        Left = 233
        Top = 20
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.GridMode = True
        Properties.KeyFieldNames = 'USUARIO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'LOGIN'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsFuncionario
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 288
      end
      object edtNumero: TcxTextEdit
        Left = 527
        Top = 20
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        OnKeyPress = edtIDKeyPress
        Width = 110
      end
      object edtObservacao: TcxTextEdit
        Left = 15
        Top = 62
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Width = 397
      end
      object edtID: TcxTextEdit
        Left = 418
        Top = 62
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        OnKeyPress = edtIDKeyPress
        Width = 103
      end
      object btnPesquisar: TcxButton
        Left = 527
        Top = 59
        Width = 106
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
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnPesquisarClick
      end
      object btnLimpar: TcxButton
        Left = 638
        Top = 59
        Width = 106
        Height = 25
        Caption = 'Limpar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
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
        TabOrder = 7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnLimparClick
      end
      object pnlTipoPesquisaNumero: TPanel
        Left = 643
        Top = 8
        Width = 185
        Height = 41
        BevelOuter = bvNone
        TabOrder = 8
        object rdbPadrao: TRadioButton
          Left = 3
          Top = 14
          Width = 55
          Height = 17
          Caption = 'Padr'#227'o'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rdbPadraoClick
        end
        object rdbTextual: TRadioButton
          Left = 64
          Top = 14
          Width = 60
          Height = 17
          Caption = 'Textual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rdbTextualClick
        end
      end
    end
    object Panel3: TPanel
      Left = 861
      Top = 24
      Width = 147
      Height = 90
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object btnFechar: TcxButton
        Left = 80
        Top = 12
        Width = 55
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
        OnClick = btnFecharClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 114
    Width = 1008
    Height = 237
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object grdAuditoria: TcxGrid
      Left = 0
      Top = 25
      Width = 1008
      Height = 212
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object grdAuditoriaDBTableView1: TcxGridDBTableView
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
        DataController.DataSource = dsAuditoria
        DataController.DetailKeyFieldNames = 'HISTORICO_ID'
        DataController.KeyFieldNames = 'HISTORICO_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'DATA'
            Column = grdAuditoriaDBTableView1DATA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdAuditoriaDBTableView1DATA: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DATA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Width = 132
        end
        object grdAuditoriaDBTableView1USUARIO_ID: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'USUARIO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'LOGIN'
            end>
          Properties.ListSource = dtsFuncionario
          Width = 119
        end
        object grdAuditoriaDBTableView1TABELA: TcxGridDBColumn
          Caption = 'Tabela'
          DataBinding.FieldName = 'TABELA'
          Width = 148
        end
        object grdAuditoriaDBTableView1CAMPO: TcxGridDBColumn
          Caption = 'Campo'
          DataBinding.FieldName = 'CAMPO'
          Width = 166
        end
        object grdAuditoriaDBTableView1OPERACAO: TcxGridDBColumn
          Caption = 'Oper.'
          DataBinding.FieldName = 'OPERACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Alterar'
              ImageIndex = 0
              Value = 'A'
            end
            item
              Description = 'Incluir'
              Value = 'I'
            end
            item
              Description = 'Excluir'
              Value = 'E'
            end>
          Width = 69
        end
        object grdAuditoriaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Width = 70
        end
        object grdAuditoriaDBTableView1OBSERVACAO: TcxGridDBColumn
          Caption = 'Observa'#231#227'o'
          DataBinding.FieldName = 'OBSERVACAO'
          Width = 250
        end
      end
      object grdAuditoriaLevel1: TcxGridLevel
        GridView = grdAuditoriaDBTableView1
      end
    end
    object pnlDadosRegistro: TPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object rdbProtocolo: TRadioButton
        Left = 350
        Top = 0
        Width = 73
        Height = 17
        Caption = 'Protocolo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rdbRegAuxiliar: TRadioButton
        Left = 185
        Top = 0
        Width = 81
        Height = 17
        Caption = 'Reg. Auxiliar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object rdbMinutas: TRadioButton
        Left = 279
        Top = 0
        Width = 65
        Height = 17
        Caption = 'Minutas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object rdbTranscricao: TRadioButton
        Left = 95
        Top = 0
        Width = 81
        Height = 17
        Caption = 'Transcri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object rdbMatricula: TRadioButton
        Left = 15
        Top = 0
        Width = 74
        Height = 17
        Caption = 'Matr'#237'cula'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4210688
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = True
      end
    end
  end
  object sqlFuncionario: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
        'SELECT DISTINCT U.USUARIO_ID, U.LOGIN '#13#10'FROM G_USUARIO U'#13#10'RIGHT ' +
        'JOIN G_USUARIO_SISTEMA US ON'#13#10'      U.USUARIO_ID = US.USUARIO_ID')
    Left = 518
    Top = 457
    object sqlFuncionarioUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlFuncionarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
  end
  object dtsFuncionario: TDataSource
    DataSet = sqlFuncionario
    Left = 594
    Top = 456
  end
  object sqlAuditoria: TI9Query
    BeforeOpen = sqlAuditoriaBeforeOpen
    AfterOpen = sqlAuditoriaAfterOpen
    AfterScroll = sqlAuditoriaAfterScroll
    Connection = dtmControles.DBH
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM R_HISTORICO')
    Left = 519
    Top = 405
    object sqlAuditoriaHISTORICO_ID: TBCDField
      FieldName = 'HISTORICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlAuditoriaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 30
    end
    object sqlAuditoriaCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object sqlAuditoriaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object sqlAuditoriaNEW_VALUE: TBlobField
      FieldName = 'NEW_VALUE'
    end
    object sqlAuditoriaDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAuditoriaUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlAuditoriaID: TBCDField
      FieldName = 'ID'
      Precision = 15
      Size = 2
    end
    object sqlAuditoriaOBSERVACAO: TStringField
      DisplayWidth = 260
      FieldName = 'OBSERVACAO'
      Size = 260
    end
  end
  object dsAuditoria: TDataSource
    DataSet = sqlAuditoria
    Left = 591
    Top = 407
  end
end
