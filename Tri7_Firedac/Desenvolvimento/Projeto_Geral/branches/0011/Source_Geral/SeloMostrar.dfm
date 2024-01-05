inherited frmSeloMostrar: TfrmSeloMostrar
  Caption = 'Selo(s) do Servi'#231'o'
  ClientHeight = 259
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 288
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 259
    ExplicitHeight = 259
    inherited Shape1: TShape
      Top = 216
      Height = 35
      ExplicitTop = 191
      ExplicitHeight = 225
    end
    inherited btnCancelar: TcxButton
      Left = 524
      Top = 221
      Width = 106
      Height = 25
      Caption = 'Fechar'
      LookAndFeel.SkinName = ''
      ExplicitLeft = 524
      ExplicitTop = 221
      ExplicitWidth = 106
      ExplicitHeight = 25
    end
    object lblInformacao: TcxLabel
      Left = 4
      Top = 4
      Align = alTop
      AutoSize = False
      Caption = 'Utilize o(s) seguinte(s) selo(s) neste servi'#231'o'
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.BorderStyle = ebsSingle
      Style.Color = 13034466
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextColor = clBlue
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 24
      Width = 633
      AnchorX = 321
      AnchorY = 16
    end
    object cxGrid2: TcxGrid
      Left = 4
      Top = 28
      Width = 633
      Height = 188
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 2
      LevelTabs.Style = 8
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView6: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = SourceAncestral
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Preview.AutoHeight = False
        Preview.Visible = True
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridDBColumnSeloNumero: TcxGridDBColumn
          Caption = 'Selo'
          DataBinding.FieldName = 'calc_Selo'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 252
        end
        object cxGridDBTableView6Column1: TcxGridDBColumn
          Caption = 'Descri'#231#227'o do Selo'
          DataBinding.FieldName = 'DESCRICAO_COMPLETA'
          Options.Editing = False
          Options.Focusing = False
          Width = 356
        end
      end
      object cxGridLevel8: TcxGridLevel
        GridView = cxGridDBTableView6
      end
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
        'SELECT SL.SIGLA, CAST(SL.NUMERO AS INTEGER) AS NUMERO, SL.SELO_L' +
        'IVRO_ID,'
      '            SG.DESCRICAO_COMPLETA, SL.VALIDADOR'
      'FROM G_SELO_LIVRO SL'
      'LEFT OUTER JOIN G_SELO_LOTE ST ON'
      '  SL.SELO_LOTE_ID = ST.SELO_LOTE_ID'
      '  LEFT OUTER JOIN G_SELO_GRUPO SG ON'
      '  ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID'
      'WHERE TABELA = :TABELA'
      '  AND CAMPO_ID = :CAMPO_ID'
      'ORDER BY SIGLA, NUMERO')
    Left = 179
    Top = 38
    ParamData = <
      item
        Name = 'TABELA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'CAMPO_ID'
        DataType = ftBCD
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 176
    Top = 87
  end
  inherited ClientAncestral: TClientDataSet
    OnCalcFields = ClientAncestralCalcFields
    Left = 177
    Top = 132
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 30
    end
    object ClientAncestralNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object ClientAncestralSELO_LIVRO_ID: TBCDField
      FieldName = 'SELO_LIVRO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object ClientAncestralcalc_Selo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Selo'
      Size = 30
      Calculated = True
    end
    object ClientAncestralVALIDADOR: TStringField
      FieldName = 'VALIDADOR'
      Size = 10
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 174
    Top = 178
  end
end
