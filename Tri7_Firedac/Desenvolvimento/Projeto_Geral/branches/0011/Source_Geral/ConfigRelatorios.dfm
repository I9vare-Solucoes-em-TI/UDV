inherited frmConfigRelatorios: TfrmConfigRelatorios
  Tag = 2
  Left = 173
  Caption = 'Configura'#231#227'o de Relat'#243'rios'
  ClientHeight = 373
  ClientWidth = 841
  OldCreateOrder = True
  ExplicitWidth = 857
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 841
    ExplicitWidth = 744
    inherited PanelBotoesBasicos: TPanel
      Width = 631
      ExplicitWidth = 534
    end
    inherited PanelBotaoFechar: TPanel
      Left = 633
      Width = 206
      ExplicitLeft = 536
      ExplicitWidth = 206
      inherited cxBtnFechar: TcxButton
        Left = 140
        ExplicitLeft = 140
      end
      object btnExportar: TcxButton
        Left = 12
        Top = 4
        Width = 60
        Height = 45
        Caption = 'Exportar'
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
        OptionsImage.Layout = blGlyphTop
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnExportarClick
      end
      object btnImportar: TcxButton
        Left = 76
        Top = 4
        Width = 60
        Height = 45
        Caption = 'Atualizar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D8D8D8FBFBFBFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE7E7E79797974242422525254040406D6D6DC5C5C5FAFAFAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B33E
          3E3E2222222828289D9D9DCECECEC9C9C9DADADAFAFAFAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B91E1E1E4040403E3E
          3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE212121474747252525C9C9C9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8686862D2D2D3E3E3E333333F8F8F8FCFCFCFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFD3737373E3E3E454545525252FFFFFF989898BCBCBCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2
          E2E21B1B1B464646454545515151FFFFFF4545455E5E5EFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E31818
          184141414B4B4B404040DDDDDD272727202020E2E2E2FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD313131373737
          4747473838384444443A3A3A3B3B3B696969FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92929226262639393942
          42424747474848483A3A3A191919C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B2828283333334040
          40363636343434494949484848FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F12323232E2E2E373737333333
          5454546A6A6A2A2A2A989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC5C5C55656561616162929292C2C2C3535353F3F3F45
          45453F3F3F222222E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFCFCB3B3B34E4E4E3030303E3E3E3636362929292929291D1D1D1616161B1B
          1B171717414141E4E4E4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6D5
          D5D5F1F1F1FFFFFFFFFFFFFFFFFFFCFCFCF7F7F7EFEFEFE2E2E2DEDEDED1D1D1
          8C8C8CC8C8C8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
          F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFF}
        OptionsImage.Layout = blGlyphTop
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnImportarClick
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 353
    Width = 841
    ExplicitTop = 353
    ExplicitWidth = 744
  end
  inherited PanelGeral: TPanel
    Width = 841
    Height = 297
    ExplicitWidth = 744
    ExplicitHeight = 297
    inherited PanelData: TPanel
      Width = 839
      Height = 82
      ExplicitWidth = 742
      ExplicitHeight = 82
      object cxLabel1: TcxLabel
        Left = 10
        Top = 31
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
      end
      object cxLabel2: TcxLabel
        Left = 10
        Top = 8
        Caption = 'C'#243'digo:'
        ParentFont = False
      end
      object cxLabel5: TcxLabel
        Left = 10
        Top = 56
        Caption = 'Grupo Relat'#243'rio:'
        ParentFont = False
      end
      object edtCodigo: TcxDBTextEdit
        Left = 92
        Top = 7
        DataBinding.DataField = 'CONFIG_RELATORIO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 3
        Width = 72
      end
      object chbSituacao: TcxDBCheckBox
        Left = 177
        Top = 7
        AutoSize = False
        Caption = 'Menu'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Transparent = True
        Height = 21
        Width = 68
      end
      object chbUsointerno: TcxDBCheckBox
        Left = 233
        Top = 7
        AutoSize = False
        Caption = 'Apenas Visualizar'
        DataBinding.DataField = 'INTERNO'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Transparent = True
        Height = 21
        Width = 112
      end
      object edtDescricao: TcxDBTextEdit
        Left = 92
        Top = 31
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        Width = 508
      end
      object lcbGrupoRelatorio: TcxDBLookupComboBox
        Left = 92
        Top = 55
        DataBinding.DataField = 'GRUPO_RELATORIO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.KeyFieldNames = 'GRUPO_RELATORIO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsGrupoRelatorio
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 508
      end
      object btnGrupoRelatorio: TcxButton
        Left = 602
        Top = 55
        Width = 21
        Height = 19
        Cursor = crHandPoint
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
          FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
          FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
          000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
          FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
          D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
          00000000000000000000000000D5FFAA00000000000000000000000000000000
          00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
          00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
          FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
          FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
          FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
          FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
        TabOrder = 9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnGrupoRelatorioClick
      end
      object chbEditar: TcxDBCheckBox
        Left = 350
        Top = 7
        AutoSize = False
        Caption = 'Editar'
        DataBinding.DataField = 'EDITAR'
        DataBinding.DataSource = SourceAncestral
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
        Transparent = True
        Height = 21
        Width = 59
      end
    end
    object grdConfRel: TcxGrid
      Left = 1
      Top = 125
      Width = 839
      Height = 171
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitWidth = 742
      object grdConfRelDBTableView1: TcxGridDBTableView
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
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'CONFIG_RELATORIO_ID'
            Column = grdConfRelDBTableView1CONFIG_RELATORIO_ID
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdConfRelDBTableView1CONFIG_RELATORIO_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'CONFIG_RELATORIO_ID'
          Width = 80
        end
        object grdConfRelDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 500
        end
        object grdConfRelDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn
          Caption = 'Grupo Relat'#243'rio'
          DataBinding.FieldName = 'GRUPO_RELATORIO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'GRUPO_RELATORIO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListSource = dsGrupoRelatorio
          Visible = False
          GroupIndex = 0
          Width = 300
        end
      end
      object grdConfRelLevel1: TcxGridLevel
        GridView = grdConfRelDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 83
      Width = 839
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 82
      Control = PanelData
      Color = 14807280
      ParentColor = False
      ExplicitWidth = 742
    end
    object pnlRelatorio: TPanel
      Left = 1
      Top = 91
      Width = 839
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      Color = 13034466
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 742
      object btnHistorico: TcxButton
        Left = 120
        Top = 6
        Width = 106
        Height = 25
        Caption = 'Hist'#243'rico'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B00000001000000000000181818006E6E
          6E002727270042424200FFFFFF00BEBEBE00565656001A1A1A00383838008282
          820053535300353535005A5A5A00212121003A3A3A006A6A6A0045454500A3A3
          A3007A7A7A002F2F2F001E1E1E00676767004F4F4F008D8D8D003C3C3C007676
          7600DFDFDF00232323001B1B1B003F3F3F008A8A8A00D4D4D40080808000C8C8
          C80058585800363636005C5C5C00313131002020200093939300242424002222
          2200545454004343430057575700353535001F1F1F001D1D1D001B1B1B002828
          28006C6C6C0090909000FFFFFF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000040404040404
          0404040404040404040404040404121808080808080808080808080808080823
          18121B0000000000000000000000000000000000001B00000000000000000000
          141928000000000000000000000000000000002612041C000000000000000000
          000000000000261904120D0D0000000000000000000000000000150404210404
          1E0E000000000000000000000000160404171912041A23000000321003032B25
          000000002C04140000091F0000000404040404040E00000000220D0007120400
          00000404040404040C0000000000000007010500000004040404040406000000
          000000000002130000000404040404042A000000000000000000000000000404
          040404042A000000000000000000000000000404040404042A00000000000000
          0000000000000404040404042A00000000000000000000000000040404040404
          0A00000000000000000000000000040404040404240000000000000000000000
          001B040404040404040404040404040404040404040404040404040404040404
          04040404040404040404}
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnHistoricoClick
      end
      object btnRelatorio: TcxButton
        Left = 10
        Top = 6
        Width = 106
        Height = 25
        Caption = 'Configurar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B00000001000000000000000000000101
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
          F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFF1C3B5BB
          BBBBBBBBB0DBF8FF8585FFEEFFFFFFFF82010401000000000076919B2C2C9A68
          FCFFFFFF44000000000000001FB3530000000034FFFFFFFF44000CE6FFF2F1FF
          B52E0C006868000F1F7CFFFF44000DF2FFFFFFFFFF470069FFFF690042D5FFFF
          44000DF2FFFFFFFFFB420069FFFF690042D5FFFF44000DF2FFFFFFFFA8201000
          65650010207CFFFF44000DF2FFFFFFFFFFFF350000000035FFFFFFFF44000DF2
          FFFFFFFFFFFC65A22E30AC73F9FFFFFF44000DF2FFFFFFFFFFFFFFFFB5955CA9
          FFFFFFFF44000DF2FFFFFFFFFFFFFFFFFD2C007EFFFFFFFF44000DF2FFFFFFFF
          FFFFFFFFF20D007FFFFFFFFF44000DF2FFFFFFFFFFFFFFFFF20D007FFFFFFFFF
          44000DF2FFFFFFFFFFFFFFFFF20D007FFFFFFFFF430047FFFAF2F2F2F2F2F2FA
          FF47007FFFFFFFFF42007C4B00010C0E0E0C01004B7C007FFFFFFFFF4A001949
          324E0F00000F4E3249190086FFFFFFFFD4886598C4CF03434303CFC4986588EE
          FFFFFFFFFFFFFFFFFFFD1032320FFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD00
          00BCFFFFFFFFFFFFFFFF}
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnRelatorioClick
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 325
    Top = 22
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
        'select CONFIG_RELATORIO_ID, DESCRICAO, GRUPO_RELATORIO_ID, INTER' +
        'NO, SISTEMA_ID, SITUACAO, EDITAR'
      'from G_CONFIG_RELATORIO'
      'where (SISTEMA_ID = :SISTEMA_ID1 OR SISTEMA_ID = :SISTEMA_ID2)'
      'ORDER BY CONFIG_RELATORIO_ID')
    Left = 355
    Top = 18
    ParamData = <
      item
        Name = 'SISTEMA_ID1'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SISTEMA_ID2'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 387
    Top = 18
  end
  inherited ClientAncestral: TClientDataSet
    Left = 419
    Top = 18
    object ClientAncestralCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Origin = 'CONFIG_RELATORIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralGRUPO_RELATORIO_ID: TBCDField
      FieldName = 'GRUPO_RELATORIO_ID'
      Origin = 'GRUPO_RELATORIO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralINTERNO: TStringField
      FieldName = 'INTERNO'
      Origin = 'INTERNO'
      Size = 1
    end
    object ClientAncestralEDITAR: TStringField
      FieldName = 'EDITAR'
      Origin = 'EDITAR'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 451
    Top = 18
  end
  object frxRelatorio: TfrxReport
    Version = '6.0.7'
    DotMatrixReport = False
    EngineOptions.UseFileCache = True
    IniFile = '\Software\Fast Reports'
    Preview = frmVisualizaRelatorios.frxPreview
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.Compressed = True
    ReportOptions.CreateDate = 39020.802502349500000000
    ReportOptions.LastChange = 39020.802528391200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnUserFunction = frxRelatorioUserFunction
    Left = 678
    Top = 60
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      OnBeforePrint = 'Page1OnBeforePrint'
    end
  end
  object sqlGrupoRelatorio: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from G_GRUPO_RELATORIO'
      'where (SISTEMA_ID = :SISTEMA_ID1 OR SISTEMA_ID = :SISTEMA_ID2)'
      'order by DESCRICAO')
    Left = 617
    Top = 60
    ParamData = <
      item
        Name = 'SISTEMA_ID1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SISTEMA_ID2'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object sqlGrupoRelatorioGRUPO_RELATORIO_ID: TBCDField
      FieldName = 'GRUPO_RELATORIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlGrupoRelatorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsGrupoRelatorio: TDataSource
    DataSet = sqlGrupoRelatorio
    Left = 649
    Top = 60
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 360
    Top = 243
    object ExportarRelatrios1: TMenuItem
      Caption = 'Exportar Relat'#243'rios'
      OnClick = ExportarRelatrios1Click
    end
    object ImportarRelatrio1: TMenuItem
      Caption = 'Importar Relat'#243'rio'
      OnClick = ImportarRelatrio1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object GerarRotina1: TMenuItem
      Caption = 'Gerar Rotina'
      OnClick = GerarRotina1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ConverterFireDac1: TMenuItem
      Caption = 'Converter FireDac'
      OnClick = ConverterFireDac1Click
    end
    object mniConverterProtestoNovo: TMenuItem
      Caption = 'Converter Protesto Novo'
      Visible = False
      OnClick = mniConverterProtestoNovoClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ImagesHightQuality1: TMenuItem
      Caption = 'Converter Images HightQuality'
      OnClick = ImagesHightQuality1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.rtl'
    Filter = 'Relat'#243'rio|*.rtl;*.fr3'
    Left = 424
    Top = 243
  end
  object sqlConvertRel: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT CONFIG_RELATORIO_ID, RELATORIO'
      'FROM G_CONFIG_RELATORIO'
      'WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID')
    Left = 617
    Top = 211
    ParamData = <
      item
        Name = 'CONFIG_RELATORIO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '0'
      end>
    object sqlConvertRelCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Origin = 'CONFIG_RELATORIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlConvertRelRELATORIO: TBlobField
      FieldName = 'RELATORIO'
      Origin = 'RELATORIO'
    end
  end
  object sqlXmlAtualizador: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONFIG_RELATORIO_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'GRUPO_RELATORIO_ID'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'INTERNO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SISTEMA_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EDITAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RELATORIO'
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'ProviderAncestral'
    StoreDefs = True
    Left = 587
    Top = 305
    object sqlXmlAtualizadorCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlXmlAtualizadorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlXmlAtualizadorGRUPO_RELATORIO_ID: TBCDField
      FieldName = 'GRUPO_RELATORIO_ID'
      Precision = 18
      Size = 2
    end
    object sqlXmlAtualizadorINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 1
    end
    object sqlXmlAtualizadorSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlXmlAtualizadorSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlXmlAtualizadorEDITAR: TStringField
      FieldName = 'EDITAR'
      Size = 1
    end
    object sqlXmlAtualizadorRELATORIO: TBlobField
      FieldName = 'RELATORIO'
    end
  end
  object dtsXmlAtualizador: TDataSource
    DataSet = sqlXmlAtualizador
    Left = 499
    Top = 305
  end
end
