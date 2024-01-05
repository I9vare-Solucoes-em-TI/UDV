object frmMarcacaoAutomatica: TfrmMarcacaoAutomatica
  Left = 240
  Top = 309
  BorderStyle = bsDialog
  Caption = 'Marca'#231#227'o Autom'#225'tica'
  ClientHeight = 121
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 121
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object Shape2: TShape
      Left = 4
      Top = 4
      Width = 633
      Height = 109
      Align = alClient
      Brush.Color = clWindow
      Pen.Color = 10775558
      Pen.Width = 2
      ExplicitWidth = 621
    end
    object Bevel1: TBevel
      Left = 12
      Top = 13
      Width = 617
      Height = 59
      Shape = bsFrame
    end
    object cxLabel1: TcxLabel
      Left = 240
      Top = 24
      Caption = 'Marca'#231#227'o:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 24
      Caption = 'Grupo:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cbxGrupoMarcacao: TcxComboBox
      Left = 58
      Top = 23
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsFixedList
      Properties.Sorted = True
      Properties.OnChange = cbxGrupoMarcacaoPropertiesChange
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 2
      Width = 179
    end
    object dblMarcacao: TcxLookupComboBox
      Left = 296
      Top = 23
      Enabled = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'NOME'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsMarcacao
      Properties.OnEditValueChanged = dblMarcacaoPropertiesEditValueChanged
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      Width = 325
    end
    object rdbManter: TRadioButton
      Left = 20
      Top = 49
      Width = 137
      Height = 17
      Caption = 'Manter Formato Original'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      TabOrder = 4
      TabStop = True
    end
    object rdbMaiusculo: TRadioButton
      Left = 160
      Top = 49
      Width = 157
      Height = 17
      Caption = 'For'#231'ar Caixa Alta (Mai'#250'sculo)'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 5
    end
    object rdbMinusculo: TRadioButton
      Left = 324
      Top = 49
      Width = 169
      Height = 17
      Caption = 'For'#231'ar Caixa Baixa (Min'#250'sculo)'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 6
    end
    object rdbMaiusculoMinusculo: TRadioButton
      Left = 496
      Top = 49
      Width = 129
      Height = 17
      Caption = 'Mai'#250'sculo/Min'#250'sculo'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 7
    end
    object chkConferencia: TCheckBox
      Left = 21
      Top = 79
      Width = 130
      Height = 17
      Caption = 'Adicionar Confer'#234'ncia'
      Checked = True
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    object btnSelecionar: TcxButton
      Left = 425
      Top = 78
      Width = 95
      Height = 22
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 9
      OnClick = btnSelecionarClick
      Colors.Default = clWhite
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000120B0000120B0000000100000000000000000000D5D5
        D5007C7C7C0033333300ABABAB001717170052525200FFFFFF0011111100C6C6
        C60020202000999999006B6B6B000C0C0C0043434300909090002A2A2A00E8E8
        E8001616160008080800A5A5A5001C1C1C003E3E3E00B6B6B6005A5A5A008686
        8600D1D1D10014141400060606004A4A4A003C3C3C00B3B3B3003A3A3A002525
        2500303030000E0E0E006E6E6E00616161001E1E1E0004040400D9D9D9004646
        460080808000959595002E2E2E00BBBBBB008A8A8A0000000000222222004040
        40009999990027272700C9C9C9006C6C6C00939393002C2C2C004C4C4C007171
        7100000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        070711351300002706340707070707070707070707092C272727272727051407
        07070707070707071A0D1C1C1C1C1C1C1C1C131F07070707070707071E131313
        1313131313131321070707070707071A0D0D0D0D0D0D0D0D0D0D0D0D07070707
        07070717232323232323232323232323070707070707072D0808080808080808
        0808080807070707070707041B1B1B1B1B1B1B1B1B1B1B1B0707070707070719
        0505050505050505050505050707070707070716050505050505050505050505
        0707070707071F15150322151515151515200E0C070707070728200A0A141D0A
        0A0A0A390601070707070707072530302407160A022E0B070707070707070707
        071A182A070716210B0707070707070707070707070707070707313336070707
        07070707070707070707070707070E102B070707070707070707070707070707
        0707292C2B070707070707070707070707070707070738220B07070707070707
        070707070707070707070F310107070707070707070707070707070707070707
        07070707070707070707}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
    object btnCancelar: TcxButton
      Left = 526
      Top = 78
      Width = 95
      Height = 22
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = btnCancelarClick
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
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
  end
  object sqlMarcacao: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT NOME, DESCRICAO'#13#10'FROM G_MARCACAO_TIPO'#13#10'WHERE GRUPO = :GRU' +
      'PO'#13#10'     AND SISTEMA_ID = :SISTEMA'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA'
        ParamType = ptInput
      end>
    Params = <>
    Left = 200
    Top = 72
    object sqlMarcacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sqlMarcacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object dtsMarcacao: TDataSource
    DataSet = sqlMarcacao
    Left = 240
    Top = 72
  end
end
