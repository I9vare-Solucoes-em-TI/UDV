object frmCadastroRapidoTarefa: TfrmCadastroRapidoTarefa
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'Tarefa'
  ClientHeight = 619
  ClientWidth = 681
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 38
    Width = 681
    Height = 581
    Align = alClient
    BevelInner = bvLowered
    Color = clWindow
    ParentBackground = False
    TabOrder = 2
    object PnlPrincipal: TPanel
      Left = 2
      Top = 2
      Width = 677
      Height = 577
      Align = alClient
      TabOrder = 0
      object pnlDados: TPanel
        Left = 1
        Top = 1
        Width = 675
        Height = 406
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblAssunto: TcxLabel
          Left = 13
          Top = 46
          Caption = 'Assunto'
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
        object lblTipoPeriodo: TcxLabel
          Left = 13
          Top = 261
          Caption = 'Tipo do Per'#237'odo'
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
        object lblServentia: TcxLabel
          Left = 15
          Top = 4
          Caption = 'Setor'
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
        object lblTarefaGrupo: TcxLabel
          Left = 191
          Top = 6
          Caption = 'Grupo'
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
        object icxServentia: TcxDBImageComboBox
          Left = 14
          Top = 24
          DataBinding.DataField = 'SERVENTIA'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Items = <
            item
              Description = 'Registro de Im'#243'veis'
              ImageIndex = 3
              Value = '1'
            end
            item
              Description = 'Tabelionato de Notas'
              ImageIndex = 4
              Value = '2'
            end
            item
              Description = 'RTD e Pessoa Jur'#237'dica'
              Value = '7'
            end
            item
              Description = 'Registro Civil'
              Value = '12'
            end
            item
              Description = 'Protesto'
              Value = '13'
            end
            item
              Description = 'Geral'
              Value = '9'
            end>
          Properties.OnChange = ibxSistemaPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 0
          Width = 171
        end
        object lcxTarefaGrupo: TcxDBLookupComboBox
          Left = 191
          Top = 24
          DataBinding.DataField = 'TAREFA_GRUPO_ID'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.GridMode = True
          Properties.KeyFieldNames = 'TAREFA_GRUPO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dtsTarefaGrupo
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 1
          OnExit = lcxTarefaGrupoExit
          Width = 404
        end
        object edtAssunto: TcxDBTextEdit
          Left = 14
          Top = 65
          DataBinding.DataField = 'ASSUNTO'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 4
          Width = 648
        end
        object icxTipoPeriodo: TcxDBImageComboBox
          Left = 13
          Top = 280
          RepositoryItem = dtmLookup.Combo_TipoPeriodo
          DataBinding.DataField = 'PERIODO_TIPO'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.Items = <>
          Properties.ReadOnly = False
          Properties.OnChange = icxTipoPeriodoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.Color = clWindow
          TabOrder = 7
          Width = 131
        end
        object lblMensagem: TcxLabel
          Left = 13
          Top = 86
          Caption = 'Mensagem'
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
        object rdtMensagem: TcxDBRichEdit
          Left = 14
          Top = 105
          DataBinding.DataField = 'MENSAGEM'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 5
          Height = 62
          Width = 648
        end
        object btnTarefaGrupoExcluir: TcxButton
          Left = 634
          Top = 22
          Width = 28
          Height = 23
          Cursor = crHandPoint
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
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnTarefaGrupoExcluirClick
        end
        object btnTarefaGrupoAdicionar: TcxButton
          Left = 600
          Top = 22
          Width = 28
          Height = 23
          Cursor = crHandPoint
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
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
          TabOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnTarefaGrupoAdicionarClick
        end
        object cxLabel1: TcxLabel
          Left = 148
          Top = 261
          Caption = 'Inicia em'
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
        object dtaDataInicial: TcxDBDateEdit
          Left = 150
          Top = 281
          DataBinding.DataField = 'DATA_INICIAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.DisplayFormat = 'dd/mm/yyyy'
          Properties.EditFormat = 'dd/mm/yyyy'
          Properties.OnChange = dtaDataInicialPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 8
          OnExit = dtaDataInicialExit
          Width = 125
        end
        object dtmHoraInicial: TcxDBTimeEdit
          Left = 274
          Top = 281
          DataBinding.DataField = 'HORA_INICIAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 9
          OnExit = dtmHoraInicialExit
          Width = 79
        end
        object cxLabel2: TcxLabel
          Left = 357
          Top = 261
          Caption = 'Termina em'
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
        object dtaDataFinal: TcxDBDateEdit
          Left = 359
          Top = 281
          DataBinding.DataField = 'DATA_FINAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.DisplayFormat = 'dd/mm/yyyy'
          Properties.EditFormat = 'dd/mm/yyyy'
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 10
          Width = 125
        end
        object dtmHoraFinal: TcxDBTimeEdit
          Left = 483
          Top = 281
          DataBinding.DataField = 'HORA_FINAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 11
          Width = 79
        end
        object rgpTermino: TcxDBRadioGroup
          Left = 392
          Top = 311
          Caption = ' Repeti'#231#227'o termina  '
          DataBinding.DataField = 'TIPO_TERMINO'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.Items = <
            item
              Caption = 'Nunca'
              Value = 'N'
            end
            item
              Caption = 'Em'
              Value = 'E'
            end
            item
              Caption = 'Ap'#243's'
              Value = 'A'
            end>
          Properties.OnChange = rgpTerminoPropertiesChange
          Style.StyleController = dtmControles.cxEditStyleGroup
          TabOrder = 14
          Height = 96
          Width = 271
        end
        object dteTerminoData: TcxDBDateEdit
          Left = 472
          Top = 354
          DataBinding.DataField = 'TERMINO_DATA'
          DataBinding.DataSource = dsrTarefa
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 22
          Width = 177
        end
        object speTerminoOcorrencias: TcxDBSpinEdit
          Left = 472
          Top = 379
          DataBinding.DataField = 'TERMINO_OCORRENCIAS'
          DataBinding.DataSource = dsrTarefa
          Enabled = False
          ParentFont = False
          Properties.MaxValue = 999.000000000000000000
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 23
          Width = 45
        end
        object lblTerminoOcorrencias: TcxLabel
          Left = 520
          Top = 380
          Caption = 'ocorr'#234'ncias'
          Enabled = False
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsUnderline]
          Style.TextColor = 4210688
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.TextStyle = []
          StyleFocused.TextStyle = []
          Transparent = True
        end
        object pnlDiasSemana: TPanel
          Left = 18
          Top = 323
          Width = 335
          Height = 39
          BevelOuter = bvNone
          TabOrder = 13
          object pnlRepetirDomingo: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object ShpRepetirDomingo: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirDomingo: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Domingo'
              Caption = 'D'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirDomingoClick
            end
          end
          object pnlRepetirSabado: TPanel
            AlignWithMargins = True
            Left = 279
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object shpRepetirSabado: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirSabado: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'S'#225'bado'
              Caption = 'S'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirSabadoClick
            end
          end
          object pnlRepetirSexta: TPanel
            AlignWithMargins = True
            Left = 233
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object shpRepetirSexta: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirSexta: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Sexta-feira'
              Caption = 'S'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirSextaClick
            end
          end
          object pnlRepetirQuinta: TPanel
            AlignWithMargins = True
            Left = 187
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 3
            object shpRepetirQuinta: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirQuinta: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Quinta-feira'
              Caption = 'Q'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirQuintaClick
            end
          end
          object pnlRepetirQuarta: TPanel
            AlignWithMargins = True
            Left = 141
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 4
            object shpRepetirQuarta: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirQuarta: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Quarta-feira'
              Caption = 'Q'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirQuartaClick
            end
          end
          object pnlRepetirTerca: TPanel
            AlignWithMargins = True
            Left = 95
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 5
            object shpRepetirTerca: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirTerca: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Ter'#231'a-feira'
              Caption = 'T'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirTercaClick
            end
          end
          object pnlRepetirSegunda: TPanel
            AlignWithMargins = True
            Left = 49
            Top = 3
            Width = 33
            Height = 33
            Margins.Right = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 6
            object shpRepetirSegunda: TShape
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 27
              Height = 27
              Align = alClient
              Brush.Color = clSilver
              Pen.Style = psClear
              Shape = stCircle
              ExplicitLeft = 0
              ExplicitTop = -10
              ExplicitWidth = 25
              ExplicitHeight = 35
            end
            object btnRepetirSegunda: TSpeedButton
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 25
              Height = 25
              Hint = 'Segunda-feira'
              Caption = 'S'
              Flat = True
              Font.Charset = EASTEUROPE_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRepetirSegundaClick
            end
          end
        end
        object lblRepetir: TcxLabel
          Left = 15
          Top = 302
          Caption = 'Repetir'
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
        object lblSomenteDiaUtil: TcxLabel
          Left = 568
          Top = 261
          Caption = 'Somente dias '#250'teis'
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
        object icxSomenteDiaUtil: TcxDBImageComboBox
          Left = 568
          Top = 281
          Hint = 'Refaz automaticamente o agendamento para o pr'#243'ximo dia '#250'til'
          RepositoryItem = dtmLookup.Combo_SimNaoSimples
          DataBinding.DataField = 'SOMENTE_DIA_UTIL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Items = <
            item
              Description = 'Registro de Im'#243'veis'
              ImageIndex = 3
              Value = '1'
            end
            item
              Description = 'Tabelionato de Notas'
              ImageIndex = 4
              Value = '2'
            end
            item
              Description = 'RTD e Pessoa Jur'#237'dica'
              Value = '7'
            end
            item
              Description = 'Registro Civil'
              Value = '12'
            end
            item
              Description = 'Protesto'
              Value = '13'
            end
            item
              Description = 'Geral'
              Value = '9'
            end>
          ShowHint = True
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 12
          Width = 94
        end
        object LblOBSERVACAO: TcxLabel
          Left = 13
          Top = 168
          Caption = 'Observa'#231#227'o'
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
        object EdtObservacao: TcxDBMemo
          Left = 14
          Top = 188
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 6
          Height = 68
          Width = 648
        end
      end
      object pgcTarefa: TcxPageControl
        Left = 1
        Top = 407
        Width = 675
        Height = 169
        Align = alBottom
        TabOrder = 1
        Properties.ActivePage = tbsResponsavel
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        ClientRectBottom = 164
        ClientRectLeft = 2
        ClientRectRight = 670
        ClientRectTop = 25
        object tbsResponsavel: TcxTabSheet
          Caption = 'Responsaveis'
          Color = clWhite
          ImageIndex = 1
          ParentColor = False
          DesignSize = (
            668
            139)
          object shpResponsavel: TShape
            Left = 0
            Top = 0
            Width = 668
            Height = 139
            Align = alClient
            Pen.Style = psClear
            ExplicitLeft = 256
            ExplicitTop = 48
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object grdResponsaveis: TcxGrid
            Left = 3
            Top = 34
            Width = 662
            Height = 102
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            object grdTableViewResponsaveis: TcxGridDBTableView
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
              DataController.DataSource = dtsRespLigacao
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Total:0'
                  Kind = skCount
                  FieldName = 'USUARIO_ID'
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
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'Nome/Descri'#231#227'o'
                DataBinding.FieldName = 'USUARIO_ID'
                RepositoryItem = dtmLookup.Lista_UsuariosTodosNomeCompleto
                Width = 252
              end
            end
            object grdLevelResponsaveis: TcxGridLevel
              GridView = grdTableViewResponsaveis
            end
          end
          object lcxResponsavel: TcxLookupComboBox
            Left = 5
            Top = 8
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'USUARIO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME_COMPLETO'
              end
              item
                FieldName = 'FUNCAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsResponsavel
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 1
            Width = 492
          end
          object btnAdicionarResponsavel: TcxButton
            Left = 500
            Top = 6
            Width = 28
            Height = 23
            Cursor = crHandPoint
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
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnAdicionarResponsavelClick
          end
          object btnExcluirResponsavel: TcxButton
            Left = 532
            Top = 6
            Width = 28
            Height = 23
            Cursor = crHandPoint
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
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnExcluirResponsavelClick
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 41
    Color = clWhite
    TabOrder = 0
    object lblInformaca: TcxLabel
      Left = 0
      Top = 0
      Caption = 'Tarefa'
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 41
      Color = clWhite
      TabOrder = 2
      object imgTitulo: TImage
        Left = 0
        Top = 0
        Width = 105
        Height = 105
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
          000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
          1974455874536F6674776172650041646F626520496D616765526561647971C9
          653C00000464494441545847B5565D6F545514BD262254A3F18589FC021E4C4C
          FC0526FAE283A8982AE89F00712A2AA55A8D11E4C35094288A4131263EA0A69D
          3B9D76DA9910A008455EEC7C800A359D629B82096DF950D1ED5AFBDC7BE7DC3B
          A7B73C8C2B59DDB377CF5967DF73D69C3B1E70F743BD7EEE819EBC7474E765E5
          363757297D8D69356A508B9AD4E602CBE17E4E6837A8496DB3443A56B36BC5F1
          A7444E768A8C6D88F3D40BE0B3B22D3FABD1E48EDAD8F32227D6A91435A96D96
          4847865BA83889C9A7B1E0D997447EB478EE45B053768C5ED5687247ED2C38BE
          5EA5EE350D64CC12E9C874E01C89ED0397E4DDA1697964DF39F15E2D89972D37
          D935020E9B98E5FFC0AE223814AFBD8231595FEE7ACD977BEED0136820A70DD4
          1645A6FE1688F46BDE4EA47922B3EA0DD3407D4164FA2F34F0F2779A373DC1F3
          B589B31E7B465EF771FE882677D438971A409A27A206266F885CF9870D7CAFB9
          7AE2072C78662388F325C749F864FC39E91D9ED36872478D7E3AF5B44A050D38
          3D111DC16EBF221F8F9C176F8B69A01B9EE81D6CC8CEE28CEC2ECDCA5E8BFBCA
          BFCBFE7243E352B53DA519D9556CA8D67DDB531A0877E032B61FA7801DF856F3
          2A3C31F9A748E7373FC19403600EF42DDA393F738C35AE0B318B3CDB9F6ACAA8
          81192C761DD1DB7454737AA2815AD8503B619B326AE08FDB22F812440BB678E2
          7F32252E22D3C08142458E94E901D340D21391294FC39431A27666BDBC390403
          226AEEAA712E35005E7E5CDB3410EC001E58E16D360D243DD1DD7F517A7253D2
          E337627C2B3F25EF0CFE26EF1526353277D538971A042FBF96066EEA5F2C1878
          20F2C466934FA01B1A931796CD3A06FD8CC93B72358DCC5D35CEA506C16F5E4B
          03386E45B803912782BC3A0F5EFB576AF371D651FF05DBF7FE40452373578D73
          A94170CD660381070E8F54E5E8F10BD196479E08F25FF11417C14B10B449B34E
          61B7F6E62B1A99BB6A9C4B0D22DE40B00321BC4D6641CC51843BB073604276C1
          9834A7CD3D58E483424DFA86EB1A99BB6A9C4B0D227604E14D1822F440D2138D
          5B86D378A22467715C7D85AAC6A56AE17C22B603BC146C785BCCCB28F244B023
          D3E8C8C5CBE01CCCD23758D5C8DC550BC713B106D6F4FAF36CA2A3DBC70F09BC
          CBB79AD771D213149AC357F30AA2CDAB20FC250786AB1A99BB6A9C4B0DC26EE0
          41F051F071F009F0C995494F041ED83F38211F1626E42398D326CDFA49B1269F
          8DD6353277D538971A048D8FB5B48115209B6042AE5DCA130B78121717411EED
          A7D83146E6AE5A389EB0772089564F0447B00853CCC350492E805CE460B1A291
          B9ABC6B1D420D21A589DD9FAF509972770840233B790753ED8E1525D2373572D
          1C4BA435C057E4C3E06360CC1387F03487B0A5497E0E7E51AECB57C7CE6B64EE
          AAE9786810B60792E08F0436C157A57A82DDDE09BE2CD5824F4DB86A44DA0E24
          D172512D8523A3D5E05313AE1A61DF84CBA1C594ED0035A96D96484766CDDBF9
          053525BAA61F5CE496F25C19D36AD4A01635A96D964847F2A26A07A9454D6A2F
          8BE445D52E42D35BF11F08B246F40B3E0C5C0000000049454E44AE426082}
      end
    end
    object btnLimpar: TcxButton
      Left = 336
      Top = 10
      Width = 106
      Height = 25
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
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnLimparClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object LblCaption: TcxLabel
      Left = 35
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = 'Tarefa'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = 14807280
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clBlack
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
      Height = 38
      Width = 229
      AnchorY = 19
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 35
      Height = 38
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Image1: TImage
        Left = 3
        Top = 4
        Width = 32
        Height = 34
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
          000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
          1974455874536F6674776172650041646F626520496D616765526561647971C9
          653C00000464494441545847B5565D6F545514BD262254A3F18589FC021E4C4C
          FC0526FAE283A8982AE89F00712A2AA55A8D11E4C35094288A4131263EA0A69D
          3B9D76DA9910A008455EEC7C800A359D629B82096DF950D1ED5AFBDC7BE7DC3B
          A7B73C8C2B59DDB377CF5967DF73D69C3B1E70F743BD7EEE819EBC7474E765E5
          363757297D8D69356A508B9AD4E602CBE17E4E6837A8496DB3443A56B36BC5F1
          A7444E768A8C6D88F3D40BE0B3B22D3FABD1E48EDAD8F32227D6A91435A96D96
          4847865BA83889C9A7B1E0D997447EB478EE45B053768C5ED5687247ED2C38BE
          5EA5EE350D64CC12E9C874E01C89ED0397E4DDA1697964DF39F15E2D89972D37
          D935020E9B98E5FFC0AE223814AFBD8231595FEE7ACD977BEED0136820A70DD4
          1645A6FE1688F46BDE4EA47922B3EA0DD3407D4164FA2F34F0F2779A373DC1F3
          B589B31E7B465EF771FE882677D438971A409A27A206266F885CF9870D7CAFB9
          7AE2072C78662388F325C749F864FC39E91D9ED36872478D7E3AF5B44A050D38
          3D111DC16EBF221F8F9C176F8B69A01B9EE81D6CC8CEE28CEC2ECDCA5E8BFBCA
          BFCBFE7243E352B53DA519D9556CA8D67DDB531A0877E032B61FA7801DF856F3
          2A3C31F9A748E7373FC19403600EF42DDA393F738C35AE0B318B3CDB9F6ACAA8
          81192C761DD1DB7454737AA2815AD8503B619B326AE08FDB22F812440BB678E2
          7F32252E22D3C08142458E94E901D340D21391294FC39431A27666BDBC390403
          226AEEAA712E35005E7E5CDB3410EC001E58E16D360D243DD1DD7F517A7253D2
          E337627C2B3F25EF0CFE26EF1526353277D538971A042FBF96066EEA5F2C1878
          20F2C466934FA01B1A931796CD3A06FD8CC93B72358DCC5D35CEA506C16F5E4B
          03386E45B803912782BC3A0F5EFB576AF371D651FF05DBF7FE40452373578D73
          A94170CD660381070E8F54E5E8F10BD196479E08F25FF11417C14B10B449B34E
          61B7F6E62B1A99BB6A9C4B0D22DE40B00321BC4D6641CC51843BB073604276C1
          9834A7CD3D58E483424DFA86EB1A99BB6A9C4B0D227604E14D1822F440D2138D
          5B86D378A22467715C7D85AAC6A56AE17C22B603BC146C785BCCCB28F244B023
          D3E8C8C5CBE01CCCD23758D5C8DC550BC713B106D6F4FAF36CA2A3DBC70F09BC
          CBB79AD771D213149AC357F30AA2CDAB20FC250786AB1A99BB6A9C4B0DC26EE0
          41F051F071F009F0C995494F041ED83F38211F1626E42398D326CDFA49B1269F
          8DD6353277D538971A048D8FB5B48115209B6042AE5DCA130B78121717411EED
          A7D83146E6AE5A389EB0772089564F0447B00853CCC350492E805CE460B1A291
          B9ABC6B1D420D21A589DD9FAF509972770840233B790753ED8E1525D2373572D
          1C4BA435C057E4C3E06360CC1387F03487B0A5497E0E7E51AECB57C7CE6B64EE
          AAE9786810B60792E08F0436C157A57A82DDDE09BE2CD5824F4DB86A44DA0E24
          D172512D8523A3D5E05313AE1A61DF84CBA1C594ED0035A96D96484766CDDBF9
          053525BAA61F5CE496F25C19D36AD4A01635A96D964847F2A26A07A9454D6A2F
          8BE445D52E42D35BF11F08B246F40B3E0C5C0000000049454E44AE426082}
        Transparent = True
      end
    end
    object Panel6: TPanel
      Left = 421
      Top = 0
      Width = 260
      Height = 38
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnCancelar: TcxButton
        Left = 25
        Top = 7
        Width = 106
        Height = 25
        Caption = 'Cancelar'
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
          F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFDE7
          B55F180101185FB5E7FDFFFFFFFFFFFFFFF4BB56160209131309021656BBF4FF
          FFFFFFFFEE93290A2859829A9A825823092993EEFFFFFFF49420081275E4F8FE
          FEF8E3B854092094F4FFFEBD2A0B0B0D35B7FEFFFFFFFFFDE9550B2BBEFEE95E
          1118100E0E2CAEF9FFFFFFFFFFE8550F5EE9BB212F783A10101031AFFEFFFFFF
          FFFDB82A21BB691363E5BA3112121230BAFEFFFFFFFFE561126A2B1D8CF9FEB1
          351515153FB5FEFFFFFFF88A1C2B1B29A3FFFFF9B23619191B41BBFEFFFFFEA2
          291B1C2AA4FFFFFFFEBB421D1B1B39B4F9FFFEA32A1C332591F9FFFFFFFDB746
          1E1E1E3EB5FEF98E253372206BE6FFFFFFFFFEBD3C2020203DBDE76C2173BF32
          3BC0FEFFFFFFFFFEB54022222248823E32C0EB6D2765EBFFFFFFFFFFF9B54025
          25272D276DEBFEC5442969EBFDFFFFFFFFFEBF4D2A282944C5FEFFF5A33F2B6C
          C2E8F9FFFEF9E888332B3FA3F5FFFFFFF1A3492F467396ABAB96734A304AA3F1
          FFFFFFFFFFF5C6733F2F353E3E352F3F73C6F5FFFFFFFFFFFFFFFDECC47E4534
          34447CC3ECFDFFFFFFFF}
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
      end
      object btnConfirmar: TcxButton
        Left = 138
        Top = 7
        Width = 106
        Height = 25
        Caption = 'Salvar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000130B0000130B00000000000000000000FFFFFFFFFFFF
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
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnConfirmarClick
      end
    end
    object LblTarefaDesativada: TcxLabel
      Left = 264
      Top = 0
      Align = alRight
      AutoSize = False
      Caption = 'Desativada'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsNone
      Style.Color = 14807280
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -16
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold, fsUnderline]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TextStyle = [fsBold, fsUnderline]
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
      Height = 38
      Width = 157
      AnchorY = 19
    end
  end
  object sqlTarefaGrupo: TI9Query
    AutoCalcFields = False
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'
      'FROM G_TAREFA_GRUPO')
    Left = 125
    Top = 502
    object sqlTarefaGrupoTAREFA_GRUPO_ID: TBCDField
      FieldName = 'TAREFA_GRUPO_ID'
      Origin = 'TAREFA_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlTarefaGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlTarefaGrupoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object sqlTarefaGrupoSERVENTIA: TBCDField
      FieldName = 'SERVENTIA'
      Origin = 'SERVENTIA'
      Precision = 18
      Size = 2
    end
  end
  object dtsTarefaGrupo: TDataSource
    DataSet = sqlTarefaGrupo
    Left = 125
    Top = 550
  end
  object dtsResponsavel: TDataSource
    DataSet = sqlResponsavel
    Left = 208
    Top = 551
  end
  object sqlResponsavel: TI9Query
    AutoCalcFields = False
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT NOME_COMPLETO, USUARIO_ID, FUNCAO'
      'FROM G_USUARIO'
      'WHERE SITUACAO = '#39'A'#39
      'ORDER BY NOME_COMPLETO')
    Left = 208
    Top = 502
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
  object dtsRespLigacao: TDataSource
    DataSet = sqlRespLigacao
    Left = 293
    Top = 551
  end
  object sqlRespLigacao: TI9Query
    AutoCalcFields = False
    CachedUpdates = True
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      '  SELECT G_US.NOME_COMPLETO, G_US.USUARIO_ID'
      '    FROM G_TAREFA_RESPONSAVEL G_TR'
        '   INNER JOIN G_USUARIO G_US ON G_US.USUARIO_ID = G_TR.USUARIO_I' +
        'D'
      '   WHERE G_TR.TAREFA_ID = :TAREFA_ID'
      '   ORDER BY G_US.NOME_COMPLETO')
    Left = 293
    Top = 502
    ParamData = <
      item
        Name = 'TAREFA_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
    object sqlRespLigacaoNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlRespLigacaoUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object sqlTarefa: TI9Query
    CachedUpdates = True
    MasterFields = 'TAREFA_ID'
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * '
      'FROM G_TAREFA G_TF'
      'WHERE G_TF.TAREFA_ID = :TAREFA_ID')
    Left = 42
    Top = 503
    ParamData = <
      item
        Position = 1
        Name = 'TAREFA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object sqlTarefaTAREFA_ID: TBCDField
      FieldName = 'TAREFA_ID'
      Origin = 'TAREFA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlTarefaUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      Precision = 18
      Size = 2
    end
    object sqlTarefaPRAZO_DATA_FINAL: TSQLTimeStampField
      FieldName = 'PRAZO_DATA_FINAL'
      Origin = 'PRAZO_DATA_FINAL'
    end
    object sqlTarefaPRAZO_DATA_LIMITE: TSQLTimeStampField
      FieldName = 'PRAZO_DATA_LIMITE'
      Origin = 'PRAZO_DATA_LIMITE'
    end
    object sqlTarefaPRAZO_HORA_LIMITE: TSQLTimeStampField
      FieldName = 'PRAZO_HORA_LIMITE'
      Origin = 'PRAZO_HORA_LIMITE'
    end
    object sqlTarefaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object sqlTarefaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlTarefaNOTAS: TBlobField
      FieldName = 'NOTAS'
      Origin = 'NOTAS'
    end
    object sqlTarefaPERIODO_TIPO: TStringField
      FieldName = 'PERIODO_TIPO'
      Origin = 'PERIODO_TIPO'
      Size = 1
    end
    object sqlTarefaTAREFA_GRUPO_ID: TBCDField
      FieldName = 'TAREFA_GRUPO_ID'
      Origin = 'TAREFA_GRUPO_ID'
      Precision = 18
      Size = 2
    end
    object sqlTarefaREALIZADO_TEMPO: TSQLTimeStampField
      FieldName = 'REALIZADO_TEMPO'
      Origin = 'REALIZADO_TEMPO'
    end
    object sqlTarefaREALIZADO_OBSERVACAO: TStringField
      FieldName = 'REALIZADO_OBSERVACAO'
      Origin = 'REALIZADO_OBSERVACAO'
      Size = 120
    end
    object sqlTarefaREALIZADO_DATA: TSQLTimeStampField
      FieldName = 'REALIZADO_DATA'
      Origin = 'REALIZADO_DATA'
    end
    object sqlTarefaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object sqlTarefaREPETIR: TStringField
      FieldName = 'REPETIR'
      Origin = 'REPETIR'
      Size = 1
    end
    object sqlTarefaSERVENTIA: TBCDField
      FieldName = 'SERVENTIA'
      Origin = 'SERVENTIA'
      Precision = 18
      Size = 2
    end
    object sqlTarefaPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Origin = 'PRINCIPAL'
      Size = 1
    end
    object sqlTarefaASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Origin = 'ASSUNTO'
      Size = 260
    end
    object sqlTarefaMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
      Origin = 'MENSAGEM'
    end
    object sqlTarefaPERCENTUAL: TBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 3
    end
    object sqlTarefaDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
    end
    object sqlTarefaHORA_INICIAL: TSQLTimeStampField
      FieldName = 'HORA_INICIAL'
      Origin = 'HORA_INICIAL'
    end
    object sqlTarefaDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
      Origin = 'DATA_FINAL'
    end
    object sqlTarefaHORA_FINAL: TSQLTimeStampField
      FieldName = 'HORA_FINAL'
      Origin = 'HORA_FINAL'
    end
    object sqlTarefaREPETIR_SEGUNDA: TStringField
      FieldName = 'REPETIR_SEGUNDA'
      Origin = 'REPETIR_SEGUNDA'
      Size = 1
    end
    object sqlTarefaREPETIR_TERCA: TStringField
      FieldName = 'REPETIR_TERCA'
      Origin = 'REPETIR_TERCA'
      Size = 1
    end
    object sqlTarefaREPETIR_QUARTA: TStringField
      FieldName = 'REPETIR_QUARTA'
      Origin = 'REPETIR_QUARTA'
      Size = 1
    end
    object sqlTarefaREPETIR_QUINTA: TStringField
      FieldName = 'REPETIR_QUINTA'
      Origin = 'REPETIR_QUINTA'
      Size = 1
    end
    object sqlTarefaREPETIR_SEXTA: TStringField
      FieldName = 'REPETIR_SEXTA'
      Origin = 'REPETIR_SEXTA'
      Size = 1
    end
    object sqlTarefaREPETIR_SABADO: TStringField
      FieldName = 'REPETIR_SABADO'
      Origin = 'REPETIR_SABADO'
      Size = 1
    end
    object sqlTarefaREPETIR_DOMINGO: TStringField
      FieldName = 'REPETIR_DOMINGO'
      Origin = 'REPETIR_DOMINGO'
      Size = 1
    end
    object sqlTarefaTERMINO_DATA: TSQLTimeStampField
      FieldName = 'TERMINO_DATA'
      Origin = 'TERMINO_DATA'
    end
    object sqlTarefaTERMINO_OCORRENCIAS: TBCDField
      FieldName = 'TERMINO_OCORRENCIAS'
      Origin = 'TERMINO_OCORRENCIAS'
      Precision = 18
      Size = 2
    end
    object sqlTarefaTIPO_TERMINO: TStringField
      FieldName = 'TIPO_TERMINO'
      Origin = 'TIPO_TERMINO'
      Size = 1
    end
    object sqlTarefaSOMENTE_DIA_UTIL: TStringField
      FieldName = 'SOMENTE_DIA_UTIL'
      Origin = 'SOMENTE_DIA_UTIL'
      Size = 1
    end
    object sqlTarefaOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
    end
    object sqlTarefaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
  end
  object dsrTarefa: TDataSource
    DataSet = sqlTarefa
    Left = 42
    Top = 550
  end
end
