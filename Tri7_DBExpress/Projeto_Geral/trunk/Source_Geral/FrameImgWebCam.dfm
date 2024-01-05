object FmeImgWebCam: TFmeImgWebCam
  Left = 0
  Top = 0
  Width = 767
  Height = 338
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 338
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object cxDBVerticalGrid1: TcxDBVerticalGrid
      Left = 2
      Top = 2
      Width = 763
      Height = 334
      Align = alClient
      LayoutStyle = lsMultiRecordView
      OptionsView.RowHeaderWidth = 63
      OptionsView.RowHeight = 270
      OptionsView.ShowHeaders = False
      OptionsView.ValueWidth = 410
      OptionsData.Editing = False
      OptionsData.Inserting = False
      TabOrder = 0
      DataController.DataSource = dtsImagensDocumentos
      object cxDBVerticalGrid1DBEditorRow1: TcxDBEditorRow
        Properties.EditPropertiesClassName = 'TcxImageProperties'
        Properties.EditProperties.GraphicClassName = 'TJPEGImage'
        Properties.EditProperties.Stretch = True
        Properties.DataBinding.FieldName = 'Imagem'
      end
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = sqlImagensDocumentos
    Left = 419
    Top = 248
  end
  object sqlImagensDocumentos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Imagem'
        DataType = ftGraphic
      end>
    IndexDefs = <
      item
        Name = 'sqlImagensDocumentosIndex1'
        Fields = 'NOME'
      end>
    IndexName = 'sqlImagensDocumentosIndex1'
    Params = <>
    StoreDefs = True
    Left = 451
    Top = 248
    Data = {
      590000009619E0BD0100000018000000020000000000030000005900044E6F6D
      650100490000000100055749445448020002001E0006496D6167656D04004B00
      0000010007535542545950450200490009004772617068696373000000}
    object sqlImagensDocumentosNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object sqlImagensDocumentosImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
  end
  object dtsImagensDocumentos: TDataSource
    DataSet = sqlImagensDocumentos
    Left = 483
    Top = 248
  end
end
