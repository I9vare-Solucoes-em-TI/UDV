inherited frmVinculoConciliacaoBancaria: TfrmVinculoConciliacaoBancaria
  Caption = 'Vinculo Concilia'#231#227'o'
  ClientHeight = 495
  ClientWidth = 996
  OnActivate = FormActivate
  ExplicitWidth = 1002
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 996
    ExplicitWidth = 996
    inherited lblInformaca: TcxLabel
      Caption = 'Vincular Item(s) Caixa em Concilia'#231#227'o Banc'#225'ria'
      Style.IsFontAssigned = True
      ExplicitWidth = 701
      Width = 701
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 736
      ExplicitLeft = 736
      inherited btnCancelar: TcxButton
        Top = 10
        LookAndFeel.SkinName = ''
        ExplicitTop = 10
      end
      inherited btnConfirmar: TcxButton
        Caption = 'Conciliar'
        Enabled = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          9E050000424D9E05000000000000360400002800000012000000120000000100
          080000000000680100000000000000000000000100000000000000000000CCCC
          CC007C7C7C003A3A3A00FFFFFF002323230018181800A3A3A3006A6A6A00DDDD
          DD009E9E9E001616160055555500BFBFBF00DFDFDF008E8E8E00ECECEC000606
          0600B2B2B200D2D2D200424242001F1F1F002B2B2B0075757500898989006161
          6100A8A8A800A0A0A000E9E9E900999999002A2A2A00080808004B4B4B00D9D9
          D900F5F5F500848484005E5E5E00E7E7E70028282800333333006E6E6E009595
          9500D7D7D7001B1B1B0000000000C5C5C5003F3F3F000F0F0F0083838300A7A7
          A7008C8C8C00E3E3E30092929200F0F0F000D5D5D500ADADAD00CFCFCF00FFFF
          FF007676760020202000A1A1A100ABABAB00999999006C6C6C00A5A5A5003C3C
          3C005757570091919100B5B5B500D3D3D30045454500EBEBEB000B0B0B004C4C
          4C00F7F7F7008787870071717100404040008D8D8D0000000000000000000000
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
          00000000000000000000000000000000000000000000000000002E000007043D
          000000000000000000001117000001093103041900000000000000000000001F
          0000042D1746040C111111111111111111111111000004232F09040715151515
          151515151515050800001D3A483A040404040404040404040404040400000404
          0404040404040404040404040404040400000A0A291A041C0A0A0A0A0A0A0A0A
          0A0A1B210000080B430D044C0B0B0B0B0B0B0B0B0B0B0B3B0000040A49220419
          06060606060606060606060600000404321904182B2B2B2B2B2B2B2B2B2B2B14
          0000311D2824040438383838383838383838134A0000440F291C040404040404
          0404040404040404000004040404040404040404040404040404040400001036
          2A250404090909090909090909090E0400000437180404281616161616161616
          161616160000043D300404021616161616161616161616270000354B18040425
          1B1B1B1B1B1B1B1B1B1B072A0000384134040404040404040404040404040404
          0000}
      end
    end
  end
  inherited Panel1: TPanel
    Width = 996
    Height = 457
    ExplicitWidth = 996
    ExplicitHeight = 457
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = 'Item(s) do Banco a Conciliar'
      Style.TextColor = 16384
      Style.TextStyle = [fsBold]
      TabOrder = 0
      Height = 135
      Width = 992
      object cxGrid1: TcxGrid
        Left = 2
        Top = 18
        Width = 988
        Height = 115
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
          DataController.DataSource = dtsConciliacao
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',#0.00'
              Kind = skSum
              FieldName = 'CALC_SOMA'
              Column = grdBasicaDBTableView1Column3
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ScrollBars = ssNone
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Preview.Visible = True
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object grdBasicaDBTableView1Column1: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA'
            Options.Editing = False
            Options.Focusing = False
            Width = 79
          end
          object grdBasicaDBTableView1Column2: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Options.Editing = False
            Options.Focusing = False
            Width = 155
          end
          object grdBasicaDBTableView1Column3: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 89
          end
          object grdBasicaDBTableView1Column4: TcxGridDBColumn
            DataBinding.FieldName = 'OPERACAO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                ImageIndex = 3
                Value = 'R'
              end
              item
                ImageIndex = 4
                Value = 'D'
              end>
            Options.Editing = False
            Options.Focusing = False
            Width = 37
            IsCaptionAssigned = True
          end
          object grdBasicaDBTableView1Column5: TcxGridDBColumn
            Caption = 'Identificador'
            DataBinding.FieldName = 'ID'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 102
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = grdBasicaDBTableView1
        end
      end
    end
    object gbcLivroCaixa: TcxGroupBox
      Left = 2
      Top = 137
      Align = alClient
      Caption = 'Registros no Livro Caixa do Dia  ?? n'#227'o Conciliado'
      Style.TextColor = 16384
      Style.TextStyle = [fsBold]
      TabOrder = 1
      Height = 318
      Width = 992
      object grdBasica: TcxGrid
        Left = 2
        Top = 41
        Width = 988
        Height = 275
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          FilterBox.Visible = fvNever
          DataController.DataSource = SourceAncestral
          DataController.Filter.Active = True
          DataController.MultiThreadedOptions.Sorting = bFalse
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'calc_ValorDespesa'
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'TOTAL SELECIONADO(S) = ,#0.00'
              Kind = skSum
              FieldName = 'Calc_ValorRegistrar'
              Column = cxGridPesquisaHistorico
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.FocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.Indicator = True
          Preview.Column = cxGridPesquisaObservacao
          Preview.Visible = True
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
          object cxGridBasicaDBPlanoConta: TcxGridDBColumn
            Caption = 'Compromisso'
            DataBinding.FieldName = 'CONTABIL_CONTA_ID'
            RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
            Options.Editing = False
            Options.Focusing = False
            Options.Grouping = False
            Width = 179
          end
          object cxGridPesquisaHistorico: TcxGridDBColumn
            Caption = 'Hist'#243'rico'
            DataBinding.FieldName = 'HISTORICO'
            Options.Editing = False
            Options.Focusing = False
            Width = 249
          end
          object cxGridBasicaDBFavorecido: TcxGridDBColumn
            Caption = 'Pessoa (Cliente, Favorecido...)'
            DataBinding.FieldName = 'PESSOA_ID'
            RepositoryItem = dtmLookupContabil.Lista_PessoaTodas
            Options.Editing = False
            Options.Focusing = False
            Options.Grouping = False
            Width = 221
          end
          object cxGridPesquisaObservacao: TcxGridDBColumn
            Caption = 'Detalhes'
            DataBinding.FieldName = 'CALC_OBSERVACAO'
            Options.Editing = False
            Options.Focusing = False
            Width = 75
          end
          object cxGridBasicaDBDataPag: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.SaveTime = False
            Options.Editing = False
            Options.Focusing = False
            Options.Grouping = False
            Width = 90
          end
          object cxGridBasicaDBOperacao: TcxGridDBColumn
            DataBinding.FieldName = 'OPERACAO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                ImageIndex = 3
                Value = 'R'
              end
              item
                ImageIndex = 4
                Value = 'D'
              end
              item
                ImageIndex = 44
                Value = 'TR'
              end
              item
                ImageIndex = 44
                Value = 'TD'
              end
              item
                ImageIndex = 53
                Value = 'AD'
              end
              item
                ImageIndex = 53
                Value = 'AR'
              end>
            RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
            HeaderImageIndex = 17
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Width = 49
            IsCaptionAssigned = True
          end
          object cxGridBasicaDBValor: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Options.Editing = False
            Options.Focusing = False
            Width = 117
          end
          object cxGridPesquisaColumn1: TcxGridDBColumn
            Caption = 'Selecionar'
            DataBinding.FieldName = 'CALC_SELECIONADO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.OnChange = cxGridPesquisaColumn1PropertiesChange
            Width = 69
          end
          object cxGridPesquisaValorRegistrar: TcxGridDBColumn
            DataBinding.FieldName = 'Calc_ValorRegistrar'
            Visible = False
          end
        end
        object grdBasicaLevel1: TcxGridLevel
          GridView = cxGridPesquisa
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 18
        Width = 988
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 1
        object rdbOperacaoSomente: TcxRadioButton
          Left = 9
          Top = 2
          Width = 209
          Height = 17
          Caption = 'Somente Opera'#231#227'o do Item a Conciliar'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rdbOperacaoSomenteClick
        end
        object rdbOperacaoQualquer: TcxRadioButton
          Left = 224
          Top = 2
          Width = 121
          Height = 17
          Caption = 'Qualquer Opera'#231#227'o'
          TabOrder = 1
          OnClick = rdbOperacaoQualquerClick
        end
        object icxPeriodo: TcxImageComboBox
          Left = 344
          Top = -1
          EditValue = '1'
          Properties.Items = <
            item
              Description = 'Pesquisa Dados at'#233' a Data Atual'
              ImageIndex = 0
              Value = '1'
            end
            item
              Description = 'Pesquisa Dados at'#233' o M'#234's Atual'
              Value = '2'
            end
            item
              Description = 'Pesquisa Dados Pr'#243'ximo M'#234's'
              Value = '3'
            end>
          Properties.OnEditValueChanged = icxPeriodoPropertiesEditValueChanged
          Style.BorderStyle = ebsSingle
          TabOrder = 2
          Width = 185
        end
        object icxManterValor: TcxImageComboBox
          Left = 532
          Top = -1
          EditValue = '1'
          Properties.Items = <
            item
              Description = 'Manter Valor Registrado'
              ImageIndex = 0
              Value = '1'
            end
            item
              Description = 'Alterar Valor Registrado'
              Value = '2'
            end>
          Properties.OnEditValueChanged = icxManterValorPropertiesEditValueChanged
          Style.BorderStyle = ebsSingle
          TabOrder = 3
          Width = 153
        end
      end
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'SELECT LIVRO_CAIXA_ID AS ID,  DATA_PAGAMENTO AS DATA, HISTORICO,' +
      ' OBSERVACAO, '#13#10'PESSOA_ID, OPERACAO, VALOR, CONTABIL_CONTA_ID'#13#10'FR' +
      'OM J_LIVRO_CAIXA '#13#10'WHERE CONCILIACAO_REGISTRADO_ID IS NULL'#13#10'  AN' +
      'D SITUACAO IS NULL'#13#10'  AND (OPERACAO = :OPERACAO1 OR '#13#10'   OPERACA' +
      'O = :OPERACAO2 OR '#13#10'   OPERACAO = :OPERACAO3 OR '#13#10'   OPERACAO = ' +
      ':OPERACAO4) '#13#10'  AND CAIXA_ID = :CAIXA_ID'#13#10'  AND DATA_PAGAMENTO >' +
      '= :DATA'
    Params = <
      item
        DataType = ftUnknown
        Name = 'OPERACAO1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CAIXA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptInput
      end>
    Left = 55
    Top = 257
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 87
    Top = 257
  end
  inherited ClientAncestral: TClientDataSet
    OnCalcFields = ClientAncestralCalcFields
    Left = 121
    Top = 256
    object ClientAncestralHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object ClientAncestralVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralCALC_SELECIONADO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SELECIONADO'
    end
    object ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCalc_ValorRegistrar: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Calc_ValorRegistrar'
      Calculated = True
    end
    object ClientAncestralID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 151
    Top = 257
  end
  object ClientConciliacao: TClientDataSet
    PersistDataPacket.Data = {
      CD0000009619E0BD010000001800000006000000000003000000CD0004444154
      410100490000000100055749445448020002000F000944455343524943414F01
      004900000001000557494454480200020078000556414C4F5208000400000001
      0007535542545950450200490006004D6F6E657900084F5045524143414F0100
      490000000100055749445448020002000A000249440100490000000100055749
      445448020002001E000943414C435F534F4D4108000400000001000753554254
      5950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CALC_SOMA'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 450
    Top = 241
    object ClientConciliacaoDATA: TStringField
      FieldName = 'DATA'
      Size = 15
    end
    object ClientConciliacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object ClientConciliacaoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientConciliacaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 10
    end
    object ClientConciliacaoID: TStringField
      FieldName = 'ID'
      Size = 30
    end
    object ClientConciliacaoCALC_SOMA: TCurrencyField
      FieldName = 'CALC_SOMA'
    end
  end
  object dtsConciliacao: TDataSource
    DataSet = ClientConciliacao
    Left = 450
    Top = 293
  end
end
