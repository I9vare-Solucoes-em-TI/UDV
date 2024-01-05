inherited frmAnotacao: TfrmAnotacao
  Left = 86
  Top = 199
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Anota'#231#227'o'
  ClientHeight = 502
  ClientWidth = 651
  Color = clWhite
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 667
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  object lblInformacao: TLabel [0]
    Left = 0
    Top = 0
    Width = 651
    Height = 13
    Align = alTop
    Caption = ' Nova anota'#231#227'o'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 4210688
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 92
  end
  inherited Panel1: TPanel
    Top = 13
    Width = 651
    Height = 451
    Color = clWhite
    ExplicitTop = 13
    ExplicitWidth = 651
    ExplicitHeight = 451
    inherited Shape1: TShape
      Top = 94
      Width = 639
      Height = 349
      ExplicitTop = 61
      ExplicitWidth = 664
      ExplicitHeight = 306
    end
    inherited btnCancelar: TcxButton
      Left = 100
      Top = 100
      LookAndFeel.SkinName = ''
      TabOrder = 2
      ExplicitLeft = 100
      ExplicitTop = 100
    end
    object PnlTexto: TPanel
      Left = 4
      Top = 94
      Width = 639
      Height = 349
      Align = alClient
      BevelInner = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      inline fmeEditorSimples: TfmeEditorSimples
        Left = 2
        Top = 2
        Width = 635
        Height = 345
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 635
        ExplicitHeight = 345
        inherited wptFerramentas: TWPToolbar
          Width = 635
          Color = clWhite
          ColorTo = clWhite
          ExplicitWidth = 635
        end
        inherited WPReguaHorizontal: TWPRuler
          Width = 635
          ColorBack = 14807280
          ExplicitWidth = 635
        end
        inherited wptTexto: TWPRichText
          Width = 635
          Height = 289
          Header.DefaultPageWidth = 9000
          Header.DefaultLeftMargin = 600
          Header.DefaultRightMargin = 600
          Header.PageWidth = 9000
          Header.LeftMargin = 600
          Header.RightMargin = 600
          TabStop = True
          ExplicitWidth = 635
          ExplicitHeight = 289
        end
      end
    end
    object PnlCampos: TPanel
      Left = 4
      Top = 4
      Width = 639
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object LblTitulo: TcxLabel
        Left = 4
        Top = 43
        Caption = 'Descri'#231#227'o'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 14807280
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
      object edtDescricao: TcxDBTextEdit
        Left = 7
        Top = 63
        DataBinding.DataField = 'TITULO'
        DataBinding.DataSource = dtsAnotacao
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 626
      end
      object LblGrupo: TcxLabel
        Left = 4
        Top = 4
        Caption = 'Grupo'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 14807280
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
      object CbxGrupo: TcxDBLookupComboBox
        Left = 7
        Top = 22
        DataBinding.DataField = 'GRUPO'
        DataBinding.DataSource = dtsAnotacao
        ParentFont = False
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownRows = 10
        Properties.KeyFieldNames = 'GRUPO'
        Properties.ListColumns = <
          item
            FieldName = 'GRUPO'
          end>
        Properties.ListSource = DtsLookupAnotacaoGrupo
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 495
      end
      object chbSituacao: TcxDBCheckBox
        Left = 504
        Top = 22
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = dtsAnotacao
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayUnchecked = 'I'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueGrayed = 'I'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 49
      end
      object chbExclusivoSistemaOrigem: TcxDBCheckBox
        Left = 559
        Top = 22
        Hint = 'Exclusivo no sistema de origem'
        Caption = 'Exclusivo'
        DataBinding.DataField = 'EXCLUSIVO_SISTEMA_ORIGEM'
        DataBinding.DataSource = dtsAnotacao
        ParentFont = False
        ParentShowHint = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'I'
        Properties.ValueUnchecked = 'N'
        ShowHint = True
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 73
      end
    end
  end
  object PnlAcao: TPanel [2]
    Left = 0
    Top = 464
    Width = 651
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnConfirmar: TcxButton
      Left = 422
      Top = 6
      Width = 106
      Height = 25
      Caption = 'Confirmar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
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
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object btnCancelarItem: TcxButton
      Left = 533
      Top = 6
      Width = 106
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
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarItemClick
    end
  end
  inherited DataSetAncestral: TI9Query
    MasterFields = 'ANOTACAO_ID'
    SQL.Strings = (
      'SELECT * FROM G_ANOTACAO'#13#10'WHERE ANOTACAO_ID = :ANOTACAO_ID')
    Left = 223
    Top = 160
    ParamData = <
      item
        Name = 'ANOTACAO_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 223
    Top = 195
  end
  inherited ClientAncestral: TClientDataSet
    Left = 223
    Top = 231
  end
  inherited SourceAncestral: TDataSource
    Left = 223
    Top = 267
  end
  object sqlAnotacao: TI9Query
    AfterScroll = sqlAnotacaoAfterScroll
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      ' SELECT * '
      '   FROM G_ANOTACAO'
      '  WHERE ANOTACAO_ID = :ANOTACAO_ID')
    Left = 133
    Top = 185
    ParamData = <
      item
        Name = 'ANOTACAO_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
    object sqlAnotacaoANOTACAO_ID: TBCDField
      FieldName = 'ANOTACAO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlAnotacaoUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlAnotacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlAnotacaoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 120
    end
    object sqlAnotacaoMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
    end
    object sqlAnotacaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object sqlAnotacaoGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 60
    end
    object sqlAnotacaoSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 18
      Size = 2
    end
    object sqlAnotacaoGERAL: TStringField
      FieldName = 'GERAL'
      Origin = 'GERAL'
      Size = 1
    end
    object sqlAnotacaoEXCLUSIVO_SISTEMA_ORIGEM: TStringField
      FieldName = 'EXCLUSIVO_SISTEMA_ORIGEM'
      Origin = 'EXCLUSIVO_SISTEMA_ORIGEM'
      Size = 1
    end
  end
  object dtsAnotacao: TDataSource
    DataSet = sqlAnotacao
    Left = 132
    Top = 237
  end
  object SqlLookupAnotacaoGrupo: TI9Query
    AfterScroll = sqlAnotacaoAfterScroll
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      ' SELECT DISTINCT G_AN.GRUPO '
      '   FROM G_ANOTACAO G_AN'
      '  ORDER BY G_AN.GRUPO')
    Left = 349
    Top = 185
    object StringField3: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 60
    end
  end
  object DtsLookupAnotacaoGrupo: TDataSource
    DataSet = SqlLookupAnotacaoGrupo
    Left = 348
    Top = 237
  end
end
