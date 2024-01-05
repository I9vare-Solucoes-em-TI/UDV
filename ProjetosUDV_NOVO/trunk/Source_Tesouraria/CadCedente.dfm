inherited frmCadCedente: TfrmCadCedente
  Caption = 'Cadastro de Cedentes'
  ClientHeight = 538
  ClientWidth = 851
  ExplicitWidth = 867
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 851
    ExplicitWidth = 851
    inherited PanelBotoesBasicos: TPanel
      Width = 769
      ExplicitWidth = 769
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 771
      ExplicitLeft = 771
    end
  end
  inherited StatusBar: TStatusBar
    Top = 518
    Width = 851
    ExplicitTop = 518
    ExplicitWidth = 851
  end
  inherited PanelGeral: TPanel
    Width = 851
    Height = 462
    ExplicitWidth = 851
    ExplicitHeight = 462
    inherited PanelData: TPanel
      Width = 849
      Height = 139
      ExplicitWidth = 849
      ExplicitHeight = 139
      object cxLabel1: TcxLabel
        Left = 13
        Top = 8
        Caption = 'Cedente:'
        Style.TextColor = 4210688
        Style.TextStyle = [fsBold]
      end
      object cxLabel3: TcxLabel
        Left = 520
        Top = 8
        Caption = 'Boleto:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 628
        Top = 8
        Caption = 'Sincroniza Reuni:'
        ParentColor = False
        Style.Color = clBtnFace
        Style.TextColor = 4210688
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 13
        Top = 35
        Caption = 'Raz'#227'o Social:'
        Style.TextColor = 4210688
        Style.TextStyle = [fsBold]
      end
      object cxLabel6: TcxLabel
        Left = 520
        Top = 35
        Caption = 'CNPJ:'
        Style.TextColor = 4210688
        Style.TextStyle = [fsBold]
      end
      object edtDescricao: TcxDBTextEdit
        Left = 98
        Top = 6
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 5
        Width = 416
      end
      object icxBoleto: TcxDBImageComboBox
        Left = 560
        Top = 6
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'USAR_BOLETO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 65
      end
      object icxSincronizaReuni: TcxDBImageComboBox
        Left = 716
        Top = 6
        RepositoryItem = dtmLookup.Combo_SimNao
        DataBinding.DataField = 'SINCRONIZAR_REUNI'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 7
        Width = 65
      end
      object chbSituacao: TcxDBCheckBox
        Left = 783
        Top = 6
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
        TabOrder = 8
        Height = 21
        Width = 59
      end
      object edtRazao: TcxDBTextEdit
        Left = 98
        Top = 33
        DataBinding.DataField = 'RAZAO_SOCIAL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 9
        Width = 415
      end
      object edtCPFCNPJ: TcxDBMaskEdit
        Left = 561
        Top = 33
        DataBinding.DataField = 'CNPJ_CPF'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '99\.999\.999\/9999\-99;0;_'
        Properties.MaxLength = 0
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 10
        Width = 220
      end
      object cxGroupBox6: TcxGroupBox
        Left = 4
        Top = 60
        Caption = ' Endere'#231'o'
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TextColor = clGreen
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Height = 73
        Width = 835
        object lblEndereco: TcxLabel
          Left = 9
          Top = 20
          Caption = 'Logradouro:'
          Style.TextColor = 4210688
        end
        object cxLabel34: TcxLabel
          Left = 499
          Top = 20
          Caption = 'Bairro:'
          Style.TextColor = 4210688
        end
        object cxLabel35: TcxLabel
          Left = 9
          Top = 45
          Caption = 'Cidade:'
          Style.TextColor = 4210688
        end
        object cxLabel36: TcxLabel
          Left = 303
          Top = 45
          Caption = 'UF:'
          Style.TextColor = 4210688
        end
        object cxLabel38: TcxLabel
          Left = 385
          Top = 45
          Caption = 'Cep:'
          Style.TextColor = 4210688
        end
        object edtEndereco: TcxDBTextEdit
          Left = 69
          Top = 19
          DataBinding.DataField = 'END_LOG'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 5
          Width = 420
        end
        object edtBairro: TcxDBTextEdit
          Left = 536
          Top = 19
          DataBinding.DataField = 'END_BAIRRO'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 6
          Width = 289
        end
        object edtCidade: TcxDBTextEdit
          Left = 69
          Top = 43
          DataBinding.DataField = 'END_CIDADE'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 7
          Width = 228
        end
        object edtUF: TcxDBComboBox
          Left = 327
          Top = 43
          RepositoryItem = dtmLookup.Combo_UF
          DataBinding.DataField = 'END_UF'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 8
          Width = 54
        end
        object edtCEP: TcxDBMaskEdit
          Left = 413
          Top = 43
          DataBinding.DataField = 'END_CEP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '99\.999\-999;0;_'
          Properties.MaxLength = 0
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 9
          Width = 76
        end
        object cxLabel39: TcxLabel
          Left = 499
          Top = 45
          Caption = 'Email:'
          Style.TextColor = 4210688
        end
        object cxDBTextEdit19: TcxDBTextEdit
          Left = 536
          Top = 43
          DataBinding.DataField = 'END_EMAIL'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecLowerCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 11
          Width = 289
        end
      end
    end
    object pgcGrid: TcxPageControl
      Left = 1
      Top = 140
      Width = 849
      Height = 321
      Align = alClient
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      Properties.ActivePage = tbcBoleto
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 321
      ClientRectRight = 849
      ClientRectTop = 24
      object tbcContas: TcxTabSheet
        Caption = 'Cedentes'
        ImageIndex = 0
        object grdBasica: TcxGrid
          Left = 0
          Top = 0
          Width = 849
          Height = 297
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object grdBasicaDBTableView1: TcxGridDBTableView
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
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Inactive = dtmControles.cxStyle23
            Styles.Selection = dtmControles.cxStyle23
            object grdBasicaDBTableView1Column1: TcxGridDBColumn
              Caption = 'Cedente'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 472
            end
            object grdBasicaDBTableView1Column2: TcxGridDBColumn
              Caption = 'Usar Boleto'
              DataBinding.FieldName = 'USAR_BOLETO'
              RepositoryItem = dtmLookup.Combo_SimNao
              Width = 87
            end
            object grdBasicaDBTableView1Column4: TcxGridDBColumn
              Caption = 'Sincroniza Reuni'
              DataBinding.FieldName = 'SINCRONIZAR_REUNI'
              RepositoryItem = dtmLookup.Combo_SimNao
              Width = 118
            end
            object grdBasicaDBTableView1Column3: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SITUACAO'
              RepositoryItem = dtmLookup.Combo_AtivoInativo
              Width = 83
            end
            object grdBasicaDBTableView1Column5: TcxGridDBColumn
              Caption = 'Principal'
              DataBinding.FieldName = 'PRINCIPAL'
              RepositoryItem = dtmLookup.Combo_SimNao
              Width = 79
            end
          end
          object grdBasicaLevel1: TcxGridLevel
            GridView = grdBasicaDBTableView1
          end
        end
      end
      object tbcBoleto: TcxTabSheet
        Caption = 'Dados Banc'#225'rios'
        Color = clSkyBlue
        ImageIndex = 1
        ParentColor = False
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 849
          Height = 297
          Align = alClient
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object Bevel1: TBevel
            Left = 8
            Top = 71
            Width = 821
            Height = 25
            Shape = bsBottomLine
          end
          object cxLabel8: TcxLabel
            Left = 11
            Top = 13
            Caption = 'Banco:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel9: TcxLabel
            Left = 322
            Top = 13
            Caption = 'Ag'#234'ncia:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel10: TcxLabel
            Left = 503
            Top = 13
            Caption = 'Conta:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel11: TcxLabel
            Left = 628
            Top = 12
            Caption = '-'
            Style.TextColor = clNavy
            Transparent = True
          end
          object cxLabel12: TcxLabel
            Left = 130
            Top = 40
            Caption = 'Cedente:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel13: TcxLabel
            Left = 11
            Top = 40
            Caption = 'Carteira:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel14: TcxLabel
            Left = 322
            Top = 40
            Caption = 'Conv'#234'nio:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel7: TcxLabel
            Left = 11
            Top = 69
            Caption = 'Modelo do Boleto Banc'#225'rio:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object lblTaxa: TcxLabel
            Left = 13
            Top = 126
            Caption = 'Taxa Boleto '
            ParentColor = False
            Style.Color = clGrayText
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            StyleHot.TextColor = clBlue
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 239
            Top = 170
            Caption = 
              'Prazo Pagamento                                   Dia/Vencimento' +
              ' Padr'#227'o'
            ParentColor = False
            Style.Color = clGrayText
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            StyleHot.TextColor = clBlue
            Transparent = True
          end
          object cxLabel16: TcxLabel
            Left = 279
            Top = 39
            Caption = '-'
            Style.TextColor = clNavy
            Transparent = True
          end
          object cxLabel17: TcxLabel
            Left = 13
            Top = 170
            Caption = 'Caixa de Lan'#231'amento'
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            Transparent = True
          end
          object chxCobrarTaxa: TcxDBCheckBox
            Left = 11
            Top = 102
            Caption = 'Cobrar Taxa no Boleto'
            DataBinding.DataField = 'COBRAR_BOLETO'
            DataBinding.DataSource = SourceAncestral
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 12
            OnClick = chxCobrarTaxaClick
            Width = 135
          end
          object edtValorTaxa: TcxDBCurrencyEdit
            Left = 13
            Top = 143
            DataBinding.DataField = 'DB_TAXA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.AssignedValues.MinValue = True
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 13
            Width = 77
          end
          object lcxCaixa: TcxDBLookupComboBox
            Left = 13
            Top = 187
            RepositoryItem = dtmLookupContabil.Lista_CaixaAtivos
            DataBinding.DataField = 'CAIXA_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'CONFIG_RELATORIO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsRelatorio
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 14
            Width = 223
          end
          object icxPrazo: TcxDBImageComboBox
            Left = 239
            Top = 187
            DataBinding.DataField = 'PRAZO_PAGAMENTO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <
              item
                Description = '2 dias antes do final do m'#234's'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'Dia definido'
                Value = '2'
              end>
            Properties.OnEditValueChanged = icxPrazoPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 15
            Width = 184
          end
          object edtPrazo: TcxDBSpinEdit
            Left = 429
            Top = 187
            DataBinding.DataField = 'PRAZO_DIA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.MaxValue = 28.000000000000000000
            Properties.MinValue = 20.000000000000000000
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 16
            Width = 77
          end
          object cxDBSpinEdit1: TcxDBSpinEdit
            Left = 509
            Top = 187
            DataBinding.DataField = 'DIA_VENCIMENTO_PADRAO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.MaxValue = 1.000000000000000000
            Properties.MinValue = 30.000000000000000000
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 17
            Width = 53
          end
          object cxLabel15: TcxLabel
            Left = 576
            Top = 40
            Caption = 'Modalidade:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object cxLabel18: TcxLabel
            Left = 456
            Top = 13
            Caption = '-'
            Style.TextColor = clNavy
            Transparent = True
          end
          object icxBanco: TcxDBImageComboBox
            Left = 55
            Top = 10
            DataBinding.DataField = 'DB_CODIGOBANCO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <
              item
                Description = 'BANCO DO BRASIL'
                ImageIndex = 0
                Value = '001-9'
              end
              item
                Description = 'HSBC'
                Value = '399-9'
              end
              item
                Description = 'ITA'#218
                Value = '341-7'
              end
              item
                Description = 'SICOOB'
                Value = '756-1'
              end
              item
                Description = 'BRADESCO'
                Value = '237-2'
              end>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 20
            Width = 261
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 376
            Top = 10
            DataBinding.DataField = 'DB_AGENCIA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 21
            Width = 78
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 470
            Top = 11
            DataBinding.DataField = 'DB_DIGITOAGENCIA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 22
            Width = 26
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 544
            Top = 10
            DataBinding.DataField = 'DB_CONTA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 23
            Width = 78
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 642
            Top = 10
            DataBinding.DataField = 'DB_DIGITOCONTA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 24
            Width = 26
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 56
            Top = 38
            DataBinding.DataField = 'DB_CARTEIRA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 25
            Width = 68
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 178
            Top = 38
            DataBinding.DataField = 'DB_CODIGOCEDENTE'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 26
            Width = 100
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 290
            Top = 38
            DataBinding.DataField = 'DB_DIGITOCODIGO_CEDENTE'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 27
            Width = 26
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 376
            Top = 38
            DataBinding.DataField = 'DB_CONVENIO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 28
            Width = 199
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 642
            Top = 38
            DataBinding.DataField = 'DB_MODALIDADE'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 29
            Width = 71
          end
          object lcxModeloBoleto: TcxDBLookupComboBox
            Left = 147
            Top = 67
            DataBinding.DataField = 'CONFIG_RELATORIO_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'CONFIG_RELATORIO_ID'
            Properties.ListColumns = <
              item
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dtsRelatorio
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 30
            Width = 428
          end
          object btnGravarDados: TcxButton
            Left = 747
            Top = 9
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
            TabOrder = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnGravarDadosClick
          end
          object btnLimpar: TcxButton
            Left = 746
            Top = 37
            Width = 95
            Height = 22
            Caption = 'Limpar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000B00D0000B00D00000001000000000000000000000101
              0100020202000303030004040400050505000606060007070700080808000909
              09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
              1100121212001313130014141400151515001616160017171700181818001919
              19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
              2100222222002323230024242400252525002626260027272700282828002929
              29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
              3100323232003333330034343400353535003636360037373700383838003939
              39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
              4100424242004343430044444400454545004646460047474700484848004949
              49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
              5100525252005353530054545400555555005656560057575700585858005959
              59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
              6100626262006363630064646400656565006666660067676700686868006969
              69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
              7100727272007373730074747400757575007676760077777700787878007979
              79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
              8100828282008383830084848400858585008686860087878700888888008989
              89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
              9100929292009393930094949400959595009696960097979700989898009999
              99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
              A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
              A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
              B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
              B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
              C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
              C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
              D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
              D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
              E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
              E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
              F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
              F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFCDF9A80808282817F8282C1FFFFFFFFFFFFFFFBD49376696A76776D
              687679BCFFFFFFFFFFFFFDC78770739D9D63618BAB7770B8FFFFFFFFFFFCC078
              68687EE2F2A693E3FA8D68B4FFFFFFFFFAB66D5E5E5E628FF8F6F3FCB2655EAF
              FFFFFFFFBA5950535353524D99FFFFBA585153A9FFFFFFFFF7A650484B4B507B
              F6F3EDFA9F534BA5FFFFFFFFFFFAB1473D425FDCF09F8DDFF87142A1FFFFFFFF
              FFFFFCB5483443868E4540769A49399CFFFFFFFFFFFFFFFBBD482C3637303034
              39303098FFFFFFFFFFFFFFFFFFD05E3B3B3B3B3B3B3B3B9DFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            TabOrder = 32
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnLimparClick
          end
          object x: TcxDBCheckBox
            Left = 368
            Top = 102
            Caption = 'Endere'#231'o Associado = Endere'#231'o N'#250'cleo (Remessa)'
            DataBinding.DataField = 'ENDERECO_NUCLEO_ASSOCIADO'
            DataBinding.DataSource = SourceAncestral
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 33
            OnClick = chxCobrarTaxaClick
            Width = 270
          end
          object chxTaxaAssociado: TcxDBCheckBox
            Left = 152
            Top = 102
            Caption = 'Lan'#231'ar a M'#233'dia da Taxa por Associado'
            DataBinding.DataField = 'DB_LANCAR_TAXAMEDIA_ASSOCIADO'
            DataBinding.DataSource = SourceAncestral
            Enabled = False
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 34
            Width = 210
          end
          object cxLabel19: TcxLabel
            Left = 94
            Top = 126
            Caption = 'Compromisso Juros Boleto (Somente na Importa'#231#227'o de Retorno)'
            ParentColor = False
            Style.Color = clGrayText
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            StyleHot.TextColor = clBlue
            Transparent = True
          end
          object lcxCompromissoJuros: TcxDBLookupComboBox
            Left = 93
            Top = 143
            RepositoryItem = dtmLookup.Lista_CompReceitassTodos
            DataBinding.DataField = 'CONTABIL_CONTA_JUROS_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.ListColumns = <>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 36
            Width = 330
          end
          object cxLabel20: TcxLabel
            Left = 430
            Top = 126
            Caption = 'Reserva/Provimento Juros Boleto'
            ParentColor = False
            Style.Color = clGrayText
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            StyleHot.TextColor = clBlue
            Transparent = True
          end
          object lcxReservaId: TcxDBLookupComboBox
            Left = 429
            Top = 143
            RepositoryItem = dtmLookup.Lista_ReservasAtivas
            DataBinding.DataField = 'DB_RESERVA_JUROS_ID'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.ListColumns = <>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 38
            Width = 412
          end
          object cxLabel21: TcxLabel
            Left = 577
            Top = 69
            Caption = 'Layout:'
            Style.TextColor = 4210688
            Transparent = True
          end
          object icxLayout: TcxDBImageComboBox
            Left = 642
            Top = 67
            DataBinding.DataField = 'LAYOUT_REMESSA'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <
              item
                Description = 'Layout 400'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'Layout 240'
                Value = '2'
              end>
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 40
            Width = 200
          end
          object cxLabel22: TcxLabel
            Left = 567
            Top = 170
            Caption = 'Data de Registro do Boleto'
            ParentColor = False
            Style.Color = clGrayText
            Style.TextColor = 4210688
            Style.TextStyle = [fsUnderline]
            StyleHot.TextColor = clBlue
            Transparent = True
          end
          object cxDBImageComboBox1: TcxDBImageComboBox
            Left = 567
            Top = 187
            DataBinding.DataField = 'DATA_REGISTRO_BOLETO'
            DataBinding.DataSource = SourceAncestral
            ParentFont = False
            Properties.Items = <
              item
                Description = 'Data de Pagamento'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'Data do Cr'#233'dito'
                Value = '2'
              end>
            Properties.OnEditValueChanged = icxPrazoPropertiesEditValueChanged
            Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
            TabOrder = 42
            Width = 274
          end
          object cxGroupBox1: TcxGroupBox
            Left = 9
            Top = 218
            Caption = ' Dados do PIX '
            ParentFont = False
            Style.StyleController = dtmControles.cxEditStyleGroup
            TabOrder = 43
            Height = 67
            Width = 833
            object cxLabel23: TcxLabel
              Left = 10
              Top = 16
              Caption = 'Chave PIX'
              Style.TextColor = 4210688
              Style.TextStyle = [fsUnderline]
              Transparent = True
            end
            object cxDBTextEdit10: TcxDBTextEdit
              Left = 11
              Top = 33
              DataBinding.DataField = 'PIX_CHAVE'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 1
              Width = 404
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 657
    Top = 406
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT * '#13#10'FROM T_CEDENTE'#13#10'ORDER BY DESCRICAO'
    Left = 691
    Top = 406
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 719
    Top = 406
  end
  inherited ClientAncestral: TClientDataSet
    AfterEdit = ClientAncestralAfterEdit
    AfterScroll = ClientAncestralAfterScroll
    Left = 752
    Top = 407
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientAncestralUSAR_BOLETO: TStringField
      FieldName = 'USAR_BOLETO'
      Size = 1
    end
    object ClientAncestralEND_LOG: TStringField
      FieldName = 'END_LOG'
      Size = 90
    end
    object ClientAncestralEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 15
    end
    object ClientAncestralEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 60
    end
    object ClientAncestralEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 60
    end
    object ClientAncestralEND_UF: TStringField
      FieldName = 'END_UF'
      Size = 3
    end
    object ClientAncestralDB_NOMEBANCO: TStringField
      FieldName = 'DB_NOMEBANCO'
      Size = 60
    end
    object ClientAncestralDB_CODIGOBANCO: TStringField
      FieldName = 'DB_CODIGOBANCO'
      Size = 10
    end
    object ClientAncestralDB_AGENCIA: TStringField
      FieldName = 'DB_AGENCIA'
      Size = 10
    end
    object ClientAncestralDB_CONTA: TStringField
      FieldName = 'DB_CONTA'
      Size = 10
    end
    object ClientAncestralDB_CODIGOCEDENTE: TStringField
      FieldName = 'DB_CODIGOCEDENTE'
      Size = 10
    end
    object ClientAncestralDB_CARTEIRA: TStringField
      FieldName = 'DB_CARTEIRA'
      Size = 10
    end
    object ClientAncestralDB_CONVENIO: TStringField
      FieldName = 'DB_CONVENIO'
      Size = 10
    end
    object ClientAncestralDB_TAXA: TFMTBCDField
      FieldName = 'DB_TAXA'
      Precision = 20
      Size = 3
    end
    object ClientAncestralDB_MULTA: TFMTBCDField
      FieldName = 'DB_MULTA'
      Precision = 20
      Size = 2
    end
    object ClientAncestralSINCRONIZAR_REUNI: TStringField
      FieldName = 'SINCRONIZAR_REUNI'
      Size = 1
    end
    object ClientAncestralCOBRAR_MULTA: TStringField
      FieldName = 'COBRAR_MULTA'
      Size = 1
    end
    object ClientAncestralCOBRAR_BOLETO: TStringField
      FieldName = 'COBRAR_BOLETO'
      Size = 1
    end
    object ClientAncestralPRAZO_PAGAMENTO: TStringField
      FieldName = 'PRAZO_PAGAMENTO'
      Size = 1
    end
    object ClientAncestralPRAZO_DIA: TFMTBCDField
      FieldName = 'PRAZO_DIA'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTABIL_CONTA_MULTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_MULTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTABIL_CONTA_TAXA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_TAXA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDIA_VENCIMENTO_PADRAO: TFMTBCDField
      FieldName = 'DIA_VENCIMENTO_PADRAO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDB_DIGITOCONTA: TStringField
      FieldName = 'DB_DIGITOCONTA'
      Size = 3
    end
    object ClientAncestralDB_DIGITOCODIGO_CEDENTE: TStringField
      FieldName = 'DB_DIGITOCODIGO_CEDENTE'
      Size = 3
    end
    object ClientAncestralCAIXA_ID: TFMTBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 15
    end
    object ClientAncestralRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 120
    end
    object ClientAncestralDB_MODALIDADE: TStringField
      FieldName = 'DB_MODALIDADE'
      Size = 3
    end
    object ClientAncestralDB_DIGITOAGENCIA: TStringField
      FieldName = 'DB_DIGITOAGENCIA'
      Size = 3
    end
    object ClientAncestralENDERECO_NUCLEO_ASSOCIADO: TStringField
      FieldName = 'ENDERECO_NUCLEO_ASSOCIADO'
      Size = 1
    end
    object ClientAncestralDB_LANCAR_TAXAMEDIA_ASSOCIADO: TStringField
      FieldName = 'DB_LANCAR_TAXAMEDIA_ASSOCIADO'
      Size = 1
    end
    object ClientAncestralCONTABIL_CONTA_JUROS_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_JUROS_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralDB_RESERVA_JUROS_ID: TFMTBCDField
      FieldName = 'DB_RESERVA_JUROS_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralEND_EMAIL: TStringField
      FieldName = 'END_EMAIL'
      Size = 30
    end
    object ClientAncestralLAYOUT_REMESSA: TStringField
      FieldName = 'LAYOUT_REMESSA'
      Size = 1
    end
    object ClientAncestralDATA_REGISTRO_BOLETO: TStringField
      FieldName = 'DATA_REGISTRO_BOLETO'
      Size = 1
    end
    object ClientAncestralPIX_CHAVE: TStringField
      FieldName = 'PIX_CHAVE'
      Size = 90
    end
    object ClientAncestralPIX_CEDENTE: TStringField
      FieldName = 'PIX_CEDENTE'
      Size = 15
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 783
    Top = 406
  end
  object sqlRelatorio: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONFIG_RELATORIO_ID'#13#10'FROM G_CONFIG_RELATORIO'#13#10 +
      'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 588
    Top = 360
    object sqlRelatorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsRelatorio: TDataSource
    DataSet = sqlRelatorio
    Left = 588
    Top = 392
  end
end
