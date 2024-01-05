object FrmTarefaGerenciamento: TFrmTarefaGerenciamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Controle de Tarefas'
  ClientHeight = 456
  ClientWidth = 829
  Color = 16316664
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 37
    Width = 153
    Height = 419
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      153
      419)
    object btnCriar: TcxButton
      AlignWithMargins = True
      Left = 9
      Top = 299
      Width = 106
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Incluir Tarefa'
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
      TabOrder = 0
      OnClick = btnCriarClick
    end
    object dtsPeriodo: TcxDateNavigator
      AlignWithMargins = True
      Left = 3
      Top = 45
      Width = 147
      Height = 132
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      SelectPeriod = False
      ShowWeekNumbers = False
      Storage = scbCalendario
      Styles.Background = dtmControles.cxStyle1
      Styles.Content = dtmControles.cxStyle1
      Styles.Header = dtmControles.cxStyle1
      Styles.Selection = dtmControles.cxStyle34
      TabOrder = 1
      UnlimitedSelection = True
      OnSelectionChanged = dtsPeriodoSelectionChanged
      ExplicitTop = 47
    end
    object btnHoje: TcxButton
      AlignWithMargins = True
      Left = 9
      Top = 357
      Width = 106
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Hoje'
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        080000000000900100000000000000000000000100000000000000000000BEBE
        BE006A6A6A003838380028282800FFFFFF00A7A7A7001B1B1B00E4E4E4009292
        92001212120050505000090909004A4A4A008A8A8A00C8C8C800666666002F2F
        2F00F2F2F200E3E3E30044444400767676000606060024242400525252001818
        18009C9C9C00ECECEC00AAAAAA00D8D8D8005454540074747400C6C6C6001010
        100022222200333333004E4E4E007C7C7C0058585800D1D1D100F9F9F9002B2B
        2B00C5C5C50099999900202020000000000036363600EBEBEB006E6E6E00AFAF
        AF00F0F0F000F6F6F600CCCCCC00E8E8E800080808001A1A1A00151515000D0D
        0D00A0A0A00046464600A9A9A900ADADAD005A5A5A004C4C4C00303030009595
        95009F9F9F007E7E7E0000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000051F00000000
        0000000000000000000000001F05150C00000000000000000000000000000000
        0C153636370D0D0D0D0B0B24240B0B240D0D0D3716160C0C0B05050505123305
        05281B280505050B36363939240505051D23173A3021301A050505240C0C3939
        0B05050505060205132E41050505050B39390A0A180505050506100505121106
        0505051821210A0A1805050528431005082F251E050505180A0A38381E050505
        2F180905410B0B0F0505051E3838191926050505050505050505050505050526
        191907073E05050505050505050505050505053E07072C2C1740292929292929
        29292929292940170707222240423C060606060606060606063C1A402C2C1717
        031C313D3D3D3D3D3D3D3D3D3D311C0322221717171717171717171717171717
        1717171717172E0404040404040404040404040404040404042E343B29032A14
        2929292929292929142A03293B3405322B0305140E2020202020200E3B052E2B
        3205050527400240010505050505050140024027050505053224231435050505
        05050535142324320505}
      TabOrder = 2
      OnClick = btnHojeClick
    end
    object btnAtualizar: TcxButton
      AlignWithMargins = True
      Left = 9
      Top = 328
      Width = 106
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Atualizar'
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        080000000000900100000000000000000000000100000000000000000000D4D4
        D4006C6C6C003E3E3E00ACACAC0028282800FFFFFF001C1C1C00838383005555
        5500F3F3F300BBBBBB000E0E0E00E0E0E00030303000C6C6C600959595004646
        46006262620072727200232323000808080014141400EBEBEB00363636007C7C
        7C0050505000F7F7F70006060600D9D9D9002C2C2C00D0D0D0008B8B8B002626
        2600B2B2B20044444400191919001E1E1E00E7E7E70066666600F1F1F100DBDB
        DB005B5B5B00F9F9F900707070007676760089898900CCCCCC002A2A2A001111
        11000B0B0B00B1B1B1003A3A3A00999999006666660054545400E5E5E5004B4B
        4B00B6B6B600DFDFDF00F5F5F5003333330000000000D7D7D700FBFBFB004040
        4000BDBDBD00202020006E6E6E005D5D5D001A1A1A0058585800858585003838
        38007F7F7F000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000060606060606
        1D2C240000242C3F060606060606062A0B06064825000000000000074A1B0606
        0606061C1C13231C1C1C073434071C1C1C492606060606151515151541332806
        0628331815153D3C0606063232323232130606060606061B093232190606060C
        0C0C0C0C0C1E1F06060606062B180C07010606313131313130023F0606060606
        0622313127060616160745330A06060606060606060A07163D06060210380606
        0606060606060606060604022F06060606060606060606060606060606060606
        06060606060606060606060606060606060606060606061F1333060606060606
        06060606060626351306060343300A06060606060606060A3A2705434306062C
        14140B0606060606061D2D34141414141406061D3D2139400606060606014121
        2121212121060606200505021B0606060606060805050505050606061B1A1E1E
        1A0B0A06060A0B2A1E1E1E1E1E0606060617471E1E1E414747411E1E1E122E1E
        1E06060606062B10110E0E0E0E0E0E113506060F2D060606060606063B20113D
        3D11200D060606060606}
      TabOrder = 3
      OnClick = btnAtualizarClick
    end
    object icxTipoPeriodo: TcxImageComboBox
      AlignWithMargins = True
      Left = 3
      Top = 20
      Margins.Top = 0
      Align = alTop
      RepositoryItem = dtmLookup.Combo_TipoPeriodo
      ParentFont = False
      Properties.Items = <>
      Properties.ReadOnly = False
      Properties.OnChange = icxTipoPeriodoPropertiesChange
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      StyleDisabled.Color = clWindow
      TabOrder = 4
      Width = 147
    end
    object lblPeriodo: TcxLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Per'#237'odo'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object btnFechar: TcxButton
      AlignWithMargins = True
      Left = 9
      Top = 386
      Width = 106
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Fechar'
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        080000000000900100000000000000000000000100000000000000000000D7D7
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
      TabOrder = 6
      OnClick = btnFecharClick
    end
  end
  object PnlLista: TPanel
    Left = 153
    Top = 37
    Width = 676
    Height = 419
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 676
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LblObservacao: TcxLabel
        Left = 10
        Top = -3
        Caption = 'Respons'#225'vel'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindow
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lcbResponsavel: TcxDBLookupComboBox
        Left = 10
        Top = 17
        DataBinding.DataField = 'USUARIO_ID'
        DataBinding.DataSource = DtsResponsavel
        ParentFont = False
        Properties.KeyFieldNames = 'USUARIO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'NOME_COMPLETO'
          end
          item
            FieldName = 'FUNCAO'
          end>
        Properties.ListSource = dtsResponsavelListSource
        Properties.OnChange = lcbResponsavelPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 396
      end
    end
    object pgcTarefas: TcxPageControl
      Left = 0
      Top = 38
      Width = 676
      Height = 381
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tbsListagem
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 381
      ClientRectRight = 676
      ClientRectTop = 24
      object tbsListagem: TcxTabSheet
        Caption = 'Listagem'
        ImageIndex = 0
        object PnlLembretes: TPanel
          Left = 0
          Top = 0
          Width = 676
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object grdLembrete: TcxGrid
            AlignWithMargins = True
            Left = 10
            Top = 10
            Width = 656
            Height = 337
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alClient
            TabOrder = 0
            object grdLembreteDBTableView: TcxGridDBTableView
              PopupMenu = ppmListagem
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = DtsListagem
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object grdLembreteDBTableViewUSUARIO_NOME: TcxGridDBColumn
                Caption = 'Usu'#225'rio'
                DataBinding.FieldName = 'USUARIO_NOME'
                Visible = False
                Width = 148
              end
              object grdLembreteDBTableViewASSUNTO: TcxGridDBColumn
                Caption = 'Assunto'
                DataBinding.FieldName = 'ASSUNTO'
                Width = 127
              end
              object grdLembreteDBTableViewMENSAGEM: TcxGridDBColumn
                Caption = 'Mensagem'
                DataBinding.FieldName = 'MENSAGEM'
                Width = 178
              end
              object grdLembreteDBTableViewDATA_INICIAL: TcxGridDBColumn
                Caption = 'Inicio'
                DataBinding.FieldName = 'DATA_INICIAL'
                Width = 106
              end
              object grdLembreteDBTableViewDATA_FINAL: TcxGridDBColumn
                Caption = 'Fim'
                DataBinding.FieldName = 'DATA_FINAL'
                Width = 95
              end
              object grdLembreteDBTableViewSITUACAO: TcxGridDBColumn
                Caption = 'Situa'#231#227'o'
                DataBinding.FieldName = 'SITUACAO'
                Visible = False
                Width = 62
              end
            end
            object grdLembreteLevel: TcxGridLevel
              GridView = grdLembreteDBTableView
            end
          end
        end
      end
      object tbsCalendario: TcxTabSheet
        Caption = 'Calend'#225'rio'
        ImageIndex = 1
        object scdCalendario: TcxScheduler
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 656
          Height = 337
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          DateNavigator.RowCount = 4
          DateNavigator.Visible = False
          ViewDay.Active = True
          ViewDay.HeaderContainer = False
          ViewDay.Styles.TimeRuler = dtmControles.cxStyle24
          ViewDay.TimeRulerMinutes = True
          ViewDay.TimeScale = 60
          ViewGantt.LinkLineColor = clTeal
          ViewWeek.CompressWeekEnd = False
          ViewWeeks.CompressWeekEnd = False
          ViewYear.Styles.MonthHeader = dtmControles.cxStyle23
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          ContentPopupMenu.PopupMenu = ppmCalendario
          ContentPopupMenu.UseBuiltInPopupMenu = False
          ContentPopupMenu.Items = []
          ControlBox.Visible = False
          DialogsStyle = 'Standard'
          EventPopupMenu.Items = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          OptionsBehavior.HotTrack = False
          OptionsCustomize.ControlsSizing = False
          OptionsView.HideSelection = True
          OptionsView.ResourceHeaders.MultilineCaptions = True
          OptionsView.ShowNavigationButtons = False
          OptionsView.WorkDays = [dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday]
          OptionsView.WorkStart = 0.750000000000000000
          OptionsView.WorkFinish = 0.333333333333333300
          PopupMenu = ppmCalendario
          ResourceNavigator.Visibility = snvAlways
          Storage = scbCalendario
          Styles.Background = dtmControles.cxStyle1
          Styles.Content = dtmControles.cxStyle1
          Styles.Event = dtmControles.cxStyle37
          Styles.DayHeader = dtmControles.cxStyle1
          TabOrder = 0
          OnBeforeEditing = scdCalendarioBeforeEditing
          OnViewTypeChanged = scdCalendarioViewTypeChanged
          Selection = 7
          Splitters = {
            67010000F501000077020000FA010000E301000001000000E801000045010000}
          StoredClientBounds = {01000000010000008F02000050010000}
        end
      end
    end
  end
  object PnlProgresso: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object LblProgresso: TLabel
      Left = 0
      Top = 0
      Width = 829
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Aguarde ... '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ExplicitWidth = 63
    end
    object PgbProgresso: TcxProgressBar
      AlignWithMargins = True
      Left = 10
      Top = 13
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      ParentColor = False
      ParentFont = False
      Properties.ShowTextStyle = cxtsText
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 809
    end
  end
  object scbCalendario: TcxSchedulerDBStorage
    GenerateGUIDForID = True
    Reminders.Active = False
    Resources.Items = <>
    CustomFields = <>
    Holidays = scdFeriados
    DataSource = DtsCalendario
    FieldNames.ActualFinish = 'ActualFinish'
    FieldNames.ActualStart = 'ActualStart'
    FieldNames.Caption = 'caption'
    FieldNames.GroupID = 'GroupId'
    FieldNames.EventType = 'EventType'
    FieldNames.Finish = 'Finish'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Location = 'Location'
    FieldNames.Message = 'Message'
    FieldNames.Options = 'Options'
    FieldNames.ParentID = 'ParentID'
    FieldNames.RecurrenceIndex = 'RecurrenceIndex'
    FieldNames.RecurrenceInfo = 'RecurrenceInfo'
    FieldNames.ReminderDate = 'ReminderDate'
    FieldNames.ReminderMinutesBeforeStart = 'ReminderMinutesBeforeStart'
    FieldNames.ReminderResourcesData = 'ReminderResourcesData'
    FieldNames.ResourceID = 'ResourceID'
    FieldNames.Start = 'Start'
    FieldNames.State = 'State'
    FieldNames.TaskCompleteField = 'TaskCompleteField'
    FieldNames.TaskIndexField = 'TaskIndexField'
    FieldNames.TaskLinksField = 'TaskLinkField'
    FieldNames.TaskStatusField = 'TaskStatusField'
    Left = 341
    Top = 313
  end
  object QryTarefas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '       G_TR.TAREFA_ID,'
      '       G_TR.SITUACAO,'
      '       G_TR.PERIODO_TIPO,'
      '       G_TR.TAREFA_GRUPO_ID,'
      '       G_TR.DATA_CADASTRO,'
      '       G_TR.SERVENTIA,'
      '       G_TR.ASSUNTO,'
      '       G_TI.MENSAGEM,'
      '       G_TR.PERCENTUAL,'
      '       G_TR.DATA_INICIAL,'
      '       G_TR.HORA_INICIAL,'
      '       G_TR.DATA_FINAL,'
      '       G_TR.HORA_FINAL,'
      '       G_TR.REPETIR_SEGUNDA,'
      '       G_TR.REPETIR_TERCA,'
      '       G_TR.REPETIR_QUARTA,'
      '       G_TR.REPETIR_QUINTA,'
      '       G_TR.REPETIR_SEXTA,'
      '       G_TR.REPETIR_SABADO,'
      '       G_TR.REPETIR_DOMINGO,'
      '       G_TR.TERMINO_DATA,'
      '       G_TR.TERMINO_OCORRENCIAS,'
      '       G_TR.TIPO_TERMINO,'
      '       G_TI.TAREFA_ITEM_ID          AS ITEM_TAREFA_ITEM_ID,'
      '       G_TI.TAREFA_ID               AS ITEM_TAREFA_ID,'
      '       G_TI.SITUACAO                AS ITEM_SITUACAO,'
      '       G_TI.PERCENTUAL              AS ITEM_PERCENTUAL,'
      '       G_TI.DATA_INICIAL            AS ITEM_DATA_INICIAL,'
      '       G_TI.HORA_INICIAL            AS ITEM_HORA_INICIAL,'
      '       G_TI.DATA_FINAL              AS ITEM_DATA_FINAL,'
      '       G_TI.HORA_FINAL              AS ITEM_HORA_FINAL,'
      '       G_US.USUARIO_ID              AS USUARIO_ID,'
      '       G_US.NOME_COMPLETO           AS USUARIO_NOME'
      ''
      '  FROM G_TAREFA G_TR'
        ' INNER JOIN G_TAREFA_ITEM G_TI ON G_TR.TAREFA_ID = G_TI.TAREFA_I' +
        'D'
      ' INNER JOIN G_USUARIO G_US ON G_US.USUARIO_ID = G_TI.USUARIO_ID'
      ' WHERE G_TI.USUARIO_ID = :P_USUARIO_ID')
    Left = 193
    Top = 200
    ParamData = <
      item
        Name = 'P_USUARIO_ID'
        ParamType = ptInput
        Value = Null
      end>
    object QryTarefasTAREFA_ID: TBCDField
      FieldName = 'TAREFA_ID'
      Origin = 'TAREFA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object QryTarefasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object QryTarefasPERIODO_TIPO: TStringField
      FieldName = 'PERIODO_TIPO'
      Origin = 'PERIODO_TIPO'
      Size = 1
    end
    object QryTarefasTAREFA_GRUPO_ID: TBCDField
      FieldName = 'TAREFA_GRUPO_ID'
      Origin = 'TAREFA_GRUPO_ID'
      Precision = 18
      Size = 2
    end
    object QryTarefasDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object QryTarefasSERVENTIA: TBCDField
      FieldName = 'SERVENTIA'
      Origin = 'SERVENTIA'
      Precision = 18
      Size = 2
    end
    object QryTarefasASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Origin = 'ASSUNTO'
      Size = 260
    end
    object QryTarefasMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
      Origin = 'MENSAGEM'
    end
    object QryTarefasPERCENTUAL: TBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 3
    end
    object QryTarefasDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
    end
    object QryTarefasHORA_INICIAL: TSQLTimeStampField
      FieldName = 'HORA_INICIAL'
      Origin = 'HORA_INICIAL'
    end
    object QryTarefasDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
      Origin = 'DATA_FINAL'
    end
    object QryTarefasHORA_FINAL: TSQLTimeStampField
      FieldName = 'HORA_FINAL'
      Origin = 'HORA_FINAL'
    end
    object QryTarefasREPETIR_SEGUNDA: TStringField
      FieldName = 'REPETIR_SEGUNDA'
      Origin = 'REPETIR_SEGUNDA'
      Size = 1
    end
    object QryTarefasREPETIR_TERCA: TStringField
      FieldName = 'REPETIR_TERCA'
      Origin = 'REPETIR_TERCA'
      Size = 1
    end
    object QryTarefasREPETIR_QUARTA: TStringField
      FieldName = 'REPETIR_QUARTA'
      Origin = 'REPETIR_QUARTA'
      Size = 1
    end
    object QryTarefasREPETIR_QUINTA: TStringField
      FieldName = 'REPETIR_QUINTA'
      Origin = 'REPETIR_QUINTA'
      Size = 1
    end
    object QryTarefasREPETIR_SEXTA: TStringField
      FieldName = 'REPETIR_SEXTA'
      Origin = 'REPETIR_SEXTA'
      Size = 1
    end
    object QryTarefasREPETIR_SABADO: TStringField
      FieldName = 'REPETIR_SABADO'
      Origin = 'REPETIR_SABADO'
      Size = 1
    end
    object QryTarefasREPETIR_DOMINGO: TStringField
      FieldName = 'REPETIR_DOMINGO'
      Origin = 'REPETIR_DOMINGO'
      Size = 1
    end
    object QryTarefasTERMINO_DATA: TSQLTimeStampField
      FieldName = 'TERMINO_DATA'
      Origin = 'TERMINO_DATA'
    end
    object QryTarefasTERMINO_OCORRENCIAS: TBCDField
      FieldName = 'TERMINO_OCORRENCIAS'
      Origin = 'TERMINO_OCORRENCIAS'
      Precision = 18
      Size = 2
    end
    object QryTarefasTIPO_TERMINO: TStringField
      FieldName = 'TIPO_TERMINO'
      Origin = 'TIPO_TERMINO'
      Size = 1
    end
    object QryTarefasITEM_TAREFA_ITEM_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_TAREFA_ITEM_ID'
      Origin = 'TAREFA_ITEM_ID'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QryTarefasITEM_TAREFA_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_TAREFA_ID'
      Origin = 'TAREFA_ID'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QryTarefasITEM_SITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object QryTarefasITEM_PERCENTUAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_PERCENTUAL'
      Origin = 'PERCENTUAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object QryTarefasITEM_DATA_INICIAL: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_DATA_INICIAL'
      Origin = 'DATA_INICIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryTarefasITEM_HORA_INICIAL: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_HORA_INICIAL'
      Origin = 'HORA_INICIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryTarefasITEM_DATA_FINAL: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_DATA_FINAL'
      Origin = 'DATA_FINAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryTarefasITEM_HORA_FINAL: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM_HORA_FINAL'
      Origin = 'HORA_FINAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryTarefasUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      Precision = 18
      Size = 2
    end
    object QryTarefasUSUARIO_NOME: TStringField
      FieldName = 'USUARIO_NOME'
      Size = 120
    end
  end
  object DtsCalendario: TDataSource
    DataSet = TblCalendario
    Left = 341
    Top = 257
  end
  object TblCalendario: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ResourceID'
        DataType = ftInteger
      end
      item
        Name = 'ParentID'
        DataType = ftInteger
      end
      item
        Name = 'caption'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Start'
        DataType = ftDateTime
      end
      item
        Name = 'Finish'
        DataType = ftDateTime
      end
      item
        Name = 'State'
        DataType = ftInteger
      end
      item
        Name = 'ActualFinish'
        DataType = ftInteger
      end
      item
        Name = 'ActualStart'
        DataType = ftInteger
      end
      item
        Name = 'EventType'
        DataType = ftInteger
      end
      item
        Name = 'LabelColor'
        DataType = ftInteger
      end
      item
        Name = 'Location'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Message'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Options'
        DataType = ftInteger
      end
      item
        Name = 'RecurrenceIndex'
        DataType = ftInteger
      end
      item
        Name = 'RecurrenceInfo'
        DataType = ftBlob
      end
      item
        Name = 'ReminderDate'
        DataType = ftDateTime
      end
      item
        Name = 'ReminderMinutesBeforeStart'
        DataType = ftInteger
      end
      item
        Name = 'ReminderResourcesData'
        DataType = ftBlob
      end
      item
        Name = 'TaskCompleteField'
        DataType = ftInteger
      end
      item
        Name = 'TaskIndexField'
        DataType = ftInteger
      end
      item
        Name = 'TaskLinkField'
        DataType = ftBlob
      end
      item
        Name = 'TaskStatusField'
        DataType = ftInteger
      end
      item
        Name = 'GroupId'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 341
    Top = 200
    object TblCalendarioID: TIntegerField
      FieldName = 'ID'
    end
    object TblCalendarioResourceID: TIntegerField
      FieldName = 'ResourceID'
    end
    object TblCalendarioParentID: TIntegerField
      FieldName = 'ParentID'
    end
    object TblCalendariocaption: TStringField
      DisplayWidth = 255
      FieldName = 'caption'
      Size = 255
    end
    object TblCalendarioStart: TDateTimeField
      FieldName = 'Start'
    end
    object TblCalendarioFinish: TDateTimeField
      FieldName = 'Finish'
    end
    object TblCalendarioState: TIntegerField
      FieldName = 'State'
    end
    object TblCalendarioActualFinish: TIntegerField
      FieldName = 'ActualFinish'
    end
    object TblCalendarioActualStart: TIntegerField
      FieldName = 'ActualStart'
    end
    object TblCalendarioEventType: TIntegerField
      FieldName = 'EventType'
    end
    object TblCalendarioLabelColor: TIntegerField
      FieldName = 'LabelColor'
    end
    object TblCalendarioLocation: TStringField
      FieldName = 'Location'
      Size = 255
    end
    object TblCalendarioMessage: TStringField
      DisplayWidth = 255
      FieldName = 'Message'
      Size = 255
    end
    object TblCalendarioOptions: TIntegerField
      FieldName = 'Options'
    end
    object TblCalendarioRecurrenceIndex: TIntegerField
      FieldName = 'RecurrenceIndex'
    end
    object TblCalendarioRecurrenceInfo: TBlobField
      FieldName = 'RecurrenceInfo'
    end
    object TblCalendarioReminderDate: TDateTimeField
      FieldName = 'ReminderDate'
    end
    object TblCalendarioReminderMinutesBeforeStart: TIntegerField
      FieldName = 'ReminderMinutesBeforeStart'
    end
    object TblCalendarioReminderResourcesData: TBlobField
      FieldName = 'ReminderResourcesData'
    end
    object TblCalendarioTaskCompleteField: TIntegerField
      FieldName = 'TaskCompleteField'
    end
    object TblCalendarioTaskIndexField: TIntegerField
      FieldName = 'TaskIndexField'
    end
    object TblCalendarioTaskLinkField: TBlobField
      FieldName = 'TaskLinkField'
    end
    object TblCalendarioTaskStatusField: TIntegerField
      FieldName = 'TaskStatusField'
    end
    object TblCalendarioGroupId: TIntegerField
      FieldName = 'GroupId'
    end
  end
  object ppmCalendario: TPopupMenu
    Left = 341
    Top = 147
    object mniIncluirTarefa: TMenuItem
      Caption = 'Incluir Tarefa'
      OnClick = mniIncluirTarefaClick
    end
    object mniAlterarTarefa: TMenuItem
      Caption = 'Alterar Tarefa'
      OnClick = mniAlterarTarefaClick
    end
    object mniExcluirTarefa: TMenuItem
      Caption = 'Excluir Tarefa'
      OnClick = mniExcluirTarefaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniAlterarTarefaItem: TMenuItem
      Caption = 'Alterar Sub-Tarefa'
      OnClick = mniAlterarTarefaItemClick
    end
    object mniExcluirTarefaItem: TMenuItem
      Caption = 'Excluir Sub-Tarefa'
      OnClick = mniExcluirTarefaItemClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object scdFeriados: TcxSchedulerHolidays
    Locations = <
      item
        Name = 'Brasil'
        Visible = True
        Holidays = <
          item
            Date = 2.000000000000000000
            Name = 'Ano-Novo'
            RecurrenceData = {
              FFFFFFFF0100000000000000000000F0BF000100000003000000000000000001
              0000000100000000}
          end
          item
            Date = 122.000000000000000000
            Name = 'Dia do Trabalho'
            RecurrenceData = {
              FFFFFFFF0100000000000000000000F0BF000500000003000000000000000001
              0000000100000000}
          end
          item
            Date = 307.000000000000000000
            Name = 'Finados'
            RecurrenceData = {
              FFFFFFFF0200000000000000000000F0BF000B00000003000000000000000001
              0000000100000000}
          end
          item
            Date = 251.000000000000000000
            Name = 'Independ'#234'ncia do Brasil'
            RecurrenceData = {
              FFFFFFFF0700000000000000000000F0BF000900000003000000000000000001
              0000000100000000}
          end
          item
            Date = 360.000000000000000000
            Name = 'Natal'
            RecurrenceData = {
              FFFFFFFF1900000000000000000000F0BF000C00000003000000000000000001
              0000000100000000}
          end
          item
            Date = 286.000000000000000000
            Name = 'Nossa Senhora Aparecida'
            RecurrenceData = {
              FFFFFFFF0C00000000000000000000F0BF000A00000003000000000000000001
              0000000100000000}
          end
          item
            Date = 320.000000000000000000
            Name = 'Proclama'#231#227'o da Rep'#250'blica'
            RecurrenceData = {
              FFFFFFFF0F00000000000000000000F0BF000B00000003000000000000000001
              0000000100000000}
          end
          item
            Date = 112.000000000000000000
            Name = 'Tiradentes'
            RecurrenceData = {
              FFFFFFFF1500000000000000000000F0BF000400000003000000000000000001
              0000000100000000}
          end>
      end>
    Left = 341
    Top = 363
  end
  object TblListagem: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 265
    Top = 200
    object TblListagemTAREFA_ID: TIntegerField
      FieldName = 'TAREFA_ID'
    end
    object TblListagemTAREFA_ITEM_ID: TIntegerField
      FieldName = 'TAREFA_ITEM_ID'
    end
    object TblListagemASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 260
    end
    object TblListagemMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 260
    end
    object TblListagemDATA_INICIAL: TDateTimeField
      FieldName = 'DATA_INICIAL'
    end
    object TblListagemDATA_FINAL: TDateTimeField
      FieldName = 'DATA_FINAL'
    end
    object TblListagemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 30
    end
    object TblListagemPERCENTUAL: TCurrencyField
      FieldName = 'PERCENTUAL'
    end
    object TblListagemUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object TblListagemUSUARIO_NOME: TStringField
      FieldName = 'USUARIO_NOME'
      Size = 120
    end
  end
  object DtsListagem: TDataSource
    DataSet = TblListagem
    Left = 265
    Top = 256
  end
  object dtsResponsavelListSource: TDataSource
    DataSet = sqlResponsavelListSource
    Left = 534
    Top = 257
  end
  object sqlResponsavelListSource: TI9Query
    AutoCalcFields = False
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      ' SELECT FIRST 1'
      '        '#39'Todos'#39' NOME_COMPLETO'
      '      , -1 USUARIO_ID'
      '      , '#39#39' FUNCAO'
      '   FROM G_USUARIO'
      ''
      '  UNION ALL'
      ''
      ' SELECT NOME_COMPLETO'
      '      , USUARIO_ID'
      '      , FUNCAO'
      '   FROM G_USUARIO'
      '  WHERE SITUACAO = '#39'A'#39
      '  ORDER BY 2')
    Left = 534
    Top = 201
    object sqlResponsavelListSourceNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlResponsavelListSourceUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlResponsavelListSourceFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Size = 60
    end
  end
  object sqlResponsavel: TI9Query
    AutoCalcFields = False
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      ' SELECT FIRST 1'
      '        '#39'Todos'#39' NOME_COMPLETO'
      '      , -1 USUARIO_ID'
      '      , '#39#39' FUNCAO'
      '   FROM G_USUARIO'
      ''
      '  UNION ALL'
      ''
      ' SELECT NOME_COMPLETO'
      '      , USUARIO_ID'
      '      , FUNCAO'
      '   FROM G_USUARIO'
      '  WHERE SITUACAO = '#39'A'#39
      '  ORDER BY 2')
    Left = 422
    Top = 200
    object sqlResponsavelNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlResponsavelUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlResponsavelFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Size = 60
    end
  end
  object DtsResponsavel: TDataSource
    DataSet = sqlResponsavel
    Left = 422
    Top = 257
  end
  object ppmListagem: TPopupMenu
    Left = 263
    Top = 147
    object MniIncluirTarefaListagem: TMenuItem
      Caption = 'Incluir Tarefa'
      OnClick = MniIncluirTarefaListagemClick
    end
    object MniAlterarTarefaListagem: TMenuItem
      Caption = 'Alterar Tarefa'
      OnClick = MniAlterarTarefaListagemClick
    end
    object MniExcluirTarefaListagem: TMenuItem
      Caption = 'Excluir Tarefa'
      OnClick = MniExcluirTarefaListagemClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object MniAlterarSubTarefaListagem: TMenuItem
      Caption = 'Alterar Sub-Tarefa'
      OnClick = MniAlterarSubTarefaListagemClick
    end
    object MniExcluirSubTarefaListagem: TMenuItem
      Caption = 'Excluir Sub-Tarefa'
      OnClick = MniExcluirSubTarefaListagemClick
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
  end
end
