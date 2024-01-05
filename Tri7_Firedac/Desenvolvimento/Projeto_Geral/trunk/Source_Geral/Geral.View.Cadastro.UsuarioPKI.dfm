inherited frmCadastroUsuarioPKI: TfrmCadastroUsuarioPKI
  Caption = 'Cadastro de Usu'#225'rio PKI'
  ClientHeight = 561
  ClientWidth = 784
  FormStyle = fsMDIChild
  Visible = True
  OnDestroy = FormDestroy
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 784
    ExplicitWidth = 784
    inherited PanelBotoesBasicos: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 704
      ExplicitLeft = 704
    end
  end
  inherited StatusBar: TStatusBar
    Top = 541
    Width = 784
    ExplicitTop = 541
    ExplicitWidth = 784
  end
  inherited PanelGeral: TPanel
    Width = 784
    Height = 485
    ExplicitWidth = 784
    ExplicitHeight = 485
    inherited PanelData: TPanel
      Width = 782
      Height = 101
      ExplicitWidth = 782
      ExplicitHeight = 101
      object lblCodigo: TcxLabel
        Left = 10
        Top = 10
        Caption = 'C'#243'digo'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TextStyle = [fsUnderline]
      end
      object edtCodigo: TcxDBTextEdit
        Left = 10
        Top = 28
        DataBinding.DataField = 'USUARIO_PKI_ID'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        Width = 121
      end
      object lblUsuario: TcxLabel
        Left = 135
        Top = 10
        Caption = 'Usu'#225'rio'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TextStyle = [fsUnderline]
      end
      object lcbUsuario: TcxDBLookupComboBox
        Left = 135
        Top = 28
        RepositoryItem = Lista_UsuarioAtivos
        DataBinding.DataField = 'USUARIO_ID'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ListColumns = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Width = 220
      end
      object lblEmissor: TcxLabel
        Left = 10
        Top = 51
        Caption = 'Emissor'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TextStyle = [fsUnderline]
      end
      object edtEmissor: TcxDBTextEdit
        Left = 10
        Top = 69
        DataBinding.DataField = 'EMISSOR'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ReadOnly = True
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 9
        Width = 121
      end
      object lblNumeroSerie: TcxLabel
        Left = 135
        Top = 51
        Caption = 'N'#250'mero S'#233'rie'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TextStyle = [fsUnderline]
      end
      object edtNumeroSerie: TcxDBTextEdit
        Left = 135
        Top = 69
        DataBinding.DataField = 'NUMERO_SERIE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.ReadOnly = True
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 220
      end
      object lblSituacao: TcxLabel
        Left = 359
        Top = 10
        Caption = 'Situa'#231#227'o'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Style.TextStyle = [fsUnderline]
      end
      object icbSituacao: TcxDBImageComboBox
        Left = 359
        Top = 28
        RepositoryItem = dtmLookup.Combo_AtivoInativo
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        Width = 121
      end
      object btnSelecionar: TcxButton
        Left = 359
        Top = 66
        Width = 106
        Height = 25
        Caption = 'Selecionar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B0000000100000000000000000000D5D5
          D5007C7C7C0033333300ABABAB001717170052525200FFFFFF0011111100C6C6
          C60020202000999999006B6B6B000C0C0C0043434300909090002A2A2A00E8E8
          E8001616160008080800A5A5A5001C1C1C003E3E3E00B6B6B6005A5A5A008686
          8600D1D1D10014141400060606004A4A4A003C3C3C00B3B3B3003A3A3A002525
          2500303030000E0E0E006E6E6E00616161001E1E1E0004040400D9D9D9004646
          460080808000959595002E2E2E00BBBBBB008A8A8A0000000000222222004040
          40009999990027272700C9C9C9006C6C6C00939393002C2C2C004C4C4C007171
          7100000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070707070707
          070711351300002706340707070707070707070707092C272727272727051407
          07070707070707071A0D1C1C1C1C1C1C1C1C131F07070707070707071E131313
          1313131313131321070707070707071A0D0D0D0D0D0D0D0D0D0D0D0D07070707
          07070717232323232323232323232323070707070707072D0808080808080808
          0808080807070707070707041B1B1B1B1B1B1B1B1B1B1B1B0707070707070719
          0505050505050505050505050707070707070716050505050505050505050505
          0707070707071F15150322151515151515200E0C070707070728200A0A141D0A
          0A0A0A390601070707070707072530302407160A022E0B070707070707070707
          071A182A070716210B0707070707070707070707070707070707313336070707
          07070707070707070707070707070E102B070707070707070707070707070707
          0707292C2B070707070707070707070707070707070738220B07070707070707
          070707070707070707070F310107070707070707070707070707070707070707
          07070707070707070707}
        TabOrder = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnSelecionarClick
      end
    end
    object grdUsuarioPKI: TcxGrid
      Left = 1
      Top = 110
      Width = 782
      Height = 374
      Align = alClient
      TabOrder = 2
      object grdUsuarioPKIDBTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdUsuarioPKIDBTableViewUSUARIO_PKI_ID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'USUARIO_PKI_ID'
        end
        object grdUsuarioPKIDBTableViewUSUARIO_ID: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO_ID'
          RepositoryItem = Lista_UsuarioAtivos
          Width = 158
        end
        object grdUsuarioPKIDBTableViewEMISSOR: TcxGridDBColumn
          Caption = 'Emissor'
          DataBinding.FieldName = 'EMISSOR'
          Width = 120
        end
        object grdUsuarioPKIDBTableViewNUMERO_SERIE: TcxGridDBColumn
          Caption = 'N'#250'mero S'#233'rie'
          DataBinding.FieldName = 'NUMERO_SERIE'
          Width = 240
        end
        object grdUsuarioPKIDBTableViewSITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 80
        end
      end
      object grdUsuarioPKILevel: TcxGridLevel
        GridView = grdUsuarioPKIDBTableView
      end
    end
    object cxSplitter: TcxSplitter
      Left = 1
      Top = 102
      Width = 782
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 60
      Control = PanelData
    end
  end
  inherited ActionList1: TActionList
    Left = 443
    Top = 74
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT'
      '    G_UP.*'
      'FROM'
      '    G_USUARIO_PKI G_UP'
      'ORDER BY'
      '    G_UP.USUARIO_PKI_ID')
    Left = 505
    Top = 74
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 537
    Top = 74
  end
  inherited ClientAncestral: TClientDataSet
    AfterInsert = ClientAncestralAfterInsert
    Left = 569
    Top = 74
    object ClientAncestralUSUARIO_PKI_ID: TBCDField
      FieldName = 'USUARIO_PKI_ID'
      Required = True
      Precision = 18
      Size = 2
    end
    object ClientAncestralUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Precision = 18
      Size = 2
    end
    object ClientAncestralEMISSOR: TStringField
      FieldName = 'EMISSOR'
      Size = 120
    end
    object ClientAncestralNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 601
    Top = 74
  end
  object qryUsuario: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '    G_U.USUARIO_ID,'
      '    G_U.NOME_COMPLETO'
      'FROM'
      '    G_USUARIO G_U'
      'WHERE'
      '    G_U.SITUACAO = :P_SITUACAO'
      'ORDER BY'
      '    G_U.NOME_COMPLETO')
    Left = 34
    Top = 199
    ParamData = <
      item
        Name = 'P_SITUACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'A'
      end>
    object qryUsuarioUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryUsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Origin = 'NOME_COMPLETO'
      Size = 120
    end
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = qryUsuario
    Left = 34
    Top = 247
  end
  object cxEditRepository: TcxEditRepository
    Left = 34
    Top = 295
    object Lista_UsuarioAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Nome Completo'
          FieldName = 'NOME_COMPLETO'
        end>
      Properties.ListSource = dtsUsuario
    end
  end
end
