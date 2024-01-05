inherited frmAtalho: TfrmAtalho
  Left = 316
  Top = 175
  Caption = 'Atalhos para as rotinas do sistema'
  ClientWidth = 638
  OldCreateOrder = True
  ExplicitWidth = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 638
    ExplicitWidth = 638
    inherited PanelBotoesBasicos: TPanel
      Width = 556
      ExplicitWidth = 556
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 194
          ExplicitLeft = 194
        end
        inherited cxBtnCancelar: TcxButton
          Left = 131
          ExplicitLeft = 131
        end
        inherited cxBtnGravar: TcxButton
          Left = 68
          ExplicitLeft = 68
        end
        inherited cxBtnExcluir: TcxButton
          Left = 342
          ExplicitLeft = 342
        end
        inherited cxBtnAlterar: TcxButton
          Left = 5
          ExplicitLeft = 5
        end
        inherited cxBtnIncluir: TcxButton
          Left = 293
          ExplicitLeft = 293
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 558
      ExplicitLeft = 558
    end
  end
  inherited StatusBar: TStatusBar
    Width = 638
    ExplicitWidth = 638
  end
  inherited PanelGeral: TPanel
    Width = 638
    ExplicitWidth = 638
    inherited PanelData: TPanel
      Width = 636
      Height = 63
      ExplicitWidth = 636
      ExplicitHeight = 63
      object cxLabel2: TcxLabel
        Left = 10
        Top = 37
        Caption = 'Atalho Sistema:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtAtalhoSistema: TcxDBTextEdit
        Left = 86
        Top = 34
        DataBinding.DataField = 'ATALHO_SISTEMA'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 130
      end
      object cxLabel1: TcxLabel
        Left = 10
        Top = 13
        Caption = 'Rotina:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 86
        Top = 10
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        Enabled = False
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        Width = 508
      end
      object cxLabel3: TcxLabel
        Left = 226
        Top = 37
        Caption = 'Atalho Usu'#225'rio:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtAtalhoUsuario: TcxDBTextEdit
        Left = 302
        Top = 34
        DataBinding.DataField = 'ATALHO_USUARIO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 15
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 130
      end
    end
    object grdGrupoRelatorio: TcxGrid
      Left = 1
      Top = 72
      Width = 636
      Height = 273
      Align = alClient
      TabOrder = 1
      object grdGrupoRelatorioDBTableView1: TcxGridDBTableView
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
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'DESCRICAO'
            Column = grdGrupoRelatorioDBTableView1DESCRICAO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
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
      Width = 636
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 60
      Control = PanelData
      ExplicitWidth = 8
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
