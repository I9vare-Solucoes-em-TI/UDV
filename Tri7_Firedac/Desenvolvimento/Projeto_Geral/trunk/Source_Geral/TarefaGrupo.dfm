inherited frmTarefaGrupo: TfrmTarefaGrupo
  Caption = 'Cadastro de Grupo de Tarefas'
  ExplicitWidth = 676
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    inherited PanelBotoesBasicos: TPanel
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
        inherited cxBtnCancelar: TcxButton
          TabOrder = 3
        end
        inherited cxBtnGravar: TcxButton
          TabOrder = 2
        end
        inherited cxBtnExcluir: TcxButton
          TabOrder = 1
        end
        inherited cxBtnAlterar: TcxButton
          TabOrder = 0
        end
        inherited cxBtnIncluir: TcxButton
          TabOrder = 4
        end
      end
    end
  end
  inherited PanelGeral: TPanel
    inherited PanelData: TPanel
      Height = 64
      ExplicitHeight = 64
      object cxLabel1: TcxLabel
        Left = 7
        Top = 34
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtDescricao: TcxDBTextEdit
        Left = 65
        Top = 34
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.MaxLength = 60
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 514
      end
      object chbSituacao: TcxDBCheckBox
        Left = 595
        Top = 8
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        Style.IsFontAssigned = True
        TabOrder = 1
        Transparent = True
        Height = 21
        Width = 54
      end
      object ibxSistema: TcxDBImageComboBox
        Left = 65
        Top = 10
        DataBinding.DataField = 'SERVENTIA'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            Description = 'Registro de Im'#243'veis'
            ImageIndex = 3
            Value = '1'
          end
          item
            Description = 'Tabelionato de Notas'
            ImageIndex = 4
            Value = '2'
          end
          item
            Description = 'RTD e Pessoa Jur'#237'dica'
            Value = '7'
          end
          item
            Description = 'Registro Civil'
            Value = '12'
          end
          item
            Description = 'Protesto'
            Value = '13'
          end
          item
            Description = 'Geral'
            Value = '9'
          end>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 514
      end
      object cxLabel2: TcxLabel
        Left = 30
        Top = 11
        Caption = 'Setor:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
    end
    object controle: TcxGrid
      Left = 1
      Top = 65
      Width = 658
      Height = 280
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object controleDBTableView1: TcxGridDBTableView
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
            FieldName = 'NATUREZA_ID'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object controleDBTableView1Codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'TAREFA_GRUPO_ID'
          Width = 80
        end
        object controleDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 386
        end
        object controleDBTableView1Serventia: TcxGridDBColumn
          Caption = 'Serventia'
          DataBinding.FieldName = 'SERVENTIA'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dtmControles.imgCadBasicos
          Properties.Items = <
            item
              Description = 'Credito'
              ImageIndex = 3
              Value = 'C'
            end
            item
              Description = 'Debito'
              ImageIndex = 4
              Value = 'D'
            end>
          RepositoryItem = dtmLookup.Combo_Sistema
          Width = 139
        end
        object controleDBTableView1SITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 111
        end
      end
      object controleLevel1: TcxGridLevel
        GridView = controleDBTableView1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 397
    Top = 298
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT * '
      'FROM G_TAREFA_GRUPO'
      'ORDER BY TAREFA_GRUPO_ID')
    Left = 459
    Top = 298
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 491
    Top = 298
  end
  inherited ClientAncestral: TClientDataSet
    Left = 523
    Top = 298
    object ClientAncestralTAREFA_GRUPO_ID: TBCDField
      FieldName = 'TAREFA_GRUPO_ID'
      Required = True
      Precision = 18
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralSERVENTIA: TBCDField
      FieldName = 'SERVENTIA'
      Precision = 18
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 555
    Top = 298
  end
end
