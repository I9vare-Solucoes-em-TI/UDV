object frmRegistroEdicao: TfrmRegistroEdicao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registro Edi'#231#227'o'
  ClientHeight = 211
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object grdRegistroEdicao: TcxGrid
    Left = 0
    Top = 0
    Width = 794
    Height = 211
    Align = alClient
    TabOrder = 0
    object grdRegistroEdicaoDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = dtsRegistroEdicao
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
      object grdRegistroEdicaoDBTableViewTABELA: TcxGridDBColumn
        Caption = 'Tabela'
        DataBinding.FieldName = 'TABELA'
        Width = 90
      end
      object grdRegistroEdicaoDBTableViewCHAVE: TcxGridDBColumn
        Caption = 'Chave'
        DataBinding.FieldName = 'CHAVE'
      end
      object grdRegistroEdicaoDBTableViewCAMPO: TcxGridDBColumn
        Caption = 'Campo'
        DataBinding.FieldName = 'CAMPO'
        Width = 93
      end
      object grdRegistroEdicaoDBTableViewLOGIN: TcxGridDBColumn
        Caption = 'Login'
        DataBinding.FieldName = 'LOGIN'
        Width = 150
      end
      object grdRegistroEdicaoDBTableViewDATA: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DATA'
        Width = 130
      end
      object grdRegistroEdicaoDBTableViewIP_MAQUINA: TcxGridDBColumn
        Caption = 'IP M'#225'quina'
        DataBinding.FieldName = 'IP_MAQUINA'
        Width = 105
      end
      object grdRegistroEdicaoDBTableViewNOME_ESTACAO: TcxGridDBColumn
        Caption = 'Nome Esta'#231#227'o'
        DataBinding.FieldName = 'NOME_ESTACAO'
        Width = 160
      end
    end
    object grdRegistroEdicaoLevel: TcxGridLevel
      GridView = grdRegistroEdicaoDBTableView
    end
  end
  object tblRegistroEdicao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 43
    Top = 23
    object tblRegistroEdicaoREGISTRO_EDICAO_ID: TIntegerField
      FieldName = 'REGISTRO_EDICAO_ID'
    end
    object tblRegistroEdicaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object tblRegistroEdicaoCHAVE: TIntegerField
      FieldName = 'CHAVE'
    end
    object tblRegistroEdicaoCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object tblRegistroEdicaoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object tblRegistroEdicaoLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object tblRegistroEdicaoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object tblRegistroEdicaoIP_MAQUINA: TStringField
      FieldName = 'IP_MAQUINA'
      Size = 30
    end
    object tblRegistroEdicaoNOME_ESTACAO: TStringField
      FieldName = 'NOME_ESTACAO'
      Size = 60
    end
  end
  object dtsRegistroEdicao: TDataSource
    AutoEdit = False
    DataSet = tblRegistroEdicao
    Left = 43
    Top = 75
  end
  object pmnOpcoes: TPopupMenu
    OnPopup = pmnOpcoesPopup
    Left = 407
    Top = 136
    object mniDesbloquear: TMenuItem
      Caption = 'Desbloquear'
      OnClick = mniDesbloquearClick
    end
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = grdRegistroEdicao
    PopupMenus = <
      item
        GridView = grdRegistroEdicaoDBTableView
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = pmnOpcoes
      end>
    Left = 327
    Top = 136
  end
end
