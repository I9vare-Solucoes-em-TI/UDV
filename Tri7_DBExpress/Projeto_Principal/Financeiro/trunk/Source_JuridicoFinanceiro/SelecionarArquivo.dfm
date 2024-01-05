inherited frmSelecionarArquivo: TfrmSelecionarArquivo
  ClientHeight = 341
  ClientWidth = 907
  OnActivate = FormActivate
  ExplicitWidth = 913
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 907
    ExplicitWidth = 907
    inherited lblInformaca: TcxLabel
      Caption = 'Selecionar Arquivo(s)'
      Style.IsFontAssigned = True
      ExplicitWidth = 872
      Width = 872
      AnchorY = 19
    end
    inherited btnCancelar: TcxButton
      Left = 703
      Top = 10
      LookAndFeel.SkinName = ''
      ExplicitLeft = 703
      ExplicitTop = 10
    end
    inherited btnConfirmar: TcxButton
      Left = 803
      Top = 10
      Caption = 'Selecionar'
      LookAndFeel.SkinName = ''
      ExplicitLeft = 803
      ExplicitTop = 10
    end
  end
  inherited Panel1: TPanel
    Width = 907
    Height = 303
    ExplicitWidth = 907
    ExplicitHeight = 303
    object cxShellTreeView1: TcxShellTreeView
      Left = 2
      Top = 2
      Width = 253
      Height = 299
      Align = alLeft
      AutoExpand = True
      DragDropSettings.DropEffect = []
      Indent = 19
      RightClickSelect = True
      Root.BrowseFolder = bfCustomPath
      ShellListView = cxShellListView
      TabOrder = 0
    end
    object cxShellListView: TcxShellListView
      Left = 255
      Top = 2
      Width = 650
      Height = 299
      Align = alClient
      MultiSelect = True
      Options.ShowFolders = False
      Options.ContextMenus = False
      Options.ShowToolTip = False
      Options.AutoExecute = False
      Root.BrowseFolder = bfCustomPath
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = cxShellListViewDblClick
      ExplicitLeft = 257
      ExplicitTop = 0
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT * '#13#10'FROM J_PROCESSO_ANDAMENTO'#13#10'WHERE PROCESSO_ANDAMENTO_I' +
      'D = :PROCESSO_ANDAMENTO_ID'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'PROCESSO_ANDAMENTO_ID'
        ParamType = ptInput
      end>
    Left = 295
    Top = 93
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 327
    Top = 93
  end
  inherited ClientAncestral: TClientDataSet
    Left = 359
    Top = 93
    object ClientAncestralPROCESSO_ANDAMENTO_ID: TFMTBCDField
      FieldName = 'PROCESSO_ANDAMENTO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralTIPO_ANDAMENTO_ID: TFMTBCDField
      FieldName = 'TIPO_ANDAMENTO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object ClientAncestralPROCESSO_ID: TFMTBCDField
      FieldName = 'PROCESSO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField
      FieldName = 'PROCESSO_TRAMITE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDATA_ANDAMENTO: TSQLTimeStampField
      FieldName = 'DATA_ANDAMENTO'
    end
    object ClientAncestralDATA_PUBLICACAO: TSQLTimeStampField
      FieldName = 'DATA_PUBLICACAO'
    end
    object ClientAncestralDATA_CIRCULACAO: TSQLTimeStampField
      FieldName = 'DATA_CIRCULACAO'
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 391
    Top = 93
  end
end
