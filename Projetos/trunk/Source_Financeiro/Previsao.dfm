object frmPrevisao: TfrmPrevisao
  Left = 0
  Top = 0
  Caption = 'Previs'#227'o'
  ClientHeight = 561
  ClientWidth = 1136
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tabExibir: TcxTabControl
    Left = 0
    Top = 53
    Width = 1136
    Height = 508
    Cursor = crHandPoint
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Properties.CustomButtons.Buttons = <>
    Properties.Images = imageExibir
    Properties.TabIndex = 1
    Properties.Tabs.Strings = (
      '...'
      'Saldo Caixa'
      'Lan'#231'amentos Favoritos'
      'Fluxo de Reserva/Provimento')
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    OnChange = tabExibirChange
    ExplicitTop = 52
    ExplicitHeight = 509
    ClientRectBottom = 504
    ClientRectLeft = 4
    ClientRectRight = 1132
    ClientRectTop = 29
    object pgcPrevisao: TcxPageControl
      Left = 4
      Top = 29
      Width = 1128
      Height = 475
      Cursor = crDrag
      Align = alClient
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Properties.ActivePage = tabPrevisaoFinanceira
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dtmControles.imgCadBasicos
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      OnChange = pgcPrevisaoChange
      ExplicitLeft = 1
      ExplicitTop = 22
      ExplicitWidth = 1134
      ExplicitHeight = 486
      ClientRectBottom = 470
      ClientRectLeft = 2
      ClientRectRight = 1123
      ClientRectTop = 26
      object tabPrevisaoFinanceira: TcxTabSheet
        Caption = 'Controle Financeiro'
        ImageIndex = 53
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel5: TPanel
          Left = 344
          Top = 0
          Width = 777
          Height = 444
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 788
          ExplicitHeight = 463
          object Panel8: TPanel
            Left = 0
            Top = 55
            Width = 777
            Height = 389
            Align = alClient
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 788
            ExplicitHeight = 408
            object pnlPrevisao: TPanel
              Left = 0
              Top = 0
              Width = 777
              Height = 389
              Align = alClient
              BevelOuter = bvNone
              Color = clWindow
              TabOrder = 0
              ExplicitWidth = 788
              ExplicitHeight = 408
              object Panel12: TPanel
                Left = 0
                Top = 0
                Width = 777
                Height = 389
                Align = alClient
                BevelOuter = bvNone
                Color = clWindow
                TabOrder = 0
                ExplicitWidth = 788
                ExplicitHeight = 408
                object tbcPrevisao: TcxTabControl
                  Left = 0
                  Top = 0
                  Width = 777
                  Height = 389
                  Align = alClient
                  TabOrder = 0
                  Properties.CustomButtons.Buttons = <>
                  Properties.TabIndex = 2
                  Properties.Tabs.Strings = (
                    'Vencidos/Dia Atual'
                    'at'#233' 7 Dias'
                    'M'#234's Atual'
                    'Pr'#243'ximo M'#234's'
                    'At'#233' 2 Meses'
                    'At'#233' 6 Meses'
                    'At'#233' 12 Meses'
                    'At'#233' Final do Ano'
                    'Personalizado')
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = 'McSkin'
                  OnChange = tbcPrevisaoChange
                  ExplicitWidth = 788
                  ExplicitHeight = 408
                  ClientRectBottom = 385
                  ClientRectLeft = 4
                  ClientRectRight = 773
                  ClientRectTop = 28
                  object pgcPagamentoRepasse: TcxPageControl
                    Left = 4
                    Top = 57
                    Width = 769
                    Height = 328
                    Align = alClient
                    TabOrder = 0
                    Properties.CustomButtons.Buttons = <>
                    LookAndFeel.NativeStyle = False
                    LookAndFeel.SkinName = 'McSkin'
                    ExplicitLeft = 0
                    ExplicitTop = 53
                    ExplicitWidth = 788
                    ExplicitHeight = 355
                    ClientRectBottom = 324
                    ClientRectLeft = 4
                    ClientRectRight = 765
                    ClientRectTop = 5
                  end
                  object tbcPagamentos: TcxTabControl
                    Left = 4
                    Top = 57
                    Width = 769
                    Height = 328
                    Align = alClient
                    TabOrder = 1
                    Properties.CustomButtons.Buttons = <>
                    Properties.TabIndex = 1
                    Properties.Tabs.Strings = (
                      '+'
                      'Agendamentos - Pagamentos/Receitas '#224' Realizar')
                    LookAndFeel.Kind = lfStandard
                    LookAndFeel.NativeStyle = False
                    LookAndFeel.SkinName = 'McSkin'
                    OnChange = tbcPagamentosChange
                    ExplicitLeft = 0
                    ExplicitTop = 53
                    ExplicitWidth = 788
                    ExplicitHeight = 355
                    ClientRectBottom = 324
                    ClientRectLeft = 4
                    ClientRectRight = 765
                    ClientRectTop = 28
                    object gdrCompromissoAgendado: TcxGrid
                      Left = 2
                      Top = 22
                      Width = 784
                      Height = 331
                      Align = alClient
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      PopupMenu = PopupAjuste
                      TabOrder = 0
                      LookAndFeel.Kind = lfUltraFlat
                      LookAndFeel.NativeStyle = False
                      object cxGridDBTablePrevisao: TcxGridDBTableView
                        OnDblClick = cxGridDBTablePrevisaoDblClick
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
                        FilterBox.CustomizeDialog = False
                        FilterBox.Position = fpTop
                        OnSelectionChanged = cxGridDBTablePrevisaoSelectionChanged
                        DataController.DataSource = dtsFinanceiroCompromisso
                        DataController.Summary.DefaultGroupSummaryItems = <>
                        DataController.Summary.FooterSummaryItems = <
                          item
                            Format = 'R$ ,#0.00'
                            Kind = skSum
                            FieldName = 'calc_Entrada'
                            Column = cxGridDBTableCompromissoEntrada
                          end
                          item
                            Format = 'R$ ,#0.00'
                            Kind = skSum
                            FieldName = 'calc_saida'
                            Column = cxGridDBTableCompromissoSaida
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
                        OptionsView.ScrollBars = ssVertical
                        OptionsView.ColumnAutoWidth = True
                        OptionsView.Footer = True
                        OptionsView.GridLines = glHorizontal
                        OptionsView.GroupByBox = False
                        OptionsView.GroupRowHeight = 25
                        OptionsView.GroupRowStyle = grsOffice11
                        Preview.Column = cxGridDBTableViewObservacao
                        Preview.Visible = True
                        Styles.Group = dtmControles.cxStyle12
                        Styles.GroupByBox = dtmControles.cxStyle12
                        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetLigth
                        object cxGridDBTableCompromissoDataPrevista: TcxGridDBColumn
                          Caption = 'Data Vencimento'
                          DataBinding.FieldName = 'DATA_VENCIMENTO'
                          PropertiesClassName = 'TcxDateEditProperties'
                          HeaderAlignmentHorz = taCenter
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 81
                        end
                        object cxGridDBTableCompromissoCaixa: TcxGridDBColumn
                          Caption = 'Caixa de Lan'#231'amento'
                          DataBinding.FieldName = 'calc_caixa'
                          RepositoryItem = dtmLookupContabil.Lista_CaixaTodos
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 86
                        end
                        object cxGridDBTableCompromissoClienteGeral: TcxGridDBColumn
                          Caption = 'Cliente'
                          DataBinding.FieldName = 'calc_nome'
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 135
                        end
                        object cxGridDBTablePrevisaoColumn1: TcxGridDBColumn
                          DataBinding.FieldName = 'calc_orcamento'
                          PropertiesClassName = 'TcxImageComboBoxProperties'
                          Properties.Images = dtmControles.imgCadBasicos
                          Properties.Items = <
                            item
                              ImageIndex = 52
                              Value = True
                            end>
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 24
                          IsCaptionAssigned = True
                        end
                        object cxGridDBTableCompromissoCompromisso: TcxGridDBColumn
                          Caption = 'Compromisso'
                          DataBinding.FieldName = 'calc_compromisso'
                          RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 73
                        end
                        object cxGridDBTablePrevisaoHistorico: TcxGridDBColumn
                          Caption = 'Hist'#243'rico'
                          DataBinding.FieldName = 'calc_historico'
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 77
                        end
                        object cxGridDBTablePrevisaoOperacao: TcxGridDBColumn
                          DataBinding.FieldName = 'OPERACAO'
                          RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 27
                          IsCaptionAssigned = True
                        end
                        object cxGridDBTableCompromissoEntrada: TcxGridDBColumn
                          Caption = 'Entrada'
                          DataBinding.FieldName = 'calc_Entrada'
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Properties.Alignment.Horz = taCenter
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 66
                        end
                        object cxGridDBTableCompromissoSaida: TcxGridDBColumn
                          Caption = 'Sa'#237'da'
                          DataBinding.FieldName = 'calc_saida'
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Properties.Alignment.Horz = taCenter
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 57
                        end
                        object cxGridDBTablePrevisaoColumn3: TcxGridDBColumn
                          Caption = 'Parcela'
                          DataBinding.FieldName = 'CALC_PARCELA'
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Width = 46
                        end
                        object cxGridDBTableCompromissoEspecie: TcxGridDBColumn
                          Caption = 'Esp'#233'cie'
                          DataBinding.FieldName = 'ESPECIE'
                          RepositoryItem = dtmLookupContabil.ComboEspeciePagamento
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 66
                        end
                        object cxGridDBTableCompromissoReferencia: TcxGridDBColumn
                          Caption = 'Refer'#234'ncia'
                          DataBinding.FieldName = 'calc_Referencia'
                          PropertiesClassName = 'TcxTextEditProperties'
                          Properties.Alignment.Horz = taCenter
                          Visible = False
                          HeaderAlignmentHorz = taCenter
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 74
                        end
                        object cxGridDBTableCompromissoBoleto: TcxGridDBColumn
                          Caption = 'Boleto'
                          DataBinding.FieldName = 'BOLETA_ID'
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                          Width = 44
                        end
                        object cxGridDBTableGrupo: TcxGridDBColumn
                          Caption = 'Situa'#231#227'o'
                          DataBinding.FieldName = 'CALC_GRUPO'
                          PropertiesClassName = 'TcxImageComboBoxProperties'
                          Properties.Images = dtmControles.imgCadBasicos
                          Properties.Items = <
                            item
                              Description = 'Meses Anteriores'
                              Value = '0'
                            end
                            item
                              Description = 'Vencidos'
                              Value = '1'
                            end
                            item
                              Description = 'Pr'#243'ximos Lan'#231'amentos'
                              Value = '2'
                            end
                            item
                              Description = 'OR'#199'AMENTO'
                              ImageIndex = 52
                              Value = '3'
                            end>
                          Visible = False
                          GroupIndex = 0
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                        end
                        object cxGridDBTableViewObservacao: TcxGridDBColumn
                          DataBinding.FieldName = 'calc_Observacao'
                          Options.Editing = False
                          Options.Filtering = False
                          Options.Focusing = False
                          Options.Sorting = False
                        end
                        object cxGridDBTablePrevisaoColumn2: TcxGridDBColumn
                          Caption = 'Saldo'
                          DataBinding.FieldName = 'CALC_SALDO'
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Visible = False
                          Width = 73
                        end
                      end
                      object cxGridLevel7: TcxGridLevel
                        GridView = cxGridDBTablePrevisao
                      end
                    end
                  end
                  object pnlPesquisaPErsonalizada: TPanel
                    Left = 4
                    Top = 28
                    Width = 769
                    Height = 29
                    Align = alTop
                    BevelOuter = bvNone
                    Color = clWindow
                    ParentBackground = False
                    TabOrder = 2
                    ExplicitLeft = 0
                    ExplicitTop = 24
                    ExplicitWidth = 788
                    object Panel1: TPanel
                      Left = 0
                      Top = 0
                      Width = 368
                      Height = 29
                      Align = alLeft
                      BevelOuter = bvNone
                      Color = clWindow
                      ParentBackground = False
                      TabOrder = 0
                      object cxLabel1: TcxLabel
                        Left = 5
                        Top = 5
                        Caption = 'Pesquisa:'
                        Style.TextColor = 16384
                        Style.TextStyle = []
                        Transparent = True
                      end
                      object edtPalavraPesquisa: TcxTextEdit
                        Left = 53
                        Top = 5
                        ParentFont = False
                        Properties.CharCase = ecUpperCase
                        Style.BorderStyle = ebsUltraFlat
                        Style.LookAndFeel.Kind = lfOffice11
                        Style.LookAndFeel.NativeStyle = False
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        StyleDisabled.LookAndFeel.Kind = lfOffice11
                        StyleDisabled.LookAndFeel.NativeStyle = False
                        StyleFocused.LookAndFeel.Kind = lfOffice11
                        StyleFocused.LookAndFeel.NativeStyle = False
                        StyleHot.LookAndFeel.Kind = lfOffice11
                        StyleHot.LookAndFeel.NativeStyle = False
                        TabOrder = 1
                        OnKeyDown = edtPalavraPesquisaKeyDown
                        Width = 164
                      end
                      object icxTipoCredito: TcxImageComboBox
                        Left = 219
                        Top = 4
                        EditValue = '0'
                        Properties.Items = <
                          item
                            Description = 'Todas'
                            ImageIndex = 4
                            Value = 0
                          end
                          item
                            Description = 'Somente Receitas'
                            ImageIndex = 1
                            Value = 1
                          end
                          item
                            Description = 'Somente Despesas'
                            ImageIndex = 2
                            Value = 2
                          end
                          item
                            Description = 'Somente Aporte/Ret./Transf.'
                            Value = 3
                          end
                          item
                            Description = 'Somente Or'#231'amentos'
                            Value = '4'
                          end
                          item
                            Description = 'Todas Exceto Or'#231'amentos'
                            Value = '5'
                          end>
                        Properties.OnChange = btnPesquisarClick
                        TabOrder = 2
                        Width = 149
                      end
                    end
                    object Panel7: TPanel
                      Left = 615
                      Top = 0
                      Width = 225
                      Height = 29
                      Align = alLeft
                      BevelOuter = bvNone
                      Color = clWindow
                      ParentBackground = False
                      TabOrder = 1
                      object btnPesquisar: TcxButton
                        Left = 2
                        Top = 2
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
                        TabOrder = 0
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        OnClick = btnPesquisarClick
                      end
                      object btnLimpar: TcxButton
                        Left = 101
                        Top = 2
                        Width = 95
                        Height = 22
                        Caption = 'Limpar'
                        Colors.Default = clWhite
                        LookAndFeel.Kind = lfUltraFlat
                        LookAndFeel.NativeStyle = False
                        LookAndFeel.SkinName = ''
                        OptionsImage.Glyph.Data = {
                          C6050000424DC605000000000000360400002800000014000000140000000100
                          08000000000090010000B00D0000B00D00000001000000000000000000000101
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
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
                          687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
                          68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
                          FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
                          F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
                          FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
                          39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFF}
                        TabOrder = 1
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        OnClick = btnLimparClick
                      end
                    end
                    object pnlPeriodoPersonalizado: TPanel
                      Left = 368
                      Top = 0
                      Width = 247
                      Height = 29
                      Align = alLeft
                      BevelOuter = bvNone
                      Color = clWindow
                      ParentBackground = False
                      TabOrder = 2
                      object cxLabel10: TcxLabel
                        Left = 5
                        Top = 5
                        Caption = 'Per'#237'odo:'
                        Style.TextColor = 16384
                        Style.TextStyle = []
                        Transparent = True
                      end
                      object edtDataInicial: TcxDateEdit
                        Left = 49
                        Top = 4
                        ParentFont = False
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 1
                        Width = 90
                      end
                      object cxLabel3: TcxLabel
                        Left = 141
                        Top = 4
                        Caption = 'a'
                        Style.TextColor = 16384
                        Style.TextStyle = []
                        Transparent = True
                      end
                      object edtDataFinal: TcxDateEdit
                        Left = 152
                        Top = 4
                        ParentFont = False
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 3
                        Width = 90
                      end
                    end
                  end
                end
              end
            end
          end
          object pnlTitulo: TPanel
            Left = 0
            Top = 0
            Width = 777
            Height = 55
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitWidth = 788
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 480
              Height = 55
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 0
              ExplicitWidth = 491
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 480
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Color = clWindow
                ParentBackground = False
                TabOrder = 0
                ExplicitWidth = 491
                object sbnImprimirPrevisao: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 22
                  Height = 26
                  Cursor = crHandPoint
                  Hint = 'Imprimir Previs'#227'o do Fluxo de Caixa'
                  Align = alLeft
                  Flat = True
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00C6945FFDC99764FFC99664FFC99664FFC99664FFC99663FFC896
                    63FFC89663FFC99764FFC6935FFDFF00FF00FF00FF00FF00FF00616161995C5C
                    5CD2575757FFC69460FFF8F6F5FFF8F0EBFFF8F0EAFFF7EFE8FFF6ECE5FFF3E9
                    E0FFF1E7DDFFF9F7F5FFC69360FF232323FF222222D12222227A686868FDA6A6
                    A6FFB4B4B4FF808080FFAEABA9FFC4BFBCFFC4BFBCFFC4BFBCFFC4BFBCFFC4BF
                    BCFFC4BFBCFFACA9A7FF2B2B2BFFB4B4B4FF9A9A9AFF222222FF6F6F6FFFB4B4
                    B4FFB4B4B4FF949494FF808080FF808080FF787878FF6D6D6DFF606060FF5151
                    51FF424242FF414141FF6D6D6DFFB4B4B4FFB4B4B4FF242424FF747474FFBABA
                    BAFFBABABAFF8C8C8CFFD3D3D3FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
                    B8FFB8B8B8FFD2D2D2FF828282FFBABABAFFBABABAFF292929FF797979FFD6D6
                    D6FFD6D6D6FF969696FFD7D7D7FFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
                    BEFFBEBEBEFFD6D6D6FF8D8D8DFFD6D6D6FFD6D6D6FF3E3E3EFF7D7D7DFFF8F8
                    F8FFF8F8F8FFAAAAAAFFDEDEDEFFCACACAFFCACACAFFCACACAFFCACACAFFCACA
                    CAFFCACACAFFDEDEDEFFA2A2A2FFF8F8F8FFF8F8F8FF606060FF808080F9FBFB
                    FBFFFBFBFBFFCACACAFFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
                    F1FFF1F1F1FFF1F1F1FFC5C5C5FFFBFBFBFFFBFBFBFF6F6F6FFE7F7F7FD2D1D1
                    D1FFE7E7E7FF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C
                    7CFF7C7C7CFF7C7C7CFF7C7C7CFFE7E7E7FFC3C3C3FF545454DC808080459999
                    99FFCBCBCBFFC68A4DFFF8F3ECFFFDE7D7FFFDE7D6FFFCE4D2FFFBE3D0FFF9DF
                    C6FFF8DCC2FFF9F3ECFFC68449FFC2C2C2FF737373FF45454545FF00FF007F7F
                    7F63808080F3C4884BFFF8F3EEFFFDE6D6FFFCE6D4FFFBE5D1FFFAE0CBFFF7DB
                    C1FFF5D9BCFFF9F3EEFFC38247FF585858F351515163FF00FF00FF00FF00FF00
                    FF008C8C8C09C38849F9F8F3EFFFFBE5D2FFFCE6D2FFFAE2CCFFF9DFC7FFF4D5
                    BAFFF2D3B4FFF7F3EFFFC18144F953535309FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00C5884AF7F8F4F0FFFBE2CEFFFBE3CEFFF9E0C9FFF8DCC3FFF3E8
                    DEFFF6F1EBFFF4EEE8FFC17C44FBFF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00C4874AF6F8F4F0FFFBE2CCFFFAE2CCFFF8DFC7FFF7DBC1FFFCFA
                    F7FFFBE5CCFFE1B583FFBD7841A6FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00C28448FAF6F1EBFFF7F3EDFFF7F2ECFFF7F2ECFFF7F1EBFFF1E5
                    D6FFE1B17CFFD89062F6B56C4707FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00C07B4460C78A4BBBC68A4EFEC78B4EFFC78C4EF7C88B4EF7C387
                    4BFEC3743994FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  ParentShowHint = False
                  ShowHint = True
                  ExplicitLeft = 514
                  ExplicitTop = -16
                end
                object lblPrevisao: TcxLabel
                  Left = 22
                  Top = 0
                  Align = alClient
                  AutoSize = False
                  Caption = ' Previs'#227'o de Caixa'
                  ParentColor = False
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  Style.BorderStyle = ebsNone
                  Style.Color = clWindow
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -16
                  Style.Font.Name = 'Times New Roman'
                  Style.Font.Style = []
                  Style.LookAndFeel.Kind = lfUltraFlat
                  Style.LookAndFeel.NativeStyle = False
                  Style.Shadow = False
                  Style.TextColor = 16384
                  Style.TextStyle = [fsBold]
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.Kind = lfUltraFlat
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.LookAndFeel.Kind = lfUltraFlat
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.Kind = lfUltraFlat
                  StyleHot.LookAndFeel.NativeStyle = False
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  ExplicitWidth = 469
                  Height = 26
                  Width = 458
                  AnchorY = 13
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 26
                Width = 480
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Color = clWindow
                ParentBackground = False
                TabOrder = 1
                ExplicitWidth = 491
                object cxLabel6: TcxLabel
                  Left = 5
                  Top = 3
                  Caption = 'Caixa:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = 16384
                  Style.Font.Height = -11
                  Style.Font.Name = 'MS Sans Serif'
                  Style.Font.Style = [fsBold]
                  Style.TextColor = 16384
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lcbConta: TcxLookupComboBox
                  Left = 45
                  Top = 2
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'CAIXA_ID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = dtsListaCaixa
                  Properties.OnChange = tbcPagamentosChange
                  Style.BorderStyle = ebsUltraFlat
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  Style.TextColor = clWindowText
                  Style.TextStyle = []
                  Style.ButtonStyle = btsUltraFlat
                  Style.PopupBorderStyle = epbsFlat
                  TabOrder = 1
                  Width = 292
                end
                object btnLimparCaixa: TcxButton
                  Left = 339
                  Top = 0
                  Width = 28
                  Height = 23
                  Cursor = crHandPoint
                  Hint = 'Limpar Filtro de Caixa'
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
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
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
                    687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
                    68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
                    FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
                    F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
                    FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
                    39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                  ParentShowHint = False
                  ShowHint = True
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 2
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Orientation = 900
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnLimparCaixaClick
                end
              end
            end
            object Panel2: TPanel
              Left = 699
              Top = 0
              Width = 78
              Height = 55
              Align = alRight
              BevelOuter = bvNone
              Color = clWindow
              ParentBackground = False
              TabOrder = 1
              ExplicitLeft = 710
              object cxBtnFechar: TcxButton
                Left = 12
                Top = 7
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
            object gbxSomaItensSelecionados: TcxGroupBox
              Left = 480
              Top = 0
              Align = alRight
              Alignment = alTopCenter
              BiDiMode = bdRightToLeft
              Caption = 'SOMA ITENS SELECIONADOS'
              ParentBiDiMode = False
              ParentFont = False
              Style.LookAndFeel.NativeStyle = False
              Style.LookAndFeel.SkinName = 'Office2007Green'
              Style.Shadow = False
              Style.TextStyle = [fsBold]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
              StyleHot.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.SkinName = 'Office2007Green'
              TabOrder = 2
              Visible = False
              ExplicitLeft = 491
              Height = 55
              Width = 219
              object btnAdValor: TSpeedButton
                Left = 194
                Top = 13
                Width = 19
                Height = 21
                Cursor = crHandPoint
                Hint = 'Adicionar Valor'
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
                OnClick = btnAdValorClick
              end
              object btnDeduzirValor: TSpeedButton
                Left = 194
                Top = 28
                Width = 19
                Height = 21
                Cursor = crHandPoint
                Hint = 'Deduzir Valor'
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
                OnClick = btnDeduzirValorClick
              end
              object edtValorSomaSelecionados: TcxCurrencyEdit
                Left = -1
                Top = 17
                Enabled = False
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Style.BorderStyle = ebsOffice11
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -16
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                StyleDisabled.TextColor = clBlue
                StyleDisabled.TextStyle = [fsBold]
                TabOrder = 0
                Width = 183
              end
            end
          end
        end
        object pgcModulos: TcxPageControl
          Left = 0
          Top = 0
          Width = 336
          Height = 444
          Align = alLeft
          TabOrder = 1
          Visible = False
          Properties.ActivePage = tabReserva
          Properties.CustomButtons.Buttons = <>
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OnChange = pgcModulosChange
          ExplicitHeight = 463
          ClientRectBottom = 444
          ClientRectRight = 336
          ClientRectTop = 24
          object tabSaldo: TcxTabSheet
            Caption = 'Saldo Caixa'
            ImageIndex = 3
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 336
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Color = clWindow
              ParentBackground = False
              TabOrder = 0
              object icxVisualizacao: TcxComboBox
                Left = 4
                Top = 1
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  'Visualiza'#231#227'o Cart'#227'o'
                  'Visualia'#231#227'o Lista')
                Properties.OnChange = icxVisualizacaoPropertiesChange
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Text = 'Visualiza'#231#227'o Cart'#227'o'
                Width = 156
              end
            end
            object cxgCaixa: TcxGrid
              Left = 0
              Top = 25
              Width = 336
              Height = 414
              Align = alClient
              TabOrder = 1
              object cvCaixa: TcxGridDBCardView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Buttons.PriorPage.Visible = False
                Navigator.Buttons.NextPage.Visible = False
                Navigator.Buttons.Insert.Visible = False
                Navigator.Buttons.Delete.Visible = False
                Navigator.Buttons.Edit.Visible = False
                Navigator.Buttons.Post.Visible = False
                Navigator.Buttons.Cancel.Visible = False
                Navigator.Buttons.Refresh.Visible = True
                Navigator.Buttons.SaveBookmark.Visible = False
                Navigator.Buttons.GotoBookmark.Visible = False
                Navigator.Buttons.Filter.Visible = False
                Navigator.Visible = True
                FilterBox.Visible = fvNever
                DataController.DataSource = dtsCaixa
                DataController.Filter.Active = True
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <
                  item
                    Links = <>
                    SummaryItems = <
                      item
                        Kind = skCount
                        FieldName = 'CHAVE_ENDERECOS'
                      end>
                  end>
                DataController.Summary.Options = [soSelectedRecords]
                LayoutDirection = ldVertical
                OptionsBehavior.NavigatorHints = True
                OptionsCustomize.RowFiltering = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.CardAutoWidth = True
                OptionsView.CardIndent = 7
                OptionsView.CardWidth = 208
                Styles.StyleSheet = GridCardViewStyleSheetDevExpress
                object cvCaixaRow1: TcxGridDBCardViewRow
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'DESCRICAO'
                  Position.BeginsLayer = True
                end
                object cvCaixaRow2: TcxGridDBCardViewRow
                  Caption = 'Situa'#231#227'o'
                  DataBinding.FieldName = 'SITUACAO'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Items = <
                    item
                      Description = 'Caixa Principal'
                      ImageIndex = 3
                      Value = '0'
                    end
                    item
                      Description = 'Saldo Positivo'
                      ImageIndex = 0
                      Value = '1'
                    end
                    item
                      Description = 'Saldo Negativo'
                      ImageIndex = 1
                      Value = '2'
                    end
                    item
                      Description = 'Caixa Livre'
                      ImageIndex = 2
                      Value = '3'
                    end>
                  RepositoryItem = dtmLookupContabil.Combo_CaixaSituacao
                  Position.BeginsLayer = True
                end
                object cvCaixaRow3: TcxGridDBCardViewRow
                  Caption = 'Valor'
                  DataBinding.FieldName = 'VALOR'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = 'R$ ,0.00;(R$ ,0.00)'
                  Position.BeginsLayer = True
                end
              end
              object cxgCaixaDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                FilterBox.Visible = fvNever
                DataController.DataSource = dtsCaixa
                DataController.Filter.Active = True
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    FieldName = 'VALOR'
                    Column = cxgCaixaDBTableView1Column2
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                Preview.Visible = True
                Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                object cxgCaixaDBTableView1Column1: TcxGridDBColumn
                  Caption = 'Caixa'
                  DataBinding.FieldName = 'RESUMO'
                  Width = 121
                end
                object cxgCaixaDBTableView1Column2: TcxGridDBColumn
                  Caption = 'Valor'
                  DataBinding.FieldName = 'VALOR'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00;(-,0.00)'
                  Width = 91
                end
                object cxgCaixaDBTableView1Column3: TcxGridDBColumn
                  Caption = 'Situa'#231#227'o'
                  DataBinding.FieldName = 'SITUACAO'
                  RepositoryItem = dtmLookupContabil.Combo_CaixaSituacao
                  Width = 90
                end
              end
              object lvLivro: TcxGridLevel
                Caption = 'Livros'
                GridView = cvCaixa
              end
              object cxgCaixaLevel: TcxGridLevel
                GridView = cxgCaixaDBTableView1
              end
            end
          end
          object tabFavoritos: TcxTabSheet
            Caption = 'Lan'#231'amentos Favoritos'
            ImageIndex = 1
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 336
              Height = 35
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object btnRealizarLancamento: TcxButton
                Left = 8
                Top = 7
                Width = 161
                Height = 22
                Hint = 'Realizar Lan'#231'amento Favorito'
                Caption = 'Realizar Lan'#231'amento'
                Colors.Default = clWhite
                Enabled = False
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  A6070000424DA60700000000000036040000280000002A000000140000000100
                  0800000000007003000000000000000000000001000000000000000000000101
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
                  F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFF540200
                  000000000000000000000016D5FFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFF
                  FFFFFFFF0000FFFFFF03000002010101010200000000000279FFFFFFFFFFFFFF
                  FFFFFFDEC0F2FFFFFFFFFFFFFFFFFFFF0000FFFFFF0202032932323232210302
                  020302027EFFFFFFFFFFFFFFFFFFE76D32A2FFFFFFFFFFFFFFFFFFFF0000FFFF
                  FF03020CC4DAD7D7DAA30302020302027EFFFFFFFFFFFFFFFFF58F210E35DCFF
                  FFFFFFFFFFFFFFFF0000FFFFFF0403030303030303030303030303037EFFFFFF
                  FFFFFFFFFFBB2B12131264F4FFFFFFFFFFFFFFFF0000FFFFFF03030DBED8D5D4
                  D4D5DADADA67040381FFFFFFFFFFFFFFD931111616151A84F6FFFFFFFFFFFFFF
                  0000FFFFFF050508292A2828292829292D1B050483FFFFFFFFFFFFE358131614
                  15171530ADF9FFFFFFFFFFFF0000FFFFFF050609475253535354535352270505
                  83FFFFFFFFFFEA781D1619312717181A4ED2FDFFFFFFFFFF0000FFFFFF060611
                  A7B8B3B3B4B3B4B3B860060683FFFFFFFFF69A2C181952BC9D2918181E71EDFF
                  FFFFFFFF0000FFFFFF08080908090909090909080908080887FFFFFFFDBD391A
                  155AE1FEF7A8191A1B26A1FFFFFFFFFF0000FFFFFF0A0916D5EEEEEEEEEEEEEE
                  F07A0A0A88FFFFFFDE4B181E6CFFFFFFFFFFA3271B1B31D1FFFFFFFF0000FFFF
                  FF0C0B0D171716171716171718130C0C88FFFFFF8A1F277AF0FFFFFFFFFFF490
                  2A1C1B59E5FFFFFF0000FFFFFF0C0C137A8D8C8C8C8D8D8D8D460D0C8AFFFFFF
                  3A3391ECFFFFFFFFFFFFFFED8A2A1E2684F1FFFF0000FFFFFF0D0D17838D918F
                  888787878C530E0E8AFFFFFFA0B9F2FFFFFFFFFFFFFFFFFFEC85221F39ADFBFF
                  0000FFFFFF0F0F0F1212120F1E1D1F1F1E130F0F8CFFFFFFFBFEFFFFFFFFFFFF
                  FFFFFFFFFFF2831A2252D3FF0000FFFFFF11122AF1F32A37EDEEEDEEF0831211
                  8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7923246DE90000FFFFFF14132F
                  FFFF3E151A1B1B1B1C1814148EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
                  77282DA10000FFFFFF1615153235151515161515151515158FFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE474273B0000FFFFFF1A16171616171717161716
                  1717161996FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE37D5C0000FFFF
                  FF721A19191819181918191919191834DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFF0E90000}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnRealizarLancamentoClick
              end
              object btnExcluirFavorito: TcxButton
                Left = 172
                Top = 7
                Width = 28
                Height = 23
                Cursor = crHandPoint
                Hint = 'Retirar dos Lan'#231'amento Favorito'
                Colors.Default = clWhite
                Enabled = False
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
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Orientation = 900
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btnExcluirFavoritoClick
              end
            end
            object grdBasica: TcxGrid
              Left = 0
              Top = 35
              Width = 336
              Height = 404
              Align = alClient
              TabOrder = 1
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              object grdBasicaDBTableView1: TcxGridDBTableView
                OnDblClick = grdBasicaDBTableView1DblClick
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
                DataController.DataSource = dtsLancamentoFavorito
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'Total:0'
                    Kind = skCount
                    FieldName = 'NATUREZA_ID'
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
                OptionsView.GroupByBox = False
                Preview.Column = grdBasicaDBTableHistorico
                Preview.Visible = True
                Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                object grdBasicaDBTablePessoa: TcxGridDBColumn
                  Caption = 'Favorecido'
                  DataBinding.FieldName = 'PESSOA_ID'
                  RepositoryItem = dtmLookupFinanceiro.ListaPessoasTodas
                  Width = 135
                end
                object grdBasicaDBTableContabilConta: TcxGridDBColumn
                  Caption = 'Compromisso'
                  DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                  RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
                  Width = 173
                end
                object grdBasicaDBTableHistorico: TcxGridDBColumn
                  Caption = 'Hist'#243'rico'
                  DataBinding.FieldName = 'HISTORICO'
                  Width = 80
                end
                object grdBasicaDBTableView1Column1: TcxGridDBColumn
                  DataBinding.FieldName = 'OPERACAO'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Images = dtmControles.imgCadBasicos
                  Properties.Items = <
                    item
                      ImageIndex = 3
                      Value = 'R'
                    end
                    item
                      ImageIndex = 4
                      Value = 'D'
                    end>
                  Width = 26
                  IsCaptionAssigned = True
                end
              end
              object grdBasicaLevel1: TcxGridLevel
                GridView = grdBasicaDBTableView1
              end
            end
          end
          object tabReserva: TcxTabSheet
            Caption = 'Valores de Reserva/Provis'#227'o'
            ImageIndex = 2
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 336
              Height = 439
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
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
                DataController.DataSource = dtsReserva
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    FieldName = 'VALOR_RESERVA'
                    Column = cxGridDBTableView1Column3
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
                OptionsView.GroupByBox = False
                Preview.Visible = True
                Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                object cxGridDBTableView1Column2: TcxGridDBColumn
                  Caption = 'Reserva'
                  DataBinding.FieldName = 'RESERVA_DESCRICAO'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 218
                end
                object cxGridDBTableView1Column3: TcxGridDBColumn
                  Caption = 'Valor'
                  DataBinding.FieldName = 'VALOR_RESERVA'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 99
                end
                object cxGridDBTableView1Column4: TcxGridDBColumn
                  DataBinding.FieldName = 'BALANCETE_GRUPO_ID'
                  RepositoryItem = dtmLookup.Lista_BalanceteGrupoDescricao
                  Visible = False
                  GroupIndex = 0
                  Options.Editing = False
                  Options.Focusing = False
                  IsCaptionAssigned = True
                end
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
          end
          object tabCalculadora: TcxTabSheet
            Caption = 'Calculadora Valores'
            ImageIndex = 3
            ExplicitHeight = 439
            inline fmeCalculadora1: TfmeCalculadora
              Left = 0
              Top = 0
              Width = 336
              Height = 420
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 336
              ExplicitHeight = 439
              inherited pnlValores: TPanel
                Width = 336
                ExplicitWidth = 336
                inherited btnLimpar: TcxButton
                  LookAndFeel.SkinName = ''
                end
              end
              inherited cxGroupBox3: TcxGroupBox
                ExplicitWidth = 336
                ExplicitHeight = 346
                Height = 327
                Width = 336
                inherited grdPessoasCitadas: TcxGrid
                  Width = 332
                  Height = 307
                  ExplicitWidth = 332
                  ExplicitHeight = 326
                  inherited cxGridDBTableValores: TcxGridDBTableView
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Format = ',#0.00'
                        Kind = skSum
                        FieldName = 'VALOR'
                        Column = fmeCalculadora1.cxGridDBTableValor
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = 'R$ ,#0.00'
                        Kind = skSum
                        FieldName = 'VALOR'
                        Column = fmeCalculadora1.cxGridDBTableValor
                        DisplayText = 'Total: '
                      end>
                    Styles.Background = nil
                    Styles.Content = nil
                    Styles.ContentEven = nil
                    Styles.ContentOdd = nil
                    Styles.FilterBox = nil
                    Styles.Inactive = nil
                    Styles.IncSearch = nil
                    Styles.Selection = nil
                    Styles.Footer = nil
                    Styles.Group = nil
                    Styles.GroupByBox = nil
                    Styles.Header = nil
                    Styles.Indicator = nil
                    Styles.Preview = nil
                  end
                end
              end
            end
          end
        end
        object cxSplitterTexto: TcxSplitter
          Left = 336
          Top = 0
          Width = 8
          Height = 444
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 59
          DragThreshold = 2
          NativeBackground = False
          PositionAfterOpen = 135
          AutoSnap = True
          MinSize = 135
          ResizeUpdate = True
          Control = pgcModulos
          Color = clBtnFace
          ParentColor = False
          Visible = False
          ExplicitHeight = 463
        end
      end
    end
  end
  object dxBarManager1: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Atalhos'
      'Default'
      'Juridico'
      'Controle')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    DockColor = clTeal
    ImageOptions.ImageListBkColor = clNavy
    ImageOptions.Images = dtmControles.imgCadBasicos
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Coffee'
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    ShowHelpButton = True
    UseSystemFont = False
    Left = 227
    Top = 243
    DockControlHeights = (
      0
      0
      53
      0)
    object dxBarManager1BarFinanceiro: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'Contas a Pagar / Receber'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarInfoFechamento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStatic3'
        end
        item
          Visible = True
          ItemName = 'dxSaldoAtual'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxPrevisaoSaldo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarData'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarManagerResponsavel: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Responsavel'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 31
      DockingStyle = dsTop
      FloatLeft = 1170
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = dtmControles.imgCadBasicos
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic2'
        end
        item
          Visible = True
          ItemName = 'dxBarPresidente'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStatic5'
        end
        item
          Visible = True
          ItemName = 'dxBarOrgan'
        end>
      OneOnRow = True
      Row = 1
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarProgressPrevisaoSaldo: TdxBarProgressItem
      Align = iaRight
      Caption = 'R$ 1.500,00'
      Category = 1
      Hint = 'R$ 1.500,00'
      Visible = ivAlways
      Alignment = taRightJustify
      BorderStyle = sbsNone
      ImageIndex = 31
      Width = 330
      Color = clMaroon
      Position = 90
      Smooth = True
    end
    object dxBarProgressSaldoAtual: TdxBarProgressItem
      Caption = 'R$ 20.000,00'
      Category = 1
      Hint = 'R$ 20.000,00'
      Visible = ivAlways
      Alignment = taRightJustify
      BorderStyle = sbsNone
      ImageIndex = 16
      Width = 330
      Color = clGreen
      Position = 50
      Smooth = True
    end
    object dxBarlblPrevisaoSaldo: TdxBarStatic
      Caption = ' Previs'#227'o de Saldo'
      Category = 1
      Hint = ' Previs'#227'o de Saldo'
      Visible = ivAlways
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Quando abrir o sistema, mostrar...'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarColunaSaldo'
        end>
    end
    object dxBarColunaSaldo: TdxBarButton
      Caption = 'Mostrar Previs'#227'o de Saldo'
      Category = 1
      Hint = 'Mostrar Previs'#227'o de Saldo'
      Visible = ivAlways
    end
    object dxBarlblSaldoAtual: TdxBarStatic
      Caption = 'Saldo Atual'
      Category = 1
      Hint = 'Saldo Atual'
      Visible = ivAlways
    end
    object dxBarData: TdxBarStatic
      Align = iaRight
      Caption = 'Quarta-Feira, 13 de Fevereiro de 2008'
      Category = 1
      Hint = 'Quarta-Feira, 13 de Fevereiro de 2008'
      Visible = ivAlways
      Alignment = taRightJustify
      ImageIndex = 8
    end
    object dxBarButtonPesquisar: TdxBarButton
      Caption = 'Pesquisar'
      Category = 1
      Hint = 'Pesquisar'
      Visible = ivAlways
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
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
      ItemIndex = -1
    end
    object dxBarCombo2: TdxBarCombo
      Align = iaRight
      Caption = 'Modelo de Grid:'
      Category = 1
      Hint = 'Modelo de Grid:'
      Visible = ivAlways
      ShowCaption = True
      Text = 'Op'#231#227'o 1'
      Items.Strings = (
        'Op'#231#227'o 1'
        'Op'#231#227'o 2'
        'Op'#231#227'o 3'
        'Op'#231#227'o 4')
      ItemIndex = 0
    end
    object lcxFiltroTarefa: TcxBarEditItem
      Caption = 'Grupo de Tarefa:'
      Category = 1
      Hint = 'Grupo de Tarefa:'
      Visible = ivAlways
      ShowCaption = True
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TAREFA_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'New Button'
      Visible = ivAlways
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
    end
    object dxBarButton3: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'New Button'
      Visible = ivAlways
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
    end
    object dxBarButton4: TdxBarButton
      Caption = 'Grid'
      Category = 1
      Hint = 'Grid'
      Visible = ivAlways
    end
    object dxBarGrid0: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'Colocar Margem'
      Visible = ivAlways
      ImageIndex = 74
      OnClick = dxBarGrid0Click
    end
    object dxBarGrid1: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'Retirra Margem'
      Visible = ivAlways
      ImageIndex = 75
      OnClick = dxBarGrid1Click
    end
    object dxBarGrid2: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'Margem Vertical'
      Visible = ivAlways
      ImageIndex = 76
      OnClick = dxBarGrid2Click
    end
    object dxBarGrid3: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'Margem Horizontal'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 77
      OnClick = dxBarGrid3Click
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 1
      Visible = ivAlways
      ItemLinks = <>
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = 'Saldo Caixa'
      Category = 1
      Hint = 'Saldo Caixa'
      Visible = ivAlways
    end
    object lblPrevisaoSaldo: TcxBarEditItem
      Caption = 'Previs'#227'o de Saldo'
      Category = 1
      Hint = 'Previs'#227'o de Saldo'
      Visible = ivAlways
      PropertiesClassName = 'TcxLabelProperties'
    end
    object lblSaldoAtual: TcxBarEditItem
      Caption = 'Saldo Atual'
      Category = 1
      Hint = 'Saldo Atual'
      Visible = ivAlways
      ImageIndex = 58
      ShowCaption = True
      PropertiesClassName = 'TcxLabelProperties'
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 1
      PropertiesClassName = 'TcxImageProperties'
    end
    object dxSaldoAtual: TdxBarStatic
      Caption = 'Saldo Atual'
      Category = 1
      Hint = 'Saldo Atual'
      Visible = ivAlways
      ImageIndex = 3
    end
    object dxPrevisaoSaldo: TdxBarStatic
      Caption = 'Previsao de Saldo'
      Category = 1
      Hint = 'Previsao de Saldo'
      Visible = ivAlways
      ImageIndex = 30
    end
    object dxBarStatic3: TdxBarStatic
      Caption = 'Previs'#227'o de Valores = '
      Category = 1
      Hint = 'Previs'#227'o de Valores = '
      Visible = ivAlways
      ImageIndex = 53
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarStatic2: TdxBarStatic
      Caption = 'Presidente: '
      Category = 1
      Hint = 'Presidente: '
      Visible = ivAlways
      ImageIndex = 55
    end
    object dxBarPresidente: TdxBarStatic
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarStatic5: TdxBarStatic
      Caption = 'Organ:'
      Category = 1
      Hint = 'Organ:'
      Visible = ivAlways
      ImageIndex = 37
    end
    object dxBarOrgan: TdxBarStatic
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarCombo3: TdxBarCombo
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
      ItemIndex = -1
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 1
      Visible = ivAlways
      ItemLinks = <>
    end
    object CustomdxBarCombo1: TCustomdxBarCombo
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = 'Fechamento Livro Mensal'
      Category = 1
      Hint = 'Fechamento Livro Mensal'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Glyph.Data = {
        76050000424D760500000000000036040000280000000F000000140000000100
        080000000000400100000000000000000000000100000000000000000000BCBC
        BC005757570028282800FFFFFF0087878700EBEBEB008B8B8B000C0C0C00B0B0
        B000CFCFCF006C6C6C00383838006A6A6A00DBDBDB0012121200505050006666
        6600C5C5C500F7F7F70036363600737373003333330004040400191919009393
        9300CCCCCC0076767600DDDDDD003C3C3C0020202000B5B5B500F1F1F100E3E3
        E300D1D1D1007070700006060600FBFBFB00C9C9C90089898900EFEFEF00BFBF
        BF003A3A3A000E0E0E003F3F3F00D3D3D3005858580078787800B3B3B300F9F9
        F900B7B7B7000909090000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000040E14000000
        000000000000140E04000E160000000000000000000000160E001600000C0D11
        11111111110C0000160000001D2004040404040404281D000000000023040404
        0413040404042300000000000B0404040503050404040B00000000000B040404
        0C000C0404040B00000000000B040404122F120404040B000000000015040404
        0404040404041500000000002E2D0A0A0A0A0A0A0A2D2E0000000000170F2B08
        08080808080F2400000000000000000000000000000000000000050507191927
        0505050505052C0000000404200129040404040404041B000000040407000030
        0404040404041D00000004042900000204040404043217002A000404251D0000
        23060425091800001F00040404263300001E101D0000002F0400040404040103
        000000000017151304000404040404210D0800000C0904040400}
      LargeGlyph.Data = {
        76050000424D760500000000000036040000280000000F000000140000000100
        080000000000400100000000000000000000000100000000000000000000BCBC
        BC005757570028282800FFFFFF0087878700EBEBEB008B8B8B000C0C0C00B0B0
        B000CFCFCF006C6C6C00383838006A6A6A00DBDBDB0012121200505050006666
        6600C5C5C500F7F7F70036363600737373003333330004040400191919009393
        9300CCCCCC0076767600DDDDDD003C3C3C0020202000B5B5B500F1F1F100E3E3
        E300D1D1D1007070700006060600FBFBFB00C9C9C90089898900EFEFEF00BFBF
        BF003A3A3A000E0E0E003F3F3F00D3D3D3005858580078787800B3B3B300F9F9
        F900B7B7B7000909090000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000040E14000000
        000000000000140E04000E160000000000000000000000160E001600000C0D11
        11111111110C0000160000001D2004040404040404281D000000000023040404
        0413040404042300000000000B0404040503050404040B00000000000B040404
        0C000C0404040B00000000000B040404122F120404040B000000000015040404
        0404040404041500000000002E2D0A0A0A0A0A0A0A2D2E0000000000170F2B08
        08080808080F2400000000000000000000000000000000000000050507191927
        0505050505052C0000000404200129040404040404041B000000040407000030
        0404040404041D00000004042900000204040404043217002A000404251D0000
        23060425091800001F00040404263300001E101D0000002F0400040404040103
        000000000017151304000404040404210D0800000C0904040400}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 1
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton6: TdxBarButton
      Caption = 'New Button'
      Category = 1
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarFechamento: TdxBarButton
      Caption = 'Fechar Livro Caixa do M'#234's Ano/Atual'
      Category = 1
      Hint = 'Fechar Livro Caixa do M'#234's Ano/Atual'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
      OnClick = dxBarFechamentoClick
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'Op'#231#245'es'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarFechamento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarReabrir'
        end>
    end
    object dxBarInfoFechamento: TdxBarStatic
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
      BorderStyle = sbsBump
      Glyph.Data = {
        76050000424D760500000000000036040000280000000F000000140000000100
        080000000000400100000000000000000000000100000000000000000000A5A5
        A50048484800FCFCFC001B1B1B008E8E8E00CCCCCC0066666600363636005C5C
        5C00B9B9B9002C2C2C000C0C0C00DBDBDB00B4B4B400C7C7C70074747400E3E3
        E300B3B3B30026262600D9D9D90039393900D6D6D60066666600040404001616
        1600515151004141410033333300ADADAD007171710092929200FFFFFF006D6D
        6D00BCBCBC00E7E7E70000000000B7B7B7001D1D1D002F2F2F00FFFFFF005E5E
        5E00BBBBBB000606060000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000200D15000000
        000000000000150D2000160B00000000000000000000000B1600080000000000
        0000000000000000080000000000000000000000000000000000000000000000
        0000000000000000000000000000000002220200000000000000000000000000
        1F201F0000000000000000000000000026072600000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050509000021
        0505050505050800000020200E00001420202020202029000000202001000025
        2020202020202700000020200F00001A20202020200A18000800202003080000
        1E232003251900001200202020062B0000041B1C000000102000202020202A13
        00000000001810202000202020202011070C0000081D20202000}
    end
    object cxBarEditItem4: TcxBarEditItem
      Caption = 'New Item'
      Category = 1
      Hint = 'New Item'
      Visible = ivAlways
      PropertiesClassName = 'TcxButtonEditProperties'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
    end
    object dxBarReabrir: TdxBarButton
      Caption = 'Reabri Livro Caixa Fechado '
      Category = 1
      Hint = 'Reabri Livro Caixa Fechado '
      Visible = ivAlways
      OnClick = dxBarReabrirClick
    end
    object dxBarTarefasPendentes: TdxBarStatic
      Caption = '5 Tarefas Pendentes'
      Category = 2
      Hint = '5 Tarefas Pendentes'
      Visible = ivAlways
      ImageIndex = 8
    end
    object dxBarTarefasAVencer: TdxBarStatic
      Caption = '2 Tarefas '#224' Vencer at'#233' 3 Dias '
      Category = 2
      Hint = '2 Tarefas '#224' Vencer at'#233' 3 Dias '
      Visible = ivAlways
      ImageIndex = 57
    end
    object dxBarServicosAtivos: TdxBarStatic
      Align = iaRight
      Caption = '10 Servi'#231'os Vencidos'
      Category = 2
      Hint = 'Tarefas Vencidas'
      Visible = ivAlways
      Alignment = taRightJustify
      ImageIndex = 56
    end
    object dxBarServicosAContratar: TdxBarStatic
      Caption = '3 Servi'#231'os '#192' Contratar'
      Category = 2
      Hint = '3 Servi'#231'os '#192' Contratar'
      Visible = ivAlways
      Alignment = taRightJustify
      ImageIndex = 42
    end
    object cxBarEditItemPesquisar: TcxBarEditItem
      Caption = 'New Item'
      Category = 2
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 1
      Width = 120
      PropertiesClassName = 'TcxImageComboBoxProperties'
      BarStyleDropDownButton = False
      Properties.DefaultImageIndex = 52
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'N'#186' Processo'
          ImageIndex = 52
          Value = '1'
        end
        item
          Description = 'N'#186' Pasta'
          ImageIndex = 61
          Value = '2'
        end
        item
          Description = 'N'#186' Contrato Financeiro'
          ImageIndex = 53
          Value = '3'
        end>
    end
    object dxBarEditNumero: TdxBarEdit
      Category = 2
      Visible = ivAlways
    end
  end
  object imageExibir: TImageList
    DrawingStyle = dsTransparent
    Left = 227
    Top = 203
    Bitmap = {
      494C010108000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      00000000000000000000000000009A380A009A380A009A380A009A380A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEBEB00DADA
      DA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADA
      DA00DADADA00DADADA00DCDCDC000000000000000000003B0000003B0000003B
      0000003B0000003B0000003B0000003B0000003B0000003B0000003B0000003B
      0000003B0000003B0000003B0000000000000000000000000000CC670100CC67
      0100CC670100CD680100CF680000F8BF8500F6B87200E5953F00E0892A000000
      00000000000000000000000000000000000000000000FBFBFB00FBFBFB00FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FBFBFB00000000000000000000000000D1825400E1A4
      5E00EEBD6400EFC76800EFCD6B00EFD16D00EFD26D00EFCF6C00EFC96900EFC1
      6500E6AD6000D58E5900C2695000FAFAFA0000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      00000000000000000000000000009A380A009A380A009A380A009A380A000000
      000000000000000000000000000000000000F1F1F1005B5B5B005B5B5B005B5B
      5B00585858005858580058585800575757005757570057575700575757005757
      5700575757005757570057575700FEFEFE000000000000000000EDBA8800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EEC9B600FEFEFE0000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      00000000000000000000000000009A380A009A380A009A380A009A380A000000
      000000000000000000000000000000000000F8F8F800939393009D9D9D009D9D
      9D009D9D9D009D9D9D009D9D9D009D9D9D009D9D9D009D9D9D009D9D9D009D9D
      9D009D9D9D009D9D9D004D4D4D00000000000000000000000000CBAB7B00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAB180000000000000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      0000000000000000000000000000F7BE8300F5B67100E4943F00E08729000000
      000000000000000000000000000000000000FEFEFE00D5D5D500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00CFCFCF00B3B3B300D4D4D400F8F8
      F800F8F8F800F8F8F80052525200000000000000000000000000C6B08500F7F7
      F700F3F3F300EFEFEF00EBEBEB00E7E7E700E3E3E300E0E0E000EDEDED008888
      8800FFFFFF00FFFFFF00CD9F69000000000000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      00000000000000000000000000009A380A009A380A009A380A009A380A000000
      00000000000000000000000000000000000000000000AFAFAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00979797009E9E9E00FFFFFF00FFFFFF00ADAD
      AD00B7B7B700F8F8F8006F6F6F00000000000000000000000000CFC6B100F4E9
      E800F4E9E800F5E9E900F7ECE900F9F1EA00FBF4EC00B9CDE0008AAFE300F7EE
      EE00F7EEEE00F8EEEE00B69B72000000000000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00595959007A7A7A00FFFFFF00FFFFFF00FFFF
      FF00CFCFCF00D3D3D30094949400000000000000000000000000E6E4E000F7F7
      F700F7F7F700F8F8F800F8F8F800F8F8F8006ACAF20003B8F600E3EFF600F9F9
      F900F9F9F900F9F9F900BCB4A6000000000000000000FEFEDD00BED3AC006294
      6400467D450043783E0055854F00799E6F0087A77C0090AE84006E966500316C
      2E00457A41007B9F710096B28A00000000000000000000000000CC6701000000
      0000000000000000000000000000F7BD8300F5B67000E4933F00DF8729000000
      000000000000000000000000000000000000000000006E6E6E00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE001F1F1F0045454500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00C7C7C700000000000000000000000000FCFCFC00F3F3
      F300F3F3F300F3F3F300F4F4F40069C8F10004BAF700A4E7FA00F5F5F500F5F5
      F500F5F5F500F6F6F600E1E1E1000000000000000000FEFEDD00F9FAD900EFF3
      D100E9EFCD00DFE7C400DAE3C000D1DDB900CBD9B500C2D2AD00BCCEA900B3C7
      A100ABC19B00A2BB940093B89700000000000000000000000000CC670100CC67
      0100CC670100CF6A0100CA640000F8BF8500F6B87100E5954000E08829000000
      0000000000000000000000000000000000000000000072727200F9F9F900F9F9
      F900F9F9F900F9F9F90009090900141414003F3F3F00FBFBFB00FBFBFB00FCFC
      FC00FCFCFC00DEDEDE00ECECEC0000000000000000000000000000000000E9DE
      DD00E2D7E000EADEDD0065C2EB0004BCF8009DE1F000EEE5E000ECE1DF00EBE0
      DF00ECE0DF00ECE0E000F2F2F2000000000000000000003B0000003B0000003B
      0000003B0000003B0000003B0000003B0000003B0000003B0000003B0000003B
      0000003B0000003B0000003B0000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082828200F4F4F400F4F4
      F400F5F5F500F5F5F500D4D4D4005151510072727200F6F6F600F7F7F700F7F7
      F700F7F7F700C6C6C600F8F8F80000000000000000000000000000000000ECE9
      E500DDDDEE0065C5EE0004BFF9009EE3F600EDEDED00EDEDED00EDEDED00EEEE
      EE00EEEEEE00EEEBE700FBFBFB000000000000000000333333008C8C8C00A6A6
      A6008C8C8C000000000000000000000000000000000000000000000000009999
      9900B3B3B3009999990033333300000000009A380A009A380A009A380A009A38
      0A009A380A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9D9D00B4D8BA00B4DC
      BD00B4E0BF00B5E3C000B5E5C100B5E6C200B4E5C100B6E7C300B6E6C300B6E5
      C200B6E3C10092A39500FEFEFE0000000000000000000000000000000000EBD7
      B70055B5EF0004C1FB009EE1F400E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900EAEAEA00E8CDB200000000000000000000000000333333008C8C8C00A6A6
      A6008C8C8C000000000000000000000000000000000000000000000000009999
      9900B3B3B3009696960033333300000000009A380A00F4B97F00E8A46100DA85
      2E009A380A000000000000000000000000000000000000000000000000000338
      FF00033DFF0000082400000000000000000000000000C0C0C000399F4500A5D6
      AC006CC77D0020B6420000B42C000ABB36006CD2820076D5890000B72D0074CF
      860062C474006081660000000000000000000000000000000000FDFDFD0054A4
      BF0004C3FC0094C7D500CFCFCF00ADADAD00CFCFCF00C7C7C700CDCDCD00CECE
      CE00B6B6B600C8C3BF00000000000000000000000000333333008C8C8C00B9B9
      B900999999003333330000000000000000000000000000000000333333009999
      9900BCBCBC008C8C8C0033333300000000009A380A009A380A009A380A009A38
      0A009A380A00000000000000000000000000000000000000000000000000033A
      FF000000000000000000000000000000000000000000EFEFEF00007607000085
      110003921A000899220000A3230000A8250000AA260015B0370011A2300000A0
      21000F9D290083858300000000000000000000000000FDFDFD004B98B80005C5
      FC008ACADA00F4F4F40000000000B0B0B00000000000B9B9B900FCFCFC00FCFC
      FC00B9B9B90000000000000000000000000000000000333333006C6C6C00BCBC
      BC009F9F9F006C6C6C003333330033333300333333003333330069696900ACAC
      AC00E9E9E9006C6C6C0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000338FF000338FF00000000000000000000000000E1E4E100DFE2
      DF00DADEDA00A6B0A700DFE3DF00DFE3DF00DFE3DF00DEE2DE00949E9600DFE3
      DF00DFE3DF00000000000000000000000000FDFDFD007588900005C7FE008FBC
      C800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333333009999
      9900D9D9D900DFDFDF00C9C9C900B9B9B900BCBCBC00D2D2D200F9F9F900BFBF
      BF00999999003333330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000338FF00000000000000000000000000000000000000
      0000FCFCFC00C7C7C70000000000000000000000000000000000B2B2B2000000
      00000000000000000000000000000000000080848F00DCDCDC00B1BEC1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006060
      600096969600F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E6E6009696
      9600666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090B6FF00B9BBC300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003333330033333300333333003333330033333300333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEEE00E1E1E100E1E1E100E1E1
      E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1
      E100E1E1E100E1E1E100E1E1E100000000000000000000000000000000000000
      0000FBFBFB00E0E0E000BFBFBF00B0B0B000B7B7B700D1D1D100F3F3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E70033BB81007C988C00F9F9F9000000
      0000000000000000000000000000000000007777770039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      390039393900393939003939390077777700B7B7B700DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00FEFEFE000000000000000000FCFCFC00BBBB
      BB00339D6D0000D97B0000E0830000E3860000E1840000DA7C000DC572008895
      8F00EDEDED000000000000000000000000000000000000000000000000000000
      00000000000000000000DDDDDD000FCE73002DE48C0000DF7600519C7700F2F2
      F200000000000000000000000000000000001616160016161600161616001616
      1600161616001616160016161600161616001C1C1C0077777700161616001616
      160016161600161616001616160016161600C7C7C700EFEFEF00EFEFEF00ECEC
      EC00EDEDED00F1F1F100F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700FEFEFE0000000000F7F7F700638D770000C1
      62002ACD7D00B5F4D600D3F8E400E0F9EB00D6F8E500C6F7DF0061DFA20000BD
      5E000FAF5E00D4D4D40000000000000000000000000000000000000000000000
      000000000000D0D0D0004AA7E1000DD76C00EEFEF800A4F4CB0000D4630027AC
      6300E6E6E6000000000000000000000000001616160016161600161616001616
      1600161616001616160016161600222222007777770000000000161616001616
      160016161600161616001616160016161600C8C8C800DFDFDF00E2E2E200E2E2
      E200E2E2E200E0E0E000DCDCDC00D5D5D500DDDDDD00DADADA00D1D1D100DBDB
      DB00D5D5D500D4D4D400F8F8F800FEFEFE00FDFDFD005B8F720003AE4E005DE9
      A0002EBC4B0039B74B004AB9570056BB60004EBA5A003DB74E002BB5420036CC
      66002FCA790003AE5000E5E5E500000000000000000000000000000000000000
      0000BBBBBB0066B8FE003198EB00BDFFE600C3FFE800AAFFDF0080F7C40000C9
      4E000EB94D00D6D6D60000000000000000001616160016161600161616001616
      1600161616001616160022222200777777000000000077777700222222001616
      160016161600161616001616160016161600C8C8C800F7F7F700F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800FEFEFE00CCCCCC0002A5420007D75D001BDD
      6800FFFFFF00E3FAEC00FFFFFF00EBFBF200F6FDF900F3FDF600E7FBEE00FFFF
      FF0000D8580018CD710038905B00FEFEFE000000000000000000FDFDFD00A1A4
      A60057ABFF004A9BFF009CE8FF007CDFE10089FFD30078FFCD0057FFC20038FC
      B60003BD390002B93200C3C3C300000000001616160016161600161616001616
      16001616160016161600666666000000000000000000CBCBCB00000000008686
      860039393900161616001616160016161600C8C8C800D3D3D300D0D0D000CCCC
      CC00CFCFCF00D6D6D600D0D0D000D2D2D200D4D4D400C9C9C900CACACA00C9C9
      C900D2D2D200E0E0E000F8F8F800FEFEFE003093530000CC510000D2510005DB
      5D00FFFFFF002CBA4600EEF7EE003CBB510081D08D0074CB810029BA4700FEFE
      FE0000D4540000CA4A0000A33F00EFEFEF0000000000F9F9F9007B899C002382
      FF004C95FF005EB1FF0074C4FF0081CFFF005ECAD8003AFFB9001BFFB10000FC
      A60005F49B000DB4280000AD1500C0C1C0006666660042424200424242004242
      4200333333001616160016161600161616005555550000000000161616001616
      160080808000D7D7D7001616160016161600C8C8C800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800FEFEFE0000A53D0000C3420000CD4C0000D5
      5500FFFFFF00B1F3CA00FBFDFB00C0F5D400DBF9E700D3F8E100BAF4D000E5F2
      E50000CF4F0000C6450000BF4300D5D6D500F1F1F1004D6DA200005FF0004285
      F6001276FE00388FFF0063ABFF005FB5E90044FDBA0048FCB90048F9B40049F5
      AF0034EF9F000CE6850011AE1900679867000000000000000000000000000000
      0000000000003939390016161600161616001616160055555500161616001C1C
      1C0077777700000000001616160016161600C8C8C800D6D6D600D4D4D400D2D2
      D200D2D2D200E0E0E000DFDFDF00DFDFDF00E4E4E400E3E3E300DCDCDC00E2E2
      E200E0E0E000E8E8E800F8F8F800FEFEFE0000B0360000BE3D0000C7460000CE
      4E00FFFFFF0029B54400EFF7EF004ABB5A0094D59C007ECE890048C06000C9EA
      CE0000C8480000C03F0000B73500C0C6C1002850AB000045D5002B67E2001B68
      EC004E8AF6004F8FFC00658ABD006AF5BA006AF6BB006AF5B9006AF3B60062EF
      AE006BEDAC006BE9A50067E39C0078A882000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001C1C
      1C0066666600C0C0C0001616160016161600C8C8C800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800FEFEFE0000AD2B0027C0500046CD6C0046D3
      7200FFFFFF005FDF8B00E7F5E90076E69E009AEDB7008FE6AA007FE4A000BCE7
      C50046CE6D003DC6610003B23100C1C7C2001438B6001544C7005C7EDE005E85
      E5005E8BEB009A878B00F6B96300D8B1450088F1BE0081F0B900F6C74A00FFCA
      4D0073E49B008AE8B00072BE9100000000000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001616
      160029292900333333001616160016161600C8C8C800F5F5F500F1F1F100F1F1
      F100F0F0F000EFEFEF00EEEEEE00F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800FEFEFE0001A2230055C66C0055CB720055D0
      7600FFFFFF00A3D5A300FDFEFD00BFE2BF00D4EBD400D0E9D000C5E4C500ACE0
      B50055CC730055C76E0045BD5C00E7E7E7004C5EBA007385D1007086D7006D88
      DD009C6F6D00ECAB7100F0B16C00F3B66800F0B25200FBBD5800FDC35C00FFC5
      5800FFC65200AFC9B60000000000000000000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001616
      160016161600161616001616160016161600C8C8C800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800FEFEFE005095590063C5740063C9780063CD
      7B00FFFFFF00D9F4E000CFF1D800CFF2D900CFF1D900CFF1D800F1FAF3009FDB
      A90063CA780063C6750014A82E00FEFEFE00FEFEFE007681C5008390D1008091
      D6007E92DA00976E7600EAAB7700EDAF7200F0B26E00F3B66A00F5B96600F8B9
      5D00D7D6D4000000000000000000000000000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001616
      16001616160016161600161616001616160065B3800052DA890052E0930052E6
      9D0052EBA60052F1B00052F6B90052FBC10052F7BB0052F2B20052ECA90052E7
      9F0052E1950052D88A0052C87C0000000000FCFCFC001FAA350071C87E0071CC
      8200FFFFFF007AD48E0071D2880071D3880071D3880071D18700C1EACA0099D6
      A10071C97F006CC477007A9F7C00000000000000000000000000777DB700939B
      D100919CD400909CD700766E9600E8AA7C00EAAC7800ECAE7400EEB06F00E184
      3000D07E2900DDDDDD0000000000000000000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001616
      16001616160016161600161616001616160035A95E0096E9B70070E6A60093F0
      C100A4F5D100D1FBE900F4FEFA00CCFDE900E1FDF20000ED8E0000E6820000DE
      750000D66600F7FCF900CBCBCB000000000000000000CDD3CD0041B350007ECB
      8900EEF7EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008DCF
      94007BC8840026902D0000000000000000000000000000000000000000008283
      AB00A2A5D0009598B40000000000F2F2F200E4A47D00E7A97E00E9AA7900EAAA
      7500DD7C2B00B4784B0000000000000000000000000000000000000000000000
      0000000000005555550016161600161616001616160016161600161616001616
      16001616160016161600161616001616160037A95D0070E09A0002D2600000DA
      6D0000E1780013E98D0000EC8C0000EF900000ED8D0006E9880000E27B0000DB
      6F0000D46200CBCBCB0000000000000000000000000000000000EBECEB000D98
      1B00ACDBB100F1F9F200F1F9F200F1F9F200F1F9F200F1F9F200F0F8F10046B2
      510077A278000000000000000000000000000000000000000000000000000000
      0000E8E8EA00000000000000000000000000FEFEFE00DD957300E4A58400E4A4
      7F00E5A27800C8BAB00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7DCD7003A933F001C9C270036AB40002AA435001091190091AD91000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2866E00D685
      6200FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000DE1FFFFFC0018001C01F8001C0008001
      DE1F0000C0008001DE1F0001C0018001DE1F0001C0018001DE1F8001C0018001
      DFFF8001C0018001DE1F8001C0018001C01F8001E0018001DFFF8001E00187E1
      07C38001E00387E107C38003C00383C107CB800382878001FFD9C0070FFFC003
      FFC1F3DF1FFFE007FFFEFFFF3FFFF81FFFFFFFFFFF3FFFFF0001F01FFE1F0000
      0000C007FC0F000000008003F807004000000001F003008000000000C00101A0
      0000000080000040000000000000F804000000000000F800000000000001F800
      000000000003F800000000000007F80000010001C003F80000018003E203F800
      0003C007F703FFFFFFFFF01FFFC7FFFF00000000000000000000000000000000
      000000000000}
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 119
    Top = 147
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 11184895
    end
  end
  object sqlFinanceiroCompromisso: TI9Query
    AfterScroll = sqlFinanceiroCompromissoAfterScroll
    OnCalcFields = sqlFinanceiroCompromissoCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LF.*, P.NOME, P.UTILIZA_BOLETO, '#13#10'    LA.PERIODO, LA.QTD,' +
        ' LA.PARCELA_INICIAL, LA.DOC_TIPO, LA.REFERENCIA_PERIODO,'#13#10'    LA' +
        '.TIPO_DESPESA_ID,'#13#10'coalesce((SELECT SUM(LC1.VALOR) FROM J_LIVRO_' +
        'CAIXA LC1'#13#10'WHERE LC1.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_I' +
        'D),0)'#13#10'AS VALOR_PAGO_SOMA,'#13#10#13#10'coalesce((SELECT SUM(LF2.VALOR_AGE' +
        'NDADO) FROM J_LIVRO_FINANCEIRO LF2'#13#10'WHERE LF2.ORCAMENTO_ID = LF.' +
        'LIVRO_AGENDAMENTO_ID'#13#10'  AND LF2.ANO_MES_REFERENCIA = LF.ANO_MES_' +
        'REFERENCIA'#13#10'  AND SITUACAO IN (1,2)),0)'#13#10'AS VALOR_ORCAMENTO_COMP' +
        'ROMETIDO,'#13#10#13#10'coalesce((SELECT SUM(LC2.VALOR) FROM J_LIVRO_CAIXA ' +
        'LC2'#13#10'WHERE LC2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID'#13#10'  AND LC2' +
        '.ANO_MES_REGISTRO = LF.ANO_MES_REFERENCIA),0)'#13#10'AS VALOR_ORCAMENT' +
        'O_PAGO,'#13#10#13#10'coalesce((SELECT SUM(OS.VALOR) FROM J_ORCAMENTO_RESER' +
        'VA OS'#13#10'WHERE OS.LIVRO_FINANCEIRO_DESTINO_ID = LF.LIVRO_FINANCEIR' +
        'O_ID),0)'#13#10'AS VALOR_RESERVA_ENTRADA,'#13#10#13#10'coalesce((SELECT SUM(OS.V' +
        'ALOR) FROM J_ORCAMENTO_RESERVA OS'#13#10'WHERE OS.LIVRO_FINANCEIRO_ORI' +
        'GEM_ID = LF.LIVRO_FINANCEIRO_ID),0)'#13#10'AS VALOR_RESERVA_SAIDA'#13#10#13#10'F' +
        'ROM J_LIVRO_FINANCEIRO LF'#13#10'LEFT OUTER JOIN J_PESSOA P ON'#13#10'LF.PES' +
        'SOA_ID = P.PESSOA_ID'#13#10'LEFT OUTER JOIN J_LIVRO_AGENDAMENTO LA ON'#13 +
        #10'LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID'#13#10#13#10'WHERE LF.S' +
        'ITUACAO IN ('#39'1'#39','#39'2'#39')'#13#10'ORDER BY LF.DATA_VENCIMENTO, LF.DATA_VENCI' +
        'MENTO, LF.ANO_MES_REFERENCIA')
    Left = 837
    Top = 267
    object sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID: TBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlFinanceiroCompromissoVALOR_AGENDADO: TBCDField
      FieldName = 'VALOR_AGENDADO'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlFinanceiroCompromissocalc_Referencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Referencia'
      Size = 10
      Calculated = True
    end
    object sqlFinanceiroCompromissoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlFinanceiroCompromissoCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object tt: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object sqlFinanceiroCompromissoBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlFinanceiroCompromissoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object sqlFinanceiroCompromissoPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissocalc_Selecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Selecionado'
    end
    object sqlFinanceiroCompromissoVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissoCALC_VALOR_RECEBER: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_RECEBER'
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_Observacao: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'calc_Observacao'
      Size = 500
      Calculated = True
    end
    object sqlFinanceiroCompromissoCALC_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_GRUPO'
      Size = 1
      Calculated = True
    end
    object sqlFinanceiroCompromissoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlFinanceiroCompromissocalc_TipoFinanceiro: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_TipoFinanceiro'
      Size = 1
      Calculated = True
    end
    object sqlFinanceiroCompromissoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlFinanceiroCompromissoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID: TBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissocalc_Entrada: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_Entrada'
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_saida: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_saida'
      Calculated = True
    end
    object sqlFinanceiroCompromissoIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlFinanceiroCompromissoCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 15
      Size = 2
    end
    object sqlFinanceiroCompromissoDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlFinanceiroCompromissoREGISTRO_PARCIAL: TStringField
      FieldName = 'REGISTRO_PARCIAL'
      Size = 1
    end
    object sqlFinanceiroCompromissoVALOR_PAGO_SOMA: TBCDField
      FieldName = 'VALOR_PAGO_SOMA'
      Precision = 15
      Size = 3
    end
    object sqlFinanceiroCompromissoUTILIZA_BOLETO: TStringField
      FieldName = 'UTILIZA_BOLETO'
      Size = 1
    end
    object sqlFinanceiroCompromissoORCAMENTO_ID: TBCDField
      FieldName = 'ORCAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO: TBCDField
      FieldName = 'VALOR_ORCAMENTO_COMPROMETIDO'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO: TBCDField
      FieldName = 'VALOR_ORCAMENTO_PAGO'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissocalc_caixa: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calc_caixa'
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_compromisso: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calc_compromisso'
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_historico: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_historico'
      Size = 120
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome'
      Size = 120
      Calculated = True
    end
    object sqlFinanceiroCompromissocalc_orcamento: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_orcamento'
      Calculated = True
    end
    object sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA: TBCDField
      FieldName = 'VALOR_RESERVA_ENTRADA'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA: TBCDField
      FieldName = 'VALOR_RESERVA_SAIDA'
      Precision = 20
      Size = 3
    end
    object sqlFinanceiroCompromissoCALC_SALDO: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SALDO'
    end
    object sqlFinanceiroCompromissoPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object sqlFinanceiroCompromissoPARCELA: TBCDField
      FieldName = 'PARCELA'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoQTD: TBCDField
      FieldName = 'QTD'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoPARCELA_INICIAL: TBCDField
      FieldName = 'PARCELA_INICIAL'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoCALC_PARCELA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_PARCELA'
      Size = 10
      Calculated = True
    end
    object sqlFinanceiroCompromissoDOC_TIPO: TStringField
      FieldName = 'DOC_TIPO'
      Size = 1
    end
    object sqlFinanceiroCompromissoRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlFinanceiroCompromissoREFERENCIA_PERIODO: TStringField
      FieldName = 'REFERENCIA_PERIODO'
      Size = 1
    end
    object sqlFinanceiroCompromissoTIPO_DESPESA_ID: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsFinanceiroCompromisso: TDataSource
    DataSet = sqlFinanceiroCompromisso
    Left = 836
    Top = 315
  end
  object ClientReserva: TClientDataSet
    PersistDataPacket.Data = {
      3F0100009619E0BD0100000018000000080000000000030000003F0111524553
      455256415F44455343524943414F010049000000010005574944544802000200
      5A000D56414C4F525F5245534552564108000400000001000753554254595045
      0200490006004D6F6E6579001242414C414E434554455F475255504F5F494404
      000100000000000D56414C4F525F454E54524144410800040000000100075355
      42545950450200490006004D6F6E6579000B56414C4F525F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000A524553455256
      415F494404000100000000000E53414C444F5F414E544552494F520800040000
      00010007535542545950450200490006004D6F6E6579000D524553554C544144
      4F5F4D4553080004000000010007535542545950450200490006004D6F6E6579
      000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Filter = 'VALOR_RESERVA <> 0'
    Filtered = True
    FieldDefs = <
      item
        Name = 'RESERVA_DESCRICAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_RESERVA'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESERVA_ID'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'RESULTADO_MES'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 473
    Top = 345
    object ClientReservaRESERVA_DESCRICAO: TStringField
      FieldName = 'RESERVA_DESCRICAO'
      Size = 90
    end
    object ClientReservaVALOR_RESERVA: TCurrencyField
      FieldName = 'VALOR_RESERVA'
    end
    object ClientReservaBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientReservaVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
    end
    object ClientReservaVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
    end
    object ClientReservaRESERVA_ID: TIntegerField
      FieldName = 'RESERVA_ID'
    end
    object ClientReservaSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientReservaRESULTADO_MES: TCurrencyField
      FieldName = 'RESULTADO_MES'
    end
  end
  object dtsCaixa: TDataSource
    DataSet = ClientCaixa
    Left = 412
    Top = 407
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 229
    Top = 147
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 13034466
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 4210688
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10867666
      TextColor = 4210688
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 4210688
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15132390
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 4210688
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clYellow
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 4210688
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10329344
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16749885
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15138815
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyleDestaque: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = 4707838
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 16247513
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14544093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16744448
      TextColor = clWindow
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14538385
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWindowText
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor]
      Color = 10867666
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 33023
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.FilterBox = cxStyle7
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
    object GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle26
      Styles.CaptionRow = cxStyle26
      Styles.CardBorder = cxStyle26
      Styles.RowCaption = cxStyle15
      BuiltIn = True
    end
    object GridTableViewStyleSheetLigth: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle43
      Styles.Content = cxStyle4
      Styles.Inactive = cxStyle12
      Styles.Selection = cxStyle16
      Styles.Footer = cxStyle8
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
    object cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.FilterBox = cxStyle7
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
    object cxTreeListStyleSheet1: TcxTreeListStyleSheet
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.Inactive = cxStyle12
      Styles.Selection = cxStyle16
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle13
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
  end
  object SchedulerDBStorage: TcxSchedulerDBStorage
    Reminders.Active = False
    Resources.Items = <>
    CustomFields = <>
    FieldNames.Caption = 'DESCRICAO'
    FieldNames.EventType = 'TIPO_EVENTO'
    FieldNames.Finish = 'PRAZO_DATA_FINAL'
    FieldNames.ID = 'TAREFA_ID'
    FieldNames.LabelColor = 'COR'
    FieldNames.Message = 'DESCRICAO'
    FieldNames.Options = 'OPCAO'
    FieldNames.ParentID = 'RESPONSAVEL_ID'
    FieldNames.ResourceID = 'USUARIO_AGENDOU_ID'
    FieldNames.Start = 'PRAZO_DATA_FINAL'
    FieldNames.State = 'STATUS'
    Left = 119
    Top = 193
  end
  object ClientListaCaixa: TClientDataSet
    PersistDataPacket.Data = {
      640000009619E0BD010000001800000003000000000003000000640008434149
      58415F494404000100000000000944455343524943414F010049000000010005
      5749445448020002003C0006524553554D4F0100490000000100055749445448
      020002001E000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'CAIXA_ID'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RESUMO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = ClientReservaCalcFields
    Left = 641
    Top = 369
    object ClientListaCaixaCAIXA_ID: TIntegerField
      FieldName = 'CAIXA_ID'
    end
    object ClientListaCaixaDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientListaCaixaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
  end
  object dtsListaCaixa: TDataSource
    DataSet = ClientListaCaixa
    Left = 644
    Top = 413
  end
  object PopupAjuste: TPopupMenu
    Left = 226
    Top = 297
    object ExportarExcel1: TMenuItem
      Caption = 'Exportar Excel'
      OnClick = ExportarExcel1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object SaltarLanamento1: TMenuItem
      Caption = 'Saltar Lan'#231'amento'
      OnClick = SaltarLanamento1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AlterarvalorPrevisto1: TMenuItem
      Caption = 'Alterar Valor Previsto'
      OnClick = AlterarvalorPrevisto1Click
    end
    object mniBoleto: TMenuItem
      Caption = 'Boleto'
      object GerarBoleto: TMenuItem
        Caption = 'Gerar Boleto'
        OnClick = GerarBoletoClick
      end
      object VisualizarImprimirBoleto: TMenuItem
        Caption = 'Visualizar/Imprimir Boleto'
        OnClick = VisualizarImprimirBoletoClick
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mniTransferirOrcamento: TMenuItem
      Caption = 'Transferir Valor Or'#231'amento'
      OnClick = mniTransferirOrcamentoClick
    end
    object FinalizarOramento1: TMenuItem
      Caption = 'Finalizar Or'#231'amento'
      OnClick = FinalizarOramento1Click
    end
  end
  object sqlLancamentoFavorito: TI9Query
    AfterScroll = sqlLancamentoFavoritoAfterScroll
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LC.*'#13#10'FROM J_LIVRO_CAIXA LC'#13#10'WHERE LC.FAVORITO_SITUACAO =' +
        ' '#39'S'#39#13#10'ORDER BY LC.LIVRO_CAIXA_ID')
    Left = 720
    Top = 271
    object sqlLancamentoFavoritoLIVRO_CAIXA_ID: TBCDField
      FieldName = 'LIVRO_CAIXA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlLancamentoFavoritoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object sqlLancamentoFavoritoPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoDATA_PAGAMENTO: TSQLTimeStampField
      FieldName = 'DATA_PAGAMENTO'
    end
    object sqlLancamentoFavoritoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object sqlLancamentoFavoritoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlLancamentoFavoritoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object sqlLancamentoFavoritoDOCUMENTO_DESCRICAO: TStringField
      FieldName = 'DOCUMENTO_DESCRICAO'
      Size = 30
    end
    object sqlLancamentoFavoritoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoLIVRO_FINANCEIRO_ID: TBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlLancamentoFavoritoANO_MES_REGISTRO: TStringField
      FieldName = 'ANO_MES_REGISTRO'
      Size = 10
    end
    object sqlLancamentoFavoritoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlLancamentoFavoritoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlLancamentoFavoritoCAIXA_TRANSFERENCIA_ID: TBCDField
      FieldName = 'CAIXA_TRANSFERENCIA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlLancamentoFavoritoCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlLancamentoFavoritoAUTOMATICO: TStringField
      FieldName = 'AUTOMATICO'
      Size = 1
    end
    object sqlLancamentoFavoritoCODIGO_FINALIZACAO: TBCDField
      FieldName = 'CODIGO_FINALIZACAO'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoORCAMENTO_HISTORICO_ID: TBCDField
      FieldName = 'ORCAMENTO_HISTORICO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoORCAMENTO_ID: TBCDField
      FieldName = 'ORCAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoINDICE_IMAGEM: TBCDField
      FieldName = 'INDICE_IMAGEM'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoDOC_TIPO: TStringField
      FieldName = 'DOC_TIPO'
      Size = 1
    end
    object sqlLancamentoFavoritoDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object sqlLancamentoFavoritoFAVORITO_SITUACAO: TStringField
      FieldName = 'FAVORITO_SITUACAO'
      Size = 1
    end
    object sqlLancamentoFavoritoFAVORITO_VALOR: TBCDField
      FieldName = 'FAVORITO_VALOR'
      Precision = 20
      Size = 3
    end
    object sqlLancamentoFavoritoASSOCIADO_ID: TBCDField
      FieldName = 'ASSOCIADO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoCOMPROMISSO_VENCIDO_ID: TBCDField
      FieldName = 'COMPROMISSO_VENCIDO_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoFAVORECIDO_ASSOCIADO: TStringField
      FieldName = 'FAVORECIDO_ASSOCIADO'
      Size = 1
    end
    object sqlLancamentoFavoritoTIPO_DESPESA_ID: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      Precision = 20
      Size = 2
    end
    object sqlLancamentoFavoritoDESCRICAO_AGRUPADOR: TStringField
      FieldName = 'DESCRICAO_AGRUPADOR'
      Size = 120
    end
    object sqlLancamentoFavoritoORDEM: TBCDField
      FieldName = 'ORDEM'
      Precision = 20
      Size = 2
    end
  end
  object dtsLancamentoFavorito: TDataSource
    DataSet = sqlLancamentoFavorito
    Left = 720
    Top = 326
  end
  object ClientCaixa: TClientDataSet
    PersistDataPacket.Data = {
      B60000009619E0BD010000001800000006000000000003000000B60008434149
      58415F49440400010000000000095052494E434950414C010049000000010005
      57494454480200020001000556414C4F52080004000000010007535542545950
      450200490006004D6F6E65790009504553534F415F4944040001000000000009
      44455343524943414F0100490000000100055749445448020002003C00065245
      53554D4F0100490000000100055749445448020002001E000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'CAIXA_ID'
        DataType = ftInteger
      end
      item
        Name = 'PRINCIPAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PESSOA_ID'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RESUMO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = ClientReservaCalcFields
    Left = 409
    Top = 345
    object ClientCaixaCAIXA_ID: TIntegerField
      FieldName = 'CAIXA_ID'
    end
    object ClientCaixaPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientCaixaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientCaixaPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object ClientCaixaDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientCaixaSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'SITUACAO'
      Size = 1
      Calculated = True
    end
    object ClientCaixaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
  end
  object dtsReserva: TDataSource
    DataSet = ClientReserva
    Left = 476
    Top = 407
  end
  object ClientSaldoReservaPrevisao: TClientDataSet
    PersistDataPacket.Data = {
      3F0100009619E0BD0100000018000000080000000000030000003F0111524553
      455256415F44455343524943414F010049000000010005574944544802000200
      5A000D56414C4F525F5245534552564108000400000001000753554254595045
      0200490006004D6F6E6579001242414C414E434554455F475255504F5F494404
      000100000000000D56414C4F525F454E54524144410800040000000100075355
      42545950450200490006004D6F6E6579000B56414C4F525F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000A524553455256
      415F494404000100000000000E53414C444F5F414E544552494F520800040000
      00010007535542545950450200490006004D6F6E6579000D524553554C544144
      4F5F4D4553080004000000010007535542545950450200490006004D6F6E6579
      000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'RESERVA_DESCRICAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_RESERVA'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESERVA_ID'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'RESULTADO_MES'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 425
    Top = 273
    object ClientSaldoReservaPrevisaoRESERVA_DESCRICAO: TStringField
      FieldName = 'RESERVA_DESCRICAO'
      Size = 90
    end
    object ClientSaldoReservaPrevisaoVALOR_RESERVA: TCurrencyField
      FieldName = 'VALOR_RESERVA'
    end
    object ClientSaldoReservaPrevisaoBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientSaldoReservaPrevisaoVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
    end
    object ClientSaldoReservaPrevisaoVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
    end
    object ClientSaldoReservaPrevisaoRESERVA_ID: TIntegerField
      FieldName = 'RESERVA_ID'
    end
    object ClientSaldoReservaPrevisaoSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientSaldoReservaPrevisaoRESULTADO_MES: TCurrencyField
      FieldName = 'RESULTADO_MES'
    end
  end
  object ClientSaldoReserva: TClientDataSet
    PersistDataPacket.Data = {
      3F0100009619E0BD0100000018000000080000000000030000003F0111524553
      455256415F44455343524943414F010049000000010005574944544802000200
      5A000D56414C4F525F5245534552564108000400000001000753554254595045
      0200490006004D6F6E6579001242414C414E434554455F475255504F5F494404
      000100000000000D56414C4F525F454E54524144410800040000000100075355
      42545950450200490006004D6F6E6579000B56414C4F525F5341494441080004
      000000010007535542545950450200490006004D6F6E6579000A524553455256
      415F494404000100000000000E53414C444F5F414E544552494F520800040000
      00010007535542545950450200490006004D6F6E6579000D524553554C544144
      4F5F4D4553080004000000010007535542545950450200490006004D6F6E6579
      000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'RESERVA_DESCRICAO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_RESERVA'
        DataType = ftCurrency
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_ENTRADA'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_SAIDA'
        DataType = ftCurrency
      end
      item
        Name = 'RESERVA_ID'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'RESULTADO_MES'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 564
    Top = 342
    object ClientSaldoReservaRESERVA_DESCRICAO: TStringField
      FieldName = 'RESERVA_DESCRICAO'
      Size = 90
    end
    object ClientSaldoReservaVALOR_RESERVA: TCurrencyField
      FieldName = 'VALOR_RESERVA'
    end
    object ClientSaldoReservaBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientSaldoReservaVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
    end
    object ClientSaldoReservaVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
    end
    object ClientSaldoReservaRESERVA_ID: TIntegerField
      FieldName = 'RESERVA_ID'
    end
    object ClientSaldoReservaSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ClientSaldoReservaRESULTADO_MES: TCurrencyField
      FieldName = 'RESULTADO_MES'
    end
  end
end