inherited frmCadCedente: TfrmCadCedente
  Caption = 'Cadastro de Cedentes'
  ClientHeight = 498
  ClientWidth = 916
  ExplicitWidth = 932
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 14
  inherited PanelBotoes: TPanel
    Width = 916
    ExplicitWidth = 916
    inherited PanelBotoesBasicos: TPanel
      Width = 828
      ExplicitWidth = 828
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 830
      ExplicitLeft = 830
    end
  end
  inherited StatusBar: TStatusBar
    Top = 477
    Width = 916
    ExplicitTop = 477
    ExplicitWidth = 916
  end
  inherited PanelGeral: TPanel
    Width = 916
    Height = 417
    ExplicitWidth = 916
    ExplicitHeight = 417
    inherited PanelData: TPanel
      Width = 914
      Height = 150
      ExplicitWidth = 914
      ExplicitHeight = 150
      object cxLabel1: TcxLabel
        Left = 10
        Top = 40
        Caption = 'Nome Fantasia:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object cxLabel5: TcxLabel
        Left = 10
        Top = 13
        Caption = 'Raz'#227'o Social:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object cxLabel6: TcxLabel
        Left = 560
        Top = 9
        Caption = 'CNPJ:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object chbSituacao: TcxDBCheckBox
        Left = 843
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
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 3
        Height = 23
        Width = 64
      end
      object cxGroupBox6: TcxGroupBox
        Left = 4
        Top = 65
        Caption = ' Endere'#231'o'
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Height = 78
        Width = 900
        object lblEndereco: TcxLabel
          Left = 10
          Top = 22
          Caption = 'Logradouro:'
          Style.TextColor = 4210688
        end
        object cxLabel34: TcxLabel
          Left = 537
          Top = 22
          Caption = 'Bairro:'
          Style.TextColor = 4210688
        end
        object cxLabel35: TcxLabel
          Left = 10
          Top = 48
          Caption = 'Cidade:'
          Style.TextColor = 4210688
        end
        object cxLabel36: TcxLabel
          Left = 326
          Top = 48
          Caption = 'UF:'
          Style.TextColor = 4210688
        end
        object cxLabel38: TcxLabel
          Left = 415
          Top = 48
          Caption = 'Cep:'
          Style.TextColor = 4210688
        end
        object edtEndereco: TcxDBTextEdit
          Left = 79
          Top = 22
          DataBinding.DataField = 'END_LOG'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 5
          Width = 452
        end
        object edtBairro: TcxDBTextEdit
          Left = 577
          Top = 20
          DataBinding.DataField = 'END_BAIRRO'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 6
          Width = 311
        end
        object edtCidade: TcxDBTextEdit
          Left = 79
          Top = 46
          DataBinding.DataField = 'END_CIDADE'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 7
          Width = 245
        end
        object edtUF: TcxDBComboBox
          Left = 352
          Top = 46
          RepositoryItem = dtmLookup.Combo_UF
          DataBinding.DataField = 'END_UF'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 8
          Width = 58
        end
        object edtCEP: TcxDBMaskEdit
          Left = 445
          Top = 46
          DataBinding.DataField = 'END_CEP'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '99\.999\-999;0;_'
          Properties.MaxLength = 0
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 9
          Width = 86
        end
        object cxLabel39: TcxLabel
          Left = 537
          Top = 48
          Caption = 'Email:'
          Style.TextColor = 4210688
        end
        object cxDBTextEdit19: TcxDBTextEdit
          Left = 577
          Top = 46
          DataBinding.DataField = 'END_EMAIL'
          DataBinding.DataSource = SourceAncestral
          ParentFont = False
          Properties.CharCase = ecLowerCase
          Style.StyleController = dtmControles.cxEsc_EditsNormal
          TabOrder = 11
          Width = 311
        end
      end
      object cxLabel2: TcxLabel
        Left = 560
        Top = 40
        Caption = 'Telefone:'
        Style.TextColor = 4210688
        Style.TextStyle = []
      end
      object edtRazao: TcxDBTextEdit
        Left = 109
        Top = 11
        DataBinding.DataField = 'RAZAO_SOCIAL'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 6
        Width = 447
      end
      object edtCPFCNPJ: TcxDBMaskEdit
        Left = 624
        Top = 11
        DataBinding.DataField = 'CNPJ_CPF'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '99\.999\.999\/9999\-99;0;_'
        Properties.MaxLength = 0
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        Width = 216
      end
      object edtDescricao: TcxDBTextEdit
        Left = 109
        Top = 38
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 8
        Width = 447
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 624
        Top = 38
        DataBinding.DataField = 'TELEFONE'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 9
        Width = 216
      end
    end
    object pgcGrid: TcxPageControl
      Left = 1
      Top = 151
      Width = 914
      Height = 265
      Align = alClient
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      Properties.ActivePage = tbcContas
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 265
      ClientRectRight = 914
      ClientRectTop = 25
      object tbcContas: TcxTabSheet
        Caption = 'Cedentes'
        ImageIndex = 0
        object grdBasica: TcxGrid
          Left = 0
          Top = 0
          Width = 914
          Height = 240
          Align = alClient
          PopupMenu = popCedente
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
    end
  end
  inherited ActionList1: TActionList
    Left = 641
    Top = 270
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT * '#13#10'FROM J_CEDENTE'#13#10'ORDER BY DESCRICAO'
    Left = 675
    Top = 270
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 703
    Top = 270
  end
  inherited ClientAncestral: TClientDataSet
    Left = 735
    Top = 270
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object ClientAncestralEND_EMAIL: TStringField
      FieldName = 'END_EMAIL'
      Size = 30
    end
    object ClientAncestralCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 15
    end
    object ClientAncestralTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object ClientAncestralRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 120
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 767
    Top = 270
  end
  object popCedente: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 469
    Top = 276
    object mniDefinirCentroCustoPrincipal: TMenuItem
      Caption = 'Definir Cedente Principal'
      ImageIndex = 45
      OnClick = mniDefinirCentroCustoPrincipalClick
    end
  end
end
