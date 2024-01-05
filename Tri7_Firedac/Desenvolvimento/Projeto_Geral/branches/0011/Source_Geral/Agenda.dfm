object frmAgenda: TfrmAgenda
  Left = 107
  Top = 101
  Caption = 'Agenda'
  ClientHeight = 535
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 535
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object pagPrincipal: TcxPageControl
      Left = 2
      Top = 2
      Width = 788
      Height = 531
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tbsCadastro
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfUltraFlat
      ClientRectBottom = 531
      ClientRectRight = 788
      ClientRectTop = 24
      object tbsCadastro: TcxTabSheet
        Caption = 'Agenda'
        ImageIndex = 1
        object pnlCadastro: TPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 507
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object Scheduler: TcxScheduler
            Left = 2
            Top = 34
            Width = 784
            Height = 478
            DateNavigator.RowCount = 3
            ViewDay.Active = True
            Align = alTop
            ControlBox.Visible = False
            EventOperations.Recurrence = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            LookAndFeel.Kind = lfUltraFlat
            OptionsView.ShowHints = False
            OptionsView.WorkFinish = 0.750000000000000000
            Storage = SchedulerDBStorage
            TabOrder = 1
            Splitters = {
              7A020000FB00000009030000000100007B0200000100000080020000DD010000}
            StoredClientBounds = {01000000010000000F030000DD010000}
          end
          object Panel1: TPanel
            Left = 2
            Top = 2
            Width = 784
            Height = 32
            Align = alTop
            TabOrder = 0
            object rdbDiario: TcxRadioButton
              Left = 80
              Top = 8
              Width = 73
              Height = 17
              Caption = 'Di'#225'rio'
              TabOrder = 0
              OnClick = rdbDiarioClick
            end
            object cxLabel1: TcxLabel
              Left = 7
              Top = 8
              Caption = 'Visualiza'#231#227'o:'
              Style.TextColor = clNavy
            end
            object rdbSemanal: TcxRadioButton
              Left = 147
              Top = 8
              Width = 73
              Height = 17
              Caption = 'Semanal'
              TabOrder = 2
              OnClick = rdbSemanalClick
            end
            object rdbMensal: TcxRadioButton
              Left = 231
              Top = 7
              Width = 73
              Height = 17
              Caption = 'Mensal'
              TabOrder = 3
              OnClick = rdbMensalClick
            end
            object cxLabel2: TcxLabel
              Left = 434
              Top = 7
              Caption = 'Usu'#225'rio:'
              Style.TextColor = clNavy
            end
            object lcxUsuarioAgenda: TcxLookupComboBox
              Left = 480
              Top = 5
              RepositoryItem = dtmLookup.Lista_UsuarioSistema
              ParentFont = False
              Properties.ListColumns = <>
              Properties.OnChange = lcxUsuarioAgendaPropertiesChange
              Properties.OnEditValueChanged = lcxUsuarioAgendaPropertiesChange
              EditValue = 0c
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 5
              Width = 231
            end
          end
        end
      end
    end
    object btnFechar: TcxButton
      Left = 738
      Top = 4
      Width = 48
      Height = 47
      Cursor = crHandPoint
      Hint = 'Sair'
      Caption = 'Sair'
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
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE87233
        3333333333333333333451B8F9FFFFFFE6824B69696969696969696969685658
        CFFEFFFFBA4982EAEBEBEBEBEBEBEBEBEBEAB546ADFCFFFFB2449AFFFFFFFFFF
        FFFFFFFFFFFFCC4DA9FBFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFF
        B24499FFFFFFFFFFFFFFE689BDF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFD95E
        3FAAEEEFEAFDFFFFB24499FFFFEAC3B9B9B9A251334091E6FFFFFFFFB24499FF
        FFB454494949453833333E7EE1FFFFFFB24499FFFFA73D333333333333333339
        64C5FFFFB24499FFFFA73C33333333333333333964C6FFFFB24499FFFFB45449
        4949453833333E7EE1FFFFFFB24499FFFFEAC3BABABAA351334091E6FFFFFFFF
        B24499FFFFFFFFFFFFFFD95E3FAAEEEFEAFDFFFFB24499FFFFFFFFFFFFFFE586
        BCF8EB88B0FAFFFFB24499FFFFFFFFFFFFFFFFFFFFFFCA49AAFBFFFFB2449AFF
        FFFFFFFFFFFFFFFFFFFFCC4DA9FBFFFFBA4981EAEAEAEAEAEAEAEAEAEAE9B546
        ADFCFFFFE6824B69696969696969696969685658CFFEFFFFFEE8733333333333
        33333333333451B8F9FF}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharClick
    end
  end
  object sqlG_Agenda: TI9Query
    AfterInsert = sqlG_AgendaAfterInsert
    BeforePost = sqlG_AgendaBeforePost
    AfterPost = sqlG_AgendaAfterPost
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT * FROM G_AGENDA'
      'WHERE USUARIO_ID = :USUARIO_ID')
    Left = 417
    Top = 280
    ParamData = <
      item
        Name = 'USUARIO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '123456'
      end>
    object sqlG_AgendaUsuarioAgendouCalc: TStringField
      FieldKind = fkLookup
      FieldName = 'UsuarioAgendouCalc'
      LookupDataSet = dtmLookup.sqlUsuarioSistema
      LookupKeyFields = 'USUARIO_ID'
      LookupResultField = 'LOGIN'
      KeyFields = 'USUARIO_AGENDOU_ID'
      Size = 100
      Lookup = True
    end
    object sqlG_AgendaAGENDA_ID: TBCDField
      FieldName = 'AGENDA_ID'
      Origin = 'AGENDA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaTIPO_EVENTO: TBCDField
      FieldName = 'TIPO_EVENTO'
      Origin = 'TIPO_EVENTO'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaDATA_INICIO: TSQLTimeStampField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
    end
    object sqlG_AgendaDATA_FIM: TSQLTimeStampField
      FieldName = 'DATA_FIM'
      Origin = 'DATA_FIM'
    end
    object sqlG_AgendaASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Origin = 'ASSUNTO'
      Size = 260
    end
    object sqlG_AgendaMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Origin = 'MENSAGEM'
      Size = 260
    end
    object sqlG_AgendaCOR: TBCDField
      FieldName = 'COR'
      Origin = 'COR'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaOPCAO: TBCDField
      FieldName = 'OPCAO'
      Origin = 'OPCAO'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaSTATUS: TBCDField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaUSUARIO_AGENDOU_ID: TBCDField
      FieldName = 'USUARIO_AGENDOU_ID'
      Origin = 'USUARIO_AGENDOU_ID'
      Precision = 18
      Size = 2
    end
    object sqlG_AgendaMENSAGEM_FINALIZADO: TBlobField
      FieldName = 'MENSAGEM_FINALIZADO'
      Origin = 'MENSAGEM_FINALIZADO'
    end
    object sqlG_AgendaDATA_HORA_AVISADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_AVISADO'
      Origin = 'DATA_HORA_AVISADO'
    end
    object sqlG_AgendaDATA_HORA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_HORA_CADASTRO'
      Origin = 'DATA_HORA_CADASTRO'
    end
    object sqlG_AgendaDATA_HORA_ENVIADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_ENVIADO'
      Origin = 'DATA_HORA_ENVIADO'
    end
    object sqlG_AgendaDATA_HORA_FINALIZADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_FINALIZADO'
      Origin = 'DATA_HORA_FINALIZADO'
    end
  end
  object dtsG_Agenda: TDataSource
    DataSet = sqlG_Agenda
    Left = 425
    Top = 344
  end
  object SchedulerDBStorage: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <>
    DataSource = dtsG_Agenda
    FieldNames.Caption = 'ASSUNTO'
    FieldNames.EventType = 'TIPO_EVENTO'
    FieldNames.Finish = 'DATA_FIM'
    FieldNames.ID = 'AGENDA_ID'
    FieldNames.LabelColor = 'COR'
    FieldNames.Message = 'MENSAGEM'
    FieldNames.Options = 'OPCAO'
    FieldNames.ParentID = 'USUARIO_ID'
    FieldNames.ResourceID = 'USUARIO_AGENDOU_ID'
    FieldNames.Start = 'DATA_INICIO'
    FieldNames.State = 'STATUS'
    Left = 336
    Top = 312
  end
  object sqlG_AgendaTemp: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT * FROM G_AGENDA'
      'WHERE USUARIO_ID = :USUARIO_ID')
    Left = 488
    Top = 280
    ParamData = <
      item
        Name = 'USUARIO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '123456'
      end>
    object sqlG_AgendaTempAGENDA_ID: TBCDField
      FieldName = 'AGENDA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempTIPO_EVENTO: TBCDField
      FieldName = 'TIPO_EVENTO'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempDATA_INICIO: TSQLTimeStampField
      FieldName = 'DATA_INICIO'
    end
    object sqlG_AgendaTempDATA_FIM: TSQLTimeStampField
      FieldName = 'DATA_FIM'
    end
    object sqlG_AgendaTempASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 260
    end
    object sqlG_AgendaTempMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 260
    end
    object sqlG_AgendaTempCOR: TBCDField
      FieldName = 'COR'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempOPCAO: TBCDField
      FieldName = 'OPCAO'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempSTATUS: TBCDField
      FieldName = 'STATUS'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempUSUARIO_AGENDOU_ID: TBCDField
      FieldName = 'USUARIO_AGENDOU_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_AgendaTempDATA_HORA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_HORA_CADASTRO'
    end
    object sqlG_AgendaTempDATA_HORA_ENVIADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_ENVIADO'
    end
    object sqlG_AgendaTempDATA_HORA_FINALIZADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_FINALIZADO'
    end
    object sqlG_AgendaTempMENSAGEM_FINALIZADO: TBlobField
      FieldName = 'MENSAGEM_FINALIZADO'
    end
    object sqlG_AgendaTempDATA_HORA_AVISADO: TSQLTimeStampField
      FieldName = 'DATA_HORA_AVISADO'
    end
  end
  object dtsG_AgendaTemp: TDataSource
    DataSet = sqlG_AgendaTemp
    Left = 464
    Top = 344
  end
end
