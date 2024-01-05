inherited frmMarcacaoTipoAtualizar: TfrmMarcacaoTipoAtualizar
  Left = 217
  Top = 205
  Caption = 'Atualiza'#231#227'o do Controle de Marca'#231#245'es'
  ClientHeight = 481
  ClientWidth = 771
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 777
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 771
    Height = 481
    ExplicitWidth = 771
    ExplicitHeight = 481
    inherited Shape1: TShape
      Width = 759
      Height = 469
      ExplicitLeft = 1
      ExplicitTop = 8
      ExplicitWidth = 759
      ExplicitHeight = 469
    end
    inherited btnCancelar: TcxButton
      Left = 648
      Top = 442
      Width = 106
      Height = 25
      LookAndFeel.SkinName = ''
      ExplicitLeft = 648
      ExplicitTop = 442
      ExplicitWidth = 106
      ExplicitHeight = 25
    end
    object cxGridBasica: TcxGrid
      Left = 7
      Top = 8
      Width = 753
      Height = 393
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridBasicaDBTableView1: TcxGridDBTableView
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
        OnCustomDrawCell = cxGridBasicaDBTableView1CustomDrawCell
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'MARCACAO_TIPO_ID'
          Options.Editing = False
          Width = 63
        end
        object cxGridBasicaDBNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          Options.Editing = False
          Width = 170
        end
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Options.Editing = False
          Width = 237
        end
        object cxGridBasicaDBSituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Ativo'
              ImageIndex = 0
              Value = 'A'
            end
            item
              Description = 'Inativo'
              ImageIndex = 1
              Value = 'I'
            end>
          Options.Editing = False
          Width = 76
        end
        object cxGridBasicaDBGrupo: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'GRUPO'
          Visible = False
          GroupIndex = 0
          Options.Editing = False
        end
        object cxGridBasicaDBOperacaoExportacao: TcxGridDBColumn
          Caption = 'Atualizar'
          DataBinding.FieldName = 'ATUALIZAR'
          RepositoryItem = dtmLookup.Check_SimNao
          HeaderAlignmentHorz = taCenter
          Width = 98
        end
        object cxGridBasicaDBExiste: TcxGridDBColumn
          Caption = 'Existe'
          DataBinding.FieldName = 'calc_Existe'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Sim'
              ImageIndex = 6
              Value = 'S'
            end
            item
              Description = 'N'#227'o'
              ImageIndex = 7
              Value = 'N'
            end
            item
              ImageIndex = 7
            end>
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridBasicaDBOperacaoImportacao: TcxGridDBColumn
          Caption = 'Opera'#231#227'o'
          DataBinding.FieldName = 'calc_Importar'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Atualizar'
              ImageIndex = 44
              Value = 'A'
            end
            item
              Description = 'Copiar'
              ImageIndex = 3
              Value = 'C'
            end
            item
              Description = 'Manter'
              ImageIndex = 9
              Value = 'M'
            end>
          Width = 91
        end
      end
      object cxGridBasicaLevel1: TcxGridLevel
        GridView = cxGridBasicaDBTableView1
      end
    end
    object rdbExportar: TcxRadioButton
      Left = 16
      Top = 448
      Width = 60
      Height = 14
      Caption = 'Exportar'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = rdbExportarClick
    end
    object rdbImportar: TcxRadioButton
      Left = 200
      Top = 448
      Width = 105
      Height = 14
      Caption = 'Importar/Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = rdbImportarClick
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 402
      Cursor = crHandPoint
      Caption = 'Expandir Grupos'
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = 4210688
      Style.TextStyle = [fsUnderline]
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      StyleHot.TextColor = clRed
      OnClick = cxLabel1Click
    end
    object cxLabel2: TcxLabel
      Left = 110
      Top = 402
      Cursor = crHandPoint
      Caption = 'Juntar Grupos'
      ParentColor = False
      ParentFont = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = 4210688
      Style.TextStyle = [fsUnderline]
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      StyleHot.TextColor = clRed
      OnClick = cxLabel2Click
    end
    object btnImportar: TcxButton
      Left = 417
      Top = 442
      Width = 106
      Height = 25
      Caption = 'Importar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
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
      TabOrder = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnImportarClick
    end
    object btnExportar: TcxButton
      Left = 79
      Top = 442
      Width = 106
      Height = 25
      Caption = 'Exportar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000120B0000120B0000000100000000000000000000B6B6
        B6005D5D5D0024242400FFFFFF009292920018181800E9E9E9004A4A4A001010
        100075757500D7D7D7002C2C2C000B0B0B0033333300A7A7A7001F1F1F00C9C9
        C9008D8D8D00F4F4F4000808080037373700E5E5E50066666600060606002A2A
        2A00A1A1A100C2C2C20086868600B2B2B200141414006666660028282800F1F1
        F100303030001B1B1B003F3F3F0056565600C1C1C1009D9D9D0022222200FAFA
        FA000D0D0D007D7D7D00121212001A1A1A00DBDBDB00F9F9F900CFCFCF006F6F
        6F009999990051515100A9A9A90090909000CCCCCC0020202000ECECEC00A5A5
        A500C6C6C600262626000E0E0E0016161600EBEBEB00E7E7E700404040006A6A
        6A00F3F3F300B9B9B9005E5E5E00D9D9D90039393900B3B3B300DDDDDD00ABAB
        AB00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040A18000000
        000000000000000D3C2429040404041400000000000000000000080B16120704
        040404181818181818181818180907130B040404040404141414141414141414
        1414291B140F04040404040D0D0D0D0D0D0D0D0E311C04110D0D0F040404042A
        2A2A2A2A2A2A0204040404362A2A2A390404040909090909091E482F44332524
        090909093404042C2C2C2C2C2C10213F2C2C2C2C2C2C2C2C1E2B041E1E1E1E1E
        1E28213F1E1E1E1E1E1E1E1E1E0E040606060606061038072003031006060606
        412F042323232323232327040404130123232317040404101010101010102805
        263A04301010410404040437373737373737373737282F363741040404040428
        2828282828282828280C292E12040404040404030303030303030303033B1A04
        0421040404040420202020202020202020202017174304040404040C0C0C0C0C
        0C0C0C0C0C0C0C0C320404040404040C0C0C0C0C0C0C0C0C0C0C0C3404040404
        0404040E222222222222222222461D040404040404040435150E0E0E0E0E0E0E
        401D0404040404040404}
      TabOrder = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnExportarClick
    end
    object btnCarregar: TcxButton
      Left = 307
      Top = 442
      Width = 106
      Height = 25
      Caption = 'Carregar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
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
      TabOrder = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCarregarClick
    end
  end
  inherited DataSetAncestral: TI9Query
    MasterFields = 'SISTEMA_ID'
    SQL.Strings = (
      'SELECT * '#13#10'FROM G_MARCACAO_TIPO'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID')
    Top = 359
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = 0
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 359
  end
  inherited ClientAncestral: TClientDataSet
    Top = 359
    object ClientAncestralMARCACAO_TIPO_ID: TBCDField
      FieldName = 'MARCACAO_TIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
      Size = 1
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object ClientAncestralGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 30
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralGRUPO_TIPO: TStringField
      FieldName = 'GRUPO_TIPO'
      Size = 1
    end
    object ClientAncestralTIPO_QUALIFICACAO: TStringField
      FieldName = 'TIPO_QUALIFICACAO'
      Size = 3
    end
    object ClientAncestralCONDICAO_SQL: TStringField
      FieldName = 'CONDICAO_SQL'
      Size = 120
    end
    object ClientAncestralSEPARADOR_1: TStringField
      FieldName = 'SEPARADOR_1'
      Size = 3
    end
    object ClientAncestralSEPARADOR_2: TStringField
      FieldName = 'SEPARADOR_2'
      Size = 3
    end
    object ClientAncestralSEPARADOR_3: TStringField
      FieldName = 'SEPARADOR_3'
      Size = 3
    end
    object ClientAncestralTIPO_VALOR: TStringField
      FieldName = 'TIPO_VALOR'
      Size = 1
    end
    object ClientAncestralATUALIZAR: TStringField
      FieldName = 'ATUALIZAR'
      Size = 1
    end
    object ClientAncestralcalc_Existe: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Existe'
      Size = 1
    end
    object ClientAncestralcalc_Importar: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Importar'
      Size = 1
      Calculated = True
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 359
  end
  object XPColorMap1: TXPColorMap
    HighlightColor = 15660791
    BtnSelectedColor = clBtnFace
    UnusedColor = 15660791
    Left = 232
    Top = 360
  end
  object sqlXmlAtualizador: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MARCACAO_TIPO_ID'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'TEXTO'
        DataType = ftBlob
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'GRUPO_TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO_QUALIFICACAO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CONDICAO_SQL'
        DataType = ftString
        Size = 260
      end
      item
        Name = 'SEPARADOR_1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SEPARADOR_2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SEPARADOR_3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_VALOR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ATUALIZAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PROTEGIDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ATIVAR_SEPARADOR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'calc_Importar'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'calc_existe'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'ProviderAncestral'
    StoreDefs = True
    Left = 435
    Top = 213
    object FMTBCDField1: TBCDField
      FieldName = 'MARCACAO_TIPO_ID'
      Origin = 'MARCACAO_TIPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 120
    end
    object BlobField1: TBlobField
      FieldName = 'TEXTO'
      Origin = 'TEXTO'
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object FMTBCDField2: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'GRUPO_TIPO'
      Origin = 'GRUPO_TIPO'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'TIPO_QUALIFICACAO'
      Origin = 'TIPO_QUALIFICACAO'
      Size = 3
    end
    object StringField7: TStringField
      FieldName = 'CONDICAO_SQL'
      Origin = 'CONDICAO_SQL'
      Size = 120
    end
    object StringField8: TStringField
      FieldName = 'SEPARADOR_1'
      Origin = 'SEPARADOR_1'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'SEPARADOR_2'
      Origin = 'SEPARADOR_2'
      Size = 3
    end
    object StringField10: TStringField
      FieldName = 'SEPARADOR_3'
      Origin = 'SEPARADOR_3'
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'TIPO_VALOR'
      Origin = 'TIPO_VALOR'
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'ATUALIZAR'
      Origin = 'ATUALIZAR'
      Size = 1
    end
    object sqlXmlAtualizadorcalc_Importar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Importar'
      Size = 1
    end
    object sqlXmlAtualizadorcalc_existe: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'calc_existe'
      Size = 1
    end
  end
  object dtsXmlAtualizador: TDataSource
    DataSet = sqlXmlAtualizador
    Left = 347
    Top = 213
  end
end
