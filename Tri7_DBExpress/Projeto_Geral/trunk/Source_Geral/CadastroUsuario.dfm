﻿inherited frmUsuario: TfrmUsuario
  Left = 278
  Top = 239
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 572
  ClientWidth = 1008
  OldCreateOrder = True
  ExplicitWidth = 1024
  ExplicitHeight = 611
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 1008
    ExplicitWidth = 1008
    inherited PanelBotoesBasicos: TPanel
      Width = 926
      ExplicitWidth = 926
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          TabOrder = 5
          Visible = False
        end
        inherited cxBtnCancelar: TcxButton
          TabOrder = 4
        end
        inherited cxBtnGravar: TcxButton
          TabOrder = 3
        end
        inherited cxBtnExcluir: TcxButton
          TabOrder = 2
        end
        inherited cxBtnAlterar: TcxButton
          TabOrder = 1
        end
        inherited cxBtnIncluir: TcxButton
          TabOrder = 0
        end
      end
      object btnHoraExtra: TcxButton
        Left = 386
        Top = 14
        Width = 106
        Height = 25
        Caption = 'Hora Extra'
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000015080600662C1F0097452D00CB5D3CCBCB5D3CCA9745
          2D00662C1F001508060000000000000000000000000000000000000000000000
          00000B040300672D1F00CF603EDEDE6B42E6E68C6CEFEFAE97EFEFAE97E6E68C
          6CDEDE6B42CFCF603EB6662C1F000B0403000000000000000000000000000B04
          03009D4D3300E47C4BF0F0B29AFDFDE9E3FFFFEFE8FFFFE7D9FFFFE7D8FFFFEE
          E7FDFDE8E1EFEFAE97DEDE6B42BE9A442E000B04030000000000000000006934
          2300EB8E54F6F6CBB4FFFFF2ECFFFFDEC6FFFFCFA8FFFFCDA5FFFFCCA2FFFFCB
          A0FFFFD9BCFFFFEEE7F3F3BFACDEDE6B42B6662C1F000000000015080600DD87
          51F7F7C7A6FFFFF4EFFFFFDEC4FFFFD7B6E6E6BFA2FFFFD4B0FFFFD2ADFFFFD0
          AAFFFFCEA7FFFFD4B2FFFFEFE9EFEFAE98CFCF603EA2150806006B382500F4A7
          5FFEFEF2EBFFFFE9D8FFFFDFC4EFEFCEB584846863CECEAB97FFFFD8B8FFFFD6
          B5FFFFD5B2FFFFD3AFFFFFDEC6FDFDEAE4DEDE6B42B6662C1F00AE6D4200F9C1
          88FFFFF8F4FFFFE7D3FFFFE5D0FFFFE3CCE6E6CAB684846864CECEAE9CFFFFDC
          C0FFFFDBBDFFFFD9BAFFFFD7B7FFFFF3EDE6E68D6ECA97452D00E49A5AFCFCD8
          B0FFFFF7F2FFFFEDDEFFFFEBDBFFFFE9D8FFFFE8D5E6E6CDBC7C7C605DFFFFE2
          CBFFFFE1C8FFFFDFC5FFFFDDC2FFFFEFE6EFEFB09ACBCB5D3CE5E59E5CFDFDDC
          B2FFFFFAF6FFFFF3E9FFFFF1E6FFFFEFE3FFFFEEE0FFFFECDD7C7C605DFFFFE9
          D6FFFFE7D3FFFFE5D0FFFFE4CDFFFFF2EAEFEFB19BCFCF603EDAB1754500FDCF
          90FFFFFCFBFFFFF9F4FFFFF7F1FFFFF6EEFFFFF4EBFFFFF2E87C7C605DFFFFEF
          E1FFFFEDDEFFFFEBDBFFFFEAD8FFFFF7F4E6E68E6FC7A14930006C3C2700FEC3
          6DFFFFFAF5FFFFFEFDFFFFFDFCFFFFFCF9FFFFFAF6FFFFF8F37C7C605DFFFFF5
          EDFFFFF3EAFFFFF1E7FFFFF4EBFDFDF2EDE0E07045B6662C1F0015080600E7A4
          5FFFFFE2B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFD7C7C605DFFFFFB
          F8FFFFF9F5FFFFF8F3FFFFFBFAF3F3BFA4D4D46C44A215080600000000006C3D
          2700FFC66FFFFFE9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E1E1FFFFFF
          FFFFFFFEFEFFFFFDFDF8F8D6BEEBEB8E53B96831210000000000000000000B04
          0300A6663F00FFC66FFFFFE2B7FFFFFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFAF5F9F9D2AFF1F19E5BC5A05536000B04030000000000000000000000
          00000B0403006C3D2700E8A55FFEFEC56EFEFED292FEFEE0B5FDFDDEB5FBFBCA
          8DF8F8B265E1E19155BD6A3724000B0403000000000000000000000000000000
          00000000000000000000150806006C3D2700B2764600E7A25EE6E69F5DD9B071
          44006B3A25001508060000000000000000000000000000000000}
        TabOrder = 1
        OnClick = btnHoraExtraClick
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 928
      ExplicitLeft = 928
    end
  end
  inherited StatusBar: TStatusBar
    Top = 552
    Width = 1008
    ExplicitTop = 552
    ExplicitWidth = 1008
  end
  inherited PanelGeral: TPanel
    Width = 1008
    Height = 496
    TabOrder = 1
    ExplicitWidth = 1008
    ExplicitHeight = 496
    inherited PanelData: TPanel
      Width = 1006
      Height = 0
      TabOrder = 1
      ExplicitWidth = 1006
      ExplicitHeight = 0
    end
    object pagPrincipal: TcxPageControl
      Left = 1
      Top = 1
      Width = 1006
      Height = 494
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tbsUsuario
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OnChange = pagPrincipalChange
      ClientRectBottom = 494
      ClientRectRight = 1006
      ClientRectTop = 24
      object tbsUsuario: TcxTabSheet
        Caption = 'Dados do Usu'#225'rio'
        ImageIndex = 0
        object pnlDadosUsuarios: TPanel
          Left = 463
          Top = 0
          Width = 543
          Height = 470
          Align = alRight
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 1
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 259
            Align = alClient
            Caption = 'Sistema(s) Vinculado(s)'
            Style.TextStyle = [fsBold]
            TabOrder = 1
            Height = 211
            Width = 543
            object cxGrid1: TcxGrid
              Left = 2
              Top = 18
              Width = 539
              Height = 191
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Buttons.PriorPage.Visible = False
                Navigator.Buttons.NextPage.Visible = False
                Navigator.Buttons.Insert.Visible = False
                Navigator.Buttons.Append.Visible = False
                Navigator.Buttons.Delete.Visible = False
                Navigator.Buttons.Edit.Visible = False
                Navigator.Buttons.Post.Visible = False
                Navigator.Buttons.Cancel.Visible = False
                Navigator.Buttons.Refresh.Visible = False
                Navigator.Buttons.SaveBookmark.Visible = False
                Navigator.Buttons.GotoBookmark.Visible = False
                Navigator.Buttons.Filter.Visible = False
                Navigator.Visible = True
                DataController.DataSource = dtsUsuarioSistema
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'Total:0'
                    Kind = skCount
                    FieldName = 'USUARIO_ID'
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.ColumnHeaderHints = False
                OptionsData.Appending = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GridLines = glVertical
                OptionsView.GroupByBox = False
                Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                object cxGridDBColumn1: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'SISTEMA_ID'
                  RepositoryItem = dtmLookup.Combo_Sistema
                  Options.Editing = False
                  Width = 159
                end
                object cxGridDBTableView1Column1: TcxGridDBColumn
                  Caption = 'Grupo'
                  DataBinding.FieldName = 'DESCRICAO'
                  Options.Editing = False
                  Width = 228
                end
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 543
            Height = 259
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object pnlCadastro: TPanel
              Left = 0
              Top = 0
              Width = 390
              Height = 259
              Align = alLeft
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object pnlDadosGerais: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 28
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object chbSituacao: TcxDBCheckBox
                  Left = 9
                  Top = 3
                  AutoSize = False
                  Caption = 'Ativo'
                  DataBinding.DataField = 'SITUACAO'
                  DataBinding.DataSource = SourceAncestral
                  ParentBackground = False
                  ParentColor = False
                  ParentFont = False
                  Properties.DisplayChecked = 'A'
                  Properties.DisplayGrayed = 'I'
                  Properties.NullStyle = nssUnchecked
                  Properties.ValueChecked = 'A'
                  Properties.ValueUnchecked = 'I'
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 0
                  Transparent = True
                  Height = 21
                  Width = 60
                end
                object chbAssinar: TcxDBCheckBox
                  Left = 56
                  Top = 3
                  AutoSize = False
                  Caption = 'Assina'
                  DataBinding.DataField = 'ASSINA'
                  DataBinding.DataSource = SourceAncestral
                  ParentBackground = False
                  ParentColor = False
                  ParentFont = False
                  Properties.DisplayChecked = 'S'
                  Properties.DisplayGrayed = 'N'
                  Properties.NullStyle = nssUnchecked
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 1
                  Transparent = True
                  Height = 21
                  Width = 55
                end
                object chbTrocarSenha: TcxDBCheckBox
                  Left = 112
                  Top = 3
                  AutoSize = False
                  Caption = 'Trocar Senha ao Logar'
                  DataBinding.DataField = 'TROCARSENHA'
                  DataBinding.DataSource = SourceAncestral
                  ParentBackground = False
                  ParentColor = False
                  ParentFont = False
                  Properties.DisplayChecked = 'S'
                  Properties.DisplayGrayed = 'N'
                  Properties.NullStyle = nssUnchecked
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 2
                  Transparent = True
                  Height = 21
                  Width = 133
                end
                object cxDBCheckBox1: TcxDBCheckBox
                  Left = 251
                  Top = 3
                  AutoSize = False
                  Caption = 'Alertar Selo M'#237'nimo'
                  DataBinding.DataField = 'ALERTA_SELO_MINIMO'
                  DataBinding.DataSource = SourceAncestral
                  ParentBackground = False
                  ParentColor = False
                  ParentFont = False
                  Properties.DisplayChecked = 'S'
                  Properties.DisplayGrayed = 'N'
                  Properties.NullStyle = nssUnchecked
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 3
                  Transparent = True
                  Height = 21
                  Width = 123
                end
              end
              object pgcDadosCadastro: TcxPageControl
                Left = 0
                Top = 28
                Width = 390
                Height = 231
                Align = alClient
                TabOrder = 1
                Properties.ActivePage = tbcDadosUsuario
                Properties.CustomButtons.Buttons = <>
                ClientRectBottom = 231
                ClientRectRight = 390
                ClientRectTop = 24
                object tbcDadosUsuario: TcxTabSheet
                  Caption = 'Dados Usu'#225'rio'
                  ImageIndex = 0
                  object pnlDadosCadastro: TPanel
                    Left = 0
                    Top = 0
                    Width = 390
                    Height = 207
                    Align = alClient
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 0
                    object cxLabel2: TcxLabel
                      Left = 7
                      Top = 5
                      Caption = 
                        'C'#243'digo          Login                                           ' +
                        '    Senha                   Sigla    '
                      ParentFont = False
                      Style.StyleController = dtmControles.cxStyleLabel
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object cxLabel6: TcxLabel
                      Left = 7
                      Top = 43
                      Caption = 'Nome Completo'
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object cxLabel1: TcxLabel
                      Left = 7
                      Top = 120
                      Caption = 'Email'
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object cxLabel3: TcxLabel
                      Left = 6
                      Top = 81
                      Caption = 
                        'Fun'#231#227'o                                                          ' +
                        '      Comiss'#227'o             '
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object cxLabel5: TcxLabel
                      Left = 236
                      Top = 120
                      Caption = 'CPF'
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object edtCodigo: TcxDBTextEdit
                      Left = 9
                      Top = 23
                      DataBinding.DataField = 'USUARIO_ID'
                      DataBinding.DataSource = SourceAncestral
                      Enabled = False
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.TextColor = clNavy
                      TabOrder = 1
                      Width = 56
                    end
                    object edtLogin: TcxDBTextEdit
                      Left = 71
                      Top = 23
                      DataBinding.DataField = 'LOGIN'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.CharCase = ecUpperCase
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 2
                      Width = 162
                    end
                    object edtSenha: TcxDBTextEdit
                      Left = 238
                      Top = 23
                      DataBinding.DataField = 'SENHA'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.EchoMode = eemPassword
                      Properties.MaxLength = 8
                      Properties.PasswordChar = '#'
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 3
                      Width = 84
                    end
                    object edtSigla: TcxDBTextEdit
                      Left = 326
                      Top = 23
                      DataBinding.DataField = 'SIGLA'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.CharCase = ecUpperCase
                      Properties.MaxLength = 5
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 4
                      Width = 56
                    end
                    object edtNome: TcxDBTextEdit
                      Left = 9
                      Top = 61
                      DataBinding.DataField = 'NOME_COMPLETO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      StyleFocused.TextColor = 4210688
                      TabOrder = 6
                      Width = 375
                    end
                    object edtFuncao: TcxDBTextEdit
                      Left = 9
                      Top = 98
                      DataBinding.DataField = 'FUNCAO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 8
                      Width = 224
                    end
                    object cxDBCurrencyEdit1: TcxDBCurrencyEdit
                      Left = 237
                      Top = 98
                      DataBinding.DataField = 'COMISSAO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 9
                      Width = 145
                    end
                    object cxDBTextEdit1: TcxDBTextEdit
                      Left = 9
                      Top = 138
                      DataBinding.DataField = 'EMAIL'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.CharCase = ecLowerCase
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 12
                      Width = 224
                    end
                    object cxDBTextEdit2: TcxDBTextEdit
                      Left = 237
                      Top = 138
                      DataBinding.DataField = 'CPF'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.CharCase = ecLowerCase
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 13
                      Width = 145
                    end
                    object gpbHorario: TcxGroupBox
                      Left = 6
                      Top = 158
                      ParentBackground = False
                      ParentColor = False
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEditStyleGroup
                      TabOrder = 14
                      Transparent = True
                      Height = 42
                      Width = 376
                      object cxLabel15: TcxLabel
                        Left = 198
                        Top = 14
                        Caption = #224's'
                      end
                      object edtHoraInicio: TcxDBMaskEdit
                        Left = 129
                        Top = 14
                        DataBinding.DataField = 'HORA_INICIO'
                        DataBinding.DataSource = SourceAncestral
                        Enabled = False
                        ParentFont = False
                        Properties.EditMask = '!90:00:00;1;_'
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        TabOrder = 1
                        Width = 66
                      end
                      object edtHoraFim: TcxDBMaskEdit
                        Left = 216
                        Top = 14
                        DataBinding.DataField = 'HORA_FIM'
                        DataBinding.DataSource = SourceAncestral
                        Enabled = False
                        ParentFont = False
                        Properties.EditMask = '!90:00:00;1;_'
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        TabOrder = 3
                        Width = 66
                      end
                      object chxUsarHorario: TcxDBCheckBox
                        Left = 8
                        Top = 14
                        AutoSize = False
                        Caption = 'Controle de Hor'#225'rio:'
                        DataBinding.DataField = 'CONTROLE_HORARIO'
                        DataBinding.DataSource = SourceAncestral
                        ParentBackground = False
                        ParentColor = False
                        ParentFont = False
                        Properties.DisplayChecked = 'S'
                        Properties.DisplayGrayed = 'N'
                        Properties.NullStyle = nssUnchecked
                        Properties.ValueChecked = 'S'
                        Properties.ValueUnchecked = 'N'
                        Properties.OnChange = chxUsarHorarioPropertiesChange
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        TabOrder = 0
                        Height = 18
                        Width = 118
                      end
                      object cxDBCheckBox4: TcxDBCheckBox
                        Left = 288
                        Top = 14
                        AutoSize = False
                        Caption = 'Dias '#218'teis'
                        DataBinding.DataField = 'DIAS_UTEIS'
                        DataBinding.DataSource = SourceAncestral
                        ParentBackground = False
                        ParentColor = False
                        ParentFont = False
                        Properties.DisplayChecked = 'S'
                        Properties.DisplayGrayed = 'N'
                        Properties.NullStyle = nssUnchecked
                        Properties.ValueChecked = 'S'
                        Properties.ValueUnchecked = 'N'
                        Properties.OnChange = chxUsarHorarioPropertiesChange
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        TabOrder = 4
                        Height = 18
                        Width = 74
                      end
                    end
                  end
                end
                object tbcDadosRegistro: TcxTabSheet
                  Caption = 'Dados do Registro de Im'#243'veis'
                  ImageIndex = 1
                  object pnlDadosRegistro: TPanel
                    Left = 0
                    Top = 0
                    Width = 390
                    Height = 207
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel8: TcxLabel
                      Left = 7
                      Top = 6
                      Caption = 'Andamento Padr'#227'o 1'#186
                      ParentColor = False
                      ParentFont = False
                      Style.StyleController = dtmControles.cxStyleLabel
                      Transparent = True
                    end
                    object cxLabel9: TcxLabel
                      Left = 7
                      Top = 46
                      Caption = 'Andamento Padr'#227'o 2'#186
                      ParentColor = False
                      ParentFont = False
                      Style.StyleController = dtmControles.cxStyleLabel
                      Transparent = True
                    end
                    object lcxAndamentoPadrao: TcxDBLookupComboBox
                      Left = 8
                      Top = 23
                      RepositoryItem = dtmLookup.Lista_AndamentoRI
                      DataBinding.DataField = 'ANDAMENTO_PADRAO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.ClearKey = 46
                      Properties.ListColumns = <>
                      Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                      TabOrder = 1
                      Width = 354
                    end
                    object lcxAndamentoPadrao2: TcxDBLookupComboBox
                      Left = 8
                      Top = 62
                      RepositoryItem = dtmLookup.Lista_AndamentoRI
                      DataBinding.DataField = 'ANDAMENTO_PADRAO2'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.ClearKey = 46
                      Properties.ListColumns = <>
                      Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                      TabOrder = 4
                      Width = 354
                    end
                    object cxDBCheckBox2: TcxDBCheckBox
                      Left = 8
                      Top = 87
                      AutoSize = False
                      Caption = 'Assina Certid'#227'o'
                      DataBinding.DataField = 'ASSINA_CERTIDAO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DisplayChecked = 'S'
                      Properties.DisplayGrayed = 'N'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Style.BorderStyle = ebsUltraFlat
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -11
                      Style.Font.Name = 'MS Sans Serif'
                      Style.Font.Style = [fsBold]
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.IsFontAssigned = True
                      TabOrder = 6
                      Transparent = True
                      Height = 21
                      Width = 116
                    end
                    object chbAnalistaDocDiverso: TcxDBCheckBox
                      Left = 130
                      Top = 87
                      AutoSize = False
                      Caption = 'Analista Doc. Diversos'
                      DataBinding.DataField = 'ANALISTA_DOC_DIVERSO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DisplayChecked = 'S'
                      Properties.DisplayGrayed = 'N'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Style.BorderStyle = ebsUltraFlat
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -11
                      Style.Font.Name = 'MS Sans Serif'
                      Style.Font.Style = [fsBold]
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.IsFontAssigned = True
                      TabOrder = 7
                      Transparent = True
                      Height = 21
                      Width = 159
                    end
                    object cxDBCheckBox3: TcxDBCheckBox
                      Left = 8
                      Top = 108
                      AutoSize = False
                      Caption = 'N'#227'o receber chat enviado para "Todos"'
                      DataBinding.DataField = 'NAO_RECEBER_CHAT_TODOS'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DisplayChecked = 'S'
                      Properties.DisplayGrayed = 'N'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Style.BorderStyle = ebsUltraFlat
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -11
                      Style.Font.Name = 'MS Sans Serif'
                      Style.Font.Style = [fsBold]
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.IsFontAssigned = True
                      TabOrder = 8
                      Transparent = True
                      Height = 21
                      Width = 266
                    end
                    object chbReceberMensagem: TcxDBCheckBox
                      Left = 8
                      Top = 130
                      AutoSize = False
                      Caption = 'Receber Msg. de Arrolamento de Bens'
                      DataBinding.DataField = 'RECEBER_MENSAGEM_ARROLAMENTO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DisplayChecked = 'S'
                      Properties.DisplayGrayed = 'N'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Style.BorderStyle = ebsUltraFlat
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -11
                      Style.Font.Name = 'MS Sans Serif'
                      Style.Font.Style = [fsBold]
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.IsFontAssigned = True
                      TabOrder = 9
                      Transparent = True
                      Height = 21
                      Width = 243
                    end
                    object btnLimparAndPadrao1: TcxButton
                      Left = 364
                      Top = 24
                      Width = 22
                      Height = 19
                      Colors.Default = clWhite
                      LookAndFeel.Kind = lfUltraFlat
                      LookAndFeel.NativeStyle = False
                      OptionsImage.Glyph.Data = {
                        C6050000424DC605000000000000360400002800000014000000140000000100
                        08000000000090010000130B0000130B00000001000000000000000000000101
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
                        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE8E9FF
                        FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFEDC5753E5FFFFFFFFFFFFFFFFFCA3379F
                        F5FFFDD6610D0467DFFFFFFFFFFFFFFBAB20022D9EF5FAA31500000A62DDFFFF
                        FFFFFCAA2900000146E6FEE2660800000A65E4FFFFFCAC290200002FB7FAFFFF
                        EF760F00000259DDF7A21D00000338C1FFFFFFFFFFEC72070000005F9A210000
                        0038BEFFFFFFFFFFFFFFED690C000008110000002CC2FFFFFFFFFFFFFFFFFFE3
                        6F0D000000000332B7FFFFFFFFFFFFFFFFFFFFFEDF56000000001CADFBFFFFFF
                        FFFFFFFFFFFFFFF7A52100000000095EDDFFFFFFFFFFFFFFFFFFFCA521000000
                        0200000056E4FFFFFFFFFFFFFFFBAB1D000000315A0C00000265DFFFFFFFFFFF
                        FCAA2900000030BBDE6E0A00000A62DDFFFFFFFCAC290200002DB8FBFEE26608
                        00000A67E5FFFAAD1F00000338C1FFFFFFFFEF750F00000256EAFBB831030038
                        BEFFFFFFFFFFFFEC720700136DEDFFF8B23630C2FFFFFFFFFFFFFFFFEC6A1F77
                        E7FFFFFFF8BDC7FFFFFFFFFFFFFFFFFFFFE5B1E7FFFFFFFFFFFCFEFFFFFFFFFF
                        FFFFFFFFFFFEFCFFFFFF}
                      SpeedButtonOptions.CanBeFocused = False
                      SpeedButtonOptions.Flat = True
                      SpeedButtonOptions.Transparent = True
                      TabOrder = 2
                    end
                    object btnLimparAndPadrao2: TcxButton
                      Left = 364
                      Top = 64
                      Width = 22
                      Height = 19
                      Colors.Default = clWhite
                      LookAndFeel.Kind = lfUltraFlat
                      LookAndFeel.NativeStyle = False
                      OptionsImage.Glyph.Data = {
                        C6050000424DC605000000000000360400002800000014000000140000000100
                        08000000000090010000130B0000130B00000001000000000000000000000101
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
                        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE8E9FF
                        FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFEDC5753E5FFFFFFFFFFFFFFFFFCA3379F
                        F5FFFDD6610D0467DFFFFFFFFFFFFFFBAB20022D9EF5FAA31500000A62DDFFFF
                        FFFFFCAA2900000146E6FEE2660800000A65E4FFFFFCAC290200002FB7FAFFFF
                        EF760F00000259DDF7A21D00000338C1FFFFFFFFFFEC72070000005F9A210000
                        0038BEFFFFFFFFFFFFFFED690C000008110000002CC2FFFFFFFFFFFFFFFFFFE3
                        6F0D000000000332B7FFFFFFFFFFFFFFFFFFFFFEDF56000000001CADFBFFFFFF
                        FFFFFFFFFFFFFFF7A52100000000095EDDFFFFFFFFFFFFFFFFFFFCA521000000
                        0200000056E4FFFFFFFFFFFFFFFBAB1D000000315A0C00000265DFFFFFFFFFFF
                        FCAA2900000030BBDE6E0A00000A62DDFFFFFFFCAC290200002DB8FBFEE26608
                        00000A67E5FFFAAD1F00000338C1FFFFFFFFEF750F00000256EAFBB831030038
                        BEFFFFFFFFFFFFEC720700136DEDFFF8B23630C2FFFFFFFFFFFFFFFFEC6A1F77
                        E7FFFFFFF8BDC7FFFFFFFFFFFFFFFFFFFFE5B1E7FFFFFFFFFFFCFEFFFFFFFFFF
                        FFFFFFFFFFFEFCFFFFFF}
                      SpeedButtonOptions.CanBeFocused = False
                      SpeedButtonOptions.Flat = True
                      SpeedButtonOptions.Transparent = True
                      TabOrder = 5
                    end
                    object chbAssinaRegistro: TcxDBCheckBox
                      Left = 8
                      Top = 151
                      AutoSize = False
                      Caption = 'Assina Registro'
                      DataBinding.DataField = 'ASSINA_REGISTRO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DisplayChecked = 'S'
                      Properties.DisplayGrayed = 'N'
                      Properties.NullStyle = nssUnchecked
                      Properties.ValueChecked = 'S'
                      Properties.ValueUnchecked = 'N'
                      Style.BorderStyle = ebsUltraFlat
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -11
                      Style.Font.Name = 'MS Sans Serif'
                      Style.Font.Style = [fsBold]
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      Style.IsFontAssigned = True
                      TabOrder = 10
                      Transparent = True
                      Height = 21
                      Width = 110
                    end
                  end
                end
                object tbcRodapeEmail: TcxTabSheet
                  Caption = 'Rodap'#233' do Email'
                  ImageIndex = 2
                  object pnlRodape: TPanel
                    Left = 0
                    Top = 0
                    Width = 390
                    Height = 207
                    Align = alClient
                    TabOrder = 0
                    object memRodapeEmail: TcxDBRichEdit
                      Left = 1
                      Top = 1
                      Align = alClient
                      DataBinding.DataField = 'RODAPE_EMAIL'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 0
                      Height = 205
                      Width = 388
                    end
                  end
                end
              end
            end
            object pnlFoto: TPanel
              Left = 390
              Top = 0
              Width = 153
              Height = 259
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object imgFoto: TcxDBImage
                Left = 6
                Top = 8
                DataBinding.DataField = 'FOTO'
                DataBinding.DataSource = SourceAncestral
                Properties.GraphicClassName = 'TJPEGImage'
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 0
                Height = 132
                Width = 140
              end
              object btnCapturar: TcxButton
                Left = 21
                Top = 147
                Width = 110
                Height = 20
                Cursor = crArrow
                Caption = 'Capturar'
                Colors.Default = clWhite
                OptionsImage.Glyph.Data = {
                  C6050000424DC605000000000000360400002800000014000000140000000100
                  08000000000090010000120B0000120B0000000100000000000000000000CCCC
                  CC005A5A5A002B2B2B00FFFFFF00212121008383830014141400BDBDBD003C3C
                  3C00E2E2E2000D0D0D00747474008E8E8E0050505000F2F2F200DADADA006E6E
                  6E0009090900282828009C9C9C00363636001C1C1C0006060600666666007777
                  77004646460010101000D5D5D500EDEDED0024242400666666007E7E7E001A1A
                  1A00333333008787870099999900D2D2D200A4A4A400F8F8F800E1E1E1005454
                  5400424242008C8C8C00121212002A2A2A00E6E6E60048484800727272006C6C
                  6C00F7F7F700262626003030300017171700DEDEDE00383838001E1E1E002222
                  2200161616002E2E2E00BFBFBF0070707000858585003F3F3F0091919100DDDD
                  DD00EFEFEF00808080004A4A4A00000000000000000000000000000000000000
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
                  0000000000000000000000000000000000000000000000000000040404040404
                  04040404040404040404040404042E230C0C0C0C0C0C0C0C0C0C0C0C0C0C0C30
                  0D2E34000000000000000000000000000000000000341717170B110717171717
                  3319401116171717171712121239042212121231320404041D0E121212120B0B
                  0B3304370B0B4404040404040427340B0B0B1B1B1B1304371B1B080404040404
                  0404141B1B1B0707072D040907212E04040404040404010707073535353B043F
                  35162E040404040404040135353521212134042A212108040404040404042421
                  212138383815041A38382F0404040404040F1538383805050537041A03261518
                  1D0404040A29050505051E1E1E343C151541291E22192B303B1E1E1E1E1E0E13
                  13131313131313131313131313131313130E271C1C1C251C1C01180330282836
                  020320251C2704040404040404041034290643061A3732040404040404040404
                  0404041822343434340604040404040404040404040404040404040404040404
                  0404040404040404040404040404040404040404040404040404040404040404
                  04040404040404040404}
                TabOrder = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = btnCapturarClick
              end
              object btnAbrir: TcxButton
                Left = 21
                Top = 171
                Width = 110
                Height = 20
                Cursor = crArrow
                Caption = 'Arquivo'
                Colors.Default = clWhite
                OptionsImage.Glyph.Data = {
                  C6050000424DC605000000000000360400002800000014000000140000000100
                  08000000000090010000120B0000120B0000000100000000000016161600DCDC
                  DC0066666600414141009D9D9D0036363600FFFFFF0030303000A3A3A3009999
                  99004A4A4A00D9D9D900EFEFEF00848484002626260050505000EBEBEB00F9F9
                  F900444444003D3D3D0055555500E9E9E9001F1F1F002B2B2B004C4C4C00F1F1
                  F100464646006F6F6F001C1C1C00F6F6F6005A5A5A00E3E3E300424242005858
                  58003E3E3E00FBFBFB002E2E2E00EDEDED00484848006B6B6B00393939004E4E
                  4E00333333005252520038383800858585002C2C2C00FFFFFF00000000000000
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
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606062306060606060615040404040404040404040409091F06060606
                  231E001616161616161616161616000F1D0606061926072A2A2A2A2A2A2A2A2A
                  2A2A0712150606060C182A05050505050505050505052A0A100606060C0F0528
                  282828282828282828282C18100606060C0F281313131313131313131313130F
                  10060606252B220303030303030320202020220F100606061014121A1A1A1A1A
                  12121220202022181006060610210A0A0A0A0A26222E0E0E0E0E1C0F11060606
                  150F120A0A0A12072C1B2D2D0D0D0D01060606061102172A2A2A072710060606
                  0606060606060606060B0F2B211E080606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  06060606060606060606}
                TabOrder = 2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = btnAbrirClick
              end
              object btnBiometria: TcxButton
                Left = 21
                Top = 195
                Width = 110
                Height = 20
                Caption = 'Biometria'
                Colors.Default = clWhite
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = ''
                OptionsImage.Glyph.Data = {
                  E6040000424DE604000000000000360000002800000014000000140000000100
                  180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  D9D9D94F4F4F2F2F2F313131414141AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE0C0C0C08
                  0808080808080808080808080808888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6363630808080808080808
                  08080808080808080808080808333333E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF171717080808080808080808080808
                  080808080808323232080808080808808080D9D9D9FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFD4D4D408080808080808080808080808080808080808
                  0808B6B6B6E9E9E90909090808087B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF9696960808080808080808080808080808080808080808086A6A
                  6AFFFFFFE3E3E3CACACAF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
                  F0F07676760808082D2D2D0808081616160808082A2A2A0E0E0E363636FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD5E5E
                  5E0808087474740808087F7F7F1010105C5C5C5C5C5C080808F5F5F5FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9383838080808
                  7A7A7A0808089393931111115858589D9D9D080808B4B4B4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7D7D0808082B2B2B8A8A8A08
                  0808A6A6A6111111484848D1D1D10808087C7C7CFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC3535358484848E8E8E080808B9B9
                  B9101010303030FFFFFF080808303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A080808D1D1D10E0E0E
                  1C1C1CFFFFFF3535350B0B0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666660C0C0CFFFFFF080808151515FF
                  FFFFD6D6D6C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF5F5F5FFFFFF5E5E5E6B6B6BFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF}
                TabOrder = 3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = btnBiometriaClick
              end
            end
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Caption = 'Lista dos Usu'#225'rios'
          Style.BorderStyle = ebsSingle
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.Shadow = False
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Height = 470
          Width = 463
          object tabUsuarios: TcxTabControl
            Left = 2
            Top = 18
            Width = 459
            Height = 450
            Align = alClient
            TabOrder = 0
            Properties.CustomButtons.Buttons = <>
            Properties.TabIndex = 0
            Properties.Tabs.Strings = (
              'Ativos'
              'Inativos')
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'McSkin'
            OnChange = tabUsuariosChange
            ClientRectBottom = 446
            ClientRectLeft = 4
            ClientRectRight = 455
            ClientRectTop = 28
            object grdUsuario: TcxGrid
              Left = 4
              Top = 28
              Width = 451
              Height = 418
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              object grdUsuarioDBTableView1: TcxGridDBTableView
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
                DataController.DataSource = dtsUsuariosPesquisa
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'Total:0'
                    Kind = skCount
                    FieldName = 'USUARIO_ID'
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
                object grdUsuarioDBTableView1NOME_COMPLETO: TcxGridDBColumn
                  Caption = 'Nome'
                  DataBinding.FieldName = 'NOME_COMPLETO'
                  Width = 281
                end
                object grdUsuarioDBTableView1LOGIN: TcxGridDBColumn
                  Caption = 'Login'
                  DataBinding.FieldName = 'LOGIN'
                  Width = 107
                end
                object grdUsuarioDBTableView1FUNCAO: TcxGridDBColumn
                  Caption = 'Fun'#231#227'o'
                  DataBinding.FieldName = 'FUNCAO'
                  Width = 151
                end
                object grdUsuarioDBTableView1ASSINA: TcxGridDBColumn
                  Caption = 'Assina'
                  DataBinding.FieldName = 'ASSINA'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Images = dtmControles.imgCadBasicos
                  Properties.Items = <
                    item
                      Description = 'Assina'
                      ImageIndex = 18
                      Value = 'S'
                    end
                    item
                      Description = 'N'#227'o Assina'
                      ImageIndex = 10
                      Value = 'N'
                    end
                    item
                      Description = 'N'#227'o Assina'
                      ImageIndex = 10
                    end>
                  Width = 58
                end
              end
              object grdUsuarioLevel1: TcxGridLevel
                GridView = grdUsuarioDBTableView1
              end
            end
          end
        end
      end
      object tbsPermissao: TcxTabSheet
        Caption = 'Controle de Acesso'
        ImageIndex = 1
        object tbcSistemas: TcxTabControl
          Left = 0
          Top = 0
          Width = 1006
          Height = 470
          Align = alClient
          TabOrder = 0
          Properties.CustomButtons.Buttons = <>
          Properties.TabIndex = 0
          Properties.Tabs.Strings = (
            'Administrativo'
            'Caixa'
            'Tabelionato de Notas')
          LookAndFeel.Kind = lfOffice11
          OnChange = tbcSistemasChange
          ClientRectBottom = 470
          ClientRectRight = 1006
          ClientRectTop = 24
          object pgcPermissoes: TcxPageControl
            Left = 0
            Top = 24
            Width = 1006
            Height = 446
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Properties.ActivePage = cxTabSheet1
            Properties.CustomButtons.Buttons = <>
            Properties.Images = dtmControles.imgCadBasicos
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            OnChange = pgcPermissoesChange
            ClientRectBottom = 446
            ClientRectRight = 1006
            ClientRectTop = 25
            object cxTabSheet1: TcxTabSheet
              Caption = 'Usu'#225'rio Vinculados'
              ImageIndex = 43
              object cxGrid2: TcxGrid
                Left = 0
                Top = 63
                Width = 1006
                Height = 358
                Align = alClient
                TabOrder = 1
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object cxGridDBTableView2: TcxGridDBTableView
                  Navigator.Buttons.ConfirmDelete = True
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Append.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = False
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  Navigator.Visible = True
                  DataController.DataSource = dtsSistemaUsuario
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'Total:0'
                      Kind = skCount
                      FieldName = 'USUARIO_ID'
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Footer = True
                  OptionsView.GridLines = glVertical
                  OptionsView.GroupByBox = False
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  object cxGridDBColumn2: TcxGridDBColumn
                    Caption = 'Nome'
                    DataBinding.FieldName = 'NOME_COMPLETO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 332
                  end
                  object cxGridDBColumn3: TcxGridDBColumn
                    Caption = 'Login'
                    DataBinding.FieldName = 'LOGIN'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 185
                  end
                  object cxGridDBColumn4: TcxGridDBColumn
                    Caption = 'Fun'#231#227'o'
                    DataBinding.FieldName = 'FUNCAO'
                    Options.Editing = False
                    Options.Focusing = False
                    Width = 162
                  end
                  object cxGridDBTableView2Column1: TcxGridDBColumn
                    Caption = 'Grupo'
                    DataBinding.FieldName = 'USUARIO_GRUPO_ID'
                    PropertiesClassName = 'TcxLookupComboBoxProperties'
                    Properties.DropDownListStyle = lsFixedList
                    Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
                    Properties.ListColumns = <
                      item
                        FieldName = 'DESCRICAO'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ListSource = dtsGrupo
                    Width = 325
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView2
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 1006
                Height = 63
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object cxLabel4: TcxLabel
                  Left = 5
                  Top = -3
                  Caption = 
                    'Usu'#225'rio                                                         ' +
                    '                                  Grupo                         ' +
                    ' '
                  ParentColor = False
                  ParentFont = False
                  Style.StyleController = dtmControles.cxStyleLabel
                  Style.TextStyle = [fsUnderline]
                  Transparent = True
                end
                object lbxUsuarioAdicionar: TcxLookupComboBox
                  Left = 6
                  Top = 20
                  ParentFont = False
                  Properties.ClearKey = 46
                  Properties.DropDownListStyle = lsFixedList
                  Properties.KeyFieldNames = 'USUARIO_ID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'NOME_COMPLETO'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = dtsUsuariosPesquisa
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 6
                  Width = 306
                end
                object lbxGrupoAdicionar: TcxLookupComboBox
                  Left = 316
                  Top = 20
                  ParentFont = False
                  Properties.ClearKey = 46
                  Properties.DropDownListStyle = lsFixedList
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = dtsGrupoUsuario
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 7
                  Width = 246
                end
                object btnAdicionarUsuario: TcxButton
                  Left = 591
                  Top = 18
                  Width = 100
                  Height = 22
                  Caption = 'Adicionar'
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = ''
                  OptionsImage.Glyph.Data = {
                    46090000424D4609000000000000360000002800000026000000140000000100
                    18000000000010090000120B0000120B00000000000000000000FFFFFFFFFFFF
                    F9F9F9CFCFCFAFAFAFA1A1A19898989090908C8C8C9393939C9C9CACACACBDBD
                    BDDEDEDEF4F4F4F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08
                    0808000000000000040404040404040404040404040404040404000000000000
                    0000000000000000000404043A4DE6E6E6ADADAD4C4C4C5353536060606B6B6B
                    7373737979797D7D7D8585858B8B8B8989898A8A8A8D8D8D838383757575F7F7
                    F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0606060606060B0B0B48484853
                    53535353535353535353533F3F3F080808060606060606060606060606060606
                    6F709595954E4E4E4E4E4E5252525C5C5C6363636868686D6D6D7575756C6C6C
                    6161616767676B6B6B7777777171716F6F6F7A7A7AF8F8F8FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFF0808080808081E1E1ED5D5D5E5E5E5E3E3E3E3E3E3E5E5E5BB
                    BBBB0B0B0B0808080808080808080808080808087363B1B1B16161614B4B4B49
                    49495050505959595E5E5E6161616A6A6A5858585353535D5D5D595959545454
                    5050506B6B6B828282777777EDEDEDFFFFFFFFFFFFFFFFFFFFFFFF0B0B0B0B0B
                    0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
                    0B0B0B0B0B0B0B0B3631EDEDED9C9C9C4848484C4C4C4B4B4B51515155555558
                    58585C5C5C5252525E5E5E6D6D6D6565655A5A5A5B5B5B5454547D7D7D7F7F7F
                    A3A3A3FFFFFFFFFFFFFFFFFFFFFFFF0B0B0B0B0B0B202020D0D0D0E3E3E3E1E1
                    E1E1E1E1E1E1E1E1E1E1E5E5E5E5E5E5E5E5E58989890B0B0B0B0B0B6E3DFFFF
                    FFFBFBFB5A5A5A4E4E4E4F4F4F4E4E4E3B3B3B3434343636363333334040405D
                    5D5D6060606363635B5B5B656565717171939393FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF1010101010101717174848484A4A4A4848484848484848484848484848
                    484848484D4D4D3636361010101010102020FFFFFFFFFFFFE0E0E04E4E4E5050
                    503F3F3F777777BEBEBEB5B5B5BDBDBD8383834545455D5D5D656565B8B8B85A
                    5A5A898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF121212121212191919
                    6969697575757676767676767676767676767676767676767575754646461212
                    121212122020FFFFFFFFFFFFFFFFFFF8F8F8989898636363EBEBEBFFFFFFFFFF
                    FFFFFFFFFFFFFF646464737373F5F5F5EEEEEE989898FEFEFEFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFF141414141414282828BEBEBECCCCCCC8C8C8C8C8C8
                    C8C8C8C8C8C8C8C8C8C8C8C8CCCCCC8383831414141414142020FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE6E6E6E5E5E5DFDFDFF9F9F9FFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF18
                    1818181818181818181818191919191919191919191919191919191919191919
                    1919191818181818181818182020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    F0F0F0F8F8F8F6F6F6E2E2E2DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B1B1B1B1B1B303030E1E1E1F3
                    F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F5F5F59999991B1B1B1B1B1B
                    2020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFBFBFBF6F6F6F1F1F1F9F9F9
                    E9E9E9E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFF1E1E1E1E1E1E20202030303030303030303030303030303030
                    30303030303030303333332B2B2B1E1E1E1E1E1E2020FFFFFFFFFFFFFFFFFFFF
                    FFFFEEEEEEF7F7F7F5F5F5EFEFEFF5F5F5F6F6F6FAFAFAE8E8E8EEEEEEFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020202020
                    202B2B2B999999A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A969
                    69692020202020202020FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F4F4F4ECECECF4
                    F4F4F6F6F6F7F7F7FAFAFAFEFEFEE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF222222222222303030A1A1A1A9A9A9ADAD
                    ADABABABA5A5A5A5A5A5A5A5A5A5A5A5A9A9A97575752222222222222020FFFF
                    FFFFFFFFFFFFFFF6F6F6DEDEDEFFFFFFEFEFEFF5F5F5FDFDFDFFFFFFFFFFFFFF
                    FFFFFFFFFFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF2424242424242424242828282828282828282424243A3A3A3A3A3A3C3C
                    3C3C3C3C3A3A3A2B2B2B2424242424242020FFFFFFFFFFFFFFFFFFB3B3B34242
                    42E6E6E6FFFFFFFFFFFFF4F4F4B4B4B4818181616161646464A7A7A7FFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2828282828284A4A4A
                    F5F5F5F7F7F74A4A4A595959F3F3F3F3F3F3F3F3F3F3F3F3F5F5F5A1A1A12828
                    282828282020FFFFFFFFFFFFFFFFFF666666030303141414ACACACEAEAEA4D4D
                    4D0D0D0D0000000000000000006C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFF2B2B2B2B2B2B505050FFFFFFFFFFFF6060602E2E2E
                    3636363636363636363636363838383333332B2B2B2B2B2B2020FFFFFFFFFFFF
                    FFFFFFA4A4A42626260606061010103E3E3E0C0C0C1B1B1B1D1D1D1111110E0E
                    0EAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E
                    2E2E2E2E2E2E2E2E5353535656562E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
                    2E2E2E2E2E2E2E2E2E2E2E2E2020FFFFFFFFFFFFFFFFFFECECEC3232321A1A1A
                    0505050E0E0E2323231C1C1C1313130A0A0A626262FFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36363630303030303030303030
                    3030303030303030303030303030303030303030303030303030303030333333
                    5247FFFFFFFFFFFFFFFFFFFFFFFFB2B2B20808080909091B1B1B181818111111
                    0C0C0C5A5A5AFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFF92929236363633333333333333333333333333333333333333
                    33333333333333333333333333333333335656566F62FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFC4C4C46969695C5C5C3C3C3C2E2E2E8A8A8AFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFF703C}
                  TabOrder = 1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnAdicionarUsuarioClick
                end
                object btnRemover: TcxButton
                  Left = 694
                  Top = 18
                  Width = 95
                  Height = 22
                  Caption = 'Remover'
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = ''
                  OptionsImage.Glyph.Data = {
                    C6050000424DC605000000000000360400002800000014000000140000000100
                    08000000000090010000120B0000120B0000000100000000000000000000B6B6
                    B6007777770025252500FFFFFF001B1B1B0010101000A2A2A200BABABA002D2D
                    2D00999999000B0B0B00E0E0E0004B4B4B008B8B8B0008080800202020000606
                    0600333333001818180028282800AAAAAA00838383000D0D0D009F9F9F003030
                    300092929200C3C3C3003737370015151500E8E8E8001D1D1D00222222009D9D
                    9D002A2A2A007C7C7C0091919100040404000E0E0E0012121200A7A7A700A1A1
                    A10026262600A5A5A50099999900858585009696960000000000000000000000
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
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000040404021100
                    0000000000000000000000090C040404040F0000000000000000000000000025
                    0A0404040411111111111111111111111111111121040404040F0F0F0F0F0F0F
                    0F0F0F0F0F0F0F0F21040404040B0B0B0B0B0B0B0B0B0B0B0B0B0B0B18040404
                    0417171726262626262626262626262618040404040606191515151515151515
                    150E0606180404040427270D0404040404040404041E272729040404041D1D1C
                    0801010101010101082E1D1D0704040404131313131313131313131313131313
                    2B040404040505050505050505050505050505052B040404041F1F1F1F1F1F1F
                    1F1F1F1F1F1F1F1F2B0404040410101010101010101010101010101028040404
                    042020202020202020202020202020202B040404040303030303030303030303
                    030303141B0404040414141414141414141414141414142D0404040404222222
                    2222222222222222222223040404040404090909090909090909090909160404
                    040404040412191919191919191919122404040404040404041A1C1212121212
                    12121C1A040404040404}
                  TabOrder = 2
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnRemoverClick
                end
                object btnSalvar: TcxButton
                  Left = 793
                  Top = 18
                  Width = 100
                  Height = 22
                  Caption = 'Salvar'
                  Colors.Default = clWhite
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
                  TabOrder = 3
                  Visible = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnSalvarClick
                end
                object btnCancelar: TcxButton
                  Left = 897
                  Top = 18
                  Width = 100
                  Height = 22
                  Caption = 'Cancelar'
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = ''
                  OptionsImage.Glyph.Data = {
                    C6050000424DC605000000000000360400002800000014000000140000000100
                    08000000000090010000130B0000130B00000001000000000000000000000101
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
                    F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFDE7
                    B55F180101185FB5E7FDFFFFFFFFFFFFFFF4BB56160209131309021656BBF4FF
                    FFFFFFFFEE93290A2859829A9A825823092993EEFFFFFFF49420081275E4F8FE
                    FEF8E3B854092094F4FFFEBD2A0B0B0D35B7FEFFFFFFFFFDE9550B2BBEFEE95E
                    1118100E0E2CAEF9FFFFFFFFFFE8550F5EE9BB212F783A10101031AFFEFFFFFF
                    FFFDB82A21BB691363E5BA3112121230BAFEFFFFFFFFE561126A2B1D8CF9FEB1
                    351515153FB5FEFFFFFFF88A1C2B1B29A3FFFFF9B23619191B41BBFEFFFFFEA2
                    291B1C2AA4FFFFFFFEBB421D1B1B39B4F9FFFEA32A1C332591F9FFFFFFFDB746
                    1E1E1E3EB5FEF98E253372206BE6FFFFFFFFFEBD3C2020203DBDE76C2173BF32
                    3BC0FEFFFFFFFFFEB54022222248823E32C0EB6D2765EBFFFFFFFFFFF9B54025
                    25272D276DEBFEC5442969EBFDFFFFFFFFFEBF4D2A282944C5FEFFF5A33F2B6C
                    C2E8F9FFFEF9E888332B3FA3F5FFFFFFF1A3492F467396ABAB96734A304AA3F1
                    FFFFFFFFFFF5C6733F2F353E3E352F3F73C6F5FFFFFFFFFFFFFFFDECC47E4534
                    34447CC3ECFDFFFFFFFF}
                  TabOrder = 4
                  Visible = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnCancelarClick
                end
                object chxTodos: TcxCheckBox
                  Left = 586
                  Top = 41
                  Caption = 'Adicionar em Todos Sistemas'
                  TabOrder = 8
                  Transparent = True
                  Width = 201
                end
                object btnCadGrupo: TcxButton
                  Left = 563
                  Top = 19
                  Width = 25
                  Height = 22
                  Cursor = crHandPoint
                  Colors.Default = clWhite
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  OptionsImage.Glyph.Data = {
                    C6050000424DC605000000000000360400002800000014000000140000000100
                    08000000000090010000130B0000130B00000001000000000000000000000101
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
                    FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                    FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
                    000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
                    FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
                    D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
                    00000000000000000000000000D5FFAA00000000000000000000000000000000
                    00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
                    00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
                    FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
                    FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
                    FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                    FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                  SpeedButtonOptions.CanBeFocused = False
                  SpeedButtonOptions.Flat = True
                  SpeedButtonOptions.Transparent = True
                  TabOrder = 5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btnCadGrupoClick
                end
              end
            end
            object cxTabSheet2: TcxTabSheet
              Caption = 'Permiss'#227'o'
              ImageIndex = 9
              object cxGridBasica: TcxGrid
                Left = 0
                Top = 124
                Width = 192
                Height = 297
                Align = alLeft
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                PopupMenu = PopupMenu1
                TabOrder = 3
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                RootLevelStyles.TabsBackground = dtmControles.cxStyle1
                object gridMenus: TcxGridDBTableView
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
                  DataController.DataModeController.GridMode = True
                  DataController.DataSource = dtsMenu
                  DataController.Filter.Active = True
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GridLines = glVertical
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  Styles.Background = dtmControles.cxStyle1
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  object gridMenusDESCRICAO: TcxGridDBColumn
                    Caption = 'Menu'
                    DataBinding.FieldName = 'DESCRICAO'
                    MinWidth = 160
                    Options.Editing = False
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.Focusing = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Width = 160
                  end
                end
                object cxGridBasicaLevel1: TcxGridLevel
                  GridView = gridMenus
                end
              end
              object grdRotinas: TcxGrid
                Left = 192
                Top = 124
                Width = 814
                Height = 297
                Align = alClient
                PopupMenu = PopupMenu2
                TabOrder = 4
                LookAndFeel.Kind = lfUltraFlat
                LookAndFeel.NativeStyle = False
                object grdRotinasDBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Buttons.PriorPage.Visible = False
                  Navigator.Buttons.NextPage.Visible = False
                  Navigator.Buttons.Insert.Visible = False
                  Navigator.Buttons.Delete.Visible = False
                  Navigator.Buttons.Edit.Visible = False
                  Navigator.Buttons.Post.Visible = True
                  Navigator.Buttons.Cancel.Visible = False
                  Navigator.Buttons.Refresh.Visible = False
                  Navigator.Buttons.SaveBookmark.Visible = False
                  Navigator.Buttons.GotoBookmark.Visible = False
                  Navigator.Buttons.Filter.Visible = False
                  Navigator.Visible = True
                  OnCellClick = grdRotinasDBTableView1CellClick
                  OnCustomDrawCell = grdRotinasDBTableView1CustomDrawCell
                  DataController.DataSource = dsRotina
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsData.Appending = True
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GridLines = glVertical
                  OptionsView.GroupByBox = False
                  Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                  OnCustomDrawGroupCell = grdRotinasDBTableView1CustomDrawGroupCell
                  object grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn
                    Caption = 'Rotina'
                    DataBinding.FieldName = 'DESCROTINA'
                    MinWidth = 320
                    Options.Editing = False
                    Options.Focusing = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Width = 320
                  end
                  object grdRotinasDBTableView1pIncluir: TcxGridDBColumn
                    Caption = 'Inc.'
                    DataBinding.FieldName = 'pIncluir'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1pAlterar: TcxGridDBColumn
                    Caption = 'Alt.'
                    DataBinding.FieldName = 'pAlterar'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1pExcluir: TcxGridDBColumn
                    Caption = 'Exc.'
                    DataBinding.FieldName = 'pExcluir'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1pPesquisar: TcxGridDBColumn
                    Caption = 'Pes.'
                    DataBinding.FieldName = 'pPesquisar'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1pRelatorio: TcxGridDBColumn
                    Caption = 'Imp.'
                    DataBinding.FieldName = 'pRelatorio'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1pEspecial: TcxGridDBColumn
                    Caption = 'Esp.'
                    DataBinding.FieldName = 'pEspecial'
                    RepositoryItem = dtmLookup.Combo_Permissao
                    MinWidth = 40
                    Options.Filtering = False
                    Options.FilteringMRUItemsList = False
                    Options.IncSearch = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Options.Sorting = False
                    Width = 40
                  end
                  object grdRotinasDBTableView1DBColumn1: TcxGridDBColumn
                    Caption = 'Chave Rotina'
                    DataBinding.FieldName = 'CHAVE_ROTINA'
                    Options.Editing = False
                    Options.Focusing = False
                    Options.Grouping = False
                    Width = 120
                  end
                end
                object grdRotinasLevel1: TcxGridLevel
                  GridView = grdRotinasDBTableView1
                end
              end
              object Panel1: TPanel
                Left = 0
                Top = 30
                Width = 1006
                Height = 53
                Align = alTop
                BevelOuter = bvNone
                Color = 14807280
                ParentBackground = False
                TabOrder = 1
                object pnlPermissao: TPanel
                  Left = 0
                  Top = 0
                  Width = 485
                  Height = 53
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 0
                  object lcbGruposUsuario: TcxLookupComboBox
                    Left = 14
                    Top = 26
                    ParentFont = False
                    Properties.ClearKey = 46
                    Properties.DropDownListStyle = lsFixedList
                    Properties.GridMode = True
                    Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
                    Properties.ListColumns = <
                      item
                        Caption = 'Descri'#231#227'o'
                        FieldName = 'DESCRICAO'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ListSource = dtsGrupo
                    Properties.OnChange = lcbGruposPropertiesChange
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 3
                    Width = 366
                  end
                  object btnAtualizaGrupo: TcxButton
                    Left = 385
                    Top = 24
                    Width = 95
                    Height = 22
                    Caption = 'Atualizar'
                    Colors.Default = clWhite
                    LookAndFeel.Kind = lfUltraFlat
                    LookAndFeel.NativeStyle = False
                    LookAndFeel.SkinName = ''
                    OptionsImage.Glyph.Data = {
                      E6040000424DE604000000000000360000002800000014000000140000000100
                      180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
                      FEFEFEF9F9F9F3F3F3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFCFCFCF4F4F4FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5D1
                      D1D1E5E5E5D3D3D3DDDDDDF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2DBDBDB
                      CFCFCFE8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBDEDEDEFFFF
                      FFE6E6E6C4C4C4CACACAE1E1E1E3E3E3E3E3E3DFDFDFC9C9C9C5C5C5E6E6E6FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
                      FFFFFFE1E1E1848484535353535353828282DCDCDCFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777B9B9B9FFFFFFE9E9E96767671D
                      1D1D1D1D1D1D1D1D1D1D1D1E1E1E1C1C1C676767ECECECFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFF5050501D1D1DACACAC181818191919646464C2C2
                      C2DCDCDCDADADAB9B9B95757571A1A1A1A1A1AC7C7C7FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF7A7A7A1919191818183B3B3BD7D7D7FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFBDBDBD1818181B1B1BEFEFEFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFF757575191919191919787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFD4D4D41B1B1B404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      6464641B1B1B1919191A1A1A7C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFF7E7E7E1B1B1BCDCDCDFFFFFFFFFFFFFFFFFFFFFFFF92929245
                      4545494949464646393939D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFDFDFDF191919878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
                      FDFD1A1A1A444444FFFFFFFFFFFFFFFFFFFFFFFF7878787C7C7CFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBE
                      BEC4C4C4FFFFFFFFFFFFFFFFFFFFFFFF232323191919FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFEFEFEC2C2C2D3D3D3D6D6D6D7D7D7FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFF939393191919D0D0D0FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFEFEFE8B8B8B1A1A1A1919191919191A1A1AB5B5B5FFFFFFFF
                      FFFFFFFFFFFFFFFFF9F9F9191919313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFF9D9D9D1E1E1E191919191919B8B8B8FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFB1B1B11818185F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF282828191919191919BBBBBBFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF878787181818323232A4A4A4F2F2F2FFFFFFFFFFFFEAEAEA9A9A
                      9A1D1D1D1919195555551A1A1ABABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFB0B0B01919191919191919191919191919191919191919192C2C2C
                      CECECEFFFFFF424242909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFCFCFCABABAB6767674343434646466C6C6CB6B6B6FFFFFFFFFFFFFF
                      FFFFF1F1F1D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFF}
                    TabOrder = 2
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    OnClick = btnAtualizaGrupoClick
                  end
                  object rdbGrupo: TcxRadioButton
                    Left = 15
                    Top = 5
                    Width = 54
                    Height = 17
                    Caption = 'Grupo'
                    Checked = True
                    TabOrder = 0
                    TabStop = True
                    OnClick = rdbGrupoClick
                    LookAndFeel.Kind = lfFlat
                    LookAndFeel.NativeStyle = True
                  end
                  object rdbUsuario: TcxRadioButton
                    Left = 75
                    Top = 5
                    Width = 77
                    Height = 17
                    Caption = 'Usu'#225'rio'
                    TabOrder = 1
                    OnClick = rdbUsuarioClick
                    LookAndFeel.Kind = lfFlat
                    LookAndFeel.NativeStyle = True
                  end
                end
                object pnlCopiarPermissoa: TPanel
                  Left = 485
                  Top = 0
                  Width = 521
                  Height = 53
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  Visible = False
                  object cxGroupBox3: TcxGroupBox
                    Left = 0
                    Top = 0
                    Align = alClient
                    Caption = 'Grupo de Destino'
                    TabOrder = 0
                    Transparent = True
                    Height = 53
                    Width = 521
                    object lbxGrupoDestino: TcxLookupComboBox
                      Left = 6
                      Top = 26
                      ParentFont = False
                      Properties.ClearKey = 46
                      Properties.DropDownListStyle = lsFixedList
                      Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
                      Properties.ListColumns = <
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'DESCRICAO'
                        end>
                      Properties.ListOptions.ShowHeader = False
                      Properties.ListSource = dtsGrupo
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 2
                      Width = 307
                    end
                    object btnConfirmarCopiaGrupo: TcxButton
                      Left = 317
                      Top = 24
                      Width = 95
                      Height = 22
                      HelpType = htKeyword
                      Caption = 'Confirmar'
                      Colors.Default = clWhite
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
                      OnClick = btnConfirmarCopiaGrupoClick
                    end
                    object btnFecharCopia: TcxButton
                      Left = 416
                      Top = 24
                      Width = 95
                      Height = 22
                      Caption = 'Sair'
                      Colors.Default = clWhite
                      LookAndFeel.Kind = lfUltraFlat
                      LookAndFeel.NativeStyle = False
                      LookAndFeel.SkinName = ''
                      OptionsImage.Glyph.Data = {
                        C6050000424DC605000000000000360400002800000014000000140000000100
                        080000000000900100000000000000000000000100000000000000000000D7D7
                        D7007D7D7D0033333300C3C3C300FFFFFF004C4C4C00A0A0A000181818007777
                        7700EDEDED0099999900BCBCBC00444444006666660041414100CCCCCC00DEDE
                        DE0026262600F0F0F000A5A5A500030303005252520037373700FBFBFB00ADAD
                        AD00DDDDDD00E5E5E500828282003D3D3D00C7C7C7009C9C9C00575757004E4E
                        4E00C1C1C100E3E3E3000909090047474700000000001A1A1A00A3A3A300EFEF
                        EF005050500049494900C5C5C500C9C9C9000000000000000000000000000000
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
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000050505130D00
                        000000000000000000002405050505050A06000000000000000000000000001C
                        050505050E00212D101010101010101010100C000A0505050F000B0505050505
                        05050505050505001A0505050F000B0505050505050505050505050011050505
                        0F000B050505050505052D061B050515010505050F000B050505050505051F00
                        271E0504230505050F000B05050505050505190000152805050505050F000B05
                        052700000000000000000020180505050F000B05051200000000000000000000
                        032205050F000B05051200000000000000000000032205050F000B0505270000
                        0000000000000020180505050F000B05050B1616161603000000000505050505
                        0F000B050505050505051F00271E0504230505050F000B050505050505052C2B
                        1B050515010505050F000B05050505050505050505050500110505050F000B05
                        0505050505050505050505001A0505051D000705050505050505050505050500
                        1A0505050A06000000000000000000000000001C0505050505130D0000000000
                        00000000000024050505}
                      TabOrder = 1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      OnClick = btnFecharCopiaClick
                    end
                  end
                end
              end
              object pnlInformação: TPanel
                Left = 0
                Top = 0
                Width = 1006
                Height = 30
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '    Permiss'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -16
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object Panel4: TPanel
                Left = 0
                Top = 83
                Width = 1006
                Height = 41
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object cxGroupBox4: TcxGroupBox
                  Left = 0
                  Top = 0
                  Align = alClient
                  Caption = 'Buscar Parametro'
                  TabOrder = 0
                  Height = 41
                  Width = 1006
                  object btnBuscarParametro: TcxButton
                    Left = 385
                    Top = 15
                    Width = 95
                    Height = 22
                    HelpType = htKeyword
                    Caption = 'Buscar'
                    Colors.Default = clWhite
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
                    OnClick = btnBuscarParametroClick
                  end
                  object EdtBuscar: TcxTextEdit
                    Left = 14
                    Top = 16
                    Properties.CharCase = ecUpperCase
                    TabOrder = 1
                    OnKeyDown = EdtBuscarKeyDown
                    Width = 366
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 408
    Top = 314
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM G_USUARIO '#13#10'WHERE USUARIO_ID = :USUARIO_ID'
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'USUARIO_ID'
        ParamType = ptInput
      end>
    Left = 411
    Top = 378
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 501
    Top = 378
  end
  inherited ClientAncestral: TClientDataSet
    BeforeOpen = ClientAncestralBeforeOpen
    Left = 410
    Top = 430
    object ClientAncestralUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralTROCARSENHA: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object ClientAncestralLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object ClientAncestralSENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object ClientAncestralFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object ClientAncestralASSINA: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
    object ClientAncestralSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 10
    end
    object ClientAncestralCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 20
      Size = 3
    end
    object ClientAncestralALERTA_SELO_MINIMO: TStringField
      FieldName = 'ALERTA_SELO_MINIMO'
      Size = 1
    end
    object ClientAncestralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 260
    end
    object ClientAncestralANDAMENTO_PADRAO: TFMTBCDField
      FieldName = 'ANDAMENTO_PADRAO'
      Precision = 20
      Size = 2
    end
    object ClientAncestralANDAMENTO_PADRAO2: TFMTBCDField
      FieldName = 'ANDAMENTO_PADRAO2'
      Precision = 20
      Size = 2
    end
    object ClientAncestralRECEBER_MENSAGEM_ARROLAMENTO: TStringField
      FieldName = 'RECEBER_MENSAGEM_ARROLAMENTO'
      Size = 1
    end
    object ClientAncestralASSINA_CERTIDAO: TStringField
      FieldName = 'ASSINA_CERTIDAO'
      Size = 1
    end
    object ClientAncestralRECEBER_EMAIL_PENHORA: TStringField
      FieldName = 'RECEBER_EMAIL_PENHORA'
      Size = 1
    end
    object ClientAncestralFOTO: TBlobField
      FieldName = 'FOTO'
    end
    object ClientAncestralNAO_RECEBER_CHAT_TODOS: TStringField
      FieldName = 'NAO_RECEBER_CHAT_TODOS'
      Size = 1
    end
    object ClientAncestralANALISTA_DOC_DIVERSO: TStringField
      FieldName = 'ANALISTA_DOC_DIVERSO'
      Size = 1
    end
    object ClientAncestralRODAPE_EMAIL: TBlobField
      FieldName = 'RODAPE_EMAIL'
    end
    object ClientAncestralCONTROLE_HORARIO: TStringField
      FieldName = 'CONTROLE_HORARIO'
      Size = 1
    end
    object ClientAncestralHORA_INICIO: TStringField
      FieldName = 'HORA_INICIO'
      Size = 10
    end
    object ClientAncestralHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object ClientAncestralDIAS_UTEIS: TStringField
      FieldName = 'DIAS_UTEIS'
      Size = 1
    end
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object ClientAncestralASSINA_REGISTRO: TStringField
      FieldName = 'ASSINA_REGISTRO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 498
    Top = 429
  end
  object sqlGrupo: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT DISTINCT UG.* FROM G_USUARIO_SISTEMA US'#13#10'LEFT JOIN G_USUA' +
      'RIO_GRUPO UG ON'#13#10'   US.USUARIO_GRUPO_ID = UG.USUARIO_GRUPO_ID'#13#10'W' +
      'HERE US.SISTEMA_ID = :SISTEMA_ID AND'#13#10'               UG.SITUACAO' +
      ' =  '#39'A'#39'        '#13#10'ORDER BY UG.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '7'
      end>
    Params = <>
    Left = 189
    Top = 309
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
  object dtsGrupo: TDataSource
    DataSet = sqlGrupo
    Left = 189
    Top = 367
  end
  object dsRotina: TDataSource
    DataSet = sqlRotina
    Left = 788
    Top = 424
  end
  object sqlGrupoUsuario: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_USUARIO_GRUPO'#13#10'where SITUACAO = '#39'A'#39#13#10'order by DE' +
      'SCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 269
    Top = 311
    object FMTBCDField1: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsGrupoUsuario: TDataSource
    DataSet = sqlGrupoUsuario
    Left = 272
    Top = 374
  end
  object ImageList1: TImageList
    Left = 216
    Top = 240
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE00000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD00000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001094CE001094CE001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC1FFC1F00000000F007F00700000000
      E003E00300000000C001C00100000000C001C00100000000C001C00100000000
      C001C00100000000C001C00100000000E003E00300000000FFC7F1C700000000
      F1C7F1C700000000F1C7F00700000000F1C7F80F00000000F007FC1F00000000
      F80FFFFF00000000FC1FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object sqlMenu: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'select * from G_SISTEMA_MENU '#13#10'where SISTEMA_ID = :SISTEMA_ID'#13#10'o' +
      'rder by DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforeOpen = sqlMenuBeforeOpen
    AfterOpen = sqlMenuAfterOpen
    AfterScroll = sqlMenuAfterScroll
    Left = 726
    Top = 367
    object sqlMenuSISTEMA_MENU_ID: TFMTBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlMenuDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlMenuSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsMenu: TDataSource
    DataSet = sqlMenu
    Left = 729
    Top = 427
  end
  object PopupMenu1: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 348
    Top = 186
    object CopirarPermisso1: TMenuItem
      Caption = 'Copiar Permiss'#227'o'
      ImageIndex = 2
      OnClick = CopirarPermisso1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 348
    Top = 234
    object MarcarEste1: TMenuItem
      Caption = 'Marcar Este'
      ImageIndex = 6
      OnClick = MarcarEste1Click
    end
    object DesmarcarEste1: TMenuItem
      Caption = 'Desmarcar Este'
      ImageIndex = 7
      OnClick = DesmarcarEste1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MarcarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      ImageIndex = 0
      OnClick = MarcarTodos1Click
    end
    object DesmarcarTodos1: TMenuItem
      Caption = 'Desmarcar Todos'
      ImageIndex = 1
      OnClick = DesmarcarTodos1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object actExcluirPermissoDuplicada: TMenuItem
      Caption = 'Excluir Permiss'#227'o'
      OnClick = actExcluirPermissoDuplicadaClick
    end
  end
  object sqlRotina: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT R.SISTEMA_ROTINA_ID,'#13#10'       R.DESCRICAO DESCROTINA,'#13#10'   ' +
      '    R.SISTEMA_MENU_ID,'#13#10'       R.CHAVE_ROTINA,'#13#10'       PG.PERMIS' +
      'SAO'#13#10'FROM G_SISTEMA_ROTINA R'#13#10'LEFT JOIN G_PERMISSAO_GRUPO PG ON'#13 +
      #10'     R.SISTEMA_ROTINA_ID = PG.SISTEMA_ROTINA_ID AND'#13#10'     PG.US' +
      'UARIO_GRUPO_ID = :USUARIO_GRUPO_ID'#13#10'WHERE R.SISTEMA_MENU_ID = :S' +
      'ISTEMA_MENU_ID'#13#10'ORDER BY  R.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIO_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SISTEMA_MENU_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforePost = sqlRotinaBeforePost
    AfterPost = sqlRotinaAfterPost
    OnCalcFields = sqlRotinaCalcFields
    Left = 788
    Top = 370
    object sqlRotinaCHAVE_ROTINA: TStringField
      FieldName = 'CHAVE_ROTINA'
      Size = 30
    end
    object sqlRotinaSISTEMA_MENU_ID: TFMTBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Precision = 15
      Size = 2
    end
    object sqlRotinaDESCROTINA: TStringField
      FieldName = 'DESCROTINA'
      Size = 60
    end
    object sqlRotinaSISTEMA_ROTINA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlRotinaPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 10
    end
    object sqlRotinapIncluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pIncluir'
      Size = 1
    end
    object sqlRotinapAlterar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pAlterar'
      Size = 1
    end
    object sqlRotinapExcluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pExcluir'
      Size = 1
    end
    object sqlRotinapPesquisar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pPesquisar'
      Size = 1
    end
    object sqlRotinapRelatorio: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pRelatorio'
      Size = 1
    end
    object sqlRotinapEspecial: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pEspecial'
      Size = 1
    end
  end
  object sqlUsuariosPesquisa: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT U.USUARIO_ID, U.NOME_COMPLETO, U.LOGIN, U.FUNCAO, U.ASSIN' +
      'A, U.SITUACAO'#13#10'FROM G_USUARIO U'#13#10'  LEFT OUTER JOIN G_USUARIO_SIS' +
      'TEMA US ON'#13#10'  U.USUARIO_ID = US.USUARIO_ID'#13#10'WHERE (U.SITUACAO = ' +
      ':SITUACAO1'#13#10'  OR      U.SITUACAO = :SITUACAO2)'#13#10'GROUP BY U.USUAR' +
      'IO_ID, U.NOME_COMPLETO, U.LOGIN, U.FUNCAO, U.ASSINA, U.SITUACAO'#13 +
      #10'ORDER BY NOME_COMPLETO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'SITUACAO1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACAO2'
        ParamType = ptInput
      end>
    Params = <>
    AfterScroll = sqlUsuariosPesquisaAfterScroll
    Left = 43
    Top = 166
    object sqlUsuariosPesquisaNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlUsuariosPesquisaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object sqlUsuariosPesquisaFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object sqlUsuariosPesquisaASSINA: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
    object sqlUsuariosPesquisaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlUsuariosPesquisaUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
  end
  object dtsUsuariosPesquisa: TDataSource
    DataSet = sqlUsuariosPesquisa
    Left = 45
    Top = 222
  end
  object sqlUsuarioSistema: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT US.SISTEMA_ID, UG.DESCRICAO'#13#10'FROM G_USUARIO_SISTEMA US'#13#10' ' +
      ' LEFT OUTER JOIN G_USUARIO_GRUPO UG ON'#13#10'  US.USUARIO_GRUPO_ID = ' +
      'UG.USUARIO_GRUPO_ID'#13#10'WHERE US.USUARIO_ID = :USUARIO_ID'#13#10'ORDER BY' +
      ' US.SISTEMA_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'USUARIO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 42
    Top = 306
    object sqlUsuarioSistemaSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlUsuarioSistemaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsUsuarioSistema: TDataSource
    DataSet = sqlUsuarioSistema
    Left = 41
    Top = 362
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.png;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.e' +
      'mf;*.wmf)|*.jpg;*.jpeg|JPEG Image File (*.jpg)|*.jpg|JPEG Image ' +
      'File (*.jpeg)|*.jpeg'
    Left = 219
    Top = 190
  end
  object sqlSistemaUsuario: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT U.USUARIO_ID, U.NOME_COMPLETO,'#13#10' U.LOGIN, U.FUNCAO, US.US' +
      'UARIO_GRUPO_ID'#13#10'FROM G_USUARIO U'#13#10'  LEFT OUTER JOIN G_USUARIO_SI' +
      'STEMA US ON'#13#10'  U.USUARIO_ID = US.USUARIO_ID'#13#10'WHERE U.SITUACAO = ' +
      #39'A'#39#13#10'  AND SISTEMA_ID = :SISTEMA_ID'#13#10'  AND NOT US.USUARIO_GRUPO_' +
      'ID IS NULL'#13#10'ORDER BY NOME_COMPLETO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterEdit = sqlSistemaUsuarioAfterEdit
    AfterScroll = sqlSistemaUsuarioAfterScroll
    Left = 637
    Top = 368
    object sqlSistemaUsuarioUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlSistemaUsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlSistemaUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object sqlSistemaUsuarioFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object sqlSistemaUsuarioUSUARIO_GRUPO_ID: TFMTBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsSistemaUsuario: TDataSource
    DataSet = sqlSistemaUsuario
    Left = 636
    Top = 425
  end
end
