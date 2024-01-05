inherited frmUsuarioSistema: TfrmUsuarioSistema
  Left = 287
  Caption = 'Usu'#225'rios Sistema'
  ClientWidth = 728
  OldCreateOrder = True
  ExplicitWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 728
    ExplicitWidth = 728
    inherited PanelBotoesBasicos: TPanel
      Width = 646
      ExplicitWidth = 646
      inherited cxBtnPesquisar: TcxButton
        Visible = False
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 648
      ExplicitLeft = 648
    end
  end
  inherited StatusBar: TStatusBar
    Width = 728
    ExplicitWidth = 728
  end
  inherited PanelGeral: TPanel
    Width = 728
    ExplicitWidth = 728
    inherited PanelData: TPanel
      Width = 726
      Height = 60
      ExplicitWidth = 726
      ExplicitHeight = 60
      object cxLabel5: TcxLabel
        Left = 10
        Top = 9
        Caption = 'Grupo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object lcbGrupo: TcxDBLookupComboBox
        Left = 53
        Top = 8
        DataBinding.DataField = 'USUARIO_GRUPO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
            FieldName = 'USUARIO_GRUPO_ID'
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 350
            FieldName = 'DESCRICAO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dsGrupo
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.TransparentBorder = False
        Style.ButtonTransparency = ebtNone
        StyleFocused.BorderColor = clRed
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 16636603
        StyleFocused.TextColor = clBlack
        StyleFocused.TextStyle = []
        TabOrder = 0
        Width = 534
      end
      object cxLabel1: TcxLabel
        Left = 10
        Top = 33
        Caption = 'Usu'#225'rio:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object lcbUsuario: TcxDBLookupComboBox
        Left = 53
        Top = 32
        DataBinding.DataField = 'USUARIO_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Properties.KeyFieldNames = 'USUARIO_ID'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
            FieldName = 'USUARIO_ID'
          end
          item
            Caption = 'Nome'
            Width = 350
            FieldName = 'NOME_COMPLETO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dsUsuario
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        Style.TransparentBorder = False
        Style.ButtonTransparency = ebtNone
        StyleFocused.BorderColor = clRed
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 16636603
        StyleFocused.TextColor = clBlack
        StyleFocused.TextStyle = []
        TabOrder = 1
        Width = 534
      end
    end
    object cxGrid: TcxGrid
      Left = 1
      Top = 69
      Width = 726
      Height = 276
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView1: TcxGridDBTableView
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
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridDBTableView1USUARIO_GRUPO_ID: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'USUARIO_GRUPO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListSource = dsGrupo
          Visible = False
          GroupIndex = 0
        end
        object cxGridDBTableView1USUARIO_ID: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'USUARIO_ID'
          Properties.ListColumns = <
            item
              FieldName = 'NOME_COMPLETO'
            end>
          Properties.ListSource = dsUsuario
          Width = 500
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 61
      Width = 726
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 60
      Control = PanelData
    end
  end
  inherited ActionList1: TActionList
    Left = 85
    Top = 202
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'select * from G_USUARIO_SISTEMA'#13#10'where SISTEMA_ID = :SISTEMA_ID'#13 +
      #10'order by USUARIO_GRUPO_ID'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Left = 115
    Top = 202
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 147
    Top = 202
  end
  inherited ClientAncestral: TClientDataSet
    Left = 179
    Top = 202
    object ClientAncestralSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralUSUARIO_GRUPO_ID: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 211
    Top = 202
  end
  object sqlGrupo: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_USUARIO_GRUPO'#13#10'where SITUACAO = '#39'A'#39#13#10'order by DE' +
      'SCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 601
    Top = 68
    object sqlGrupoUSUARIO_GRUPO_ID: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlGrupoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object sqlUsuario: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select USUARIO_ID, NOME_COMPLETO from G_USUARIO '#13#10'where SITUACAO' +
      ' = '#39'A'#39#13#10'order by NOME_COMPLETO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 601
    Top = 100
    object sqlUsuarioUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlUsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
  end
  object dsGrupo: TDataSource
    DataSet = sqlGrupo
    Left = 633
    Top = 68
  end
  object dsUsuario: TDataSource
    DataSet = sqlUsuario
    Left = 633
    Top = 100
  end
end
