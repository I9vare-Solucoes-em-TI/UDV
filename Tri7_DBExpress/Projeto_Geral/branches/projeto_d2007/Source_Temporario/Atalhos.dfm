inherited frmAtalho: TfrmAtalho
  Left = 316
  Top = 175
  Width = 654
  Caption = 'Atalhos para as rotinas do sistema'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 646
    inherited PanelBotoesBasicos: TPanel
      Width = 581
      inherited cxBtnAlterar: TcxButton
        Left = 5
      end
      inherited cxBtnExcluir: TcxButton
        Left = 342
      end
      inherited cxBtnGravar: TcxButton
        Left = 54
      end
      inherited cxBtnCancelar: TcxButton
        Left = 103
      end
      inherited cxBtnPesquisar: TcxButton
        Left = 152
      end
      inherited cxBtnIncluir: TcxButton
        Left = 293
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 583
    end
  end
  inherited StatusBar: TStatusBar
    Width = 646
  end
  inherited PanelGeral: TPanel
    Width = 646
    inherited PanelData: TPanel
      Width = 644
      Height = 63
      object cxLabel2: TcxLabel
        Left = 8
        Top = 35
        Width = 77
        Height = 17
        Caption = 'Atalho Sistema:'
        Style.TextColor = clNavy
      end
      object edtAtalhoSistema: TcxDBTextEdit
        Left = 86
        Top = 34
        Width = 130
        Height = 21
        DataBinding.DataField = 'ATALHO_SISTEMA'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 2
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 11
        Width = 38
        Height = 17
        Caption = 'Rotina:'
        Style.TextColor = clNavy
      end
      object edtDescricao: TcxDBTextEdit
        Left = 86
        Top = 10
        Width = 508
        Height = 21
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 4
      end
      object cxLabel3: TcxLabel
        Left = 224
        Top = 35
        Width = 76
        Height = 17
        Caption = 'Atalho Usu'#225'rio:'
        Style.TextColor = clNavy
      end
      object edtAtalhoUsuario: TcxDBTextEdit
        Left = 302
        Top = 34
        Width = 130
        Height = 21
        DataBinding.DataField = 'ATALHO_USUARIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 15
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.TextColor = clNavy
        TabOrder = 0
      end
    end
    object grdGrupoRelatorio: TcxGrid
      Left = 1
      Top = 72
      Width = 644
      Height = 220
      Align = alClient
      TabOrder = 1
      object grdGrupoRelatorioDBTableView1: TcxGridDBTableView
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'DESCRICAO'
            Column = grdGrupoRelatorioDBTableView1DESCRICAO
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.PriorPage.Visible = False
        NavigatorButtons.NextPage.Visible = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Rotina'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 350
        end
        object grdGrupoRelatorioDBTableView1ATALHO_SISTEMA: TcxGridDBColumn
          Caption = 'Atalho Sistema'
          DataBinding.FieldName = 'ATALHO_SISTEMA'
          Width = 150
        end
        object grdGrupoRelatorioDBTableView1ATALHO_USUARIO: TcxGridDBColumn
          Caption = 'Atalho Usu'#225'rio'
          DataBinding.FieldName = 'ATALHO_USUARIO'
          Width = 150
        end
      end
      object grdGrupoRelatorioLevel1: TcxGridLevel
        GridView = grdGrupoRelatorioDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 64
      Width = 644
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 60
      Control = PanelData
    end
  end
  inherited ActionList1: TActionList
    Top = 162
    inherited ExecuteIncluir: TAction
      Enabled = False
      Visible = False
    end
    inherited ExecuteExcluir: TAction
      Visible = False
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'select * from V_G_SISTEMA_ROTINA'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID' +
      #13#10'order by DESCRICAO')
    Params = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Top = 162
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 162
  end
  inherited ClientAncestral: TClientDataSet
    Top = 162
    object ClientAncestralSISTEMA_ROTINA_ID: TBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralCHAVE_ROTINA: TStringField
      FieldName = 'CHAVE_ROTINA'
      Size = 30
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSISTEMA_MENU_ID: TBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralATALHO_SISTEMA: TStringField
      FieldName = 'ATALHO_SISTEMA'
      Size = 3
    end
    object ClientAncestralATALHO_USUARIO: TStringField
      FieldName = 'ATALHO_USUARIO'
      Size = 15
    end
    object ClientAncestralSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 162
  end
end
