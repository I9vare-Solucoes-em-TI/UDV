object frmPlanilhaML: TfrmPlanilhaML
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Sincroniza'#231#227'o'
  ClientHeight = 500
  ClientWidth = 949
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    Caption = '`'
    Color = clWindow
    TabOrder = 0
    object PanelBotaoFechar: TPanel
      Left = 839
      Top = 0
      Width = 110
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object cxBtnFechar: TcxButton
        Left = 43
        Top = 4
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
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 54
      Height = 53
      Align = alLeft
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 1
      object imgReceber: TImage
        Left = 2
        Top = 3
        Width = 52
        Height = 50
        Transparent = True
      end
    end
    object lblInformacaoLancamento: TcxLabel
      Left = 54
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = 'Carregar Planilha '
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clBlack
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
      Height = 53
      Width = 785
      AnchorX = 447
      AnchorY = 27
    end
  end
  object pgcSincronizar: TcxPageControl
    Left = 0
    Top = 53
    Width = 949
    Height = 447
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabSincronizacao
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 447
    ClientRectRight = 949
    ClientRectTop = 24
    object tabSincronizacao: TcxTabSheet
      Caption = 'Realizar Sincroniza'#231#227'o'
      ImageIndex = 1
      object pnlSincronizar: TPanel
        Left = 0
        Top = 0
        Width = 949
        Height = 56
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 14807280
        ParentBackground = False
        TabOrder = 0
        object btnSincronizar: TcxButton
          Left = 8
          Top = 25
          Width = 106
          Height = 22
          Cursor = crHandPoint
          Caption = 'Carregar Planilha'
          Colors.Default = clBlue
          Colors.Normal = 15513994
          Colors.Hot = 8421440
          Colors.Pressed = clGreen
          Colors.Disabled = clBtnFace
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Black'
          TabOrder = 0
          OnClick = btnSincronizarClick
        end
        object lblSincronizar: TcxLabel
          Left = 438
          Top = 24
          Caption = 'Carregando, aguarde!!!'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = 4210688
          Style.IsFontAssigned = True
          Transparent = True
          Visible = False
        end
        object btnConfirma: TcxButton
          Left = 214
          Top = 25
          Width = 106
          Height = 22
          Caption = '&Confirmar'
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
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnConfirmaClick
        end
        object btnCancelar: TcxButton
          Left = 326
          Top = 25
          Width = 106
          Height = 22
          Caption = '&Cancelar'
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
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnCancelarClick
        end
        object lblDataFaturado: TcxLabel
          Left = 121
          Top = 10
          Caption = 'Data Faturado'
          Style.TextColor = 16384
          Style.TextStyle = []
          Transparent = True
        end
        object edtDataFaturado: TcxDateEdit
          Left = 120
          Top = 26
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 5
          Width = 90
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 77
        Width = 949
        Height = 346
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        object cxGridDBSincronizar: TcxGridDBTableView
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
          DataController.DataSource = dtsPlanilha
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'SINCRONIZADO_NOVO'
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'NOME'
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
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          Styles.GroupByBox = dtmControles.cxStyle7
          object cxGridDBSincronizarColumn1: TcxGridDBColumn
            Caption = 'Protocolo'
            DataBinding.FieldName = 'PROTOCOLO'
            Width = 75
          end
          object cxGridDBSincronizarColumn2: TcxGridDBColumn
            Caption = 'Conv'#234'nio'
            DataBinding.FieldName = 'CONVENIO'
            Width = 124
          end
          object cxGridDBSincronizarColumn3: TcxGridDBColumn
            Caption = 'Devedor'
            DataBinding.FieldName = 'DEVEDOR'
            Width = 140
          end
          object cxGridDBSincronizarColumn4: TcxGridDBColumn
            Caption = 'Credor'
            DataBinding.FieldName = 'CREDOR'
            Width = 141
          end
          object cxGridDBSincronizarColumn5: TcxGridDBColumn
            Caption = 'A'#231#227'o'
            DataBinding.FieldName = 'ACAO'
            Width = 46
          end
          object cxGridDBSincronizarColumn6: TcxGridDBColumn
            Caption = 'Contrato'
            DataBinding.FieldName = 'CONTRATO'
            Width = 68
          end
          object cxGridDBSincronizarColumn7: TcxGridDBColumn
            Caption = 'Valor Gest'#227'o'
            DataBinding.FieldName = 'VALOR_GESTAO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 70
          end
          object cxGridDBSincronizarColumn8: TcxGridDBColumn
            Caption = 'Valor Adicional'
            DataBinding.FieldName = 'VALOR_ADICIONAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 68
          end
          object cxGridDBSincronizarColumn9: TcxGridDBColumn
            Caption = 'Troco'
            DataBinding.FieldName = 'VALOR_TROCO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 63
          end
          object cxGridDBSincronizarColumn10: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'VALOR_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 58
          end
          object cxGridDBSincronizarColumn11: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO'
            Width = 35
          end
          object cxGridDBSincronizarColumn12: TcxGridDBColumn
            Caption = 'GCPG'
            DataBinding.FieldName = 'GCPJ'
            Width = 59
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBSincronizar
        end
      end
      object cxProgress: TcxProgressBar
        Left = 0
        Top = 56
        Align = alTop
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
        TabOrder = 2
        Width = 949
      end
    end
  end
  object dtsPlanilha: TDataSource
    DataSet = sqlPlanilha
    Left = 163
    Top = 239
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLS;*.XLSX'
    Filter = '[REUNI TESOURARIA*.XLS] [REUNI TESOURARIA*.XLXS]'
    Title = ']'
    Left = 48
    Top = 177
  end
  object sqlPlanilha: TClientDataSet
    PersistDataPacket.Data = {
      CA0100009619E0BD01000000180000000D000000000003000000CA010950524F
      544F434F4C4F0100490000000100055749445448020002000A0008434F4E5645
      4E494F01004900000001000557494454480200020078000744455645444F5201
      0049000000010005574944544802000200780006435245444F52010049000000
      0100055749445448020002007800044143414F01004900000001000557494454
      48020002000A0008434F4E545241544F01004900000001000557494454480200
      02001E000C56414C4F525F47455354414F080004000000010007535542545950
      450200490006004D6F6E6579000F56414C4F525F41444943494F4E414C080004
      000000010007535542545950450200490006004D6F6E6579001256414C4F525F
      5245454D424F4C534156454C0800040000000100075355425459504502004900
      06004D6F6E65790006434F4449474F0100490000000100055749445448020002
      000A00044743504A01004900000001000557494454480200020014000B56414C
      4F525F54524F434F080004000000010007535542545950450200490006004D6F
      6E6579000B56414C4F525F544F54414C08000400000001000753554254595045
      0200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PROTOCOLO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONVENIO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DEVEDOR'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CREDOR'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'ACAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONTRATO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALOR_GESTAO'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_ADICIONAL'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_REEMBOLSAVEL'
        DataType = ftCurrency
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GCPJ'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_TROCO'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 165
    Top = 193
    object sqlPlanilhaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 10
    end
    object sqlPlanilhaCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 120
    end
    object sqlPlanilhaDEVEDOR: TStringField
      FieldName = 'DEVEDOR'
      Size = 120
    end
    object sqlPlanilhaCREDOR: TStringField
      FieldName = 'CREDOR'
      Size = 120
    end
    object sqlPlanilhaACAO: TStringField
      FieldName = 'ACAO'
      Size = 10
    end
    object sqlPlanilhaCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 30
    end
    object sqlPlanilhaVALOR_GESTAO: TCurrencyField
      FieldName = 'VALOR_GESTAO'
    end
    object sqlPlanilhaVALOR_ADICIONAL: TCurrencyField
      FieldName = 'VALOR_ADICIONAL'
    end
    object sqlPlanilhaVALOR_REEMBOLSAVEL: TCurrencyField
      FieldName = 'VALOR_REEMBOLSAVEL'
    end
    object sqlPlanilhaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object sqlPlanilhaGCPJ: TStringField
      FieldName = 'GCPJ'
    end
    object sqlPlanilhaVALOR_TROCO: TCurrencyField
      FieldName = 'VALOR_TROCO'
    end
    object sqlPlanilhaVALOR_TOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
    end
  end
end
