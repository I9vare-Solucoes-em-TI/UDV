inherited frmCadGrupoFamiliar: TfrmCadGrupoFamiliar
  Caption = 'Grupo Associado'
  ClientHeight = 531
  ClientWidth = 851
  ExplicitWidth = 867
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 851
    ExplicitWidth = 841
    inherited PanelBotoesBasicos: TPanel
      Width = 708
      ExplicitWidth = 698
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Enabled = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 710
      Width = 139
      ExplicitLeft = 700
      ExplicitWidth = 139
      inherited cxBtnFechar: TcxButton
        Left = 69
        Top = 3
        ExplicitLeft = 69
        ExplicitTop = 3
      end
      object btnSelecionar: TcxButton
        Left = 3
        Top = 3
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Hint = 'Fechar (Esc)'
        Caption = 'Selecionar'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        OptionsImage.Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnSelecionarClick
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 511
    Width = 851
    ExplicitTop = 511
    ExplicitWidth = 841
  end
  inherited PanelGeral: TPanel
    Width = 851
    Height = 455
    ExplicitWidth = 841
    ExplicitHeight = 455
    inherited PanelData: TPanel
      Width = 849
      Height = 40
      ExplicitLeft = 2
      ExplicitWidth = 884
      ExplicitHeight = 40
      object cxLabel29: TcxLabel
        Left = 11
        Top = 13
        Caption = 'Descri'#231#227'o:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextColor = 4210688
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 440
        Top = 13
        Caption = 'Fatura por email:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 612
        Top = 13
        Caption = 'Fatura Tipo:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object edtNome: TcxDBTextEdit
        Left = 67
        Top = 11
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Shadow = True
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 3
        Width = 365
      end
      object icxBoleto: TcxDBImageComboBox
        Left = 524
        Top = 11
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'BOLETO_EMAIL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 4
        Width = 85
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 672
        Top = 11
        RepositoryItem = dtmLookupContabil.Combo_FaturaTipo
        DataBinding.DataField = 'FATURA_TIPO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 94
      end
      object chbSituacao: TcxDBCheckBox
        Left = 777
        Top = 11
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
        TabOrder = 6
        Height = 21
        Width = 59
      end
    end
    object pgcGrupo: TcxPageControl
      Left = 1
      Top = 41
      Width = 849
      Height = 413
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tabGrupo
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ExplicitWidth = 839
      ClientRectBottom = 413
      ClientRectRight = 849
      ClientRectTop = 24
      object tabGrupo: TcxTabSheet
        Caption = 'Grupos'
        ImageIndex = 0
        ExplicitWidth = 839
        object tbcSituacao: TcxTabControl
          Left = 0
          Top = 0
          Width = 849
          Height = 389
          Align = alClient
          TabOrder = 0
          Properties.CustomButtons.Buttons = <>
          Properties.TabIndex = 0
          Properties.Tabs.Strings = (
            'Ativos'
            'Inativos')
          OnChange = tbcSituacaoChange
          ExplicitWidth = 839
          ClientRectBottom = 389
          ClientRectRight = 849
          ClientRectTop = 24
          object grdBasica: TcxGrid
            Left = 0
            Top = 24
            Width = 849
            Height = 365
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            ExplicitLeft = 1
            ExplicitTop = 25
            object cxGridPesquisa: TcxGridDBTableView
              OnDblClick = cxGridPesquisaDblClick
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
              DataController.DataSource = SourceAncestral
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
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'Qtd.: 0 '
                  Kind = skCount
                  FieldName = 'DESCRICAO'
                  Column = cxGridPesquisaColumn1
                end>
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
              OptionsView.Footer = True
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.GroupRowHeight = 25
              OptionsView.GroupRowStyle = grsOffice11
              Preview.Visible = True
              object cxGridPesquisaColumn1: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'DESCRICAO'
                Width = 372
              end
              object cxGridPesquisaColumn5: TcxGridDBColumn
                Caption = 'Fatura Tipo'
                DataBinding.FieldName = 'FATURA_TIPO'
                RepositoryItem = dtmLookupContabil.Combo_FaturaTipo
                Options.Editing = False
                Options.Focusing = False
                Width = 74
              end
              object cxGridPesquisaColumn2: TcxGridDBColumn
                Caption = 'Fatura Email'
                DataBinding.FieldName = 'BOLETO_EMAIL'
                RepositoryItem = dtmLookup.Combo_SimNao
                Width = 82
              end
              object cxGridPesquisaColumn3: TcxGridDBColumn
                Caption = 'Email de Envio'
                DataBinding.FieldName = 'EMAIL'
                Width = 266
              end
              object cxGridPesquisaColumn4: TcxGridDBColumn
                Caption = 'Ativo'
                DataBinding.FieldName = 'SITUACAO'
                RepositoryItem = dtmLookup.Combo_AtivoInativo
                Width = 88
              end
            end
            object grdBasicaLevel1: TcxGridLevel
              GridView = cxGridPesquisa
            end
          end
        end
      end
      object tabVinculos: TcxTabSheet
        Caption = 'Associados Vinculados'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 24
          Width = 839
          Height = 365
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView1: TcxGridDBTableView
            OnDblClick = cxGridPesquisaDblClick
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
            DataController.DataSource = dtsAssociados
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
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'Associado'
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Options.Filtering = False
              Width = 267
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 839
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object btnAdAssociado: TSpeedButton
            Left = 809
            Top = 2
            Width = 19
            Height = 21
            Cursor = crHandPoint
            Hint = 'Adicionar Associado ao Agendamento Selecionado'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000E7C6A5E7C6A5
              E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6
              A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5D0BF9993AB775293513D
              8B443A8940488C468BA46DCDBC95E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
              E7C6A5B3B78C549A5A40984F7CC18E95D0A595CFA577BD88358C413D873EA9AF
              7FE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5B6B98F539D5F63B377A7DBB486CC9765
              BB7C63B97B85CB97A4D9B357A96A338338A9AF7FE7C6A5E7C6A5E7C6A5D4C29D
              64A66C69B87CA7DBB15FBB765BB97258B76F58B46E57B46E5AB673A4D9B259A9
              6B3E883FCEBC95E7C6A5E7C6A5A2B78A52AA67A9DDB363C0785EBD705FBB76FF
              FFFFFFFFFF58B76F57B46D5BB673A5DAB3378E428AA46DE7C6A5E7C6A573AF7B
              89CC9788D3956AC57962C06F54AA64FFFFFFFFFFFF58B76F58B76F5AB87184CC
              967ABD8C498D47E7C6A5E7C6A569AF7BA8DDB27CCF8974CC80FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF58B76F66BD7C9BD4AA398940E7C6A5E7C6A56CB27E
              B5E2BD8AD59679C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58B76F68C0
              7D9CD4A93D8C45E7C6A5E7C6A57DB787ABDDB5A5DFAE80CB8B7BC9856DBC78FF
              FFFFFFFFFF5AAB695FBB765BB9728AD1987FC491539553E7C6A5E7C6A5ACBF96
              84C796D2EED794D99F89D3937EC888FFFFFFFFFFFF78CD846AC27B6EC77DABDF
              B4449D5694AB79E7C6A5E7C6A5D7C4A17BB989A9DAB6D8F1DC91D89C87CD9283
              CC8D8AD49589D49482D28DAEE0B66AB87C579C5DD1BF9AE7C6A5E7C6A5E7C6A5
              C1C29C74B887AEDCBADCF2E0B5E4BC9ADBA495D99FA4DFAEBFE8C478C189569F
              61B4B88DE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5C1C29C7CB88993CEA3C2E6CBCF
              EBD4C9E9CEAEDDB76CB87E65A76EB7BA90E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
              E7C6A5E7C6A5D7C4A1ADBF967EB7886FB3816CB17D75B17DA4B88CD4C29DE7C6
              A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7
              C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAdAssociadoClick
          end
          object btnRemoverAssociado: TSpeedButton
            Left = 789
            Top = 2
            Width = 19
            Height = 21
            Cursor = crHandPoint
            Hint = 'Remove o Associado do Agendamento Selecionado'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
              8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000008C00396BFF000010FF000018FF000018FF000018EF000018E7000018
              DE000018CE000018C6000018BD0000008C00FF00FF00FF00FF00FF00FF00FF00
              FF0000008C0094B5FF004A63FF004A6BFF004A6BFF004A6BFF004A6BF7004A6B
              EF00395AE7003152DE00315ADE0000008C00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000008C0000008C0000008C0000008C0000008C0000008C000000
              8C0000008C0000008C0000008C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnRemoverAssociadoClick
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 413
    Top = 262
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM T_PESSOA_GRUPO'#13#10'ORDER BY DESCRICAO'
    Left = 443
    Top = 262
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 475
    Top = 262
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 506
    Top = 262
    object ClientAncestralPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 120
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralFATURA_TIPO: TStringField
      FieldName = 'FATURA_TIPO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 539
    Top = 262
  end
  object sqlAssociados: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT NOME, PESSOA_ID, PESSOA_GRUPO_ID,  BOLETO_EMAIL'#13#10'FROM T_P' +
      'ESSOA'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'     AND PESSOA_GRUPO_ID ' +
      '= :PESSOA_GRUPO_ID'#13#10'ORDER BY NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PESSOA_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlAssociadosAfterScroll
    Left = 412
    Top = 188
    object sqlAssociadosNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlAssociadosPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlAssociadosBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
  end
  object dtsAssociados: TDataSource
    DataSet = sqlAssociados
    Left = 412
    Top = 220
  end
end