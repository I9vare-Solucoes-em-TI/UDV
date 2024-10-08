inherited frmSeloRegistrar: TfrmSeloRegistrar
  Caption = 'Registrar Altera'#231#227'o na Situa'#231#227'o do Selo'
  ClientHeight = 180
  ClientWidth = 606
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 612
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 606
    Height = 180
    ExplicitWidth = 606
    ExplicitHeight = 180
    inherited Shape1: TShape
      Width = 594
      Height = 168
      ExplicitLeft = 4
      ExplicitTop = 5
      ExplicitWidth = 594
      ExplicitHeight = 218
    end
    inherited btnCancelar: TcxButton
      Left = 487
      Top = 129
      LookAndFeel.SkinName = ''
      ExplicitLeft = 487
      ExplicitTop = 129
    end
    object cxLabel2: TcxLabel
      Left = 13
      Top = 26
      Caption = 'Sigla:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel9: TcxLabel
      Left = 126
      Top = 26
      Caption = 'N'#186' Inicial:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel10: TcxLabel
      Left = 466
      Top = 26
      Caption = 'Data:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel11: TcxLabel
      Left = 13
      Top = 79
      Caption = 'Descri'#231#227'o:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel12: TcxLabel
      Left = 13
      Top = 106
      Caption = 'Observa'#231#227'o:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel13: TcxLabel
      Left = 330
      Top = 26
      Caption = 'N'#186' Final:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel8: TcxLabel
      Left = 13
      Top = 52
      Caption = 'Situa'#231#227'o:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel1: TcxLabel
      Left = 263
      Top = 26
      Caption = 'Qtd:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object edtSeloSigla: TcxTextEdit
      Left = 83
      Top = 24
      Enabled = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 9
      Text = 'edtSeloSigla'
      Width = 36
    end
    object edtSeloNumInicial: TcxTextEdit
      Left = 174
      Top = 24
      Enabled = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 10
      OnExit = edtQtdExit
      OnKeyPress = edtSeloNumInicialKeyPress
      Width = 84
    end
    object edtQtd: TcxTextEdit
      Left = 289
      Top = 24
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 11
      OnExit = edtQtdExit
      OnKeyPress = edtQtdKeyPress
      Width = 37
    end
    object edtSeloNumFinal: TcxTextEdit
      Left = 376
      Top = 24
      Enabled = False
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
      TabOrder = 12
      Text = 'cxTextEdit1'
      OnKeyPress = edtSeloNumFinalKeyPress
      Width = 84
    end
    object edtSeloData: TcxDateEdit
      Left = 497
      Top = 24
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 13
      Width = 84
    end
    object lcxSeloSituacao: TcxLookupComboBox
      Left = 83
      Top = 51
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'SELO_SITUACAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmCadSeloLote.dtsSeloSituacao
      Properties.OnEditValueChanged = lcxSeloSituacaoPropertiesEditValueChanged
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 14
      Width = 175
    end
    object edtSeloDescricao: TcxTextEdit
      Left = 83
      Top = 77
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 16
      Text = 'cxTextEdit1'
      Width = 499
    end
    object edtSeloObservacao: TcxTextEdit
      Left = 83
      Top = 104
      ParentFont = False
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 17
      Text = 'cxTextEdit1'
      Width = 499
    end
    object btnPesquisar: TcxButton
      Left = 285
      Top = 129
      Width = 95
      Height = 22
      HelpType = htKeyword
      Caption = 'Verificar'
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
      TabOrder = 18
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnConfirmar: TcxButton
      Left = 386
      Top = 129
      Width = 95
      Height = 22
      HelpType = htKeyword
      Caption = 'Confirmar'
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
      TabOrder = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object lbxUsuario: TcxLookupComboBox
      Left = 316
      Top = 51
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'LOGIN'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuarioSistema
      Properties.OnEditValueChanged = lcxSeloSituacaoPropertiesEditValueChanged
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 15
      Width = 265
    end
    object lblUsuario: TcxLabel
      Left = 264
      Top = 52
      Caption = 'Usu'#225'rio:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
  end
  inherited DataSetAncestral: TI9Query
    Left = 99
    Top = 119
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 163
    Top = 119
  end
  inherited ClientAncestral: TClientDataSet
    Left = 211
    Top = 119
  end
  inherited SourceAncestral: TDataSource
    Left = 243
    Top = 119
  end
  object sqlUsuarioSistema: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT U.USUARIO_ID, U.LOGIN'#13#10'FROM G_USUARIO U RIGHT OUTER JOIN ' +
      'G_USUARIO_SISTEMA S'#13#10'  ON U.USUARIO_ID = S.USUARIO_ID'#13#10'WHERE U.S' +
      'ITUACAO = '#39'A'#39#13#10'ORDER BY U.LOGIN')
    ParamData = <>
    Params = <>
    Left = 378
    Top = 74
    object sqlUsuarioSistemaUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlUsuarioSistemaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
  end
  object dtsUsuarioSistema: TDataSource
    DataSet = sqlUsuarioSistema
    Left = 378
    Top = 130
  end
end
