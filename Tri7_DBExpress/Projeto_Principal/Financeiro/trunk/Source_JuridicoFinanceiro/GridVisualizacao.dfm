inherited frmGridVisualizacao: TfrmGridVisualizacao
  Caption = 'frmGridVisualizacao'
  ClientHeight = 267
  ClientWidth = 672
  ExplicitWidth = 678
  ExplicitHeight = 296
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 672
    ExplicitWidth = 672
    inherited lblInformaca: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 377
      Width = 377
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 412
      ExplicitLeft = 412
      inherited btnCancelar: TcxButton
        LookAndFeel.SkinName = ''
      end
      inherited btnConfirmar: TcxButton
        LookAndFeel.SkinName = ''
      end
    end
    object btnResetar: TcxButton
      Left = 344
      Top = 9
      Width = 118
      Height = 22
      Caption = 'Resetar Campos'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFCF6F6F6EEEEEEE6E6E6DFDFDFD9D9D9D5D5D5D5D5
        D5D8D8D8DEDEDEE4E4E4ECECECF4F4F4FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEC
        ECCCCCCCB4B4B4B3B3B3BCBCBCBEBEBEBFBFBFC0C0C0C0C0C0C0C0C0BFBFBFBD
        BDBDB7B7B7B0B0B0C0C0C0DFDFDFFFFFFFFFFFFFFFFFFFF3F3F37F7F7F0C0C0C
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDB4B4B49A9A9A9C
        9C9CA4A4A4A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A0A0A0989898
        A6A6A6CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEB4B4B49999999B9B9BA4A4A4A5A5A5
        A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A0A0A0979797A6A6A6CDCDCDFFFF
        FFFFFFFFFFFFFFF5F5F58383830F0F0F00000000000000000000000000000000
        0000000000000000000000000000000000000000000000515151FFFFFFFFFFFF
        FFFFFFFFFFFFEFEFEFD8D8D8C8C8C8C8C8C8CDCDCDCECECECECECECECECECECE
        CECECECECECECECECECECBCBCBC7C7C7D0D0D0E5E5E5FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0
        D08B8B8B6666666D6D6D77777779797979797979797979797979797979797979
        7979737373656565777777AEAEAEFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A242424
        0000000000000808080A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0909090000
        00000000000000636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5EDEDEDE9
        E9E9EBEBEBECECECECECECECECECECECECECECECECECECECECECE9E9E9EAEAEA
        F2F2F2FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEBEBEBE7B7B7B5454545E5E5E6A6A6A6B6B6B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B656565545454656565A2A2A2FFFF
        FFFFFFFFFFFFFFFBFBFBA6A6A64D4D4D1C1C1C2B2B2B3A3A3A3B3B3B3B3B3B3B
        3B3B3B3B3B3B3B3B3B3B3B3B3B3B3434341D1D1D313131808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDB9B9
        B97373734B4B4B57575763636364646464646464646464646464646464646464
        64645E5E5E4C4C4C5C5C5C9B9B9BFFFFFFFFFFFFFFFFFFFBFBFBB9B9B9767676
        5252525F5F5F6969696A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6565
        655353536161619D9D9D}
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Panel1: TPanel
    Width = 672
    Height = 229
    ExplicitWidth = 672
    ExplicitHeight = 229
    object grdBasica: TcxGrid
      Left = 2
      Top = 2
      Width = 668
      Height = 225
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridPesquisa: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        FilterBox.CustomizeDialog = False
        FilterBox.Position = fpTop
        FilterBox.Visible = fvNever
        DataController.DataSource = dtsClientGrid
        DataController.Filter.Active = True
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = 'R$ ,#0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'calc_ValorDespesa'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',#0.00'
            Kind = skSum
            FieldName = 'calc_ValorDespesa'
          end
          item
            Format = ',#0.00'
            Kind = skSum
            FieldName = 'calc_ValorReceita'
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.MRUItemsListCount = 5
        Filtering.ColumnPopup.MaxDropDownItemCount = 10
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.GroupRowHeight = 25
        OptionsView.GroupRowStyle = grsOffice11
        Preview.Visible = True
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridPesquisaColumn1: TcxGridDBColumn
          Caption = 'Campo'
          DataBinding.FieldName = 'CAMPO'
          Options.Editing = False
          Width = 496
        end
        object cxGridPesquisaColumn2: TcxGridDBColumn
          Caption = 'Mostrar'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Check_SimNao
          Width = 170
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = cxGridPesquisa
      end
    end
  end
  object ClientGrid: TClientDataSet
    PersistDataPacket.Data = {
      6C0000009619E0BD0100000018000000040000000000030000006C000543414D
      504F0100490000000100055749445448020002003C0002494404000100000000
      0008534954554143414F01004900000001000557494454480200020001000750
      4F534943414F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POSICAO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 134
    object ClientGridCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object ClientGridID: TIntegerField
      FieldName = 'ID'
    end
    object ClientGridSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsClientGrid: TDataSource
    DataSet = ClientGrid
    Left = 528
    Top = 190
  end
end