inherited frmPessoa: TfrmPessoa
  Left = 110
  Top = 191
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Pessoas do Sistema'
  ClientHeight = 497
  ClientWidth = 776
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 776
    inherited PanelBotoesBasicos: TPanel
      Width = 715
      inherited cxBtnAlterar: TcxButton
        TabOrder = 2
      end
      inherited cxBtnExcluir: TcxButton
        TabOrder = 3
      end
      inherited cxBtnGravar: TcxButton
        TabOrder = 0
      end
      inherited cxBtnCancelar: TcxButton
        TabOrder = 1
      end
      inherited cxBtnPesquisar: TcxButton
        Left = 248
        Width = 49
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 717
    end
  end
  inherited StatusBar: TStatusBar
    Top = 477
    Width = 776
  end
  inherited PanelGeral: TPanel
    Width = 776
    Height = 418
    inherited PanelData: TPanel
      Width = 774
      Height = 416
      Align = alClient
      Enabled = True
      object pagPrincipal: TPageControl
        Left = 1
        Top = 1
        Width = 772
        Height = 414
        ActivePage = tabCadastro
        Align = alClient
        TabOrder = 0
        object tabCadastro: TTabSheet
          Caption = 'Cadastro'
          object pnlSelecao: TPanel
            Left = 0
            Top = 0
            Width = 131
            Height = 386
            Align = alLeft
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object rdbTipoPessoa: TcxRadioGroup
              Left = 5
              Top = 4
              Width = 123
              Height = 98
              Caption = ' Tipo da Pessoa '
              ItemIndex = 0
              Properties.Items = <
                item
                  Caption = 'F'#237'sica'
                end
                item
                  Caption = 'Jur'#237'dica'
                end
                item
                  Caption = 'Sinal P'#250'blico'
                end>
              Properties.OnChange = rdbTipoPessoaPropertiesChange
              Style.BorderStyle = ebsOffice11
              Style.Shadow = True
              Style.TextColor = clNavy
              TabOrder = 0
              OnClick = rdbTipoPessoaClick
              OnEditing = rdbTipoPessoaEditing
            end
            object lblPesquisaCPF: TcxLabel
              Left = 6
              Top = 103
              Width = 27
              Height = 17
              Caption = 'CPF:'
              Style.TextColor = clNavy
            end
            object edtPesquisaCPF: TcxMaskEdit
              Left = 8
              Top = 120
              Width = 116
              Height = 24
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.MaxLength = 0
              Style.BorderStyle = ebs3D
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              Style.Shadow = True
              TabOrder = 1
              OnKeyDown = edtPesquisaCPFKeyDown
            end
            object btnSelecionar: TcxButton
              Left = 8
              Top = 149
              Width = 115
              Height = 25
              Cursor = crArrow
              Caption = 'Selecionar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = btnSelecionarClick
              Colors.Default = clBlue
              Colors.Normal = clBtnFace
              Colors.Pressed = clGreen
              Colors.Disabled = clGray
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
            end
            object btnBiometria: TcxButton
              Left = 8
              Top = 201
              Width = 115
              Height = 25
              Cursor = crArrow
              Caption = 'Adquirir Biometria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              Colors.Default = clBlue
              Colors.Normal = clBtnFace
              Colors.Pressed = clGreen
              Colors.Disabled = clGray
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
            end
            object btnQualificacao: TcxButton
              Left = 8
              Top = 175
              Width = 115
              Height = 25
              Cursor = crArrow
              Caption = 'Qualifica'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              Colors.Default = clBlue
              Colors.Normal = clBtnFace
              Colors.Pressed = clGreen
              Colors.Disabled = clGray
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
            end
            object pnlConjuge: TPanel
              Left = 5
              Top = 230
              Width = 122
              Height = 84
              BevelInner = bvLowered
              BevelOuter = bvNone
              Color = clSilver
              TabOrder = 6
              object Shape1: TShape
                Left = 1
                Top = 1
                Width = 120
                Height = 82
                Align = alClient
                Brush.Style = bsClear
                Pen.Color = 10775558
              end
              object btnVerificarConjuge: TcxButton
                Left = 3
                Top = 3
                Width = 115
                Height = 25
                Cursor = crArrow
                Caption = 'Verificar C'#244'njuge'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                OnClick = btnVerificarConjugeClick
                Colors.Default = clBlue
                Colors.Normal = clBtnFace
                Colors.Pressed = clGreen
                Colors.Disabled = clGray
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = False
              end
              object btnAnexarConjuge: TcxButton
                Left = 3
                Top = 28
                Width = 115
                Height = 25
                Cursor = crArrow
                Caption = 'Anexar C'#244'njuge'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = btnAnexarConjugeClick
                Colors.Default = clBlue
                Colors.Normal = clBtnFace
                Colors.Pressed = clGreen
                Colors.Disabled = clGray
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = False
              end
              object btnExcluirConjuge: TcxButton
                Left = 3
                Top = 55
                Width = 115
                Height = 25
                Cursor = crArrow
                Caption = 'Excluir C'#244'njuge'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                OnClick = btnExcluirConjugeClick
                Colors.Default = clBlue
                Colors.Normal = clBtnFace
                Colors.Pressed = clGreen
                Colors.Disabled = clGray
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = False
              end
            end
          end
          object pnlTipoPessoas: TPanel
            Left = 131
            Top = 0
            Width = 633
            Height = 386
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PagCadastro: TPageControl
              Left = 0
              Top = 0
              Width = 633
              Height = 263
              ActivePage = tabPessoaJuridica
              Align = alTop
              MultiLine = True
              TabOrder = 0
              TabPosition = tpLeft
              object tabPessoaFisica: TTabSheet
                Caption = 'Pessoa F'#237'sica'
                object pnlPessoaFisica: TPanel
                  Left = 0
                  Top = 0
                  Width = 606
                  Height = 255
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btnAdEstadoCivil: TSpeedButton
                    Left = 268
                    Top = 37
                    Width = 19
                    Height = 20
                    Cursor = crHandPoint
                    Flat = True
                    Glyph.Data = {
                      EE000000424DEE000000000000007600000028000000100000000F0000000100
                      04000000000078000000CE0E0000C40E00001000000000000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                      7777700000000000077770FFFFFFFF0B077770FFFFFF000B000770FFFFFF0BBB
                      BB0770FFFFFF000B000770FFFFFFFF0B077770FFFFFFFF00077770FFFFFFFFF0
                      777770FFFFFFFFF0777770FFFFFF0000777770FFFFFF0F07777770FFFFFF0077
                      777770000000077777777777777777777777}
                    OnClick = btnAdEstadoCivilClick
                  end
                  object btnAdRegimeComunhao: TSpeedButton
                    Left = 268
                    Top = 61
                    Width = 19
                    Height = 20
                    Cursor = crHandPoint
                    Flat = True
                    Glyph.Data = {
                      EE000000424DEE000000000000007600000028000000100000000F0000000100
                      04000000000078000000CE0E0000C40E00001000000000000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                      7777700000000000077770FFFFFFFF0B077770FFFFFF000B000770FFFFFF0BBB
                      BB0770FFFFFF000B000770FFFFFFFF0B077770FFFFFFFF00077770FFFFFFFFF0
                      777770FFFFFFFFF0777770FFFFFF0000777770FFFFFF0F07777770FFFFFF0077
                      777770000000077777777777777777777777}
                    OnClick = btnAdRegimeComunhaoClick
                  end
                  object btnAdProfissao: TSpeedButton
                    Left = 268
                    Top = 85
                    Width = 19
                    Height = 20
                    Cursor = crHandPoint
                    Flat = True
                    Glyph.Data = {
                      EE000000424DEE000000000000007600000028000000100000000F0000000100
                      04000000000078000000CE0E0000C40E00001000000000000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                      7777700000000000077770FFFFFFFF0B077770FFFFFF000B000770FFFFFF0BBB
                      BB0770FFFFFF000B000770FFFFFFFF0B077770FFFFFFFF00077770FFFFFFFFF0
                      777770FFFFFFFFF0777770FFFFFF0000777770FFFFFF0F07777770FFFFFF0077
                      777770000000077777777777777777777777}
                    OnClick = btnAdProfissaoClick
                  end
                  object cxLabel15: TcxLabel
                    Left = 8
                    Top = 38
                    Width = 62
                    Height = 17
                    Caption = 'Estado Civil:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel18: TcxLabel
                    Left = 8
                    Top = 62
                    Width = 43
                    Height = 17
                    Caption = 'Regime:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel19: TcxLabel
                    Left = 8
                    Top = 134
                    Width = 75
                    Height = 17
                    Caption = 'Nacionalidade:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel20: TcxLabel
                    Left = 8
                    Top = 85
                    Width = 50
                    Height = 17
                    Caption = 'Profiss'#227'o:'
                    Style.TextColor = clNavy
                  end
                  object cxDBDateEdit3: TcxDBDateEdit
                    Left = 84
                    Top = 109
                    Width = 203
                    Height = 19
                    DataBinding.DataField = 'DATA_NASCIMENTO'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 5
                  end
                  object cxDBTextEdit2: TcxDBTextEdit
                    Left = 84
                    Top = 133
                    Width = 203
                    Height = 19
                    DataBinding.DataField = 'NACIONALIDADE'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 6
                  end
                  object cxLabel21: TcxLabel
                    Left = 8
                    Top = 158
                    Width = 67
                    Height = 17
                    Caption = 'Naturalidade:'
                    Style.TextColor = clNavy
                  end
                  object cxDBTextEdit6: TcxDBTextEdit
                    Left = 84
                    Top = 157
                    Width = 203
                    Height = 19
                    DataBinding.DataField = 'NATURALIDADE'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 7
                    OnExit = cxDBTextEdit6Exit
                  end
                  object lcxTipoRegime: TcxDBLookupComboBox
                    Left = 84
                    Top = 61
                    Width = 181
                    Height = 19
                    RepositoryItem = dtmLookup.listaG_TB_RegimeComunhao
                    DataBinding.DataField = 'TB_REGIMECOMUNHAO_ID'
                    DataBinding.DataSource = SourceAncestral
                    Enabled = False
                    ParentFont = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.ListColumns = <>
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 3
                  end
                  object cxDBLookupComboBox6: TcxDBLookupComboBox
                    Left = 84
                    Top = 85
                    Width = 181
                    Height = 19
                    RepositoryItem = dtmLookup.listaG_TB_Profissao
                    DataBinding.DataField = 'TB_PROFISSAO_ID'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.ListColumns = <>
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 4
                  end
                  object cxLabel22: TcxLabel
                    Left = 8
                    Top = 110
                    Width = 61
                    Height = 17
                    Caption = 'Data Nasc.:'
                    Style.TextColor = clNavy
                  end
                  object gbxConjuge: TcxGroupBox
                    Left = 5
                    Top = 206
                    Width = 594
                    Height = 45
                    Caption = ' C'#244'njuge: '
                    Style.BorderStyle = ebsSingle
                    Style.Shadow = False
                    Style.TextColor = clGreen
                    TabOrder = 20
                    object cxLabel31: TcxLabel
                      Left = 9
                      Top = 20
                      Width = 27
                      Height = 17
                      Caption = 'CPF:'
                      Style.TextColor = clNavy
                    end
                    object edtCpfConjuge: TcxMaskEdit
                      Left = 38
                      Top = 18
                      Width = 84
                      Height = 19
                      Enabled = False
                      ParentFont = False
                      Properties.AlwaysShowBlanksAndLiterals = True
                      Properties.EditMask = '999\.999\.999\-99;0;_'
                      Properties.MaxLength = 0
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 0
                      Text = '           '
                    end
                    object cxLabel32: TcxLabel
                      Left = 128
                      Top = 20
                      Width = 46
                      Height = 17
                      Caption = 'C'#244'njuge:'
                      Style.TextColor = clNavy
                    end
                    object edtConjuge: TcxTextEdit
                      Left = 175
                      Top = 18
                      Width = 405
                      Height = 19
                      Enabled = False
                      ParentFont = False
                      Properties.CharCase = ecUpperCase
                      Style.Shadow = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 3
                    end
                  end
                  object cxLabel29: TcxLabel
                    Left = 9
                    Top = 8
                    Width = 41
                    Height = 17
                    Caption = 'Nome:'
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    Style.TextColor = clNavy
                  end
                  object edtNome: TcxDBTextEdit
                    Left = 84
                    Top = 6
                    Width = 392
                    Height = 24
                    DataBinding.DataField = 'NOME'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.CharCase = ecUpperCase
                    Style.Shadow = True
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 0
                  end
                  object cxLabel30: TcxLabel
                    Left = 479
                    Top = 8
                    Width = 31
                    Height = 17
                    Caption = 'Sexo:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel27: TcxLabel
                    Left = 17
                    Top = 186
                    Width = 22
                    Height = 17
                    Caption = 'Pai:'
                    Style.TextColor = clNavy
                  end
                  object edtPai: TcxDBTextEdit
                    Left = 42
                    Top = 185
                    Width = 245
                    Height = 19
                    DataBinding.DataField = 'NOME_PAI'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 8
                  end
                  object cxLabel28: TcxLabel
                    Left = 304
                    Top = 186
                    Width = 28
                    Height = 17
                    Caption = 'M'#227'e:'
                    Style.TextColor = clNavy
                  end
                  object cxDBTextEdit11: TcxDBTextEdit
                    Left = 333
                    Top = 185
                    Width = 253
                    Height = 19
                    DataBinding.DataField = 'NOME_MAE'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 9
                  end
                  object lcxEstadoCivil: TcxDBLookupComboBox
                    Left = 84
                    Top = 36
                    Width = 181
                    Height = 21
                    RepositoryItem = dtmLookup.listaG_TB_EstadoCivil
                    DataBinding.DataField = 'TB_ESTADOCIVIL_ID'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.ListColumns = <
                      item
                        FieldName = 'TB_ESTADOCIVIL_ID'
                      end>
                    Properties.OnChange = lcxEstadoCivilPropertiesChange
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 2
                    OnEnter = lcxEstadoCivilEnter
                    OnExit = lcxEstadoCivilExit
                  end
                  object icxSexo: TcxDBImageComboBox
                    Left = 512
                    Top = 6
                    Width = 79
                    Height = 21
                    RepositoryItem = dtmLookup.Combo_Sexo
                    DataBinding.DataField = 'SEXO'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.Items = <>
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 1
                    OnExit = icxSexoExit
                  end
                  object lblCpfConjugeTerceiro: TcxLabel
                    Left = 41
                    Top = 241
                    Width = 87
                    Height = 17
                    Caption = ' CPF de Terceiro '
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.Alignment.Vert = taVCenter
                    Style.BorderStyle = ebsNone
                    Style.Shadow = False
                    Style.TextColor = clRed
                    Style.TextStyle = []
                    Visible = False
                  end
                end
                object pgcDocumentos: TPageControl
                  Left = 294
                  Top = 32
                  Width = 298
                  Height = 147
                  ActivePage = tabDocumento
                  TabOrder = 0
                  object tabDocumento: TTabSheet
                    Caption = 'Documenta'#231#227'o'
                    object btnAdTipoDocumento: TSpeedButton
                      Left = 263
                      Top = 46
                      Width = 19
                      Height = 20
                      Cursor = crHandPoint
                      Flat = True
                      Glyph.Data = {
                        EE000000424DEE000000000000007600000028000000100000000F0000000100
                        04000000000078000000CE0E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                        7777700000000000077770FFFFFFFF0B077770FFFFFF000B000770FFFFFF0BBB
                        BB0770FFFFFF000B000770FFFFFFFF0B077770FFFFFFFF00077770FFFFFFFFF0
                        777770FFFFFFFFF0777770FFFFFF0000777770FFFFFF0F07777770FFFFFF0077
                        777770000000077777777777777777777777}
                      OnClick = btnAdTipoDocumentoClick
                    end
                    object Image1: TImage
                      Left = 42
                      Top = 3
                      Width = 17
                      Height = 17
                    end
                    object cxLabel23: TcxLabel
                      Left = 4
                      Top = 49
                      Width = 28
                      Height = 17
                      Caption = 'Tipo:'
                      Style.TextColor = clNavy
                    end
                    object cxDBLookupComboBox7: TcxDBLookupComboBox
                      Left = 62
                      Top = 48
                      Width = 198
                      Height = 19
                      RepositoryItem = dtmLookup.listaG_TB_DocumentoTipo
                      DataBinding.DataField = 'TB_DOCUMENTOTIPO_ID'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.DropDownListStyle = lsFixedList
                      Properties.ListColumns = <>
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 1
                    end
                    object cxLabel24: TcxLabel
                      Left = 4
                      Top = 73
                      Width = 53
                      Height = 17
                      Caption = 'N'#186'/Org'#227'o:'
                      Style.TextColor = clNavy
                    end
                    object cxDBTextEdit9: TcxDBTextEdit
                      Left = 62
                      Top = 72
                      Width = 221
                      Height = 19
                      DataBinding.DataField = 'DOCUMENTO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 2
                    end
                    object cxLabel25: TcxLabel
                      Left = 4
                      Top = 97
                      Width = 57
                      Height = 17
                      Caption = 'Expedi'#231#227'o:'
                      Style.TextColor = clNavy
                    end
                    object cxLabel26: TcxLabel
                      Left = 150
                      Top = 97
                      Width = 48
                      Height = 17
                      Caption = 'Validade:'
                      Style.TextColor = clNavy
                    end
                    object cxDBDateEdit5: TcxDBDateEdit
                      Left = 197
                      Top = 96
                      Width = 86
                      Height = 19
                      DataBinding.DataField = 'DOCUMENTO_VALIDADE'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 4
                      OnExit = cxDBDateEdit5Exit
                    end
                    object cxLabel1: TcxLabel
                      Left = 4
                      Top = 4
                      Width = 32
                      Height = 17
                      Caption = 'CPF:'
                      Style.TextColor = clNavy
                      Style.TextStyle = [fsBold]
                    end
                    object edtCpf: TcxDBMaskEdit
                      Left = 62
                      Top = 2
                      Width = 121
                      Height = 19
                      DataBinding.DataField = 'CPF_CNPJ'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Properties.AlwaysShowBlanksAndLiterals = True
                      Properties.EditMask = '999\.999\.999\-99;0;_'
                      Properties.MaxLength = 0
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 0
                      OnExit = edtCpfExit
                    end
                    object cxLabel2: TcxLabel
                      Left = 5
                      Top = 27
                      Width = 121
                      Height = 17
                      Caption = 'Outro tipo de documento'
                      Properties.Alignment.Horz = taLeftJustify
                      Properties.Alignment.Vert = taVCenter
                      Style.BorderStyle = ebsNone
                      Style.Shadow = False
                      Style.TextColor = clBlue
                      Style.TextStyle = [fsUnderline]
                    end
                    object cxDBDateEdit4: TcxDBDateEdit
                      Left = 62
                      Top = 96
                      Width = 85
                      Height = 19
                      DataBinding.DataField = 'DOCUMENTO_EXPEDICAO'
                      DataBinding.DataSource = SourceAncestral
                      ParentFont = False
                      Style.StyleController = dtmControles.cxEsc_EditsNormal
                      TabOrder = 3
                    end
                    object lblCpfTerceiro: TcxLabel
                      Left = 189
                      Top = 3
                      Width = 81
                      Height = 17
                      Caption = 'CPF de Terceiro'
                      Properties.Alignment.Horz = taLeftJustify
                      Properties.Alignment.Vert = taVCenter
                      Style.BorderStyle = ebsNone
                      Style.Shadow = False
                      Style.TextColor = clRed
                      Style.TextStyle = []
                      Visible = False
                    end
                  end
                  object tabDadosCasamento: TTabSheet
                    Caption = 'Dados do Casamento'
                    ImageIndex = 1
                  end
                end
              end
              object tabPessoaJuridica: TTabSheet
                Caption = 'Pessoa Jur'#237'dica'
                ImageIndex = 1
                object pnlPessoaJuridica: TPanel
                  Left = 0
                  Top = 0
                  Width = 606
                  Height = 81
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object cxLabel4: TcxLabel
                    Left = 414
                    Top = 34
                    Width = 40
                    Height = 17
                    Caption = 'CNPJ:'
                    Style.TextColor = clNavy
                    Style.TextStyle = [fsBold]
                  end
                  object cxLabel7: TcxLabel
                    Left = 260
                    Top = 57
                    Width = 73
                    Height = 17
                    Caption = 'Concord'#226'ncia:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel5: TcxLabel
                    Left = 9
                    Top = 57
                    Width = 94
                    Height = 17
                    Caption = 'Inscri'#231#227'o Estadual:'
                    Style.TextColor = clNavy
                  end
                  object cxLabel3: TcxLabel
                    Left = 9
                    Top = 8
                    Width = 84
                    Height = 17
                    Caption = 'Raz'#227'o Social:'
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    Style.TextColor = clNavy
                  end
                  object cxLabel6: TcxLabel
                    Left = 9
                    Top = 32
                    Width = 78
                    Height = 17
                    Caption = 'Nome Fantasia:'
                    Style.TextColor = clNavy
                  end
                  object edtRazaoSocial: TcxDBTextEdit
                    Left = 109
                    Top = 6
                    Width = 490
                    Height = 24
                    DataBinding.DataField = 'NOME'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.CharCase = ecUpperCase
                    Style.Shadow = True
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 5
                  end
                  object cxDBTextEdit4: TcxDBTextEdit
                    Left = 110
                    Top = 32
                    Width = 299
                    Height = 19
                    DataBinding.DataField = 'NOME_FANTASIA'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 6
                  end
                  object edtCNPJJuridico: TcxDBMaskEdit
                    Left = 455
                    Top = 32
                    Width = 143
                    Height = 22
                    DataBinding.DataField = 'CPF_CNPJ'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.AlwaysShowBlanksAndLiterals = True
                    Properties.EditMask = '99\.999\.999\/9999\-99;0;_'
                    Properties.MaxLength = 0
                    Style.BorderColor = clBlack
                    Style.BorderStyle = ebsSingle
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clNavy
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = []
                    Style.Shadow = True
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 7
                    OnExit = edtCNPJJuridicoExit
                  end
                  object cxDBTextEdit3: TcxDBTextEdit
                    Left = 110
                    Top = 56
                    Width = 147
                    Height = 19
                    DataBinding.DataField = 'DOCUMENTO'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 8
                  end
                  object edtConcordancia: TcxDBImageComboBox
                    Left = 332
                    Top = 56
                    Width = 79
                    Height = 21
                    RepositoryItem = dtmLookup.Combo_Sexo
                    DataBinding.DataField = 'SEXO'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.Items = <>
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 9
                  end
                end
                object cxGroupBox1: TcxGroupBox
                  Left = 0
                  Top = 89
                  Width = 606
                  Height = 166
                  Align = alClient
                  Caption = ' Representantes Vinculados a Empresa '
                  Style.TextColor = clGreen
                  TabOrder = 1
                  object pnlRepresentantes: TPanel
                    Left = 2
                    Top = 16
                    Width = 602
                    Height = 148
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    object pnlAlterarRepresentante: TPanel
                      Left = 0
                      Top = 49
                      Width = 602
                      Height = 68
                      Align = alBottom
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      TabOrder = 0
                      Visible = False
                      object cxLabel9: TcxLabel
                        Left = 6
                        Top = 3
                        Width = 116
                        Height = 17
                        Caption = 'Tipo do Representante:'
                        Style.TextColor = clNavy
                      end
                      object cxLabel12: TcxLabel
                        Left = 221
                        Top = 3
                        Width = 132
                        Height = 17
                        Caption = 'Marca'#231#227'o de Qualifica'#231#227'o:'
                        Style.TextColor = clNavy
                      end
                      object cxLabel17: TcxLabel
                        Left = 418
                        Top = 3
                        Width = 80
                        Height = 17
                        Caption = 'Assinatura Tipo:'
                        Style.TextColor = clNavy
                      end
                      object lcxTipoRepresentante: TcxDBLookupComboBox
                        Left = 9
                        Top = 21
                        Width = 207
                        Height = 21
                        RepositoryItem = dtmLookupTab.Lista_PartesAto_SomenteAuxiliar
                        DataBinding.DataField = 'ATO_PARTETIPO_ID'
                        DataBinding.DataSource = dtsRepresentante
                        ParentFont = False
                        Properties.ListColumns = <>
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 3
                      end
                      object lcxMarcacaoQualificacao: TcxDBLookupComboBox
                        Left = 222
                        Top = 21
                        Width = 190
                        Height = 21
                        RepositoryItem = dtmLookupTab.Lista_QualificacaoGeral
                        DataBinding.DataField = 'MARCACAO_TIPO_ID'
                        DataBinding.DataSource = dtsRepresentante
                        ParentFont = False
                        Properties.ListColumns = <>
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 4
                      end
                      object icxAssinaturaTipo: TcxDBImageComboBox
                        Left = 416
                        Top = 21
                        Width = 177
                        Height = 21
                        RepositoryItem = dtmLookupTab.Combo_AtoAssinaturaTipo
                        DataBinding.DataField = 'ASSINATURA_TIPO'
                        DataBinding.DataSource = dtsRepresentante
                        ParentFont = False
                        Properties.Items = <>
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 5
                      end
                      object lblAuxiliarRep: TcxLabel
                        Left = 91
                        Top = 47
                        Width = 128
                        Height = 17
                        Caption = 'Auxiliar do Representante:'
                        Style.TextColor = clRed
                      end
                      object chxAuxiliar: TCheckBox
                        Left = 11
                        Top = 47
                        Width = 66
                        Height = 17
                        Caption = 'Auxiliar'
                        TabOrder = 6
                        OnClick = chxAuxiliarClick
                      end
                      object lcxPessoaAuxiliar: TcxDBLookupComboBox
                        Left = 223
                        Top = 44
                        Width = 370
                        Height = 19
                        DataBinding.DataField = 'PESSOA_AUXILIAR_ID'
                        DataBinding.DataSource = dtsRepresentante
                        ParentFont = False
                        Properties.KeyFieldNames = 'REPRESENTANTE_ID'
                        Properties.ListColumns = <
                          item
                            FieldName = 'NOME'
                          end>
                        Properties.ListSource = dtsPessoaAuxiliar
                        Style.StyleController = dtmControles.cxEsc_EditsNormal
                        TabOrder = 8
                      end
                    end
                    object pnlBtnRepresentante: TPanel
                      Left = 0
                      Top = 117
                      Width = 602
                      Height = 31
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 1
                      object btnAlterarRep: TcxButton
                        Left = 121
                        Top = 4
                        Width = 115
                        Height = 25
                        Caption = 'Alterar'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        OnClick = btnAlterarRepClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfOffice11
                      end
                      object btnExcluirRep: TcxButton
                        Left = 237
                        Top = 4
                        Width = 115
                        Height = 25
                        Caption = 'Excluir'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 1
                        OnClick = btnExcluirRepClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfOffice11
                      end
                      object btnGravarRep: TcxButton
                        Left = 353
                        Top = 4
                        Width = 115
                        Height = 25
                        Caption = 'Gravar'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                        OnClick = btnGravarRepClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfOffice11
                      end
                      object btnCancelarRep: TcxButton
                        Left = 469
                        Top = 4
                        Width = 115
                        Height = 25
                        Caption = 'Cancelar'
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 3
                        OnClick = btnCancelarRepClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfOffice11
                      end
                      object btnIncluirRep: TcxButton
                        Left = 5
                        Top = 4
                        Width = 115
                        Height = 25
                        Caption = 'Incluir'
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 4
                        OnClick = btnIncluirRepClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfOffice11
                      end
                    end
                    object grdRepresentantes: TcxDBTreeList
                      Left = 0
                      Top = 0
                      Width = 602
                      Height = 49
                      Styles.Inactive = dtmControles.cxStyle10
                      Styles.Selection = dtmControles.cxStyle14
                      Styles.ContentEven = dtmControles.cxStyle18
                      Styles.ContentOdd = dtmControles.cxStyle26
                      Align = alClient
                      Bands = <
                        item
                          Caption.AlignHorz = taCenter
                          Caption.AlignVert = vaCenter
                          Caption.GlyphAlignHorz = taCenter
                          Caption.GlyphAlignVert = vaCenter
                          Caption.Text = 'Partes'
                          Styles.Header = dtmControles.cxStyle24
                          Width = 600
                        end>
                      BufferedPaint = False
                      DataController.DataSource = dtsRepresentante
                      DataController.ParentField = 'PESSOA_AUXILIAR_ID'
                      DataController.KeyField = 'REPRESENTANTE_ID'
                      OptionsData.Deleting = False
                      OptionsSelection.CellSelect = False
                      OptionsSelection.MultiSelect = True
                      Preview.LeftIndent = 2
                      Preview.MaxLineCount = 2
                      Preview.Place = tlppTop
                      Preview.Visible = True
                      RootValue = -1
                      TabOrder = 2
                      object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
                        Caption.Text = 'Representante'
                        DataBinding.FieldName = 'calc_NomeRepresentante'
                        Width = 255
                        Position.ColIndex = 0
                        Position.RowIndex = 0
                        Position.BandIndex = 0
                      end
                      object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
                        RepositoryItem = dtmLookupTab.Lista_PartesAto_SomenteAuxiliar
                        Caption.AlignHorz = taCenter
                        Caption.AlignVert = vaCenter
                        Caption.GlyphAlignHorz = taCenter
                        Caption.GlyphAlignVert = vaCenter
                        Caption.Text = 'Tipo'
                        DataBinding.FieldName = 'ATO_PARTETIPO_ID'
                        Options.Sorting = False
                        Width = 167
                        Position.ColIndex = 1
                        Position.RowIndex = 0
                        Position.BandIndex = 0
                      end
                      object cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn
                        RepositoryItem = dtmLookupTab.Combo_AtoAssinaturaImagem
                        Caption.Text = 'Assinatura'
                        DataBinding.FieldName = 'ASSINATURA_TIPO'
                        Options.Sorting = False
                        Width = 57
                        Position.ColIndex = 2
                        Position.RowIndex = 0
                        Position.BandIndex = 0
                      end
                      object cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn
                        RepositoryItem = dtmLookupTab.Lista_QualificacaoGeral
                        Caption.Text = 'Qualifica'#231#227'o'
                        DataBinding.FieldName = 'MARCACAO_TIPO_ID'
                        Options.Sorting = False
                        Width = 121
                        Position.ColIndex = 3
                        Position.RowIndex = 0
                        Position.BandIndex = 0
                      end
                    end
                  end
                end
                object cxSplitter1: TcxSplitter
                  Left = 0
                  Top = 81
                  Width = 606
                  Height = 8
                  HotZoneClassName = 'TcxMediaPlayer9Style'
                  AlignSplitter = salTop
                  Control = pnlPessoaJuridica
                end
              end
              object tabSinalPublico: TTabSheet
                Caption = 'Sinal P'#250'blico'
                ImageIndex = 2
                object pnlSinalPublico: TPanel
                  Left = 0
                  Top = 0
                  Width = 606
                  Height = 65
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object cxLabel8: TcxLabel
                    Left = 9
                    Top = 8
                    Width = 53
                    Height = 17
                    Caption = 'Cart'#243'rio:'
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    Style.TextColor = clNavy
                  end
                  object edtNomeCartorio: TcxDBTextEdit
                    Left = 62
                    Top = 6
                    Width = 538
                    Height = 24
                    DataBinding.DataField = 'NOME'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.CharCase = ecUpperCase
                    Style.Shadow = True
                    Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                    TabOrder = 1
                  end
                  object edtCNPJSinalPublico: TcxDBMaskEdit
                    Left = 62
                    Top = 32
                    Width = 143
                    Height = 22
                    DataBinding.DataField = 'CPF_CNPJ'
                    DataBinding.DataSource = SourceAncestral
                    ParentFont = False
                    Properties.AlwaysShowBlanksAndLiterals = True
                    Properties.EditMask = '99\.999\.999\/9999\-99;0;_'
                    Properties.MaxLength = 0
                    Style.BorderColor = clBlack
                    Style.BorderStyle = ebsSingle
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clNavy
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = []
                    Style.Shadow = True
                    Style.StyleController = dtmControles.cxEsc_EditsNormal
                    TabOrder = 2
                    OnExit = edtCNPJSinalPublicoExit
                  end
                  object cxLabel13: TcxLabel
                    Left = 9
                    Top = 34
                    Width = 40
                    Height = 17
                    Caption = 'CNPJ:'
                    Style.TextColor = clNavy
                    Style.TextStyle = [fsBold]
                  end
                end
                object cxGroupBox2: TcxGroupBox
                  Left = 0
                  Top = 65
                  Width = 606
                  Height = 190
                  Align = alClient
                  Caption = ' Escrevente(s) / Tabeli'#227'o '
                  Style.TextColor = clGreen
                  TabOrder = 1
                  object Panel2: TPanel
                    Left = 7
                    Top = 18
                    Width = 588
                    Height = 168
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Panel3: TPanel
                      Left = 0
                      Top = 0
                      Width = 588
                      Height = 90
                      Align = alClient
                      TabOrder = 0
                      object cxGridSinalPublico: TcxGrid
                        Left = 1
                        Top = 1
                        Width = 586
                        Height = 88
                        Align = alClient
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        RootLevelStyles.TabsBackground = dtmControles.cxStyle1
                        object cxGridDBTableView1: TcxGridDBTableView
                          DataController.DataSource = dtsSinalPublico
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <>
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
                          OptionsView.GroupByBox = False
                          OptionsView.Indicator = True
                          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
                          object cxGridDBColumn1: TcxGridDBColumn
                            Caption = 'Nome'
                            DataBinding.FieldName = 'NOME'
                            Width = 365
                          end
                          object cxGridDBColumn2: TcxGridDBColumn
                            Caption = 'Tipo do V'#237'nculo'
                            DataBinding.FieldName = 'TB_SINALPUBLICO_ID'
                            RepositoryItem = dtmLookupTab.Combo_TBSinalPublico
                            Options.Filtering = False
                            Width = 152
                          end
                        end
                        object cxGridLevel1: TcxGridLevel
                          GridView = cxGridDBTableView1
                        end
                      end
                    end
                    object pnlAlterarSinalPublico: TPanel
                      Left = 0
                      Top = 90
                      Width = 588
                      Height = 46
                      Align = alBottom
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      TabOrder = 1
                      Visible = False
                      object btnAdVinculoSP: TSpeedButton
                        Left = 558
                        Top = 20
                        Width = 19
                        Height = 20
                        Cursor = crHandPoint
                        Flat = True
                        Glyph.Data = {
                          EE000000424DEE000000000000007600000028000000100000000F0000000100
                          04000000000078000000CE0E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                          7777700000000000077770FFFFFFFF0B077770FFFFFF000B000770FFFFFF0BBB
                          BB0770FFFFFF000B000770FFFFFFFF0B077770FFFFFFFF00077770FFFFFFFFF0
                          777770FFFFFFFFF0777770FFFFFF0000777770FFFFFF0F07777770FFFFFF0077
                          777770000000077777777777777777777777}
                        OnClick = btnAdVinculoSPClick
                      end
                      object cxLabel14: TcxLabel
                        Left = 381
                        Top = 3
                        Width = 80
                        Height = 17
                        Caption = 'Tipo do V'#237'nculo'
                        Style.TextColor = clNavy
                      end
                      object cxLabel16: TcxLabel
                        Left = 6
                        Top = 3
                        Width = 32
                        Height = 17
                        Caption = 'Nome'
                        Style.TextColor = clNavy
                      end
                      object edtNomeSinalPublico: TcxDBTextEdit
                        Left = 8
                        Top = 21
                        Width = 369
                        Height = 21
                        DataBinding.DataField = 'NOME'
                        DataBinding.DataSource = dtsSinalPublico
                        ParentFont = False
                        Properties.CharCase = ecUpperCase
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 0
                      end
                      object lcxVinculoSinalPublico: TcxDBLookupComboBox
                        Left = 382
                        Top = 20
                        Width = 174
                        Height = 21
                        RepositoryItem = dtmLookupTab.Combo_TBSinalPublico
                        DataBinding.DataField = 'TB_SINALPUBLICO_ID'
                        DataBinding.DataSource = dtsSinalPublico
                        ParentFont = False
                        Properties.DropDownListStyle = lsFixedList
                        Properties.ListColumns = <>
                        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                        TabOrder = 1
                      end
                    end
                    object pnlBtnSinalPublico: TPanel
                      Left = 0
                      Top = 136
                      Width = 588
                      Height = 32
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 2
                      object btnAlterarSP: TcxButton
                        Left = 121
                        Top = 4
                        Width = 114
                        Height = 25
                        Caption = 'Alterar'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        OnClick = btnAlterarSPClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfUltraFlat
                      end
                      object btnExcluirSP: TcxButton
                        Left = 237
                        Top = 4
                        Width = 114
                        Height = 25
                        Caption = 'Excluir'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 1
                        OnClick = btnExcluirSPClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfUltraFlat
                      end
                      object btnGravarSP: TcxButton
                        Left = 353
                        Top = 4
                        Width = 114
                        Height = 25
                        Caption = 'Gravar'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                        OnClick = btnGravarSPClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfUltraFlat
                      end
                      object btnCancelarSP: TcxButton
                        Left = 469
                        Top = 4
                        Width = 114
                        Height = 25
                        Caption = 'Cancelar'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 3
                        OnClick = btnCancelarSPClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfUltraFlat
                      end
                      object btnIncluirSP: TcxButton
                        Left = 5
                        Top = 4
                        Width = 114
                        Height = 25
                        Caption = 'Incluir'
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 4
                        OnClick = btnIncluirSPClick
                        Glyph.Data = {
                          F6000000424DF600000000000000760000002800000010000000100000000100
                          040000000000800000000000000000000000100000001000000025222300FC9A
                          3B00A49FA300F9780400F8D2AC005A5A5A003F3B3900C3C1C20092908E00E1D9
                          DB0074747400F4BC8800FCFCF800E1D7CB004B464900888382007777777777DD
                          9997777777777760EA007777777777550050D7D7D7D7D77785F788888888888F
                          A0526EEEEEEEEEEE5E508CD9D9D9DDCC88C22433333333BC88C82433333333BC
                          8FC829111111114C88C8FD99999999D9FF9F777277772777A0FD7777777777A6
                          56057777777777665FE07777777777222272777777777777D777}
                        LookAndFeel.Kind = lfUltraFlat
                      end
                    end
                  end
                end
              end
            end
            object pnlOutrosDados: TPanel
              Left = 0
              Top = 263
              Width = 633
              Height = 123
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object cxLabel40: TcxLabel
                Left = 30
                Top = 9
                Width = 35
                Height = 17
                Caption = 'Obs.:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'MS Sans Serif'
                Style.Font.Style = [fsBold]
                Style.TextColor = clNavy
              end
              object cxDBTextEdit20: TcxDBTextEdit
                Left = 66
                Top = 5
                Width = 547
                Height = 22
                DataBinding.DataField = 'OBSERVACAO'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.Shadow = True
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 0
              end
              object cxGroupBox6: TcxGroupBox
                Left = 6
                Top = 27
                Width = 616
                Height = 93
                Caption = ' Contato '
                Style.BorderStyle = ebsSingle
                Style.Shadow = False
                Style.TextColor = clGreen
                TabOrder = 2
                object cxLabel33: TcxLabel
                  Left = 9
                  Top = 20
                  Width = 53
                  Height = 17
                  Caption = 'Endere'#231'o:'
                  Style.TextColor = clNavy
                end
                object cxLabel34: TcxLabel
                  Left = 387
                  Top = 20
                  Width = 34
                  Height = 17
                  Caption = 'Bairro:'
                  Style.TextColor = clNavy
                end
                object cxLabel35: TcxLabel
                  Left = 9
                  Top = 46
                  Width = 40
                  Height = 17
                  Caption = 'Cidade:'
                  Style.TextColor = clNavy
                end
                object cxLabel36: TcxLabel
                  Left = 307
                  Top = 46
                  Width = 21
                  Height = 17
                  Caption = 'UF:'
                  Style.TextColor = clNavy
                end
                object cxLabel37: TcxLabel
                  Left = 9
                  Top = 70
                  Width = 49
                  Height = 17
                  Caption = 'Telefone:'
                  Style.TextColor = clNavy
                end
                object cxLabel38: TcxLabel
                  Left = 387
                  Top = 45
                  Width = 26
                  Height = 17
                  Caption = 'Cep:'
                  Style.TextColor = clNavy
                end
                object cxLabel39: TcxLabel
                  Left = 307
                  Top = 70
                  Width = 32
                  Height = 17
                  Caption = 'Email:'
                  Style.TextColor = clNavy
                end
                object cxDBTextEdit14: TcxDBTextEdit
                  Left = 61
                  Top = 19
                  Width = 322
                  Height = 19
                  DataBinding.DataField = 'ENDERECO'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 7
                end
                object cxDBTextEdit15: TcxDBTextEdit
                  Left = 424
                  Top = 19
                  Width = 182
                  Height = 19
                  DataBinding.DataField = 'BAIRRO'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 8
                end
                object cxDBTextEdit16: TcxDBTextEdit
                  Left = 61
                  Top = 43
                  Width = 243
                  Height = 19
                  DataBinding.DataField = 'CIDADE'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 9
                end
                object cxDBComboBox3: TcxDBComboBox
                  Left = 339
                  Top = 43
                  Width = 45
                  Height = 19
                  DataBinding.DataField = 'UF'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 10
                end
                object cxDBTextEdit18: TcxDBTextEdit
                  Left = 61
                  Top = 67
                  Width = 243
                  Height = 19
                  DataBinding.DataField = 'TELEFONE'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 12
                end
                object cxDBTextEdit19: TcxDBTextEdit
                  Left = 339
                  Top = 67
                  Width = 267
                  Height = 19
                  DataBinding.DataField = 'EMAIL'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Properties.CharCase = ecLowerCase
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 13
                end
                object cxDBMaskEdit1: TcxDBMaskEdit
                  Left = 424
                  Top = 43
                  Width = 182
                  Height = 19
                  DataBinding.DataField = 'CEP'
                  DataBinding.DataSource = SourceAncestral
                  ParentFont = False
                  Properties.AlwaysShowBlanksAndLiterals = True
                  Properties.EditMask = '99\.999\-999;0;_'
                  Properties.MaxLength = 0
                  Style.StyleController = dtmControles.cxEsc_EditsNormal
                  TabOrder = 11
                end
              end
            end
          end
        end
        object tabImagem: TTabSheet
          Caption = 'Imagem Cart'#227'o'
          ImageIndex = 1
          inline fmeFoto1: TfmeFoto
            Left = 192
            Top = 57
            Width = 185
            Height = 177
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 525
    Top = 18
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('SELECT *'#13#10'FROM T_PESSOA'#13#10'WHERE PESSOA_ID = :PESSOA_ID')
    Params = <
      item
        DataType = ftBCD
        NumericScale = 2
        Name = 'PESSOA_ID'
        ParamType = ptInput
        Size = 34
      end>
    Left = 555
    Top = 18
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 587
    Top = 18
  end
  inherited ClientAncestral: TClientDataSet
    BeforePost = ClientAncestralBeforePost
    AfterScroll = ClientAncestralAfterScroll
    Left = 619
    Top = 18
    object ClientAncestralPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralPESSOA_TIPO: TStringField
      FieldName = 'PESSOA_TIPO'
      Size = 1
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object ClientAncestralNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 30
    end
    object ClientAncestralDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object ClientAncestralTB_DOCUMENTOTIPO_ID: TBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralTB_PROFISSAO_ID: TBCDField
      FieldName = 'TB_PROFISSAO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralTB_ESTADOCIVIL_ID: TBCDField
      FieldName = 'TB_ESTADOCIVIL_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 120
    end
    object ClientAncestralNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 120
    end
    object ClientAncestralDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object ClientAncestralNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 60
    end
    object ClientAncestralTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object ClientAncestralENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object ClientAncestralCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object ClientAncestralUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object ClientAncestralDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object ClientAncestralSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object ClientAncestralTB_REGIMECOMUNHAO_ID: TBCDField
      FieldName = 'TB_REGIMECOMUNHAO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralPESSOA_CONJUGE_ID: TBCDField
      FieldName = 'PESSOA_CONJUGE_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object ClientAncestralDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 30
    end
    object ClientAncestralBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ClientAncestralCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ClientAncestralDOCUMENTO_EXPEDICAO: TSQLTimeStampField
      FieldName = 'DOCUMENTO_EXPEDICAO'
    end
    object ClientAncestralDOCUMENTO_VALIDADE: TSQLTimeStampField
      FieldName = 'DOCUMENTO_VALIDADE'
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 120
    end
    object ClientAncestralCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 15
    end
    object ClientAncestralCPF_TERCEIRO: TStringField
      FieldName = 'CPF_TERCEIRO'
      Size = 1
    end
    object ClientAncestralNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 90
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 651
    Top = 18
  end
  object sqlConjuge: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = ('SELECT *'#13#10'FROM T_PESSOA'#13#10'WHERE PESSOA_ID = :PESSOA_ID')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 452
    Top = 18
    object sqlConjugePESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlConjugePESSOA_TIPO: TStringField
      FieldName = 'PESSOA_TIPO'
      Size = 1
    end
    object sqlConjugeNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlConjugeNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 30
    end
    object sqlConjugeDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object sqlConjugeTB_DOCUMENTOTIPO_ID: TBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Precision = 15
      Size = 2
    end
    object sqlConjugeTB_PROFISSAO_ID: TBCDField
      FieldName = 'TB_PROFISSAO_ID'
      Precision = 15
      Size = 2
    end
    object sqlConjugeTB_ESTADOCIVIL_ID: TBCDField
      FieldName = 'TB_ESTADOCIVIL_ID'
      Precision = 15
      Size = 2
    end
    object sqlConjugeNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 120
    end
    object sqlConjugeNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 120
    end
    object sqlConjugeDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object sqlConjugeNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 60
    end
    object sqlConjugeTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object sqlConjugeENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object sqlConjugeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object sqlConjugeUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object sqlConjugeDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object sqlConjugeSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object sqlConjugeTB_REGIMECOMUNHAO_ID: TBCDField
      FieldName = 'TB_REGIMECOMUNHAO_ID'
      Precision = 15
      Size = 2
    end
    object sqlConjugePESSOA_CONJUGE_ID: TBCDField
      FieldName = 'PESSOA_CONJUGE_ID'
      Precision = 15
      Size = 2
    end
    object sqlConjugeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object sqlConjugeDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 30
    end
    object sqlConjugeBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object sqlConjugeCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sqlConjugeDOCUMENTO_EXPEDICAO: TSQLTimeStampField
      FieldName = 'DOCUMENTO_EXPEDICAO'
    end
    object sqlConjugeDOCUMENTO_VALIDADE: TSQLTimeStampField
      FieldName = 'DOCUMENTO_VALIDADE'
    end
    object sqlConjugeOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 120
    end
    object sqlConjugeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 15
    end
    object sqlConjugeCPF_TERCEIRO: TStringField
      FieldName = 'CPF_TERCEIRO'
      Size = 1
    end
    object sqlConjugeNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 90
    end
  end
  object dtsConjuge: TDataSource
    DataSet = sqlConjuge
    Left = 484
    Top = 18
  end
  object sqlRepresentante: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_PESSOA_REPRESENTANTE'#13#10'WHERE PESSOA_ID = :PESSOA' +
      '_ID'#13#10'ORDER BY PESSOA_REPRESENTANTE_ID')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'PESSOA_ID'
    MasterFields = 'PESSOA_ID'
    MasterSource = SourceAncestral
    Params = <>
    BeforePost = sqlRepresentanteBeforePost
    OnCalcFields = sqlRepresentanteCalcFields
    Left = 388
    Top = 18
    object sqlRepresentantePESSOA_REPRESENTANTE_ID: TBCDField
      FieldName = 'PESSOA_REPRESENTANTE_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlRepresentantePESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 15
      Size = 2
    end
    object sqlRepresentanteREPRESENTANTE_ID: TBCDField
      FieldName = 'REPRESENTANTE_ID'
      Precision = 15
      Size = 2
    end
    object sqlRepresentanteATO_PARTETIPO_ID: TBCDField
      FieldName = 'ATO_PARTETIPO_ID'
      Precision = 15
      Size = 2
    end
    object sqlRepresentanteMARCACAO_TIPO_ID: TBCDField
      FieldName = 'MARCACAO_TIPO_ID'
      Precision = 15
      Size = 2
    end
    object sqlRepresentantecalc_NomeRepresentante: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_NomeRepresentante'
      Size = 120
      Calculated = True
    end
    object sqlRepresentanteASSINATURA_TIPO: TStringField
      FieldName = 'ASSINATURA_TIPO'
      Size = 1
    end
    object sqlRepresentantePESSOA_AUXILIAR_ID: TBCDField
      FieldName = 'PESSOA_AUXILIAR_ID'
      Precision = 15
      Size = 2
    end
    object sqlRepresentantecalc_TipoPessoa: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_TipoPessoa'
      Size = 1
      Calculated = True
    end
  end
  object dtsRepresentante: TDataSource
    DataSet = sqlRepresentante
    Left = 420
    Top = 18
  end
  object sqlPessoaAuxiliar: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT P.NOME, PR.REPRESENTANTE_ID'#13#10'FROM T_PESSOA P, T_PESSOA_RE' +
      'PRESENTANTE PR'#13#10'WHERE P.PESSOA_ID = PR.REPRESENTANTE_ID'#13#10'     AN' +
      'D PR.PESSOA_AUXILIAR_ID IS NULL'#13#10'     AND (PR.PESSOA_ID = :PESSO' +
      'A_ID'#13#10'     AND NOT PR.REPRESENTANTE_ID = :REPRESENTANTE_ID)'#13#10'ORD' +
      'ER BY P.NOME')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'REPRESENTANTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 316
    Top = 18
    object sqlPessoaAuxiliarNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPessoaAuxiliarREPRESENTANTE_ID: TBCDField
      FieldName = 'REPRESENTANTE_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsPessoaAuxiliar: TDataSource
    DataSet = sqlPessoaAuxiliar
    Left = 348
    Top = 18
  end
  object sqlSinalPublico: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_PESSOA_SINALPUBLICO'#13#10'WHERE PESSOA_ID = :PESSOA_' +
      'ID')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PESSOA_ID'
        ParamType = ptInput
      end>
    IndexFieldNames = 'PESSOA_ID'
    MasterFields = 'PESSOA_ID'
    MasterSource = SourceAncestral
    Params = <>
    BeforePost = sqlSinalPublicoBeforePost
    OnCalcFields = sqlRepresentanteCalcFields
    Left = 388
    Top = 50
    object sqlSinalPublicoPESSOA_SINALPUBLICO_ID: TBCDField
      FieldName = 'PESSOA_SINALPUBLICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlSinalPublicoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlSinalPublicoTB_SINALPUBLICO_ID: TBCDField
      FieldName = 'TB_SINALPUBLICO_ID'
      Precision = 15
      Size = 2
    end
    object sqlSinalPublicoPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsSinalPublico: TDataSource
    DataSet = sqlSinalPublico
    Left = 420
    Top = 50
  end
end
