object frmSuporteAtualizacaoEmolumentoItem: TfrmSuporteAtualizacaoEmolumentoItem
  Left = 0
  Top = 0
  Caption = 'Suporte - Atualiza'#231#227'o Emolumento Item'
  ClientHeight = 561
  ClientWidth = 784
  Color = 13034466
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object pnlSair: TPanel
      Left = 714
      Top = 0
      Width = 70
      Height = 49
      Align = alRight
      BevelOuter = bvNone
      Color = 13034466
      ParentBackground = False
      TabOrder = 2
      object btnSair: TcxButton
        Left = 13
        Top = 2
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
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnSairClick
      end
    end
    object grbEmolumentoPeriodo: TcxGroupBox
      Left = 0
      Top = 0
      Align = alLeft
      Caption = ' Emolumento Per'#237'odo '
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 0
      Height = 49
      Width = 230
      object lcbEmolumentoPeriodo: TcxLookupComboBox
        Left = 10
        Top = 20
        ParentFont = False
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'EMOLUMENTO_PERIODO_ID'
        Properties.ListColumns = <
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DESCRICAO'
          end
          item
            Caption = 'Data Inicial'
            FieldName = 'DATA_INICIAL'
          end>
        Properties.ListSource = dtsEmolumentoPeriodo
        Properties.OnEditValueChanged = lcbEmolumentoPeriodoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 210
      end
    end
    object grbCampo: TcxGroupBox
      Left = 230
      Top = 0
      Align = alLeft
      Caption = ' Campo '
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      Style.TransparentBorder = True
      TabOrder = 1
      Height = 49
      Width = 150
      object cbxCampo: TcxComboBox
        Left = 10
        Top = 20
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Valor Emolumento'
          'Valor Taxa Judici'#225'ria'
          'Descri'#231#227'o Selo Grupo')
        Properties.OnEditValueChanged = lcbEmolumentoPeriodoPropertiesEditValueChanged
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Text = 'Valor Emolumento'
        Width = 130
      end
    end
    object btnPesquisar: TcxButton
      Left = 384
      Top = 12
      Width = 106
      Height = 25
      Caption = 'Pesquisar'
      Colors.Default = clWhite
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        0800000000009001000000000000000000000001000000000000000000000101
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
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnPesquisarClick
    end
    object btnConfirmar: TcxButton
      Left = 494
      Top = 12
      Width = 106
      Height = 25
      Caption = 'Confirmar'
      Colors.Default = clWhite
      Enabled = False
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
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
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
  end
  object pgcAtualizacaoEmolumentoItem: TcxPageControl
    Left = 0
    Top = 49
    Width = 784
    Height = 512
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tbsEmolumentoItem
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 512
    ClientRectRight = 784
    ClientRectTop = 24
    object tbsEmolumentoItem: TcxTabSheet
      Caption = 'Emolumento Item'
      ImageIndex = 0
      object grdEmolumentoItem: TcxGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 488
        Align = alClient
        TabOrder = 0
        object grdEmolumentoItemDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          OnCustomDrawCell = grdEmolumentoItemDBTableViewCustomDrawCell
          DataController.DataSource = dtsEmolumentoItem
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Quantidade: 0'
              Kind = skCount
              Column = grdEmolumentoItemDBTableViewDESCRICAO
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdEmolumentoItemDBTableViewCODIGO_SELO: TcxGridDBColumn
            Caption = 'C'#243'digo Selo'
            DataBinding.FieldName = 'CODIGO_SELO'
            Width = 100
          end
          object grdEmolumentoItemDBTableViewDESCRICAO: TcxGridDBColumn
            Caption = 'Sistema'
            DataBinding.FieldName = 'DESCRICAO'
            Visible = False
            GroupIndex = 0
          end
          object grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO: TcxGridDBColumn
            Caption = 'Valor Emolumento'
            DataBinding.FieldName = 'VALOR_EMOLUMENTO'
          end
          object grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO_TJ: TcxGridDBColumn
            Caption = 'Valor Emolumento TJ'
            DataBinding.FieldName = 'VALOR_EMOLUMENTO_TJ'
            Width = 126
          end
          object grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA: TcxGridDBColumn
            Caption = 'Valor Taxa Judici'#225'ria'
            DataBinding.FieldName = 'VALOR_TAXA_JUDICIARIA'
            Width = 126
          end
          object grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA_TJ: TcxGridDBColumn
            Caption = 'Valor Taxa Judici'#225'ria TJ'
            DataBinding.FieldName = 'VALOR_TAXA_JUDICIARIA_TJ'
            Width = 144
          end
          object grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO: TcxGridDBColumn
            Caption = 'Corre'#231#227'o Valor Emolumento'
            DataBinding.FieldName = 'CORRECAO_VALOR_EMOLUMENTO'
            Width = 174
          end
          object grdEmolumentoItemDBTableViewCORRECAO_VALOR_TAXA_JUDICIARIA: TcxGridDBColumn
            Caption = 'Corre'#231#227'o Valor Taxa Judici'#225'ria'
            DataBinding.FieldName = 'CORRECAO_VALOR_TAXA_JUDICIARIA'
            Width = 192
          end
        end
        object grdEmolumentoItemLevel: TcxGridLevel
          GridView = grdEmolumentoItemDBTableView
        end
      end
    end
    object tbsSeloGrupo: TcxTabSheet
      Caption = 'Selo Grupo'
      ImageIndex = 1
      object grdSeloGrupo: TcxGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 488
        Align = alClient
        TabOrder = 0
        object grdSeloGrupoDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = dtsSeloGrupo
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Quantidade: 0'
              Kind = skCount
              Column = grdSeloGrupoDBTableViewDESCRICAO
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdSeloGrupoDBTableViewNUMERO: TcxGridDBColumn
            Caption = 'C'#243'digo Selo'
            DataBinding.FieldName = 'NUMERO'
            Width = 100
          end
          object grdSeloGrupoDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Completa'
            DataBinding.FieldName = 'DESCRICAO_COMPLETA'
            Width = 550
          end
          object grdSeloGrupoDBTableViewDESCRICAO_COMPLETA_TJ: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Completa TJ'
            DataBinding.FieldName = 'DESCRICAO_COMPLETA_TJ'
            Width = 550
          end
          object grdSeloGrupoDBTableViewDESCRICAO: TcxGridDBColumn
            Caption = 'Sistema'
            DataBinding.FieldName = 'DESCRICAO'
            Visible = False
            GroupIndex = 0
          end
        end
        object grdSeloGrupoLevel: TcxGridLevel
          GridView = grdSeloGrupoDBTableView
        end
      end
    end
  end
  object qryEmolumentoItem: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT'
      '    G_EI.EMOLUMENTO_ITEM_ID,'
      '    G_EI.CODIGO_SELO,'
      '    G_EI.VALOR_EMOLUMENTO,'
      '    G_EI.VALOR_TAXA_JUDICIARIA,'
      '    G_S.SISTEMA_ID,'
      '    G_S.DESCRICAO,'
      '    C.VALOR_EMOLUMENTO AS VALOR_EMOLUMENTO_TJ,'
      '    C.VALOR_TAXA_JUDICIARIA AS VALOR_TAXA_JUDICIARIA_TJ,'
      
        '    C.VALOR_EMOLUMENTO - G_EI.VALOR_EMOLUMENTO AS CORRECAO_VALOR' +
        '_EMOLUMENTO,'
      
        '    C.VALOR_TAXA_JUDICIARIA - G_EI.VALOR_TAXA_JUDICIARIA AS CORR' +
        'ECAO_VALOR_TAXA_JUDICIARIA'
      'FROM'
      '    G_EMOLUMENTO_ITEM G_EI'
      'INNER JOIN'
      '    CONFERENCIA C ON C.CODIGO = G_EI.CODIGO_SELO'
      'INNER JOIN'
      '    G_EMOLUMENTO G_E ON G_E.EMOLUMENTO_ID = G_EI.EMOLUMENTO_ID'
      'INNER JOIN'
      '    G_SISTEMA G_S ON G_S.SISTEMA_ID = G_E.SISTEMA_ID'
      'WHERE'
      '    G_EI.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND'
      '    G_EI.VALOR_EMOLUMENTO <> C.VALOR_EMOLUMENTO'
      'ORDER BY'
      '    G_S.DESCRICAO,'
      '    G_EI.CODIGO_SELO')
    Left = 48
    Top = 112
    ParamData = <
      item
        Name = 'P_EMOLUMENTO_PERIODO_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
    object qryEmolumentoItemEMOLUMENTO_ITEM_ID: TBCDField
      FieldName = 'EMOLUMENTO_ITEM_ID'
      Origin = 'EMOLUMENTO_ITEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEmolumentoItemCODIGO_SELO: TStringField
      FieldName = 'CODIGO_SELO'
      Origin = 'CODIGO_SELO'
      Size = 30
    end
    object qryEmolumentoItemVALOR_EMOLUMENTO: TBCDField
      FieldName = 'VALOR_EMOLUMENTO'
      Origin = 'VALOR_EMOLUMENTO'
      currency = True
      Precision = 18
      Size = 3
    end
    object qryEmolumentoItemVALOR_TAXA_JUDICIARIA: TBCDField
      FieldName = 'VALOR_TAXA_JUDICIARIA'
      Origin = 'VALOR_TAXA_JUDICIARIA'
      currency = True
      Precision = 18
      Size = 3
    end
    object qryEmolumentoItemSISTEMA_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryEmolumentoItemDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryEmolumentoItemVALOR_EMOLUMENTO_TJ: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_EMOLUMENTO_TJ'
      Origin = 'VALOR_EMOLUMENTO'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryEmolumentoItemVALOR_TAXA_JUDICIARIA_TJ: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TAXA_JUDICIARIA_TJ'
      Origin = 'VALOR_TAXA_JUDICIARIA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryEmolumentoItemCORRECAO_VALOR_EMOLUMENTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CORRECAO_VALOR_EMOLUMENTO'
      Origin = 'CORRECAO_VALOR_EMOLUMENTO'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 3
    end
    object qryEmolumentoItemCORRECAO_VALOR_TAXA_JUDICIARIA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CORRECAO_VALOR_TAXA_JUDICIARIA'
      Origin = 'CORRECAO_VALOR_TAXA_JUDICIARIA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 3
    end
  end
  object dtsEmolumentoItem: TDataSource
    AutoEdit = False
    DataSet = qryEmolumentoItem
    Left = 48
    Top = 168
  end
  object qryEmolumentoPeriodo: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT'
      '    G_EP.EMOLUMENTO_PERIODO_ID,'
      '    G_EP.DESCRICAO,'
      '    G_EP.DATA_INICIAL'
      'FROM'
      '    G_EMOLUMENTO_PERIODO G_EP'
      'WHERE'
      '    G_EP.SITUACAO = :P_SITUACAO'
      'ORDER BY'
      '    G_EP.DATA_INICIAL DESC')
    Left = 162
    Top = 112
    ParamData = <
      item
        Name = 'P_SITUACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = 'A'
      end>
  end
  object dtsEmolumentoPeriodo: TDataSource
    AutoEdit = False
    DataSet = qryEmolumentoPeriodo
    Left = 162
    Top = 168
  end
  object qrySeloGrupo: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT'
      '    G_SG.SELO_GRUPO_ID,'
      '    G_SG.NUMERO,'
      '    G_SG.DESCRICAO_COMPLETA,'
      '    C.DESCRICAO AS DESCRICAO_COMPLETA_TJ,'
      '    G_S.SISTEMA_ID,'
      '    G_S.DESCRICAO'
      'FROM'
      '    G_SELO_GRUPO G_SG'
      'INNER JOIN'
      '    CONFERENCIA C ON C.CODIGO = G_SG.NUMERO'
      'INNER JOIN'
      '    G_SISTEMA G_S ON G_S.SISTEMA_ID = G_SG.SISTEMA_ID'
      'WHERE'
      '    G_SG.SITUACAO = :P_SITUACAO AND'
      '    G_SG.DESCRICAO_COMPLETA <> C.DESCRICAO AND'
      '    C.DESCRICAO_ALTERADA = :P_DESCRICAO_ALTERADA'
      'ORDER BY'
      '    G_S.DESCRICAO,'
      '    G_SG.NUMERO')
    Left = 257
    Top = 112
    ParamData = <
      item
        Name = 'P_SITUACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'A'
      end
      item
        Name = 'P_DESCRICAO_ALTERADA'
        DataType = ftString
        ParamType = ptInput
        Value = 'S'
      end>
    object qrySeloGrupoSELO_GRUPO_ID: TBCDField
      FieldName = 'SELO_GRUPO_ID'
      Origin = 'SELO_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoNUMERO: TBCDField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object qrySeloGrupoDESCRICAO_COMPLETA_TJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COMPLETA_TJ'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 260
    end
    object qrySeloGrupoSISTEMA_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySeloGrupoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dtsSeloGrupo: TDataSource
    AutoEdit = False
    DataSet = qrySeloGrupo
    Left = 257
    Top = 168
  end
end
