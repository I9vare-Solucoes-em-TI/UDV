inherited frmCadRelatorioGerencial: TfrmCadRelatorioGerencial
  ClientHeight = 135
  ClientWidth = 497
  ExplicitWidth = 503
  ExplicitHeight = 164
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 497
    ExplicitWidth = 497
    inherited btnConfirmar: TcxButton [1]
      Left = 181
      Top = 8
      Visible = False
      LookAndFeel.SkinName = ''
      ExplicitLeft = 181
      ExplicitTop = 8
    end
    inherited lblInformaca: TcxLabel [2]
      Caption = ' Gerenciador de Relat'#243'rio Gerencial'
      Style.IsFontAssigned = True
      ExplicitWidth = 462
      Width = 462
      AnchorY = 19
    end
    inherited Panel4: TPanel [3]
    end
    inherited btnCancelar: TcxButton [4]
      Left = 291
      Top = 8
      Caption = 'Fechar'
      LookAndFeel.SkinName = ''
      ExplicitLeft = 291
      ExplicitTop = 8
    end
    object btnRelatorio: TcxButton
      Left = 392
      Top = 8
      Width = 95
      Height = 22
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnRelatorioClick
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000110B0000110B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A56464646565
        6568686868686868686868686868686868686868686868686868686868686866
        6666626262A1A1A1FFFFFFFFFFFFFFFFFFFFFFFF606060000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00595959FFFFFFFFFFFFFFFFFFFFFFFF63636300000000000000000000000000
        00000000000000000000000000000000000000000000000000000000005C5C5C
        FFFFFFFFFFFFFFFFFFFFFFFF6666660000001515154F4F4F3939390000000000
        00000000000000000000000000000000000000000000000000626262FFFFFFFF
        FFFFFFFFFFFFFFFF6262620000005F5F5F6B6B6B6A6A6A3C3C3CA1A1A1B0B0B0
        A8A8A8A8A8A8A8A8A8A8A8A8BCBCBC727272000000575757FFFFFFFFFFFFFFFF
        FFFFFFFF6262620000005959596C6C6C6A6A6A3131317D7D7D87878781818181
        81818181818181819090905858580000005A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
        6767670000000000002525251B1B1B0000000000000000000000000000000000
        00000000000000000000000000646464FFFFFFFFFFFFFFFFFFFFFFFF67676700
        00002222227777774B4B4B0E0E0E232323303030353535333333333333353535
        2B2B2B1B1B1B0000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000009D9D
        9DF0F0F09C9C9C292929BABABAD2D2D2D1D1D1D0D0D0D0D0D0D1D1D1D3D3D391
        9191000000535353FFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000006E6E6E818181
        C1C1C12828281515151919191717171717171717171717171C1C1C1010100000
        005F5F5FFFFFFFFFFFFFFFFFFFFFFFFF6868680000000000000F0F0F41414119
        1919000000000000000000000000000000000000000000000000000000646464
        FFFFFFFFFFFFFFFFFFFFFFFF646464000000474747BDBDBD6565651010104D4D
        4D5959595555555555555555555555555858583D3D3D0000005B5B5BFFFFFFFF
        FFFFFFFFFFFFFFFF585858000000A4A4A4E2E2E2B0B0B0272727B1B1B1CBCBCB
        C0C0C0C0C0C0C0C0C0C0C0C0CECECE8B8B8B000000535353FFFFFFFFFFFFFFFF
        FFFFFFFF5C5C5C000000363636505050A2A2A227272700000000000000000000
        00000000000000000000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF
        5F5F5F0000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000575757FFFFFFFFFFFFFFFFFFFFFFFFA0A0A059
        59595A5A5A5A5A5A4F4F4F5757575F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
        5F5F5F5C5C5C5858589C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
  end
  inherited Panel1: TPanel
    Width = 497
    Height = 97
    ExplicitWidth = 497
    ExplicitHeight = 97
    object cxLabel16: TcxLabel
      Left = 17
      Top = 38
      Caption = 'Tipo do Relat'#243'rio por:'
      Style.TextColor = 16384
    end
    object rdbRelSintetico: TcxRadioButton
      Left = 17
      Top = 15
      Width = 80
      Height = 17
      Caption = 'Sint'#233'tico'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16384
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object rdbRelAnalitico: TcxRadioButton
      Left = 95
      Top = 15
      Width = 74
      Height = 17
      Caption = 'Anal'#237'tico'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16384
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cbxOrganizar: TcxComboBox
      Left = 17
      Top = 61
      Enabled = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Identifica'#231#227'o'
        'Cliente')
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      Text = 'Identifica'#231#227'o'
      Width = 167
    end
    object chxTodosAndamento: TcxCheckBox
      Left = 194
      Top = 60
      Caption = 'Todos os Andamentos'
      TabOrder = 4
      Width = 135
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    Left = 47
    Top = 145
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 79
    Top = 145
  end
  inherited ClientAncestral: TClientDataSet
    Left = 111
    Top = 145
  end
  inherited SourceAncestral: TDataSource
    Left = 143
    Top = 145
  end
  object dtsCaixa: TDataSource
    DataSet = ClientCaixa
    Left = 360
    Top = 8
  end
  object ClientCaixa: TClientDataSet
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
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 327
    Top = 8
    Data = {
      9B0000009619E0BD0100000018000000050000000000030000009B0008434149
      58415F49440400010000000000095052494E434950414C010049000000010005
      57494454480200020001000556414C4F52080004000000010007535542545950
      450200490006004D6F6E65790009504553534F415F4944040001000000000009
      44455343524943414F0100490000000100055749445448020002001E000000}
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
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
end
