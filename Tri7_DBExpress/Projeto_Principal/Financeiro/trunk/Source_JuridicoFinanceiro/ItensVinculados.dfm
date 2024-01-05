inherited frmItensVinculados: TfrmItensVinculados
  Caption = 'Itens Vinculados'
  ClientHeight = 568
  ClientWidth = 1080
  OnActivate = FormActivate
  ExplicitWidth = 1086
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 1080
    ExplicitWidth = 1080
    inherited lblInformaca: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 592
      Width = 592
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 627
      Width = 453
      ExplicitLeft = 627
      ExplicitWidth = 453
      inherited btnCancelar: TcxButton
        Left = 351
        Top = 10
        LookAndFeel.SkinName = ''
        ExplicitLeft = 351
        ExplicitTop = 10
      end
      inherited btnConfirmar: TcxButton
        Left = 150
        Caption = 'Registrar'
        LookAndFeel.SkinName = ''
        ExplicitLeft = 150
      end
      object btnRelatorio: TcxButton
        Left = 250
        Top = 10
        Width = 95
        Height = 22
        Hint = 'Imprimir Relat'#243'rio'
        Caption = 'Imprimir'
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        OptionsImage.Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000110B0000110B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A56464646565
          6568686868686868686868686868686868686868686868686868686868686866
          6666626262A1A1A1FFFFFFFFFFFFFFFFFFFFFFFF606060000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00595959FFFFFFFFFFFFFFFFFFFFFFFF63636300000000000000000000000000
          00000000000000000000000000000000000000000000000000000000005C5C5C
          FFFFFFFFFFFFFFFFFFFFFFFF6666660000001515154F4F4F3939390000000000
          00000000000000000000000000000000000000000000000000626262FFFFFFFF
          FFFFFFFFFFFFFFFF6262620000005F5F5F6B6B6B6A6A6A3C3C3CA1A1A1B0B0B0
          A8A8A8A8A8A8A8A8A8A8A8A8BCBCBC727272000000575757FFFFFFFFFFFFFFFF
          FFFFFFFF6262620000005959596C6C6C6A6A6A3131317D7D7D87878781818181
          81818181818181819090905858580000005A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
          6767670000000000002525251B1B1B0000000000000000000000000000000000
          00000000000000000000000000646464FFFFFFFFFFFFFFFFFFFFFFFF67676700
          00002222227777774B4B4B0E0E0E232323303030353535333333333333353535
          2B2B2B1B1B1B0000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000009D9D
          9DF0F0F09C9C9C292929BABABAD2D2D2D1D1D1D0D0D0D0D0D0D1D1D1D3D3D391
          9191000000535353FFFFFFFFFFFFFFFFFFFFFFFF5A5A5A0000006E6E6E818181
          C1C1C12828281515151919191717171717171717171717171C1C1C1010100000
          005F5F5FFFFFFFFFFFFFFFFFFFFFFFFF6868680000000000000F0F0F41414119
          1919000000000000000000000000000000000000000000000000000000646464
          FFFFFFFFFFFFFFFFFFFFFFFF646464000000474747BDBDBD6565651010104D4D
          4D5959595555555555555555555555555858583D3D3D0000005B5B5BFFFFFFFF
          FFFFFFFFFFFFFFFF585858000000A4A4A4E2E2E2B0B0B0272727B1B1B1CBCBCB
          C0C0C0C0C0C0C0C0C0C0C0C0CECECE8B8B8B000000535353FFFFFFFFFFFFFFFF
          FFFFFFFF5C5C5C000000363636505050A2A2A227272700000000000000000000
          00000000000000000000000000000000005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F0000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000575757FFFFFFFFFFFFFFFFFFFFFFFFA0A0A059
          59595A5A5A5A5A5A4F4F4F5757575F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
          5F5F5F5C5C5C5858589C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnRelatorioClick
      end
    end
  end
  inherited Panel1: TPanel
    Top = 57
    Width = 1080
    Height = 511
    ExplicitTop = 57
    ExplicitWidth = 1080
    ExplicitHeight = 511
    object tbcItens: TcxTabControl
      Left = 2
      Top = 2
      Width = 1076
      Height = 507
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.TabIndex = 0
      Properties.Tabs.Strings = (
        'Pedentes'
        'Registrados')
      OnChange = tbcItensChange
      ClientRectBottom = 507
      ClientRectRight = 1076
      ClientRectTop = 24
      object gdrCompromissoAgendado: TcxGrid
        Left = 0
        Top = 24
        Width = 1076
        Height = 483
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGridDBTablePrevisao: TcxGridDBTableView
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
          DataController.DataSource = SourceAncestral
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              FieldName = 'calc_Entrada'
              Column = cxGridDBTableCompromissoEntrada
            end
            item
              Format = 'R$ ,#0.00'
              Kind = skSum
              FieldName = 'calc_saida'
              Column = cxGridDBTableCompromissoSaida
            end
            item
              Format = 'A Registrar =  ,#0.00'
              Kind = skSum
              FieldName = 'calc_valor_pagar'
              Column = cxGridDBTablePrevisaoHistorico
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsListCount = 5
          Filtering.ColumnPopup.MaxDropDownItemCount = 10
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.GroupRowHeight = 25
          OptionsView.GroupRowStyle = grsOffice11
          Preview.Visible = True
          Styles.Group = dtmControles.cxStyle12
          Styles.GroupByBox = dtmControles.cxStyle12
          Styles.StyleSheet = dtmControles.GridTableViewStyleSheetLigth
          object cxGridDBTableCompromissoDataPrevista: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA'
            PropertiesClassName = 'TcxDateEditProperties'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 93
          end
          object cxGridDBTablePrevisaoTipo: TcxGridDBColumn
            Caption = 'Tipo'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Agendamento'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Realizado'
                Value = 2
              end>
            Visible = False
          end
          object cxGridDBTablePrevisaoProtocolo: TcxGridDBColumn
            Caption = 'Protocolo'
            DataBinding.FieldName = 'DOCUMENTO_NUMERO'
            Visible = False
            Options.Editing = False
            Options.Focusing = False
            Width = 109
          end
          object cxGridDBTableViewModalidade: TcxGridDBColumn
            Caption = 'Modalidade'
            DataBinding.FieldName = 'TIPO_MODALIDADE_ID'
            RepositoryItem = dtmLookupContabil.Lista_TipoModalidade
            Options.Editing = False
            Options.Focusing = False
            Width = 144
          end
          object cxGridDBTableCompromissoClienteGeral: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 138
          end
          object cxGridDBTableCompromissoCompromisso: TcxGridDBColumn
            Caption = 'Compromisso'
            DataBinding.FieldName = 'CONTABIL_CONTA_ID'
            RepositoryItem = dtmLookupContabil.Lista_PlanoContasTodos
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 166
          end
          object cxGridDBTablePrevisaoHistorico: TcxGridDBColumn
            Caption = 'Hist'#243'rico'
            DataBinding.FieldName = 'HISTORICO'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 141
          end
          object cxGridDBTablePrevisaoOperacao: TcxGridDBColumn
            DataBinding.FieldName = 'OPERACAO'
            RepositoryItem = dtmLookupContabil.Combo_OperacaoLivroCaixa
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 54
            IsCaptionAssigned = True
          end
          object cxGridDBTableCompromissoEntrada: TcxGridDBColumn
            Caption = 'Entrada'
            DataBinding.FieldName = 'calc_Entrada'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 118
          end
          object cxGridDBTableCompromissoSaida: TcxGridDBColumn
            Caption = 'Sa'#237'da'
            DataBinding.FieldName = 'calc_saida'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 86
          end
          object cxGridDBTablePrevisaoSelecionar: TcxGridDBColumn
            Caption = 'Selecionar'
            DataBinding.FieldName = 'calc_Selecionado'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.OnChange = cxGridDBTablePrevisaoSelecionarPropertiesChange
            OnCustomDrawCell = cxGridDBTablePrevisaoSelecionarCustomDrawCell
            Width = 68
          end
          object cxGridDBTablePrevisaoRegistrado: TcxGridDBColumn
            Caption = 'Registrado'
            DataBinding.FieldName = 'calc_Registrado'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dtmControles.imgCadBasicos
            Properties.Items = <
              item
                ImageIndex = 6
                Value = True
              end
              item
                ImageIndex = 8
                Value = 'False'
              end>
            Options.Editing = False
            Options.Focusing = False
            Width = 66
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = cxGridDBTablePrevisao
        end
      end
    end
  end
  object pnlSelecao: TPanel [2]
    Left = 0
    Top = 38
    Width = 1080
    Height = 19
    Align = alTop
    BevelOuter = bvNone
    Color = 14807280
    ParentBackground = False
    TabOrder = 2
    object lblMarcar: TcxLabel
      Left = 5
      Top = 2
      Cursor = crHandPoint
      Caption = 'Marcar Todos'
      Style.TextColor = clBlack
      Style.TextStyle = [fsUnderline]
      Transparent = True
      OnClick = lblMarcarClick
    end
    object lblDesmarcar: TcxLabel
      Left = 77
      Top = 2
      Cursor = crHandPoint
      Caption = 'Desmarcar Todos'
      Style.TextColor = clBlack
      Style.TextStyle = [fsUnderline]
      Transparent = True
      OnClick = lblDesmarcarClick
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 
      'SELECT LF.DATA_VENCIMENTO AS DATA,'#13#10'       LF.LIVRO_FINANCEIRO_I' +
      'D,'#13#10'       LF.LIVRO_CAIXA_FATURADO_ID,'#13#10'       LF.DOCUMENTO_NUME' +
      'RO,'#13#10'       LF.TIPO_MODALIDADE_ID,'#13#10'       LF.PESSOA_ID,'#13#10'      ' +
      ' LF.CONTABIL_CONTA_ID,'#13#10'       LF.HISTORICO,'#13#10'       LF.VALOR_AG' +
      'ENDADO AS VALOR,'#13#10'       LF.OPERACAO,'#13#10'       P.NOME,'#13#10'       CC' +
      '.DESCRICAO AS COMPROMISSO'#13#10'FROM J_LIVRO_FINANCEIRO LF'#13#10'  LEFT OU' +
      'TER JOIN J_PESSOA P ON'#13#10'  LF.PESSOA_ID = P.PESSOA_ID'#13#10'  LEFT OUT' +
      'ER JOIN J_CONTABIL_CONTA CC ON'#13#10'  LF.CONTABIL_CONTA_ID = CC.CONT' +
      'ABIL_CONTA_ID'
    Left = 47
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 119
  end
  inherited ClientAncestral: TClientDataSet
    OnCalcFields = ClientAncestralCalcFields
    Left = 215
    object ClientAncestralcalc_Entrada: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_Entrada'
      Calculated = True
    end
    object ClientAncestralcalc_saida: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_saida'
      Calculated = True
    end
    object ClientAncestralDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object ClientAncestralDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object ClientAncestralTIPO_MODALIDADE_ID: TFMTBCDField
      FieldName = 'TIPO_MODALIDADE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object ClientAncestralVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object ClientAncestralOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object ClientAncestralcalc_Selecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'calc_Selecionado'
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object ClientAncestralCOMPROMISSO: TStringField
      FieldName = 'COMPROMISSO'
      Size = 60
    end
    object ClientAncestralcalc_valor_pagar: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_valor_pagar'
      Calculated = True
    end
    object ClientAncestralLIVRO_FINANCEIRO_ID: TFMTBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object ClientAncestralLIVRO_CAIXA_FATURADO_ID: TFMTBCDField
      FieldName = 'LIVRO_CAIXA_FATURADO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralcalc_Registrado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'calc_Registrado'
      Calculated = True
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 311
  end
  object dtsOrcamento: TDataSource
    DataSet = CLientOrcamento
    Left = 207
    Top = 369
  end
  object sqlOrcamento: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT LC.CAIXA_ID,'#13#10'       LC.DATA_PAGAMENTO AS DATA,'#13#10'       L' +
      'C.DOCUMENTO_NUMERO,'#13#10'       LC.TIPO_MODALIDADE_ID,'#13#10'       LC.PE' +
      'SSOA_ID,'#13#10'       LC.CONTABIL_CONTA_ID,'#13#10'       LC.HISTORICO,'#13#10'  ' +
      '     LC.VALOR,'#13#10'       LC.OPERACAO,'#13#10'       P.NOME,'#13#10'       CC.D' +
      'ESCRICAO AS COMPROMISSO'#13#10'FROM J_LIVRO_CAIXA LC'#13#10'  LEFT OUTER JOI' +
      'N J_PESSOA P ON'#13#10'  LC.PESSOA_ID = P.PESSOA_ID'#13#10'  LEFT OUTER JOIN' +
      ' J_CONTABIL_CONTA CC ON'#13#10'  LC.CONTABIL_CONTA_ID = CC.CONTABIL_CO' +
      'NTA_ID'#13#10'WHERE ORCAMENTO_ID = :ORCAMENTO_ID'#13#10'  AND ANO_MES_REGIST' +
      'RO = :ANO_MES_REFERENCIA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'ORCAMENTO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANO_MES_REFERENCIA'
        ParamType = ptInput
      end>
    Params = <>
    Left = 88
    Top = 311
  end
  object CLientOrcamento: TClientDataSet
    PersistDataPacket.Data = {
      AF0100009619E0BD02000000180000000B000000000003000000AF0104444154
      4110001100000001000753554254595045020049000A00466F726D6174746564
      0010444F43554D454E544F5F4E554D45524F0100490000000100055749445448
      020002003C00125449504F5F4D4F44414C49444144455F49440C001200000002
      0008444543494D414C5302000200020005574944544802000200140009504553
      534F415F49440C0012000000020008444543494D414C53020002000200055749
      44544802000200140011434F4E544142494C5F434F4E54415F49440C00120000
      00020008444543494D414C530200020002000557494454480200020014000948
      4953544F5249434F0100490000000100055749445448020002005A000E56414C
      4F525F4147454E4441444F0C0012000000020008444543494D414C5302000200
      0300055749445448020002001400084F5045524143414F010049000000010005
      5749445448020002000300044E4F4D4501004900000001000557494454480200
      02007800045449504F04000100000000000B434F4D50524F4D4953534F010049
      00000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftTimeStamp
      end
      item
        Name = 'DOCUMENTO_NUMERO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO_MODALIDADE_ID'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'PESSOA_ID'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'CONTABIL_CONTA_ID'
        DataType = ftFMTBcd
        Precision = 20
        Size = 2
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'VALOR_AGENDADO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 3
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'COMPROMISSO'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CLientOrcamentoCalcFields
    Left = 210
    Top = 304
    object CLientOrcamentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object CLientOrcamentoDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object CLientOrcamentoTIPO_MODALIDADE_ID: TFMTBCDField
      FieldName = 'TIPO_MODALIDADE_ID'
      Precision = 20
      Size = 2
    end
    object CLientOrcamentoPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object CLientOrcamentoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object CLientOrcamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object CLientOrcamentoVALOR_AGENDADO: TFMTBCDField
      FieldName = 'VALOR_AGENDADO'
      Precision = 20
      Size = 3
    end
    object CLientOrcamentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
    object CLientOrcamentocalc_Entrada: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_Entrada'
      Calculated = True
    end
    object CLientOrcamentocalc_saida: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_saida'
      Calculated = True
    end
    object CLientOrcamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object CLientOrcamentoTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CLientOrcamentoCOMPROMISSO: TStringField
      FieldName = 'COMPROMISSO'
      Size = 120
    end
  end
  object frxDBDatasetItens: TfrxDBDataset
    UserName = 'frxDBDatasetItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'calc_Entrada=calc_Entrada'
      'calc_saida=calc_saida'
      'DATA=DATA'
      'DOCUMENTO_NUMERO=DOCUMENTO_NUMERO'
      'TIPO_MODALIDADE_ID=TIPO_MODALIDADE_ID'
      'PESSOA_ID=PESSOA_ID'
      'CONTABIL_CONTA_ID=CONTABIL_CONTA_ID'
      'HISTORICO=HISTORICO'
      'VALOR=VALOR'
      'OPERACAO=OPERACAO'
      'NOME=NOME'
      'COMPROMISSO=COMPROMISSO')
    DataSource = SourceAncestral
    BCDToCurrency = False
    Left = 368
    Top = 313
  end
end
