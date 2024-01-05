inherited frmAtoAndamento: TfrmAtoAndamento
  Left = 323
  Top = 143
  Caption = 'Andamento do Ato'
  ClientWidth = 755
  OldCreateOrder = True
  ExplicitWidth = 771
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited PanelBotoesBasicos: TPanel
      Width = 606
      Visible = False
      ExplicitWidth = 606
    end
    inherited PanelBotaoFechar: TPanel
      Left = 608
      Width = 145
      ExplicitLeft = 608
      ExplicitWidth = 145
      inherited cxBtnFechar: TcxButton
        Left = 82
        ExplicitLeft = 82
      end
      object btnPesquisaPessoa: TcxButton
        Left = 23
        Top = 4
        Width = 57
        Height = 45
        Cursor = crHandPoint
        Hint = 'Pesquisar por Pessoa'
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnPesquisaPessoaClick
        Colors.Default = clWhite
        OptionsImage.Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000E7E7
          E7008181810042424200BFBFBF00181818006A6A6A00A3A3A300FFFFFF00D0D0
          D00030303000585858000A0A0A008E8E8E00B4B4B400F5F5F5006F6F6F002828
          2800DCDCDC00C9C9C900A6A6A600A1A1A100F3F3F30066666600040404007474
          74003A3A3A0048484800ADADAD001111110087878700EEEEEE00D9D9D900F8F8
          F8001E1E1E00C5C5C50060606000E5E5E500EDEDED00D7D7D700101010009494
          94007B7B7B00363636008C8C8C0046464600CCCCCC00FCFCFC00EAEAEA008585
          8500C3C3C30093939300E0E0E0004C4C4C00161616006C6C6C00060606007070
          70004A4A4A00F1F1F100DBDBDB001B1B1B00A7A7A700C7C7C700838383004444
          4400C1C1C10033333300767676003D3D3D00AFAFAF0014141400FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000080808080808
          0808080808080808080808080808080808080808080808080808080808080808
          080808080F2B3108080808080808080808080808080808080808081635000C07
          080808080808080808080808080808080808161B000000181E08080808080808
          080808080808080808213A00000000000B080808080808080808080808080808
          162D000000000039080808080808080808080808080808161B00000000000608
          0808080808080808080808080808213A00000000003708080808080808080808
          2307070742123A000000000037080808080808080808091B0000000000050000
          00000006080808080808080808321D002D070E1C240000000000370808080808
          08080808343D1807080808080823220018100808080808080808080839002908
          0808080808082E00221608080808080808080830364321080808080808080824
          380408080808080808080827002A0808080808080808081C0015080808080808
          0808082E00020808080808080808080E00070808080808080808082000060808
          080808080808081400070808080808080808083B112226080808080808080803
          3813080808080808080808080D00060808080808080807001B2F080808080808
          080808080F450037260808080F33001D09080808080808080808080808251A00
          363940190A00052308080808080808080808080808083B2C1100000047443C08
          080808080808080808080808080808081F3C2E27010808080808080808080808
          0808080808080808080808080808080808080808080808080808}
        OptionsImage.Layout = blGlyphTop
      end
    end
  end
  inherited StatusBar: TStatusBar
    Width = 755
    ExplicitWidth = 755
  end
  inherited PanelGeral: TPanel
    Width = 755
    ExplicitTop = 56
    ExplicitWidth = 755
    inherited PanelData: TPanel
      Width = 753
      Height = 38
      ExplicitWidth = 753
      ExplicitHeight = 38
      object cxLabel1: TcxLabel
        Left = 9
        Top = 10
        Caption = 'Andamento:'
      end
      object cxLabel3: TcxLabel
        Left = 294
        Top = 9
        Caption = 'Complemento:'
      end
      object lcxTipoAndamento: TcxDBLookupComboBox
        Left = 71
        Top = 8
        DataBinding.DataField = 'TB_ANDAMENTOSERVICO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'TB_ANDAMENTOSERVICO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsAndamentoServico
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 215
      end
      object edtDescricao: TcxDBTextEdit
        Left = 367
        Top = 8
        DataBinding.DataField = 'COMPLEMENTO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 373
      end
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 137
      Width = 753
      Height = 208
      Align = alClient
      TabOrder = 1
      object grdBasicaDBTableView1: TcxGridDBTableView
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
        DataController.DataModeController.GridMode = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBProtocolo: TcxGridDBColumn
          Caption = 'Protocolo'
          DataBinding.FieldName = 'calc_Protocolo'
          Visible = False
          Width = 78
        end
        object cxGridBasicaDBData: TcxGridDBColumn
          Caption = 'Data/Hora'
          DataBinding.FieldName = 'DATA_ANDAMENTO'
          Width = 132
        end
        object cxGridBasicaDBUsuario: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO_ID'
          RepositoryItem = dtmLookup.listaG_Usuario
          Width = 100
        end
        object cxGridBasicaDBAndamento: TcxGridDBColumn
          Caption = 'Andamento'
          DataBinding.FieldName = 'TB_ANDAMENTOSERVICO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.KeyFieldNames = 'TB_ANDAMENTOSERVICO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dtsAndamentoServicoGeral
          Width = 207
        end
        object grdBasicaDBTableView1DBColumn1: TcxGridDBColumn
          Caption = 'Complemento'
          DataBinding.FieldName = 'COMPLEMENTO'
          Width = 214
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = grdBasicaDBTableView1
      end
    end
    object gbxPainelPesquisa: TcxGroupBox
      Left = 1
      Top = 39
      Align = alTop
      Caption = ' Pesquisar '
      ParentColor = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 2
      Height = 98
      Width = 753
      object cxLabel2: TcxLabel
        Left = 14
        Top = 21
        Caption = 'Protocolo:'
      end
      object cxLabel6: TcxLabel
        Left = 126
        Top = 21
        Caption = 'Andamento:'
      end
      object cxLabel4: TcxLabel
        Left = 398
        Top = 21
        Caption = 'Usu'#225'rio:'
      end
      object edtPesqProtocolo: TcxTextEdit
        Left = 66
        Top = 20
        ParentFont = False
        Properties.MaxLength = 7
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        OnEnter = edtPesqProtocoloEnter
        OnKeyDown = edtPesqProtocoloKeyDown
        OnKeyPress = edtPesqProtocoloKeyPress
        Width = 52
      end
      object icxAndamentoServico: TcxLookupComboBox
        Left = 190
        Top = 20
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'TB_ANDAMENTOSERVICO_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsAndamentoServicoGeral
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        OnEnter = icxAndamentoServicoEnter
        Width = 195
      end
      object lcxUsuario: TcxLookupComboBox
        Left = 443
        Top = 20
        RepositoryItem = dtmLookup.listaG_Usuario
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        OnEnter = icxAndamentoServicoEnter
        Width = 184
      end
      object btnPesquisar: TcxButton
        Left = 638
        Top = 16
        Width = 106
        Height = 25
        Cursor = crArrow
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnPesquisarClick
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
      object cxLabel5: TcxLabel
        Left = 14
        Top = 48
        Caption = 'Primeiro Outorgado:'
      end
      object edtOutorgado: TcxTextEdit
        Left = 14
        Top = 64
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        Width = 363
      end
      object cxLabel7: TcxLabel
        Left = 382
        Top = 48
        Caption = 'Primeiro Outorgante:'
      end
      object edtOutorgante: TcxTextEdit
        Left = 382
        Top = 64
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 363
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 445
    Top = 266
    inherited ExecutePesquisa: TAction
      Visible = False
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT * '#13#10'FROM T_ATO_ANDAMENTO'#13#10'WHERE ATO_ID = :ATO_ID'#13#10'ORDER B' +
      'Y ATO_ANDAMENTO_ID')
    Params = <
      item
        DataType = ftBCD
        Name = 'ATO_ID'
        ParamType = ptInput
      end>
    Left = 475
    Top = 266
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 507
    Top = 266
  end
  inherited ClientAncestral: TClientDataSet
    BeforeOpen = ClientAncestralBeforeOpen
    AfterOpen = ClientAncestralAfterOpen
    BeforePost = ClientAncestralBeforePost
    AfterScroll = ClientAncestralAfterScroll
    OnCalcFields = ClientAncestralCalcFields
    Left = 539
    Top = 266
    object ClientAncestralATO_ANDAMENTO_ID: TBCDField
      FieldName = 'ATO_ANDAMENTO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralTB_ANDAMENTOSERVICO_ID: TBCDField
      FieldName = 'TB_ANDAMENTOSERVICO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralATO_ID: TBCDField
      FieldName = 'ATO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralDATA_ANDAMENTO: TSQLTimeStampField
      FieldName = 'DATA_ANDAMENTO'
    end
    object ClientAncestralOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 1
    end
    object ClientAncestralcalc_Protocolo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calc_Protocolo'
      Calculated = True
    end
    object ClientAncestralCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 571
    Top = 266
  end
  object sqlAndamentoServcoGeral: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = ('SELECT *'#13#10'FROM T_TB_ANDAMENTOSERVICO'#13#10'ORDER BY DESCRICAO')
    ParamData = <>
    Params = <>
    Left = 448
    Top = 304
    object sqlAndamentoServcoGeralTB_ANDAMENTOSERVICO_ID: TBCDField
      FieldName = 'TB_ANDAMENTOSERVICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlAndamentoServcoGeralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlAndamentoServcoGeralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlAndamentoServcoGeralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsAndamentoServicoGeral: TDataSource
    DataSet = sqlAndamentoServcoGeral
    Left = 480
    Top = 304
  end
  object sqlAndamentoServico: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_TB_ANDAMENTOSERVICO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'    ' +
      ' AND TIPO = '#39'G'#39)
    ParamData = <>
    Params = <>
    Left = 396
    Top = 264
    object sqlAndamentoServicoTB_ANDAMENTOSERVICO_ID: TBCDField
      FieldName = 'TB_ANDAMENTOSERVICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlAndamentoServicoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlAndamentoServicoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlAndamentoServicoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsAndamentoServico: TDataSource
    DataSet = sqlAndamentoServico
    Left = 396
    Top = 304
  end
end
