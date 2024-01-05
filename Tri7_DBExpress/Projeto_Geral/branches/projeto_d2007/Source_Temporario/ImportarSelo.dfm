object frmImportarSelo: TfrmImportarSelo
  Left = 0
  Top = 0
  Caption = 'Importar Selo'
  ClientHeight = 407
  ClientWidth = 910
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
  object pnlConvenio: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    Color = 14807280
    ParentBackground = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 838
      Top = 2
      Width = 70
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      Color = 14807280
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 6
        Top = 4
        Width = 55
        Height = 45
        Cursor = crHandPoint
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cxBtnFecharClick
        Colors.Default = clWhite
        Glyph.Data = {
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
        Layout = blGlyphTop
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
      end
    end
    object ProgressBar1: TcxProgressBar
      Left = 236
      Top = 16
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Width = 145
    end
    object cxLabel1: TcxLabel
      Left = 236
      Top = 37
      Caption = '>> Selos'
    end
    object ProgressBar2: TcxProgressBar
      Left = 387
      Top = 16
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      Width = 390
    end
    object cxLabel2: TcxLabel
      Left = 387
      Top = 37
      Caption = '>> Lote'
    end
    object btnCarregar: TcxButton
      Left = 12
      Top = 16
      Width = 105
      Height = 22
      Caption = 'Carregar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnCarregarClick
      Colors.Default = clWhite
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
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
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
    object btnImportar: TcxButton
      Left = 121
      Top = 16
      Width = 105
      Height = 22
      Caption = 'Importar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnImportarClick
      Colors.Default = clWhite
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000120B0000120B0000000100000000000000000000B7B7
        B7006666660028282800FFFFFF00191919004A4A4A009F9F9F00E0E0E0001212
        1200878787003030300009090900C5C5C5007F7F7F003333330022222200F4F4
        F4004242420006060600D3D3D30099999900A5A5A50056565600161616001E1E
        1E000E0E0E00EEEEEE006E6E6E00A8A8A8002B2B2B005353530036363600BDBD
        BD0024242400B0B0B000E9E9E900F8F8F800DBDBDB0077777700141414008585
        85002A2A2A006C6C6C00A1A1A100080808001C1C1C000C0C0C0000000000AFAF
        AF0058585800C8C8C8009C9C9C003B3B3B00E4E4E4008B8B8B00D7D7D7002626
        2600A7A7A700A3A3A3002020200018181800101010005B5B5B00444444008989
        890081818100F1F1F100BFBFBF00FBFBFB000404040000000000000000000000
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
        0000000000000000000000000000000000000000000000000000040404042900
        0000000000000000000000000B08040404044333124600000000000000000000
        4615040404041445043213131313131313131313130704040404120B1B04020C
        2D2D2D2D2D2D2D2D2D0704040404322F0F24041C2F2F2F2F2F2F2F2F2F070404
        04043F1A1A0B3604271A1A1A1A1A1A1A1A072B1F1F1F103E3E3E1E26040E3E3E
        3E3E3E3E3E2C090909090909090909033804200909090909092C181818181818
        181818180104061818181818183B1E2222223D3D3D3D3D34040D193D3D3D3D3D
        3D1625111111172E2E2E3A040D392E2E2E2E2E2E2E1604040404021919310421
        1019191919191919191604040404173C010401103C3C3C3C3C3C3C3C3C1D0404
        0404152104231010101010101010101010160404040404041622222222222222
        22222222030D0404040429170303030303030303030303030A0404040404202A
        1E1E1E1E1E1E1E1E1E1E1E42040404040404401E1E1E1E1E1E1E1E1E1E1E4104
        040404040404060B0B0B0B0B0B0B0B0B20150404040404040404370F0F0F0F0F
        0F0F0F35070404040404}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
  end
  object gridImportar: TcxGrid
    Left = 0
    Top = 57
    Width = 910
    Height = 350
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object gridSelos: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.DataSource = dtsSelos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total: 0'
          Kind = skCount
          FieldName = 'identificacao_pedido'
          Column = gridSelosidentificacao_pedido
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object gridSelosidentificacao_pedido: TcxGridDBColumn
        Caption = 'Id. Selo'
        DataBinding.FieldName = 'identificacao_pedido'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 80
      end
      object gridSelosdata_da_solicitacao: TcxGridDBColumn
        Caption = 'Dt. Solicita'#231#227'o'
        DataBinding.FieldName = 'data_da_solicitacao'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 100
      end
      object gridSelostipo_de_ato: TcxGridDBColumn
        Caption = 'Tipo Ato'
        DataBinding.FieldName = 'tipo_de_ato'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 80
      end
      object gridSeloscodigo_inicial_do_selo: TcxGridDBColumn
        Caption = 'C'#243'd. Inicial Selo'
        DataBinding.FieldName = 'codigo_inicial_do_selo'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 180
      end
      object gridSeloscodigo_final_do_selo: TcxGridDBColumn
        Caption = 'C'#243'd. Final Selo'
        DataBinding.FieldName = 'codigo_final_do_selo'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 180
      end
      object gridSelosquantidade_de_selos: TcxGridDBColumn
        Caption = 'Qtde.'
        DataBinding.FieldName = 'quantidade_de_selos'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 60
      end
      object gridSelossilga: TcxGridDBColumn
        Caption = 'Sigla'
        DataBinding.FieldName = 'silga'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 130
      end
      object gridSelosselo_inicial: TcxGridDBColumn
        Caption = 'Selo Ini.'
        DataBinding.FieldName = 'selo_inicial'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 80
      end
      object gridSelosselo_final: TcxGridDBColumn
        Caption = 'Selo Fim'
        DataBinding.FieldName = 'selo_final'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 80
      end
      object gridSelosdescricao_tipo_ato: TcxGridDBColumn
        Caption = 'Descri'#231#227'o Tipo Ato'
        DataBinding.FieldName = 'tipo_de_ato'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'NUMERO'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO_COMPLETA'
          end>
        Properties.ListSource = dtmLookup.dtsSeloGrupo
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.Focusing = False
        Width = 300
      end
    end
    object gridImportarLevel1: TcxGridLevel
      GridView = gridSelos
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'XML|*.XML'
    Left = 808
    Top = 16
  end
  object dtsSelos: TDataSource
    DataSet = sqlSelos
    Left = 72
    Top = 88
  end
  object sqlSelos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 88
    Data = {
      250100009619E0BD010000001800000009000000000003000000250114696465
      6E74696669636163616F5F70656469646F04000100000000000B7469706F5F64
      655F61746F040001000000000013646174615F64615F736F6C69636974616361
      6F0100490000000100055749445448020002000A0016636F6469676F5F696E69
      6369616C5F646F5F73656C6F0100490000000100055749445448020002001E00
      14636F6469676F5F66696E616C5F646F5F73656C6F0100490000000100055749
      445448020002001E00137175616E7469646164655F64655F73656C6F73040001
      00000000000573696C67610100490000000100055749445448020002001E000C
      73656C6F5F696E696369616C04000100000000000A73656C6F5F66696E616C04
      000100000000000000}
    object sqlSelosidentificacao_pedido: TIntegerField
      FieldName = 'identificacao_pedido'
    end
    object sqlSelostipo_de_ato: TIntegerField
      FieldName = 'tipo_de_ato'
    end
    object sqlSelosdata_da_solicitacao: TStringField
      FieldName = 'data_da_solicitacao'
      Size = 10
    end
    object sqlSeloscodigo_inicial_do_selo: TStringField
      FieldName = 'codigo_inicial_do_selo'
      Size = 30
    end
    object sqlSeloscodigo_final_do_selo: TStringField
      FieldName = 'codigo_final_do_selo'
      Size = 30
    end
    object sqlSelosquantidade_de_selos: TIntegerField
      FieldName = 'quantidade_de_selos'
    end
    object sqlSelossilga: TStringField
      FieldName = 'silga'
      Size = 30
    end
    object sqlSelosselo_inicial: TIntegerField
      FieldName = 'selo_inicial'
    end
    object sqlSelosselo_final: TIntegerField
      FieldName = 'selo_final'
    end
  end
  object XMLDocument1: TXMLDocument
    NodeIndentStr = '    '
    XML.Strings = (
      '<?xml version="1.0"?>'
      '<selo_eletronico>'
      #9'<lote_dos_pedidos>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>122</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>82</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
        #9#9#9'<codigo_inicial_do_selo>03951208130933082000000</codigo_inici' +
        'al_do_selo>'
        #9#9#9'<codigo_final_do_selo>03951208130933082000999</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>1000</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>123</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>62</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
        #9#9#9'<codigo_inicial_do_selo>03951208130934062000000</codigo_inici' +
        'al_do_selo>'
        #9#9#9'<codigo_final_do_selo>03951208130934062001999</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>2000</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>124</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>70</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
        #9#9#9'<codigo_inicial_do_selo>03951208130934070000000</codigo_inici' +
        'al_do_selo>'
        #9#9#9'<codigo_final_do_selo>03951208130934070000499</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>500</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9#9'<pedido_do_selo_eletronico>'
      #9#9#9'<identificacao_pedido>125</identificacao_pedido>'
      #9#9#9'<tipo_de_ato>5</tipo_de_ato>'
      #9#9#9'<data_da_solicitacao>2012-08-13</data_da_solicitacao>'
        #9#9#9'<codigo_inicial_do_selo>03951208130935005000000</codigo_inici' +
        'al_do_selo>'
        #9#9#9'<codigo_final_do_selo>03951208130935005000499</codigo_final_d' +
        'o_selo>'
      #9#9#9'<quantidade_de_selos>500</quantidade_de_selos>'
      #9#9#9'<assinatura_digital>true</assinatura_digital>'
      #9#9'</pedido_do_selo_eletronico>'
      #9'</lote_dos_pedidos>'
        #9'<hash_conferencia_do_arquivo_xml>3df829f52cb17f3210f25c7ed67539' +
        '0787ae2516</hash_conferencia_do_arquivo_xml>'
      '</selo_eletronico>')
    Left = 112
    Top = 88
    DOMVendorDesc = 'MSXML'
  end
  object sqlPesquisa: TI9Query
    Aggregates = <>
    ParamData = <>
    Params = <>
    Left = 32
    Top = 120
  end
end
