inherited frmCadCentroCusto: TfrmCadCentroCusto
  Caption = 'Centro de Custos'
  ClientHeight = 523
  ClientWidth = 818
  Color = 14872024
  ExplicitWidth = 834
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 818
    ExplicitWidth = 818
    inherited PanelBotoesBasicos: TPanel
      Width = 730
      ExplicitWidth = 730
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 346
          Visible = False
          ExplicitLeft = 346
        end
        inherited cxBtnCancelar: TcxButton
          Left = 277
          ExplicitLeft = 277
        end
        inherited cxBtnGravar: TcxButton
          Left = 209
          ExplicitLeft = 209
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 732
      ExplicitLeft = 732
    end
  end
  inherited StatusBar: TStatusBar
    Top = 502
    Width = 818
    ExplicitTop = 502
    ExplicitWidth = 818
  end
  inherited PanelGeral: TPanel
    Width = 818
    Height = 442
    ExplicitWidth = 818
    ExplicitHeight = 442
    inherited PanelData: TPanel
      Width = 816
      Height = 121
      ExplicitWidth = 816
      ExplicitHeight = 121
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 814
        Height = 119
        Align = alClient
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.TabIndex = 0
        Properties.Tabs.Strings = (
          '')
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        OnChange = tabBalanceteChange
        OnChanging = tabBalanceteChanging
        ClientRectBottom = 118
        ClientRectLeft = 1
        ClientRectRight = 813
        ClientRectTop = 22
        object pnlDados: TPanel
          Left = 1
          Top = 22
          Width = 812
          Height = 96
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object chbSituacao: TcxDBCheckBox
            Left = 709
            Top = 10
            AutoSize = False
            Caption = 'Ativo'
            DataBinding.DataField = 'SITUACAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DisplayChecked = 'A'
            Properties.DisplayGrayed = 'I'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'A'
            Properties.ValueUnchecked = 'I'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
            Height = 22
            Width = 63
          end
          object cxLabel1: TcxLabel
            Left = 12
            Top = 12
            Caption = 'Descri'#231#227'o:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object chxPrincipal: TcxDBCheckBox
            Left = 618
            Top = 10
            RepositoryItem = dtmLookup.Check_SimNao
            AutoSize = False
            Caption = 'Principal'
            DataBinding.DataField = 'PRINCIPAL'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Properties.DisplayChecked = 'A'
            Properties.DisplayGrayed = 'I'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'A'
            Properties.ValueUnchecked = 'I'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.TextColor = clGray
            TabOrder = 2
            Transparent = True
            Height = 22
            Width = 94
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 619
            Top = 32
            RepositoryItem = dtmLookup.Check_SimNao
            AutoSize = False
            Caption = 'Item Balancete Global'
            DataBinding.DataField = 'TIPO_GLOBAL'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayGrayed = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.TextColor = clGray
            TabOrder = 3
            Transparent = True
            Height = 23
            Width = 176
          end
          object cxLabel3: TcxLabel
            Left = 12
            Top = 41
            Caption = 'Tipo:'
            Style.TextColor = 4210688
            Style.TextStyle = []
            Transparent = True
          end
          object edtDescricao: TcxDBTextEdit
            Left = 71
            Top = 10
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 5
            Width = 537
          end
          object icxEspecie: TcxDBImageComboBox
            Left = 71
            Top = 39
            RepositoryItem = dtmLookupContabil.Combo_TipoCentroCusto
            DataBinding.DataField = 'TIPO_ITEM'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <>
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 6
            Width = 171
          end
          object cxDBCheckBox2: TcxDBCheckBox
            Left = 619
            Top = 58
            RepositoryItem = dtmLookup.Check_SimNao
            AutoSize = False
            Caption = 'Personalizado'
            DataBinding.DataField = 'PERSONALIZADO'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            ParentFont = False
            Properties.DisplayChecked = 'S'
            Properties.DisplayGrayed = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.TextColor = clGray
            TabOrder = 7
            Transparent = True
            Height = 23
            Width = 176
          end
        end
        object lblInformacao: TcxLabel
          Left = 13
          Top = 94
          Caption = 
            '* Para modificar o Centro de Custo principal, pressione com o bo' +
            't'#227'o direito do mouse no item desejado.'
          ParentColor = False
          ParentFont = False
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Times New Roman'
          Style.Font.Style = []
          Style.TextColor = 4210688
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
    end
    object tabCentroCusto: TcxTabControl
      Left = 1
      Top = 122
      Width = 816
      Height = 319
      Align = alClient
      TabOrder = 1
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Item do Centro de Custo'
        'Grupo do Centro de Custo')
      LookAndFeel.Kind = lfOffice11
      OnChange = tabCentroCustoChange
      ClientRectBottom = 319
      ClientRectRight = 816
      ClientRectTop = 25
      object pgcDados: TcxPageControl
        Left = 0
        Top = 25
        Width = 816
        Height = 294
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tabItensCentro
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.Kind = lfUltraFlat
        OnChange = pgcDadosChange
        ClientRectBottom = 294
        ClientRectRight = 816
        ClientRectTop = 25
        object tabItensCentro: TcxTabSheet
          Caption = 'Descri'#231#227'o do Centro/Grupo'
          ImageIndex = 0
          object grdBasica: TcxGrid
            Left = 0
            Top = 0
            Width = 816
            Height = 269
            Align = alClient
            PopupMenu = popCentroCusto
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
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
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              DataController.DataSource = SourceAncestral
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
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object cxGridPesquisaColumn1: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'DESCRICAO'
                Width = 519
              end
              object cxGridPesquisaColumn2: TcxGridDBColumn
                Caption = 'Principal'
                DataBinding.FieldName = 'PRINCIPAL'
                RepositoryItem = dtmLookupFinanceiro.ComboCaixas
                Width = 117
              end
              object cxGridPesquisaColumn3: TcxGridDBColumn
                Caption = 'Situa'#231#227'o'
                DataBinding.FieldName = 'SITUACAO'
                RepositoryItem = dtmLookup.Combo_AtivoInativo
                Width = 120
              end
            end
            object grdBasicaLevel1: TcxGridLevel
              GridView = cxGridPesquisa
            end
          end
        end
        object tabRateio: TcxTabSheet
          Caption = 'Rateio Percentual Grupo %'
          ImageIndex = 1
          object cxGrid1: TcxGrid
            Left = 0
            Top = 48
            Width = 816
            Height = 221
            Align = alClient
            TabOrder = 0
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
              DataController.DataSource = dtsRateioCentroCusto
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total:0'
                  Kind = skCount
                  FieldName = 'NATUREZA_ID'
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ColumnHeaderHints = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Inactive = dtmControles.cxStyle19
              Styles.Selection = dtmControles.cxStyle23
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'Centro de Custo'
                DataBinding.FieldName = 'CENTRO_CUSTO_RATEIO_ID'
                RepositoryItem = dtmLookupContabil.Lista_CentroCustoTodos
                Width = 451
              end
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = '%'
                DataBinding.FieldName = 'PERCENTUAL'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = '% 0.00;'
                HeaderAlignmentHorz = taCenter
                Width = 99
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 816
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 1
            object lblCentroCusto: TcxLabel
              Left = 10
              Top = 3
              Caption = 'Centro de Custo'
              Style.TextColor = 4210688
              Style.TextStyle = []
              Transparent = True
            end
            object cxLabel2: TcxLabel
              Left = 365
              Top = 3
              Caption = '%Porcentagem'
              Style.TextColor = 4210688
              Style.TextStyle = []
              Transparent = True
            end
            object lcxCentroCusto: TcxLookupComboBox
              Left = 10
              Top = 20
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.GridMode = True
              Properties.KeyFieldNames = 'CENTRO_CUSTO_ID'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRICAO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dtsCentroCustoItens
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextColor = clBlack
              Style.TextStyle = [fsBold]
              TabOrder = 2
              Width = 350
            end
            object edtPercentual: TcxCurrencyEdit
              Left = 364
              Top = 20
              Properties.DisplayFormat = '% 0.00'
              Style.BorderColor = clWindowText
              Style.BorderStyle = ebsSingle
              Style.HotTrack = True
              Style.Shadow = False
              TabOrder = 3
              Width = 89
            end
            object btnAdicionarCentro: TcxButton
              Left = 457
              Top = 19
              Width = 30
              Height = 25
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
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Orientation = 900
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnAdicionarCentroClick
            end
            object btnExcluirItem: TcxButton
              Left = 490
              Top = 19
              Width = 30
              Height = 25
              Cursor = crHandPoint
              Hint = 'Excluir Parcela'
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
              TabOrder = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Orientation = 900
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnExcluirItemClick
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 381
    Top = 242
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT *'#13#10'FROM J_CENTRO_CUSTO'#13#10'WHERE  ((BALANCETE_GRUPO_ID = :BA' +
      'LANCETE_GRUPO_ID)'#13#10'      OR (TIPO_GLOBAL = '#39'S'#39'))'#13#10'     AND TIPO_' +
      'CENTRO = :TIPO_CENTRO'#13#10'ORDER BY DESCRICAO'
    Params = <
      item
        DataType = ftUnknown
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_CENTRO'
        ParamType = ptInput
      end>
    Left = 411
    Top = 242
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 443
    Top = 242
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 475
    Top = 242
    object ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientAncestralTIPO_GLOBAL: TStringField
      FieldName = 'TIPO_GLOBAL'
      Size = 1
    end
    object ClientAncestralTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object ClientAncestralPERSONALIZADO: TStringField
      FieldName = 'PERSONALIZADO'
      Size = 1
    end
    object ClientAncestralTIPO_CENTRO: TStringField
      FieldName = 'TIPO_CENTRO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 507
    Top = 242
  end
  object popCentroCusto: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 380
    Top = 284
    object mniDefinirCentroCustoPrincipal: TMenuItem
      Caption = 'Definir como Centro de Custo Principal'
      ImageIndex = 45
      OnClick = mniDefinirCentroCustoPrincipalClick
    end
  end
  object sqlRateioCentroCusto: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT *'#13#10'FROM J_CENTRO_CUSTO_PERSONALIZADO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    IndexFieldNames = 'CENTRO_CUSTO_PADRAO_ID'
    MasterFields = 'CENTRO_CUSTO_ID'
    MasterSource = SourceAncestral
    PacketRecords = 0
    Params = <>
    AfterScroll = sqlRateioCentroCustoAfterScroll
    Left = 172
    Top = 248
    object sqlRateioCentroCustoCENTRO_CUSTO_PERSONALIZADO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_PERSONALIZADO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlRateioCentroCustoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Precision = 20
      Size = 2
    end
    object sqlRateioCentroCustoCENTRO_CUSTO_PADRAO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_PADRAO_ID'
      Precision = 20
      Size = 2
    end
    object sqlRateioCentroCustoCENTRO_CUSTO_RATEIO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_RATEIO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsRateioCentroCusto: TDataSource
    DataSet = sqlRateioCentroCusto
    Left = 172
    Top = 304
  end
  object sqlCentroCustoItens: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID, PERSONALI' +
      'ZADO'#13#10'FROM J_CENTRO_CUSTO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'    AND BALANC' +
      'ETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'    AND TIPO_CENTRO = :TIPO_' +
      'CENTRO '#13#10'    AND TIPO_ITEM = '#39'1'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_CENTRO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 660
    Top = 248
    object sqlCentroCustoItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCentroCustoItensCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoItensBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCentroCustoItens: TDataSource
    DataSet = sqlCentroCustoItens
    Left = 660
    Top = 300
  end
end
