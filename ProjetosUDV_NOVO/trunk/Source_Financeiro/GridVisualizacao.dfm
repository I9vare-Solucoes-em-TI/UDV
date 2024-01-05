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
