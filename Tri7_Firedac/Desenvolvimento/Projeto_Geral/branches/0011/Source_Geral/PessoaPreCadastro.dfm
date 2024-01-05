inherited frmPessoaPreCadastro: TfrmPessoaPreCadastro
  Left = 137
  Top = 266
  Caption = 'Pr'#233'-Cadastro'
  ClientHeight = 269
  ClientWidth = 698
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 704
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 698
    Height = 269
    ExplicitWidth = 698
    ExplicitHeight = 269
    inherited Shape1: TShape
      Width = 686
      Height = 257
      ExplicitWidth = 686
      ExplicitHeight = 257
    end
    object lblNome: TcxLabel [1]
      Left = 11
      Top = 17
      Caption = 'Nome:'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
    end
    object cxGridRepresentante: TcxGrid [2]
      Left = 8
      Top = 72
      Width = 682
      Height = 187
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      RootLevelStyles.TabsBackground = dtmControles.cxStyle1
      object cxGridRepresentanteDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridRepresentanteDBTableView1DblClick
        OnKeyDown = cxGridRepresentanteDBTableView1KeyDown
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
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '  '
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          Width = 316
        end
        object cxGriCpf: TcxGridDBColumn
          Caption = 'CPF/CNPJ'
          DataBinding.FieldName = 'CPF_CNPJ'
          PropertiesClassName = 'TcxMaskEditProperties'
          Width = 107
        end
        object cxGridDocumento: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'DOCUMENTO'
          HeaderAlignmentHorz = taCenter
          Width = 129
        end
        object cxGridCPFProptio: TcxGridDBColumn
          Caption = 'Cpf Pr'#243'prio'
          DataBinding.FieldName = 'CPF_TERCEIRO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Sim'
              ImageIndex = 0
            end
            item
              Description = 'Sim'
              Value = 'N'
            end
            item
              Description = 'N'#227'o'
              Value = 'S'
            end>
          Width = 79
        end
      end
      object cxGridRepresentanteLevel1: TcxGridLevel
        GridView = cxGridRepresentanteDBTableView1
      end
    end
    inherited btnCancelar: TcxButton
      Left = 463
      Top = 43
      Width = 106
      Height = 25
      LookAndFeel.SkinName = ''
      TabOrder = 2
      ExplicitLeft = 463
      ExplicitTop = 43
      ExplicitWidth = 106
      ExplicitHeight = 25
    end
    object edtNome: TcxTextEdit
      Left = 80
      Top = 14
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.OnChange = edtNomePropertiesChange
      Style.Shadow = True
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      OnKeyDown = edtNomeKeyDown
      OnKeyUp = edtNomeKeyUp
      Width = 598
    end
    object btnCadastrar: TcxButton
      Left = 572
      Top = 43
      Width = 106
      Height = 25
      Caption = 'Nova Pessoa'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        F9F9F9CACACAA3A3A39090908282827777776F6F6F767676848484989898C4C4
        C4A5A5A53A3A3A3F3F3F808080FFFFFFFFFFFFFFFFFFE4E4E4A6A6A633333331
        31313838383E3E3E4242424545454848484B4B4B4D4D4D4B4B4B4B4B4B3E3E3E
        3D3D3D535353707070FFFFFFFCFCFCFFFFFF8D8D8D3A3A3A2F2F2F3232323636
        363A3A3A3D3D3D3F3F3F4040404343434949494141413636363A3A3A3A3A3A3F
        3F3F4747473F3F3F7E7E7EFFFFFFABABAB5151512D2D2D2D2D2D303030343434
        3737373838383A3A3A3C3C3C4141413A3A3A3535353D3D3D3636363131314545
        455B5B5B6E6E6EFFFFFFECECEC9696962D2D2D2E2E2E2D2D2D30303032323233
        33333434343535353A3A3A3838383232323838383232323030303A3A3A3E3E3E
        737373FFFFFFFFFFFFFBFBFB4B4B4B2F2F2F2F2F2F3030301E1E1E1818181A1A
        1A1818181D1D1D3636364040403C3C3C3737373F3F3F6A6A6AFFFFFFF4F4F4FF
        FFFFFFFFFFFFFFFFDEDEDE3D3D3D3030302222225252529292928F8F8F8F8F8F
        5C5C5C2A2A2A3C3C3C3B3B3B383838373737787878FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF7F7F79292924F4F4FBCBCBCEDEDEDDBDBDBEAEAEAD1D1D14A
        4A4A6A6A6AE1E1E1F5F5F5E8E8E8F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD2D2D2B3B3B3B3B3B3AAAAAACBCBCBFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC4C4C4D2D2D2CDCDCDAEAEAEB0B0B0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFC6C6C6D8D8D8CDCDCDC6C6C6D1D1D1B9B9B9C7C7C7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9CFCFCF
        CBCBCBC1C1C1CDCDCDCDCDCDD2D2D2B7B7B7DBDBDBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7C9C9C9BCBCBCCC
        CCCCCCCCCCCDCDCDD3D3D3D7D7D7B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7B2B2B2D3D3D3C1C1C1CDCDCDD5D5
        D5DDDDDDD8D8D8D0D0D0C1C1C1E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA4A4A42F2F2FAFAFAFE1E1E1D7D7D7BABABA818181
        5B5B5B414141454545A3A3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF6464640606060E0E0E848484AAAAAA30303006060604040405
        0505010101707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA1A1A11F1F1F0A0A0A0C0C0C2828280C0C0C1919191A1A1A1616161414
        14ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
        ECEC2C2C2C1919190D0D0D0F0F0F1E1E1E1A1A1A1616161313135F5F5FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3
        B31212121313131A1A1A181818161616141414575757FBFBFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7
        7070706060604040403434348F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCadastrarClick
    end
    object btnSelecionar: TcxButton
      Left = 354
      Top = 43
      Width = 106
      Height = 25
      Caption = 'Selecionar'
      Colors.Default = clWhite
      Default = True
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
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
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnSelecionarClick
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      
        'SELECT NOME, CPF_CNPJ, DOCUMENTO, PESSOA_TIPO, PESSOA_ID, CPF_TE' +
        'RCEIRO'#13#10'FROM T_PESSOA'#13#10'ORDER BY NOME')
    Top = 47
  end
  inherited ProviderAncestral: TDataSetProvider
    Top = 47
  end
  inherited ClientAncestral: TClientDataSet
    Top = 47
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object ClientAncestralCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 15
    end
    object ClientAncestralDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 30
    end
    object ClientAncestralPESSOA_TIPO: TStringField
      FieldName = 'PESSOA_TIPO'
      Origin = 'PESSOA_TIPO'
      Size = 1
    end
    object ClientAncestralPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Origin = 'PESSOA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralCPF_TERCEIRO: TStringField
      FieldName = 'CPF_TERCEIRO'
      Origin = 'CPF_TERCEIRO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Top = 47
  end
end
