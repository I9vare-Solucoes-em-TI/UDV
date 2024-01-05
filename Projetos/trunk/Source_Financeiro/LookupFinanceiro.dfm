object dtmLookupFinanceiro: TdtmLookupFinanceiro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 407
  Width = 865
  object cxEditRepository2: TcxEditRepository
    Left = 49
    Top = 24
    object ListaPessoasTodas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPessoasTodas
    end
    object ComboCaixas: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 45
          Value = 'S'
        end
        item
          ImageIndex = 51
          Value = 'N'
        end>
    end
    object ListaCaixaFinanceiro: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
    end
    object ListaPessoaFuncao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_FUNCAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPessoaFuncao
    end
    object ListaGrupoIdentificacao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsEditList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'IDENTIFICACAO'
      Properties.ListColumns = <
        item
          FieldName = 'IDENTIFICACAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoIdentificacao
    end
    object ListaPessoaTarefa: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'IDENTIFICACAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPessoaTarefa
    end
    object ComboHonorarioPeriodo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Mensal Ilimitado'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Uma Vez'
          Value = '2'
        end
        item
          Description = 'Mensal Determinado'
          Value = '3'
        end
        item
          Description = 'Bimestral'
          Value = '4'
        end
        item
          Description = 'Trimestral'
          Value = '5'
        end
        item
          Description = 'Personalizado'
          Value = '6'
        end
        item
          Description = 'Anual'
          Value = '7'
        end>
    end
    object ComboContratoItemSituacao: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Ativo'
          ImageIndex = 58
          Value = '1'
        end
        item
          Description = 'Conclu'#237'do'
          ImageIndex = 2
          Value = '3'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = '4'
        end
        item
          Description = 'Aguardando Ativa'#231#227'o'
          ImageIndex = 8
          Value = '0'
        end>
    end
    object ListaContaBancaria: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'BANCO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'BANCO_NOME'
        end>
      Properties.ListSource = tdsContaBancaria
    end
    object ListaLayoutBancario: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'CONFIG_RELATORIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListSource = dtsLayoutBoleto
    end
    object ListaOrcamentos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'LIVRO_AGENDAMENTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'HISTORICO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsOrcamento
    end
    object ComboTipoCaixa: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Conta Banc'#225'ria'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Caixa Interno'
          Value = '2'
        end
        item
          Description = 'Caixa de Aplica'#231#227'o'
          Value = '3'
        end
        item
          Description = 'Outros Caixa'
          Value = '4'
        end>
    end
  end
  object sqlPessoasTodas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT NOME, PESSOA_ID'#13#10'FROM J_PESSOA'#13#10'ORDER BY NOME')
    Left = 140
    Top = 8
    object sqlPessoasTodasNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPessoasTodasPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsPessoasTodas: TDataSource
    DataSet = sqlPessoasTodas
    Left = 140
    Top = 64
  end
  object sqlPessoaFuncao: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_PESSOA_FUNCAO'#13#10'ORDER BY DESCRICAO')
    Left = 289
    Top = 124
    object sqlPessoaFuncaoPESSOA_FUNCAO_ID: TBCDField
      FieldName = 'PESSOA_FUNCAO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlPessoaFuncaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlPessoaFuncaoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlPessoaFuncaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsPessoaFuncao: TDataSource
    DataSet = sqlPessoaFuncao
    Left = 291
    Top = 172
  end
  object sqlGrupoIdentificacao: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT IDENTIFICACAO'#13#10'FROM J_PESSOA'#13#10'WHERE TIPO_PESSOA = '#39'J'#39#13#10'  ' +
        'AND NOT (IDENTIFICACAO IS NULL)'#13#10'GROUP BY IDENTIFICACAO')
    Left = 138
    Top = 122
    object sqlGrupoIdentificacaoIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 60
    end
  end
  object dtsGrupoIdentificacao: TDataSource
    DataSet = sqlGrupoIdentificacao
    Left = 137
    Top = 175
  end
  object ClientItem: TClientDataSet
    PersistDataPacket.Data = {
      F10100009619E0BD010000001800000010000000000003000000F1010B434F4D
      50524F4D4953534F040001000000000007455350454349450100490000000100
      0557494454480200020001000F444154415F56454E43494D454E544F04000600
      000000000F444154415F5245414C495A4143414F04000600000000000A56414C
      4F525F4954454D080004000000010007535542545950450200490006004D6F6E
      6579000F56414C4F525F52454749535452415208000400000001000753554254
      5950450200490006004D6F6E6579000543414958410800040000000100075355
      42545950450200490006004D6F6E65790011434F4E544142494C5F434F4E5441
      5F49440400010000000000084F5045524143414F010049000000010005574944
      54480200020001000F43454E54524F5F435553544F5F49440400010000000000
      1242414C414E434554455F475255504F5F49440400010000000000134C495652
      4F5F46494E414E434549524F5F49440400010000000000045449504F01004900
      0000010005574944544802000200010009504553534F415F4944040001000000
      000009484953544F5249434F0100490000000100055749445448020002007800
      08444554414C484553010049000000010005574944544802000200780001000D
      44454641554C545F4F524445520200820000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COMPROMISSO'
        DataType = ftInteger
      end
      item
        Name = 'ESPECIE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATA_VENCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_REALIZACAO'
        DataType = ftDate
      end
      item
        Name = 'VALOR_ITEM'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_REGISTRAR'
        DataType = ftCurrency
      end
      item
        Name = 'CAIXA'
        DataType = ftCurrency
      end
      item
        Name = 'CONTABIL_CONTA_ID'
        DataType = ftInteger
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CENTRO_CUSTO_ID'
        DataType = ftInteger
      end
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftInteger
      end
      item
        Name = 'LIVRO_FINANCEIRO_ID'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PESSOA_ID'
        DataType = ftInteger
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DETALHES'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'DataVencimento'
        Fields = 'DATA_VENCIMENTO'
      end>
    IndexName = 'DataVencimento'
    Params = <>
    StoreDefs = True
    Left = 379
    Top = 56
    object ClientItemCOMPROMISSO: TIntegerField
      FieldName = 'COMPROMISSO'
    end
    object ClientItemESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object ClientItemDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object ClientItemDATA_REALIZACAO: TDateField
      FieldName = 'DATA_REALIZACAO'
    end
    object ClientItemVALOR_ITEM: TCurrencyField
      FieldName = 'VALOR_ITEM'
    end
    object ClientItemVALOR_REGISTRAR: TCurrencyField
      FieldName = 'VALOR_REGISTRAR'
    end
    object ClientItemCAIXA: TCurrencyField
      FieldName = 'CAIXA'
    end
    object ClientItemCONTABIL_CONTA_ID: TIntegerField
      FieldName = 'CONTABIL_CONTA_ID'
    end
    object ClientItemOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object ClientItemCENTRO_CUSTO_ID: TIntegerField
      FieldName = 'CENTRO_CUSTO_ID'
    end
    object ClientItemBALANCETE_GRUPO_ID: TIntegerField
      FieldName = 'BALANCETE_GRUPO_ID'
    end
    object ClientItemLIVRO_FINANCEIRO_ID: TIntegerField
      FieldName = 'LIVRO_FINANCEIRO_ID'
    end
    object ClientItemTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientItemPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object ClientItemHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 120
    end
    object ClientItemDETALHES: TStringField
      FieldName = 'DETALHES'
      Size = 120
    end
  end
  object dtsItem: TDataSource
    DataSet = ClientItem
    Left = 381
    Top = 110
  end
  object sqlPessoaTarefa: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT IDENTIFICACAO, PESSOA_ID'#13#10'FROM J_PESSOA'#13#10'WHERE (NOT PESSO' +
        'A_FUNCAO_ID IS NULL) AND (PESSOA_FUNCAO_ID > 0)'#13#10'ORDER BY IDENTI' +
        'FICACAO')
    Left = 457
    Top = 120
    object FMTBCDField1: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPessoaTarefaIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 60
    end
  end
  object dtsPessoaTarefa: TDataSource
    DataSet = sqlPessoaTarefa
    Left = 459
    Top = 176
  end
  object sqlCaixa: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_CAIXA'#13#10'ORDER BY DESCRICAO')
    Left = 220
    Top = 6
    object sqlCaixaCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlCaixaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCaixaRESPONSAVEL_ID: TBCDField
      FieldName = 'RESPONSAVEL_ID'
      Precision = 20
      Size = 2
    end
    object sqlCaixaPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
  end
  object dtsCaixa: TDataSource
    DataSet = sqlCaixa
    Left = 220
    Top = 72
  end
  object sqlBanco: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_BANCO'#13#10'WHERE BANCO_ID = :BANCO_ID')
    Left = 539
    Top = 8
    ParamData = <
      item
        Name = 'BANCO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlBancoBANCO_ID: TBCDField
      FieldName = 'BANCO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlBancoBANCO_NUMERO: TStringField
      FieldName = 'BANCO_NUMERO'
      Size = 10
    end
    object sqlBancoBANCO_DIGITO: TStringField
      FieldName = 'BANCO_DIGITO'
      Size = 3
    end
    object sqlBancoBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      Size = 60
    end
    object sqlBancoAGENCIA_NOME: TStringField
      FieldName = 'AGENCIA_NOME'
      Size = 60
    end
    object sqlBancoAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      Size = 3
    end
    object sqlBancoAGENCIA_NUMERO: TStringField
      FieldName = 'AGENCIA_NUMERO'
      Size = 10
    end
    object sqlBancoCONTA_NUMERO: TStringField
      FieldName = 'CONTA_NUMERO'
      Size = 15
    end
    object sqlBancoCONTA_DIGITO: TStringField
      FieldName = 'CONTA_DIGITO'
      Size = 3
    end
    object sqlBancoAGENCIA_UF: TStringField
      FieldName = 'AGENCIA_UF'
      Size = 3
    end
    object sqlBancoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 10
    end
    object sqlBancoCODIGO_CEDENTE_NUMERO: TStringField
      FieldName = 'CODIGO_CEDENTE_NUMERO'
      Size = 10
    end
    object sqlBancoCODIGO_CEDENTE_DIGITO: TStringField
      FieldName = 'CODIGO_CEDENTE_DIGITO'
      Size = 3
    end
    object sqlBancoNOSSO_NUMERO: TBCDField
      FieldName = 'NOSSO_NUMERO'
      Precision = 15
      Size = 2
    end
    object sqlBancoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 10
    end
    object sqlBancoCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 20
      Size = 2
    end
    object sqlBancoLOCAL_PADRAO: TStringField
      FieldName = 'LOCAL_PADRAO'
      Size = 60
    end
  end
  object sqlBoleto: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM J_BOLETO')
    Left = 609
    Top = 8
    object sqlBoletoBOLETO_ID: TBCDField
      FieldName = 'BOLETO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlBoletoPATH_REMESSA: TStringField
      FieldName = 'PATH_REMESSA'
      Size = 120
    end
    object sqlBoletoPATH_RETORNO: TStringField
      FieldName = 'PATH_RETORNO'
      Size = 120
    end
    object sqlBoletoPATH_LOGOTIPO: TStringField
      FieldName = 'PATH_LOGOTIPO'
      Size = 120
    end
    object sqlBoletoPATH_GERARPDF: TStringField
      FieldName = 'PATH_GERARPDF'
      Size = 120
    end
    object sqlBoletoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 260
    end
    object sqlBoletoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 3
    end
    object sqlBoletoMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 3
    end
    object sqlBoletoACEITE: TStringField
      FieldName = 'ACEITE'
      Size = 3
    end
    object sqlBoletoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 3
    end
    object sqlBoletoLOCAL_PAGTO: TStringField
      FieldName = 'LOCAL_PAGTO'
      Size = 120
    end
    object sqlBoletoCONT_REMESSA: TBCDField
      FieldName = 'CONT_REMESSA'
      Precision = 15
      Size = 2
    end
    object sqlBoletoVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlBoletoDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object sqlBoletoDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlBoletoNOSSO_NUMERO: TBCDField
      FieldName = 'NOSSO_NUMERO'
      Precision = 20
      Size = 2
    end
    object sqlBoletoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsBoleto: TDataSource
    DataSet = sqlBoleto
    Left = 610
    Top = 56
  end
  object dtsBanco: TDataSource
    DataSet = sqlBanco
    Left = 540
    Top = 56
  end
  object sqlCedente: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM T_CEDENTE')
    Left = 529
    Top = 120
    object sqlCedenteCEDENTE_ID: TBCDField
      FieldName = 'CEDENTE_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlCedenteSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlCedentePRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
    object sqlCedenteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCedenteEND_LOG: TStringField
      FieldName = 'END_LOG'
      Size = 90
    end
    object sqlCedenteEND_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 15
    end
    object sqlCedenteEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 60
    end
    object sqlCedenteEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 60
    end
    object sqlCedenteEND_UF: TStringField
      FieldName = 'END_UF'
      Size = 3
    end
    object sqlCedenteEND_EMAIL: TStringField
      FieldName = 'END_EMAIL'
      Size = 30
    end
    object sqlCedenteCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlCedenteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 15
    end
    object sqlCedenteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 120
    end
    object sqlCedenteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
  end
  object dtsCedente: TDataSource
    DataSet = sqlCedente
    Left = 530
    Top = 176
  end
  object sqlLivroFinanceiro: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM J_LIVRO_FINANCEIRO'#13#10'WHERE LIVRO_FINANCEIRO_ID = :' +
        'LIVRO_FINANCEIRO_ID')
    Left = 609
    Top = 120
    ParamData = <
      item
        Name = 'LIVRO_FINANCEIRO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlLivroFinanceiroLIVRO_FINANCEIRO_ID: TBCDField
      FieldName = 'LIVRO_FINANCEIRO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlLivroFinanceiroVALOR_AGENDADO: TBCDField
      FieldName = 'VALOR_AGENDADO'
      Precision = 15
      Size = 3
    end
    object sqlLivroFinanceiroSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlLivroFinanceiroCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroANO_MES_REFERENCIA: TStringField
      FieldName = 'ANO_MES_REFERENCIA'
      Size = 10
    end
    object sqlLivroFinanceiroBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 1
    end
    object sqlLivroFinanceiroBOLETA_ID: TBCDField
      FieldName = 'BOLETA_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Size = 1
    end
    object sqlLivroFinanceiroVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 15
      Size = 3
    end
    object sqlLivroFinanceiroPROCESSO_CONTRATO_ITEM_ID: TBCDField
      FieldName = 'PROCESSO_CONTRATO_ITEM_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroPROCESSO_CONTRATO_ID: TBCDField
      FieldName = 'PROCESSO_CONTRATO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object sqlLivroFinanceiroPESSOA_ID: TBCDField
      FieldName = 'PESSOA_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Precision = 15
      Size = 3
    end
    object sqlLivroFinanceiroLIVRO_REMUNERACAO_ID: TBCDField
      FieldName = 'LIVRO_REMUNERACAO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroFINANCEIRO_REMUNERACAO_ID: TBCDField
      FieldName = 'FINANCEIRO_REMUNERACAO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
    object sqlLivroFinanceiroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 260
    end
    object sqlLivroFinanceiroDATA_OPERACAO: TSQLTimeStampField
      FieldName = 'DATA_OPERACAO'
    end
    object sqlLivroFinanceiroLIVRO_AGENDAMENTO_ID: TBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 3
    end
    object sqlLivroFinanceiroIR: TStringField
      FieldName = 'IR'
      Size = 1
    end
    object sqlLivroFinanceiroCNJ: TStringField
      FieldName = 'CNJ'
      Size = 1
    end
    object sqlLivroFinanceiroDOCUMENTO_NUMERO: TStringField
      FieldName = 'DOCUMENTO_NUMERO'
      Size = 60
    end
    object sqlLivroFinanceiroCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Precision = 15
      Size = 2
    end
    object sqlLivroFinanceiroREGISTRO_PARCIAL: TStringField
      FieldName = 'REGISTRO_PARCIAL'
      Size = 1
    end
  end
  object dtsLivroFinanceiro: TDataSource
    DataSet = sqlLivroFinanceiro
    Left = 610
    Top = 176
  end
  object frxReport1: TfrxReport
    Version = '6.8.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38715.516369351900000000
    ReportOptions.LastChange = 39779.901028530100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 781
    Top = 56
    Datasets = <
      item
      end
      item
      end>
    Variables = <
      item
        Name = 'TituloRelatorio'
        Value = 
          #39'Cobran'#231'a - BANCO DO BRASIL - Sacado: PROTRAUMA SERVI'#199'OS MEDICOS' +
          ' S/C LTDA'#39
      end
      item
        Name = 'NomeBanco'
        Value = #39'BANCO DO BRASIL'#39
      end
      item
        Name = 'CodigoBanco'
        Value = #39'001-9'#39
      end
      item
        Name = 'LocalPagamento'
        Value = #39'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'#39
      end
      item
        Name = 'DataVencimento'
        Value = #39'04/01/2006'#39
      end
      item
        Name = 'NomeCedente'
        Value = #39'REAL LIMP COM. DE MAT. DE LIMP. LTDA'#39
      end
      item
        Name = 'AgenciaCodigoCedente'
        Value = #39'03884-9 / 000000014684-6'#39
      end
      item
        Name = 'DataDocumento'
        Value = #39'20/12/2005'#39
      end
      item
        Name = 'NumeroDocumento'
        Value = #39'005423/1-1'#39
      end
      item
        Name = 'EspecieDocumento'
        Value = #39'DM'#39
      end
      item
        Name = 'Aceite'
        Value = #39'N'#39
      end
      item
        Name = 'DataProcessamento'
        Value = #39'16/07/2006'#39
      end
      item
        Name = 'NossoNumero'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'Carteira'
        Value = #39'17'#39
      end
      item
        Name = 'EspecieMoeda'
        Value = #39'R$'#39
      end
      item
        Name = 'ValorDocumento'
        Value = #39'88,08'#39
      end
      item
        Name = 'Instrucoes'
        Value = #39#13#10'PROTESTAR AP'#211'S 7 DIAS DO VENCIMENTO.'#13#10#39
      end
      item
        Name = 'SacadoNome'
        Value = #39'PROTRAUMA SERVI'#199'OS MEDICOS S/C LTDA'#39
      end
      item
        Name = 'SacadoCPFCGC'
        Value = #39'CNPJ: 00.588.915/0001-60'#39
      end
      item
        Name = 'SacadoRuaNumeroComplemento'
        Value = #39'AVENIDA BRASIL 3114,    '#39
      end
      item
        Name = 'SacadoCEPBairroCidadeEstado'
        Value = #39'42850-000    CENTRO    DIAS D'#39#39'AVILA    BA'#39
      end
      item
        Name = 'CodigoBaixa'
        Value = #39'10510390000001806-5'#39
      end
      item
        Name = 'LinhaDigitavel'
        Value = #39'00190.00009 01051.039004 00001.806173 5 30110000008808'#39
      end
      item
        Name = 'CodigoBarra'
        Value = #39'00195301100000088080000001051039000000180617'#39
      end>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clNavy
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 8.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 737.008350000000000000
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 90.708720000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 483.779840000000000000
        Top = 544.252320000000000000
        Width = 737.008350000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 22.677180000000020000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 68.031540000000400000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 45.354360000000380000
          Width = 188.476500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftBottom]
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 23.177180000000020000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 45.354360000000380000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 14.779530000000000000
          Top = 128.504020000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Color = clGray
          Frame.ShadowWidth = 3.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 555.252320000000000000
          Top = 3.779530000000136000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Recibo do Sacado')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 27.456709999999820000
          Width = 98.267780000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 47.133889999999720000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 68.531540000000400000
          Width = 96.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 98.267780000000130000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 102.046985350000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 529.634200000000000000
          Height = 113.606370000000000000
          Frame.Typ = [ftRight]
        end
        object Memo91: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 264.228510000000000000
          Top = 207.874150000000000000
          Width = 104.606370000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 367.834880000000000000
          Top = 208.374150000000000000
          Width = 69.252010000000000000
          Height = 22.177180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 207.874150000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 230.551330000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 211.315090000000000000
          Top = 230.551330000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 263.728510000000000000
          Top = 230.551330000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 438.086890000000000000
          Top = 230.551330000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 162.519789999999900000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 207.874150000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 230.551330000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 529.134200000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haBlock
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 185.196970000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 343.937229999999000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15066597
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 162.519789999999900000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local de Pagamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 185.196970000000000000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 207.874150000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 230.551330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Uso do Banco')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 152.401670000000000000
          Top = 208.374150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'  do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 369.614410000000000000
          Top = 207.374150000000000000
          Width = 45.354360000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Aceite')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data do Processamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Carteira')
          ParentFont = False
          WordWrap = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 215.094620000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Esp'#233'cie')
          ParentFont = False
          WordWrap = False
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 268.008040000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 441.866420000000000000
          Top = 230.551330000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 253.228510000000000000
          Width = 438.425480000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Instru'#231#245'es de responsabilidade do cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 150.842610000000000000
          Top = 139.842610000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            '[CodigoBanco]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Left = 430.527830000000000000
          Top = 241.889920000000000000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 541.165740000000000000
          Top = 162.519789999999900000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 185.696970000000000000
          Width = 113.385900000000000000
          Height = 9.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Ag'#234'ncia/C'#243'digo do Cedente')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 208.874150000000000000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
          WordWrap = False
        end
        object Memo133: TfrxMemoView
          AllowVectorExport = True
          Left = 541.634200000000000000
          Top = 232.051330000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '( = ) Valor do Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 253.228510000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Desconto/Abatimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 275.905689999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( - ) Outras Dedu'#231#245'es')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 298.582869999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Mora/Multa')
          ParentFont = False
          WordWrap = False
        end
        object Memo137: TfrxMemoView
          AllowVectorExport = True
          Left = 540.134200000000000000
          Top = 321.260050000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( + ) Outros Acr'#233'scimos')
          ParentFont = False
          WordWrap = False
        end
        object Memo138: TfrxMemoView
          AllowVectorExport = True
          Left = 541.134200000000000000
          Top = 345.437229999999000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15066597
          Memo.UTF8W = (
            '( = ) Valor Cobrado')
          ParentFont = False
          WordWrap = False
        end
        object Memo139: TfrxMemoView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 367.287350309999100000
          Width = 438.425480000000000000
          Height = 10.343846670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacado')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 412.645950000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 412.645625349999000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 12.166666670000000000
          Top = 366.781076669999000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo144: TfrxMemoView
          AllowVectorExport = True
          Left = 387.953000000000000000
          Top = 217.653680000000000000
          Width = 35.336810390000000000
          Height = 11.677180000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Aceite]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '18')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          AllowVectorExport = True
          Left = 210.815090000000000000
          Top = 238.110390000000100000
          Width = 40.175400390000000000
          Height = 13.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          AllowVectorExport = True
          Left = 90.429190000000000000
          Top = 162.578850000000000000
          Width = 445.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          AllowVectorExport = True
          Left = 90.370130000000000000
          Top = 49.133889999999720000
          Width = 445.984540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome]')
          ParentFont = False
          WordWrap = False
        end
        object Memo149: TfrxMemoView
          AllowVectorExport = True
          Left = 91.929190000000010000
          Top = 27.980173390000000000
          Width = 446.189240000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAVEL PREFERENCIALMENTE EM QUALQUER AG'#202'NCIA DO BANCO DO BRASIL')
          ParentFont = False
          WordWrap = False
        end
        object Memo156: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 397.527830000000000000
          Width = 438.425480000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sacador/Avalista')
          ParentFont = False
          WordWrap = False
        end
        object Memo165: TfrxMemoView
          AllowVectorExport = True
          Left = 639.913730000000000000
          Top = 34.527373540000210000
          Width = 83.240260000000000000
          Height = 10.397650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo169: TfrxMemoView
          AllowVectorExport = True
          Left = 45.295300000000000000
          Top = 188.476500000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Centro Esp'#237'rita Beneficiente Uni'#227'o do Vegetal - N'#250'cleo Rei Inca')
          ParentFont = False
          WordWrap = False
        end
        object Memo172: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 216.944542600000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo173: TfrxMemoView
          AllowVectorExport = True
          Left = 640.075140000000000000
          Top = 239.110390000000100000
          Width = 80.740260000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[ValorDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo177: TfrxMemoView
          AllowVectorExport = True
          Left = 607.342920000000000000
          Top = 168.578850000000000000
          Width = 115.870130000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15066597
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo180: TfrxMemoView
          AllowVectorExport = True
          Left = 442.145950000000000000
          Top = 216.944542600000000000
          Width = 90.708720000000000000
          Height = 12.897650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DataProcessamento]')
          ParentFont = False
          WordWrap = False
        end
        object Memo181: TfrxMemoView
          AllowVectorExport = True
          Left = 590.563390000000000000
          Top = 194.756030000000000000
          Width = 132.283550000000000000
          Height = 10.838590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[AgenciaCodigoCedente]')
          ParentFont = False
          WordWrap = False
        end
        object Memo182: TfrxMemoView
          AllowVectorExport = True
          Left = 589.472790000000000000
          Top = 217.933210000000000000
          Width = 133.342610000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 162.519789999999900000
          Width = 716.445270000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 12.208720000000000000
          Top = 23.177180000000020000
          Width = 717.901980000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo185: TfrxMemoView
          AllowVectorExport = True
          Left = 219.874150000000000000
          Top = 141.622139999999900000
          Width = 501.409710000000000000
          Height = 17.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[LinhaDigitavel]')
          ParentFont = False
          WordWrap = False
        end
        object Memo186: TfrxMemoView
          AllowVectorExport = True
          Left = 218.874150000000000000
          Top = 3.779530000000136000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
          WordWrap = False
        end
        object Memo154: TfrxMemoView
          AllowVectorExport = True
          Left = 543.913730000000000000
          Top = 442.882189999999000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Ficha de Compensa'#231#227'o')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 45.015770000000000000
          Top = 420.204358269999900000
          Width = 379.200000000000000000
          Height = 60.472480000000000000
          BarType = bcCode_2_5_interleaved
          Expression = '<CodigoBarra>'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '399912833000000150031022200000099029798191052'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo153: TfrxMemoView
          AllowVectorExport = True
          Left = 49.074830000000000000
          Top = 272.008040000000100000
          Width = 476.220780000000000000
          Height = 64.252010000000000000
          DataSetName = 'frxDBRemessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Instrucoes]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 41.333333340000000000
          Top = 380.107296670000000000
          Width = 566.929500000000000000
          Height = 16.230983330000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SacadoNome] - [SacadoCPFCGC]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 268.000000000000000000
          Top = 215.735930000000100000
          Width = 96.675400390000000000
          Height = 15.677180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[EspecieDocumento]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 539.500000000000000000
          Top = 45.389610000000290000
          Width = 192.500000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 17.000000000000000000
          Top = 214.735930000000100000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBCAMPOS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DataDocumento]')
          ParentFont = False
          WordWrap = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 2.389609999999948000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 11.500000000000000000
          Top = 142.235930000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765C6070000FFD8FFE000104A46494600010101004800
            480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
            090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
            24221E241C1E1F1EFFC0000B080026009501011100FFC4001F00000105010101
            01010100000000000000000102030405060708090A0BFFC400B5100002010303
            020403050504040000017D010203000411051221314106135161072271143281
            91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
            3738393A434445464748494A535455565758595A636465666768696A73747576
            7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
            B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
            E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00F73A28A28A28A28A29
            6928A28A28A294D70FF153E26787FE1F5923EA2D25C5FCCA5ADACA2FBF27B93D
            1573DCFE00D78A43F14BC6B7D663C789E2ED0ED07DA8DB41E1A95182CA99E7E6
            2396E9F36703D47DDAEEFE1478FF0059F1FF00C4299A7D46D74AB3D3ADD83E86
            11BCF790FCA599C8C3053E9EA3E51D6BA3F89BF1364F07F8A747F0EDAF8726D6
            2F3565FDC2C774B17CDBB685E411C9EF914CF067C513AC78EA5F05EB7E19BDD0
            358584CC91CB32CAAE00CFDE503B723A8E0F35D468BE33F0BEB3AF5DE85A5EB3
            6D75A959EFF3EDD33B93636D6EA30704E38A8F47F1D784B573A88D375CB6B93A
            646D2DE050C0C28B9C9208E8307A553D53E2678174CB2B2BCBCF11DAA457D179
            D6DB55D9A44C91BB680481C1E48EC6A6D43E227826C345B2D66E7C45662CAFB2
            2D64425CCC41C10AAA0B70783C707AD5AD27C69E16D57C3D75E20D3F5AB6B8D3
            6CD59AE665CFEE428C9DCB8DC38E7A551D03E2578135ED4A3D3749F1358DCDDC
            BC47164AB39F41B80C9F614CD43E27F806C356934ABBF1458C577149E548A4B1
            547FEEB381B41FA9ACFF008AFF001297C0D73A25B45A249ABCBAC3B47008EE44
            7F302A07241073BC550D17E2E03E345F0A78ABC2F7BE1BBD7B76B88DA59D6646
            4556624951D30ADC8CF4C56EE95F153E1F6A9A843A7D8F8AAC25B99DC24484B2
            EE63D002C00C9AD47F1978613C563C2ADACDB0D68F4B4E77FDDDD8E98FBBCF5A
            CEBEF89DE00B2D51B4CB8F14E9E2ED64F29A3562F87CE36E54119CF153DDFC42
            F065A5B5F5CDCEBF6D1C561742CEE9C86C4531DD843C75F95BF2AEA78F6AF18F
            DAA75A363E16B7D3E4F0B5BEA70DD31C5F5C8DD1D991FC4157E7DD8E73C0C7AF
            4AF016F0E6B2BE19BAF17C71B49A4DB3881AFE2963F324CFF0C4A0E224E40E01
            233D3A81EE1FB266AB35D787EE2CA3F06269B6884B0D561185B96CFDD62C7733
            0F5191ECBDF13F69B36C3E2F7828DE6A936956E1079B7B0BEC7B75F379753838
            23AE6B98D23C5361E11F8A9AF6B3A26AD3F8B6D1349919B55BD0649A29366114
            39C0C17D8BD39071DAA0F072EA9E06D7BC0BE2ED4342BFD3E0BA91A0D46FA764
            F2EE96E1999586092308D9F980FBA2A95BDB5E786BC3975E3CD395DE0BABED47
            45D4E307831C83F76DF8127F10B5B7F072FB4DD13E2168D7FE259E0B5B09FC27
            B6DA5B92150F3C804F19E241F8FBD5EB1D5BC1EBF157C01E20D234D9342F0A18
            EE6384DEA848C4C0C819B25980E5939CD5AF0B3C777A47C73D4EC08934BB849B
            ECF2C7FEADC859CB153D0F0CA7F1158E750D3B58F09FC23D1743B882EF5FB4BF
            4796380869204120277E3EE8E879EC09AA9A76A5A3D8FC02F1C685A9DC4116BA
            FAC9FF004595809DDB7C78214F271B5B9ED835B1F1DE27B7F0F7C268751B89AC
            1E3B68D6E26076C9010B06E6CF62BC9FC2B352E6C61F8BF28F0F6BB75E35B79F
            44B849EFEFB32CB6BFB9973B5F0000005E71FC6475AAFA5B2AF817E190F123A4
            1E13FB6CF2C9730C7FBE8AE1669085663D11B8E833C13D8567DD4DAEC9A7B7C5
            75D0351FB47FC241FDA2BA8E53C9FB306D822FBDBFEF0C74C62BAEB7F10DA7C3
            1BD8EFFC09E27D27C49A3EB57E8F368CF86BB899C750CB93C74E7A1C707935CA
            78D8E7C21F10CE08CF8CA3E0FD2E2BEB5D13C45A16BB1C9268BAC69F7E9090B2
            34170A4293D01C5656B1E02F0FEB3E34B7F156AD03DEDD5ADB886DA195B30C78
            2C4BEDEEC738E78E3A57333FC0BF01CBE261AB7D9274B42DE63E969262D1E4EC
            FB3F3F941C7B638AF4BB6820B5B78EDEDA18E186350A91C6A15540E8001C0150
            5F699A6DFBABDF69F6974CA30A66855C81E83229ABA4692B6AD68BA6590B7720
            B44205D8C474C8C60D4B756365756EB6F75676F3C284158E48832A91C0C02314
            CFECCD37EC6F67FD9F69F6676DCD0F92BB18FA95C609A8AEF43D16F2DA2B5BBD
            1F4FB8821FF5514B6C8C89F404607E14FBAD274ABAB14B1BAD32CA7B44C6C824
            815A35C74C29181525B69F616D65F61B6B1B686D7047911C4AB1E0F51B40C525
            AE9DA7DA4864B5B1B581C8C168E15538FA8150CFA1E8B3DF8D427D1F4F96F148
            22E1ED90C808E9F3119A9AFF004ED3EFF67DBAC6D6EB667679D0ABEDCF5C6471
            45AE9BA75AC4F15AD85AC11C830EB1C2AA187A100734D7D2B4C7B25B27D36CDA
            D50EE584C0A6353CF217180793F9D49F61B2FB0FD87EC76FF64C63C8F287978C
            E71B718A86D746D1ED65135B6956304ABD1E3B74561F8814B2691A4C892249A5
            D93ACAFE6480DBA90EDCFCC78E4F279A7D969BA659232DAE9D6D02B9C910C2AA
            0FD7039AB54514514514514514514514514515FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 154.622140000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 68.252010000000150000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' Documento')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 26.118120000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NumeroDocumento]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nosso Numero')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 158.401670000000000000
          Top = 75.811070000000440000
          Width = 124.911640390000000000
          Height = 16.177180000000000000
          DataSetName = 'Campos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NossoNumero]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clWhite
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 347.378170000000000000
          Top = 68.252010000000150000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
        end
        object Memo178: TfrxMemoView
          AllowVectorExport = True
          Left = 419.189240000000000000
          Top = 75.811070000000440000
          Width = 94.488250000000000000
          Height = 13.397650000000000000
          DataSetName = 'DBCAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[DataVencimento]')
          ParentFont = False
          WordWrap = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 264.567100000000000000
        Width = 737.008350000000000000
        Columns = 1
        FooterAfterEach = True
        RowCount = 0
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 3.220470000000000000
          Top = 26.456709999999990000
          Width = 729.449290000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Familia"'
        StartNewPage = True
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Familia"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 491.338900000000000000
        Width = 737.008350000000000000
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 737.008350000000000000
        Columns = 2
        ColumnWidth = 377.952755905512000000
        RowCount = 0
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999966000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'Compromisso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Compromisso"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779529999999966000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Data_Compromisso'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '####/##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Data_Compromisso"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'Valor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCompromisso."Valor"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 362.834880000000000000
        Width = 737.008350000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 737.008350000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCompromisso."Valor">,DetailData1)]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetSocio."Nome"'
        KeepTogether = True
        StartNewPage = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          DataField = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetSocio."Nome"]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 100
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 781
    Top = 8
  end
  object sqlContaBancaria: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT'#13#10'   BANCO_ID, '#13#10'   BANCO_NOME '#13#10'FROM '#13#10'  J_BANCO '#13#10'ORDER ' +
        'BY '#13#10'  BANCO_NOME')
    Left = 461
    Top = 9
    object sqlContaBancariaBANCO_ID: TBCDField
      FieldName = 'BANCO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlContaBancariaBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      Size = 60
    end
  end
  object tdsContaBancaria: TDataSource
    DataSet = sqlContaBancaria
    Left = 462
    Top = 56
  end
  object dtsLayoutBoleto: TDataSource
    DataSet = sqlLayoutBoleto
    Left = 292
    Top = 72
  end
  object sqlLayoutBoleto: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT'#13#10'  CONFIG_RELATORIO_ID,'#13#10'  DESCRICAO'#13#10'FROM'#13#10'  G_CONFIG_RE' +
        'LATORIO'#13#10'ORDER BY DESCRICAO')
    Left = 292
    Top = 6
    object sqlLayoutBoletoCONFIG_RELATORIO_ID: TBCDField
      FieldName = 'CONFIG_RELATORIO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlLayoutBoletoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object sqlOrcamento: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT LIVRO_AGENDAMENTO_ID, HISTORICO'#13#10'FROM J_LIVRO_AGENDAMENTO' +
        #13#10'WHERE OPERACAO = '#39'O'#39#13#10'  AND SITUACAO IN (1,2)'#13#10'ORDER BY HISTOR' +
        'ICO')
    Left = 133
    Top = 271
    object sqlOrcamentoLIVRO_AGENDAMENTO_ID: TBCDField
      FieldName = 'LIVRO_AGENDAMENTO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlOrcamentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 90
    end
  end
  object dtsOrcamento: TDataSource
    DataSet = sqlOrcamento
    Left = 133
    Top = 325
  end
end