object frmCadastroRapidoTarefa: TfrmCadastroRapidoTarefa
  Left = 0
  Top = 0
  Caption = 'Tarefa'
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  ClientHeight = 529
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
    Height = 491
    Align = alClient
    BevelInner = bvLowered
    Color = clWindow
    ParentBackground = False
    TabOrder = 2
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 681
      Height = 491
      TabOrder = 0
      object pnlDados: TPanel
        Left = 1
        Top = 1
        Width = 679
        Height = 320
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
          Top = 170
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
          Top = 190
          RepositoryItem = dtmLookup.Combo_TipoPeriodo
          DataBinding.DataField = 'PERIODO_TIPO'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.Items = <>
          Properties.ReadOnly = False
          Properties.OnChange = icxTipoPeriodoPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          StyleDisabled.Color = clWindow
          TabOrder = 6
          Width = 131
        end
        object lblMensagem: TcxLabel
          Left = 13
          Top = 88
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
          Top = 107
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
          Top = 170
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
          Top = 190
          DataBinding.DataField = 'DATA_INICIAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.DisplayFormat = 'dd/mm/yyyy'
          Properties.EditFormat = 'dd/mm/yyyy'
          Properties.OnChange = dtaDataInicialPropertiesChange
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 7
          OnExit = dtaDataInicialExit
          Width = 125
        end
        object dtmHoraInicial: TcxDBTimeEdit
          Left = 274
          Top = 190
          DataBinding.DataField = 'HORA_INICIAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 8
          OnExit = dtmHoraInicialExit
          Width = 79
        end
        object cxLabel2: TcxLabel
          Left = 357
          Top = 170
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
          Top = 190
          DataBinding.DataField = 'DATA_FINAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Properties.DisplayFormat = 'dd/mm/yyyy'
          Properties.EditFormat = 'dd/mm/yyyy'
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 9
          Width = 125
        end
        object dtmHoraFinal: TcxDBTimeEdit
          Left = 483
          Top = 190
          DataBinding.DataField = 'HORA_FINAL'
          DataBinding.DataSource = dsrTarefa
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 10
          Width = 79
        end
        object rgpTermino: TcxDBRadioGroup
          Left = 392
          Top = 220
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
          TabOrder = 13
          Height = 96
          Width = 271
        end
        object dteTerminoData: TcxDBDateEdit
          Left = 472
          Top = 263
          DataBinding.DataField = 'TERMINO_DATA'
          DataBinding.DataSource = dsrTarefa
          Enabled = False
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 21
          Width = 177
        end
        object speTerminoOcorrencias: TcxDBSpinEdit
          Left = 472
          Top = 288
          DataBinding.DataField = 'TERMINO_OCORRENCIAS'
          DataBinding.DataSource = dsrTarefa
          Enabled = False
          ParentFont = False
          Properties.MaxValue = 999.000000000000000000
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 22
          Width = 45
        end
        object lblTerminoOcorrencias: TcxLabel
          Left = 520
          Top = 289
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
          Top = 251
          Width = 335
          Height = 39
          BevelOuter = bvNone
          TabOrder = 12
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
          Top = 214
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
          Top = 170
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
          Top = 190
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
          TabOrder = 11
          Width = 94
        end
      end
      object pgcTarefa: TcxPageControl
        Left = 1
        Top = 321
        Width = 679
        Height = 169
        Align = alBottom
        TabOrder = 1
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        ClientRectBottom = 164
        ClientRectLeft = 2
        ClientRectRight = 674
        ClientRectTop = 25
        object cxTabSheet1: TcxTabSheet
          Caption = 'Responsaveis'
          Color = clWhite
          ImageIndex = 1
          ParentColor = False
          DesignSize = (
            672
            139)
          object shpResponsavel: TShape
            Left = 0
            Top = 0
            Width = 672
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
            Width = 666
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
    object cxLabel3: TcxLabel
      Left = 35
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = ' Titulo'
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
      Width = 386
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
          055449636F6E0000010007003030000001000800A80E00007600000020200000
          01000800A80800001E0F0000101000000100080068050000C617000080800000
          01002000280801002E1D00003030000001002000A82500005625010020200000
          01002000A8100000FE4A0100101000000100200068040000A65B010028000000
          3000000060000000010008000000000000090000000000000000000000010000
          0001000000000000567F7000018C5400008E59000A8E5A000190560000935B00
          00995E0013945E001C8A6500019562000E926500009B63000E9E6600009C6A00
          139465001B95660011906A00009F71000B9D760020876700238C6F002A8E6900
          318066003B826700378D6A00269A6B002D9E6E0034966F00379F7400389D7600
          00A1650000A26B0000A96C0000A3730000AB730001A67A0000AB7B0010A97E00
          00B1740000B37A0000BA7C0015B57C0021AF7A0028AB780034A5760034AA7D00
          38A97C00568073005A837400558874005D847A005B8C7D005C937F0060847A00
          668D7E00698A7E00249E840000AD81000AAE89001EAE860000B2840000BB8300
          0DBA870000B5890000BA8C0010B284001EBD860010B688001DB58C0010BA8B00
          00BC920012B091001DBA92001DBF980029A982002AAE890035AC83003DAD8900
          25B682002AB18C003DB28D0020AC920035A894002AB590002BB895002ABD9A00
          3EB691003BB99200549A82005B988C00648F87006E8B84006492890050B19600
          5CB49C0060A89D0045BDAB006DABA2007BAFA80065B8A70076B8AC0075BBB000
          01C1840000C38B000AC68A0000C98E001DC48C0000C2940000CB94000ACC9400
          00C49A0000CB9B0012CB92001DC29C0000D19C0012D19A001AD09A0021CA9300
          23CE98002FC99D0024D39D0000CCA30000CEA9001CC6A80001D3A3000DD6A200
          08D8A70001D3AB0008D7AE000FDAAB0013D6A3001BD7A40012D1AA0017DCAF00
          00D6B00000D8B3000BDAB30005DDBA000BDCB80019D5B10013DBB5001FDEB300
          12DEBA001ADEB9002AC4A20037C9AB0039CCAD0023D5A10022D8A5002CDAA600
          2CDBAB0035DEAE003ECDB00021D7B00022DBB6002BDDB2002ADDBD0035DFB000
          39DDB10034DEBD0013E0BE001AE0BD002CE0B60023E2BF002CE2BA0035E1B400
          3FE3B60035E3BB003FE5BB005AC3AC0041CFB30048D2B7004CD3BA0051D5BE00
          74C3B60041E3B50043E6B8004AE7BC004AE8BE0035DDC40013E0C0001AE3C200
          22E5C4002CE6C50024E6C80023E8CA002BE9CB0034E4C1003EE4C1003FE8C400
          3CE3C80035EACD003FEAC80035ECD0003EEED30049D5C10058D7C20057D8C000
          5FDBC7005ED9C80064DBC60071DFCD004AE9C20047E6C8004FE3CC0049ECCB00
          55E5C20054EBC4005EEDC70054EDCB005FEECA005FF0CE0058E6D20054EFD100
          5CEAD2004AF1D6004BF1D9005BF2D6006AF0CE006CE9D50074E5D30069F3D700
          77F5DA005FF5E0006BF6E2007BF7E30081C1B50092DDC70096DECA0085EFDD00
          89F7DE00AAE2D20089F9E60098FAE9009EFFF000A8FCEC00B7FEEF00ACFDF000
          B9FEF200CAE8DE00C6EAE000CBE9E000D0EEE500D9EFE900CEF2EC00D2F3EE00
          DAF2EC00C4FEF400DFF5F000E5F4EF00E5F5F200E8F7F400EAF8F600F0F8F600
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001181610100F0F0F0B0917300000000000000000000000000000
          0000000000000000000000000000000000000031191A10040202030303030A06
          0A0A0A1436000000000000000000000000000000000000000000000000000000
          00311C1A04020202020303030A0A0A0A0A0A120A121136000000000000000000
          00000000000000000000000000000000191A0402020202030603060A0A0A0A0A
          0E0A12121212121500000000000000000000000000000000000000000000381D
          0802020205050606060A0A0A0A0A0E0E0E12121212222224135C000000000000
          00000000000000000000000000312D05050505060606060A0A0A0A0C0E0E0E0E
          12121222222424242524360000000000000000000000000000000000322D0505
          05060606060C0A0C0C0C0E0E0E0E222222222224242525253A3A3A3400000000
          0000000000000000000000372D0606060706070C0C0C0C0C0E0E200E20222222
          2224252525253A3A3A40403B5C00000000000000000000000000002F07060707
          070C0C0C0C0C200E2020222222222424242525253A3A3A3D403B40403B000000
          000000000000000000001E0D0707070C0C0C1F0C202020202220242424242724
          28253D3D3D3D40404040474747390000000000000000000000342C0C0C1F1F1F
          1F1F202020200E0E20242427272728283D3D3D3D3D4040414747474747475B00
          0000000000000000002D1F1F1F1F1F2020202121204EF0F24B242727283D3D3D
          3D3D3E4041414147474747476F6F48000000000000000000354F1F1F20212121
          212424204EFEFFFFFA4B24283D3D3D3D3E414041414747476C476F6F6F6F6F5D
          00000000000000002D2121212121212427212151FEFFFFFFFFFA4C253E3D3E41
          4141416C476C6C6C6F6F6F6F7A7A7A5200000000000000004321212724272727
          272451FEFFFFFFFFFFFFFB4C3D414168476C6C6C6C6C6F6F6F7A6F7B6F7A7A7B
          00000000000000592A272727272727272451FEFFFFFFF0F4FFFFFFFB54416847
          6C6C6C6C6F706F7A7A6F7B7A7B7B7B7B5A0000000000004D2727272729292827
          51FEFFFFFFF1263CF4FFFFFFFB54416C6C6D707070707A707A7B7B7B7B7B7B89
          53000000000000432929292929292858FEFFFFFFF1423E4145F4FFFFFFFB566C
          7070707A7A7A7A7A807A80808087877B7C0000000000006B292929293E3E28F3
          FFFFFFF1424168686849F4FFFFFFFB566C707A7A7D7A80808080808787878789
          8A0000000000006B6729676767673EE8FFFFF142686D6D6D6C6C49F4FFFFFFFB
          91707D7D80807D808087878787888888B5000000000000766969676A676A673F
          E4E546686D6D6D7070736D4AF4FFFFFFFB917A80818989898989898F8F888A8A
          B500000000000077717171716A6A6D6868686D6D7070737373737D7072F4FFFF
          FFFC92858D8D8D8F8F8F8F8FB5B5B6B6BA000000000000797575757575746E73
          6D707373737373737D7D7D7D7D91F9FFFFFFFB998C90A2A2A2B6B6B6B6B6B6B6
          BA00000000000079799494949494949484837E737F737F7F7F828D8E8E8E92FB
          FFFFFFFBAB9BA4B7B7B7B7B7BABABABABB00000000000094969696969C97979C
          979C9C9C9C9CA3A3A39CA5A5A5A59D99F9FFFFFFFDAD9DB8B8BBBBBBBBBBBBBB
          B4000000000000789E9E9E9E9E9E9E9EA89EA5A9A5A8A5A5A8BCA8BCBEBCBCA0
          ACFBFFFFFFFCAEBCC0C0C0C0C2C2C2C3610000000000005EB0B0B0A9A9A9A8B1
          A8B1B1BEB1BEB1BEBEBEBEC1BEC1C1C1BDADFBFFFFFFFCC5BDC3C3C3C3C3C3D9
          6000000000000000B1B2B2B2B2B2CBCBCBD0BECBCBCECECBD2D2CED2C1D2C1D8
          CECCC6FBFFFFFFFDC8CED9D8D9D9D9D900000000000000009FD0D0D0D0D0D0D1
          D2D2D1D2D2D2D4D2D2D2D8D2DAD8D6D6DAD6CEC8FBFFFFFFF6CDDADAD9D9E0C4
          00000000000000005FD1D1D1D3D4D4D4D4D4D4D4D4D4D6D4DAD6D4E0D6D4DEDA
          DADEDAD7C9FDFFFFF6D5E0E0E0E0E162000000000000000000CBDBDBDBDBDBDB
          DBDBDBDBDEDBE1DBE1DEDFDEE1DEDEDEE1DEE1DEDECAF6F5CADEE0E1E1E1D700
          00000000000000000064DBDFDBDFDBDFDBDFDFDFDFDFDFDFDFDFDFDFDFE2E2E2
          E2E1E2E1E1DFDCDEDFE1E2E2E2E9620000000000000000000000CFE7DFE7E7E7
          DFE7E2DFE7E2E2E7E2E2E2E2E2E2E2E2E2E2E7E2E9E2E9E2E9E2E9E2E9D50000
          0000000000000000000000DBE7E7E7E7E9E7E9E9E9E7E9E7E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E2000000000000000000000000000065E7E7EAE7
          EAEAE7EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEBEAEAEAEA66000000
          000000000000000000000000AAEAEAECEAEAECEAEAEAEAEAEAEAEAEAEAEAEAEA
          EAEBEBEBEAEBEBEBEBEBEAAA0000000000000000000000000000000000AAEAEC
          ECEAECECECECECECECECECECECECEEEEECECECECEBEBEBEBEEEBAA0000000000
          000000000000000000000000000065EAEDEDECEDECEDECECEDECEEEEEEEEEEEE
          EEEEEEEEEFEFEFEFE96600000000000000000000000000000000000000000000
          E6EDEDEDEDEDEDEDEEEDEDEDEFEFEFEFEFEFEFEFEFEEEFDC0000000000000000
          0000000000000000000000000000000000E3EAF8EDEDEDEDF8EDF8F8EFF8EFEF
          F8EFEFEFF8E96600000000000000000000000000000000000000000000000000
          000000E3EAEDF6F8F8F8F8F8F8F8F8F8F8F8EFE9660000000000000000000000
          00000000000000000000000000000000000000000000E3DFE9ECEEEFEFEEECE9
          DFAF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFC003
          FFFF0000FFFE00007FFF0000FFF800001FFF0000FFF000000FFF0000FFC00000
          03FF0000FF80000001FF0000FF00000000FF0000FE000000007F0000FE000000
          007F0000FC000000003F0000F8000000001F0000F8000000001F0000F0000000
          000F0000F0000000000F0000F0000000000F0000E000000000070000E0000000
          00070000E000000000070000E000000000070000E000000000070000E0000000
          00070000E000000000070000E000000000070000E000000000070000E0000000
          00070000E000000000070000E000000000070000F0000000000F0000F0000000
          000F0000F0000000000F0000F8000000001F0000F8000000001F0000FC000000
          003F0000FE000000007F0000FE000000007F0000FF00000000FF0000FF800000
          01FF0000FFC0000003FF0000FFF000000FFF0000FFF800001FFF0000FFFE0000
          7FFF0000FFFFC003FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFF
          FFFF000028000000200000004000000001000800000000000004000000000000
          00000000000100000001000000000000008C5300008A5400008D5500008E5900
          0A8F5900009257000091590000955B0000915D0000955D0000995E0010905D00
          168A6300009360000095610000966400099262000D926100009A6100009D6200
          00996500009D65000894690000996800009D6800009E6D0012916100179B6500
          1D99660010977100208B630036826900219365002D956A0000A0650007A16600
          00A1690000A5690000A16E0000A56C0000A96E001CA06B0000A1710000A57100
          00A3740000A5750000A9700000AC710000A8750000AD740009AD710000A67900
          02A67C0000A9790000AD7A0000AA7C0000AE7D001AA577001BA779001FAC7800
          1BAB7C001BAE7F0000B1730000B2780000B6790000B17F0000B97D002BA27400
          3CA27E0043856B004C8474005787740058957E00638E7D00668D7E0000AD8100
          01AF840010AD8B0000B1810000B4820000B1850000B5850000BD810000B58900
          00B78C0000BA8A0000BE890000B98D0000BC8E001AB4840018B9810000BA9100
          00BD910000BE940009BE9B003BB18C0038A5920035BE99005F8D82004F958600
          608B80006A8A80006E8B8000719C8C00709B920040B6930040BD9B0072AF9D00
          53BBAC007AAAA30063BDA6006EB4AA006FBCAB007AB5AC0075BFAE0000C38600
          01C48A0013C0860019C78F0000C2930000CA93000BCC920000C1990000C49A00
          00C69D0000CA9C0014CC94001FCE970000D29E000AD49F0024C1930035C39F00
          22D49E0000CCA30000CEA90017C4A60001D3A40001D3AB000BD9A90010D4A000
          19D5A10014DBAE0000D7B10000D8B30008D9B40005DCB8000CDEBD0014D7B000
          15DDB7001CD9B00015DEBA0035C7A40035CCAA0020D5A10028D7A4002EDCAB00
          2EDEB10020DDBA0015E0BE002EE0B5002DE2BA003DE2B5003DE4BB0043C19D00
          40C4A40040CAAB004DD2B60055D6BD0057D8BE0066CAAE0063CEB0004DE8BE00
          36DCC30015E1C0001EE4C50021E4C3002DE2C30021E7C80026E8CB002EE9CB00
          3CE6C1003DE8C4003BE7CB003DEED3005EDAC30061DBC4006ADEC9004DEAC300
          4CECCB005DEDC7005DEECA005DF0CF004CEFD60056EDD7005BEED4004DF2D800
          5CF1D30055F3DC005CF3DD0068EDCD0078E1CF006DF1CF006EE2D0006DE9D600
          72EAD9006DF2D3006CF4DB007DF6DB006CF6E20072F7E5007BF6E3007CF8E300
          7DF9E80082968E00819A900089B6AB008BB7B10091BAB10082C0B6008DCFBA00
          8DC8BC0089D0BC008AD8C10086D5C9008BDACB0081E6D60085F7DD008CF8DF00
          BCEADD008CF9E3008CFAE90096F1E50097FAE4009BFBE60097FCEC009AFBEB00
          ACEDE300B0EEE400A0F7E500A5FCEC00A9FCED00B4FDEF00A0FDF000AAFDF000
          B4FDF100BCFFF400D9EEE800D9F0E900C0FEF300EFF9F600F1FAF900F4FAF900
          F5FCFA00FEFEFE00FFFFFF000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000067461F1B1212120D20
          67000000000000000000000000000000000000000048210C02020404090E0E0E
          18174700000000000000000000000000000000D622050202090909090E151818
          182B2B1E00000000000000000000000000004B1D02060909090915151818272B
          2B2B3434346500000000000000000000004B1C06090908081515152727272B2B
          3636364C4C4C63000000000000000000D72A0908081415232327272727313636
          364C4C4C5454540000000000000000004408232323232327272729313136364F
          4F4F5454545C5C4E0000000000000049232323232729273ADC603140404F4F4F
          5456545C5C5C7B7B640000000000003C2729292929293AF8FEFC6A364F565656
          565C5C7B7B7B7B7B5F000000000068332929293F313DF8FEFEFEFC6B4F56567B
          5D7B7B7B7E7E8686866900000000453F3F3F40403EF8FEFEDEFAFEFCA4567B5D
          79797E7E868686878761000000005B3F4343435AF8FEFEAA4F62FAFEFCA4797E
          7E868686868787878F88000000007643535353DFFEFEAB56795D62FBFEFCA67E
          818681878F8F8F8F8F9200000000775D74747583E5AB5D7979817998FBFEFCA6
          818F919191919192929200000000807F7F7A7975797979818181818199FAFEFC
          A7949595959797AEAEB200000000858585859A8D8C8282818189918E96A7FCFE
          FCA99EB0B0B0B2B2B2B3000000009B9B9C9C9CA09CA0A0A0A0A1A1A1A1A1A9FC
          FEFCB9B1B3B4B4B3B4AD00000000A4A2A2A3A3A3A3A3A3A3B6A3B6B6B6B6B6B9
          FCFEFCBBB7B8B8B8B86D000000006CACACACACBCBCBCBDBDBDBDBDBDBDC1BDBD
          BBFCFEFCCBC1C4C6C66E0000000000BCBEBFBEBFBFBFBFBFBFC5C5C5C5C5C5C7
          C3C9FCFEEDC7C7C7C20000000000006FCACACECECECECECFCECECFCFCFCFCFCF
          CFCFE2EECCD1D1D27000000000000000CAD0D0D0D0D0D0D0D4D0D4E3D4D4D4D4
          D4D4D4D3D4D4D5CD0000000000000000D8E3E4E4E4E6E6E6E6E6E6E6E7E7E7E7
          E7E7E7E7E7E7E70000000000000000000071E7EAEAEAEAEAEAEAEAEAEAEAEAF3
          EAF3EAF3F3EB72000000000000000000000073F0F0F0F1F1F1F4F4F4F4F4F4F4
          F4F4F4F4F37200000000000000000000000000DAEFF2F2F2F2F2F2F2F2F6F2F2
          F6F4F6E80000000000000000000000000000000000DDF2F9F9F9F9F9F9F6F9F6
          F9F4DB0000000000000000000000000000000000000000DAE1EAF2F6F6F6EBE0
          D900000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFE007FFFF8001FFFE0000FF
          FC00003FF800001FF000001FF000000FE0000007E0000007C0000003C0000003
          C0000003C0000003C0000003C0000003C0000003C0000003C0000003C0000003
          E0000007E0000007F000000FF000001FF800001FFC00003FFE0000FFFF8001FF
          FFE007FFFFFFFFFFFFFFFFFF2800000010000000200000000100080000000000
          000100000000000000000000000100000001000000000000008F57001A885D00
          00925B0000965D0005965D000D905A0008905D00138C64000592600000956000
          0099610000996500009D6500009D6B000CA0670000A1680006A36E0000A86C00
          00A1700004A0740000A6750000AB700000A9750006AB740000A97A0000AD7B00
          16AF7A0000B4780006B47C004A8976005389730000AD800000B0800000B18500
          00B7860000B78B0000BB8B0000BA900004B9920000BE900032B18800549A8100
          77978A0071978D0076998C00719B91004DA0900069BAA4006FB7AD0000C18400
          0DC2870000C1950000C4960000C8930000C49A0000C79F0000C89B0006CE9800
          19C6960001D19C000ED0990018D09A001ED09A002BC6970000CBA00000CDA400
          14C1A20001D3A00001D1A50008D5A50000D0A90004D5AB0004D7B00003D9B300
          06DBB8001ADFBA0036D4A60036DFB0001BE2BF0036E0B30036E1B60036E3B900
          36E4BD005DC6A8005DCEB20056D3B4005DD6BB006BCFB3003CD9C2001BE3C200
          1EE5C60035E5C10035EACC0036ECD00063DCC2006BDEC80055EBC30055EBC500
          55ECC90055EECE0054EFD20055F0D10055F3DC0079E5D10070ECD90070F1D100
          75F4D60075F5DA0075F6DD0074F5E0008EBEB30093B8B30096BBB50096C0B700
          96C4BD009BC7BF008CEADA00B3E1D200B3E3D4008AF0E00093F9E20094FAE500
          94FAE90093FBED0094FBEC00A5F2E600A7FAEE00A9FBEA00AFFDEE00AFFDF000
          BBFEF300BBFEF400C6EDE200D8F1EA00F8FCFB00F9FDFC00FEFEFE0000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000FFFFFF00000000000000000000000000
          0000000000000000001F020709081E00000000000000002B070103090C0E1313
          2B00000000002D03050C0C1013131A20222E000000000F0D0D10291A1A212226
          26260000002A12161677FF542128282838382F00001B1C1C778658FF55284141
          4147430000333240853B3656875745474A4A4B00003F3F3D3A3C45465FFF604C
          4C5B5B00004D4E51515252525C6887685E5E59000030616163636666666675FF
          6967310000006A6A6C6C6C6C6C6E6E786E6E000000006F7A7A7A7A7B7B7B7B7B
          7B70000000000072808082828282827F720000000000000000747E83837E7300
          0000000000000000000000000000000000000000FFFF0000F81F0000E0070000
          C0030000C0030000800100008001000080010000800100008001000080010000
          C0030000C0030000E0070000F81F0000FFFF0000280000008000000000010000
          0100200000000000000801000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001000000020000000200000002000000020000000200000002
          0000000200000002000000020000000200000001000000010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000010000000200000002000000040000000500000006
          000000080000000A0000000B0000000C0000000C0000000D0000000D0000000D
          0000000D0000000D0000000C0000000B0000000A000000090000000700000006
          0000000500000003000000020000000100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100000002
          0000000400000006000000080000000A0000000D000000100000001200000015
          000000170000001A0000001C0000001D0000001E0000001F0000002000000020
          0000001F0000001F0000001E0000001C0000001B000000190000001600000014
          000000110000000E0000000C0000000900000007000000050000000300000002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000010000000300000005000000080000000B
          0000000F00000013000000170000001B0000001F00000023000000270000002B
          0000002E00000031000000340000003600000038000000390000003A0000003A
          0000003A00000039000000380000003500000033000000300000002D00000029
          00000026000000210000001D0000001900000015000000110000000D0000000A
          0000000600000004000000020000000100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000010000000300000005000000080000000C00000011000000160000001B
          00000021000000270000002D00000033000000390000003E0000004300000048
          0000004D0000005100000054000000570000005A0000005B0000005C0000005C
          0000005B0000005A0000005800000056000000530000004F0000004B00000046
          000000410000003C00000037000000300000002B000000250000001F00000019
          000000140000000F0000000B0000000600000004000000020000000100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000200000004
          000000070000000B00000010000000160000001D000000240000002C00000034
          0000003C000000430000004B000000530000005A00000060000000660000006B
          011A148402281E97013024A5013727AF013A28B2013B29B300452BBB00412AB8
          013B29B3013B29B3013427AB022E23A102261D94000B087B0000006E00000069
          000000640000005D000000570000005000000048000000400000003800000030
          00000029000000210000001A000000130000000E000000090000000600000003
          0000000100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000010000000200000005000100090000000E
          000000140000001B000000230000002C000000360000003F0000004900000053
          0000005D0000006501171180013224A700442CBA016441D601734DEC008252FB
          008854FF058A58FF0A8D5CFF0E8F5FFF139263FF129263FF119262FF109263FF
          0F9262FF0D9262FF09905FFF048F5DFF018D5BFF008D5BFF018057F5027451E6
          015B3DCB01402CB6022C229E000705760000006A00000061000000580000004F
          000000450000003B00000031000000280000002000000018000000110000000B
          0000000700000003000000010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000010000000200010005000000090000000E000000160000001F
          00000028000000320000003E00000049000000550000006001130E79013224A5
          015838CA01764DF0008751FF0F8E5CFF1D9566FF289A6EFF33A076FF3DA57DFF
          46A983FF41A780FF3AA47CFF32A278FF2B9E74FF299E73FF279D72FF269D71FF
          239C70FF239C70FF249D72FF269F74FF26A075FF209D71FF199A6DFF129769FF
          0C9566FF079464FF029161FF008D5FFC027452E4014A34BD022A219B00050373
          000000660000005B0000004F00000044000000380000002D000000230000001A
          000000120000000C000000070000000300000001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000200020104000201090000000E00000016000000200000002B00000036
          00000043000000500000005D000F0C76013A28AF016F48E6008550FF0E8D5AFF
          26996BFF3DA37BFF51AE89FF47A983FF36A177FF299B6FFF1B9566FF0F905FFF
          038B58FF008A56FF008A56FF008B57FF008B58FF008C58FF008C59FF008C59FF
          008D5AFF008D5BFF008E5BFF008E5CFF008F5DFF049160FF089363FF0D9567FF
          109869FF12986BFF159A6EFF10996BFF0A9668FF059565FF009363FF018D61FA
          026346D1022E23A00001007100000064000000580000004A0000003E00000031
          000000260000001B000000130000000B00010006000000030000000100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100010103
          000201070000000D000000150000001F0000002B000000380000004700000055
          00060568013022A0016440D700834EFD13905CFF37A176FF57B08CFF51AE88FF
          37A277FF1E9766FF078C57FF008953FF008A54FF008A54FF008B55FF008B55FF
          008B56FF008C56FF008C57FF008D58FF008D58FF008D59FF008E59FF008E5AFF
          008F5BFF008F5BFF008F5CFF00905DFF00905DFF00915EFF00915EFF00925FFF
          009260FF009360FF009361FF039564FF089767FF0A996AFF0C9A6BFF089969FF
          039767FF009665FF02895FF302553CC4021F188E0000006B0000005D0000004F
          0000004000000032000000250000001A000000120000000B0000000600000002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000010002000301060001010B
          000000120000001D00000028000000370000004600000056000F0B7201472FB8
          007B4DF50B8B57FF309D71FF55AF8AFF55AF8BFF309E72FF0D8E5BFF008852FF
          008953FF008953FF008954FF008A54FF008A55FF008B55FF008B56FF008B56FF
          008C57FF008C58FF008D58FF008D59FF008D59FF008E5AFF008E5BFF008F5BFF
          008F5CFF008F5CFF00905DFF00905EFF00915EFF00915FFF009260FF009260FF
          009361FF009362FF009462FF009463FF009463FF009564FF009565FF029767FF
          059869FF05996AFF039869FF009868FF009869FF027856E1023226A30000006E
          0000005F0000004F0000003F0000003100000023000000180000000F00010108
          0001000400000001000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000100030104000201080000000F00000018
          00000024000000330000004300000054000F0C72014E33C000814EFB138F5CFF
          47A880FF62B593FF3DA47AFF189361FF008851FF008952FF008952FF008953FF
          008A53FF008A54FF008A54FF008B55FF008B55FF008C56FF008C56FF008C57FF
          008D58FF008D58FF008E59FF008E59FF008E5AFF008F5BFF008F5BFF00905CFF
          00905CFF00905DFF00915EFF00915EFF00925FFF009260FF009360FF009361FF
          009362FF009462FF009463FF009563FF009564FF009665FF009665FF009766FF
          009767FF009868FF019969FF019969FF00996AFF009A6AFF009A6BFF02855FEC
          023628A60000006E0000005E0000004C0000003C0000002C0000001E00000014
          0000000B00010106000000020000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000010002000301050001010A000000130000001E0000002C
          0000003D0000004F000A0767014A31B900804DFA17925EFF4DAB84FF64B694FF
          329F73FF058A54FF008951FF008951FF008952FF008A52FF008A53FF008A53FF
          008B54FF008B54FF008C55FF008C55FF008C56FF008D57FF008D57FF008E58FF
          008E58FF008E59FF008F5AFF008F5AFF00905BFF00905CFF00905CFF00915DFF
          00915DFF00925EFF00925FFF00925FFF009360FF009361FF009461FF009462FF
          009563FF009563FF009564FF009664FF009765FF009766FF009866FF009867FF
          009868FF009968FF009969FF009A6AFF009A6BFF009B6BFF009B6CFF009C6DFF
          009C6DFF02845FE9022D229D0000006B00000059000000460000003500000026
          000000190000000F000101080001000300000001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020102000402060000000D00000017000000240000003400000046
          00000059013625A0007B4BF112905BFF52AE88FF62B693FF2E9E70FF048B53FF
          008A51FF008A51FF008A52FF008B52FF008B53FF008B53FF008C54FF008C54FF
          008D55FF008D56FF008D56FF008E57FF008E57FF008E58FF008F59FF008F59FF
          00905AFF00905AFF00905BFF00915CFF00915CFF00925DFF00925DFF00935EFF
          00935FFF00935FFF009460FF009461FF009561FF009562FF009663FF009663FF
          009664FF009764FF009765FF009866FF009866FF009967FF009968FF009968FF
          009A69FF009A6AFF009B6AFF009B6BFF009C6CFF009C6DFF009D6DFF009D6EFF
          009E6FFF009E6FFF009E70FF037152D80218138800000064000000510000003E
          0000002C0000001D000000120001000A00020104000000010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          0003020400010108000000100000001B0000002A0000003B0000004F00141077
          006741DA058A51FF3FA57AFF69B997FF32A072FF028A52FF008950FF008A51FF
          008A51FF008A52FF008B53FF008B53FF008B54FF008C54FF008C55FF008D55FF
          008D56FF008D56FF008E57FF008E58FF008E58FF008F59FF008F59FF00905AFF
          00905BFF00905BFF00915CFF00915DFF00925DFF00925EFF00935EFF00935FFF
          009360FF009460FF009461FF009562FF009562FF009663FF009663FF009664FF
          009765FF009765FF009866FF009867FF009967FF009968FF009969FF009A69FF
          009A6AFF009B6BFF009B6CFF009C6CFF009C6DFF009D6EFF009D6EFF009E6FFF
          009E70FF009E70FF009F71FF009F72FF019A6FFB034F3BB80002016F0000005A
          000000460000003300000023000000150000000C000201060000000200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000100050304
          00020109000000120000001E0000002F0000004200000056013E29A300834DFA
          269A69FF69B997FF47AA81FF0B8F58FF008A51FF008B51FF008B52FF008B52FF
          008C53FF008C53FF008C54FF008D54FF008D55FF008D55FF008E56FF008E57FF
          008F57FF008F58FF008F58FF009059FF00905AFF00915AFF00915BFF00915BFF
          00925CFF00925DFF00935DFF00935EFF00935EFF00945FFF009460FF009560FF
          009561FF009662FF009662FF009663FF009764FF009764FF009865FF009865FF
          009966FF009967FF009967FF009A68FF009A69FF009B69FF009B6AFF009C6BFF
          009C6BFF009D6CFF009D6DFF009E6EFF009E6EFF009E6FFF009F70FF009F70FF
          00A071FF00A072FF00A172FF00A173FF00A274FF00A274FF02835FE402181288
          000000620000004D0000003800000027000000180000000E0003020700010002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000010001000604040002010A
          00000014000000210000003300000047000B086500593ACB088D54FF52AF87FF
          62B794FF1B9763FF008A51FF008B51FF008B52FF008B52FF008C53FF008C53FF
          008D54FF008D55FF008D55FF008E56FF008E56FF008E56FF008F57FF008F57FF
          009058FF009059FF009059FF00915AFF00915AFF00925BFF00925CFF00925CFF
          00935DFF00935EFF00945EFF00945FFF00945FFF009560FF009561FF009561FF
          009662FF009663FF009763FF009764FF009764FF009865FF009866FF009966FF
          009967FF009A68FF009A68FF009B69FF009B6AFF009B6AFF009C6BFF009C6CFF
          009D6DFF009D6DFF009E6EFF009E6FFF009F6FFF009F70FF00A071FF00A071FF
          00A172FF00A173FF00A173FF00A274FF00A275FF00A375FF00A376FF019B71F8
          03382AA400000069000000530000003E0000002B0000001B0000000F00030207
          0001000300000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010101000402050002010B00000015
          00000024000000360000004C001B147D007848E91A9561FF6ABA99FF44AA80FF
          028C53FF008B52FF008C52FF008C53FF008C53FF008D54FF008D54FF008D55FF
          008E55FF008E56FF008E56FF008F57FF008F57FF009058FF009058FF009059FF
          009159FF00915AFF00925BFF00925BFF00925CFF00935CFF00935DFF00945EFF
          00945EFF00945FFF00955FFF009560FF009661FF009661FF009662FF009763FF
          009763FF009764FF009865FF009865FF009966FF009966FF009A67FF009A68FF
          009A68FF009B69FF009B6AFF009C6AFF009C6BFF009D6CFF009D6CFF009E6DFF
          009E6EFF009F6FFF009F6FFF009F70FF00A071FF00A071FF00A172FF00A173FF
          00A273FF00A274FF00A375FF00A375FF00A476FF00A477FF00A477FF00A578FF
          00A578FE04634AC90004037100000059000000420000002E0000001D00000010
          0000000800010103000000010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010101000403050000000C0000001600000026
          000000390000004F013B279C00864FFB37A476FF6DBD9BFF239C6AFF008C51FF
          008D52FF008D52FF008D53FF008E53FF008E54FF008E54FF008F55FF008F56FF
          008F56FF009057FF009057FF009158FF009158FF009159FF00925AFF00925AFF
          00925BFF00935BFF00935CFF00945DFF00945DFF00945EFF00955EFF00955FFF
          009560FF009660FF009661FF009761FF009762FF009763FF009863FF009864FF
          009965FF009965FF009A66FF009A67FF009A67FF009B68FF009B68FF009C69FF
          009C69FF009D6AFF009D6BFF009E6BFF009E6CFF009E6DFF009F6EFF009F6EFF
          00A06FFF00A070FF00A170FF00A171FF00A172FF00A272FF00A273FF00A374FF
          00A374FF00A475FF00A476FF00A576FF00A577FF00A578FF00A679FF00A679FF
          00A77AFF00A77BFF038966E5021410810000005D00000045000000300000001F
          0000001100010008000201030000000100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020101000503050000000C00000017000000270000003B
          00000052014831AD058C53FE55B18BFF5FB692FF0F935CFF008C52FF008D53FF
          008D53FF008D54FF008E54FF008E55FF008E55FF008F56FF008F56FF008F57FF
          009057FF009058FF009159FF009159FF00915AFF00925AFF00925BFF00925BFF
          00935CFF00935DFF00945DFF00945EFF00945EFF00955FFF009560FF009560FF
          009661FF009662FF009762FF009763FF009763FF009864FF009865FF009965FF
          009966FF009A67FF009A67FF009A68FF009B69FF009B69FF009C69FF009C6AFF
          009D6BFF009D6BFF009E6CFF009E6DFF009E6DFF009F6EFF009F6FFF00A070FF
          00A070FF00A171FF00A172FF00A172FF00A273FF00A274FF00A374FF00A375FF
          00A476FF00A476FF00A577FF00A578FF00A578FF00A679FF00A67AFF00A77BFF
          00A77BFF00A87CFF00A87DFF029670EF021B1589000000600000004700000032
          0000001F00000011000100080002010300000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010101000805040000000B00000017000000270000003C00000054
          015037BC0B9159FF62B894FF48AD83FF028E54FF008E53FF008E53FF008E54FF
          008F54FF008F55FF008F55FF009056FF009057FF009057FF009158FF009158FF
          009159FF009259FF00925AFF00935AFF00935BFF00935CFF00945CFF00945DFF
          00945DFF00955EFF00955EFF00955FFF00965FFF009660FF009761FF009761FF
          009862FF009862FF009863FF009964FF009964FF009A65FF009A66FF009B66FF
          009B67FF009B68FF009C68FF009C69FF009D6AFF009D6AFF009D6BFF009E6CFF
          009E6CFF009F6DFF009F6EFF009F6EFF00A06FFF00A070FF00A170FF00A171FF
          00A271FF00A272FF00A373FF00A373FF00A474FF00A475FF00A575FF00A576FF
          00A577FF00A677FF00A678FF00A679FF00A77AFF00A77AFF00A87BFF00A87CFF
          00A97CFF00A97DFF00AA7EFF00AA7EFF029E77F502231B910000006100000049
          000000320000001F000000110001000800010103000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010001000704040003010B00000016000000270000003B00030256005C3CC9
          10945CFF6CBD9BFF3DA97CFF008E53FF008E54FF008E54FF008F55FF008F55FF
          008F56FF009056FF009057FF009157FF009158FF009158FF009259FF009259FF
          00925AFF00935BFF00935BFF00935CFF00945CFF00945DFF00945EFF00955EFF
          00955FFF00965FFF00965FFF009660FF009761FF009761FF009862FF009863FF
          009863FF009964FF009964FF009A65FF009A66FF009A66FF009B67FF009B68FF
          009C68FF009C69FF009C6AFF009D6AFF009D6BFF009E6CFF009E6CFF009F6DFF
          009F6EFF00A06EFF00A06FFF00A170FF00A170FF00A171FF00A271FF00A272FF
          00A273FF00A373FF00A374FF00A475FF00A475FF00A576FF00A577FF00A677FF
          00A678FF00A779FF00A779FF00A87AFF00A87BFF00A87CFF00A97CFF00A97DFF
          00AA7EFF00AA7EFF00AA7FFF00AB80FF00AB81FF01A57CF90331269B00000062
          00000049000000320000001E0000001000040307000101020000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000704040002010A00000015000000240000003A0004035501643FCF139760FF
          6FC09EFF2FA474FF008F55FF008F55FF009056FF009056FF009057FF009157FF
          009158FF009158FF009259FF009259FF00935AFF00935AFF00935BFF00945BFF
          00945CFF00945CFF00955DFF00955DFF00955EFF00965FFF00965FFF009760FF
          009760FF009761FF009862FF009862FF009963FF009963FF009964FF009A65FF
          009A65FF009A66FF009B67FF009B67FF009C68FF009C68FF009C69FF009D69FF
          009D6AFF009E6BFF009E6BFF009F6CFF009F6DFF009F6DFF00A06EFF00A06FFF
          00A16FFF00A170FF00A271FF00A271FF00A272FF00A373FF00A373FF00A474FF
          00A475FF00A475FF00A576FF00A576FF00A677FF00A678FF00A778FF00A779FF
          00A87AFF00A87AFF00A97BFF00A97CFF00A97DFF00AA7DFF00AA7EFF00AB7FFF
          00AB7FFF00AB80FF00AC81FF00AC82FF00AD82FF00AD83FF01AA81FC0335299D
          0000006100000047000000300000001D0000000F000403060001000200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050303
          0002010800000012000000220000003700010152005E3DC911965EFF70C09FFF
          29A270FF009055FF009055FF009156FF009156FF009157FF009257FF009258FF
          009258FF009359FF009359FF00935AFF00945AFF00945BFF00955BFF00955CFF
          00955CFF00955DFF00965DFF00965EFF00975FFF00975FFF009760FF009860FF
          009861FF009962FF009962FF009963FF009A63FF009A64FF009B65FF009B65FF
          009B66FF009C67FF009C67FF009C68FF009D68FF009D69FF009E69FF009E6AFF
          009F6BFF009F6BFF009F6CFF00A06DFF00A06DFF00A06EFF00A16FFF00A16FFF
          00A270FF00A271FF00A371FF00A372FF00A473FF00A473FF00A574FF00A575FF
          00A575FF00A676FF00A676FF00A777FF00A778FF00A778FF00A879FF00A87AFF
          00A97AFF00A97BFF00AA7CFF00AA7DFF00AB7DFF00AB7EFF00AB7FFF00AC7FFF
          00AC80FF00AD81FF00AD82FF00AE82FF00AE83FF00AF84FF00AF84FF01AA81FB
          032F249800000060000000450000002D0000001A0000000D0003020500000001
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004020200080507
          000000100000001F000000340000004D015439BC0E975EFF6EC09EFF2DA474FF
          009256FF009257FF009257FF009258FF009358FF009358FF009359FF009459FF
          00945AFF00945AFF00955BFF00955BFF00955CFF00965DFF00965DFF00975EFF
          00975EFF00975FFF00975FFF009860FF009861FF009961FF009962FF009962FF
          009A63FF009A63FF009B64FF009B64FF009B65FF009C66FF009C66FF009C67FF
          009D68FF009D68FF009E69FF009E6AFF009F6AFF009F6BFF009F6BFF00A06CFF
          00A06DFF00A06DFF00A16EFF00A16FFF00A26FFF00A270FF00A370FF00A371FF
          00A472FF00A472FF00A473FF00A574FF00A574FF00A675FF00A676FF00A676FF
          00A777FF00A778FF00A879FF00A879FF00A87AFF00A97AFF00A97BFF00AA7BFF
          00AA7CFF00AB7DFF00AB7EFF00AC7EFF00AC7FFF00AC80FF00AD80FF00AD81FF
          00AE82FF00AE83FF00AF83FF00AF84FF00B085FF00B085FF00B186FF00B187FF
          01AA82F902221A8D0000005C000000410000002A000000180002010B00030304
          0000000100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000020101000704050000000D
          0000001B0000002F00000048014932A708945AFF68BE9BFF34A879FF009256FF
          009257FF009357FF009358FF009358FF009359FF009459FF00945AFF00955BFF
          00955BFF00955CFF00965CFF00965DFF00965DFF00975EFF00975EFF00975FFF
          009860FF009860FF009860FF009961FF009962FF009A62FF009A63FF009A63FF
          009B64FF009B65FF009B65FF009C66FF009C66FF009D67FF009D68FF009D68FF
          009E69FF009E69FF009E6AFF009F6AFF009F6BFF00A06CFF00A06CFF00A16DFF
          00A16EFF00A16EFF00A26FFF00A270FF00A270FF00A371FF00A372FF00A472FF
          00A473FF00A573FF00A574FF00A675FF00A675FF00A676FF00A777FF00A778FF
          00A878FF00A879FF00A97AFF00A97AFF00A97BFF00AA7BFF00AA7CFF00AB7DFF
          00AB7DFF00AB7EFF00AC7FFF00AC7FFF00AD80FF00AD81FF00AD81FF00AE82FF
          00AE83FF00AF84FF00AF84FF00B085FF00B186FF00B186FF00B287FF00B288FF
          00B389FF02A47EF202181382000000570000003D000000260000001400010109
          0002010300000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000805040003020B00000017
          0000002A00000042012F1F89029056FD5CB993FF45B084FF009357FF009358FF
          009458FF009459FF009459FF00945AFF00955AFF00955BFF00955BFF00965CFF
          00965CFF00965DFF00975DFF00975EFF00985FFF00985FFF009860FF009860FF
          009961FF009961FF009A62FF009A62FF009A63FF009B63FF009B64FF009B65FF
          009C65FF009C66FF009D67FF009D67FF009D68FF009E68FF009E69FF009F6AFF
          009F6AFF009F6BFF00A06BFF00A06CFF00A06CFF00A16DFF00A16EFF00A26EFF
          00A26FFF00A370FF00A370FF00A371FF00A472FF00A472FF00A573FF00A573FF
          00A674FF00A675FF00A675FF00A776FF00A777FF00A777FF00A878FF00A879FF
          00A97AFF00A97AFF00AA7BFF00AA7CFF00AA7CFF00AB7CFF00AB7DFF00AC7EFF
          00AC7FFF00AD7FFF00AD80FF00AE81FF00AE81FF00AE82FF00AF83FF00AF84FF
          00B084FF00B085FF00B186FF00B186FF00B287FF00B288FF00B388FF00B389FF
          00B48AFF00B48BFF039472E50108067200000051000000370000002100000011
          0005040700010002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000050302000604080000001300000024
          0000003B0016116C008954F548B287FF51B68DFF019459FF009559FF00955AFF
          00955AFF00965BFF00965BFF00965CFF00965CFF00975DFF00975DFF00975EFF
          00985EFF00985FFF00995FFF009960FF009960FF009961FF009A61FF009A62FF
          009B63FF009B63FF009B64FF009C64FF009C65FF009C66FF009D66FF009D67FF
          009D67FF009E68FF009E68FF009F69FF009F69FF009F6AFF00A06BFF00A06BFF
          00A16CFF00A16DFF00A16DFF00A26EFF00A26FFF00A36FFF00A36FFF00A370FF
          00A471FF00A471FF00A572FF00A573FF00A573FF00A674FF00A675FF00A776FF
          00A776FF00A777FF00A877FF00A878FF00A978FF00A979FF00A97AFF00AA7BFF
          00AA7BFF00AB7CFF00AB7DFF00AC7DFF00AC7EFF00AC7FFF00AD7FFF00AD80FF
          00AE80FF00AE81FF00AF82FF00AF82FF00AF83FF00B084FF00B085FF00B185FF
          00B186FF00B287FF00B287FF00B388FF00B389FF00B489FF00B48AFF00B58BFF
          00B58CFF00B58CFF00B68DFF04765BCE000000670000004A000000300000001C
          0000000D00030205000000010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000020101000805060000000E0000001E00000034
          00060552007B4DE02DA875FF69C19DFF06985EFF00965AFF00965AFF00975BFF
          00975BFF00975CFF00975CFF00985DFF00985DFF00985EFF00995EFF00995FFF
          00995FFF009A60FF009A60FF009A61FF009B62FF009B62FF009B63FF009C63FF
          009C64FF009D64FF009D65FF009D65FF009E66FF009E67FF009E67FF009F68FF
          009F68FF00A069FF00A06AFF00A06AFF00A16BFF00A16BFF00A16CFF00A26CFF
          00A26DFF00A36EFF00A36EFF00A36FFF00A470FF00A470FF00A571FF00A572FF
          00A572FF00A672FF00A673FF00A674FF00A775FF00A775FF00A876FF00A877FF
          00A877FF00A978FF00A979FF00AA79FF00AA7AFF00AB7AFF00AB7BFF00AB7CFF
          00AC7CFF00AC7DFF00AD7EFF00AD7EFF00AE7FFF00AE80FF00AE80FF00AF81FF
          00AF81FF00B082FF00B083FF00B183FF00B184FF00B185FF00B286FF00B286FF
          00B387FF00B388FF00B488FF00B489FF00B58AFF00B58BFF00B58BFF00B68CFF
          00B68DFF00B78DFF00B78EFF00B88FFF054E3DAC0000005F000000420000002A
          000000160002010A000202030000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000805030003020B000000180000002C00000046
          015639B5129D65FF6DC3A1FF139E67FF00965BFF00975BFF00975CFF00975CFF
          00985DFF00985DFF00985EFF00995EFF00995EFF00995FFF009A5FFF009A60FF
          009A61FF009A61FF009B62FF009B62FF009C63FF009C63FF009C64FF009D65FF
          009D65FF009D65FF009E66FF009E67FF009F67FF009F68FF009F68FF009F69FF
          00A06AFF00A06AFF00A16BFF00A16CFF00A26CFF00A26CFF00A26DFF00A26EFF
          00A36EFF00A36FFF00A470FF00A470FF00A471FF00A572FF00A572FF00A673FF
          00A673FF00A774FF00A774FF00A775FF00A876FF00A877FF00A977FF00A978FF
          00A979FF00AA79FF00AA7AFF00AB7AFF00AB7BFF00AB7CFF00AC7CFF00AC7DFF
          00AC7EFF00AD7EFF00AD7FFF00AE80FF00AE80FF00AE81FF00AF81FF00AF82FF
          00B083FF00B083FF00B184FF00B185FF00B186FF00B286FF00B287FF00B388FF
          00B488FF00B489FF00B58AFF00B58AFF00B58BFF00B68CFF00B68DFF00B78DFF
          00B78EFF00B88FFF00B88FFF00B890FF02B28BFA031F1887000000560000003A
          0000002300000012000504070001000200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000403020006040700000012000000240000003C012A1D80
          02965BFD61BE99FF32AC7BFF00985BFF00985CFF00985CFF00995CFF00995DFF
          00995DFF00995EFF009A5FFF009A5FFF009B60FF009B60FF009B61FF009C61FF
          009C62FF009C62FF009D63FF009D63FF009D64FF009E64FF009E65FF009E66FF
          009F66FF009F67FF009F67FF00A068FF00A069FF00A069FF00A169FF00A16AFF
          00A26BFF00A26BFF00A26CFF00A36DFF00A36DFF00A36EFF00A46EFF00A46FFF
          00A56FFF00A570FF00A571FF00A671FF00A672FF00A773FF00A773FF00A774FF
          00A875FF00A875FF00A976FF00A976FF00A977FF00AA78FF00AA78FF00AA79FF
          00AB7AFF00AB7AFF00AC7BFF00AC7BFF00AC7CFF00AD7DFF00AD7DFF00AE7EFF
          00AE7FFF00AE7FFF00AF80FF00AF81FF00B081FF00B082FF00B082FF00B183FF
          00B184FF00B284FF00B285FF00B286FF00B387FF00B387FF00B488FF00B589FF
          00B589FF00B68AFF00B68BFF00B68CFF00B78CFF00B78DFF00B88EFF00B88EFF
          00B88FFF00B98FFF00B990FF00BA91FF00BA91FF049877E40002026B0000004C
          000000310000001B0000000D0004030400000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000B07040000000D0000001C0000003200090754018554E9
          3EB182FF4FB88FFF00995CFF00995DFF00995DFF009A5DFF009A5EFF009A5EFF
          009A5FFF009B5FFF009B60FF009B60FF009C61FF009C61FF009D62FF009D63FF
          009D63FF009D63FF009E64FF009E64FF009F65FF009F66FF009F66FF009F67FF
          00A067FF00A068FF00A169FF00A169FF00A16AFF00A26AFF00A16BFF00A26BFF
          00A26CFF00A26DFF00A36DFF00A36EFF00A36FFF00A56FFF00A570FF00A570FF
          00A671FF00A671FF00A672FF00A773FF00A773FF00A874FF00A875FF00A875FF
          00A976FF00A976FF00AA77FF00AA78FF00AA78FF00AB79FF00AB7AFF00AC7AFF
          00AC7BFF00AC7CFF00AD7CFF00AD7DFF00AE7DFF00AE7EFF00AF7FFF00AF7FFF
          00AF80FF00B081FF00B081FF00B182FF00B183FF00B183FF00B284FF00B284FF
          00B385FF00B386FF00B387FF00B487FF00B488FF00B589FF00B589FF00B68AFF
          00B68BFF00B78BFF00B78CFF00B78DFF00B88EFF00B88EFF00B98FFF00B98FFF
          00B990FF00BA91FF00BA91FF00BB92FF00BB93FF00BB93FF05604BB70000005F
          0000004100000027000000150003030800010102000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000604020007040800000015000000280000004201573AB315A26AFF
          6BC4A1FF0C9F65FF009A5EFF009B5EFF009B5FFF009B5FFF009C60FF009C60FF
          009C61FF009C61FF009D62FF009D62FF009D63FF009E63FF009E64FF009E64FF
          009F65FF009F65FF009F66FF00A067FF00A067FF00A068FF00A168FF00A168FF
          00A269FF00A26AFF00A26AFF00A26BFF00A26CFF00A26BFF00A26CFF00A16CFF
          00A16CFF00A26CFF00A26DFF00A36EFF00A46FFF00A470FF00A671FF00A672FF
          00A773FF00A873FF00A874FF00A874FF00A975FF00A976FF00AA76FF00AA77FF
          00AA78FF00AB78FF00AB79FF00AC79FF00AC7AFF00AC7BFF00AD7BFF00AD7CFF
          00AE7DFF00AE7DFF00AE7EFF00AF7FFF00AF7FFF00B080FF00B080FF00B081FF
          00B182FF00B182FF00B283FF00B284FF00B284FF00B385FF00B385FF00B486FF
          00B487FF00B488FF00B588FF00B589FF00B68AFF00B68AFF00B78BFF00B78CFF
          00B88CFF00B88DFF00B88EFF00B98FFF00B98FFF00BA90FF00BA90FF00BA91FF
          00BB92FF00BB92FF00BC93FF00BC94FF00BC94FF00BD95FF01B891FB031E1783
          00000053000000360000001F0000000E00030205000000010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00020101000C08050000000E0000001E00000036011B156D00975CFC5CBF98FF
          2FAE7CFF009C5FFF009C60FF009C60FF009D61FF009D61FF009D62FF009D62FF
          009E62FF009E63FF009E63FF009F64FF009F65FF009F65FF00A066FF00A066FF
          00A067FF00A167FF00A168FF00A168FF00A269FF00A269FF00A26AFF00A36BFF
          00A36BFF00A36CFF00A36CFF00A36CFF00A36CFF00A26CFF00A06BFF009F6BFF
          009E6AFF009E6BFF009F6CFF00A06DFF00A26EFF00A470FF00A672FF00A773FF
          00A874FF00A975FF00AA76FF00AA76FF00AA77FF00AB77FF00AB78FF00AC79FF
          00AC79FF00AC7AFF00AD7BFF00AD7BFF00AE7CFF00AE7CFF00AE7DFF00AF7EFF
          00AF7EFF00B07FFF00B080FF00B080FF00B181FF00B181FF00B182FF00B283FF
          00B283FF00B384FF00B385FF00B486FF00B486FF00B486FF00B587FF00B588FF
          00B589FF00B689FF00B68AFF00B78BFF00B78BFF00B88CFF00B88DFF00B98DFF
          00B98EFF00B98FFF00BA90FF00BA90FF00BA90FF00BB91FF00BB92FF00BC93FF
          00BC93FF00BD94FF00BD95FF00BD95FF00BE96FF00BE96FF00BE97FF04896DD6
          00000064000000460000002B0000001600010109000201020000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0006040200080509000000160000002A0000004501744BD129AC79FF5ABF98FF
          009C60FF009C60FF009D61FF009D61FF009D61FF009E62FF009E63FF009E63FF
          009F64FF009F64FF009F65FF00A065FF00A066FF00A066FF00A167FF00A167FF
          00A168FF00A168FF00A269FF00A26AFF00A36AFF00A36BFF00A36BFF00A46CFF
          00A46CFF00A46DFF00A46DFF00A36CFF00A16CFF009F6AFF009C69FF009967FF
          009867FF009766FF009868FF009A69FF009E6CFF00A16EFF00A471FF00A774FF
          00A975FF00AA76FF00AA77FF00AB77FF00AB78FF00AB78FF00AC79FF00AC7AFF
          00AD7AFF00AD7BFF00AD7CFF00AE7CFF00AE7DFF00AF7DFF00AF7EFF00AF7FFF
          00B07FFF00B080FF00B081FF00B181FF00B182FF00B282FF00B283FF00B284FF
          00B384FF00B385FF00B486FF00B486FF00B487FF00B587FF00B588FF00B589FF
          00B68AFF00B68AFF00B78BFF00B88CFF00B88CFF00B98DFF00B98EFF00B98FFF
          00BA8FFF00BA90FF00BA90FF00BB91FF00BB92FF00BC92FF00BC93FF00BC94FF
          00BD94FF00BD95FF00BE95FF00BE96FF00BE97FF00BF97FF00BF98FF00BF99FF
          043A2E990000005700000039000000200000000F000303050000000100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000D08050000000E0000001F00000037012F217F049E62FE67C5A0FF18A770FF
          009E61FF009E62FF009E62FF009F62FF009F63FF009F63FF00A064FF00A064FF
          00A065FF00A165FF00A166FF00A167FF00A167FF00A267FF00A268FF00A268FF
          00A369FF00A36AFF00A46AFF00A46BFF00A46BFF00A46CFF00A56CFF00A56DFF
          00A56DFF00A56EFF00A46DFF00A26CFF009E6AFF009A67FF009665FF019364FF
          3CAA86FF71C1A8FF60BA9EFF139B70FF009768FF009C6BFF00A16FFF00A672FF
          00A975FF00AB77FF00AC78FF00AC79FF00AD79FF00AD7AFF00AD7AFF00AE7BFF
          00AE7CFF00AF7CFF00AF7DFF00AF7EFF00B07EFF00B07FFF00B07FFF00B180FF
          00B181FF00B281FF00B282FF00B283FF00B383FF00B384FF00B384FF00B485FF
          00B486FF00B587FF00B587FF00B587FF00B688FF00B689FF00B78AFF00B78AFF
          00B78BFF00B88CFF00B98CFF00B98DFF00B98EFF00BA8EFF00BA8FFF00BB90FF
          00BB91FF00BB91FF00BC91FF00BC92FF00BD93FF00BD94FF00BD94FF00BE95FF
          00BE95FF00BF96FF00BF97FF00BF97FF00C098FF00C099FF00C099FF00C19AFF
          05A483E700000067000000480000002C00000017000101090001010200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050302
          00080508000000150000002A00000045018153DB35B382FF4ABB8FFF009F63FF
          009F63FF00A063FF00A064FF00A064FF00A165FF00A165FF00A166FF00A266FF
          00A267FF00A267FF00A268FF00A368FF00A369FF00A469FF00A46AFF00A46BFF
          00A46BFF00A56BFF00A56CFF00A56CFF00A66DFF00A66EFF00A66EFF00A66FFF
          00A66FFF00A56EFF00A36DFF009F6BFF009A68FF009464FF52B394FFCBE8DFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F9F7FF54B597FF009667FF009D6DFF00A371FF
          00A875FF00AB77FF00AD79FF00AE7AFF00AE7BFF00AF7CFF00AF7CFF00AF7DFF
          00B07DFF00B07EFF00B07FFF00B17FFF00B180FF00B280FF00B281FF00B282FF
          00B382FF00B383FF00B384FF00B484FF00B485FF00B585FF00B586FF00B587FF
          00B688FF00B688FF00B689FF00B789FF00B78AFF00B88BFF00B88BFF00B88CFF
          00B98DFF00BA8DFF00BA8EFF00BA8FFF00BB8FFF00BB90FF00BC91FF00BC91FF
          00BC92FF00BD92FF00BD93FF00BE94FF00BE95FF00BE95FF00BF96FF00BF96FF
          00BF97FF00C098FF00C098FF00C199FF00C19AFF00C19AFF00C29BFF00C29BFF
          00C29CFF054839A20000005700000039000000200000000E0005040500000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000B0704
          0000000D0000001E000000360132238106A266FF65C6A1FF12A76EFF00A163FF
          00A164FF00A164FF00A265FF00A266FF00A266FF00A366FF00A367FF00A367FF
          00A368FF00A468FF00A469FF00A56AFF00A56AFF00A56AFF00A56BFF00A66BFF
          00A66CFF00A66DFF00A76DFF00A76EFF00A76EFF00A86FFF00A86FFF00A76FFF
          00A66FFF00A46DFF00A06BFF009A68FF009363FF5BB599FFFDFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF5BB79BFF009668FF009E6EFF
          00A472FF00A976FF00AD79FF00AE7CFF00B07CFF00B07DFF00B17DFF00B17EFF
          00B17EFF00B27FFF00B280FF00B281FF00B381FF00B381FF00B382FF00B483FF
          00B483FF00B584FF00B585FF00B585FF00B686FF00B686FF00B687FF00B788FF
          00B789FF00B789FF00B889FF00B88AFF00B98BFF00B98CFF00B98CFF00BA8DFF
          00BB8EFF00BB8EFF00BB8FFF00BC90FF00BC91FF00BD91FF00BD91FF00BD92FF
          00BE93FF00BE94FF00BE94FF00BF95FF00BF96FF00C096FF00C097FF00C097FF
          00C198FF00C199FF00C199FF00C29AFF00C29AFF00C39BFF00C39CFF00C39CFF
          00C49DFF04AA89EB00010167000000470000002A000000150003030800010002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000003020100070407
          000000130000002700000043017F53D634B483FF45BB8EFF00A264FF00A265FF
          00A265FF00A366FF00A366FF00A367FF00A367FF00A467FF00A468FF00A469FF
          00A569FF00A56AFF00A56AFF00A66BFF00A66BFF00A66CFF00A76CFF00A76DFF
          00A76DFF00A76EFF00A86FFF00A86FFF00A86FFF00A870FF00A870FF00A76FFF
          00A56EFF00A06BFF009B68FF009363FF5AB598FFFCFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF5BB79BFF009669FF
          009F6FFF00A574FF00AA79FF00AE7BFF00B07DFF00B17EFF00B27EFF00B27FFF
          00B280FF00B380FF00B381FF00B382FF00B482FF00B483FF00B483FF00B584FF
          00B585FF00B685FF00B686FF00B686FF00B787FF00B788FF00B889FF00B889FF
          00B88AFF00B98AFF00B98BFF00BA8CFF00BA8CFF00BA8DFF00BB8EFF00BB8EFF
          00BC8FFF00BC90FF00BC90FF00BD91FF00BD92FF00BE92FF00BE93FF00BE93FF
          00BF94FF00BF95FF00C096FF00C096FF00C097FF00C197FF00C198FF00C299FF
          00C299FF00C29AFF00C39AFF00C39BFF00C39CFF00C49CFF00C49DFF00C49EFF
          00C59EFF00C59EFF0543369D00000054000000360000001E0000000D00040304
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000805030004030B
          0000001B0000003201281D7202A366FE62C6A0FF14AA72FF00A366FF00A467FF
          00A467FF00A467FF00A468FF00A568FF00A569FF00A569FF00A66AFF00A66BFF
          00A66BFF00A76BFF00A76CFF00A76CFF00A86DFF00A86EFF00A86EFF00A86EFF
          00A96FFF00A970FF00A970FF00AA71FF00AA71FF00AA71FF00A870FF00A66FFF
          00A26DFF009B69FF009465FF5AB598FFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF5BB89DFF
          00986BFF00A172FF00A777FF00AC7BFF00B07DFF00B27FFF00B280FF00B381FF
          00B481FF00B482FF00B583FF00B584FF00B584FF00B684FF00B685FF00B686FF
          00B786FF00B787FF00B788FF00B888FF00B889FF00B98AFF00B98AFF00B98BFF
          00BA8BFF00BA8CFF00BB8DFF00BB8DFF00BB8EFF00BC8FFF00BC8FFF00BD90FF
          00BD91FF00BD91FF00BE92FF00BE93FF00BF93FF00BF94FF00BF94FF00C095FF
          00C096FF00C196FF00C197FF00C198FF00C298FF00C299FF00C29AFF00C39AFF
          00C39AFF00C39BFF00C49CFF00C49DFF00C59DFF00C59EFF00C59EFF00C69FFF
          00C69FFF00C6A0FF059F80E00000006200000042000000270000001300020206
          0000000100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000009060500000010
          000000230000003D016D48BF28B27FFF4EC096FF00A567FF00A568FF00A568FF
          00A669FF00A669FF00A66AFF00A66AFF00A76BFF00A76BFF00A76CFF00A86CFF
          00A86DFF00A86DFF00A86EFF00A96EFF00A96FFF00A96FFF00AA70FF00AA70FF
          00AB71FF00AB71FF00AB72FF00AB72FF00AB73FF00A972FF00A771FF00A36EFF
          009C6AFF009566FF5AB699FFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF
          5BB99EFF009A6DFF00A273FF00A979FF00AE7DFF00B180FF00B481FF00B482FF
          00B583FF00B684FF00B685FF00B685FF00B786FF00B786FF00B787FF00B887FF
          00B888FF00B889FF00B989FF00B98AFF00BA8BFF00BA8BFF00BA8CFF00BB8CFF
          00BB8DFF00BC8EFF00BC8EFF00BC8FFF00BD90FF00BD90FF00BE91FF00BE92FF
          00BE92FF00BF93FF00BF94FF00C094FF00C095FF00C095FF00C196FF00C197FF
          00C297FF00C298FF00C299FF00C399FF00C39AFF00C39AFF00C49BFF00C49BFF
          00C49CFF00C59DFF00C59EFF00C59EFF00C69EFF00C69FFF00C6A0FF00C7A0FF
          00C7A1FF00C7A1FF00C7A2FF052E24890000004F000000310000001A0002010B
          0001010200000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000503010008050800000016
          0000002C000F0B52009F64F952C298FF1EB07AFF00A668FF00A769FF00A76AFF
          00A76AFF00A76AFF00A86BFF00A86BFF00A86CFF00A96CFF00A96DFF00A96DFF
          00A96EFF00AA6EFF00AA6FFF00AB6FFF00AB70FF00AB70FF00AB71FF00AC71FF
          00AC72FF00AC73FF00AC73FF00AC73FF00AA72FF00A871FF00A36FFF009E6AFF
          009666FF5AB799FFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFDFDFF5AB99EFF009B6FFF00A475FF00AB7BFF00B07EFF00B381FF00B583FF
          00B684FF00B785FF00B886FF00B886FF00B886FF00B987FF00B988FF00B989FF
          00BA89FF00BA89FF00BA8AFF00BB8BFF00BB8CFF00BB8CFF00BC8DFF00BC8DFF
          00BD8EFF00BD8FFF00BD8FFF00BE90FF00BE91FF00BF91FF00BF92FF00BF93FF
          00C093FF00C094FF00C194FF00C195FF00C196FF00C297FF00C297FF00C297FF
          00C398FF00C399FF00C39AFF00C49AFF00C49AFF00C49BFF00C59CFF00C59CFF
          00C69DFF00C69EFF00C69EFF00C79FFF00C79FFF00C7A0FF00C8A1FF00C8A1FF
          00C8A2FF01C9A3FF01C9A3FF047C64C50000005B0000003B000000210000000F
          0005040400000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000906030000000C0000001D
          0000003501462F9711AD72FF5AC69EFF00A869FF00A86AFF00A86AFF00A96BFF
          00A96BFF00A96BFF00A96CFF00AA6DFF00AA6DFF00AA6EFF00AB6EFF00AB6EFF
          00AB6FFF00AC70FF00AC70FF00AC71FF00AC71FF00AD71FF00AD72FF00AD73FF
          00AE73FF00AD74FF00AD74FF00AC73FF00A972FF00A56FFF009F6BFF009767FF
          5AB79AFFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCFDFDFF5ABA9FFF009D70FF00A577FF00AC7CFF00B280FF00B583FF
          00B785FF00B886FF00B987FF00B987FF00BA88FF00BA88FF00BA89FF00BB8AFF
          00BB8AFF00BB8BFF00BC8CFF00BC8CFF00BC8DFF00BD8EFF00BD8EFF00BE8FFF
          00BE8FFF00BE90FF00BF91FF00BF91FF00C092FF00C093FF00C093FF00C194FF
          00C194FF00C295FF00C296FF00C296FF00C397FF00C398FF00C398FF00C499FF
          00C49AFF00C49AFF00C59BFF00C59BFF00C59CFF00C69CFF00C69DFF00C69EFF
          00C79EFF00C79FFF00C79FFF00C8A0FF00C8A1FF00C8A1FF00C9A2FF00C9A2FF
          00CAA3FF01CAA4FF03CBA5FF03C29DF80108066B000000460000002A00000015
          0002020700000001000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000A06050000001000000024
          0000003F018A5BDA37BB8BFF32BA88FF00A96BFF00AA6BFF00AA6CFF00AA6CFF
          00AA6DFF00AB6DFF00AB6EFF00AB6EFF00AC6FFF00AC6FFF00AC70FF00AC70FF
          00AD71FF00AD71FF00AD72FF00AE72FF00AE73FF00AE74FF00AF74FF00AF74FF
          00AF75FF00AF75FF00AD74FF00AA73FF00A670FF00A06CFF009867FF5AB89AFF
          FCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFDFDFF5ABCA0FF009F73FF00A779FF00AE7EFF00B382FF
          00B785FF00B987FF00BA88FF00BB89FF00BB89FF00BB8AFF00BC8BFF00BC8CFF
          00BC8CFF00BD8DFF00BD8DFF00BD8EFF00BE8FFF00BE8FFF00BF90FF00BF90FF
          00BF91FF00C092FF00C092FF00C193FF00C194FF00C194FF00C295FF00C295FF
          00C396FF00C397FF00C397FF00C498FF00C498FF00C499FF00C59AFF00C59BFF
          00C59BFF00C69BFF00C69CFF00C69DFF00C79DFF00C79EFF00C79EFF00C89FFF
          00C8A0FF00C8A0FF00C9A1FF00C9A1FF00C9A2FF00CAA3FF00CAA3FF00CBA4FF
          00CBA4FF00CBA5FF05CCA7FF00CCA7FF064C3DA000000051000000320000001B
          0002020B00010102000000000000000000000000000000000000000000000000
          000000000000000000000000000000000003020100080508000000160000002C
          011B155C00A76BFD59C79FFF10AF75FF00AA6DFF00AA6DFF00AB6EFF00AB6EFF
          00AB6FFF00AB6FFF00AC70FF00AC70FF00AC71FF00AD71FF00AD72FF00AD72FF
          00AD73FF00AE73FF00AE74FF00AE74FF00AF75FF00AF75FF00AF76FF00AF76FF
          00AF76FF00AE75FF00AB74FF00A771FF00A06EFF009969FF5AB89BFFFCFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF5ABCA1FF00A075FF00A87BFF00B081FF
          00B485FF00B888FF00BA89FF00BB8AFF00BC8BFF00BC8CFF00BC8DFF00BD8DFF
          00BD8EFF00BD8EFF00BE8FFF00BE90FF00BE90FF00BF91FF00BF91FF00BF92FF
          00C093FF00C193FF00C194FF00C195FF00C295FF00C296FF00C296FF00C397FF
          00C398FF00C398FF00C499FF00C499FF00C49AFF00C59BFF00C59CFF00C59CFF
          00C69CFF00C69DFF00C69EFF00C79EFF00C79FFF00C89FFF00C8A0FF00C8A1FF
          00C9A1FF00C9A2FF00C9A2FF00CAA3FF00CAA4FF00CAA4FF00CBA5FF00CBA5FF
          00CBA6FF00CBA7FF05CDA8FF04CDA9FF069176D10000005C0000003B00000021
          0000000F00030304000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000805020005030B0000001B00000033
          014B329A15B279FF4FC59AFF00AC6EFF00AC6EFF00AC6EFF00AC6FFF00AD6FFF
          00AD70FF00AD70FF00AD71FF00AE71FF00AE72FF00AE72FF00AE73FF00AF73FF
          00AF74FF00AF74FF00B075FF00B075FF00B076FF00B176FF00B177FF00B077FF
          00AF76FF00AC75FF00A872FF00A26EFF009A69FF5AB99BFFFCFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFF5BBDA3FF00A176FF00AA7CFF
          00B282FF00B686FF00BA89FF00BC8BFF00BD8CFF00BD8DFF00BE8EFF00BE8EFF
          00BE8FFF00BF8FFF00BF90FF00BF90FF00C091FF00C092FF00C092FF00C193FF
          00C294FF00C294FF00C295FF00C396FF00C396FF00C397FF00C497FF00C498FF
          00C499FF00C599FF00C59AFF00C59AFF00C69BFF00C69CFF00C69CFF00C79DFF
          00C79DFF00C79EFF00C89EFF00C89FFF00C8A0FF00C9A0FF00C9A1FF00C9A1FF
          00CAA2FF00CAA3FF00CAA3FF00CBA4FF00CBA4FF00CBA5FF00CCA6FF00CCA6FF
          00CCA7FF00CDA7FF02CEA9FF08CFABFF02C8A4FA0108066A0000004400000028
          0000001300010106000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000D08040000000E000000210000003B
          02885CD231BC8AFF2FBC8AFF00AD6FFF00AD6FFF00AE6FFF00AE70FF00AE71FF
          00AE71FF00AF72FF00AF72FF00AF72FF00B073FF00B074FF00B074FF00B074FF
          00B175FF00B175FF00B176FF00B277FF00B277FF00B277FF00B178FF00B077FF
          00AD76FF00A973FF00A36FFF009B6AFF5AB99BFFFCFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BBEA4FF00A377FF
          00AB7EFF00B384FF00B888FF00BB8BFF00BD8DFF00BF8EFF00BF8FFF00C08FFF
          00C090FF00C091FF00C091FF00C192FF00C192FF00C193FF00C294FF00C394FF
          00C395FF00C396FF00C496FF00C497FF00C497FF00C598FF00C599FF00C599FF
          00C69AFF00C69AFF00C69BFF00C79CFF00C79CFF00C79DFF00C89DFF00C89EFF
          00C89FFF00C99FFF00C9A0FF00C9A0FF00CAA1FF00CAA1FF00CAA2FF00CBA3FF
          00CBA3FF00CBA4FF00CBA4FF00CCA5FF00CCA6FF00CCA6FF00CDA7FF00CDA7FF
          00CDA8FF00CEA8FF00CEA9FF0CD1ADFF01CFAAFF064739980000004D0000002F
          0000001800030309000000010000000000000000000000000000000000000000
          00000000000000000000000000000000000C0806000000130000002700090748
          00A66BF84BC69AFF14B57BFF00AF70FF00AF71FF00AF71FF00AF72FF00B072FF
          00B073FF00B073FF00B174FF00B174FF00B175FF00B175FF00B276FF00B276FF
          00B277FF00B277FF00B378FF00B378FF00B379FF00B379FF00B178FF00AE77FF
          00AA74FF00A470FF009C6BFF5ABA9CFFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EAF6F2FF57B99DFFEAF6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BBFA5FF
          00A479FF00AD80FF00B486FF00B98AFF00BD8DFF00BF8FFF00C190FF00C191FF
          00C192FF00C192FF00C293FF00C293FF00C294FF00C395FF00C495FF00C496FF
          00C497FF00C597FF00C598FF00C598FF00C599FF00C69AFF00C69AFF00C79BFF
          00C79BFF00C79CFF00C89DFF00C89DFF00C89EFF00C99EFF00C99FFF00C99FFF
          00C9A0FF00CAA1FF00CAA1FF00CAA2FF00CBA2FF00CBA3FF00CBA4FF00CCA4FF
          00CCA4FF00CCA5FF00CDA6FF00CDA7FF00CDA7FF00CEA7FF00CEA8FF00CEA9FF
          00CFA9FF00CFAAFF00CFAAFF0AD2AEFF05D1ADFF047963BF0000005600000036
          0000001D0000000C000101020000000000000000000000000000000000000000
          0000000000000000000000000003020100090608000000160000002D0237297B
          06B274FF55CAA1FF01B172FF00B072FF00B173FF00B173FF00B174FF00B174FF
          00B275FF00B275FF00B275FF00B276FF00B377FF00B377FF00B377FF00B378FF
          00B479FF00B479FF00B47AFF00B47AFF00B47AFF00B279FF00B078FF00AB75FF
          00A571FF009D6CFF5ABB9DFFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6F2FF
          2CA884FF00966BFF2CA885FFEAF6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF
          5BC0A6FF00A67BFF00AE82FF00B688FF00BB8CFF00BF8FFF00C191FF00C292FF
          00C293FF00C394FF00C394FF00C395FF00C496FF00C596FF00C597FF00C598FF
          00C698FF00C699FF00C699FF00C69AFF00C79BFF00C79BFF00C89CFF00C89CFF
          00C89DFF00C99DFF00C99EFF00C99FFF00C99FFF00CAA0FF00CAA0FF00CAA1FF
          00CBA2FF00CBA2FF00CBA3FF00CCA3FF00CCA4FF00CCA4FF00CDA5FF00CDA5FF
          00CDA6FF00CEA7FF00CEA7FF00CEA8FF00CFA8FF00CFA9FF00CFA9FF00CFAAFF
          00D0ABFF00D0ABFF00D0ABFF06D2AEFF0BD3B0FF07B997EA0000005E0000003D
          000000220000000F000302040000000000000000000000000000000000000000
          000000000000000000000000000604020005030A0000001B0000003300573AA1
          1BB981FF3EC495FF00B273FF00B273FF00B274FF00B274FF00B375FF00B375FF
          00B376FF00B376FF00B477FF00B477FF00B478FF00B578FF00B579FF00B579FF
          00B57AFF00B67AFF00B67BFF00B57BFF00B47AFF00B178FF00AD76FF00A671FF
          009E6DFF5ABB9DFFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6F3FF2CAA87FF
          009E70FF00A073FF009E72FF2CAB88FFEAF6F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFEFDFF5BC1A7FF00A77DFF00B083FF00B88AFF00BD8EFF00C091FF00C293FF
          00C494FF00C495FF00C495FF00C596FF00C697FF00C697FF00C698FF00C799FF
          00C799FF00C79AFF00C79AFF00C89BFF00C89BFF00C89CFF00C99DFF00C99DFF
          00C99EFF00CA9EFF00CA9FFF00CAA0FF00CBA0FF00CBA1FF00CBA1FF00CCA2FF
          00CCA2FF00CCA3FF00CDA4FF00CDA4FF00CDA4FF00CDA5FF00CEA6FF00CEA6FF
          00CEA7FF00CFA7FF00CFA8FF00CFA9FF00D0A9FF00D0AAFF00D0AAFF00D1ABFF
          00D1ABFF00D1ACFF00D1ACFF03D3AEFF11D5B3FF01D0ACFD03100D6D00000043
          0000002700000013000302060000000000000000000000000000000000000000
          000000000000000000000000000A06020000000D0000001F00000039028E61D2
          2FC18DFF28BF8AFF00B375FF00B375FF00B475FF00B476FF00B477FF00B577FF
          00B577FF00B578FF00B578FF00B679FF00B679FF00B67AFF00B67AFF00B77BFF
          00B77BFF00B77CFF00B67CFF00B57BFF00B37AFF00AE77FF00A773FF009F6DFF
          5ABC9EFFFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6F3FF2CAD89FF00A475FF
          00AA7AFF00AC7CFF00AA7BFF00A477FF2CAF8BFFEAF6F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCFEFDFF5BC2A8FF00A97FFF00B285FF00B98CFF00BF90FF00C293FF
          00C495FF00C596FF00C697FF00C798FF00C798FF00C799FF00C799FF00C89AFF
          00C89BFF00C89BFF00C99CFF00C99CFF00C99DFF00CA9EFF00CA9EFF00CA9FFF
          00CB9FFF00CBA0FF00CBA0FF00CCA1FF00CCA2FF00CCA2FF00CCA2FF00CDA3FF
          00CDA4FF00CDA4FF00CEA5FF00CEA5FF00CEA6FF00CFA7FF00CFA7FF00CFA8FF
          00D0A8FF00D0A9FF00D0A9FF00D0AAFF00D1AAFF00D1ABFF00D1ABFF00D2ACFF
          00D2ADFF00D2ADFF00D2AEFF00D3AEFF15D7B5FF02D3B0FF074A3C970000004A
          0000002C00000016000201070000000000000000000000000000000000000000
          000000000000000000000000000E0A040000000F000000230000003D01A66DF2
          3FC697FF16BB81FF00B576FF00B576FF00B577FF00B677FF00B678FF00B678FF
          00B679FF00B679FF00B77AFF00B77AFF00B77AFF00B87BFF00B87CFF00B87CFF
          00B87CFF00B87DFF00B77CFF00B47BFF00B078FF00A974FF00A16EFF5ABD9EFF
          FCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6F3FF2CAE89FF00A677FF00AE7CFF
          00B381FF00B682FF00B482FF00AF7EFF00A879FF2CB08CFFEAF6F3FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFEFDFF5BC3A9FF00AA80FF00B387FF00BB8DFF00C091FF
          00C395FF00C697FF00C898FF00C899FF00C89AFF00C89AFF00C99BFF00C99BFF
          00C99CFF00CA9CFF00CA9DFF00CA9EFF00CB9EFF00CB9FFF00CB9FFF00CCA0FF
          00CCA1FF00CCA1FF00CCA2FF00CDA2FF00CDA3FF00CDA3FF00CEA4FF00CEA5FF
          00CEA5FF00CFA5FF00CFA6FF00CFA7FF00CFA7FF00D0A8FF00D0A8FF00D0A9FF
          00D1A9FF00D1AAFF00D1ABFF00D1ABFF00D2ABFF00D2ACFF00D2ADFF00D3ADFF
          00D3AEFF00D3AEFF00D3AFFF00D4AFFF12D7B5FF08D6B3FF026654B100000050
          0000003100000019000403090000000100000000000000000000000000000000
          000000000000000000000000000C08050000001200000027011C165300B576FE
          4BCB9FFF07B87BFF00B678FF00B678FF00B779FF00B779FF00B779FF00B87AFF
          00B87BFF00B87BFF00B87BFF00B97CFF00B97DFF00B97DFF00B97DFF00BA7EFF
          00BA7FFF00B97EFF00B77DFF00B37AFF00AC76FF00A470FF5ABFA0FFFCFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEAF6F3FF2CAF8AFF00A878FF00B07FFF00B684FF
          00BB87FF00BD88FF00BB88FF00B886FF00B282FF00AA7CFF2CB18EFFEAF7F3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BC4AAFF00AC82FF00B489FF00BC8FFF
          00C294FF00C697FF00C899FF00C99AFF00C99BFF00CA9CFF00CA9CFF00CA9DFF
          00CB9DFF00CB9EFF00CB9FFF00CC9FFF00CCA0FF00CCA0FF00CCA1FF00CDA1FF
          00CDA2FF00CDA3FF00CEA3FF00CEA3FF00CEA4FF00CFA5FF00CFA5FF00CFA6FF
          00CFA6FF00D0A7FF00D0A7FF00D0A8FF00D1A9FF00D1A9FF00D1AAFF00D1AAFF
          00D2ABFF00D2ABFF00D2ACFF00D3ACFF00D3ADFF00D3ADFF00D4AEFF00D4AFFF
          00D4AFFF00D4AFFF00D5B0FF00D5B1FF0FD8B5FF0ED8B6FF079A7ECF00000056
          000000360000001D0000000C0000000200000000000000000000000000000000
          00000000000000000000000000080506000000150000002A023C2C7B07B97CFF
          48CC9FFF00B879FF00B879FF00B87AFF00B87AFF00B97BFF00B97BFF00B97CFF
          00B97CFF00BA7DFF00BA7DFF00BA7EFF00BB7EFF00BB7FFF00BB7FFF00BB80FF
          00BB7FFF00BA7FFF00B77DFF00B17AFF00A975FF50BD9CFFFCFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFEAF6F3FF2CB08BFF00A979FF00B180FF00B885FF00BD88FF
          00C08BFF00C08CFF00C08CFF00BE8BFF00BA88FF00B384FF00AB7DFF2CB28FFF
          EAF7F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BC4ABFF00AD84FF00B68BFF
          00BE91FF00C496FF00C79AFF00C99BFF00CB9CFF00CB9DFF00CB9EFF00CC9EFF
          00CC9FFF00CCA0FF00CDA0FF00CDA1FF00CDA1FF00CDA2FF00CEA2FF00CEA3FF
          00CEA4FF00CFA4FF00CFA4FF00CFA5FF00CFA6FF00D0A6FF00D0A7FF00D0A7FF
          00D1A8FF00D1A8FF00D1A9FF00D1A9FF00D2AAFF00D2ABFF00D2ABFF00D3ABFF
          00D3ACFF00D3ADFF00D4ADFF00D4AEFF00D4AEFF00D4AFFF00D5AFFF00D5B0FF
          00D5B0FF00D5B1FF00D6B1FF00D6B2FF0BD8B6FF14D9B9FF07C09FEB0000005B
          0000003A000000200000000D0001010200000000000000000000000000000000
          000000000000000000000000000A0708000000170000002D014D349312BE83FF
          3BC998FF00B97AFF00BA7BFF00BA7BFF00BA7BFF00BA7CFF00BA7CFF00BB7DFF
          00BB7DFF00BB7EFF00BB7EFF00BC7FFF00BC7FFF00BC80FF00BC80FF00BD80FF
          00BD81FF00BB80FF00B67DFF00AF79FF0BA979FFEBF7F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEAF6F3FF2CB18BFF00AA7AFF00B280FF00BA85FF00BE89FF00C18BFF
          00C28DFF00C38EFF00C38EFF00C28EFF00C08DFF00BC8AFF00B585FF00AC7FFF
          2CB491FFEAF7F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BC5ACFF00AF85FF
          00B88CFF00C093FF00C597FF00C99BFF00CB9DFF00CC9EFF00CD9FFF00CD9FFF
          00CDA0FF00CDA0FF00CEA1FF00CEA2FF00CEA2FF00CFA3FF00CFA3FF00CFA4FF
          00CFA4FF00D0A5FF00D0A5FF00D0A6FF00D1A6FF00D1A7FF00D1A8FF00D1A8FF
          00D2A9FF00D2A9FF00D2A9FF00D3AAFF00D3ABFF00D3ABFF00D3ACFF00D4ACFF
          00D4ADFF00D4ADFF00D5AEFF00D5AEFF00D5AFFF00D5AFFF00D6B0FF00D6B0FF
          00D6B1FF00D6B1FF00D7B2FF00D7B3FF07D8B5FF1BDBBCFF03D1AEFA00000060
          0000003D000000220000000F0002020400000000000000000000000000000000
          000000000000000000030201000D09090000001900000030016443A51CC289FF
          2FC794FF00BB7CFF00BB7CFF00BB7DFF00BB7DFF00BC7DFF00BC7EFF00BC7FFF
          00BC7FFF00BD7FFF00BD80FF00BD81FF00BD81FF00BE81FF00BE82FF00BE82FF
          00BE82FF00BC81FF00B67EFF00AF79FF48BE9BFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EAF7F3FF2CB28CFF00AA7BFF00B381FF00BB86FF00BF8BFF00C28DFF00C48EFF
          00C58FFF00C590FF00C590FF00C590FF00C490FF00C18FFF00BD8BFF00B787FF
          00AE81FF2CB492FFEAF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF5BC6ADFF
          00B087FF00B98EFF00C295FF00C79AFF00CA9DFF00CD9FFF00CEA0FF00CEA1FF
          00CEA1FF00CFA2FF00CFA3FF00CFA3FF00D0A4FF00D0A4FF00D0A4FF00D0A5FF
          00D1A6FF00D1A6FF00D1A7FF00D1A7FF00D2A8FF00D2A8FF00D2A9FF00D3A9FF
          00D3AAFF00D3AAFF00D4ABFF00D4ACFF00D4ACFF00D4ADFF00D5ADFF00D5AEFF
          00D5AEFF00D5AFFF00D6AFFF00D6B0FF00D6B0FF00D6B1FF00D7B1FF00D7B2FF
          00D7B2FF00D7B3FF00D8B3FF00D8B4FF03D9B5FF22DEBFFF00D9B5FF051C1771
          0000004100000025000000110004030400000000000000000000000000000000
          000000000000000000050301000F0A0A0000001B00000033028A61C124C58FFF
          26C791FF00BC7EFF00BD7EFF00BD7EFF00BD7FFF00BD80FF00BE80FF00BE80FF
          00BE81FF00BE81FF00BF82FF00BF82FF00BF83FF00BF83FF00BF84FF00C084FF
          00C084FF00BD83FF00B880FF00B07AFF53C3A1FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7F3FF
          2CB28DFF00AB7BFF00B582FF00BC87FF00C08CFF00C38EFF00C58FFF00C690FF
          00C691FF00C792FF00C792FF00C793FF00C692FF00C592FF00C391FF00BF8EFF
          00B889FF00AF83FF2CB694FFEAF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFF
          5BC7AEFF00B289FF00BB91FF00C397FF00C89CFF00CC9FFF00CEA1FF00CFA2FF
          00D0A3FF00D0A3FF00D0A4FF00D0A5FF00D1A5FF00D1A5FF00D1A6FF00D2A7FF
          00D2A7FF00D2A8FF00D2A8FF00D3A9FF00D3A9FF00D3AAFF00D3AAFF00D4ABFF
          00D4ABFF00D4ACFF00D5ACFF00D5ADFF00D5AEFF00D5AEFF00D6AFFF00D6AFFF
          00D6AFFF00D6B0FF00D7B1FF00D7B1FF00D7B2FF00D7B2FF00D8B3FF00D8B3FF
          00D8B4FF00D9B4FF00D9B5FF00D9B5FF00D9B5FF26DFC1FF01DAB7FF09413488
          0000004400000027000000120002020500000000000000000000000000000000
          0000000000000000000604020000000B0000001C00000035039A6BD52BC893FF
          22C68FFF05BF82FF02BF80FF00BE80FF00BF80FF00BF81FF00BF81FF00BF82FF
          00C082FF00C082FF00C083FF00C084FF00C084FF00C184FF00C185FF00C185FF
          00C185FF00BF84FF00BA81FF00B27CFF1EB286FFFCFEFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7F3FF2CB38EFF
          00AD7CFF00B683FF00BD88FF00C18CFF00C48EFF00C690FF00C791FF00C792FF
          00C892FF00C893FF00C893FF00C894FF00C994FF00C894FF00C794FF00C592FF
          00C08FFF00B98BFF00B185FF2CB794FFEAF7F4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFEFEFF5BC8AFFF00B28AFF00BC92FF00C498FF00C99DFF00CDA0FF00CFA3FF
          00D1A4FF00D1A5FF00D1A5FF00D2A6FF00D2A6FF00D2A7FF00D2A7FF00D3A8FF
          00D3A8FF00D3A9FF00D3A9FF00D4AAFF00D4ABFF00D4ABFF00D5ABFF00D5ACFF
          00D5ACFF00D5ADFF00D6AEFF00D6AEFF00D6AFFF00D6AFFF00D7B0FF00D7B0FF
          00D7B1FF00D8B1FF00D8B2FF00D8B2FF00D8B3FF00D8B3FF00D9B4FF00D9B4FF
          00D9B5FF00DAB5FF00DAB6FF00DAB6FF00DAB6FF25DFC1FF05DCB9FF08514197
          0000004600000029000000140000000600000000000000000000000000000000
          0000000000000000000805020000000C0000001D0000003602A571E330CB98FF
          1DC78EFF07C184FF07C284FF04C183FF00C082FF00C082FF00C083FF00C183FF
          00C184FF00C184FF00C185FF00C285FF00C286FF00C286FF00C287FF00C387FF
          00C387FF00C186FF00BD84FF00B780FF00AD7AFF93D9C4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7F3FF2CB48EFF00AE7DFF
          00B784FF00BE89FF00C28DFF00C68FFF00C791FF00C892FF00C993FF00C993FF
          00C994FF00C994FF00CA95FF00CA96FF00CA96FF00CA96FF00CA96FF00C996FF
          00C694FF00C191FF00BB8CFF00B286FF2CB896FFEAF7F4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCFEFEFF5BC8B1FF00B48CFF00BD94FF00C59BFF00CBA0FF00CFA2FF
          00D1A5FF00D2A5FF00D3A6FF00D3A7FF00D3A8FF00D3A8FF00D4A9FF00D4A9FF
          00D4AAFF00D4AAFF00D5ABFF00D5ABFF00D5ACFF01D5ADFF01D6ADFF01D6AEFF
          02D7AFFF02D7AFFF03D8B0FF02D8B0FF02D8B0FF02D8B1FF01D8B1FF00D8B1FF
          00D8B2FF00D9B3FF00D9B3FF00D9B3FF00D9B4FF00D9B5FF00DAB5FF00DAB5FF
          00DAB6FF00DAB6FF00DBB7FF00DBB7FF00DBB8FF24E0C2FF09DDBBFF065D4DA2
          000000480000002A000000140000000700000000000000000000000000000000
          0000000000000000000906020000000C0000001E0000003802AD76EC33CD9BFF
          1BC78FFF09C386FF09C387FF09C387FF07C387FF01C284FF00C285FF00C285FF
          00C285FF00C386FF00C386FF00C387FF00C387FF00C488FF00C488FF00C489FF
          00C489FF00C388FF00C087FF00BC84FF00B47FFF04AD7CFFAAE1D1FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7F3FF2CB68FFF00AF7EFF00B885FF
          00BF8AFF00C48FFF00C791FF00C892FF00C993FF00CA94FF00CA94FF00CA95FF
          00CA96FF00CB96FF00CB97FF00CB97FF00CB97FF00CC98FF00CC99FF00CB98FF
          00CA98FF00C896FF00C393FF00BC8EFF00B388FF2CB997FFEAF7F4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFEFEFF5BC9B2FF00B58EFF00BE95FF00C79DFF00CCA2FF
          00D0A4FF00D2A6FF00D4A7FF00D4A8FF00D4A9FF00D4AAFF00D5AAFF02D6ABFF
          04D6ACFF06D7ADFF07D7AEFF08D8AFFF09D8B0FF09D8B1FF09D9B1FF09D9B2FF
          09D9B2FF09D9B3FF09D9B3FF09D9B4FF09D9B4FF09DAB5FF09DAB5FF09DAB6FF
          09DAB6FF07DBB6FF06DBB6FF05DBB6FF03DBB6FF01DAB6FF00DBB6FF00DBB7FF
          00DBB7FF00DBB8FF00DCB8FF00DCB9FF00DCB9FF24E1C3FF0CDFBDFF046555AA
          000000490000002B000000150000000700000000000000000000000000000000
          0000000000000000000A07020000000D0000001F0000003802B179EF34CE9CFF
          1AC890FF0BC589FF0BC689FF0BC689FF0BC68AFF0AC68AFF04C588FF00C486FF
          00C486FF00C487FF00C487FF00C588FF00C588FF00C589FF00C589FF00C68AFF
          00C68AFF00C58AFF00C389FF00C188FF00BB84FF00B57FFF03AE7CFF87D7C0FF
          F8FCFBFFFFFFFFFFFFFFFFFFC7ECE2FF25B88EFF00B280FF00B986FF00C08BFF
          00C58FFF00C891FF00C992FF00CA94FF00CB95FF00CB95FF00CB95FF00CC96FF
          00CC96FF00CC97FF00CC97FF00CC98FF00CD99FF00CD99FF00CD99FF00CD9AFF
          00CD9AFF00CC99FF00C998FF00C495FF00BE90FF00B589FF2CBA98FFEAF7F4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFF5BCAB2FF00B78FFF00C097FF00C89EFF
          00CDA3FF00D2A6FF00D4A8FF01D5A9FF05D6ACFF08D8ADFF0BD8AFFF0BD8AFFF
          0BD8B0FF0BD9B0FF0BD9B1FF0BD9B1FF0BD9B2FF0BDAB2FF0BDAB3FF0BDAB3FF
          0BDAB4FF0BDBB4FF0BDBB5FF0BDBB5FF0BDBB6FF0BDCB6FF0BDCB7FF0BDCB7FF
          0BDCB7FF0BDCB7FF0BDDB8FF0BDDB8FF0BDDB9FF0BDEB9FF0ADEBAFF07DDB9FF
          04DDB9FF01DDB8FF00DDB9FF00DDB9FF00DDBAFF24E2C4FF0FE0BFFF026958AD
          0000004A0000002C000000160000000700000000000000000000000000000000
          0000000000000000000B07020000000D0000001F0000003801B57CF236D09EFF
          1BCA92FF0EC78CFF0EC78CFF0EC78DFF0EC88DFF0EC88EFF0EC88EFF0BC78DFF
          02C689FF00C689FF00C689FF00C689FF00C68AFF00C78BFF00C78BFF00C78BFF
          00C78CFF00C78CFF00C68CFF00C58BFF00C28AFF00BD86FF00B883FF00B37FFF
          06B181FF2CBC93FF21B98FFF00B280FF00B784FF00BC88FF00C28CFF00C690FF
          00C992FF00CA94FF00CC95FF00CC96FF00CC96FF00CC96FF00CD97FF00CD97FF
          00CD98FF00CD99FF00CD99FF00CE9AFF00CE9AFF00CE9AFF00CF9BFF00CF9CFF
          00CF9CFF00CE9CFF00CD9BFF00CB9AFF00C697FF00BF92FF00B68BFF2CBB9AFF
          EAF8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFF5BCBB4FF00B891FF00C199FF
          03CAA1FF08D1A7FF0CD5ACFF0ED7AEFF0ED8B0FF0ED9B1FF0ED9B1FF0ED9B2FF
          0ED9B2FF0EDAB3FF0EDAB3FF0EDAB3FF0EDBB4FF0EDBB5FF0EDBB5FF0EDBB5FF
          0EDBB6FF0EDCB6FF0EDCB6FF0EDCB7FF0EDCB7FF0EDDB8FF0EDDB8FF0EDDB9FF
          0EDDB9FF0EDEBAFF0EDEBAFF0EDEBBFF0EDEBBFF0EDFBCFF0EDFBCFF0EDFBCFF
          0EDFBDFF0EDFBDFF0ADFBDFF06DFBCFF01DEBBFF25E3C5FF11E1C0FF026C5BB0
          0000004A0000002C000000160000000700000000000000000000000000000000
          0000000000000000000B08020000000C0000001E0000003801B87EF435D19FFF
          1CCB94FF11C98EFF11C98FFF11C98FFF11CA8FFF11CA8FFF11CA90FF11CA90FF
          10CB91FF0AC98EFF01C78BFF00C78BFF00C78BFF00C88CFF00C88CFF00C88DFF
          00C88DFF00C98EFF00C88EFF00C78DFF00C68DFF00C48BFF00C089FF00BD88FF
          00BA86FF00BA85FF00BA87FF00BD89FF00C08BFF00C48EFF00C791FF00C993FF
          00CB95FF00CC96FF00CD96FF00CD97FF00CD97FF00CD98FF00CE98FF00CE99FF
          00CE99FF00CE9AFF00CF9AFF00CF9BFF00CF9BFF00CF9CFF00D09DFF00D09DFF
          00D09DFF00D09EFF00D09EFF00CE9DFF00CC9BFF00C798FF00C194FF00B88DFF
          2CBD9BFFEAF8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFF60CCB6FF0DBA97FF
          0FC59FFF10CDA6FF10D3ABFF11D7AFFF11D9B0FF11DAB2FF11DAB3FF11DAB3FF
          11DBB4FF11DBB4FF11DBB4FF11DBB5FF11DCB6FF11DCB6FF11DCB6FF11DCB7FF
          11DDB7FF11DDB8FF11DDB8FF11DDB9FF11DDB9FF11DEBAFF11DEBAFF11DEBBFF
          11DEBBFF11DFBCFF11DFBCFF11DFBCFF11DFBCFF11DFBDFF11E0BDFF11E0BEFF
          11E0BEFF11E0BFFF11E1BFFF11E1C0FF10E1C0FF30E4C8FF14E2C2FF016D5CB0
          0000004A0000002C000000150000000700000000000000000000000000000000
          0000000000000000000B08020000000C0000001E0000003702B67EF133D19FFF
          1FCD96FF13CB91FF13CB91FF13CB92FF13CB92FF13CB93FF13CC93FF13CC94FF
          13CC94FF13CC95FF12CC94FF0BCB91FF02C98EFF00C98EFF00C98EFF00CA8EFF
          00CA8FFF00CA8FFF00CA90FF00CA8FFF00C990FF00C890FF00C68FFF00C68EFF
          00C48DFF00C48DFF00C48EFF00C58FFF00C891FF00CA93FF00CB94FF00CC96FF
          00CD97FF00CE97FF00CE98FF00CE98FF00CF99FF00CF99FF00CF9AFF00CF9AFF
          00CF9BFF00D09BFF00D09CFF00D09CFF00D09DFF00D19EFF00D19EFF00D19EFF
          00D19FFF00D29FFF00D2A0FF00D1A0FF00D09FFF00CE9DFF00C99AFF00C295FF
          00B98FFF2CBD9CFFEAF8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF65CEB9FF
          10BC9AFF11C6A1FF12CFA8FF12D5ADFF13D9B1FF13DAB3FF13DBB4FF13DCB5FF
          13DDB6FF13DDB6FF13DDB7FF13DDB7FF13DEB8FF13DEB8FF13DEB9FF13DEB9FF
          13DEBAFF13DFBAFF13DFBBFF13DFBBFF13DFBBFF13E0BBFF13E0BCFF13E0BCFF
          13E0BDFF13E0BDFF13E0BDFF13E0BEFF13E0BEFF13E1BFFF13E1BFFF13E1C0FF
          13E1C0FF13E1C1FF13E1C1FF13E2C2FF13E2C2FF3AE7CCFF16E2C3FF026C5BAD
          000000490000002B000000150000000700000000000000000000000000000000
          0000000000000000000B08020000000B0000001C0000003502B57EED30D29FFF
          22CF99FF16CD94FF16CD94FF16CD94FF16CE95FF16CE95FF16CE96FF16CE96FF
          16CF97FF16CF97FF16CF98FF16CF98FF15CF98FF0DCE95FF04CC91FF00CB90FF
          00CB91FF00CB91FF00CC92FF00CC92FF00CB92FF00CB92FF00CB92FF00CB92FF
          00CA93FF00CA93FF00CB94FF00CB94FF00CC95FF00CC96FF00CE97FF00CF98FF
          00CF98FF00CF99FF00CF9AFF00D09AFF00D09AFF00D09BFF00D09BFF00D09CFF
          00D19CFF00D19DFF00D19EFF00D19EFF00D29FFF00D29FFF00D29FFF00D2A0FF
          00D3A0FF00D3A1FF00D3A1FF00D3A2FF00D3A2FF00D2A1FF00CFA0FF00CA9DFF
          00C397FF00BA91FF2CBE9EFFEAF8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF
          67CFBAFF13BD9BFF14C7A4FF15D0ABFF15D6B0FF16DAB4FF16DBB6FF16DDB7FF
          16DEB8FF16DEB9FF16DEB9FF16DEBAFF16DFBAFF16DFBAFF16DFBAFF16DFBBFF
          16E0BBFF16E0BCFF16E0BCFF16E0BDFF16E0BDFF16E1BDFF16E1BEFF16E1BEFF
          16E1BFFF16E1BFFF16E2C0FF16E2C0FF16E2C1FF16E2C1FF16E3C2FF16E3C2FF
          16E3C2FF16E3C3FF16E3C3FF16E4C4FF16E4C4FF40E8CFFF14E3C4FF046959AA
          000000470000002A000000140000000600000000000000000000000000000000
          0000000000000000000A0702000B070A0000001B0000003402B17CE72DD29EFF
          26D19CFF19CE96FF19CF96FF19CF97FF19CF97FF19CF98FF19CF98FF19D099FF
          19D099FF19D099FF19D09AFF19D19AFF19D19BFF19D19BFF19D19BFF14D09AFF
          09CF95FF01CD93FF00CD93FF00CD93FF00CE93FF00CE94FF00CE94FF00CD95FF
          00CE95FF00CE96FF00CE96FF00CE96FF00CF97FF00D098FF00D098FF00D099FF
          00D099FF00D19AFF00D19AFF00D19BFF00D19BFF00D19CFF00D29CFF00D29DFF
          00D29DFF00D29EFF00D39EFF00D39FFF00D39FFF00D3A0FF00D4A0FF00D4A1FF
          00D4A1FF00D4A2FF00D4A2FF00D5A3FF00D5A4FF00D5A3FF00D3A3FF00D0A1FF
          00CB9EFF00C599FF00BB92FF2FC0A0FFEBF8F5FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFEFEFF68CFBBFF16C09EFF17CAA6FF18D2AEFF18D8B2FF19DCB6FF19DEB8FF
          19DFBAFF19DFBAFF19DFBBFF19DFBBFF19E0BBFF19E0BCFF19E0BCFF19E0BCFF
          19E1BDFF19E1BDFF19E1BEFF19E1BEFF19E1BEFF19E2BFFF19E2BFFF19E2C0FF
          19E2C0FF19E3C1FF19E3C1FF19E3C2FF19E3C2FF19E3C3FF19E4C3FF19E4C3FF
          19E4C4FF19E4C4FF19E4C4FF19E5C5FF19E5C5FF46EAD1FF10E3C4FF066454A3
          0000004500000028000000130000000600000000000000000000000000000000
          00000000000000000008060100150E0A0000001A0000003203AB79DB28D39EFF
          2AD49FFF1CD199FF1CD199FF1CD19AFF1CD19AFF1CD19AFF1CD19BFF1CD19CFF
          1CD29CFF1CD29DFF1CD29DFF1CD29DFF1CD29DFF1CD29EFF1CD39EFF1CD39FFF
          1CD39FFF1BD39FFF13D29CFF09D098FF01CF96FF00CF95FF00CF96FF00D097FF
          00D097FF00D098FF00D098FF00D198FF00D199FF00D199FF00D19AFF00D19AFF
          00D29BFF00D29BFF00D29CFF00D29CFF00D29DFF00D39DFF00D39EFF00D39EFF
          00D39FFF00D49FFF00D4A0FF00D4A0FF00D4A1FF00D5A1FF00D5A2FF00D5A2FF
          00D5A3FF00D5A3FF00D6A4FF00D6A5FF00D7A5FF00D7A6FF00D6A6FF00D4A5FF
          06D3A5FF0FCFA5FF15C9A2FF18C09CFF3FC3A6FFECF8F6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFEFEFF6AD0BCFF18C1A0FF19CBA8FF1AD3B0FF1BD9B5FF1BDDB9FF
          1CDFBBFF1CE0BCFF1CE1BCFF1CE1BCFF1CE1BDFF1CE1BEFF1CE1BEFF1CE2BEFF
          1CE2BFFF1CE2BFFF1CE2C0FF1CE2C0FF1CE2C1FF1CE3C1FF1CE3C1FF1CE3C2FF
          1CE3C2FF1CE3C3FF1CE4C3FF1CE4C4FF1CE4C4FF1CE4C4FF1CE4C4FF1CE5C5FF
          1CE5C5FF1CE5C5FF1CE5C6FF1CE5C6FF1CE6C7FF4DEBD3FF0BE4C4FF085B4D98
          0000004200000026000000110009070500000000000000000000000000000000
          00000000000000000000000000140E08000000170000002F04A073C921D29BFF
          30D5A2FF1FD29BFF1FD39BFF1FD39CFF1FD39CFF1FD39CFF1FD39DFF1FD49DFF
          1FD49EFF1FD49EFF1FD49FFF1FD49FFF1FD5A0FF1FD5A0FF1FD5A0FF1FD5A1FF
          1FD5A1FF1FD6A1FF1FD6A1FF1FD6A2FF1ED6A2FF17D5A0FF0ED39DFF06D29AFF
          00D198FF00D199FF00D299FF00D29AFF00D29AFF00D29BFF00D29BFF00D39CFF
          00D39CFF00D39CFF00D39DFF00D49EFF00D49EFF00D49FFF00D49FFF00D4A0FF
          00D5A0FF00D5A1FF00D5A1FF00D5A1FF00D6A2FF00D6A2FF00D6A3FF00D6A4FF
          00D6A4FF00D7A5FF00D7A5FF00D8A6FF03D8A7FF0BD9ABFF14DBAFFF1DDCB1FF
          1FDAB1FF1ED8AFFF1DD3ABFF1CCCA5FF1BC29EFF41C5A8FFECF8F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFEFEFF6BD1BDFF1BC1A1FF1CCBAAFF1DD5B2FF1EDBB7FF
          1EDEBBFF1FE0BDFF1FE2BEFF1FE3BFFF1FE3BFFF1FE3BFFF1FE3BFFF1FE3C0FF
          1FE4C0FF1FE4C1FF1FE4C1FF1FE4C2FF1FE4C2FF1FE5C3FF1FE5C3FF1FE5C3FF
          1FE5C4FF1FE5C4FF1FE5C4FF1FE5C5FF1FE5C5FF1FE5C6FF1FE5C6FF1FE6C7FF
          1FE6C7FF1FE6C7FF1FE6C7FF1FE6C8FF1FE7C8FF53ECD5FF05E4C3FF0A50418B
          0000003F00000024000000100007060400000000000000000000000000000000
          00000000000000000000000000120D07000000160000002C02845FAE19D29AFF
          35D8A6FF22D59EFF22D59FFF22D59FFF22D5A0FF22D5A0FF22D5A0FF22D5A1FF
          22D5A1FF22D5A1FF22D6A1FF22D6A2FF22D6A2FF22D6A3FF22D6A3FF22D7A4FF
          22D7A4FF22D7A5FF22D7A5FF22D7A5FF22D8A6FF22D8A6FF22D8A7FF22D8A7FF
          21D8A7FF19D7A4FF12D6A2FF0AD49FFF04D49EFF00D49CFF00D49DFF00D49DFF
          00D49EFF00D49EFF00D59FFF00D59FFF00D5A0FF00D5A0FF00D6A1FF00D6A1FF
          00D6A2FF00D6A2FF00D6A2FF00D7A3FF00D7A3FF00D7A4FF00D7A5FF00D7A5FF
          04D8A7FF0CDAABFF15DCAEFF1DDDB2FF22DEB4FF22DEB4FF22DEB4FF22DFB5FF
          22DEB4FF22DCB4FF21D9B2FF20D5AEFF1FCDA8FF1EC3A0FF44C5AAFFECF8F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF6DD2BFFF1DC3A4FF1FCDADFF20D6B4FF
          21DCB9FF21DFBDFF22E2BFFF22E3C1FF22E4C1FF22E4C1FF22E4C2FF22E4C2FF
          22E5C2FF22E5C3FF22E5C3FF22E5C4FF22E5C4FF22E6C4FF22E6C5FF22E6C5FF
          22E6C6FF22E6C6FF22E7C7FF22E7C7FF22E7C8FF22E7C8FF22E7C8FF22E7C8FF
          22E8C9FF22E8C9FF22E8C9FF22E8CAFF24E8CAFF57EED7FF00E5C3FF09352B75
          0000003C000000210000000E0006050300000000000000000000000000000000
          000000000000000000000000000F0B060000001300000028015E429611D298FF
          3BDAAAFF26D6A1FF26D6A2FF26D7A2FF26D7A3FF26D7A3FF26D7A3FF26D7A4FF
          26D8A4FF26D8A4FF26D8A5FF26D8A5FF26D8A6FF26D9A6FF26D9A6FF26D9A6FF
          26D9A7FF26D9A7FF26DAA8FF26DAA8FF26DAA8FF26DAA9FF26DAA9FF26DAAAFF
          26DAABFF26DAABFF26DAABFF26DBACFF26DBACFF25DAACFF1FD9AAFF19D9A8FF
          14D9A7FF10D8A6FF0CD8A4FF08D7A4FF04D6A2FF00D7A2FF00D7A2FF00D7A3FF
          02D7A4FF04D8A5FF08D9A7FF0AD9A8FF10DAABFF17DBAEFF1DDDB0FF24DEB3FF
          26DFB4FF26E0B5FF26E0B5FF26E0B6FF26E0B6FF26E0B7FF26E0B8FF26E0B8FF
          26E0B8FF26DFB7FF26DDB7FF25DBB5FF24D6B0FF23CEAAFF21C4A3FF46C6ACFF
          ECF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF6FD3C0FF21C5A6FF22CFAFFF
          24D7B7FF25DEBCFF25E1C0FF26E4C2FF26E5C3FF26E5C3FF26E5C4FF26E5C4FF
          26E6C4FF26E6C5FF26E6C5FF26E6C6FF26E6C6FF26E7C7FF26E7C7FF26E7C8FF
          26E7C8FF26E7C9FF26E7C9FF26E8C9FF26E8C9FF26E8C9FF26E8CAFF26E8CAFF
          26E9CAFF26E9CBFF26E9CBFF26E9CCFF2FEACEFF4EEED5FF01E4C2FD0108065B
          000000370000001E0000000C0004030200000000000000000000000000000000
          00000000000000000000000000251A04000000110000002503503A8107D195FF
          40DDADFF29D8A4FF29D8A4FF29D8A5FF29D8A5FF29D9A5FF29D9A6FF29D9A6FF
          29D9A6FF29D9A7FF29D9A8FF29DAA8FF29DAA9FF29DAA9FF29DAA9FF29DAA9FF
          29DBAAFF29DBAAFF29DBAAFF29DBABFF29DBABFF29DCACFF29DCACFF29DCADFF
          29DCADFF29DCADFF29DDAEFF29DDAEFF29DDAEFF29DDAFFF29DDAFFF29DDAFFF
          29DDB0FF29DDB0FF29DDB1FF29DDB1FF29DEB2FF29DEB2FF29DEB3FF29DEB3FF
          29DEB3FF29DFB3FF29DFB4FF29DFB4FF29DFB5FF29DFB5FF29E0B6FF29E0B6FF
          29E1B7FF29E1B7FF29E1B8FF29E1B8FF29E1B9FF29E2B9FF29E2B9FF29E2BAFF
          29E2BAFF29E2BAFF29E1BAFF29DFB9FF28DDB7FF27D7B3FF26D0ADFF24C6A5FF
          49C7AEFFECF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF71D4C2FF23C6A8FF
          25D0B1FF27D8B9FF28DFBEFF28E3C1FF29E5C4FF29E6C5FF29E7C6FF29E7C6FF
          29E7C7FF29E8C7FF29E8C8FF29E8C8FF29E8C8FF29E8C8FF29E8C9FF29E8C9FF
          29E8C9FF29E8CAFF29E8CAFF29E8CAFF29E9CBFF29E9CBFF29E9CCFF29E9CCFF
          29E9CCFF29EACDFF29EACDFF29EACDFF3CEBD2FF41ECD3FF06D9B9F200000053
          000000330000001B0005040A0003020200000000000000000000000000000000
          000000000000000000000000001E16030000000E0000002004382C5E00D293FF
          3FDDAEFF2DDAA7FF2DDAA7FF2DDAA7FF2DDBA7FF2DDBA8FF2DDBA8FF2DDBA8FF
          2DDBA9FF2DDBAAFF2DDBAAFF2DDBAAFF2DDBAAFF2DDBABFF2DDCABFF2DDCACFF
          2DDCACFF2DDCACFF2DDCADFF2DDDADFF2DDDAEFF2DDDAEFF2DDDAEFF2DDDAEFF
          2DDDAFFF2DDEAFFF2DDEB0FF2DDEB0FF2DDEB1FF2DDEB1FF2DDFB1FF2DDFB2FF
          2DDFB2FF2DDFB3FF2DDFB3FF2DE0B3FF2DE0B4FF2DE0B4FF2DE0B5FF2DE0B5FF
          2DE0B5FF2DE0B6FF2DE0B6FF2DE0B7FF2DE0B7FF2DE1B8FF2DE1B8FF2DE2B8FF
          2DE2B9FF2DE2B9FF2DE2BAFF2DE2BAFF2DE3BAFF2DE3BBFF2DE3BBFF2DE3BCFF
          2DE3BCFF2DE4BCFF2DE4BDFF2DE3BCFF2CE1BCFF2BDEBAFF2ADAB5FF29D2AFFF
          27C8A7FF4BC9AFFFEDF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF73D5C2FF
          26C7AAFF29D1B2FF2ADABAFF2BE0C0FF2CE4C4FF2DE6C6FF2DE7C7FF2DE8C8FF
          2DE9C8FF2DE9C9FF2DE9C9FF2DE9C9FF2DE9CAFF2DE9CAFF2DE9CAFF2DE9CAFF
          2DE9CBFF2DE9CBFF2DE9CCFF2DE9CCFF2DEACCFF2DEACDFF2DEACDFF2DEACDFF
          2DEACEFF2DEACEFF2DEBCEFF2DEBCEFF4BEED5FF30EBD0FF0AC3A4DC0000004D
          0000002E00000018000908080001010100000000000000000000000000000000
          000000000000000000000000001811020000000B0000001D0109073900CE91FB
          35DCABFF34DCABFF30DCAAFF30DCAAFF30DCAAFF30DCAAFF30DCABFF30DDABFF
          30DDACFF30DDACFF30DDADFF30DDADFF30DEADFF30DEAEFF30DEAEFF30DEAEFF
          30DEAEFF30DEAFFF30DEAFFF30DEB0FF30DEB0FF30DEB1FF30DFB1FF30DFB1FF
          30DFB2FF30DFB2FF30DFB2FF30DFB3FF30E0B3FF30E0B3FF30E0B4FF30E0B4FF
          30E0B5FF30E0B5FF30E1B6FF30E1B6FF30E1B6FF30E1B7FF30E1B7FF30E2B7FF
          30E2B8FF30E2B8FF30E2B9FF30E2B9FF30E2BAFF30E2BAFF30E3BAFF30E3BBFF
          30E3BBFF30E3BBFF30E3BCFF30E4BCFF30E4BDFF30E4BDFF30E4BEFF30E4BEFF
          30E5BEFF30E5BEFF30E5BFFF30E5BFFF30E4BFFF2FE2BDFF2FE0BCFF2EDBB7FF
          2CD3B1FF2AC9A9FF4ECAB1FFEDF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF
          74D5C4FF2AC8ACFF2BD2B5FF2DDBBDFF2FE1C2FF2FE5C6FF30E7C8FF30E8C9FF
          30E9CAFF30EACBFF30EACBFF30EACBFF30EACBFF30EACCFF30EBCCFF30EBCCFF
          30EBCDFF30EBCDFF30EBCDFF30EBCEFF30EBCEFF30EBCFFF30EBCFFF30EBCFFF
          30EBCFFF30EBCFFF30ECD0FF30ECD0FF57EFD9FF1FEBCDFF058C76B900000047
          0000002900000014000706060000000000000000000000000000000000000000
          00000000000000000000000000130D0100181109000000180000003003B985E1
          28DBA7FF3ADEAFFF34DDACFF34DDACFF34DEADFF34DEADFF34DEADFF34DEADFF
          34DEAEFF34DEAEFF34DFAFFF34DFAFFF34DFAFFF34DFB0FF34DFB0FF34DFB1FF
          34E0B1FF34E0B1FF34E0B1FF34E0B2FF34E0B2FF34E1B3FF34E1B3FF34E1B4FF
          34E1B4FF34E1B4FF34E1B5FF34E1B5FF34E1B5FF34E1B5FF34E1B6FF34E1B6FF
          34E2B7FF34E2B7FF34E2B7FF34E2B8FF34E2B8FF34E2B9FF34E3B9FF34E3B9FF
          34E3B9FF34E3BAFF34E3BAFF34E4BBFF34E4BBFF34E5BCFF34E5BCFF34E5BDFF
          34E5BDFF34E5BDFF34E5BDFF34E5BEFF34E5BEFF34E5BFFF34E5BFFF34E5C0FF
          34E6C0FF34E6C1FF34E6C1FF34E6C1FF34E6C1FF34E6C1FF33E4C0FF32E1BDFF
          31DCBAFF30D4B3FF2DCAABFF50CBB2FFEDF9F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFEFEFF76D6C5FF2CC9ADFF2FD4B7FF31DCBFFF32E2C4FF33E6C8FF34E8CAFF
          34EACBFF34EBCCFF34EBCCFF34EBCDFF34EBCDFF34EBCDFF34EBCDFF34ECCEFF
          34ECCEFF34ECCEFF34ECCFFF34ECCFFF34ECCFFF34ECD0FF34EDD0FF34EDD1FF
          34EDD1FF34EDD1FF34EDD1FF34EDD1FF62F1DCFF0FEACAFF0764569C00000040
          000000240000001100110E050000000000000000000000000000000000000000
          0000000000000000000000000000000000150F070000001400000029038C66AF
          1ADAA2FF42E0B2FF38E0AEFF38E0AFFF38E0AFFF38E0B0FF38E0B0FF38E0B0FF
          38E0B1FF38E0B1FF38E0B1FF38E0B1FF38E0B2FF38E0B2FF38E1B3FF38E1B3FF
          38E1B4FF38E1B4FF38E1B4FF38E2B4FF38E2B5FF38E2B5FF38E2B6FF38E2B6FF
          38E2B6FF38E3B7FF38E3B7FF38E3B8FF38E3B8FF38E3B8FF38E3B8FF38E4B9FF
          38E4B9FF38E4BAFF38E4BAFF38E4BAFF38E4BBFF38E4BBFF38E4BCFF38E4BCFF
          38E4BCFF38E4BCFF38E5BDFF38E5BEFF38E6BEFF38E6BEFF38E6BFFF38E6BFFF
          38E6BFFF38E6BFFF38E7C0FF38E7C0FF38E7C1FF38E7C1FF38E7C2FF38E7C2FF
          38E7C3FF38E7C3FF38E7C3FF38E7C3FF38E7C4FF38E8C4FF38E7C3FF37E5C3FF
          36E2C0FF35DCBCFF33D5B6FF31CBAEFF52CBB4FFEDF9F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFEFEFF78D6C6FF30CBB0FF33D5B9FF35DEC1FF36E4C6FF37E7CAFF
          38EACCFF38EBCDFF38ECCEFF38ECCEFF38ECCEFF38ECCFFF38ECCFFF38ECCFFF
          38EDD0FF38EDD0FF38EDD1FF38EDD1FF38EDD1FF38EDD2FF38EED2FF38EED2FF
          38EED2FF38EED3FF38EED3FF3CEED4FF65F2DEFF00EAC8FF09392E7300000039
          000000200000000D000D0B030000000000000000000000000000000000000000
          00000000000000000000000000000000012B1F05000000100000002303574085
          09D99DFF47E3B6FF3BE1B1FF3BE1B2FF3BE1B2FF3BE1B3FF3BE2B3FF3BE2B3FF
          3BE2B3FF3BE2B3FF3BE2B4FF3BE2B4FF3BE2B5FF3BE2B5FF3BE2B6FF3BE2B6FF
          3BE2B6FF3BE3B6FF3BE3B6FF3BE3B7FF3BE3B7FF3BE3B8FF3BE3B8FF3BE4B8FF
          3BE4B9FF3BE4B9FF3BE4BAFF3BE4BAFF3BE4BAFF3BE5BAFF3BE5BBFF3BE5BBFF
          3BE5BCFF3BE5BCFF3BE5BDFF3BE6BDFF3BE6BDFF3BE6BDFF3BE6BDFF3BE6BEFF
          3BE6BEFF3BE6BFFF3BE6C0FF3BE7C0FF3BE7C0FF3BE7C0FF3BE7C1FF3BE7C1FF
          3BE7C1FF3BE8C2FF3BE8C2FF3BE8C3FF3BE8C3FF3BE8C4FF3BE8C4FF3BE9C4FF
          3BE9C4FF3BE9C5FF3BE9C5FF3BE9C6FF3BE9C6FF3BE9C6FF3BE9C7FF3BE8C6FF
          3AE6C5FF3AE3C2FF38DEBEFF36D6B8FF34CCAFFF55CCB6FFEEF9F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFEFEFF7AD7C7FF33CBB2FF36D6BBFF38DFC3FF39E5C9FF
          3AE8CCFF3BEBCFFF3BEDD0FF3BEDD0FF3BEDD1FF3BEDD1FF3BEDD1FF3BEDD1FF
          3BEDD1FF3BEED2FF3BEED2FF3BEED2FF3BEED3FF3BEED3FF3BEED3FF3BEED4FF
          3BEFD4FF3BEFD4FF3BEFD5FF4FF0D9FF4BF0D8FF05DFBFF40000005100000032
          0000001A0007060A000807020000000000000000000000000000000000000000
          00000000000000000000000000000000002319030000000C0000001E042C224F
          00D89AFE42E3B5FF40E2B4FF3FE2B4FF3FE3B4FF3FE3B5FF3FE3B5FF3FE3B5FF
          3FE3B5FF3FE3B6FF3FE4B6FF3FE4B7FF3FE4B7FF3FE4B7FF3FE4B8FF3FE4B8FF
          3FE5B8FF3FE5B8FF3FE5B9FF3FE5B9FF3FE5BAFF3FE5BAFF3FE5BAFF3FE5BBFF
          3FE5BBFF3FE5BBFF3FE5BBFF3FE5BCFF3FE6BCFF3FE6BDFF3FE6BDFF3FE6BDFF
          3FE6BEFF3FE6BEFF3FE7BEFF3FE7BEFF3FE7BFFF3FE7BFFF3FE7C0FF3FE7C0FF
          3FE8C1FF3FE8C1FF3FE8C1FF3FE8C2FF3FE8C2FF3FE8C3FF3FE8C3FF3FE8C3FF
          3FE9C4FF3FE9C4FF3FE9C4FF3FE9C4FF3FE9C5FF3FE9C5FF3FEAC6FF3FEAC6FF
          3FEAC6FF3FEAC7FF3FEAC7FF3FEAC7FF3FEBC7FF3FEBC8FF3FEBC8FF3FEBC9FF
          3FEAC8FF3EE8C7FF3DE5C5FF3CE0C0FF3AD8B9FF37CDB1FF57CDB7FFEEF9F7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF7CD8C8FF36CDB3FF39D7BCFF3BE0C4FF
          3DE6CAFF3EEACEFF3EEDD0FF3FEED2FF3FEED2FF3FEED2FF3FEED3FF3FEED3FF
          3FEED3FF3FEED3FF3FEFD3FF3FEFD4FF3FEFD4FF3FEFD4FF3FEFD5FF3FEFD5FF
          3FEFD5FF3FF0D6FF3FF0D6FF65F3DEFF2DEED3FF0AB89CD0000000480000002B
          00000016000B0907000403010000000000000000000000000000000000000000
          00000000000000000000000000000000001B1301011B1409000000180000002F
          03C28DE52FE1AEFF46E5B8FF43E4B7FF43E4B7FF43E4B7FF43E4B8FF43E4B8FF
          43E5B8FF43E5B9FF43E5B9FF43E5BAFF43E5BAFF43E5BAFF43E6BAFF43E6BBFF
          43E6BBFF43E6BBFF43E6BBFF43E6BCFF43E7BCFF43E7BDFF43E7BDFF43E7BDFF
          43E7BDFF43E7BEFF43E7BEFF43E7BFFF43E7BFFF43E7BFFF43E7C0FF43E7C0FF
          43E8C0FF43E8C0FF43E8C0FF43E8C1FF43E8C1FF43E8C2FF43E8C2FF43E9C3FF
          43E9C3FF43EAC3FF43EAC4FF43EAC4FF43EAC5FF43EAC5FF43EAC5FF43EAC6FF
          43EAC6FF43EAC6FF43EAC6FF43EAC7FF43EAC7FF43EBC7FF43EBC8FF43EBC8FF
          43EBC8FF43EBC8FF43EBC9FF43EBC9FF43ECCAFF43ECCAFF43ECCBFF43ECCBFF
          43ECCBFF42EBCAFF42E9C9FF41E6C7FF40E1C2FF3DD9BCFF3ACEB3FF5ACEB9FF
          EEF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF7ED9C9FF39CEB5FF3CD8BEFF
          3FE1C7FF41E8CDFF42EBD1FF42EED2FF43EFD3FF43EFD4FF43EFD4FF43EFD4FF
          43EFD5FF43EFD5FF43EFD5FF43F0D6FF43F0D6FF43F0D6FF43F0D6FF43F0D6FF
          43F0D7FF43F0D7FF43F1D7FF72F4E2FF12EDCEFF06695A9E0000003F00000024
          00000010000F0D05000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000001610060000001300000027
          03825FA619DFA7FF4CE6BBFF47E6B9FF47E6B9FF47E6B9FF47E6BAFF47E6BAFF
          47E6BBFF47E6BBFF47E6BBFF47E6BCFF47E7BCFF47E7BCFF47E7BCFF47E7BCFF
          47E7BDFF47E7BDFF47E8BEFF47E8BEFF47E8BEFF47E8BEFF47E8BFFF47E8BFFF
          47E8C0FF47E9C0FF47E9C0FF47E9C1FF47E9C1FF47E9C1FF47E9C1FF47E9C2FF
          47E9C2FF47E9C2FF47E9C3FF47E9C3FF47E9C4FF47E9C4FF47EAC4FF47EAC5FF
          47EBC5FF47EBC5FF47EBC6FF47EBC6FF47EBC6FF47EBC6FF47EBC7FF47EBC7FF
          47EBC8FF47EBC8FF47EBC8FF47EBC9FF47EBC9FF47ECC9FF47ECC9FF47ECCAFF
          47ECCAFF47ECCAFF47ECCBFF47ECCBFF47EDCBFF47EDCCFF47EDCCFF47EDCCFF
          47EDCDFF47EDCDFF46EDCCFF46EBCBFF45E8C9FF43E2C4FF41DABDFF3ED0B5FF
          5CCFBAFFEEF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF80DACBFF3DCFB7FF
          40DAC1FF43E4C9FF45E9CFFF46EDD2FF47EFD4FF47F0D6FF47F0D6FF47F0D6FF
          47F0D6FF47F0D6FF47F0D7FF47F0D7FF47F1D7FF47F1D7FF47F1D8FF47F1D8FF
          47F1D9FF47F1D9FF50F2DBFF6CF4E1FF01ECCAFE07292168000000360000001D
          0000000C00110E03000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000012C20040000000E00000020
          0548376C03DDA0FF4FE8BDFF4BE8BCFF4BE8BCFF4BE8BCFF4BE8BCFF4BE8BDFF
          4BE8BDFF4BE8BDFF4BE8BEFF4BE8BEFF4BE8BEFF4BE8BEFF4BE8BFFF4BE8BFFF
          4BE8BFFF4BE9C0FF4BE9C0FF4BE9C1FF4BE9C1FF4BE9C1FF4BE9C1FF4BE9C2FF
          4BEAC2FF4BEAC2FF4BEAC3FF4BEAC3FF4BEAC3FF4BEAC3FF4BEAC4FF4BEAC4FF
          4BEAC4FF4BEAC5FF4BEAC5FF4BEAC6FF4BEAC6FF4BEBC6FF4BEBC7FF4BECC7FF
          4BECC7FF4BECC8FF4BECC8FF4BECC8FF4BECC8FF4BECC9FF4BEDC9FF4BEDC9FF
          4BEDCAFF4BEDCAFF4BEDCAFF4BEDCAFF4BEDCBFF4BEDCBFF4BEDCCFF4BEDCCFF
          4BEDCCFF4BEDCDFF4BEDCDFF4BEECDFF4BEECDFF4BEECEFF4BEECEFF4BEECEFF
          4BEECFFF4BEECFFF4BEFCFFF4AEECEFF4AECCEFF49E9CBFF47E3C7FF44DBC0FF
          41D1B7FF5FD0BCFFEFF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF82DBCCFF
          41D2BAFF45DDC5FF48E7CDFF49ECD3FF4AEFD5FF4BF1D7FF4BF2D7FF4BF2D7FF
          4BF2D8FF4BF2D8FF4BF2D9FF4BF2D9FF4BF2D9FF4BF2D9FF4BF2D9FF4BF2D9FF
          4BF2DAFF4BF2DAFF6AF4E1FF41F1D9FF0AD4B4E30000004B0000002D00000017
          000F0D09000A0901000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000221902010E0A0A00000019
          0003023103CF96EF3AE6B6FF50E9BEFF4FE9BEFF4FE9BEFF4FE9BFFF4FE9BFFF
          4FE9BFFF4FE9C0FF4FE9C0FF4FE9C0FF4FE9C0FF4FE9C1FF4FE9C1FF4FEAC2FF
          4FEAC2FF4FEAC2FF4FEAC2FF4FEAC2FF4FEAC3FF4FEAC3FF4FEBC4FF4FEBC4FF
          4FEBC4FF4FEBC4FF4FEBC4FF4FEBC5FF4FECC5FF4FECC6FF4FECC6FF4FECC6FF
          4FECC6FF4FECC6FF4FECC7FF4FECC7FF4FECC8FF4FECC8FF4FEDC8FF4FEDC9FF
          4FEDC9FF4FEDCAFF4FEDCAFF4FEDCAFF4FEDCBFF4FEDCBFF4FEECBFF4FEECBFF
          4FEECBFF4FEECCFF4FEECCFF4FEECDFF4FEECDFF4FEECDFF4FEECDFF4FEECEFF
          4FEECEFF4FEECEFF4FEECFFF4FEFCFFF4FEFCFFF4FEFCFFF4FEFD0FF4FEFD0FF
          4FEFD0FF4FEFD1FF4FF0D1FF4FF0D1FF4EEFD0FF4EEDD0FF4DEACDFF4BE4C8FF
          48DCC2FF45D2B8FF62D1BDFFEFFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFF
          7DDCCDFF46D8C1FF4AE3CBFF4CEBD1FF4EEFD6FF4FF1D8FF4FF2D9FF4FF3D9FF
          4FF3D9FF4FF3DAFF4FF3DAFF4FF3DAFF4FF3DAFF4FF3DAFF4FF3DAFF4FF3DBFF
          4FF3DBFF4FF3DBFF80F6E5FF18EFD1FF077C6AA8000000400000002500000011
          0114110600000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000001912010118120600000013
          00000027048C68AB1DE3ADFF55EAC1FF53E9C0FF53EAC1FF53EAC1FF53EAC2FF
          53EAC2FF53EAC2FF53EAC2FF53EAC3FF53EAC3FF53EBC3FF53EBC4FF53EBC4FF
          53EBC4FF53EBC4FF53EBC5FF53EBC5FF53EBC5FF53EBC6FF53EBC6FF53EBC6FF
          53EBC6FF53EBC6FF53EBC7FF53ECC7FF53ECC8FF53ECC8FF53ECC8FF53ECC8FF
          53ECC8FF53ECC9FF53EDC9FF53EDCAFF53EDCAFF53EDCAFF53EDCBFF53EDCBFF
          53EDCCFF53EDCCFF53EDCCFF53EDCCFF53EECCFF53EECDFF53EECDFF53EECDFF
          53EECEFF53EECEFF53EECEFF53EFCEFF53EFCFFF53EFCFFF53EFCFFF53EFD0FF
          53EFD0FF53EFD0FF53EFD0FF53EFD1FF53EFD1FF53EFD1FF53EFD2FF53EFD2FF
          53EFD2FF53F0D2FF53F0D3FF53F0D3FF53F0D3FF52EFD3FF52EDD2FF51EACFFF
          4FE6CAFF4CDDC3FF48D3BAFF65D1BEFFEFFAF8FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F0FAF9FF50D4BFFF4CE0C8FF4FE9D1FF51EFD7FF53F2DAFF53F3DAFF53F3DAFF
          53F3DAFF53F3DAFF53F3DBFF53F3DBFF53F3DCFF53F3DCFF53F3DCFF53F3DCFF
          53F3DCFF60F4DFFF76F6E4FF01EDCDFE0833296B000000350000001D0000000C
          0015120300000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000022F23040000000D
          0000001E053E305E03E0A4FE54EAC1FF57EBC3FF57EBC3FF57EBC3FF57EBC3FF
          57EBC4FF57EBC4FF57EBC4FF57ECC5FF57ECC5FF57ECC5FF57ECC5FF57ECC6FF
          57ECC6FF57ECC6FF57ECC7FF57ECC7FF57ECC7FF57ECC7FF57ECC8FF57ECC8FF
          57ECC8FF57EDC9FF57EDC9FF57EDC9FF57EDC9FF57EDC9FF57EDCAFF57EDCAFF
          57EECBFF57EECBFF57EECBFF57EECCFF57EECCFF57EECCFF57EECDFF57EECDFF
          57EECDFF57EECDFF57EECEFF57EFCEFF57EFCEFF57EFCFFF57EFCFFF57EFCFFF
          57EFCFFF57EFD0FF57F0D0FF57F0D0FF57F0D1FF57F0D1FF57F0D1FF57F0D1FF
          57F0D2FF57F0D2FF57F0D2FF57F0D3FF57F0D3FF57F0D3FF57F0D3FF57F0D3FF
          57F0D4FF57F1D4FF57F1D5FF57F1D5FF57F1D5FF57F1D5FF56F0D4FF56EED3FF
          55EBD1FF53E6CCFF4FDEC5FF4CD4BCFF68D2C0FFEFFAF8FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7EDED0FF4FDEC8FF53E8D1FF55EFD8FF57F3DBFF57F3DCFF57F3DCFF
          57F4DCFF57F4DCFF57F4DDFF57F4DDFF57F4DDFF57F4DDFF57F4DDFF57F4DEFF
          57F4DEFF7DF6E5FF3EF3DAFF0ACAABD9000000470000002B0000001601100E08
          000E0C0100000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001251B02021E1709
          000000160000002C05C492DC38E8B8FF5BECC5FF5BECC5FF5BECC5FF5BECC6FF
          5BEDC6FF5BEDC6FF5BEDC7FF5BEDC7FF5BEDC7FF5BEDC7FF5BEDC8FF5BEDC8FF
          5BEDC8FF5BEDC9FF5BEEC9FF5BEEC9FF5BEEC9FF5BEECAFF5BEECAFF5BEECAFF
          5BEECBFF5BEECBFF5BEECBFF5BEECBFF5BEECBFF5BEECCFF5BEECCFF5BEFCDFF
          5BEFCDFF5BEFCDFF5BEFCDFF5BEFCEFF5BEFCEFF5BEFCEFF5BEFCFFF5BEFCFFF
          5BEFCFFF5BEFCFFF5BEFD0FF5BF0D0FF5BF0D0FF5BF0D0FF5BF0D1FF5BF0D1FF
          5BF0D1FF5BF0D2FF5BF1D2FF5BF1D2FF5BF1D2FF5BF1D3FF5BF1D3FF5BF1D3FF
          5BF1D4FF5BF1D4FF5BF1D4FF5BF1D4FF5BF1D4FF5BF1D5FF5BF1D5FF5BF1D6FF
          5BF1D6FF5BF2D6FF5BF2D6FF5BF2D6FF5BF2D7FF5BF2D7FF5BF2D7FF5AF1D7FF
          5AEFD5FF59ECD3FF56E7CEFF53DFC6FF4FD4BDFF6AD2C1FFF0FAF8FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF88E0D2FF53DEC9FF57E9D3FF59F0D9FF5BF4DCFF5BF4DDFF5BF4DDFF
          5BF4DDFF5BF4DDFF5BF5DEFF5BF5DEFF5BF5DFFF5BF5DFFF5BF5DFFF5BF5DFFF
          5EF5E0FF91F8EAFF0BF0D1FF086556940000003B000000220000000F01151205
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000003281E05
          00000010000000220462498512E5ACFF5FEDC7FF5FEDC8FF5FEDC8FF5FEEC8FF
          5FEEC8FF5FEEC8FF5FEEC9FF5FEEC9FF5FEECAFF5FEECAFF5FEECAFF5FEECAFF
          5FEFCAFF5FEFCAFF5FEFCBFF5FEFCBFF5FEFCBFF5FEFCBFF5FEFCBFF5FEFCCFF
          5FEFCCFF5FEFCDFF5FEFCDFF5FEFCDFF5FEFCDFF5FEFCDFF5FF0CEFF5FF0CEFF
          5FF0CFFF5FF0CFFF5FF0CFFF5FF0D0FF5FF0D0FF5FF0D0FF5FF0D0FF5FF0D0FF
          5FF0D1FF5FF0D1FF5FF1D2FF5FF1D2FF5FF1D2FF5FF1D2FF5FF1D2FF5FF1D3FF
          5FF1D3FF5FF1D3FF5FF2D4FF5FF2D4FF5FF2D4FF5FF2D4FF5FF2D4FF5FF2D5FF
          5FF2D5FF5FF2D5FF5FF2D5FF5FF2D6FF5FF2D6FF5FF2D6FF5FF2D7FF5FF2D7FF
          5FF2D7FF5FF3D7FF5FF3D7FF5FF3D8FF5FF3D8FF5FF3D9FF5FF3D9FF5FF3D9FF
          5EF2D8FF5EF0D6FF5CEDD4FF5AE8D0FF57E0C8FF53D5BFFF6DD3C2FFF0FAF8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFEFEFF66D8C7FF57E1CCFF5BEBD5FF5DF1DBFF5FF5DEFF5FF5DEFF5FF5DEFF
          5FF5DFFF5FF5DFFF5FF5DFFF5FF5DFFF5FF6DFFF5FF6DFFF5FF6E0FF5FF6E0FF
          7CF7E6FF63F6E1FF05E6C5F3030F0C510000002F000000190009080A00161202
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000032D2202
          02100C0A00000019010F0C3403D69EEF4DEDC2FF63EFCAFF63EFCAFF63EFCAFF
          63EFCAFF63EFCBFF63EFCBFF63EFCCFF63EFCCFF63EFCCFF63F0CCFF63F0CCFF
          63F0CCFF63F0CDFF63F0CDFF63F0CDFF63F0CDFF63F0CDFF63F0CEFF63F0CEFF
          63F0CFFF63F0CFFF63F0CFFF63F0CFFF63F0CFFF63F1D0FF63F1D0FF63F1D0FF
          63F1D1FF63F1D1FF63F1D2FF63F1D2FF63F1D2FF63F1D2FF63F1D2FF63F1D3FF
          63F1D3FF63F2D3FF63F2D3FF63F2D3FF63F2D4FF63F2D4FF63F2D5FF63F2D5FF
          63F2D5FF63F2D5FF63F3D5FF63F3D5FF63F3D6FF63F3D6FF63F3D6FF63F3D6FF
          63F3D7FF63F3D7FF63F3D7FF63F3D8FF63F3D8FF63F3D8FF63F3D8FF63F3D9FF
          63F3D9FF63F3D9FF63F4DAFF63F4DAFF63F4DAFF63F4DAFF63F4DAFF63F4DBFF
          63F4DBFF62F3DAFF61F2D8FF60EED6FF5EE9D1FF5BE1CAFF56D6C0FF70D4C4FF
          F0FAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          B8EBE3FF58D9C5FF5CE5D0FF5FEDD8FF61F3DDFF63F5E0FF63F6E0FF63F6E0FF
          63F6E0FF63F6E0FF63F6E0FF63F6E1FF63F6E1FF63F6E1FF63F6E1FF63F6E1FF
          9BF9ECFF1FF2D5FF098A76AC0000003E0000002400000012021A1606000D0B01
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001221901
          052D230600000011000000240580619922E9B4FF67F0CCFF67F0CCFF67F0CCFF
          67F0CCFF67F0CDFF67F0CDFF67F0CDFF67F1CDFF67F1CEFF67F1CEFF67F1CEFF
          67F1CEFF67F1CEFF67F1CFFF67F1CFFF67F1CFFF67F1D0FF67F1D0FF67F1D0FF
          67F1D0FF67F1D1FF67F1D1FF67F1D1FF67F1D1FF67F2D1FF67F2D2FF67F2D2FF
          67F2D3FF67F2D3FF67F2D3FF67F2D3FF67F2D3FF67F2D4FF67F2D4FF67F2D4FF
          67F2D5FF67F3D5FF67F3D5FF67F3D5FF67F3D6FF67F3D6FF67F3D6FF67F3D6FF
          67F3D6FF67F3D7FF67F4D7FF67F4D7FF67F4D7FF67F4D8FF67F4D8FF67F4D8FF
          67F4D9FF67F4D9FF67F4D9FF67F4D9FF67F4D9FF67F4DAFF67F4DAFF67F4DAFF
          67F4DAFF67F4DAFF67F5DBFF67F5DBFF67F5DBFF67F5DCFF67F5DCFF67F5DCFF
          67F5DCFF67F5DCFF66F4DCFF65F2DAFF64EFD8FF62E9D3FF5EE1CBFF5AD6C2FF
          73D6C5FFF1FAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7EEE8FF
          5CD6C3FF5EE1CDFF62EAD5FF64F0DBFF66F4DFFF67F6E1FF67F6E1FF67F7E1FF
          67F7E2FF67F7E2FF67F7E2FF67F7E2FF67F7E2FF67F7E2FF67F7E2FF7EF8E7FF
          7CF7E7FF03EDCCFA05211A5C000000310000001B0000000B011B170300000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0533270302110D0B00000019031B153C03DCA4F459EFC8FF6BF1CEFF6BF1CFFF
          6BF1CFFF6BF1CFFF6BF1CFFF6BF2CFFF6BF2D0FF6BF2D0FF6BF2D0FF6BF2D0FF
          6BF2D0FF6BF2D1FF6BF2D1FF6BF2D1FF6BF2D1FF6BF2D1FF6BF2D2FF6BF2D2FF
          6BF2D3FF6BF2D3FF6BF2D3FF6BF2D3FF6BF3D3FF6BF3D4FF6BF3D4FF6BF3D4FF
          6BF3D4FF6BF3D5FF6BF3D5FF6BF3D5FF6BF3D6FF6BF3D6FF6BF3D6FF6BF3D6FF
          6BF3D6FF6BF4D7FF6BF4D7FF6BF4D7FF6BF4D7FF6BF4D7FF6BF4D8FF6BF4D8FF
          6BF4D8FF6BF4D8FF6BF4D9FF6BF4D9FF6BF4D9FF6BF4DAFF6BF4DAFF6BF4DAFF
          6BF4DAFF6BF4DAFF6BF5DBFF6BF5DBFF6BF5DBFF6BF5DBFF6BF5DBFF6BF5DCFF
          6BF5DCFF6BF5DDFF6BF5DDFF6BF5DDFF6BF6DDFF6BF6DDFF6BF6DDFF6BF6DEFF
          6BF6DEFF6BF6DEFF6BF6DEFF6AF5DDFF69F3DCFF68EFD9FF65EAD4FF62E2CDFF
          5ED9C5FF73D8C8FFDBF4F0FFFFFFFFFFFFFFFFFFFAFDFDFFB2E9E0FF5FD7C5FF
          61E0CCFF65E8D4FF68EFDBFF69F3DEFF6AF6E1FF6BF7E2FF6BF7E2FF6BF7E2FF
          6BF7E3FF6BF7E3FF6BF7E3FF6BF7E4FF6BF7E4FF6BF7E4FF6BF7E4FFA3FAEEFF
          2CF4D9FF099981B50000003F000000250000001201120F0700120F0100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          02271D010630250600000011000000230582629826EBB8FF6FF2D0FF6FF2D0FF
          6FF2D1FF6FF2D1FF6FF2D1FF6FF2D1FF6FF2D1FF6FF2D2FF6FF2D2FF6FF2D2FF
          6FF2D2FF6FF2D2FF6FF3D3FF6FF3D3FF6FF3D3FF6FF3D3FF6FF3D3FF6FF3D4FF
          6FF3D4FF6FF3D4FF6FF3D5FF6FF4D5FF6FF4D5FF6FF4D6FF6FF4D6FF6FF4D6FF
          6FF4D6FF6FF4D6FF6FF4D7FF6FF4D7FF6FF4D7FF6FF4D7FF6FF4D7FF6FF4D8FF
          6FF5D8FF6FF5D8FF6FF5D8FF6FF5D8FF6FF5D9FF6FF5D9FF6FF5DAFF6FF5DAFF
          6FF5DAFF6FF5DAFF6FF5DAFF6FF5DBFF6FF5DBFF6FF5DBFF6FF5DBFF6FF5DBFF
          6FF5DBFF6FF5DCFF6FF6DCFF6FF6DCFF6FF6DCFF6FF6DCFF6FF6DDFF6FF6DDFF
          6FF6DDFF6FF6DDFF6FF6DDFF6FF6DEFF6FF6DEFF6FF6DEFF6FF6DFFF6FF6DFFF
          6FF6DFFF6FF6DFFF6FF6DFFF6FF6E0FF6EF5DFFF6DF3DDFF6CF0DBFF6AEBD6FF
          67E6D1FF64DFCBFF61D9C6FF75DBCBFF7BDDCEFF64D8C5FF63DCC9FF66E2CFFF
          68E9D6FF6BEFDCFF6DF3DFFF6EF6E1FF6FF7E3FF6FF8E3FF6FF8E3FF6FF8E4FF
          6FF8E4FF6FF8E4FF6FF8E4FF6FF8E4FF6FF8E4FF6FF8E4FF8BF9EAFF86F9E9FF
          03EECDF906231C5C000000310000001B0000000B021F1B030000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000006362A0303120E0B000000190318133804DAA4ED5DF1CBFF73F3D2FF
          73F3D2FF73F3D2FF73F3D3FF73F3D3FF73F3D3FF73F3D3FF73F3D3FF73F3D4FF
          73F4D4FF73F4D4FF73F4D4FF73F4D4FF73F4D5FF73F4D5FF73F4D6FF73F4D6FF
          73F4D6FF73F4D6FF73F4D6FF73F4D7FF73F4D7FF73F4D7FF73F5D7FF73F5D8FF
          73F5D8FF73F5D8FF73F5D8FF73F5D8FF73F5D9FF73F5D9FF73F5D9FF73F5D9FF
          73F6D9FF73F6DAFF73F6DAFF73F6DAFF73F6DBFF73F6DBFF73F6DBFF73F6DBFF
          73F6DBFF73F6DCFF73F6DCFF73F6DCFF73F6DCFF73F6DCFF73F6DDFF73F6DDFF
          73F6DDFF73F6DDFF73F6DDFF73F6DEFF73F7DEFF73F7DEFF73F7DEFF73F7DEFF
          73F7DFFF73F7DFFF73F7DFFF73F7DFFF73F7DFFF73F7DFFF73F7E0FF73F7E0FF
          73F7E1FF73F7E1FF73F7E1FF73F7E1FF73F7E1FF72F6E1FF71F4DFFF70F2DDFF
          6FEEDAFF6CEAD6FF6BE7D3FF69E4D1FF69E3D0FF6AE5D2FF6CE8D5FF6DECD9FF
          6FF0DDFF71F3E0FF72F6E2FF73F7E3FF73F8E4FF73F8E4FF73F8E4FF73F8E5FF
          73F8E5FF73F8E5FF73F8E5FF73F8E6FF73F8E6FF77F8E7FFACFBF0FF2BF6D9FF
          0B937DAD0000003D0000002400000012041E1B06011411010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000003291F01073026060000001000000021066D53841CEDB7FF76F4D4FF
          77F4D5FF77F4D5FF77F4D5FF77F4D5FF77F4D5FF77F4D5FF77F5D6FF77F5D6FF
          77F5D6FF77F5D6FF77F5D7FF77F5D7FF77F5D7FF77F5D7FF77F5D7FF77F5D7FF
          77F5D8FF77F5D8FF77F5D8FF77F5D8FF77F5D9FF77F5D9FF77F6D9FF77F6D9FF
          77F6D9FF77F6DAFF77F6DAFF77F6DAFF77F6DAFF77F6DBFF77F6DBFF77F6DBFF
          77F6DCFF77F6DCFF77F6DCFF77F6DCFF77F6DCFF77F6DCFF77F6DDFF77F6DDFF
          77F6DDFF77F6DDFF77F7DDFF77F7DEFF77F7DEFF77F7DEFF77F7DEFF77F7DEFF
          77F7DFFF77F7DFFF77F7DFFF77F7DFFF77F7DFFF77F7E0FF77F7E0FF77F7E0FF
          77F7E0FF77F7E0FF77F7E1FF77F7E1FF77F7E1FF77F7E1FF77F7E1FF77F8E1FF
          77F8E2FF77F8E2FF77F8E2FF77F8E3FF77F8E3FF77F8E3FF77F7E2FF76F6E1FF
          75F4E0FF74F2DEFF73F0DDFF72EFDBFF72EFDBFF72EFDCFF73F1DEFF74F3E0FF
          75F6E2FF76F7E4FF77F8E5FF77F9E5FF77F9E6FF77F9E6FF77F9E6FF77F9E6FF
          77F9E6FF77F9E6FF77F9E6FF77F9E7FF77F9E7FF99FAEDFF7DF9E8FF06E8C8F0
          041411500000002E00000019020B0A0B03201B03000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000007362A0303110E0A000000160003032B05CB9AD850F2C9FF
          7BF5D6FF7BF5D6FF7BF5D6FF7BF5D6FF7BF5D7FF7BF5D7FF7BF5D7FF7BF5D7FF
          7BF5D7FF7BF5D8FF7BF5D8FF7BF5D8FF7BF5D8FF7BF5D8FF7BF5D8FF7BF6D9FF
          7BF6D9FF7BF6DAFF7BF6DAFF7BF6DAFF7BF6DBFF7BF6DBFF7BF6DBFF7BF6DBFF
          7BF6DBFF7BF6DBFF7BF6DCFF7BF6DCFF7BF6DCFF7BF6DCFF7BF6DCFF7BF7DDFF
          7BF7DDFF7BF7DDFF7BF7DDFF7BF7DDFF7BF7DEFF7BF7DEFF7BF7DEFF7BF7DEFF
          7BF7DEFF7BF7DFFF7BF7DFFF7BF7DFFF7BF7DFFF7BF7DFFF7BF7E0FF7BF7E0FF
          7BF7E0FF7BF7E0FF7BF7E0FF7BF8E0FF7BF8E1FF7BF8E1FF7BF8E1FF7BF8E1FF
          7BF8E1FF7BF8E2FF7BF8E2FF7BF8E2FF7BF8E2FF7BF8E2FF7BF8E3FF7BF8E3FF
          7BF8E3FF7BF8E3FF7BF8E3FF7BF8E3FF7BF8E4FF7BF8E4FF7BF8E4FF7BF8E4FF
          7AF7E3FF7AF7E3FF79F6E2FF79F5E2FF79F5E2FF79F6E2FF7AF6E3FF7AF7E4FF
          7BF8E5FF7BF8E6FF7BF9E6FF7BF9E6FF7BF9E6FF7BF9E6FF7BF9E7FF7BF9E7FF
          7BF9E7FF7BF9E7FF7BF9E8FF7BF9E8FF87FAEAFFB0FBF1FF1AF5D8FF0A6F5E90
          000000380000002000000010041E1A0601151201000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000003291F01082F25050000000E0000001D043B2E590EEAB3FC
          76F5D6FF7FF5D8FF7FF6D8FF7FF6D9FF7FF6D9FF7FF6D9FF7FF6D9FF7FF6D9FF
          7FF6DAFF7FF6DAFF7FF6DAFF7FF6DAFF7FF6DAFF7FF6DBFF7FF6DBFF7FF6DBFF
          7FF6DBFF7FF6DCFF7FF6DCFF7FF7DCFF7FF7DCFF7FF7DCFF7FF7DDFF7FF7DDFF
          7FF7DDFF7FF7DDFF7FF7DDFF7FF7DEFF7FF7DEFF7FF7DEFF7FF7DEFF7FF7DEFF
          7FF7DFFF7FF7DFFF7FF7DFFF7FF7DFFF7FF7DFFF7FF7DFFF7FF7E0FF7FF7E0FF
          7FF7E0FF7FF8E0FF7FF8E0FF7FF8E1FF7FF8E1FF7FF8E1FF7FF8E1FF7FF8E1FF
          7FF8E2FF7FF8E2FF7FF8E2FF7FF8E2FF7FF8E2FF7FF8E2FF7FF8E3FF7FF8E3FF
          7FF8E3FF7FF8E3FF7FF8E3FF7FF8E4FF7FF8E4FF7FF8E4FF7FF8E4FF7FF8E4FF
          7FF9E4FF7FF9E5FF7FF9E5FF7FF9E5FF7FF9E5FF7FF9E5FF7FF9E5FF7FF9E6FF
          7FF9E6FF7FF9E6FF7FF9E6FF7FF9E6FF7FF9E6FF7FF9E7FF7FF9E7FF7FF9E7FF
          7FF9E7FF7FF9E7FF7FF9E7FF7FF9E8FF7FF9E8FF7FF9E8FF7FF9E8FF7FF9E8FF
          7FF9E8FF7FF9E8FF7FFAE9FF80FAE9FFB0FCF1FF5BF8E3FF09C4A8D200000042
          0000002800000015020B0A0903201B0200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000733280207231C070000001200000024069270A3
          2EF0C1FF83F6DAFF83F7DAFF83F7DAFF83F7DAFF83F7DBFF83F7DBFF83F7DBFF
          83F7DBFF83F7DBFF83F7DCFF83F7DCFF83F7DCFF83F7DCFF83F7DCFF83F7DDFF
          83F7DDFF83F7DDFF83F7DDFF83F8DDFF83F8DEFF83F8DEFF83F8DEFF83F8DEFF
          83F8DEFF83F8DFFF83F8DFFF83F8DFFF83F8DFFF83F8E0FF83F8E0FF83F8E0FF
          83F8E0FF83F8E0FF83F8E0FF83F8E1FF83F8E1FF83F8E1FF83F8E1FF83F8E1FF
          83F8E2FF83F8E2FF83F9E2FF83F9E2FF83F9E2FF83F9E3FF83F9E3FF83F9E3FF
          83F9E3FF83F9E3FF83F9E3FF83F9E4FF83F9E4FF83F9E4FF83F9E4FF83F9E4FF
          83F9E4FF83F9E5FF83F9E5FF83F9E5FF83F9E5FF83F9E5FF83F9E6FF83F9E6FF
          83F9E6FF83F9E6FF83FAE6FF83FAE6FF83FAE6FF83FAE6FF83FAE6FF83FAE7FF
          83FAE7FF83FAE7FF83FAE7FF83FAE7FF83FAE7FF83FAE8FF83FAE8FF83FAE8FF
          83FAE8FF83FAE8FF83FAE8FF83FAE9FF83FAE9FF83FAE9FF83FAE9FF83FAE9FF
          83FAE9FF83FAE9FF83FAE9FFA2FBEFFF9BFBEEFF09F0D1F90731296300000030
          0000001B0000000D082A25040114110100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000B3D310304130F0A0000001702110D30
          05D3A1DC59F4CEFF87F7DCFF87F7DCFF87F7DCFF87F7DCFF87F7DDFF87F7DDFF
          87F7DDFF87F7DDFF87F7DDFF87F7DEFF87F8DEFF87F8DEFF87F8DEFF87F8DEFF
          87F8DFFF87F8DFFF87F8DFFF87F8DFFF87F8DFFF87F8E0FF87F8E0FF87F8E0FF
          87F8E0FF87F8E0FF87F8E1FF87F8E1FF87F8E1FF87F8E1FF87F9E1FF87F9E2FF
          87F9E2FF87F9E2FF87F9E2FF87F9E2FF87F9E3FF87F9E3FF87F9E3FF87F9E3FF
          87F9E3FF87F9E3FF87F9E3FF87F9E3FF87F9E3FF87F9E4FF87F9E4FF87F9E4FF
          87F9E4FF87F9E4FF87F9E5FF87F9E5FF87F9E5FF87F9E5FF87F9E5FF87FAE5FF
          87FAE6FF87FAE6FF87FAE6FF87FAE6FF87FAE6FF87FAE6FF87FAE7FF87FAE7FF
          87FAE7FF87FAE7FF87FAE7FF87FAE7FF87FAE8FF87FAE8FF87FAE8FF87FAE8FF
          87FAE8FF87FAE8FF87FAE9FF87FAE9FF87FAE9FF87FAE9FF87FAE9FF87FAE9FF
          87FAEAFF87FAEAFF87FAEAFF87FBEAFF87FBEAFF87FBEAFF87FBEAFF87FBEBFF
          87FBEBFF87FBEBFF94FBEDFFB9FCF3FF24F7DBFF0D816D980000003800000021
          0000001108241F07031D19020000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000062F25010B3329050000000E0000001D
          04362A540AEBB4F975F6D7FF8BF8DEFF8BF8DEFF8BF8DEFF8BF8DEFF8BF8DEFF
          8BF8DEFF8BF8DEFF8BF9DFFF8BF9DFFF8BF9DFFF8BF9DFFF8BF9DFFF8BF9E0FF
          8BF9E0FF8BF9E0FF8BF9E0FF8BF9E0FF8BF9E1FF8BF9E1FF8BF9E1FF8BF9E1FF
          8BF9E1FF8BF9E2FF8BF9E2FF8BF9E2FF8BF9E2FF8BF9E2FF8BF9E3FF8BF9E3FF
          8BF9E3FF8BF9E3FF8BF9E3FF8BF9E3FF8BF9E3FF8BF9E3FF8BF9E4FF8BF9E4FF
          8BF9E4FF8BF9E4FF8BF9E4FF8BFAE4FF8BFAE5FF8BFAE5FF8BFAE5FF8BFAE5FF
          8BFAE5FF8BFAE6FF8BFAE6FF8BFAE6FF8BFAE6FF8BFAE6FF8BFAE6FF8BFAE7FF
          8BFAE7FF8BFAE7FF8BFAE7FF8BFAE7FF8BFAE7FF8BFAE8FF8BFAE8FF8BFAE8FF
          8BFAE8FF8BFAE8FF8BFAE8FF8BFAE9FF8BFAE9FF8BFAE9FF8BFAE9FF8BFAE9FF
          8BFBE9FF8BFBE9FF8BFBE9FF8BFBE9FF8BFBEAFF8BFBEAFF8BFBEAFF8BFBEAFF
          8BFBEAFF8BFBEAFF8BFBEAFF8BFBEBFF8BFBEBFF8BFBEBFF8BFBEBFF8BFBEBFF
          8BFBEBFF91FBECFFBCFDF4FF54F9E3FF0ABFA3CC0000003F0000002700000015
          030C0B0906252103000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000009382D0208241D0700000011
          00000021087E638716F1BDFF85F8DCFF8EF8E0FF8EF8E0FF8EF8E0FF8EF8E0FF
          8EF8E0FF8EF9E0FF8EF9E0FF8EF9E0FF8EF9E1FF8EF9E1FF8EF9E1FF8EF9E1FF
          8EF9E1FF8EF9E2FF8EF9E2FF8EF9E2FF8EF9E2FF8EF9E2FF8EF9E3FF8EF9E3FF
          8EF9E3FF8EF9E3FF8EF9E3FF8EF9E4FF8EF9E4FF8EFAE4FF8EFAE4FF8EFAE4FF
          8EFAE4FF8EFAE4FF8EFAE4FF8EFAE5FF8EFAE5FF8EFAE5FF8EFAE5FF8EFAE5FF
          8EFAE6FF8EFAE6FF8EFAE6FF8EFAE6FF8EFAE6FF8EFAE6FF8EFAE7FF8EFAE7FF
          8EFAE7FF8EFAE7FF8EFAE7FF8EFAE8FF8EFAE8FF8EFAE8FF8EFAE8FF8EFAE8FF
          8EFBE8FF8EFBE8FF8EFBE8FF8EFBE8FF8EFBE8FF8EFBE9FF8EFBE9FF8EFBE9FF
          8EFBE9FF8EFBE9FF8EFBEAFF8EFBEAFF8EFBEAFF8EFBEAFF8EFBEAFF8EFBEAFF
          8EFBEAFF8EFBEBFF8EFBEBFF8EFBEBFF8EFBEBFF8EFBEBFF8EFBEBFF8EFBECFF
          8EFBECFF8EFBECFF8EFBECFF8EFBECFF8EFBECFF8EFBECFF8EFBECFF8EFBECFF
          8FFBECFFB7FCF3FF80FAEAFF08E8C9EC06241D540000002D000000190000000C
          0A2C280402181501000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000D40340304130F09
          000000150000002607A47FB329F3C4FF90F9E0FF92F9E1FF92F9E1FF92F9E1FF
          92F9E2FF92F9E2FF92F9E2FF92F9E2FF92F9E2FF92F9E2FF92F9E2FF92F9E2FF
          92FAE3FF92FAE3FF92FAE3FF92FAE3FF92FAE3FF92FAE4FF92FAE4FF92FAE4FF
          92FAE4FF92FAE4FF92FAE4FF92FAE4FF92FAE5FF92FAE5FF92FAE5FF92FAE5FF
          92FAE5FF92FAE5FF92FAE6FF92FAE6FF92FAE6FF92FAE6FF92FAE6FF92FAE7FF
          92FAE7FF92FAE7FF92FAE7FF92FAE7FF92FBE7FF92FBE7FF92FBE7FF92FBE7FF
          92FBE8FF92FBE8FF92FBE8FF92FBE8FF92FBE8FF92FBE8FF92FBE9FF92FBE9FF
          92FBE9FF92FBE9FF92FBE9FF92FBE9FF92FBEAFF92FBEAFF92FBEAFF92FBEAFF
          92FBEAFF92FBEAFF92FBEAFF92FBEAFF92FBEAFF92FBEBFF92FBEBFF92FBEBFF
          92FBEBFF92FBEBFF92FBEBFF92FCECFF92FCECFF92FCECFF92FCECFF92FCECFF
          92FCECFF92FCECFF92FCEDFF92FCEDFF92FCEDFF92FCEDFF92FCEDFF92FCEDFF
          B2FCF2FF9BFCEFFF0BF4D4FA073F366E000000320000001D0000000F09242006
          041F1B0100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000631260110473904
          0514110B000000170213103006CF9FD437F5C9FF95FAE2FF96FAE2FF96FAE3FF
          96FAE3FF96FAE3FF96FAE3FF96FAE3FF96FAE4FF96FAE4FF96FAE4FF96FAE4FF
          96FAE4FF96FAE4FF96FAE4FF96FAE4FF96FAE5FF96FAE5FF96FAE5FF96FAE5FF
          96FAE5FF96FAE6FF96FAE6FF96FAE6FF96FAE6FF96FAE6FF96FBE6FF96FBE6FF
          96FBE6FF96FBE7FF96FBE7FF96FBE7FF96FBE7FF96FBE7FF96FBE7FF96FBE8FF
          96FBE8FF96FBE8FF96FBE8FF96FBE8FF96FBE8FF96FBE9FF96FBE9FF96FBE9FF
          96FBE9FF96FBE9FF96FBE9FF96FBE9FF96FBE9FF96FBEAFF96FBEAFF96FBEAFF
          96FBEAFF96FBEAFF96FBEAFF96FBEAFF96FBEBFF96FBEBFF96FCEBFF96FCEBFF
          96FCEBFF96FCEBFF96FCEBFF96FCEBFF96FCEBFF96FCECFF96FCECFF96FCECFF
          96FCECFF96FCECFF96FCECFF96FCEDFF96FCEDFF96FCEDFF96FCEDFF96FCEDFF
          96FCEDFF96FCEDFF96FCEEFF96FCEEFF96FCEEFF96FCEEFF96FCEEFFAFFCF2FF
          A9FCF1FF10F8D9FE0D7C688F000000360000002100000012071A170707262102
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000008372C01
          0C372D050000000D0000001A04241D3E04DEACE443F6CDFF99FBE4FF99FBE4FF
          99FBE4FF99FBE5FF99FBE5FF99FBE5FF99FBE5FF99FBE5FF99FBE5FF99FBE5FF
          99FBE6FF99FBE6FF99FBE6FF99FBE6FF99FBE6FF99FBE7FF99FBE7FF99FBE7FF
          99FBE7FF99FBE7FF99FBE7FF99FBE7FF99FBE7FF99FBE7FF99FBE8FF99FBE8FF
          99FBE8FF99FBE8FF99FBE8FF99FBE8FF99FBE9FF99FBE9FF99FBE9FF99FBE9FF
          99FBE9FF99FBE9FF99FBE9FF99FBE9FF99FBEAFF99FBEAFF99FBEAFF99FBEAFF
          99FCEAFF99FCEAFF99FCEBFF99FCEBFF99FCEBFF99FCEBFF99FCEBFF99FCEBFF
          99FCEBFF99FCEBFF99FCEBFF99FCECFF99FCECFF99FCECFF99FCECFF99FCECFF
          99FCECFF99FCEDFF99FCEDFF99FCEDFF99FCEDFF99FCEDFF99FCEDFF99FCEDFF
          99FCEDFF99FCEDFF99FCEDFF99FCEEFF99FCEEFF99FCEEFF99FCEEFF99FCEEFF
          99FCEEFF99FCEEFF99FCEEFF99FCEFFF99FCEFFF99FCEFFFACFDF2FFB0FDF2FF
          15F9DAFF0D9B85A8000000390000002400000013030D0C09092A250300000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0A3D31020E3A2F060000000E0000001C042F254E03E8B4EF4FF7D1FF9DFBE5FF
          9DFBE6FF9DFBE6FF9DFBE6FF9DFBE6FF9DFBE6FF9DFBE6FF9DFBE6FF9DFBE7FF
          9DFBE7FF9DFBE7FF9DFBE7FF9DFBE7FF9DFBE8FF9DFBE8FF9DFBE8FF9DFBE8FF
          9DFBE8FF9DFBE8FF9DFBE8FF9DFBE8FF9DFBE8FF9DFBE9FF9DFCE9FF9DFCE9FF
          9DFCE9FF9DFCE9FF9DFCE9FF9DFCE9FF9DFCE9FF9DFCE9FF9DFCEAFF9DFCEAFF
          9DFCEAFF9DFCEAFF9DFCEAFF9DFCEBFF9DFCEBFF9DFCEBFF9DFCEBFF9DFCEBFF
          9DFCEBFF9DFCEBFF9DFCEBFF9DFCEBFF9DFCECFF9DFCECFF9DFCECFF9DFCECFF
          9DFCECFF9DFCECFF9DFCEDFF9DFCEDFF9DFCEDFF9DFCEDFF9DFCEDFF9DFCEDFF
          9DFCEDFF9DFCEDFF9DFCEDFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEEFF
          9DFCEEFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEFFF9DFCEFFF
          9DFCEFFF9DFCEFFF9DFCEFFF9DFCEFFF9DFCEFFFADFDF2FFB4FDF3FF1AF9DBFF
          0BB097BE0000003B0000002600000015040E0C0A0B2E2904031C180100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000C4034020F3C3207000000100000001D04362B5403ECB7F35DF8D5FF
          A1FBE7FFA1FBE7FFA1FBE7FFA1FBE7FFA1FCE8FFA1FCE8FFA1FCE8FFA1FCE8FF
          A1FCE8FFA1FCE8FFA1FCE8FFA1FCE8FFA1FCE9FFA1FCE9FFA1FCE9FFA1FCE9FF
          A1FCE9FFA1FCE9FFA1FCE9FFA1FCE9FFA1FCEAFFA1FCEAFFA1FCEAFFA1FCEAFF
          A1FCEAFFA1FCEAFFA1FCEBFFA1FCEBFFA1FCEBFFA1FCEBFFA1FCEBFFA1FCEBFF
          A1FCEBFFA1FCEBFFA1FCEBFFA1FCECFFA1FCECFFA1FCECFFA1FCECFFA1FCECFF
          A1FCECFFA1FCECFFA1FCECFFA1FCECFFA1FCEDFFA1FCEDFFA1FCEDFFA1FCEDFF
          A1FCEDFFA1FCEDFFA1FCEDFFA1FCEDFFA1FCEDFFA1FCEEFFA1FCEEFFA1FCEEFF
          A1FCEEFFA1FCEEFFA1FCEEFFA1FCEFFFA1FCEFFFA1FCEFFFA1FCEFFFA1FDEFFF
          A1FDEFFFA1FDEFFFA1FDEFFFA1FDEFFFA1FDEFFFA1FDEFFFA1FDF0FFA1FDF0FF
          A1FDF0FFA1FDF0FFA1FDF0FFA1FDF0FFB1FDF3FFB7FDF4FF1CF9DCFF0BB99FC4
          0106053E0000002700000016040E0D0B0C322C0404201B010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000C4337020F3E3307000000100000001E0645375B04ECB9F3
          60F9D7FFA4FCE8FFA4FCE8FFA4FCE8FFA4FCE8FFA4FCE9FFA4FCE9FFA4FCE9FF
          A4FCE9FFA4FCE9FFA4FCE9FFA4FCE9FFA4FCE9FFA4FCEAFFA4FCEAFFA4FCEAFF
          A4FCEAFFA4FCEAFFA4FCEAFFA4FCEAFFA4FCEAFFA4FCEAFFA4FCEBFFA4FCEBFF
          A4FCEBFFA4FCEBFFA4FCEBFFA4FCEBFFA4FCECFFA4FCECFFA4FCECFFA4FCECFF
          A4FCECFFA4FCECFFA4FCECFFA4FCECFFA4FCECFFA4FCEDFFA4FCEDFFA4FCEDFF
          A4FCEDFFA4FCEDFFA4FCEDFFA4FCEDFFA4FCEDFFA4FCEDFFA4FDEEFFA4FDEEFF
          A4FDEEFFA4FDEEFFA4FDEEFFA4FDEEFFA4FDEEFFA4FDEEFFA4FDEEFFA4FDEEFF
          A4FDEFFFA4FDEFFFA4FDEFFFA4FDEFFFA4FDEFFFA4FDEFFFA4FDEFFFA4FDEFFF
          A4FDEFFFA4FDF0FFA4FDF0FFA4FDF0FFA4FDF0FFA4FDF0FFA4FDF0FFA4FDF0FF
          A4FDF0FFA4FDF1FFA4FDF1FFB7FDF4FFB2FDF3FF1AFADCFF0ABBA1C70209073E
          00000028000000170000000C0825210504221E01000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000E45390304131008000000100000001D04382C54
          04EBB8F059F9D6FFA7FCE9FFA7FCE9FFA7FDEAFFA7FDEAFFA7FDEAFFA7FDEAFF
          A7FDEAFFA7FDEAFFA7FDEAFFA7FDEAFFA7FDEAFFA7FDEBFFA7FDEBFFA7FDEBFF
          A7FDEBFFA7FDEBFFA7FDEBFFA7FDEBFFA7FDEBFFA7FDEBFFA7FDECFFA7FDECFF
          A7FDECFFA7FDECFFA7FDECFFA7FDEDFFA7FDEDFFA7FDEDFFA7FDEDFFA7FDEDFF
          A7FDEDFFA7FDEDFFA7FDEDFFA7FDEDFFA7FDEEFFA7FDEEFFA7FDEEFFA7FDEEFF
          A7FDEEFFA7FDEEFFA7FDEEFFA7FDEEFFA7FDEEFFA7FDEEFFA7FDEFFFA7FDEFFF
          A7FDEFFFA7FDEFFFA7FDEFFFA7FDEFFFA7FDEFFFA7FDEFFFA7FDEFFFA7FDEFFF
          A7FDF0FFA7FDF0FFA7FDF0FFA7FDF0FFA7FDF0FFA7FDF0FFA7FDF0FFA7FDF0FF
          A7FDF0FFA7FDF0FFA7FDF1FFA7FDF1FFA7FDF1FFA7FDF1FFA7FDF1FFA7FDF1FF
          A7FDF1FFA7FDF1FFBFFDF5FFA8FDF1FF14FADBFF0BB59CC00209073D00000027
          000000170000000C092622050524200100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000F473A030B2A2307000000100000001D
          0430274D05E5B4E553FAD6FFABFDEBFFABFDEBFFABFDEBFFABFDEBFFABFDEBFF
          ABFDEBFFABFDECFFABFDECFFABFDECFFABFDECFFABFDECFFABFDECFFABFDECFF
          ABFDECFFABFDECFFABFDEDFFABFDEDFFABFDEDFFABFDEDFFABFDEDFFABFDEDFF
          ABFDEDFFABFDEDFFABFDEEFFABFDEEFFABFDEEFFABFDEEFFABFDEEFFABFDEEFF
          ABFDEEFFABFDEEFFABFDEEFFABFDEEFFABFDEFFFABFDEFFFABFDEFFFABFDEFFF
          ABFDEFFFABFDEFFFABFDEFFFABFDEFFFABFDEFFFABFDEFFFABFDF0FFABFDF0FF
          ABFDF0FFABFDF0FFABFDF0FFABFDF0FFABFDF0FFABFDF0FFABFDF0FFABFDF1FF
          ABFDF1FFABFDF1FFABFDF1FFABFDF1FFABFDF1FFABFDF1FFABFDF1FFABFDF1FF
          ABFDF1FFABFDF1FFABFDF2FFABFDF2FFABFDF2FFABFDF2FFABFDF2FFABFDF2FF
          ADFDF2FFC6FDF6FF99FDEFFF0BFADAFF0CA790B2010303390000002500000016
          0000000C09272305052621010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000010473A03124036070000000F
          0000001B05251E3C07D5A8D34CFAD4FFAEFDECFFAEFDECFFAEFDECFFAEFDECFF
          AEFDEDFFAEFDEDFFAEFDEDFFAEFDEDFFAEFDEDFFAEFDEDFFAEFDEDFFAEFDEDFF
          AEFDEDFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFF
          AEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEEFFAEFDEFFFAEFDEFFFAEFDEFFF
          AEFDEFFFAEFDEFFFAEFDEFFFAEFDEFFFAEFDEFFFAEFDEFFFAEFDF0FFAEFDF0FF
          AEFDF0FFAEFDF0FFAEFDF0FFAEFDF0FFAEFDF0FFAEFDF0FFAEFDF0FFAEFDF0FF
          AEFDF1FFAEFDF1FFAEFDF1FFAEFDF1FFAEFDF1FFAEFDF1FFAEFDF1FFAEFDF1FF
          AEFDF1FFAEFDF1FFAEFEF2FFAEFEF2FFAEFEF2FFAEFEF2FFAEFEF2FFAEFEF2FF
          AEFEF2FFAEFEF2FFAEFEF2FFAEFEF2FFAEFEF2FFAEFEF3FFAEFEF3FFB4FEF4FF
          CFFEF8FF83FCECFF05FAD8FD0F907996000000350000002400000015040F0E0B
          0927230505262201000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000010463A02123F3507
          0000000E000000190315112E08AD89B33BFAD2FFAAFDEBFFB1FDEDFFB1FDEEFF
          B1FDEEFFB1FDEEFFB1FDEEFFB1FDEEFFB1FDEEFFB1FDEEFFB1FDEEFFB1FDEEFF
          B1FDEEFFB1FDEEFFB1FDEEFFB1FDEFFFB1FDEFFFB1FDEFFFB1FDEFFFB1FDEFFF
          B1FDEFFFB1FDEFFFB1FDEFFFB1FDEFFFB1FDF0FFB1FDF0FFB1FDF0FFB1FDF0FF
          B1FDF0FFB1FDF0FFB1FDF0FFB1FDF0FFB1FDF0FFB1FDF0FFB1FDF1FFB1FDF1FF
          B1FDF1FFB1FDF1FFB1FDF1FFB1FDF1FFB1FDF1FFB1FDF1FFB1FDF1FFB1FDF1FF
          B1FDF2FFB1FDF2FFB1FDF2FFB1FDF2FFB1FDF2FFB1FDF2FFB1FDF2FFB1FDF2FF
          B1FDF2FFB1FEF2FFB1FEF2FFB1FEF2FFB1FEF2FFB1FEF3FFB1FEF3FFB1FEF3FF
          B1FEF3FFB1FEF3FFB1FEF3FFB1FEF3FFB1FEF3FFB1FEF3FFC0FEF5FFD0FEF8FF
          5AFCE6FF05F3D2F30B5D4F75000000320000002100000013040F0E0A0D373104
          0526210100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000010453902
          133D34060000000C00000016000000240B866B8423F6C9F99DFDE9FFB4FEEEFF
          B4FEEEFFB4FEEEFFB4FEEEFFB4FEEEFFB4FEEEFFB4FEEFFFB4FEEFFFB4FEEFFF
          B4FEEFFFB4FEEFFFB4FEEFFFB4FEEFFFB4FEEFFFB4FEF0FFB4FEF0FFB4FEF0FF
          B4FEF0FFB4FEF0FFB4FEF0FFB4FEF0FFB4FEF0FFB4FEF0FFB4FEF0FFB4FEF0FF
          B4FEF0FFB4FEF1FFB4FEF1FFB4FEF1FFB4FEF1FFB4FEF1FFB4FEF1FFB4FEF1FF
          B4FEF1FFB4FEF1FFB4FEF1FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FF
          B4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FFB4FEF2FF
          B4FEF2FFB4FEF3FFB4FEF3FFB4FEF3FFB4FEF3FFB4FEF3FFB4FEF3FFB4FEF3FF
          B4FEF3FFB4FEF3FFB4FEF3FFB4FEF3FFB7FEF4FFCBFEF7FFBCFDF5FF2EFCE0FF
          09DDBDDA073028560000002C0000001D00000011040F0D090D36300405262101
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          104237011B5347040816130A000000120000001F063B305112E1B6DB78FDE1FF
          B7FEEFFFB7FEEFFFB7FEEFFFB7FEEFFFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FF
          B7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FF
          B7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FF
          B7FEF1FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FF
          B7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF3FFB7FEF3FF
          B7FEF3FFB7FEF3FFB7FEF3FFB7FEF3FFB7FEF3FFB7FEF3FFB7FEF3FFB7FEF3FF
          B7FEF3FFB7FEF4FFB7FEF4FFB7FEF4FFB7FEF4FFB7FEF4FFB7FEF4FFB7FEF4FF
          B7FEF4FFB7FEF4FFB7FEF4FFC4FEF6FFD5FEF8FF8CFDEEFF0DFBDBFD0DA38BA9
          030C0A3B00000027000000190000000F09201C070C342E0304241F0100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000103F35011B4F440408151208000000100000001A0313102C0A9C7D9E
          46F8D4FAADFDEDFFB9FEF0FFB9FEF0FFB9FEF0FFB9FEF0FFB9FEF0FFB9FEF0FF
          B9FEF1FFB9FEF1FFB9FEF1FFB9FEF1FFB9FEF1FFB9FEF1FFB9FEF1FFB9FEF1FF
          B9FEF1FFB9FEF1FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FF
          B9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF2FFB9FEF3FF
          B9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FF
          B9FEF3FFB9FEF3FFB9FEF3FFB9FEF3FFB9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FF
          B9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FFB9FEF4FF
          B9FEF5FFC0FEF6FFD2FEF8FFC3FEF6FF41FDE3FF09E8C7E20A51456C0000002F
          00000021000000150000000C0D2E29060A322C02000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000019493F02194038060000000C0000001500000020
          073A2F4D19CFAAC977FDE2FFBCFEF1FFBCFEF1FFBCFEF1FFBCFEF1FFBCFEF1FF
          BCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FF
          BCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF2FFBCFEF3FFBCFEF3FFBCFEF3FF
          BCFEF3FFBCFEF3FFBCFEF3FFBCFEF3FFBCFEF3FFBCFEF3FFBCFEF3FFBCFEF3FF
          BCFEF3FFBCFEF3FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FF
          BCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FFBCFEF4FF
          BCFEF5FFBCFEF5FFBCFEF5FFBCFEF5FFBCFEF5FFBCFEF5FFBCFEF5FFC1FEF5FF
          D0FEF8FFD5FFF9FF76FDEBFF0FF8D7F80D947D9B030C0A3A000000270000001A
          0000001105100F09113C3604082D270100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000016433901215248040916130900000010
          00000019000000240A715C7633F0CAEC92FEE9FFBFFEF2FFBFFEF2FFBFFEF2FF
          BFFEF2FFBFFEF2FFBFFEF2FFBFFEF2FFBFFEF2FFBFFEF2FFBFFEF3FFBFFEF3FF
          BFFEF3FFBFFEF3FFBFFEF3FFBFFEF3FFBFFEF3FFBFFEF3FFBFFEF3FFBFFEF3FF
          BFFEF3FFBFFEF3FFBFFEF3FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FF
          BFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FFBFFEF4FF
          BFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FF
          BFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFBFFEF5FFC4FEF6FFD0FEF8FFD7FFF9FF
          8DFEEEFF22FDDFFF0BC3A7C4072E28520000002C0000001F000000140000000C
          10322D060E363003062722010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000133B32011D4941021C403906
          0B18150B000000120000001D051E19330A9579953CF5D1F39AFEEBFFC1FFF3FF
          C1FFF3FFC1FFF3FFC1FFF3FFC1FFF3FFC1FFF3FFC1FFF3FFC1FFF3FFC1FFF3FF
          C1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FF
          C1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF4FFC1FFF5FFC1FFF5FF
          C1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FF
          C1FFF5FFC1FFF5FFC1FFF5FFC1FFF5FFC1FFF6FFC1FFF6FFC1FFF6FFC1FFF6FF
          C1FFF6FFC1FFF6FFC1FFF6FFC9FFF7FFD4FFF9FFD7FFF9FF8AFEEEFF22FDDFFF
          0CDDBDD50B5D4E6F0000003000000022000000180000000F06110F09143E3804
          0B2F2A0100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000018403801
          22504703142D28070000000D000000150000001E06221C360994789431F3CDEF
          7EFEE6FFBFFFF2FFC4FFF3FFC4FFF4FFC4FFF4FFC3FFF4FFC3FFF4FFC3FFF4FF
          C3FFF4FFC3FFF4FFC3FFF4FFC3FFF4FFC3FFF4FFC3FFF4FFC3FFF4FFC3FFF4FF
          C3FFF4FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FF
          C3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF5FFC3FFF6FF
          C3FFF6FFC3FFF6FFC3FFF6FFC3FFF6FFC3FFF6FFC3FFF6FFC3FFF6FFC3FFF6FF
          C7FFF6FFCFFFF8FFD8FFF9FFC8FFF7FF76FEEBFF1BFDDDFE0CD9B9CF0C615272
          00000030000000240000001A000000110712110A10312C060F36300200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000001C463D0226554C04162F2A080000000E000000150000001E0414102D
          08745F801EE5BEDA58FEDFFF9AFEECFFC6FFF4FFC8FFF5FFC7FFF4FFC7FFF4FF
          C6FFF4FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FF
          C6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF5FFC6FFF6FF
          C6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FF
          C6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFC6FFF6FFCAFFF7FFD0FFF8FFD8FFF9FF
          D6FFF9FF98FEF0FF45FEE4FF07FAD7F80BB99EB70C4D41600000002E00000024
          0000001A000000120714120B12353006123C3503092C27010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000001D49410227584E0416302B080000000E00000014
          0000001C000000250A4D405608A688A81DF2CBED55FEE0FF8AFEE9FFBDFFF3FF
          CBFFF6FFCBFFF6FFCAFFF5FFC9FFF5FFC9FFF5FFC8FFF5FFC8FFF5FFC8FFF5FF
          C8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FF
          C8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FFC8FFF6FF
          C9FFF6FFCCFFF7FFD0FFF8FFD5FFF9FFDAFFF9FFC9FFF7FF87FFEEFF49FEE4FF
          0BFDDAFD0EE3C2D50979678B061F1A3F0000002A000000210000001800000011
          0714120B13383206134039030B312B0100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000001C49400226574E04142E2907
          0000000C000000120000001800000020000000270C604F65089F82A10DECC3E2
          29FED9FE55FEE1FF7CFEE8FFA6FFEFFFC6FFF5FFD0FFF7FFCFFFF7FFCFFFF6FF
          CEFFF6FFCEFFF7FFCDFFF7FFCDFFF6FFCDFFF6FFCCFFF6FFCCFFF6FFCCFFF6FF
          CDFFF7FFCEFFF7FFCFFFF7FFD0FFF8FFD1FFF8FFD4FFF8FFD6FFF8FFD9FFF9FF
          D0FFF8FFB3FFF4FF84FFECFF56FFE6FF22FFDEFF04FBD6F80EDBB9CA0777658D
          093028490000002C000000240000001C000000150000000F0714120A12383206
          124039030A322C01000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000018443C01
          215249031D453D060A1816090000000E00000013000000190000001F00000026
          0A3B314409705D7D08AC8EAA0BEBC3DE02FBD0FA0FFED6FF2AFEDBFF45FFE0FF
          5CFFE4FF74FFE8FF82FFEAFF8BFFECFF9AFFEEFF9CFFEFFF9FFFEFFFA0FFEFFF
          9DFFF0FF94FFEEFF89FFEDFF7EFFEBFF68FFE8FF51FFE5FF37FFE1FF13FFDBFF
          00FFD9FF08F6D1F00FDEBCCC068773970E64546C041310360000002900000023
          0000001C00000016000000100000000C0D282408174B43050F3D3602092F2901
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000113C34011949400221574D04112D28060A19160A0000000E00000012
          000000160000001B00000020000000260000002A0E5648560B6E5C7A057A6690
          07A68AA70ED6B3C20EE4C0D30BEFC8E40AF1CAE907F8D0F307F8D1F307F8D1F3
          08F7D0F10CEFCAE40DECC8DF0FE3BFD00FCCABB80387729B097663880E695871
          092E26410000002D00000028000000230000001E000000190000001400000010
          0000000C0D2B2608103A340511433C030B362F01000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000E3D3401154A41021C574C0318483F05
          11322C080A1B180B0000000E0000001100000015000000180000001B0000001E
          00000021000000230000002500000027000000290000002A0000002B0000002B
          0000002A0000002A00000028000000270000002500000022000000200000001D
          0000001A0000001600000013000000100000000D0E302B0A0B2A260716534A04
          10453D0309383101000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0D443901114F4402165B4F0312483F050B312A070E342D09081B180A0000000C
          0000000E00000010000000110000001200000014000000140000001400000014
          00000014000000140000001300000012000000110000000F0000000D0000000C
          0D332D0A0A2F2908082B260613574C040E4C43020A4037020000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000006453A01094F43020B574A02
          0E5C4F0311615304136355050C493F05052F2806062F2806062F2807062E2707
          062E2806052E2706042D26060B463C05105E51040D5A4D030B544802084D4202
          06443A0100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC001FFFFFFFFFFFFFFFFFFFFFFFFFFE0000007FFFFFFFFFFFFFFFFFFFF
          FFFE000000007FFFFFFFFFFFFFFFFFFFFFF00000000007FFFFFFFFFFFFFFFFFF
          FF800000000000FFFFFFFFFFFFFFFFFFFE0000000000003FFFFFFFFFFFFFFFFF
          F00000000000000FFFFFFFFFFFFFFFFFC000000000000003FFFFFFFFFFFFFFFF
          8000000000000000FFFFFFFFFFFFFFFE00000000000000007FFFFFFFFFFFFFFC
          00000000000000001FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFE0
          000000000000000003FFFFFFFFFFFFC0000000000000000001FFFFFFFFFFFF00
          000000000000000000FFFFFFFFFFFE000000000000000000007FFFFFFFFFFC00
          0000000000000000003FFFFFFFFFF8000000000000000000000FFFFFFFFFF000
          00000000000000000007FFFFFFFFE00000000000000000000007FFFFFFFFC000
          00000000000000000003FFFFFFFF800000000000000000000001FFFFFFFF8000
          00000000000000000000FFFFFFFF0000000000000000000000007FFFFFFE0000
          000000000000000000003FFFFFFC0000000000000000000000003FFFFFFC0000
          000000000000000000001FFFFFF80000000000000000000000000FFFFFF00000
          000000000000000000000FFFFFF000000000000000000000000007FFFFE00000
          0000000000000000000007FFFFE000000000000000000000000003FFFFC00000
          0000000000000000000001FFFF8000000000000000000000000001FFFF800000
          0000000000000000000000FFFF8000000000000000000000000000FFFF000000
          0000000000000000000000FFFF00000000000000000000000000007FFE000000
          00000000000000000000007FFE00000000000000000000000000003FFE000000
          00000000000000000000003FFC00000000000000000000000000003FFC000000
          00000000000000000000001FFC00000000000000000000000000001FF8000000
          00000000000000000000001FF800000000000000000000000000001FF8000000
          00000000000000000000000FF800000000000000000000000000000FF0000000
          00000000000000000000000FF000000000000000000000000000000FF0000000
          00000000000000000000000FF0000000000000000000000000000007F0000000
          000000000000000000000007F0000000000000000000000000000007F0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007E0000000000000000000000000000007E0000000
          000000000000000000000007F0000000000000000000000000000007F0000000
          000000000000000000000007F0000000000000000000000000000007F0000000
          000000000000000000000007F0000000000000000000000000000007F0000000
          00000000000000000000000FF000000000000000000000000000000FF8000000
          00000000000000000000000FF800000000000000000000000000000FF8000000
          00000000000000000000000FF800000000000000000000000000001FFC000000
          00000000000000000000001FFC00000000000000000000000000001FFC000000
          00000000000000000000003FFC00000000000000000000000000003FFE000000
          00000000000000000000003FFE00000000000000000000000000007FFF000000
          00000000000000000000007FFF00000000000000000000000000007FFF000000
          0000000000000000000000FFFF8000000000000000000000000000FFFF800000
          0000000000000000000001FFFFC000000000000000000000000001FFFFC00000
          0000000000000000000003FFFFE000000000000000000000000003FFFFE00000
          0000000000000000000007FFFFF000000000000000000000000007FFFFF80000
          000000000000000000000FFFFFF80000000000000000000000001FFFFFFC0000
          000000000000000000001FFFFFFE0000000000000000000000003FFFFFFE0000
          000000000000000000007FFFFFFF000000000000000000000000FFFFFFFF8000
          00000000000000000000FFFFFFFFC00000000000000000000001FFFFFFFFE000
          00000000000000000003FFFFFFFFF00000000000000000000007FFFFFFFFF800
          0000000000000000000FFFFFFFFFFC000000000000000000001FFFFFFFFFFE00
          0000000000000000003FFFFFFFFFFF000000000000000000007FFFFFFFFFFF80
          000000000000000000FFFFFFFFFFFFC0000000000000000003FFFFFFFFFFFFF0
          000000000000000007FFFFFFFFFFFFF800000000000000000FFFFFFFFFFFFFFC
          00000000000000003FFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF
          C000000000000001FFFFFFFFFFFFFFFFF000000000000007FFFFFFFFFFFFFFFF
          FC0000000000001FFFFFFFFFFFFFFFFFFF0000000000007FFFFFFFFFFFFFFFFF
          FFC00000000003FFFFFFFFFFFFFFFFFFFFF8000000001FFFFFFFFFFFFFFFFFFF
          FFFF80000001FFFFFFFFFFFFFFFFFFFFFFFFFC00003FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF28000000
          3000000060000000010020000000000080250000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000002000000060000000B0000001000000015
          000000170000001700000015000000110000000C000000070000000300000001
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000030000000A000000160000002600000036000000460007055800130E6D
          00170F7500170F7500120D6D00050358000000480000003A0000002900000019
          0000000C00000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000400000010
          0000002500010141001A117505422BAC166B4BD61D8760F01B9467FE199566FF
          169566FF139465FF109465FF0D9264FD0B825AED056546D201402CA900160F73
          000000460000002A000000130000000600000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000020000000D0000002600090653
          05402AA6217F5AE526996BFE1E9666FF0A8E5AFE008A55FE008B56FF008C58FE
          008D59FE008E5BFF008F5DFE00915EFE009260FF039464FE059667FE039566FD
          017652DF003B2AA1000503560000002D00000011000000030000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010005000000190004034406422BA62B9168F3
          279B6BFF078D56FE008A53FE008B54FF008C55FE008D57FE008E58FF008F5AFE
          00905CFE00915DFF00925FFE009461FE009563FF009664FE009766FE009868FF
          009A6AFE009B6CFF008960EE013B2B9F0001004A000000200000000800000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000002010900000025001C127022835BE62D9E6EFF048C54FF
          008B52FF008C54FF008D55FF008E57FF008F58FF00905AFF00915CFF00925DFF
          00935FFF009461FF009562FF009764FF009866FF009967FF009A69FF009B6BFF
          009D6DFF009E6FFF009F71FF00A072FF017A59DC00140F6F0000002E0000000D
          0000000100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001010B0000002E063D2899339D71F913945EFE008C53FE008D54FE
          008E56FF008F57FE009058FE00915AFF00925BFE00935DFE00945FFF009560FE
          009662FE009864FF009965FE009A67FE009B69FF009C6AFE009D6CFE009F6EFF
          00A070FE00A172FF00A274FE00A375FE00A477FF009970F40132259100000038
          0000001000000001000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0002010A000000300C5036AF35A476FE059056FF008E54FE008F56FE009057FE
          009159FF00925AFE00935CFE00945DFF00955FFE009660FE009762FF009863FE
          009965FE009B67FF009C69FE009D6AFE009E6CFF009F6EFE00A070FE00A171FF
          00A373FE00A475FF00A577FE00A679FE00A77BFF00A97CFE00A67CFC014232A2
          0000003A00000010000000010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000030208
          0000002C0D563AB333A677FF009156FF009157FF009258FF00935AFF00945BFF
          00955CFF00965EFF00975FFF009861FF009963FF009A64FF009B66FF009C68FF
          009D69FF009E6BFF009F6CFF00A06EFF00A270FF00A372FF00A473FF00A575FF
          00A677FF00A778FF00A97AFF00AA7CFF00AB7EFF00AC80FF00AD82FF00AE83FE
          014837A4000000370001010D0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000003020400000021
          08462E9D35A879FE009358FF009359FE00945AFF00955CFE00965DFE00975EFE
          009860FF009961FE009A63FE009B65FF009C66FE009D68FE009E69FF009F6BFE
          00A06CFE00A16EFF00A270FE00A472FE00A573FF00A675FE00A777FE00A879FF
          00A97BFE00AA7CFF00AB7EFE00AD80FE00AE81FF00AF84FE00B085FE00B287FF
          00B087FC01372B910000002C0001010700000000000000000000000000000000
          0000000000000000000000000000000000000000000201010001011401271971
          35A87AFB03975CFF00965BFF00975CFF00985EFF00995FFF009A61FF009B62FF
          009C64FF009D65FF009E67FF009F68FF00A06AFF00A16BFF00A26DFF00A36FFF
          00A470FF00A572FF00A674FF00A776FF00A877FF00A979FF00AA7BFF00AB7CFF
          00AD7EFF00AE80FF00AF81FF00B083FF00B185FF00B287FF00B489FF00B58BFF
          00B68DFF00AB85F50119136D0000001D00010103000000000000000000000000
          0000000000000000000000000000000000000000000402090008053D27956AEA
          0E9E66FE00995DFE009A5EFF009B60FE009C61FF009D63FE009E64FE009F66FE
          009F67FF00A069FE00A16AFE00A26BFF00A36DFE00A46FFE00A570FF00A672FE
          00A774FE00A975FF00AA77FE00AB79FE00AC7BFF00AD7CFE00AE7EFE00AF80FF
          00B081FE00B183FF00B285FE00B387FE00B589FF00B68AFE00B78CFE00B88EFF
          00B990FE00BA91FE018F70DB000101450001010F000000000000000000000000
          00000000000000000000000000000000000402020001001C0A583CAA28AB78FF
          009C60FE009D61FE009E63FF009F64FE009F65FF00A067FE00A168FE00A26AFE
          00A36BFF00A36CFE009F6AFE009B68FF009C6AFE00A26FFE00A874FF00AA76FE
          00AB78FE00AC7AFF00AD7BFE00AE7DFE00AF7FFF00B080FE00B182FE00B284FF
          00B385FE00B487FF00B589FE00B78BFE00B88CFF00B98FFE00BA90FE00BB92FF
          00BC94FE00BD95FE00BE97FF01483A9B00000028000101040000000000000000
          000000000000000000000000000000000005030900130C4C2EAA7BF701A064FF
          00A064FE00A165FE00A266FF00A368FE00A469FF00A46BFE00A56CFE00A66EFE
          00A66EFF00A06BFE3CAD88FECAE8DEFFCEEAE1FE29A881FE00A573FF00AD79FE
          00AF7BFE00B07DFF00B17FFE00B280FE00B382FF00B484FE00B585FE00B687FF
          00B789FE00B88BFF00B98CFE00BA8EFE00BB90FF00BC92FE00BD93FE00BF95FF
          00C097FE00C198FE00C29AFF01AB89ED0007054F000101100000000000000000
          00000000000000000000000000020101000101190C5F41AB21AF7AFF00A366FF
          00A468FF00A569FF00A66AFF00A76CFF00A76DFF00A86FFF00A970FF00A971FF
          00A26DFF3EAE8AFFF1F9F6FFFFFFFFFFFFFFFFFFE7F4F0FF2AAB84FF00A978FF
          00B17FFF00B381FF00B483FF00B584FF00B686FF00B787FF00B889FF00B98BFF
          00BA8DFF00BB8EFF00BD90FF00BE92FF00BF93FF00C095FF00C197FF00C299FF
          00C29AFF00C49CFF00C49DFF00C59FFF024E3F9C000000240001010200000000
          000000000000000000000000000402040007053527A778F002A86BFE00A86AFF
          00A86CFE00A96DFE00AA6EFF00AB70FE00AC71FF00AC72FE00AC73FE00A56FFE
          3EB18CFFF0F8F6FEFEFEFEFEFFFFFFFFFEFEFEFEFEFEFEFEE5F4EFFF2AAE89FE
          00AE7DFE00B684FF00B886FE00B988FE00BA8AFF00BB8BFE00BC8DFE00BD8FFF
          00BE90FE00BF92FF00C094FE00C195FE00C297FF00C399FE00C49AFE00C59CFF
          00C69DFE00C79FFE00C8A1FF00C9A2FE02A183E00001013E0001010900000000
          0000000000000000000000000004020C0136247625B682FE00AB6DFE00AB6EFF
          00AC70FE00AD71FE00AE72FF00AF74FE00AF75FF00AF76FE00A771FE3CB28CFE
          F1F9F7FFFEFEFEFEFEFEFEFEFFFFFFFFFEFEFEFEFEFEFEFEFFFFFFFFE5F4F0FE
          2AB18CFE00B283FF00BA89FE00BC8CFE00BD8DFF00BE8FFE00BF91FE00C092FF
          00C194FE00C296FF00C397FE00C499FE00C59BFF00C69CFE00C79EFE00C89FFF
          00C9A1FE00CAA2FE00CBA4FF00CBA6FE03CCA7FE01211B6B0000001400000000
          000000000000000000000000000201160F714FB515B57CFF00AF71FF00B072FF
          00B074FF00B175FF00B276FF00B278FF00B278FF00AA74FF3EB48FFFF1F9F7FF
          FFFFFFFFFFFFFFFFFFFFFFFFC9E9E0FFD9EFE9FFFFFFFFFFFFFFFFFFFFFFFFFF
          E7F5F1FF2AB590FF00B788FF00BF8FFF00C191FF00C293FF00C394FF00C496FF
          00C598FF00C699FF00C79BFF00C89CFF00C89EFF00C9A0FF00CAA1FF00CBA3FF
          00CCA4FF00CDA6FF00CEA7FF00CEA9FF05D0ACFF02604EA50000002200000002
          000000000000000000030202000000221FA375E502B375FE00B375FE00B476FF
          00B478FE00B579FE00B67AFF00B57BFE00AE77FF3EB691FEF0F9F6FEFEFEFEFE
          FFFFFFFFFEFEFEFEC7E9E0FE10A97EFF1EAE86FED9F0EAFEFFFFFFFFFEFEFEFE
          FEFEFEFEE5F5F1FF2BB895FE00BB8DFE00C394FF00C596FE00C798FE00C79AFF
          00C89BFE00C99DFF00CA9EFE00CBA0FE00CCA1FF00CCA3FE00CDA4FE00CEA6FF
          00CFA7FE00D0A9FE00D1AAFF00D1ACFE03D3AEFE07957CCF0000003000010004
          000000000000000000040304000C09361EBD86FE00B678FE00B779FE00B87AFF
          00B97CFE00B97DFE00BA7EFF00B47BFE3BB992FFF1F9F7FEFEFEFEFEFEFEFEFE
          FFFFFFFFC7EAE0FE11B184FE00BA86FF00B987FE1DB58CFEDBF2ECFFFEFEFEFE
          FEFEFEFEFFFFFFFFE5F5F1FE2ABB98FE00BF92FF00C899FE00CA9CFE00CB9DFF
          00CC9FFE00CCA0FF00CDA2FE00CEA3FE00CFA5FF00D0A6FE00D0A8FE00D1A9FF
          00D2ABFE00D3ACFE00D3ADFF00D4AFFE00D5B0FE0CC2A2EE0000003D00000008
          000000000000000000060406002519561CC28AFF00BB7CFF00BB7DFF00BC7EFF
          00BD80FF00BD81FF00BD82FF00B27BFFD0EEE5FFFFFFFFFFFFFFFFFFFFFFFFFF
          C6EAE0FF10B385FF00BE89FF00C48EFF00C490FF00BF8DFF1DB890FFD9F1EBFF
          FFFFFFFFFFFFFFFFFFFFFFFFE7F6F3FF2ABF9CFF00C497FF00CC9EFF00CEA1FF
          00CFA3FF00D0A4FF00D0A5FF00D1A7FF00D2A8FF00D3AAFF00D3ABFF00D4ADFF
          00D5AEFF00D6AFFF00D6B1FF00D7B2FF00D8B3FF0EDAB8FE0109074C0001010B
          000000000000000000030208013B296E1EC68EFF03C082FE00BF82FE00C083FF
          00C184FE00C185FE00C186FF00B880FEAAE2D2FFFEFEFEFEFEFEFEFEC7EBE1FE
          10B688FF00C18CFE00C791FE00C893FF00C994FE00C995FE00C392FF1EBC95FE
          D9F2ECFEFFFFFFFFFEFEFEFEFEFEFEFEE5F6F2FF2BC2A0FE00C79CFE00D0A4FF
          00D2A6FE00D3A7FF00D3A9FE00D4AAFE01D5ACFF01D6AEFE02D7AFFE01D7B0FF
          01D8B1FE00D8B3FE00D9B4FF00DAB5FE00DAB6FE10DDBCFF02201A600000000E
          00000000000000000003020800422D7721CA93FF0CC68AFE09C68AFE01C487FF
          00C588FE00C589FE00C68AFF00C289FE0DBA87FF92DDC7FE96DECAFE10BA8BFE
          00C48EFF00CA93FE00CB95FE00CC97FF00CC98FE00CD99FE00CD9AFF00C796FE
          1DBF98FEDBF3EDFFFEFEFEFEFEFEFEFEFFFFFFFFE5F6F3FE2AC4A3FE01CBA1FF
          05D5AAFE08D7AEFF0BD8B0FE0BD9B1FE0CDAB3FF0CDAB4FE0CDBB5FE0CDCB6FF
          0CDCB7FE0BDDB9FE0ADDB9FF07DDBAFE03DDBAFE13E0C0FF012721680000000F
          00000000000000000004030800442F7723CE98FF13CB91FF13CB92FF12CC93FF
          0BCA91FF02C98EFF00C98EFF00C98FFF00C78EFF00C28CFF00C38DFF00C892FF
          00CC96FF00CE98FF00CE99FF00CF9AFF00CF9CFF00D09DFF00D19EFF00D19FFF
          00CB9BFF1DC29CFFD9F3EDFFFFFFFFFFFFFFFFFFFFFFFFFFE8F7F4FF37C9ABFF
          12D1AAFF13DAB3FF13DCB5FF13DCB7FF13DDB8FF13DEB9FF13DEBAFF13DFBBFF
          13DFBCFF13E0BDFF13E0BFFF13E1C0FF13E1C1FF21E4C6FF002822680000000F
          00000000000000000009060701412D6E25D19CFF1AD098FE1AD099FE1AD19AFF
          1AD19BFE1AD19CFE12D19AFF09CF97FE01CE95FF00CE96FE00CF97FE00D099FE
          00D19AFF00D19BFE00D29DFE00D29EFF00D39FFE00D4A0FE00D4A2FF00D5A3FE
          00D5A4FE05CFA2FF2AC7A5FEDCF4EFFEFFFFFFFFFEFEFEFEFEFEFEFEE7F7F4FF
          3ECDB0FE19D5B1FF1ADEB9FE1AE0BBFE1AE0BDFF1AE1BEFE1AE1BFFE1AE2C0FF
          1AE2C1FE1AE3C2FE1AE3C3FF1AE4C4FE1AE4C5FE27E6C9FF02231E5F0001010D
          000000000000000000080605002E215626D5A0FF23D59FFE23D5A0FE23D5A1FF
          23D6A2FE23D6A3FE23D7A4FF23D8A5FE21D8A6FF1BD7A4FE13D6A3FE0DD6A2FE
          07D5A1FF03D5A0FE00D5A0FE00D6A2FF03D7A4FE08D8A7FE0FDAABFF17DCAFFE
          1FDEB3FE23DEB5FF21D7B0FE39CCADFEDFF5F0FFFEFEFEFEFEFEFEFEFFFFFFFF
          E7F7F4FE43CFB5FF21D9B7FE23E2BFFE23E4C2FF23E4C2FE23E5C3FE23E6C5FF
          23E6C6FE23E6C7FE23E7C8FF23E7C9FE23E8CAFE2AE9CCFE020F0C490002010A
          0000000000000000000C090201140F3523D7A2FE2CDAA6FF2CDAA7FF2CDAA8FF
          2CDBAAFF2CDBABFF2CDCABFF2CDCACFF2CDCADFF2CDDAEFF2CDDB0FF2CDEB0FF
          2CDEB2FF2CDFB3FF2CDFB4FF2CE0B5FF2CE0B6FF2CE0B7FF2CE1B8FF2CE2B9FF
          2CE2BAFF2CE3BCFF2CE2BCFF2ADBB7FF40CFB2FFDFF5F1FFFFFFFFFFFFFFFFFF
          FFFFFFFFEAF8F6FF4AD2B9FF2ADDBDFF2CE6C5FF2CE8C8FF2CE8C9FF2CE9CAFF
          2CE9CAFF2CE9CBFF2CEACCFF2CEACDFF2CEACEFF2BDCC1F20000003500030206
          0000000000000000000B07010003021B1DC595EA36DEAEFE35DFAEFE36DFAFFF
          35DFB0FE35DFB1FE36E0B2FF35E0B3FE36E1B4FF35E1B5FE35E2B6FE35E2B7FE
          36E2B8FF35E3B9FE35E3BAFE36E3BBFF35E4BCFE35E5BDFE36E5BEFF35E6BFFE
          35E6C0FE36E6C1FF35E6C2FE35E6C2FE34DEBDFF48D2B7FEE0F5F1FEFFFFFFFF
          FEFEFEFEFFFFFFFFE9F8F5FE51D5BEFE33E0C3FF35E9CBFE35EBCDFE36EBCEFF
          35ECCFFE35ECD0FE36EDD1FF35EDD1FE3DEED4FE1DAF99D10000002800050403
          000000000000000000000000000D09100F946FB941E3B5FE3FE3B5FE3FE3B6FF
          3FE3B7FE3FE4B8FE3FE4B9FF3FE5B9FE3FE5BAFF3FE5BBFE3FE5BCFE3FE6BDFE
          3FE6BEFF3FE7BFFE3FE7C0FE3FE8C1FF3FE8C2FE3FE8C3FE3FE8C4FF3FE9C5FE
          3FE9C6FE3FEAC6FF3FEAC7FE3FEBC8FE3FEAC8FF3DE2C2FE4FD5BCFEE3F6F3FF
          FEFEFEFEFFFFFFFFFEFEFEFEEAF8F6FE58D7C2FF3CE3C8FE3FEDD1FE3FEED2FF
          3FEED3FE3FEFD4FE3FEFD5FF3FEFD5FE4FF1D9FE097868A40002011900040301
          00000000000000000000000000110C0702533D7643E6B8FF4AE7BBFF4AE7BCFF
          4AE7BDFF4AE8BEFF4AE8BFFF4AE8C0FF4AE9C0FF4AE9C1FF4AE9C2FF4AEAC3FF
          4AEAC4FF4AEAC5FF4AEAC6FF4AEBC7FF4AEBC8FF4AECC8FF4AECC9FF4AECCAFF
          4AECCBFF4AEDCCFF4AEDCCFF4AEDCDFF4AEECEFF4AEDCEFF47E6C8FF57D8C0FF
          E2F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFECF9F7FF5FDBC7FF48E9CFFF4AF1D6FF
          4AF1D7FF4AF1D8FF4AF1D9FF4AF1D9FF4AF2DAFE03342B650007060D00000000
          0000000000000000000000000015100201130F2E31DCAEF555EAC2FE55EAC3FF
          54EBC3FE54EBC4FE55EBC5FF54EBC6FE55ECC6FF54ECC7FE54ECC8FE54ECC9FE
          55EDC9FF54EDCAFE54EDCBFE55EECCFF54EECDFE54EECEFE55EFCEFF54EFCFFE
          54EFD0FE55F0D1FF54EFD1FE54EFD2FE55F0D3FF54F0D4FE54EFD3FE51E8CDFF
          60DAC5FEE4F7F3FFFEFEFEFEFEFEFEFEFFFFFFFFD6F4EFFE4FE3CCFE54F2DAFF
          54F3DBFE54F3DCFE55F4DDFF59F4DEFE34D1BAE400040330000A080500000000
          0000000000000000000000000000000001110C0F139371B05EEDC7FF5FEEC8FF
          5FEEC9FF5FEECAFF5FEFCAFF5FEFCBFF5FEFCCFF5FEFCDFF5FEFCDFF5FF0CEFF
          5FF0CFFF5FF0D0FF5FF0D0FF5FF0D1FF5FF1D2FF5FF1D3FF5FF1D3FF5FF2D4FF
          5FF2D5FF5FF2D5FF5FF2D6FF5FF2D7FF5FF2D7FF5FF3D8FF5FF3D9FF5FF2D8FF
          5CEAD2FF68DCC8FFE6F7F4FFFFFFFFFFFFFFFFFFD1F3EEFF59E6D1FF5FF4DEFF
          5FF5DFFF5FF5DFFF5FF5E0FF6EF6E3FF0A73649A000504170008070100000000
          0000000000000000000000000000000002201804012D22474CEAC1FB6AF0CEFF
          6AF1CFFE6AF1CFFE6AF1D0FF6AF1D1FE6AF1D1FF6AF1D2FE6AF2D2FE6AF2D3FE
          6AF2D4FF6AF3D5FE6AF3D5FE6AF3D6FF6AF3D6FE6AF3D7FE6AF4D8FF6AF4D8FE
          6AF4D9FE6AF4DAFF6AF4DAFE6AF4DBFE6AF4DBFF6AF5DCFE6AF5DDFE6AF5DDFF
          69F4DDFE66ECD6FF71DFCDFED1F2EDFECEF2ECFF70E1D0FE67F0DBFE6AF6E1FF
          6AF7E2FE6AF7E3FE6CF7E4FF4FE6D1F101120F3F000D0B080000000000000000
          000000000000000000000000000000000000000002120E10199A79B073F3D3FF
          74F3D4FE74F3D4FE75F4D5FF74F4D5FE75F4D6FF74F4D7FE74F4D7FE74F5D8FE
          75F5D8FF74F5D9FE74F5DAFE75F6DAFF74F6DBFE74F6DCFE75F6DCFF74F6DDFE
          74F6DDFE75F6DEFF74F6DEFE74F7DFFE75F7DFFF74F7E0FE74F7E0FE75F7E1FF
          74F7E2FE74F6E1FF72F1DCFE6EEAD6FE6EEAD7FF72F2DEFE74F7E3FE75F8E5FF
          74F8E5FE74F8E6FE84F9E9FF0F77689900050518000D0B010000000000000000
          000000000000000000000000000000000000000004241C03011C15324CE4BFF1
          7FF6D8FF7FF6D9FF7FF6DAFF7FF6DAFF7FF6DBFF7FF6DBFF7FF7DCFF7FF7DDFF
          7FF7DDFF7FF7DEFF7FF7DEFF7FF7DFFF7FF7DFFF7FF7E0FF7FF7E0FF7FF8E1FF
          7FF8E1FF7FF8E2FF7FF8E2FF7FF8E3FF7FF8E3FF7FF8E4FF7FF8E4FF7FF8E4FF
          7FF9E5FF7FF9E5FF7FF9E6FF7FF8E5FF7FF8E6FF7FF9E7FF7FF9E7FF7FF9E8FF
          7FF9E8FF88FAEAFF49D4C1E10109073002141106000000000000000000000000
          000000000000000000000000000000000000000000000000051F1909095B4771
          72F5D6FE8AF7DEFE8AF7DEFF8AF8DEFE8AF8DFFF8AF8E0FE8AF8E0FE8AF8E1FE
          8AF8E1FF8AF8E2FE8AF9E2FE8AF9E2FF8AF9E3FE8AF9E3FE8AF9E4FF8AF9E4FE
          8AF9E5FE8AF9E5FF8AF9E6FE8AF9E6FE8AFAE6FF8AFAE7FE8AFAE7FE8AFAE8FF
          8AFAE8FE8AFAE8FF8AFAE9FE8AFAE9FE8AFAEAFF8AFAEAFE8AFAEAFE8AFBEBFF
          8CFBEBFE7BF5E4F9053A3260030E0C0E00000000000000000000000000000000
          00000000000000000000000000000000000000000000000004221B0104151111
          189477A485F8DEFE94F9E2FF94F9E2FE94F9E3FF94FAE3FE94FAE4FE94FAE4FE
          94FAE5FF94FAE5FE94FAE5FE94FAE6FF94FAE6FE94FAE7FE94FAE7FF94FAE7FE
          94FAE8FE94FBE8FF94FBE9FE94FBE9FE94FBE9FF94FBEAFE94FBEAFE94FBEAFF
          94FBEBFE94FBEBFF94FBEBFE94FBECFE94FBECFF94FBECFE94FBEDFE94FBEDFF
          8FFBECFE1270628D010505170317140200000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000072E2402
          0315111A20AF8FBE94FAE3FF9DFBE6FF9DFBE6FF9DFBE7FF9DFBE7FF9DFBE8FF
          9DFBE8FF9DFBE8FF9DFBE9FF9DFBE9FF9DFBE9FF9DFBEAFF9DFBEAFF9DFBEAFF
          9DFBEBFF9DFCEBFF9DFCEBFF9DFCECFF9DFCECFF9DFCECFF9DFCEDFF9DFCEDFF
          9DFCEDFF9DFCEEFF9DFCEEFF9DFCEEFF9DFCEFFF9DFCEFFF9EFCEFFF98FCEFFF
          18907FA70105051E051D19040000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0833290302110E1C26B192BE99FBE6FEA6FCE9FFA6FCEAFEA6FCEAFEA6FCEAFE
          A6FCEBFFA6FCEBFEA6FCEBFEA6FCECFFA6FCECFEA6FCECFEA6FCEDFFA6FCEDFE
          A6FCEDFEA6FCEEFFA6FCEEFEA6FCEEFEA6FDEEFFA6FCEFFEA6FCEFFEA6FDEFFF
          A6FDEFFEA6FDF0FFA6FDF0FEA6FDF0FEA6FDF1FFA8FDF1FE97FCEEFE189381A8
          0002021E041A1705000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000A362D0304161219249980A39AFBE7FEAFFDEDFEAFFDEDFEAFFDEDFE
          AFFDEDFFAFFDEEFEAFFDEEFEAFFDEEFFAFFDEEFEAFFDEFFEAFFDEFFFAFFDEFFE
          AFFDF0FEAFFDF0FFAFFDF0FEAFFDF0FEAFFDF1FFAFFDF1FEAFFDF1FEAFFDF1FF
          AFFDF2FEAFFEF2FFAFFDF2FEAFFDF2FEB4FEF3FF8BF9EAFA117A6A8F0106051C
          061F1C0400000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000B342B020819160F1461516F83EFD9F0B7FEEFFFB7FEEFFF
          B7FEF0FFB7FEF0FFB7FEF0FFB7FEF0FFB7FEF1FFB7FEF1FFB7FEF1FFB7FEF1FF
          B7FEF1FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF2FFB7FEF3FFB7FEF3FFB7FEF3FF
          B7FEF3FFB7FEF3FFB7FEF4FFBBFEF5FF60E2CFE606453C61030A091406221D03
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000F2A240705201A2C45A592ACA4FAEAFB
          BEFEF2FFBEFEF2FEBEFEF2FEBEFEF2FFBEFEF3FEBEFEF3FEBEFEF3FFBEFEF3FE
          BEFEF3FEBEFEF4FFBEFEF4FEBEFEF4FEBEFEF4FFBEFEF4FEBEFEF5FEBEFEF5FF
          BFFEF5FEC3FEF6FF89F6E7F7208C7C9C020E0C2A071A170A06211D0100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000014352E020E211D0D09362D43
          46A593AD90F5E2F4BFFEF3FEC5FFF4FFC4FEF4FEC4FEF4FEC4FFF4FFC4FEF5FE
          C4FEF5FEC4FFF5FFC4FEF5FEC4FEF5FEC4FFF5FFC5FEF6FEC9FEF6FEB6FEF4FF
          77EEDDEE269483A103231D3C0715131009252104000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000014383103
          0E231F0B041B17281262537142AF9BB56CE9D3E887FEEAFEA0FFEFFFB2FFF2FF
          B9FFF3FFBAFFF4FFB0FFF3FF9EFFF0FF83FEEBFD63E2CEE22FA593AE07554969
          020F0D260719170E0A2A25040000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000C2E28010C2E28050B27220B0512101405211B2D033C324D04574965
          025C4D70035C4D6F0556486403362E4B0419152A030E0C16061D1A0D08282306
          0727220100000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000052B2401062F280206302903
          0326200403251F0404282204052D270204272201000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFF0000FFFFC001FFFF0000FFFE00007FFF0000FFF80000
          1FFF0000FFE0000007FF0000FFC0000003FF0000FF80000000FF0000FF000000
          007F0000FE000000003F0000FC000000003F0000F8000000001F0000F0000000
          000F0000F0000000000F0000E000000000070000E000000000070000C0000000
          00030000C000000000030000C000000000030000C00000000001000080000000
          0001000080000000000100008000000000010000800000000001000080000000
          0001000080000000000100008000000000010000800000000001000080000000
          000100008000000000010000C000000000010000C000000000030000C0000000
          00030000E000000000030000E000000000070000F000000000070000F0000000
          000F0000F8000000001F0000F8000000001F0000FC000000003F0000FE000000
          007F0000FF00000000FF0000FF80000001FF0000FFE0000003FF0000FFF00000
          0FFF0000FFFC00003FFF0000FFFF0000FFFF0000FFFFF00FFFFF0000FFFFFFFF
          FFFF000028000000200000004000000001002000000000008010000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000002000000030000000300000002000000010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000030000000D0000001E
          0000003200070548000F0A59000E0A590006044900000034000000210000000F
          0000000400000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000400000017000906470A3B2896176849CE
          14855AF1129161FE0F9261FF0C9262FF099262FE078359EF046344CC01372695
          0007054A0000001C000000050000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000E000B074616583EB71D9162FA10905DFF008A54FF
          008C56FF008E58FF008F5BFF00915DFF009360FF009462FF009665FF019868FF
          009165F700513AB30008064A0000001200000001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000100010001001808312181239063F30A8F59FF008C53FF008D56FF008F58FF
          00905AFF00925DFF00945FFF009562FF009764FF009967FF009B69FF009C6CFF
          009E6FFF00A072FF009168EF00291E7F0000001F000000020000000000000000
          0000000000000000000000000000000000000000000000000000000000010001
          0000001C135038A51D9966FE008E54FF008F56FF009158FF00925AFF00945DFF
          00955FFF009762FF009864FF009A67FF009C69FF009E6CFF009F6EFF00A171FF
          00A374FF00A576FF00A679FF00A67BFD0146349F000000250000000200000000
          0000000000000000000000000000000000000000000000000000000000010117
          13543BA8179B65FF009257FF009359FF00955BFF00965DFF009760FF009962FF
          009A65FF009C67FF009E69FF009F6CFF00A16FFF00A371FF00A474FF00A677FF
          00A879FF00AA7CFF00AB7EFF00AD81FF00AF84FE014A39A00000001F00000001
          0000000000000000000000000000000000000000000000000002010B0B3B2883
          1CA06BFE00965BFF00975DFF00985FFF009A61FF009B63FF009D65FF009E68FF
          00A06AFF00A16DFF00A36FFF00A471FF00A674FF00A877FF00A979FF00AB7CFF
          00AD7EFF00AE81FF00B084FF00B287FF00B489FF00B48BFD0130267F00010011
          00000000000000000000000000000000000000000002010200110B41239F6FF5
          009A5EFF009B60FF009D62FF009E64FF009F66FF00A169FF00A16AFF00A16CFF
          00A36FFF00A672FF00A874FF00AA77FF00AB79FF00AD7CFF00AE7FFF00B081FF
          00B284FF00B386FF00B589FF00B78CFF00B98FFF00BA91FF00A884EF000A0845
          000100040000000000000000000000000000000000030210196E4EB907A166FF
          00A064FF00A166FF00A268FF00A46AFF00A56CFF00A46DFF1AA577FF8DCFBAFF
          3BB18CFF00A875FF00AD7AFF00AF7DFF00B17FFF00B282FF00B484FF00B587FF
          00B789FF00B88CFF00BA8FFF00BC91FF00BD94FF00BF96FF00C099FF016651B0
          000100180000000000000000000000000002010100140D401DAC77FC00A568FF
          00A66AFF00A76CFF00A86EFF00A970FF00A971FF1BA779FFDAEEE8FFFFFFFFFF
          F4FAF8FF40B693FF00AF7DFF00B482FF00B685FF00B787FF00B98AFF00BA8CFF
          00BC8FFF00BE92FF00BF94FF00C197FF00C299FF00C49BFF00C59EFF00BC98F6
          000A08430001000200000000000000000002010610583E9709AD71FF00AB6EFF
          00AC70FF00AD72FF00AE74FF00AD74FF1BAB7CFFD9EFE8FFFFFFFFFFFFFFFFFF
          FFFFFFFFF4FAF8FF40BB99FF00B585FF00BB8AFF00BD8DFF00BE8FFF00C092FF
          00C194FF00C397FF00C499FF00C69CFF00C79EFF00C8A0FF00CAA3FF01CBA5FF
          024E3F900000000B000000000000000000030211179166D600B072FF00B174FF
          00B275FF00B378FF00B278FF1BAE7FFFD9EFE9FFFFFFFFFFFDFEFEFF89D0BCFF
          EFF8F6FFFFFFFFFFF4FAF9FF40BF9EFF00BC8DFF00C292FF00C495FF00C597FF
          00C69AFF00C89CFF00C99EFF00CAA1FF00CCA3FF00CDA5FF00CEA8FF00CFAAFF
          058E76CA0000001A00000000000000000008062315B880FB00B678FF00B77AFF
          00B87CFF00B87DFF1AB484FFD9F0E9FFFFFFFFFFFDFEFEFF66CAAEFF00B583FF
          35BE99FFEFF9F6FFFFFFFFFFF4FBF9FF40C4A4FF00C394FF00C99AFF00CA9DFF
          00CB9FFF00CDA1FF00CEA4FF00CFA6FF00D0A8FF00D1AAFF00D2ACFF00D4AEFF
          08C1A1EF0000002B0000000000000000001F154213C086FF00BC7EFF00BD80FF
          00BE82FF00BC82FF8AD8C1FFFFFFFFFFFDFEFEFF66CDB0FF00BE89FF00C590FF
          00C390FF35C39FFFEFF9F6FFFFFFFFFFF4FBF9FF40C8A9FF00C99CFF00CFA2FF
          00D0A4FF00D1A6FF00D2A9FF00D4ABFF00D5ADFF00D6AFFF00D7B1FF00D8B3FF
          09DAB7FE010A083D0000000100000000002B1D5319C78FFF07C488FF00C386FF
          00C488FF00C489FF24C193FFBCEADDFF61CFB1FF00C28DFF00CA94FF00CB96FF
          00CC98FF00C997FF35C7A4FFEFF9F7FFFFFFFFFFF4FBFAFF40CCAEFF01CFA4FF
          05D6ABFF07D7AEFF09D8B0FF09D9B3FF09DAB4FF08DBB6FF07DCB8FF04DCB9FF
          0CDEBDFF0119154D0000000100000000002E1F531FCE97FF15CC93FF13CD95FF
          0BCC92FF01CB90FF00C990FF00C68FFF00C993FF00CE97FF00CF99FF00D09CFF
          00D19EFF00D29FFF00CF9FFF35CCAAFFEFFAF7FFFFFFFFFFF4FBFAFF4DD2B7FF
          14D7B0FF15DDB7FF15DEB9FF15DFBAFF15DFBCFF15E0BEFF15E1C0FF15E2C1FF
          1EE4C5FF001A164C000000010000000000271C4124D49EFF21D49EFF21D4A0FF
          21D5A1FF20D6A3FF19D5A1FF10D4A0FF0AD49FFF04D49FFF00D49FFF00D5A1FF
          04D7A5FF0BD9A9FF14DBAEFF1CD9B0FF4DD3B6FFF1FAF8FFFFFFFFFFF5FCFAFF
          55D6BDFF20DDBAFF21E3C0FF21E4C2FF21E4C3FF21E5C5FF21E6C6FF21E7C8FF
          26E8CBFE010E0B3B000000000000000000110C2026D7A3FC2EDBA9FF2EDCAAFF
          2EDCACFF2EDDADFF2EDDAFFF2EDEB0FF2EDFB2FF2EDFB3FF2EE0B5FF2EE1B6FF
          2EE1B8FF2EE2BAFF2EE3BCFF2EE4BDFF2DE0BBFF57D8BEFFF1FBF9FFFFFFFFFF
          F5FCFBFF5EDAC3FF2DE2C3FF2EE9C9FF2EE9CAFF2EEACCFF2EEACDFF2EEBCEFF
          2BDAC0F1000202250000000000000000000B080D22B68CD83DE2B3FF3DE2B4FF
          3DE3B6FF3DE3B7FF3DE4B9FF3DE4BAFF3DE5BBFF3DE5BDFF3DE6BEFF3DE7C0FF
          3DE7C1FF3DE8C3FF3DE8C4FF3DE9C5FF3DE9C7FF3CE5C4FF61DBC4FFF2FBF9FF
          FFFFFFFFF6FCFBFF68DDC9FF3BE7CBFF3DEDD1FF3DEED2FF3DEED4FF3DEFD5FF
          27AA97CA000303140000000000000000000C090412785B974DE8BDFF4DE8BEFF
          4DE8BFFF4DE9C1FF4DE9C2FF4DEAC3FF4DEAC4FF4DEBC5FF4DEBC7FF4DECC8FF
          4DECC9FF4DEDCBFF4DEDCCFF4DEDCDFF4DEECEFF4CEECFFF4BEACDFF6CDFCAFF
          F3FBFAFFFFFFFFFFF6FCFBFF6EE2D0FF4CEFD6FF4DF2D8FF4DF2D9FF55F3DCFF
          0E65588C00050407000000000000000000000000012D223C4EEAC0FE5DEDC7FF
          5DEEC8FF5DEEC9FF5DEECAFF5DEECBFF5DEFCCFF5DEFCEFF5DF0CFFF5DF0D0FF
          5DF0D1FF5DF1D2FF5DF1D3FF5DF1D4FF5DF2D5FF5DF2D6FF5CF2D7FF5BEED4FF
          78E1CFFFF4FBFAFFFFFFFFFFACEDE3FF5BF1DAFF5DF5DEFF5DF5DFFF52EDD7F9
          0116123800060501000000000000000000000000021712082BA686BB6DF1CFFF
          6DF2D0FF6DF2D1FF6DF2D2FF6DF2D3FF6DF3D4FF6DF3D5FF6DF3D6FF6DF4D7FF
          6DF4D8FF6DF4D9FF6DF4DAFF6DF4DBFF6DF5DCFF6DF5DCFF6DF6DDFF6CF6DEFF
          6AF1DBFF81E6D6FFB0EEE4FF6DE9D6FF6CF6E1FF6DF7E3FF72F7E5FF2A9182AD
          0009080E0000000000000000000000000000000000000000042F243A65EDCCF9
          7DF5D8FF7DF6D9FF7DF6D9FF7DF6DAFF7DF6DBFF7DF7DCFF7DF7DDFF7DF7DEFF
          7DF7DFFF7DF7DFFF7DF8E0FF7DF8E1FF7DF8E2FF7DF8E2FF7DF8E3FF7DF8E4FF
          7DF8E4FF7CF7E4FF7BF6E3FF7CF8E6FF7DF9E7FF7DF9E8FF6BE9D7F2011A1636
          010B09010000000000000000000000000000000000000000041F180419715B82
          85F7DDFF8CF8DFFF8CF8E0FF8CF9E1FF8CF9E1FF8CF9E2FF8CF9E3FF8CF9E3FF
          8CF9E4FF8CF9E5FF8CFAE5FF8CFAE6FF8CFAE7FF8CFAE7FF8CFAE8FF8CFAE8FF
          8CFAE9FF8CFAEAFF8CFBEAFF8CFBEBFF8CFBEBFF8CFBECFE15574E7503120F07
          0000000000000000000000000000000000000000000000000000000006231C0A
          2A9D83AC97FAE4FF9BFBE5FF9BFBE6FF9BFBE7FF9BFBE7FF9BFBE8FF9BFBE8FF
          9BFBE9FF9BFBE9FF9BFBEAFF9BFBEAFF9BFBEBFF9BFBEBFF9BFBECFF9BFCECFF
          9BFCEDFF9BFCEDFF9BFCEEFF9BFCEEFF99FCEEFF2786789C03110F0E00000000
          0000000000000000000000000000000000000000000000000000000000000000
          07251E0F32A087ABA3FCE9FFA9FCEBFFA9FCEBFFA9FCECFFA9FCECFFA9FCECFF
          A9FCEDFFA9FCEDFFA9FCEEFFA9FCEEFFA9FCEFFFA9FDEFFFA9FDEFFFA9FDF0FF
          A9FDF0FFA9FDF1FFA9FDF1FFA0FDF0FE28897B9D020F0D110000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000A282109297665809EF7E5F8B5FDEFFFB5FDEFFFB5FDF0FFB5FDF0FF
          B5FDF0FFB5FDF1FFB5FDF1FFB5FDF1FFB5FDF2FFB5FDF2FFB5FDF2FFB5FDF3FF
          B5FEF3FFB7FEF4FF91F1E4F3186055750416130D000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000D2923031138303562B4A3B9B2FDEFFEC0FEF3FFC0FEF3FF
          C0FEF3FFC0FEF3FFC0FEF4FFC0FEF4FFC0FEF4FFC0FEF4FFC0FEF5FFC2FEF5FF
          A6FCEFFC4BA597B105252031061C190500000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000F292307103D353840897B9375D3C2D6
          99FDECFCB0FFF1FFBCFFF4FFBCFFF4FFAFFFF2FF95FCECFA6CCCBED1307F738E
          062E2834071E1A09000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000009221D0207221D09
          0629221A06453A3A044A3E4C03483D4B053F363804221D19051D190A051D1903
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFFC1FFFFFC003FFFF0000FFFE00003FF800001F
          F000000FF0000007E0000007C0000003C0000003800000018000000180000001
          8000000180000000800000008000000080000001800000018000000180000001
          C0000001C0000003E0000003E0000007F000000FF800001FFC00003FFE00007F
          FF8001FFFFE007FFFFFFFFFF2800000010000000200000000100200000000000
          4004000000000000000000000000000000000000000000000000000000000000
          000000000000000000000004000000140005032A0005032A0000001500000004
          0000000000000000000000000000000000000000000000000000000000000000
          00000003051911460E593BB50B8153EF08905DFE059260FE038459EE005A3EB5
          0016104800000005000000000000000000000000000000000000000000000008
          0E47308F0B8F59FC008F57FF00925BFF009560FF009965FF009C6BFF00A070FF
          009F72FB0045338E0000000A000000000000000000000000000000030E4C3490
          05965DFF00965DFF009961FF009C66FF009F6BFF00A370FF00A675FF00A97AFF
          00AD80FF00B085FE004C3A8E000000040000000000000000062117430A9F66FC
          009F64FF00A168FF06A36EFF32B188FF00A975FF00AD7BFF00B080FF00B385FF
          00B78BFF00BA90FF00B891FB001C164400000000000100020E714DB400A86CFF
          00AB70FF06AB74FFB3E1D2FFFCFDFDFF5DC6A8FF00B786FF00BB8BFF00BE90FF
          00C195FF00C49AFF00C79FFF017861B2000000030002020D0BAC74F300B478FF
          06B47CFFB3E3D4FFD8F1EAFF6BCFB3FFF8FCFBFF5DCEB2FF00C496FF00C89BFF
          00CBA0FF00CDA4FF00D0A9FF03BD9CED0000001100130D250DC287FF00C184FF
          2BC697FFC6EDE2FF19C696FF00C893FF56D3B4FFF8FCFBFF5DD6BBFF01D1A5FF
          04D5ABFF04D7B0FF03D9B3FF06DBB8FE0009072300160F251ED09AFF18D09AFF
          0ED099FF06CE98FF01D19CFF01D3A0FF08D5A5FF63DCC2FFF8FDFCFF6BDEC8FF
          1ADFBAFF1BE2BFFF1BE3C2FF1EE5C6FE000A08220007050B2DD3A3F436DFB0FF
          36E0B3FF36E1B6FF36E3B9FF36E4BCFF36E5BFFF35E5C1FF79E5D0FFF9FDFCFF
          7AE5D3FF35EACCFF36ECD0FF2FD7BEEE0001010E000504012B9E7FB455EBC3FF
          55EBC5FF55ECC8FF55EDCAFF55EECDFF55EFCFFF55F0D1FF54EFD2FF8CEADAFF
          FAFDFDFF70ECD9FF55F3DCFF2E9788AF00030202000000000C3F323F6FF1D1FD
          75F4D5FF75F4D7FF75F5D9FF75F5DBFF75F6DDFF75F6DEFF75F7E0FF74F6E0FF
          8AF0E0FF74F4E1FF72F4E2FB0B302A3D0000000000000000010A0701348A768D
          93F9E2FF94FAE4FF94FAE5FF94FAE6FF94FAE7FF94FAE8FF94FBEAFF94FBEBFF
          94FBECFF93FBEDFF337A70870006050100000000000000000000000002120E03
          428E7E8DA9FBEAFDAFFDEEFFAFFDEEFFAFFDEFFFAFFDF0FFAFFDF1FFAFFDF1FF
          A6FAEEFC397F7587010908040000000000000000000000000000000000000000
          00000000224C443D70B0A4B2A3F3E5F4BBFEF3FFBBFEF4FFA0F1E5F267AAA0AF
          173F393B01090801000000000000000000000000000000000000000000000000
          00000000000000000000000003131008022923210227212102100E0800000000
          0000000000000000000000000000000000000000F81F0000E0070000C0030000
          8001000080010000000000000000000000000000000000000000000000000000
          8001000080010000C0030000F0070000FC3F0000}
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
        Left = 41
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
        Left = 150
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
    Top = 374
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
    Top = 422
  end
  object dtsResponsavel: TDataSource
    DataSet = sqlResponsavel
    Left = 208
    Top = 423
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
    Top = 374
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
    Top = 423
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
    Top = 374
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
    Top = 375
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
    object sqlTarefaREALIZADO_DATA: TSQLTimeStampField
      FieldName = 'REALIZADO_DATA'
      Origin = 'REALIZADO_DATA'
    end
    object sqlTarefaREALIZADO_OBSERVACAO: TStringField
      FieldName = 'REALIZADO_OBSERVACAO'
      Origin = 'REALIZADO_OBSERVACAO'
      Size = 120
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
  end
  object dsrTarefa: TDataSource
    DataSet = sqlTarefa
    Left = 42
    Top = 422
  end
end
