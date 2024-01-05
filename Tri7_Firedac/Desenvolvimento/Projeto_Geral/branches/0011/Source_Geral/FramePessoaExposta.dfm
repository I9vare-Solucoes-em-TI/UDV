object fmePessoaExposta: TfmePessoaExposta
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  object pgcDadosPessoa: TcxPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 305
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tbsDocumento
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Green'
    ClientRectBottom = 305
    ClientRectRight = 451
    ClientRectTop = 24
    object tbsDocumento: TcxTabSheet
      Caption = 'Pessoa Exposta'
      ImageIndex = 1
      object Image2: TImage
        Left = 183
        Top = 26
        Width = 16
        Height = 16
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
          0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
          097048597300000B1200000B1201D2DD7EFC0000001C74455874536F66747761
          72650041646F62652046697265776F726B732043533571B5E336000001054944
          4154384FA5D3CF0A01511406F0BB562679092B0BC9CAC68A320B0B8FE1599485
          3D250F20C58E0D59D8CA8EBDA548C9627C9FCE99CE65CA3FF5AB99EF9C7BDCE9
          CEB8288AFE921C3A5785119C05AF6B89BDDE8D7319E8011731B098F521E3AD31
          8B03D8805DB485351C4DC69E2069C0401A680579534B4307B43E886BD250879B
          14F96F29C9BB30879CDC2F8017ECADDB013329D0094AD0325959FAC6269BDB01
          5753B07650949E26E82EE9FAC9808AD4DB2653DE003EA72DAA3C149E32E53D42
          08767B6A09D3A78CD81BC60364C8508AEA008FF3C66F22991AC6EBCC802CF0C5
          D1A60BF0241AB0978CD8937D1920437E7F95BD101F0EF0CCB90BE2F5FB8FE97B
          91BB036676A31AAD7779630000000049454E44AE426082}
        OnClick = Image2Click
      end
      object icbExpostaPoliticamente: TcxDBImageComboBox
        Left = 5
        Top = 24
        RepositoryItem = dtmLookup.Combo_SimNaoSimples
        DataBinding.DataField = 'EXPOSTA_POLITICAMENTE'
        DataBinding.DataSource = dtsPessoaExposta
        ParentFont = False
        Properties.Items = <>
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Width = 174
      end
      object cxLabel1: TcxLabel
        Left = 5
        Top = 5
        Caption = 'Exposta Politicamente?'
        ParentColor = False
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
      object edtDataCarencia: TcxDBDateEdit
        Left = 203
        Top = 24
        DataBinding.DataField = 'DATA_CARENCIA'
        DataBinding.DataSource = dtsPessoaExposta
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 2
        Width = 134
      end
      object cxLabel69: TcxLabel
        Left = 203
        Top = 5
        Caption = 'Data Car'#234'ncia'
        ParentColor = False
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
        Transparent = True
      end
    end
    object tbsHistorico: TcxTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 2
      object gridPessoaExposta: TcxGrid
        Left = 0
        Top = 0
        Width = 451
        Height = 281
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object PessoaExpostaTv1: TcxGridDBTableView
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
          Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.InfoPanel.Width = 80
          Navigator.Visible = True
          DataController.DataSource = dtsVinculoPessoaExposta
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.DateFormat = 'dtsVinculoGemeo'
          OptionsBehavior.ColumnHeaderHints = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.NoDataToDisplayInfoText = '  '
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Preview.Visible = True
          Styles.Background = dtmControles.cxStyle45
          Styles.Preview = dtmControles.cxStyle5
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object PessoaExpostaTv1NOME: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            Width = 182
          end
          object PessoaExpostaTv1CPF_AUXILIAR: TcxGridDBColumn
            Caption = 'CPF Aux.'
            DataBinding.FieldName = 'CPF_AUXILIAR'
            Width = 64
          end
          object PessoaExpostaTv1FUNCAO: TcxGridDBColumn
            Caption = 'Fun'#231#227'o'
            DataBinding.FieldName = 'FUNCAO'
            Width = 134
          end
          object PessoaExpostaTv1NOME_ORGAO: TcxGridDBColumn
            Caption = 'Org'#227'o'
            DataBinding.FieldName = 'NOME_ORGAO'
            Width = 136
          end
          object PessoaExpostaTv1DATA_INICIO_EXERCICIO: TcxGridDBColumn
            Caption = 'Data Ini. Exerc'#237'cio'
            DataBinding.FieldName = 'DATA_INICIO_EXERCICIO'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = 'dd/mm/yyyy'
            HeaderAlignmentHorz = taCenter
            Width = 115
          end
          object PessoaExpostaTv1DATA_FIM_EXERCICIO: TcxGridDBColumn
            Caption = 'Data Fim Exerc'#237'cio'
            DataBinding.FieldName = 'DATA_FIM_EXERCICIO'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = 'dd/mm/yyyy'
            HeaderAlignmentHorz = taCenter
            Width = 115
          end
          object PessoaExpostaTv1DATA_FIM_CARENCIA: TcxGridDBColumn
            Caption = 'Data Car'#234'ncia'
            DataBinding.FieldName = 'DATA_FIM_CARENCIA'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = 'dd/mm/yyyy'
            HeaderAlignmentHorz = taCenter
            Width = 115
          end
        end
        object PessoaExpostaLv1: TcxGridLevel
          GridView = PessoaExpostaTv1
        end
      end
    end
  end
  object sqlVinculoPessoaExposta: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '  PEX.PESSOA_EXPOSTA_ID,'
      '  PEX.NOME,'
      '  PEX.CPF_AUXILIAR,'
      '  PEX.FUNCAO,'
      '  PEX.DATA_INICIO_EXERCICIO,'
      '  PEX.DATA_FIM_EXERCICIO,'
      '  PEX.DATA_FIM_CARENCIA,'
      '  PEX.NOME_ORGAO'
      'FROM'
      '  G_PESSOA_EXPOSTA PEX'
      ''
      'WHERE'
      '  PEX.CPF = :CPF '
      ''
      'ORDER BY '
      '  PEX.DATA_INICIO_EXERCICIO')
    Left = 283
    Top = 138
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
    object sqlVinculoPessoaExpostaPESSOA_EXPOSTA_ID: TBCDField
      FieldName = 'PESSOA_EXPOSTA_ID'
      Origin = 'PESSOA_EXPOSTA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlVinculoPessoaExpostaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object sqlVinculoPessoaExpostaCPF_AUXILIAR: TStringField
      FieldName = 'CPF_AUXILIAR'
      Origin = 'CPF_AUXILIAR'
      Size = 15
    end
    object sqlVinculoPessoaExpostaFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Size = 120
    end
    object sqlVinculoPessoaExpostaDATA_INICIO_EXERCICIO: TSQLTimeStampField
      FieldName = 'DATA_INICIO_EXERCICIO'
      Origin = 'DATA_INICIO_EXERCICIO'
    end
    object sqlVinculoPessoaExpostaDATA_FIM_EXERCICIO: TSQLTimeStampField
      FieldName = 'DATA_FIM_EXERCICIO'
      Origin = 'DATA_FIM_EXERCICIO'
    end
    object sqlVinculoPessoaExpostaDATA_FIM_CARENCIA: TSQLTimeStampField
      FieldName = 'DATA_FIM_CARENCIA'
      Origin = 'DATA_FIM_CARENCIA'
    end
    object sqlVinculoPessoaExpostaNOME_ORGAO: TStringField
      FieldName = 'NOME_ORGAO'
      Origin = 'NOME_ORGAO'
      Size = 120
    end
  end
  object dtsVinculoPessoaExposta: TDataSource
    DataSet = sqlVinculoPessoaExposta
    Left = 235
    Top = 138
  end
  object cdsPessoaExposta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 139
    Top = 138
    object cdsPessoaExpostaEXPOSTA_POLITICAMENTE: TStringField
      FieldName = 'EXPOSTA_POLITICAMENTE'
      Size = 1
    end
    object cdsPessoaExpostaDATA_CARENCIA: TDateField
      FieldName = 'DATA_CARENCIA'
    end
  end
  object dtsPessoaExposta: TDataSource
    DataSet = cdsPessoaExposta
    Left = 187
    Top = 138
  end
end
