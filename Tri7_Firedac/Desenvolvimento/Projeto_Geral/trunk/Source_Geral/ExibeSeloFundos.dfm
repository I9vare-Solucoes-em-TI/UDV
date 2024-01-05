object frmExibeSeloFundos: TfrmExibeSeloFundos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fundos Detalhados do Selo'
  ClientHeight = 280
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInferior: TPanel
    Left = 0
    Top = 247
    Width = 576
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
  object grdSeloFundos: TcxGrid
    Left = 0
    Top = 0
    Width = 576
    Height = 247
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxGridDBTableViewSeloFundos: TcxGridDBTableView
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
      DataController.DataSource = dtsSeloFundos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = cxGridDBTableViewSeloFundosValorCalculado
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object cxGridDBTableViewSeloFundosDescricao: TcxGridDBColumn
        DataBinding.FieldName = 'Descricao'
        Width = 260
      end
      object cxGridDBTableViewSeloFundosSigla: TcxGridDBColumn
        DataBinding.FieldName = 'Sigla'
        Width = 90
      end
      object cxGridDBTableViewSeloFundosPercentual: TcxGridDBColumn
        Caption = 'Percentual (%)'
        DataBinding.FieldName = 'Percentual'
        Width = 88
      end
      object cxGridDBTableViewSeloFundosValorCalculado: TcxGridDBColumn
        DataBinding.FieldName = 'ValorCalculado'
        Width = 126
      end
    end
    object cxGridLevelSeloFundos: TcxGridLevel
      GridView = cxGridDBTableViewSeloFundos
    end
  end
  object sqlSeloFundos: TClientDataSet
    PersistDataPacket.Data = {
      900000009619E0BD010000001800000004000000000003000000900009446573
      63726963616F01004900000001000557494454480200020078000A5065726365
      6E7475616C08000400000000000E56616C6F7243616C63756C61646F08000400
      0000010007535542545950450200490006004D6F6E657900055369676C610100
      490000000100055749445448020002000F000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Percentual'
        DataType = ftFloat
      end
      item
        Name = 'ValorCalculado'
        DataType = ftCurrency
      end
      item
        Name = 'Sigla'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 94
    Top = 70
    object sqlSeloFundosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 120
    end
    object sqlSeloFundosPercentual: TFloatField
      FieldName = 'Percentual'
    end
    object sqlSeloFundosValorCalculado: TCurrencyField
      DisplayLabel = 'Valor'
      FieldName = 'ValorCalculado'
    end
    object sqlSeloFundosSigla: TStringField
      FieldName = 'Sigla'
      Size = 15
    end
  end
  object dtsSeloFundos: TDataSource
    AutoEdit = False
    DataSet = sqlSeloFundos
    Left = 170
    Top = 70
  end
end
