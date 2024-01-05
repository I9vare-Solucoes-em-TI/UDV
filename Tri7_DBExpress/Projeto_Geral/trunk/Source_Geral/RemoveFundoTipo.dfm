object frmRemoveFundoTipo: TfrmRemoveFundoTipo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Remove Fundo Tipo'
  ClientHeight = 334
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grdRemoveFundo: TcxGrid
    Left = 0
    Top = 0
    Width = 578
    Height = 301
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxGridDBTableViewRemoveFundo: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsRemoveFundo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      Styles.Inactive = dtmControles.cxStyle14
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object cxGridDBTableViewRemoveFundoDescricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DESCRICAO'
        Width = 345
      end
      object cxGridDBTableViewRemoveFundoPercentual: TcxGridDBColumn
        Caption = 'Percentual (%)'
        DataBinding.FieldName = 'PERCENTUAL'
        Width = 135
      end
      object cxGridDBTableViewRemoveFundoValorCalculado: TcxGridDBColumn
        Caption = 'Remover'
        DataBinding.FieldName = 'CALC_REMOVE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnChange = cxGridDBTableViewRemoveFundoValorCalculadoPropertiesChange
        Options.Sorting = False
        Width = 96
      end
    end
    object cxGridLevelRemoveFundo: TcxGridLevel
      GridView = cxGridDBTableViewRemoveFundo
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 301
    Width = 578
    Height = 33
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnFechar: TcxButton
      Left = 466
      Top = 4
      Width = 106
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Fechar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 8
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000087000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000B30000000000000000000000000000
        000000000079000000EA000000A6000000A2000000A2000000A2000000A20000
        00A2000000A2000000A2000000A3000000EF0000005F00000000000000000000
        0000000000F0000000C400000000000000000000000000000000000000000000
        0000000000000000000000000000000000AA000000A800000000000000000000
        0000000000E7000000C300000000000000000000000000000000000000000000
        0000000000000000000000000000000000B6000000A700000000000000000000
        0000000000E7000000C400000000000000000000000000000000000000000000
        0000000000780000006A00000000000000520000008B00000000000000000000
        0000000000E7000000C400000000000000000000000000000000000000000000
        0000000000A3000000FF00000083000000000000000000000000000000000000
        0000000000E7000000C400000000000000000000008B000000C0000000BE0000
        00BE000000E6000000FF000000FF000000A90000000100000000000000000000
        0000000000E7000000C40000000000000000000000E2000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000CC0000003D000000000000
        0000000000E7000000C40000000000000000000000E2000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000CC0000003D000000000000
        0000000000E7000000C400000000000000000000008B000000C0000000BE0000
        00BE000000E6000000FF000000FF000000A90000000100000000000000000000
        0000000000E7000000C400000000000000000000000000000000000000000000
        0000000000A2000000FF00000083000000000000000000000000000000000000
        0000000000E7000000C400000000000000000000000000000000000000000000
        00000000007B0000006A00000000000000520000008B00000000000000000000
        0000000000E7000000C300000000000000000000000000000000000000000000
        0000000000000000000000000000000000B6000000A700000000000000000000
        0000000000F0000000C400000000000000000000000000000000000000000000
        0000000000000000000000000000000000AA000000A800000000000000000000
        000000000079000000EA000000A6000000A2000000A2000000A2000000A20000
        00A2000000A2000000A2000000A3000000EF0000005F00000000000000000000
        00000000000000000088000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000B30000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object cdsRemoveFundo: TClientDataSet
    PersistDataPacket.Data = {
      8B0000009619E0BD0100000018000000040000000000030000008B000D46554E
      444F5F5449504F5F494404000100000000000944455343524943414F01004900
      000001000557494454480200020078000A50455243454E5455414C0800040000
      00010007535542545950450200490006004D6F6E6579000D454D4F4C554D454E
      544F5F494404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FUNDO_TIPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftCurrency
      end
      item
        Name = 'EMOLUMENTO_ID'
        DataType = ftInteger
      end
      item
        Name = 'CALC_REMOVE'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 88
    object cdsRemoveFundoFUNDO_TIPO_ID: TIntegerField
      FieldName = 'FUNDO_TIPO_ID'
    end
    object cdsRemoveFundoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object cdsRemoveFundoPERCENTUAL: TCurrencyField
      FieldName = 'PERCENTUAL'
    end
    object cdsRemoveFundoCALC_REMOVE: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_REMOVE'
    end
    object cdsRemoveFundoEMOLUMENTO_ID: TIntegerField
      FieldName = 'EMOLUMENTO_ID'
    end
  end
  object dtsRemoveFundo: TDataSource
    DataSet = cdsRemoveFundo
    Left = 304
    Top = 136
  end
  object sqlFundoConfig: TI9Query
    Aggregates = <>
    SQL.Strings = (
      'select'#13#10'  CONFIGURACAO_FUNDO_ID,'#13#10'  FUNDO_TIPO_ID,'#13#10'  EMOLUMENTO' +
      '_ID'#13#10'from'#13#10' G_FUNDO_CONFIG'#13#10'where'#13#10'  EMOLUMENTO_ID = :EMOLUMENTO' +
      '_ID')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'EMOLUMENTO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 112
    Top = 88
    object sqlFundoConfigCONFIGURACAO_FUNDO_ID: TBCDField
      FieldName = 'CONFIGURACAO_FUNDO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlFundoConfigFUNDO_TIPO_ID: TBCDField
      FieldName = 'FUNDO_TIPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlFundoConfigEMOLUMENTO_ID: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 20
      Size = 2
    end
  end
end
