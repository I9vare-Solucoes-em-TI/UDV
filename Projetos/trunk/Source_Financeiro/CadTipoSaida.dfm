inherited frmCadTipoSaida: TfrmCadTipoSaida
  Caption = 'Identificador de Despesa/Sa'#237'da'
  ClientHeight = 425
  ClientWidth = 770
  ExplicitWidth = 786
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 770
    ExplicitWidth = 770
    inherited PanelBotoesBasicos: TPanel
      Width = 688
      ExplicitWidth = 688
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 690
      ExplicitLeft = 690
      ExplicitTop = 2
      inherited cxBtnFechar: TcxButton
        Left = 6
        ExplicitLeft = 6
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 405
    Width = 770
    ExplicitTop = 405
    ExplicitWidth = 770
  end
  inherited PanelGeral: TPanel
    Width = 770
    Height = 349
    ExplicitWidth = 770
    ExplicitHeight = 349
    inherited PanelData: TPanel
      Width = 768
      Height = 69
      ExplicitWidth = 768
      ExplicitHeight = 69
      object cxLabel1: TcxLabel
        Left = 9
        Top = 4
        Caption = 'Descri'#231#227'o'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object cxLabel2: TcxLabel
        Left = 366
        Top = 4
        Caption = 'Respons'#225'vel'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object edtDescricao: TcxDBTextEdit
        Left = 9
        Top = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 352
      end
      object lcxResponsavel: TcxDBLookupComboBox
        Left = 367
        Top = 21
        RepositoryItem = dtmLookup.Lista_AssociadosAtivos
        DataBinding.DataField = 'PESSOA_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 354
      end
      object chbSituacao: TcxDBCheckBox
        Left = 7
        Top = 43
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
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 21
        Width = 59
      end
      object chxExigeResponsavel: TcxDBCheckBox
        Left = 68
        Top = 43
        AutoSize = False
        Caption = 'Exige Respons'#225'vel'
        DataBinding.DataField = 'EXIGE_RESPONSAVEL'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleDisabled.TextColor = clRed
        StyleDisabled.TextStyle = []
        TabOrder = 5
        Height = 21
        Width = 123
      end
      object chxPadraoSistema: TcxDBCheckBox
        Left = 194
        Top = 43
        AutoSize = False
        Caption = 'Padr'#227'o do Sistema'
        DataBinding.DataField = 'INTERNO'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayGrayed = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleDisabled.TextColor = clRed
        StyleDisabled.TextStyle = []
        TabOrder = 6
        Height = 21
        Width = 123
      end
      object cxButton3: TcxButton
        Left = 724
        Top = 19
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
        TabOrder = 7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Orientation = 900
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton3Click
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 70
      Width = 768
      Height = 278
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 0
      ExplicitTop = 71
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
          Width = 257
        end
        object cxGridPesquisaColumn4: TcxGridDBColumn
          Caption = 'Respons'#225'vel'
          DataBinding.FieldName = 'PESSOA_ID'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = dtmLookup.Lista_AssociadosAtivos
          Width = 326
        end
        object cxGridPesquisaColumn3: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 88
        end
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Padr'#227'o Sistema'
          DataBinding.FieldName = 'INTERNO'
          RepositoryItem = dtmLookup.Combo_SimNao
          Width = 95
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = cxGridPesquisa
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 89
    Top = 214
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM J_TIPO_DESPESA'#13#10'ORDER BY DESCRICAO')
    Left = 119
    Top = 214
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 151
    Top = 214
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    AfterScroll = ClientAncestralAfterScroll
    Top = 216
    object ClientAncestralTIPO_DESPESA_ID: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 1
    end
    object ClientAncestralPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralEXIGE_RESPONSAVEL: TStringField
      FieldName = 'EXIGE_RESPONSAVEL'
      Size = 1
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 215
    Top = 214
  end
end