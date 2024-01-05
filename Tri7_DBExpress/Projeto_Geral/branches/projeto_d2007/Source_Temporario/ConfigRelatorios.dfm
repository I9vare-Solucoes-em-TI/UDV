inherited frmConfigRelatorios: TfrmConfigRelatorios
  Tag = 2
  Left = 173
  Caption = 'Configura'#231#227'o de Relat'#243'rios'
  ClientHeight = 373
  ClientWidth = 744
  OldCreateOrder = True
  ExplicitWidth = 760
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 744
    ExplicitWidth = 744
    inherited PanelBotoesBasicos: TPanel
      Width = 662
      ExplicitWidth = 662
    end
    inherited PanelBotaoFechar: TPanel
      Left = 664
      ExplicitLeft = 664
    end
  end
  inherited StatusBar: TStatusBar
    Top = 353
    Width = 744
    ExplicitTop = 353
    ExplicitWidth = 744
  end
  inherited PanelGeral: TPanel
    Width = 744
    Height = 297
    ExplicitWidth = 744
    ExplicitHeight = 297
    inherited PanelData: TPanel
      Width = 742
      Height = 82
      ExplicitWidth = 742
      ExplicitHeight = 82
      object cxLabel1: TcxLabel
        Left = 10
        Top = 31
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel2: TcxLabel
        Left = 10
        Top = 8
        Caption = 'C'#243'digo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 10
        Top = 56
        Caption = 'Grupo Relat'#243'rio:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
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
        Width = 176
      end
      object edtDescricao: TcxDBTextEdit
        Left = 92
        Top = 31
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 6
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
        TabOrder = 7
        Width = 508
      end
      object btnGrupoRelatorio: TcxButton
        Left = 602
        Top = 55
        Width = 25
        Height = 22
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btnGrupoRelatorioClick
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
      end
    end
    object grdConfRel: TcxGrid
      Left = 1
      Top = 125
      Width = 742
      Height = 171
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
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
      Width = 742
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 82
      Control = PanelData
      Color = 14807280
      ParentColor = False
    end
    object pnlRelatorio: TPanel
      Left = 1
      Top = 91
      Width = 742
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      Color = 13034466
      ParentBackground = False
      TabOrder = 3
      object btnHistorico: TcxButton
        Left = 123
        Top = 6
        Width = 110
        Height = 22
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnHistoricoClick
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
      end
      object btnRelatorio: TcxButton
        Left = 9
        Top = 6
        Width = 110
        Height = 22
        Caption = 'Configurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnRelatorioClick
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
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 325
    Top = 22
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'select * from G_CONFIG_RELATORIO'#13#10'where SISTEMA_ID = :SISTEMA_ID' +
      #13#10'ORDER BY CONFIG_RELATORIO_ID'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Left = 355
    Top = 18
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 387
    Top = 18
  end
  inherited ClientAncestral: TClientDataSet
    Left = 419
    Top = 18
    object ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralRELATORIO: TBlobField
      FieldName = 'RELATORIO'
      Size = 1
    end
    object ClientAncestralGRUPO_RELATORIO_ID: TFMTBCDField
      FieldName = 'GRUPO_RELATORIO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralHISTORICO: TBlobField
      FieldName = 'HISTORICO'
      Size = 1
    end
    object ClientAncestralINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 451
    Top = 18
  end
  object frxRelatorio: TfrxReport
    Version = '4.15.6'
    DotMatrixReport = False
    EngineOptions.UseFileCache = True
    IniFile = '\Software\Fast Reports'
    Preview = frmVisualizaRelatorios.frxPreview
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39020.802502349500000000
    ReportOptions.LastChange = 39020.802528391200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnUserFunction = frxRelatorioUserFunction
    Left = 670
    Top = 84
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
      OnBeforePrint = 'Page1OnBeforePrint'
    end
  end
  object sqlGrupoRelatorio: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_GRUPO_RELATORIO'#13#10'where SISTEMA_ID = :SISTEMA_ID'#13 +
      #10'order by DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Params = <>
    Left = 609
    Top = 84
    object sqlGrupoRelatorioGRUPO_RELATORIO_ID: TFMTBCDField
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
    Left = 641
    Top = 84
  end
  object PopupMenu1: TPopupMenu
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
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.rtl'
    Filter = 'Relat'#243'rio|*.rtl'
    Left = 424
    Top = 243
  end
end
