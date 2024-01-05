object frmGerenciadorCompromisso: TfrmGerenciadorCompromisso
  Left = 0
  Top = 0
  Caption = 'Gerenciador de Compromissos'
  ClientHeight = 558
  ClientWidth = 1025
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 553
    Height = 390
    Align = alLeft
    TabOrder = 0
    object splitFamilia: TcxSplitter
      Left = 1
      Top = 1
      Width = 551
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      DragThreshold = 2
      NativeBackground = False
      PositionAfterOpen = 59
      MinSize = 59
      Color = clGray
      ParentColor = False
    end
    object pgcTabCompromissos: TcxPageControl
      Left = 1
      Top = 9
      Width = 551
      Height = 380
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfOffice11
      ClientRectBottom = 380
      ClientRectRight = 551
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'Compromissos Agendados Mensais'
        ImageIndex = 0
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Caption = ' Compromissos do Centro Agendados'
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'Black'
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 0
          Height = 356
          Width = 551
          object cxLabel1: TcxLabel
            Left = 381
            Top = -4
            Cursor = crHandPoint
            Hint = 
              'Realiza o lan'#231'amento de todos os compromissos agedados para o s'#243 +
              'cio, de todos os Balancetes'
            Caption = 'Realizar Lan'#231'amento Mensal'
            ParentShowHint = False
            ShowHint = True
            Style.TextColor = clMaroon
            Style.TextStyle = [fsBold, fsUnderline]
            Transparent = True
            OnClick = cxLabel1Click
          end
          object pgcCompromissos: TcxPageControl
            Left = 3
            Top = 15
            Width = 545
            Height = 331
            Align = alClient
            TabOrder = 1
            Properties.ActivePage = tbcReserva
            Properties.CustomButtons.Buttons = <>
            LookAndFeel.Kind = lfUltraFlat
            ClientRectBottom = 331
            ClientRectRight = 545
            ClientRectTop = 24
            object cxTabSheet3: TcxTabSheet
              Caption = 'Compromisssos'
              ImageIndex = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object gdrCompromissoAgendado: TcxGrid
                Left = 0
                Top = 0
                Width = 547
                Height = 312
                Align = alClient
                PopupMenu = popCompromissoAgendado
                TabOrder = 0
                OnEnter = gdrCompromissoAgendadoEnter
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView2: TcxGridDBTableView
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
                  DataController.DataSource = dtsCompromissoMensal
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'VALOR'
                    end
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDevido'
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '#0.00'
                      Kind = skSum
                      FieldName = 'VALOR_ATUAL'
                      Column = cxGridDBTableValor
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnGrouping = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  Preview.Visible = True
                  Styles.Inactive = dtmControles.cxStyle40
                  object cxGridDBTableView2Column8: TcxGridDBColumn
                    DataBinding.FieldName = 'TODOS_SOCIOS'
                    RepositoryItem = dtmLookup.Combo_Obrigatorio
                    Width = 22
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView2Column5: TcxGridDBColumn
                    Caption = 'Situa'#231#227'o'
                    DataBinding.FieldName = 'SITUACAO'
                    RepositoryItem = dtmLookup.Combo_SituacaoCompGeral
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 62
                  end
                  object cxGridDBTableView2Column1: TcxGridDBColumn
                    Caption = 'Compromisso'
                    DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                    RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 148
                  end
                  object cxGridDBTableValor: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'VALOR_ATUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 50
                  end
                  object cxGridDBTableView2Column6: TcxGridDBColumn
                    Caption = 'Per'#237'odo'
                    DataBinding.FieldName = 'PERIODO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    RepositoryItem = dtmLookup.Combo_Periodo
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 55
                  end
                  object cxGridDBTableView2Column2: TcxGridDBColumn
                    Caption = 'Ref. Inicial'
                    DataBinding.FieldName = 'calc_AnoMesInicial'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 60
                  end
                  object cxGridDBTableView2Column3: TcxGridDBColumn
                    Caption = 'Ref. Final'
                    DataBinding.FieldName = 'calc_AnoMesFinal'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 58
                  end
                  object cxGridDBTableView2Column4: TcxGridDBColumn
                    Caption = 'Fixo'
                    DataBinding.FieldName = 'calc_Fixo'
                    RepositoryItem = dtmLookup.Combo_SimNao
                    Options.Filtering = False
                    SortIndex = 0
                    SortOrder = soDescending
                    Width = 46
                  end
                  object cxGridDBTableView2Column7: TcxGridDBColumn
                    Caption = 'Lan'#231'amento'
                    DataBinding.FieldName = 'calc_AnoMesLancamento'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Options.Filtering = False
                    Options.Grouping = False
                    Options.Sorting = False
                    Width = 64
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView2
                end
              end
            end
            object tbcReserva: TcxTabSheet
              Caption = 'Reserva(s) Vinculada(s)'
              Highlighted = True
              ImageIndex = 1
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 545
                Height = 43
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object cxLabel7: TcxLabel
                  Left = 9
                  Top = 0
                  Caption = 'Reserva'
                  ParentColor = False
                  Style.Color = clBtnFace
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object cxLabel2: TcxLabel
                  Left = 325
                  Top = 0
                  Caption = '% Percentual'
                  ParentColor = False
                  Style.Color = clBtnFace
                  Style.TextColor = 4210688
                  Transparent = True
                end
                object lcxReserva: TcxLookupComboBox
                  Left = 8
                  Top = 17
                  RepositoryItem = dtmLookup.Lista_ReservasAtivas
                  ParentFont = False
                  Properties.ListColumns = <>
                  Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                  TabOrder = 2
                  Width = 313
                end
                object edtPercentual: TcxCurrencyEdit
                  Left = 325
                  Top = 17
                  ParentFont = False
                  Properties.DisplayFormat = '% ,0.00;'
                  Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                  TabOrder = 3
                  Width = 79
                end
                object btnAdicionarReserva: TcxButton
                  Left = 406
                  Top = 16
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Hint = 'Adicionar Parcela'
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
                  ParentShowHint = False
                  ShowHint = True
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 4
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Orientation = 900
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnAdicionarReservaClick
                end
                object btnReservaExclui: TcxButton
                  Left = 437
                  Top = 16
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Hint = 'Excluir Parcela'
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
                    F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE8E9FF
                    FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFEDC5753E5FFFFFFFFFFFFFFFFFCA3379F
                    F5FFFDD6610D0467DFFFFFFFFFFFFFFBAB20022D9EF5FAA31500000A62DDFFFF
                    FFFFFCAA2900000146E6FEE2660800000A65E4FFFFFCAC290200002FB7FAFFFF
                    EF760F00000259DDF7A21D00000338C1FFFFFFFFFFEC72070000005F9A210000
                    0038BEFFFFFFFFFFFFFFED690C000008110000002CC2FFFFFFFFFFFFFFFFFFE3
                    6F0D000000000332B7FFFFFFFFFFFFFFFFFFFFFEDF56000000001CADFBFFFFFF
                    FFFFFFFFFFFFFFF7A52100000000095EDDFFFFFFFFFFFFFFFFFFFCA521000000
                    0200000056E4FFFFFFFFFFFFFFFBAB1D000000315A0C00000265DFFFFFFFFFFF
                    FCAA2900000030BBDE6E0A00000A62DDFFFFFFFCAC290200002DB8FBFEE26608
                    00000A67E5FFFAAD1F00000338C1FFFFFFFFEF750F00000256EAFBB831030038
                    BEFFFFFFFFFFFFEC720700136DEDFFF8B23630C2FFFFFFFFFFFFFFFFEC6A1F77
                    E7FFFFFFF8BDC7FFFFFFFFFFFFFFFFFFFFE5B1E7FFFFFFFFFFFCFEFFFFFFFFFF
                    FFFFFFFFFFFEFCFFFFFF}
                  ParentShowHint = False
                  ShowHint = True
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Orientation = 900
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnReservaExcluiClick
                end
              end
              object cxGrid1: TcxGrid
                Left = 0
                Top = 43
                Width = 545
                Height = 264
                Align = alClient
                PopupMenu = popCompromissoAgendado
                TabOrder = 1
                OnEnter = gdrCompromissoAgendadoEnter
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView5: TcxGridDBTableView
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
                  DataController.DataSource = dtsReservaCompromisso
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'VALOR'
                    end
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDevido'
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '% ,#0.00'
                      Kind = skSum
                      FieldName = 'PERCENTUAL'
                      Column = cxGridDBTableView5Column2
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnGrouping = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  Preview.Visible = True
                  Styles.Inactive = dtmControles.cxStyle40
                  object cxGridDBTableView5Column1: TcxGridDBColumn
                    Caption = 'Reserva'
                    DataBinding.FieldName = 'RESERVA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 457
                  end
                  object cxGridDBTableView5Column2: TcxGridDBColumn
                    Caption = '% Percentual'
                    DataBinding.FieldName = 'PERCENTUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = '% ,0.00;'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 88
                  end
                end
                object cxGridLevel5: TcxGridLevel
                  GridView = cxGridDBTableView5
                end
              end
            end
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Compromissos Lan'#231'ados/Conclu'#237'dos'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Caption = ' Compromissos Lan'#231'ados, Conclu'#237'dos e Cancelados'
          ParentFont = False
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'Office2007Black'
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'Office2007Black'
          TabOrder = 0
          Height = 356
          Width = 551
          object pgcCompromissos1: TcxPageControl
            Left = 3
            Top = 15
            Width = 545
            Height = 331
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = cxTabSheet5
            Properties.CustomButtons.Buttons = <>
            ExplicitLeft = 2
            ExplicitTop = 18
            ExplicitWidth = 547
            ExplicitHeight = 336
            ClientRectBottom = 331
            ClientRectRight = 545
            ClientRectTop = 24
            object cxTabSheet4: TcxTabSheet
              Caption = 'Compromisssos'
              ImageIndex = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object grdCompromissosLancados: TcxGrid
                Left = 0
                Top = 0
                Width = 547
                Height = 312
                Align = alClient
                PopupMenu = popLancados
                TabOrder = 0
                OnEnter = grdCompromissosLancadosEnter
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                object cxGridDBTableView1: TcxGridDBTableView
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
                  DataController.DataSource = dtsCompromissoLancado
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'VALOR'
                    end
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDevido'
                    end>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnGrouping = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  Preview.Visible = True
                  Styles.Inactive = dtmControles.cxStyle40
                  object cxGridDBTableView1Column2: TcxGridDBColumn
                    DataBinding.FieldName = 'TODOS_SOCIOS'
                    RepositoryItem = dtmLookup.Combo_Obrigatorio
                    Width = 24
                    IsCaptionAssigned = True
                  end
                  object cxGridDBTableView1Column1: TcxGridDBColumn
                    Caption = 'Situa'#231#227'o'
                    DataBinding.FieldName = 'SITUACAO'
                    RepositoryItem = dtmLookup.Combo_SituacaoCompGeral
                    Width = 95
                  end
                  object cxGridDBColumn2: TcxGridDBColumn
                    Caption = 'Compromisso'
                    DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                    RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                    Options.Filtering = False
                    Width = 169
                  end
                  object cxGridDBColumn3: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'VALOR_ATUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Filtering = False
                    Width = 58
                  end
                  object cxGridDBColumn4: TcxGridDBColumn
                    Caption = 'Per'#237'odo'
                    DataBinding.FieldName = 'PERIODO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    RepositoryItem = dtmLookup.Combo_Periodo
                    Options.Filtering = False
                    Width = 87
                  end
                  object cxGridDBColumn5: TcxGridDBColumn
                    Caption = 'Ref. Inicial'
                    DataBinding.FieldName = 'calc_AnoMesInicial'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Filtering = False
                    Width = 69
                  end
                  object cxGridDBColumn6: TcxGridDBColumn
                    Caption = 'Ref. Final'
                    DataBinding.FieldName = 'calc_AnoMesFinal'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    HeaderAlignmentHorz = taCenter
                    Options.Filtering = False
                    Width = 63
                  end
                end
                object cxGridLevel1: TcxGridLevel
                  GridView = cxGridDBTableView1
                end
              end
            end
            object cxTabSheet5: TcxTabSheet
              Caption = 'Reserva(s) Vinculada(s)'
              Highlighted = True
              ImageIndex = 1
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object cxGrid4: TcxGrid
                Left = 0
                Top = 0
                Width = 547
                Height = 312
                Align = alClient
                PopupMenu = popCompromissoAgendado
                TabOrder = 0
                OnEnter = gdrCompromissoAgendadoEnter
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView7: TcxGridDBTableView
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
                  DataController.DataSource = dtsReservaLancado
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'VALOR'
                    end
                    item
                      Format = 'R$ ,#0.00'
                      Kind = skSum
                      Position = spFooter
                      FieldName = 'calc_ValorDevido'
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '% ,#0.00'
                      Kind = skSum
                      FieldName = 'PERCENTUAL'
                      Column = cxGridDBColumn21
                    end>
                  DataController.Summary.SummaryGroups = <>
                  Filtering.MRUItemsListCount = 5
                  Filtering.ColumnPopup.MaxDropDownItemCount = 10
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsCustomize.ColumnGrouping = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glHorizontal
                  OptionsView.GroupByBox = False
                  OptionsView.GroupRowHeight = 25
                  OptionsView.GroupRowStyle = grsOffice11
                  Preview.Visible = True
                  Styles.Inactive = dtmControles.cxStyle40
                  object cxGridDBColumn20: TcxGridDBColumn
                    Caption = 'Reserva'
                    DataBinding.FieldName = 'RESERVA_ID'
                    RepositoryItem = dtmLookupContabil.Lista_ReservasAtivas
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 457
                  end
                  object cxGridDBColumn21: TcxGridDBColumn
                    Caption = '% Percentual'
                    DataBinding.FieldName = 'PERCENTUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = '% ,0.00;'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 88
                  end
                end
                object cxGridLevel7: TcxGridLevel
                  GridView = cxGridDBTableView7
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 20
    Width = 1025
    Height = 128
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    inline fmeCompromisso1: TfmeCompromisso
      Left = 1
      Top = 1
      Width = 1023
      Height = 126
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1023
      ExplicitHeight = 126
      inherited tabBalancete: TcxTabControl
        Width = 1023
        Height = 126
        Color = 14807280
        OnChange = fmeCompromisso1tabBalanceteChange
        ExplicitWidth = 1023
        ExplicitHeight = 126
        ClientRectBottom = 119
        ClientRectRight = 1016
        inherited Panel1: TPanel
          Width = 1013
          Height = 92
          ExplicitLeft = 3
          ExplicitTop = 27
          ExplicitWidth = 1013
          ExplicitHeight = 92
          inherited cxLabel1: TcxLabel
            Left = 188
            ExplicitLeft = 188
          end
          inherited cxLabel5: TcxLabel
            Left = 573
            ExplicitLeft = 573
          end
          inherited cxLabel6: TcxLabel
            Caption = 
              'Ocorr'#234'ncia                                                      ' +
              '                                  ______________________________' +
              '_____            '
            Style.IsFontAssigned = True
            ExplicitWidth = 566
          end
          inherited Panel2: TPanel
            Width = 1013
            ExplicitWidth = 1013
            inherited Panel3: TPanel
              Left = 828
              ExplicitLeft = 828
            end
            inherited btnEfetuarPagamento: TcxLabel
              Visible = False
            end
            inherited rdbCompromissosDiversos: TcxRadioButton
              OnClick = rdbCompromissosDiversosClick
            end
            inherited rdbCompromissosMensais: TcxRadioButton
              OnClick = rdbCompromissosMensaisClick
            end
          end
          inherited btnConfirmarCompromisso: TcxButton
            LookAndFeel.SkinName = ''
            OnClick = btnConfirmarCompromissoClick
          end
          inherited btnLimparCompromisso: TcxButton
            LookAndFeel.SkinName = ''
            OnClick = btnLimparCompromissoClick
          end
        end
      end
    end
    object chxTodos: TcxCheckBox
      Left = 605
      Top = 73
      Caption = 'Todos os S'#243'cios'
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      State = cbsChecked
      Style.TextStyle = [fsBold]
      TabOrder = 1
      Transparent = True
      Width = 116
    end
  end
  object TPanel
    Left = 0
    Top = 148
    Width = 1025
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Color = 14807280
    ParentBackground = False
    TabOrder = 2
    object cxProgress: TcxProgressBar
      Left = 269
      Top = 0
      Align = alClient
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 0
      Width = 756
    end
    object pnlImpressao: TPanel
      Left = 0
      Top = 0
      Width = 269
      Height = 20
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Inserindo Compromisso. Aguarde!!!'
      Color = 14807280
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 553
    Top = 168
    Width = 8
    Height = 390
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 60
    DragThreshold = 2
    NativeBackground = False
    PositionAfterOpen = 59
    MinSize = 59
    Control = Panel1
    Color = clGray
    ParentColor = False
  end
  object lblInformacaoLancamento: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    AutoSize = False
    Caption = #168'Gerenciador de Compromissos'#168
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Style.BorderStyle = ebsNone
    Style.Color = clWindow
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = False
    Style.TextColor = 4210688
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
    Height = 20
    Width = 1025
    AnchorX = 513
    AnchorY = 10
  end
  object cxBtnFechar: TcxButton
    Left = 950
    Top = 1
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
    TabOrder = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = cxBtnFecharClick
  end
  object pgcVinculo: TcxPageControl
    Left = 561
    Top = 168
    Width = 464
    Height = 390
    Align = alClient
    TabOrder = 6
    Properties.ActivePage = cxTabSheet6
    Properties.CustomButtons.Buttons = <>
    OnChange = pgcVinculoChange
    ClientRectBottom = 390
    ClientRectRight = 464
    ClientRectTop = 24
    object cxTabSheet6: TcxTabSheet
      Caption = 'Associados Vinculados ao Compromisso'
      ImageIndex = 0
      object cxGroupBox3: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = ' Associados Vinculados ao Compromisso Selecionado'
        ParentFont = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Coffee'
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Coffee'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Coffee'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Coffee'
        TabOrder = 0
        Height = 366
        Width = 464
        object pgcDados: TcxPageControl
          Left = 3
          Top = 16
          Width = 458
          Height = 342
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = tabAssociados
          Properties.CustomButtons.Buttons = <>
          OnChange = pgcDadosChange
          ClientRectBottom = 342
          ClientRectRight = 458
          ClientRectTop = 24
          object tabAssociados: TcxTabSheet
            Caption = 'Associados (Comp.Previsto)'
            ImageIndex = 0
            object cxGridCompromissos: TcxGrid
              Left = 0
              Top = 20
              Width = 458
              Height = 281
              Align = alClient
              PopupMenu = popCompromissos
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              object cxGridDBTableView3: TcxGridDBTableView
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
                OnCustomDrawCell = cxGridDBTableView3CustomDrawCell
                DataController.DataSource = dtsAssociados
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = 'Qtd.: 0'
                    Kind = skCount
                    FieldName = 'VALOR_ATUAL'
                    Column = cxGridDBAssociadoValor
                  end
                  item
                    Format = '%, #0.00'
                    Kind = skSum
                    FieldName = 'calc_porcet'
                    Column = cxGridDBAssociadoValor
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'Total:  ,#0.00'
                    Kind = skSum
                    FieldName = 'CALC_VALOR'
                    Column = cxGridDBAssociadoValor
                  end
                  item
                    Format = 'Qtd.: 0'
                    Kind = skCount
                    FieldName = 'PESSOA_ID'
                    Column = cxGridDBTableAssociado
                  end
                  item
                    Format = '% ,#0.00'
                    Kind = skSum
                    FieldName = 'calc_porcet'
                    Column = cxGridDBTableSituacao
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
                OptionsView.ColumnAutoWidth = True
                OptionsView.Footer = True
                OptionsView.GridLines = glHorizontal
                OptionsView.GroupByBox = False
                OptionsView.GroupRowHeight = 25
                OptionsView.GroupRowStyle = grsOffice11
                Preview.Visible = True
                Styles.GroupByBox = dtmControles.cxStyle7
                object cxGridDBTableAssociado: TcxGridDBColumn
                  Caption = 'Associado'
                  DataBinding.FieldName = 'NOME'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 183
                end
                object cxGridDBTableGrau: TcxGridDBColumn
                  Caption = 'Grau'
                  DataBinding.FieldName = 'GRAU'
                  RepositoryItem = dtmLookup.Combo_Grau
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 93
                end
                object cxGridDBAssociadoValor: TcxGridDBColumn
                  Caption = 'Valor'
                  DataBinding.FieldName = 'CALC_VALOR'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 68
                end
                object cxGridDBTableSituacao: TcxGridDBColumn
                  Caption = 'Situa'#231#227'o'
                  DataBinding.FieldName = 'SITUACAO_LOCAL'
                  RepositoryItem = dtmLookup.Combo_SituacaoCompLocal
                  Width = 77
                end
                object cxGridDBTablePorcentagem: TcxGridDBColumn
                  DataBinding.FieldName = 'calc_porcet'
                  Visible = False
                  IsCaptionAssigned = True
                end
              end
              object cxGridLevel3: TcxGridLevel
                GridView = cxGridDBTableView3
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 458
              Height = 20
              Align = alTop
              Color = clWindow
              ParentBackground = False
              TabOrder = 1
              object btnImprimir: TSpeedButton
                Left = 2
                Top = -4
                Width = 19
                Height = 21
                Cursor = crHandPoint
                Hint = 'Adicionar Associado ao Agendamento Selecionado'
                Flat = True
                Glyph.Data = {
                  7E010000424D7E010000000000007E0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000120000001200000000000000FFFF
                  FF00FF00FF00E2DEDE00669A3200E6E6E600D2D2D200C6C6C600B6B6B600A6A6
                  A6009A9A9A008A8A8A007E7E7E006E6E6E005E5E5E0044444400323232002626
                  2600020202020202020202020202020202020202020F0F0F0F0F0F0F0F0F0F02
                  020202020F110505050505050505110F0202020F100D06060606060606060D10
                  0F02020F0A0C0E0E0E0E0E0E0E0E0C0A0F02020F0B0B0B0B0B0B0B0B0B0B0B0B
                  0F02020F0808080808080808080808080F02020F070707070707070707070407
                  0F02020F0606060606060606060606060F02020F06090B0B0B0B0B0B0B0B0906
                  0F02020F0809050303050505050509080F0202020F0C06060606060606060C0F
                  02020202020F06060606060606060F0202020202020F06060606060606090F02
                  02020202020F0F0F0F0F0F0F0F0F020202020202020202020202020202020202
                  0202}
                ParentShowHint = False
                ShowHint = True
                OnClick = btnImprimirClick
              end
              object btnAdAssociado: TSpeedButton
                Left = 289
                Top = -2
                Width = 19
                Height = 21
                Cursor = crHandPoint
                Hint = 'Adicionar Associado ao Agendamento Selecionado'
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000E7C6A5E7C6A5
                  E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6
                  A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5D0BF9993AB775293513D
                  8B443A8940488C468BA46DCDBC95E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
                  E7C6A5B3B78C549A5A40984F7CC18E95D0A595CFA577BD88358C413D873EA9AF
                  7FE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5B6B98F539D5F63B377A7DBB486CC9765
                  BB7C63B97B85CB97A4D9B357A96A338338A9AF7FE7C6A5E7C6A5E7C6A5D4C29D
                  64A66C69B87CA7DBB15FBB765BB97258B76F58B46E57B46E5AB673A4D9B259A9
                  6B3E883FCEBC95E7C6A5E7C6A5A2B78A52AA67A9DDB363C0785EBD705FBB76FF
                  FFFFFFFFFF58B76F57B46D5BB673A5DAB3378E428AA46DE7C6A5E7C6A573AF7B
                  89CC9788D3956AC57962C06F54AA64FFFFFFFFFFFF58B76F58B76F5AB87184CC
                  967ABD8C498D47E7C6A5E7C6A569AF7BA8DDB27CCF8974CC80FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF58B76F66BD7C9BD4AA398940E7C6A5E7C6A56CB27E
                  B5E2BD8AD59679C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58B76F68C0
                  7D9CD4A93D8C45E7C6A5E7C6A57DB787ABDDB5A5DFAE80CB8B7BC9856DBC78FF
                  FFFFFFFFFF5AAB695FBB765BB9728AD1987FC491539553E7C6A5E7C6A5ACBF96
                  84C796D2EED794D99F89D3937EC888FFFFFFFFFFFF78CD846AC27B6EC77DABDF
                  B4449D5694AB79E7C6A5E7C6A5D7C4A17BB989A9DAB6D8F1DC91D89C87CD9283
                  CC8D8AD49589D49482D28DAEE0B66AB87C579C5DD1BF9AE7C6A5E7C6A5E7C6A5
                  C1C29C74B887AEDCBADCF2E0B5E4BC9ADBA495D99FA4DFAEBFE8C478C189569F
                  61B4B88DE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5C1C29C7CB88993CEA3C2E6CBCF
                  EBD4C9E9CEAEDDB76CB87E65A76EB7BA90E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
                  E7C6A5E7C6A5D7C4A1ADBF967EB7886FB3816CB17D75B17DA4B88CD4C29DE7C6
                  A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7
                  C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5}
                ParentShowHint = False
                ShowHint = True
                OnClick = btnReservarAdicionClick
              end
              object btnRemoverAssociado: TSpeedButton
                Left = 309
                Top = -2
                Width = 19
                Height = 21
                Cursor = crHandPoint
                Hint = 'Remove o Associado do Agendamento Selecionado'
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
                  8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000008C00396BFF000010FF000018FF000018FF000018EF000018E7000018
                  DE000018CE000018C6000018BD0000008C00FF00FF00FF00FF00FF00FF00FF00
                  FF0000008C0094B5FF004A63FF004A6BFF004A6BFF004A6BFF004A6BF7004A6B
                  EF00395AE7003152DE00315ADE0000008C00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
                  8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                ParentShowHint = False
                ShowHint = True
                OnClick = btnRemoverAssociadoClick
              end
              object lblExpandirDados: TcxLabel
                Left = 98
                Top = 0
                Cursor = crHandPoint
                Caption = 'Expandir Dados'
                DragCursor = crHandPoint
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clBlue
                Style.TextStyle = [fsUnderline]
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.TextColor = clNavy
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.TextColor = clMaroon
                Transparent = True
                OnClick = lblExpandirDadosClick
              end
              object lblJuntarDados: TcxLabel
                Left = 26
                Top = 0
                Cursor = crHandPoint
                Caption = 'Juntar Dados'
                DragCursor = crHandPoint
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlue
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clBlue
                Style.TextStyle = [fsUnderline]
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.TextColor = clNavy
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.TextColor = clMaroon
                Transparent = True
                OnClick = lblJuntarDadosClick
              end
              object chxValor: TcxCheckBox
                Left = 180
                Top = -2
                Caption = 'Agrupar Por Valor'
                TabOrder = 2
                Transparent = True
                OnClick = chxValorClick
                Width = 107
              end
            end
            object chxSelecaoMultipla: TCheckBox
              Left = 0
              Top = 301
              Width = 458
              Height = 17
              Align = alBottom
              Caption = 'Sele'#231#227'o Multipla (Exporta'#231#227'o)'
              Color = 14807280
              ParentColor = False
              TabOrder = 2
              OnClick = chxSelecaoMultiplaClick
            end
          end
          object tabCompromissos: TcxTabSheet
            Caption = 'Comp. Pendentes/Quitados/Isentos'
            ImageIndex = 1
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 335
            object cxGrid3: TcxGrid
              Left = 0
              Top = 29
              Width = 460
              Height = 293
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
              ExplicitHeight = 306
              object cxGridDBTableView4: TcxGridDBTableView
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
                DataController.DataSource = dtsCompromissoRealizado
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    Position = spFooter
                    FieldName = 'VALOR'
                  end
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    Position = spFooter
                    FieldName = 'calc_ValorDevido'
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    FieldName = 'VALOR_ATUAL'
                    Column = cxGridDBValor
                  end
                  item
                    Format = 'Qtd.: 0'
                    Kind = skCount
                    FieldName = 'COMPROMISSO_VENCIDO_ID'
                    Column = cxGridDBTableNome
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
                OptionsSelection.MultiSelect = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.Footer = True
                OptionsView.GridLines = glHorizontal
                OptionsView.GroupByBox = False
                OptionsView.GroupRowHeight = 25
                OptionsView.GroupRowStyle = grsOffice11
                Preview.Visible = True
                object cxGridDBTableNome: TcxGridDBColumn
                  Caption = 'Associado'
                  DataBinding.FieldName = 'NOME'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 160
                end
                object cxGridDBValor: TcxGridDBColumn
                  Caption = 'Valor'
                  DataBinding.FieldName = 'VALOR_ATUAL'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Options.Editing = False
                  Options.Filtering = False
                  Options.Focusing = False
                  Width = 55
                end
                object cxGridDBColumn8: TcxGridDBColumn
                  Caption = 'Situa'#231#227'o'
                  DataBinding.FieldName = 'SITUACAO'
                  RepositoryItem = dtmLookup.Combo_SituacaoPagamento
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 65
                end
                object cxGridDBColumn10: TcxGridDBColumn
                  Caption = '#'
                  DataBinding.FieldName = 'DIFERENCA'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  RepositoryItem = dtmLookup.Combo_SimNaoDiferenca
                  HeaderAlignmentHorz = taCenter
                  HeaderGlyphAlignmentHorz = taCenter
                  Options.Editing = False
                  Options.Filtering = False
                  Options.Focusing = False
                  Width = 20
                end
                object cxGridDBColumn11: TcxGridDBColumn
                  Caption = '+'
                  DataBinding.FieldName = 'QTD_ADICIONAL'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taBottomJustify
                  Properties.DisplayFormat = '0'
                  HeaderAlignmentHorz = taCenter
                  HeaderGlyphAlignmentHorz = taCenter
                  Options.Editing = False
                  Options.Filtering = False
                  Options.Focusing = False
                  Width = 20
                end
                object cxGridDBColumn12: TcxGridDBColumn
                  Caption = 'Refer'#234'ncia'
                  DataBinding.FieldName = 'calc_referencia'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 60
                end
                object cxGridDBColumn7: TcxGridDBColumn
                  Caption = 'Dt. Pag'
                  DataBinding.FieldName = 'DATA_REALIZACAO'
                  Options.Editing = False
                  Options.Filtering = False
                  Options.Focusing = False
                  Width = 41
                end
              end
              object cxGridLevel4: TcxGridLevel
                GridView = cxGridDBTableView4
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 460
              Height = 29
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Color = 14807280
              Enabled = False
              ParentBackground = False
              TabOrder = 1
              object lcxCompromissoMostrar: TcxLookupComboBox
                Left = 6
                Top = 4
                RepositoryItem = dtmLookup.Lista_PlanoContasTodos
                ParentFont = False
                Properties.ListColumns = <>
                Style.BorderStyle = ebsUltraFlat
                Style.LookAndFeel.NativeStyle = False
                Style.LookAndFeel.SkinName = ''
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                Style.ButtonTransparency = ebtHideInactive
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.SkinName = ''
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.SkinName = ''
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.SkinName = ''
                TabOrder = 0
                Width = 251
              end
              object icxSituacaoMostrar: TcxImageComboBox
                Left = 260
                Top = 4
                RepositoryItem = dtmLookup.Combo_SituacaoCompGeral
                Properties.Items = <>
                Style.BorderStyle = ebsUltraFlat
                Style.LookAndFeel.NativeStyle = False
                Style.LookAndFeel.SkinName = ''
                Style.ButtonStyle = btsDefault
                Style.ButtonTransparency = ebtHideInactive
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleDisabled.LookAndFeel.SkinName = ''
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.SkinName = ''
                StyleHot.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.SkinName = ''
                TabOrder = 1
                Width = 121
              end
            end
          end
        end
      end
    end
    object cxTabSheet7: TcxTabSheet
      Caption = 'Reajuste(s) Programado(s)'
      ImageIndex = 1
      ExplicitLeft = -2
      ExplicitTop = 29
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 464
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 8
        object rdbAjusteMesAtual: TcxRadioButton
          Left = 9
          Top = 7
          Width = 72
          Height = 17
          Caption = 'M'#234's Atual'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rdbAjusteMesAtualClick
          LookAndFeel.Kind = lfUltraFlat
        end
        object rdbAjusteProximoMes: TcxRadioButton
          Left = 87
          Top = 7
          Width = 82
          Height = 17
          Caption = 'Pr'#243'ximo M'#234's'
          TabOrder = 1
          OnClick = rdbAjusteProximoMesClick
          LookAndFeel.Kind = lfUltraFlat
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 30
        Width = 464
        Height = 336
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        ExplicitLeft = -2
        object cxGridDBTableView6: TcxGridDBTableView
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
          DataController.DataSource = dtsAjusteProgramado
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'VALOR'
            end
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'calc_ValorDevido'
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'VALOR_ATUAL'
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          object cxGridDBTableView4Column1: TcxGridDBColumn
            Caption = 'Associado'
            DataBinding.FieldName = 'NOME'
            Width = 146
          end
          object cxGridDBTableView4Column2: TcxGridDBColumn
            Caption = 'Ano/Mes'
            DataBinding.FieldName = 'calc_AnoMes'
            Width = 88
          end
          object cxGridDBTableView4Column3: TcxGridDBColumn
            Caption = 'Situa'#231#227'o Anterior'
            DataBinding.FieldName = 'SITUACAO_ANTERIOR'
            RepositoryItem = dtmLookup.Combo_SituacaoCompLocal
            Width = 76
          end
          object cxGridDBTableView4Column4: TcxGridDBColumn
            Caption = 'Valor Anterior'
            DataBinding.FieldName = 'VALOR_ANTERIOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 73
          end
          object cxGridDBTableView6Column1: TcxGridDBColumn
            Caption = 'Valor Atual'
            DataBinding.FieldName = 'VALOR_ATUAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Focusing = False
            Styles.Header = dtmControles.cxStyle12
            Width = 75
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = cxGridDBTableView6
        end
      end
    end
    object cxTabSheet8: TcxTabSheet
      Caption = 'Total por Associado'
      ImageIndex = 2
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGridTotalAssociados: TcxGrid
        Left = 0
        Top = 30
        Width = 464
        Height = 336
        Align = alClient
        PopupMenu = popCompromissos
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        object cxGridDBTableView8: TcxGridDBTableView
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
          DataController.DataSource = dtsTotalAssociado
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'Qtd.: 0'
              Kind = skCount
              FieldName = 'VALOR'
              Column = cxGridDBColumn13
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total:  ,#0.00'
              Kind = skSum
              FieldName = 'VALOR'
              Column = cxGridDBColumn13
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          Styles.GroupByBox = dtmControles.cxStyle7
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Associado'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Focusing = False
            Width = 183
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Grau'
            DataBinding.FieldName = 'GRAU'
            RepositoryItem = dtmLookup.Combo_Grau
            Options.Editing = False
            Options.Focusing = False
            Width = 93
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Focusing = False
            Width = 68
          end
        end
        object cxGridLevel8: TcxGridLevel
          GridView = cxGridDBTableView8
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 464
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object cbxCompromisso: TcxCheckComboBox
          Left = 5
          Top = 5
          ParentFont = False
          Properties.Delimiter = ','
          Properties.EmptySelectionText = 'Todos compromissos do Associado'
          Properties.EditValueFormat = cvfIndices
          Properties.Items = <
            item
            end>
          Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
          TabOrder = 0
          Width = 340
        end
        object btnPesquisarAssociado: TcxButton
          Left = 348
          Top = 4
          Width = 95
          Height = 22
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
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnPesquisarAssociadoClick
        end
      end
      object cbxPesquisaCompromisso: TcxCheckComboBox
        Left = 394
        Top = 51
        Properties.Delimiter = ','
        Properties.EditValueFormat = cvfIndices
        Properties.Items = <
          item
          end>
        TabOrder = 2
        Visible = False
        Width = 67
      end
    end
  end
  object sqlCompromissoLancado: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM T_LANCAMENTO_COMPROMISSO'#13#10'WHERE SITUACAO IN ('#39'3'#39',' +
      ' '#39'4'#39')'#13#10'   AND CEDENTE_ID = :CEDENTE_ID'#13#10'   AND BALANCETE_GRUPO_I' +
      'D = :BALANCETE_GRUPO_ID'#13#10'ORDER BY LANCAMENTO_COMPROMISSO_ID DESC'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlCompromissoLancadoAfterScroll
    OnCalcFields = sqlCompromissoLancadoCalcFields
    Left = 584
    Top = 252
    object sqlCompromissoLancadocalc_AnoMesFinal: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesFinal'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoLancadocalc_AnoMesInicial: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesInicial'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoLancadoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissoLancadoDATA_REGISTRO: TSQLTimeStampField
      FieldName = 'DATA_REGISTRO'
    end
    object sqlCompromissoLancadoANO_MES_INICIAL: TStringField
      FieldName = 'ANO_MES_INICIAL'
      Size = 10
    end
    object sqlCompromissoLancadoPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object sqlCompromissoLancadoVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoLancadoVALOR_ANTERIOR: TFMTBCDField
      FieldName = 'VALOR_ANTERIOR'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoLancadoANO_MES_FINAL: TStringField
      FieldName = 'ANO_MES_FINAL'
      Size = 10
    end
    object sqlCompromissoLancadoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoLancadoANO_MES_LANCAMENTO: TStringField
      FieldName = 'ANO_MES_LANCAMENTO'
      Size = 10
    end
    object sqlCompromissoLancadoTODOS_SOCIOS: TStringField
      FieldName = 'TODOS_SOCIOS'
      Size = 1
    end
    object sqlCompromissoLancadoBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompromissoLancado: TDataSource
    DataSet = sqlCompromissoLancado
    Left = 584
    Top = 284
  end
  object sqlCompromissoMensal: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM T_LANCAMENTO_COMPROMISSO'#13#10'WHERE SITUACAO IN ('#39'1'#39',' +
      ' '#39'2'#39')'#13#10'    AND CEDENTE_ID = :CEDENTE_ID'#13#10'    AND BALANCETE_GRUPO' +
      '_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY ANO_MES_INICIAL'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlCompromissoMensalAfterScroll
    OnCalcFields = sqlCompromissoMensalCalcFields
    Left = 476
    Top = 200
    object sqlCompromissoMensalcalc_AnoMesFinal: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesFinal'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoMensalcalc_AnoMesInicial: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesInicial'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissoMensalDATA_REGISTRO: TSQLTimeStampField
      FieldName = 'DATA_REGISTRO'
    end
    object sqlCompromissoMensalANO_MES_INICIAL: TStringField
      FieldName = 'ANO_MES_INICIAL'
      Size = 10
    end
    object sqlCompromissoMensalPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object sqlCompromissoMensalVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoMensalVALOR_ANTERIOR: TFMTBCDField
      FieldName = 'VALOR_ANTERIOR'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoMensalANO_MES_FINAL: TStringField
      FieldName = 'ANO_MES_FINAL'
      Size = 10
    end
    object sqlCompromissoMensalCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalcalc_Fixo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Fixo'
      Size = 1
      Calculated = True
    end
    object sqlCompromissoMensalcalc_AnoMesLancamento: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMesLancamento'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoMensalANO_MES_LANCAMENTO: TStringField
      FieldName = 'ANO_MES_LANCAMENTO'
      Size = 10
    end
    object sqlCompromissoMensalTODOS_SOCIOS: TStringField
      FieldName = 'TODOS_SOCIOS'
      Size = 1
    end
    object sqlCompromissoMensalCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalREAJUSTE_AUTOMATICO: TStringField
      FieldName = 'REAJUSTE_AUTOMATICO'
      Size = 1
    end
  end
  object dtsCompromissoMensal: TDataSource
    DataSet = sqlCompromissoMensal
    Left = 476
    Top = 232
  end
  object popCompromissoAgendado: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 476
    Top = 264
    object popAtivar: TMenuItem
      AutoCheck = True
      Caption = 'Compromisso Ativado'
      OnClick = popAtivarClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object popReajustarValorAgendado: TMenuItem
      Caption = 'Reajustar Valor do Compromisso'
      ImageIndex = 53
      OnClick = popReajustarValorAgendadoClick
    end
    object popDesfazerReajuste: TMenuItem
      Caption = 'Desfazer Reajuste'
      OnClick = popDesfazerReajusteClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object popExcluirAgendado: TMenuItem
      Caption = 'Excluir  Compromisso'
      ImageIndex = 15
      OnClick = popExcluirAgendadoClick
    end
    object popCancelarCompromisso: TMenuItem
      Caption = 'Cancelar Compromisso'
      ImageIndex = 17
      OnClick = popCancelarCompromissoClick
    end
    object popDesativarCompromisso: TMenuItem
      Caption = 'Desativar/Cancelar Compromisso Mensal'
      OnClick = popDesativarCompromissoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popIniciarAgendamento: TMenuItem
      Caption = 'Iniciar Agendamento'
      OnClick = RealizarLanamentoIndividual1Click
    end
  end
  object popLancados: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 512
    Top = 264
    object popLancadoModificarValor: TMenuItem
      Caption = 'Modificar Valor Lan'#231'ado'
      ImageIndex = 54
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object popLancadoEstornar: TMenuItem
      Caption = 'Estornar  Lan'#231'amento de Compromisso'
      Enabled = False
      ImageIndex = 46
      OnClick = popLancadoEstornarClick
    end
    object popLancadoCancelar: TMenuItem
      Caption = 'Cancelar Compromisso'
      ImageIndex = 7
      OnClick = popLancadoCancelarClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Renovar1: TMenuItem
      Caption = 'Renovar Agendamento'
      OnClick = Renovar1Click
    end
    object popLancadoReativar: TMenuItem
      Caption = 'Reativar Compromisso'
      OnClick = popLancadoReativarClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object VincularReservadoMs1: TMenuItem
      Caption = 'Vincular Reserva do M'#234's do Compromisso (Atualiza'#231#227'o)'
      OnClick = VincularReservadoMs1Click
    end
  end
  object sqlPessoasAtualiza: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT PESSOA_ID'#13#10'FROM T_PESSOA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 580
    Top = 428
    object sqlPessoasAtualizaPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
  end
  object sqlAssociados: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT LC.PESSOA_ID, LC.SITUACAO_LOCAL, LC.VALOR_ATUAL,'#13#10'       ' +
      '      LC.LANCAMENTO_COMPROMISSO_ID, P.NOME, LC.COMPROMISSO_AGEND' +
      'ADO_ID,'#13#10'             LC.BALANCETE_GRUPO_ID, LC.CEDENTE_ID, P.GR' +
      'AU'#13#10'FROM T_COMPROMISSO_AGENDADO LC LEFT OUTER JOIN T_PESSOA P ON' +
      #13#10'      LC.PESSOA_ID = P.PESSOA_ID'#13#10'WHERE LC.LANCAMENTO_COMPROMI' +
      'SSO_ID = :LANCAMENTO_COMPROMISSO_ID'#13#10'    AND P.SITUACAO IN ('#39'1'#39',' +
      ' '#39'3'#39')'#13#10'    AND LC.CEDENTE_ID = :CEDENTE_ID'#13#10'    AND LC.BALANCETE' +
      '_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY P.NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'LANCAMENTO_COMPROMISSO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterPost = sqlAssociadosAfterPost
    OnCalcFields = sqlAssociadosCalcFields
    Left = 512
    Top = 200
    object sqlAssociadosPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosSITUACAO_LOCAL: TStringField
      FieldName = 'SITUACAO_LOCAL'
      Size = 1
    end
    object sqlAssociadosVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlAssociadosLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlAssociadosCOMPROMISSO_AGENDADO_ID: TFMTBCDField
      FieldName = 'COMPROMISSO_AGENDADO_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadoscalc_porcet: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_porcet'
      Calculated = True
    end
    object sqlAssociadosGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object sqlAssociadosCALC_VALOR: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR'
      Calculated = True
    end
  end
  object dtsAssociados: TDataSource
    DataSet = sqlAssociados
    Left = 512
    Top = 232
  end
  object sqlCompromissoRealizado: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.OnCalcFields = sqlCompromissoRealizadoInternalDataSetCalcFields
    DataSet.CommandText = 
      'SELECT CV.*, P.NOME'#13#10'FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JO' +
      'IN T_PESSOA P ON'#13#10'   CV.PESSOA_ID = P.PESSOA_ID'#13#10'ORDER BY P.NOME' +
      ', ANO_MES_REFERENCIA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = sqlCompromissoRealizadoCalcFields
    Left = 616
    Top = 252
    object sqlCompromissoRealizadoPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadocalc_referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_referencia'
      Size = 10
      Calculated = True
    end
    object sqlCompromissoRealizadoVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlCompromissoRealizadoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoDIFERENCA: TStringField
      FieldName = 'DIFERENCA'
      Size = 1
    end
    object sqlCompromissoRealizadoQTD_ADICIONAL: TFMTBCDField
      FieldName = 'QTD_ADICIONAL'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoRealizadoATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_REALIZACAO'
    end
    object sqlCompromissoRealizadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompromissoRealizado: TDataSource
    DataSet = sqlCompromissoRealizado
    Left = 616
    Top = 284
  end
  object popCompromissos: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 584
    Top = 320
    object ExportalExcel1: TMenuItem
      Caption = 'Exportal Excel'
      ImageIndex = 61
      OnClick = ExportalExcel1Click
    end
  end
  object sqlReservaCompromisso: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM T_CONTABIL_RESERVA'#13#10'WHERE LANCAMENTO_COMPROMISSO_' +
      'ID = :LANCAMENTO_COMPROMISSO_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'LANCAMENTO_COMPROMISSO_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'LANCAMENTO_COMPROMISSO_ID'
    MasterFields = 'LANCAMENTO_COMPROMISSO_ID'
    MasterSource = dtsCompromissoMensal
    PacketRecords = 0
    Params = <>
    AfterScroll = sqlReservaCompromissoAfterScroll
    Left = 324
    Top = 200
    object sqlReservaCompromissoCONTABIL_RESERVA_ID: TFMTBCDField
      FieldName = 'CONTABIL_RESERVA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlReservaCompromissoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlReservaCompromissoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Precision = 20
      Size = 2
    end
    object sqlReservaCompromissoRESERVA_ID: TFMTBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlReservaCompromissoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsReservaCompromisso: TDataSource
    DataSet = sqlReservaCompromisso
    Left = 324
    Top = 256
  end
  object sqlReservaLancado: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM T_CONTABIL_RESERVA'#13#10'WHERE LANCAMENTO_COMPROMISSO_' +
      'ID = :LANCAMENTO_COMPROMISSO_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'LANCAMENTO_COMPROMISSO_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'LANCAMENTO_COMPROMISSO_ID'
    MasterFields = 'LANCAMENTO_COMPROMISSO_ID'
    MasterSource = dtsCompromissoLancado
    PacketRecords = 0
    Params = <>
    AfterScroll = sqlReservaCompromissoAfterScroll
    Left = 420
    Top = 328
    object sqlReservaLancadoCONTABIL_RESERVA_ID: TFMTBCDField
      FieldName = 'CONTABIL_RESERVA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlReservaLancadoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlReservaLancadoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Precision = 20
      Size = 2
    end
    object sqlReservaLancadoRESERVA_ID: TFMTBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlReservaLancadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField
      FieldName = 'LANCAMENTO_COMPROMISSO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsReservaLancado: TDataSource
    DataSet = sqlReservaLancado
    Left = 420
    Top = 384
  end
  object sqlAjusteProgramado: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT PA.*, P.NOME, CA.VALOR_ATUAL'#13#10'FROM T_PROGRAMACAO_AJUSTE P' +
      'A'#13#10'  INNER JOIN T_COMPROMISSO_AGENDADO CA ON'#13#10'  PA.COMPROMISSO_A' +
      'GENDADO_ID = CA.COMPROMISSO_AGENDADO_ID'#13#10'  INNER JOIN T_PESSOA P' +
      ' ON'#13#10'  PA.PESSOA_ID = P.PESSOA_ID'#13#10'WHERE CA.LANCAMENTO_COMPROMIS' +
      'SO_ID = :LANCAMENTO_COMPROMISSO_ID'#13#10'   AND PA.ANO_MES = :ANOMES'#13 +
      #10'ORDER BY PA.PROGRAMACAO_AJUSTE_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'LANCAMENTO_COMPROMISSO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ANOMES'
        ParamType = ptInput
      end>
    Params = <>
    Left = 824
    Top = 240
    object sqlAjusteProgramadoPROGRAMACAO_AJUSTE_ID: TFMTBCDField
      FieldName = 'PROGRAMACAO_AJUSTE_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlAjusteProgramadoCOMPROMISSO_AGENDADO_ID: TFMTBCDField
      FieldName = 'COMPROMISSO_AGENDADO_ID'
      Precision = 20
      Size = 2
    end
    object sqlAjusteProgramadoCOMPROMISSO_REAJUSTAR: TStringField
      FieldName = 'COMPROMISSO_REAJUSTAR'
      Size = 1
    end
    object sqlAjusteProgramadoCOMPROMISSO_SITUACAO: TStringField
      FieldName = 'COMPROMISSO_SITUACAO'
      Size = 1
    end
    object sqlAjusteProgramadoANO_MES: TStringField
      FieldName = 'ANO_MES'
      Size = 10
    end
    object sqlAjusteProgramadoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlAjusteProgramadocalc_AnoMes: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_AnoMes'
      Size = 10
      Calculated = True
    end
    object sqlAjusteProgramadoPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlAjusteProgramadoVALOR_ANTERIOR: TFMTBCDField
      FieldName = 'VALOR_ANTERIOR'
      Precision = 20
      Size = 3
    end
    object sqlAjusteProgramadoSITUACAO_ANTERIOR: TStringField
      FieldName = 'SITUACAO_ANTERIOR'
      Size = 1
    end
    object sqlAjusteProgramadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlAjusteProgramadoVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
  end
  object dtsAjusteProgramado: TDataSource
    DataSet = sqlAjusteProgramado
    Left = 824
    Top = 296
  end
  object sqlTotalAssociado: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT P.NOME, P.GRAU, SUM(COALESCE(CA.VALOR_ATUAL,0)) AS VALOR'#13 +
      #10'FROM T_PESSOA P '#13#10'  LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA O' +
      'N'#13#10'  CA.PESSOA_ID = P.PESSOA_ID'#13#10'WHERE P.SITUACAO = '#39'1'#39#13#10'  AND (' +
      '(CA.SITUACAO_GERAL = '#39'1'#39') or (CA.SITUACAO_GERAL IS NULL))'#13#10'GROUP' +
      ' BY P.NOME, P.GRAU'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 284
    Top = 328
    object sqlTotalAssociadoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlTotalAssociadoGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object sqlTotalAssociadoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
  end
  object dtsTotalAssociado: TDataSource
    DataSet = sqlTotalAssociado
    Left = 284
    Top = 384
  end
end
