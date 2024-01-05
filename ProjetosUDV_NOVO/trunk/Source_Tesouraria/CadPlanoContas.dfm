inherited frmCadPlanoContas: TfrmCadPlanoContas
  Caption = 'Plano de Contas (Ativos/Despesas/Receitas)'
  ClientHeight = 558
  ClientWidth = 850
  ExplicitWidth = 866
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 850
    ExplicitWidth = 850
    inherited PanelBotoesBasicos: TPanel
      Width = 768
      ExplicitWidth = 768
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
      object cxLabel8: TcxLabel
        Left = 385
        Top = 10
        Caption = 
          '* Grupo Gen'#233'rico: Detalha no balancete os compromissos vinculada' +
          's a este grupo.'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Times New Roman'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 385
        Top = 30
        Caption = 
          '* Comp. Fixo: Compromisso fixo mensal. Lan'#231'amento obrigat'#243'rio to' +
          'do m'#234's.'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Times New Roman'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 770
      ExplicitLeft = 770
      inherited cxBtnFechar: TcxButton
        Left = 5
        Top = 5
        ExplicitLeft = 5
        ExplicitTop = 5
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 538
    Width = 850
    ExplicitTop = 538
    ExplicitWidth = 850
  end
  inherited PanelGeral: TPanel
    Width = 850
    Height = 482
    ExplicitWidth = 850
    ExplicitHeight = 482
    inherited PanelData: TPanel
      Width = 848
      Height = 173
      ExplicitWidth = 848
      ExplicitHeight = 173
      object tabBalancete: TcxTabControl
        Left = 1
        Top = 1
        Width = 846
        Height = 171
        Align = alClient
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.TabIndex = 0
        Properties.Tabs.Strings = (
          '')
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        OnChange = tabBalanceteChange
        OnChanging = tabBalanceteChanging
        ClientRectBottom = 164
        ClientRectLeft = 3
        ClientRectRight = 839
        ClientRectTop = 27
        object pnlDados: TPanel
          Left = 3
          Top = 27
          Width = 836
          Height = 137
          Align = alClient
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 0
          object cxLabel5: TcxLabel
            Left = 229
            Top = 6
            Caption = 'Grupo Cont'#225'bil:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxGroupBox2: TcxGroupBox
            Left = 7
            Top = 28
            Caption = ' Plano de Contas  '
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 1
            Height = 101
            Width = 825
            object Bevel1: TBevel
              Left = 8
              Top = 21
              Width = 805
              Height = 25
              Shape = bsBottomLine
            end
            object lcxItem: TcxLabel
              Left = 7
              Top = 52
              Caption = 'Descri'#231#227'o:'
              Style.TextColor = 4210688
              Style.TextStyle = []
              Transparent = True
            end
            object cxLabel3: TcxLabel
              Left = 7
              Top = 20
              Caption = 'Grupo Descri'#231#227'o:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel2: TcxLabel
              Left = 362
              Top = 52
              Caption = 'Comp. Fixo:'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxLabel6: TcxLabel
              Left = 362
              Top = 20
              Caption = 'Grupo Gen'#233'rico:'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cbxGrupoPlano: TcxComboBox
              Left = 94
              Top = 18
              ParentFont = False
              Properties.CharCase = ecUpperCase
              Properties.OnEditValueChanged = cbxGrupoPlanoPropertiesEditValueChanged
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 4
              Width = 263
            end
            object icxGenerico: TcxDBImageComboBox
              Left = 448
              Top = 18
              RepositoryItem = dtmLookup.Combo_SimNao
              DataBinding.DataField = 'GENERICO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 5
              Width = 97
            end
            object edtDescricao: TcxDBTextEdit
              Left = 94
              Top = 50
              DataBinding.DataField = 'DESCRICAO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 6
              Width = 263
            end
            object icxFixo: TcxDBImageComboBox
              Left = 448
              Top = 50
              RepositoryItem = dtmLookup.Combo_SimNao
              DataBinding.DataField = 'FIXO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Properties.OnEditValueChanged = icxMensalPropertiesEditValueChanged
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 7
              Width = 97
            end
            object cxLabel1: TcxLabel
              Left = 564
              Top = 52
              Caption = 'Qtd. Limitada (1 vez p/m'#234's):'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = 4210688
              Transparent = True
            end
            object icxQtd: TcxDBImageComboBox
              Left = 703
              Top = 50
              RepositoryItem = dtmLookup.Combo_SimNao
              DataBinding.DataField = 'QTD_LIMITADA'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 9
              Width = 105
            end
            object chxProgramarReajuste: TcxDBCheckBox
              Left = 90
              Top = 73
              AutoSize = False
              Caption = 'Programar Reajuste Ap'#243's  Redu'#231#227'o do Valor'
              DataBinding.DataField = 'PROGRAMAR_REAJUSTE'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DisplayChecked = 'S'
              Properties.DisplayGrayed = 'N'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextStyle = []
              Style.IsFontAssigned = True
              TabOrder = 10
              Transparent = True
              Height = 21
              Width = 267
            end
          end
          object cxLabel9: TcxLabel
            Left = 15
            Top = 6
            Caption = 'Tipo:'
            ParentColor = False
            Style.Color = clBtnFace
            Style.TextColor = 4210688
            Transparent = True
          end
          object chbSituacao: TcxDBCheckBox
            Left = 686
            Top = 5
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
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 21
            Width = 59
          end
          object icxTipo: TcxImageComboBox
            Left = 44
            Top = 4
            RepositoryItem = dtmLookupContabil.Combo_EntradaSaida
            Enabled = False
            Properties.Items = <>
            Properties.OnEditValueChanged = icxTipoPropertiesEditValueChanged
            StyleDisabled.TextColor = clBlack
            TabOrder = 4
            Width = 177
          end
          object lcxGrupoContabil: TcxDBLookupComboBox
            Left = 307
            Top = 3
            DataBinding.DataField = 'CONTABIL_GRUPO_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsGrupoContabil
            Properties.OnEditValueChanged = lcxGrupoContabilPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 5
            Width = 374
          end
        end
      end
    end
    object pgcListagem: TcxPageControl
      Left = 1
      Top = 174
      Width = 848
      Height = 307
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tabPlanoDetalhado
      Properties.CustomButtons.Buttons = <>
      OnChange = pgcListagemChange
      ClientRectBottom = 307
      ClientRectRight = 848
      ClientRectTop = 24
      object tabPlanoDetalhado: TcxTabSheet
        Caption = 'Dados Agrupados'
        ImageIndex = 0
        object tbcOperacao: TcxTabControl
          Left = 0
          Top = 0
          Width = 848
          Height = 283
          Align = alClient
          TabOrder = 0
          Properties.CustomButtons.Buttons = <>
          Properties.Style = 8
          Properties.TabIndex = 0
          Properties.Tabs.Strings = (
            'Sa'#237'das'
            'Entradas'
            'Aporte'
            'Retirada'
            'Transfer'#234'ncia')
          LookAndFeel.NativeStyle = True
          OnChange = tbcOperacaoChange
          ClientRectBottom = 283
          ClientRectRight = 848
          ClientRectTop = 24
          object tabGrupo: TcxTabControl
            Left = 0
            Top = 24
            Width = 848
            Height = 259
            Align = alClient
            TabOrder = 0
            Properties.CustomButtons.Buttons = <>
            Properties.TabIndex = 0
            Properties.Tabs.Strings = (
              'Ativos'
              'Inativos'
              'Todos')
            OnChange = tbcOperacaoChange
            ClientRectBottom = 259
            ClientRectRight = 848
            ClientRectTop = 24
            object grdBasica: TcxGrid
              Left = 0
              Top = 24
              Width = 848
              Height = 235
              Align = alClient
              PopupMenu = popRealizado
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              ExplicitTop = 19
              object cxGridPesquisa: TcxGridDBTableView
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
                FilterBox.CustomizeDialog = False
                FilterBox.Position = fpTop
                FilterBox.Visible = fvNever
                DataController.DataSource = SourceAncestral
                DataController.Filter.Active = True
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    Position = spFooter
                    FieldName = 'VALOR'
                  end
                  item
                    Format = 'R$ ,#0.00'
                    Kind = skSum
                    Position = spFooter
                    FieldName = 'calc_ValorDevido'
                  end>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                Filtering.MRUItemsListCount = 5
                Filtering.ColumnPopup.MaxDropDownItemCount = 10
                OptionsBehavior.ColumnHeaderHints = False
                OptionsCustomize.ColumnGrouping = False
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GridLines = glHorizontal
                OptionsView.GroupByBox = False
                OptionsView.GroupRowHeight = 25
                OptionsView.GroupRowStyle = grsOffice11
                Preview.Visible = True
                Styles.Group = dtmControles.cxStyle9
                object cxGridPesquisaColumn6: TcxGridDBColumn
                  Caption = 'Id'
                  DataBinding.FieldName = 'CONTABIL_CONTA_ID'
                  Options.Editing = False
                  Options.Focusing = False
                  Width = 35
                end
                object cxGridPesquisaTipo: TcxGridDBColumn
                  Caption = 'Tipo'
                  DataBinding.FieldName = 'calc_Tipo'
                  RepositoryItem = dtmLookup.Combo_EntradaSaida
                  Visible = False
                  Width = 79
                end
                object cxGridPesquisaColumn3: TcxGridDBColumn
                  Caption = 'Grupo'
                  DataBinding.FieldName = 'GRUPO'
                  Width = 256
                end
                object cxGridPesquisaColumn1: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'DESCRICAO'
                  Width = 256
                end
                object cxGridPesquisaColumn2: TcxGridDBColumn
                  Caption = 'Grupo Cont'#225'bil'
                  DataBinding.FieldName = 'CONTABIL_GRUPO_ID'
                  RepositoryItem = dtmLookup.Lista_GrupoContabilTodos
                  Visible = False
                  GroupIndex = 0
                  Width = 181
                end
                object cxGridPesquisaColumn5: TcxGridDBColumn
                  Caption = 'Gen'#233'rico'
                  DataBinding.FieldName = 'GENERICO'
                  RepositoryItem = dtmLookup.Combo_SimNaoImagem
                  Width = 71
                end
                object cxGridPesquisaColumn4: TcxGridDBColumn
                  Caption = 'Fixo'
                  DataBinding.FieldName = 'FIXO'
                  RepositoryItem = dtmLookup.Combo_SimNaoImagem
                  Width = 53
                end
                object cxGridPesquisaColumn9: TcxGridDBColumn
                  Caption = 'Qtd Limitada'
                  DataBinding.FieldName = 'QTD_LIMITADA'
                  PropertiesClassName = 'TcxBlobEditProperties'
                  RepositoryItem = dtmLookup.Combo_SimNaoImagem
                  Width = 103
                end
                object cxGridPesquisaSituacao: TcxGridDBColumn
                  Caption = 'Situa'#231#227'o'
                  DataBinding.FieldName = 'SITUACAO'
                  RepositoryItem = dtmLookup.Combo_AtivoInativo
                  Width = 72
                end
              end
              object grdBasicaLevel1: TcxGridLevel
                GridView = cxGridPesquisa
              end
            end
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Dados em Listagem'
        ImageIndex = 1
        object cxGridListagemPlano: TcxGrid
          Left = 0
          Top = 31
          Width = 848
          Height = 252
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
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
            FilterBox.CustomizeDialog = False
            FilterBox.Position = fpTop
            FilterBox.Visible = fvNever
            DataController.DataSource = dtsPlanoLIstagem
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'VALOR'
              end
              item
                Format = 'R$ ,#0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'calc_ValorDevido'
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Filtering.MRUItemsListCount = 5
            Filtering.ColumnPopup.MaxDropDownItemCount = 10
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            Preview.Visible = True
            Styles.Group = dtmControles.cxStyle9
            object cxGridDBTableView1Column1: TcxGridDBColumn
              Caption = 'Opera'#231#227'o'
              DataBinding.FieldName = 'OPERACAO'
              Options.Editing = False
              Options.Focusing = False
              Width = 94
            end
            object cxGridDBTableView1Column2: TcxGridDBColumn
              Caption = 'Grupo Principal'
              DataBinding.FieldName = 'GRUPO_PRINCIPAL'
              Options.Editing = False
              Options.Focusing = False
              Width = 170
            end
            object cxGridDBTableView1Column3: TcxGridDBColumn
              Caption = 'Grupo Secund'#225'rio'
              DataBinding.FieldName = 'GRUPO_SECUNDARIO'
              Options.Editing = False
              Options.Focusing = False
              Width = 197
            end
            object cxGridDBTableView1Column4: TcxGridDBColumn
              Caption = 'Descri'#231#227'o da Conta'
              DataBinding.FieldName = 'CONTA'
              Options.Editing = False
              Options.Focusing = False
              Width = 204
            end
            object cxGridDBTableView1Column5: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SITUACAO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Ativo'
                  ImageIndex = 0
                  Value = 'A'
                end
                item
                  Description = 'Inativo'
                  Value = 'I'
                end>
              RepositoryItem = dtmLookup.Combo_AtivoInativo
              Options.Editing = False
              Options.Focusing = False
              Width = 52
            end
            object cxGridDBTableView1Column6: TcxGridDBColumn
              Caption = 'Qtd Limitada'
              DataBinding.FieldName = 'QTD_LIMITADA'
              RepositoryItem = dtmLookup.Combo_SimNao
              Options.Editing = False
              Options.Focusing = False
              Width = 56
            end
            object cxGridDBTableView1Column7: TcxGridDBColumn
              Caption = 'Fixo'
              DataBinding.FieldName = 'FIXO'
              RepositoryItem = dtmLookup.Combo_SimNao
              Options.Editing = False
              Options.Focusing = False
              Width = 36
            end
            object cxGridDBTableView1Column8: TcxGridDBColumn
              Caption = 'Gen'#233'rico'
              DataBinding.FieldName = 'GENERICO'
              RepositoryItem = dtmLookup.Combo_SimNao
              Options.Editing = False
              Options.Focusing = False
              Width = 37
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 848
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object btnGravarDados: TcxButton
            Left = 8
            Top = 4
            Width = 95
            Height = 22
            Caption = 'Salvar'
            Colors.Default = clWhite
            Enabled = False
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              E6040000424DE604000000000000360000002800000014000000140000000100
              180000000000B0040000130B0000130B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFEFEFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFE7E8E7D0D2D1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFEEEEEE8E8F8E515452B9BBBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
              AAABAA3D3E3D232423565756E5E7E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECD4A4C4A27
              2827292B29282928848785F7F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E5E35253522929292F2F2F2E2E
              2E2E2E2E353635A1A2A1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFEBECEB797B792A2B2A2F302F2D2D2D2E2E2E303130
              2C2E2C4F514FC3C4C3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF0F1F0979897393A392F302F3334335252524546452F312F31323133
              3433707270DEDFDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9F9
              B3B5B34B4C4B323332333433747574CECFCEB6B7B6484948323232323332393B
              39919391F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDCED0CF5A5C5A34
              35342D2E2D7C7D7CEAEAEAFEFEFEFAFAFABFBFBF343534333533353535444544
              B9BABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E8E76D6E6D3233323A3A3A8D8D
              8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC4546453536353536354F5250DD
              DFDEFFFFFFFFFFFFFFFFFFFFFFFFA6A8A63B3D3B4547459A9A9AF4F4F4FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8ACACAC494A493839383636367A7C7BECED
              ECFFFFFFFFFFFFFFFFFF5A5C5B545554ADADADF2F2F2FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF3F3F3A7A7A7494A49393A39444544A1A2A2F4F5F5
              FFFFFFFFFFFFB9B9B9CCCCCCF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF2F2F2A2A3A23F403F3D3D3D595B5AC2C3C3FCFCFCFF
              FFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF6F6F6A1A2A1343634404140737573E0E0E0FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF9999994041404142418C8F8CEFF0EFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF3F3F39797974647464C4D4CBABABAFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFECECEC9494944647465C5E5CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFECECEC9C9C9C7E7F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF5F5F5EFF0EF}
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 473
    Top = 246
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT *'#13#10'FROM T_CONTABIL_CONTA'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13 +
      #10'    AND BALANCETE_GRUPO_ID  = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DES' +
      'CRICAO'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Left = 503
    Top = 246
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 535
    Top = 246
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    OnCalcFields = ClientAncestralCalcFields
    Left = 567
    Top = 246
    object ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralPLANO: TFMTBCDField
      FieldName = 'PLANO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralVALOR_DEFAULT: TFMTBCDField
      FieldName = 'VALOR_DEFAULT'
      Precision = 20
      Size = 3
    end
    object ClientAncestralGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
    object ClientAncestralcalc_Tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Tipo'
      Size = 1
      Calculated = True
    end
    object ClientAncestralFIXO: TStringField
      FieldName = 'FIXO'
      Size = 1
    end
    object ClientAncestralQTD_LIMITADA: TStringField
      FieldName = 'QTD_LIMITADA'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPROGRAMAR_REAJUSTE: TStringField
      FieldName = 'PROGRAMAR_REAJUSTE'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 599
    Top = 246
  end
  object popRealizado: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 472
    Top = 284
    object popAtivarGenerico: TMenuItem
      Caption = 'Ativar Grupo Descri'#231#227'o Gen'#233'rico'
      ImageIndex = 2
      OnClick = popAtivarGenericoClick
    end
    object popDesativarGenerico: TMenuItem
      Caption = 'Desativar Grupo Descri'#231#227'o Gen'#233'rico'
      OnClick = popDesativarGenericoClick
    end
  end
  object dtsGrupoContabil: TDataSource
    DataSet = sqlGrupoContabil
    Left = 276
    Top = 368
  end
  object sqlGrupoContabil: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = :TIPO'#13#10'  ' +
      '   AND BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'#13#10'ORDER BY DESCRI' +
      'CAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 268
    Top = 312
    object sqlGrupoContabilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object sqlPlanoListagem: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT CC.DESCRICAO AS CONTA, CC.SITUACAO, CC.GENERICO, CC.GRUPO' +
      ' AS GRUPO_SECUNDARIO, '#13#10'CC.FIXO, CC.QTD_LIMITADA,'#13#10'       CG.DES' +
      'CRICAO AS GRUPO_PRINCIPAL,'#13#10'       CASE CG.OPERACAO'#13#10'        WHE' +
      'N '#39'1'#39' then '#39'AQUISICAO ATIVO IMOBILIZADO'#39#13#10'        WHEN '#39'3'#39' then ' +
      #39'DESPESAS'#39#13#10'        WHEN '#39'4'#39' then '#39'RECEITAS'#39#13#10'        WHEN '#39'5'#39' t' +
      'hen '#39'APORTE'#39#13#10'        WHEN '#39'6'#39' then '#39'RETIRADA'#39#13#10'        WHEN '#39'7'#39 +
      ' then '#39'TRANSFERENCIA'#39#13#10'       END AS OPERACAO'#13#10'FROM T_CONTABIL_C' +
      'ONTA CC'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON'#13#10'  CC.CONTABIL' +
      '_GRUPO_ID = CG.CONTABIL_GRUPO_ID'#13#10'WHERE CC.BALANCETE_GRUPO_ID = ' +
      ':BALANCETE_GRUPO_ID'#13#10'  AND OPERACAO IN ('#39'1'#39', '#39'2'#39','#39'3'#39', '#39'4'#39')'#13#10'ORDE' +
      'R BY OPERACAO,  GRUPO_SECUNDARIO, CONTA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 420
    Top = 336
    object sqlPlanoListagemCONTA: TStringField
      FieldName = 'CONTA'
      Size = 90
    end
    object sqlPlanoListagemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlPlanoListagemGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object sqlPlanoListagemGRUPO_SECUNDARIO: TStringField
      FieldName = 'GRUPO_SECUNDARIO'
      Size = 60
    end
    object sqlPlanoListagemFIXO: TStringField
      FieldName = 'FIXO'
      Size = 1
    end
    object sqlPlanoListagemQTD_LIMITADA: TStringField
      FieldName = 'QTD_LIMITADA'
      Size = 1
    end
    object sqlPlanoListagemGRUPO_PRINCIPAL: TStringField
      FieldName = 'GRUPO_PRINCIPAL'
      Size = 90
    end
    object sqlPlanoListagemOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 27
    end
  end
  object dtsPlanoLIstagem: TDataSource
    DataSet = sqlPlanoListagem
    Left = 412
    Top = 392
  end
  object PopupMenu1: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 504
    Top = 380
    object MenuItem1: TMenuItem
      Caption = 'Exportar Excel'
      ImageIndex = 2
      OnClick = MenuItem1Click
    end
  end
end
