object frmSeloRegistroAutomatico: TfrmSeloRegistroAutomatico
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSizeToolWin
  Caption = 'Registro de Numera'#231#227'o Autom'#225'tica de Selos'
  ClientHeight = 252
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 211
    Width = 720
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnConfirmar: TcxButton
      Left = 604
      Top = 8
      Width = 106
      Height = 25
      Caption = 'Confirmar'
      Colors.Default = clWhite
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TcxButton
      Left = 495
      Top = 8
      Width = 106
      Height = 25
      Caption = 'Cancelar'
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object grdPesquisa: TcxGrid
    Left = 0
    Top = 0
    Width = 720
    Height = 211
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    RootLevelStyles.TabsBackground = dtmControles.cxStyle1
    object cxGridPesquisa: TcxGridDBTableView
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
      DataController.DataSource = dtsRegistro
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = 'Qtde = 0'
          Kind = skCount
          FieldName = 'PESSOA_NOME'
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Preview.Column = cxGridPesquisaColumn7
      Preview.Visible = True
      Styles.Background = dtmControles.cxStyle1
      Styles.Header = dtmControles.cxStyle6
      Styles.Preview = dtmControles.cxStyle5
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object cxGridPesquisaColumn1: TcxGridDBColumn
        Caption = 'Tabela de Servi'#231'o'
        DataBinding.FieldName = 'SERVICO'
        Options.Editing = False
        Width = 188
      end
      object cxGridPesquisaColumn6: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
        Options.Editing = False
        Width = 57
      end
      object cxGridPesquisaColumn2: TcxGridDBColumn
        Caption = 'Qtd'
        DataBinding.FieldName = 'QTD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Options.Editing = False
        Styles.Content = dtmControles.cxStyle34
        Width = 32
      end
      object cxGridPesquisaColumn9: TcxGridDBColumn
        Caption = 'Qtd Total'
        DataBinding.FieldName = 'QTD_TOTAL'
        Options.Editing = False
        Width = 64
      end
      object cxGridPesquisaColumn8: TcxGridDBColumn
        Caption = 'Qtd Corre'#231#227'o'
        DataBinding.FieldName = 'QTD_CORRECAO'
        Width = 87
      end
      object cxGridPesquisaColumn3: TcxGridDBColumn
        Caption = 'Tipo de Selo'
        DataBinding.FieldName = 'SELO_GRUPO_ID'
        RepositoryItem = dtmLookup.Lista_SeloGrupo
        Options.Editing = False
        Width = 131
      end
      object cxGridPesquisaColumn4: TcxGridDBColumn
        Caption = 'Selo Inicial'
        DataBinding.FieldName = 'SELO_INICIAL'
        Options.Editing = False
        Width = 79
      end
      object cxGridPesquisaColumn5: TcxGridDBColumn
        Caption = 'Selo Final'
        DataBinding.FieldName = 'SELO_FINAL'
        Options.Editing = False
        Width = 80
      end
      object cxGridPesquisaColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'OBSERVACAO'
        Options.Editing = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridPesquisa
    end
  end
  object ClientRegistro: TClientDataSet
    PersistDataPacket.Data = {
      C80100009619E0BD010000001800000010000000000003000000C80103515444
      040001000000000006434F4449474F04000100000000000C53454C4F5F494E49
      4349414C0100490000000100055749445448020002000F000A53454C4F5F4649
      4E414C0100490000000100055749445448020002000F000D53454C4F5F475255
      504F5F49440400010000000000075345525649434F0100490000000100055749
      445448020002003C000A4F42534552564143414F010049000000010005574944
      5448020002005A000A454D4F4C554D454E544F08000400000001000753554254
      5950450200490006004D6F6E6579000F544158415F4A55444943494152494108
      0004000000010007535542545950450200490006004D6F6E6579000B4F555452
      415F5441584131080004000000010007535542545950450200490006004D6F6E
      65790012454D4F4C554D454E544F5F4954454D5F494404000100000000000C51
      54445F434F52524543414F0400010000000000095154445F544F54414C040001
      0000000000054F5244454D040001000000000003495353080004000000010007
      535542545950450200490006004D6F6E6579000E4F5244454D5F524547495354
      524F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'QTD'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'SELO_INICIAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SELO_FINAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SELO_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'SERVICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'EMOLUMENTO'
        DataType = ftCurrency
      end
      item
        Name = 'TAXA_JUDICIARIA'
        DataType = ftCurrency
      end
      item
        Name = 'OUTRA_TAXA1'
        DataType = ftCurrency
      end
      item
        Name = 'EMOLUMENTO_ITEM_ID'
        DataType = ftInteger
      end
      item
        Name = 'QTD_CORRECAO'
        DataType = ftInteger
      end
      item
        Name = 'QTD_TOTAL'
        DataType = ftInteger
      end
      item
        Name = 'ORDEM'
        DataType = ftInteger
      end
      item
        Name = 'ISS'
        DataType = ftCurrency
      end
      item
        Name = 'ORDEM_REGISTRO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 116
    Top = 56
    object ClientRegistroQTD: TIntegerField
      FieldName = 'QTD'
    end
    object ClientRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ClientRegistroSELO_INICIAL: TStringField
      FieldName = 'SELO_INICIAL'
      Size = 15
    end
    object ClientRegistroSELO_FINAL: TStringField
      FieldName = 'SELO_FINAL'
      Size = 15
    end
    object ClientRegistroSELO_GRUPO_ID: TIntegerField
      FieldName = 'SELO_GRUPO_ID'
    end
    object ClientRegistroSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 60
    end
    object ClientRegistroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 90
    end
    object ClientRegistroEMOLUMENTO: TCurrencyField
      FieldName = 'EMOLUMENTO'
    end
    object ClientRegistroTAXA_JUDICIARIA: TCurrencyField
      FieldName = 'TAXA_JUDICIARIA'
    end
    object ClientRegistroOUTRA_TAXA1: TCurrencyField
      FieldName = 'OUTRA_TAXA1'
    end
    object ClientRegistroEMOLUMENTO_ITEM_ID: TIntegerField
      FieldName = 'EMOLUMENTO_ITEM_ID'
    end
    object ClientRegistroQTD_CORRECAO: TIntegerField
      FieldName = 'QTD_CORRECAO'
      OnChange = ClientRegistroQTD_CORRECAOChange
    end
    object ClientRegistroQTD_TOTAL: TIntegerField
      FieldName = 'QTD_TOTAL'
    end
    object ClientRegistroORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object ClientRegistroISS: TCurrencyField
      FieldName = 'ISS'
    end
    object ClientRegistroORDEM_REGISTRO: TIntegerField
      FieldName = 'ORDEM_REGISTRO'
    end
  end
  object dtsRegistro: TDataSource
    DataSet = ClientRegistro
    Left = 144
    Top = 56
  end
  object sqlPesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmControles.DB
    Left = 112
    Top = 96
  end
end
