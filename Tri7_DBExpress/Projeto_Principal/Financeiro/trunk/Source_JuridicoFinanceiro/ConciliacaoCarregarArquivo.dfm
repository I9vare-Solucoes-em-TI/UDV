inherited frmConciliacaoArquivoCarregar: TfrmConciliacaoArquivoCarregar
  ClientHeight = 281
  ClientWidth = 717
  OnActivate = FormActivate
  ExplicitWidth = 723
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 717
    ExplicitWidth = 717
    inherited lblInformaca: TcxLabel
      Caption = 'Carregar Arquivo Concilia'#231#227'o'
      Style.IsFontAssigned = True
      ExplicitWidth = 422
      Width = 422
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 457
      ExplicitLeft = 457
      inherited btnCancelar: TcxButton
        LookAndFeel.SkinName = ''
      end
      inherited btnConfirmar: TcxButton
        Enabled = False
        LookAndFeel.SkinName = ''
      end
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 243
    ExplicitWidth = 717
    ExplicitHeight = 243
    object progressBar: TcxProgressBar
      Left = 2
      Top = 2
      Align = alTop
      Properties.BeginColor = 16384
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Visible = False
      Width = 713
    end
    object Panel3: TPanel
      Left = 2
      Top = 23
      Width = 713
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object cxLabel1: TcxLabel
        Left = 13
        Top = 10
        Caption = 'Conta Banc'#225'ria'
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Transparent = True
      end
      object lcbConta: TcxLookupComboBox
        Left = 14
        Top = 28
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.GridMode = True
        Properties.KeyFieldNames = 'CAIXA_ID'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = frmConciliacaoBancaria.dtsContasBancarias
        Properties.OnChange = lcbContaPropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 1
        Width = 277
      end
      object edtRetorno: TcxTextEdit
        Left = 297
        Top = 28
        Enabled = False
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
        TabOrder = 2
        Width = 371
      end
      object cxLabel2: TcxLabel
        Left = 295
        Top = 10
        Caption = 'Arquivo de Concilia'#231#227'o (OFX)'
        Style.TextColor = 4210688
        Style.TextStyle = [fsUnderline]
        Transparent = True
      end
      object btnCarregarArquivo: TcxButton
        Left = 674
        Top = 27
        Width = 34
        Height = 22
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
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCarregarArquivoClick
      end
    end
    object cxGridConciliacao: TcxGrid
      Left = 2
      Top = 80
      Width = 713
      Height = 161
      Align = alClient
      TabOrder = 2
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
        DataController.DataSource = dtsClientDataConciliacao
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
          end>
        DataController.Summary.SummaryGroups = <>
        Images = dtmControles.imgCadBasicos
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Preview.Visible = True
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = 'Data Concilia'#231#227'o'
          DataBinding.FieldName = 'DATA'
          PropertiesClassName = 'TcxDateEditProperties'
          Options.Editing = False
          Options.Focusing = False
          Width = 160
        end
        object cxGridDBTableView1Situacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Ja Importado'
              ImageIndex = 6
              Value = '2'
            end
            item
              Description = 'Aguardando Importa'#231#227'o'
              ImageIndex = 8
              Value = '1'
            end>
          Options.Editing = False
          Options.Focusing = False
          Width = 180
        end
        object cxGridDBTableView1Selecionado: TcxGridDBColumn
          Caption = 'Carregar'
          DataBinding.FieldName = 'CALC_SELECIONADO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          OnCustomDrawCell = cxGridDBTableView1SelecionadoCustomDrawCell
          Width = 371
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    Left = 487
    Top = 41
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 519
    Top = 41
  end
  inherited ClientAncestral: TClientDataSet
    Left = 551
    Top = 41
  end
  inherited SourceAncestral: TDataSource
    Left = 583
    Top = 41
  end
  object ClientArquivo: TClientDataSet
    PersistDataPacket.Data = {
      200200009619E0BD010000001800000012000000000003000000200204444154
      410100490000000100055749445448020002000F000944455343524943414F01
      004900000001000557494454480200020078000556414C4F5208000400000001
      0007535542545950450200490006004D6F6E657900084F5045524143414F0100
      490000000100055749445448020002000A000249440100490000000100055749
      445448020002001E0009444F43554D454E544F01004900000001000557494454
      48020002003C0008534954554143414F01004900000001000557494454480200
      020001000A4F42534552564143414F0100490000000100055749445448020002
      0078000E4C4956524F5F43414958415F49440400010000000000134C4956524F
      5F46494E414E434549524F5F494404000100000000000A4C414E43414D454E54
      4F0100490000000100055749445448020002000100084C4942455241444F0100
      4900000001000557494454480200020001000756494E43554C4F010049000000
      01000557494454480200020001000A5245474953545241444F02000300000000
      0008414C54455241444F0200030000000000064D4F44454C4F01004900000001
      00055749445448020002000100155245414C495A41525F504C414E454A414D45
      4E544F010049000000010005574944544802000200010016434F4E43494C4941
      43414F5F56494E43554C4F5F4944010049000000010005574944544802000200
      0F000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LIVRO_CAIXA_ID'
        DataType = ftInteger
      end
      item
        Name = 'LIVRO_FINANCEIRO_ID'
        DataType = ftInteger
      end
      item
        Name = 'LANCAMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LIBERADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VINCULO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REGISTRADO'
        DataType = ftBoolean
      end
      item
        Name = 'ALTERADO'
        DataType = ftBoolean
      end
      item
        Name = 'MODELO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REALIZAR_PLANEJAMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONCILIACAO_VINCULO_ID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CALC_SELECIONADO'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 346
    Top = 4
    object ClientArquivoDATA: TStringField
      FieldName = 'DATA'
      Size = 15
    end
    object ClientArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientArquivoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientArquivoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 10
    end
    object ClientArquivoID: TStringField
      FieldName = 'ID'
      Size = 30
    end
    object ClientArquivoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 60
    end
    object ClientArquivoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientArquivoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 120
    end
    object ClientArquivoLIVRO_CAIXA_ID: TIntegerField
      FieldName = 'LIVRO_CAIXA_ID'
    end
    object ClientArquivoLIVRO_FINANCEIRO_ID: TIntegerField
      FieldName = 'LIVRO_FINANCEIRO_ID'
    end
    object ClientArquivoLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Size = 1
    end
    object ClientArquivoLIBERADO: TStringField
      FieldName = 'LIBERADO'
      Size = 1
    end
    object ClientArquivoVINCULO: TStringField
      FieldName = 'VINCULO'
      Size = 1
    end
    object ClientArquivoREGISTRADO: TBooleanField
      FieldName = 'REGISTRADO'
    end
    object ClientArquivoALTERADO: TBooleanField
      FieldName = 'ALTERADO'
    end
    object ClientArquivoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 1
    end
    object ClientArquivoREALIZAR_PLANEJAMENTO: TStringField
      FieldName = 'REALIZAR_PLANEJAMENTO'
      Size = 1
    end
    object ClientArquivoCALC_SELECIONADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SELECIONADO'
    end
    object ClientArquivoCONCILIACAO_VINCULO_ID: TStringField
      FieldName = 'CONCILIACAO_VINCULO_ID'
      Size = 15
    end
  end
  object dtsClientArquivo: TDataSource
    DataSet = ClientArquivo
    Left = 426
    Top = 4
  end
  object OpenDialogRetorno: TOpenDialog
    FileName = '*.ofx'
    Left = 258
    Top = 41
  end
  object ClientDataConciliacao: TClientDataSet
    PersistDataPacket.Data = {
      440000009619E0BD010000001800000002000000000003000000440004444154
      41040006000000000008534954554143414F0100490000000100055749445448
      0200020001000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CALC_SELECIONADO'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = ClientDataConciliacaoAfterScroll
    Left = 186
    Top = 156
    object ClientDataConciliacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object ClientDataConciliacaoCALC_SELECIONADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SELECIONADO'
    end
    object ClientDataConciliacaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsClientDataConciliacao: TDataSource
    DataSet = ClientDataConciliacao
    Left = 186
    Top = 212
  end
end
