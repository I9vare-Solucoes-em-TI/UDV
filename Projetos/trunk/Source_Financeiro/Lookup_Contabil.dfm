object dtmLookupContabil: TdtmLookupContabil
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 545
  Width = 1011
  object cxEditRepository1: TcxEditRepository
    Left = 51
    Top = 109
    object Combo_EntradaSaida: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Sa'#237'da'
          ImageIndex = 4
          Value = '1'
        end
        item
          Description = 'Entrada'
          ImageIndex = 3
          Value = '2'
        end
        item
          Description = 'Aporte'
          Value = '3'
        end
        item
          Description = 'Retirada'
          Value = '4'
        end
        item
          Description = 'Transfer'#234'ncia'
          Value = '5'
        end>
    end
    object Combo_OperacaoContabil: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Entradas (Receita)'
          ImageIndex = 3
          Value = '4'
        end
        item
          Description = 'Sa'#237'da (Ativo Imobilizado)'
          ImageIndex = 52
          Value = '1'
        end
        item
          Description = 'Sa'#237'da (Despesa)'
          ImageIndex = 4
          Value = '3'
        end
        item
          Description = 'Aporte'
          Value = '5'
        end
        item
          Description = 'Retirada'
          Value = '6'
        end
        item
          Description = 'Transfer'#234'ncia'
          Value = '7'
        end>
    end
    object Lista_GrupoContabilTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoContabilTodos
    end
    object Lista_GrupoContabilAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoContabiAtivos
      Properties.PopupAlignment = taRightJustify
    end
    object Lista_GrupoContabilSaidas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoContabilSaidas
    end
    object Lista_GrupoContabilEntradas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoContabiEntradas
    end
    object Lista_BalanceteGrupoDescricao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'BALANCETE_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsBalanceteGrupo
    end
    object Lista_PlanoContasAtivo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPlanoContasAtivo
    end
    object Lista_PlanoContasTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPlanoContasTodos
    end
    object Lista_PlanoContasReceitas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPlanoContasReceitas
    end
    object Combo_Periodo: TcxEditRepositoryImageComboBoxItem
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
          Value = '3'
        end>
    end
    object Combo_SituacaoPagamento: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Pendente'
          ImageIndex = 56
          Value = '1'
        end
        item
          Description = 'Pagamento Parcial'
          ImageIndex = 57
          Value = '2'
        end
        item
          Description = 'Quitado'
          ImageIndex = 58
          Value = '3'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = '4'
        end>
    end
    object Combo_SituacaoCompLocal: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Ativo'
          ImageIndex = 2
          Value = '1'
        end
        item
          Description = 'Isento'
          ImageIndex = 33
          Value = '2'
        end>
    end
    object Combo_SituacaoCompGeralImg: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          ImageIndex = 2
          Value = '1'
        end
        item
          ImageIndex = 46
          Value = '2'
        end
        item
          ImageIndex = 6
          Value = '3'
        end
        item
          ImageIndex = 7
          Value = '4'
        end>
    end
    object Combo_PeriodoLimitado: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = #218'nico'
          ImageIndex = 0
          Value = '2'
        end
        item
          Description = 'Determinado'
          Value = '3'
        end>
    end
    object Combo_SituacaoCompGeral: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Ativo'
          ImageIndex = 2
          Value = '1'
        end
        item
          Description = 'Inativo'
          ImageIndex = 46
          Value = '2'
        end
        item
          Description = 'Conclu'#237'do'
          ImageIndex = 6
          Value = '3'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = '4'
        end>
    end
    object Lista_BalanceteGrupoSigla: TcxEditRepositoryLookupComboBoxItem
      Properties.Alignment.Horz = taCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'BALANCETE_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'SIGLA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsBalanceteGrupo
    end
    object Lista_CentroCustoTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CENTRO_CUSTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCentroCustoTodos
    end
    object Lista_CentroCustoAtivo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CENTRO_CUSTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCentroCustoAtivo
    end
    object Lista_CompReceitassTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCompReceitaTodos
    end
    object Combo_SituacaoBoleto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Aberto'
          ImageIndex = 47
          Value = '1'
        end
        item
          Description = 'Pago'
          ImageIndex = 2
          Value = '2'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 33
          Value = '3'
        end
        item
          Description = 'Todos'
          Value = ''
        end>
    end
    object Lista_PlanoContasDespTodas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPlanoContasDespesasTodos
    end
    object Lista_PlanoContasDespAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPlanoContasDespesasAtivo
    end
    object Lista_CompSaidasTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCompSaidaTodos
    end
    object ComboEspeciePagamento: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Dinheiro'
          ImageIndex = 53
          Value = 'D'
        end
        item
          Description = 'Cheque'
          ImageIndex = 51
          Value = 'C'
        end
        item
          Description = 'Transf./Dep'#243'sito'
          ImageIndex = 54
          Value = 'T'
        end
        item
          Description = 'Boleto'
          ImageIndex = 64
          Value = 'B'
        end
        item
          Description = 'D'#233'bito Autom'#225'tico'
          Value = 'A'
        end
        item
          Description = 'Cart'#227'o'
          Value = 'O'
        end>
    end
    object ComboSituacaoPagamento: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Aguardando'
          ImageIndex = 8
          Value = '1'
        end
        item
          Description = 'Quitado Parcialmente'
          ImageIndex = 45
          Value = '2'
        end
        item
          Description = 'Quitado'
          ImageIndex = 6
          Value = '3'
        end
        item
          Description = 'Cancelado'
          Value = '4'
        end
        item
          Description = 'Excluido'
          Value = '5'
        end>
    end
    object ComboDespesaReceitaOutros: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Despesa'
          ImageIndex = 4
          Value = 'D'
        end
        item
          Description = 'Receita'
          ImageIndex = 3
          Value = 'R'
        end
        item
          Description = 'Aporte'
          Value = 'AR'
        end
        item
          Description = 'Retirada'
          Value = 'AD'
        end>
    end
    object Combo_OperacaoLivroCaixa: TcxEditRepositoryImageComboBoxItem
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
          ImageIndex = 30
          Value = 'TR'
        end
        item
          ImageIndex = 31
          Value = 'TD'
        end
        item
          ImageIndex = 58
          Value = 'AR'
        end
        item
          ImageIndex = 56
          Value = 'AD'
        end
        item
          ImageIndex = 30
          Value = 'PR'
        end
        item
          ImageIndex = 17
          Value = 'PD'
        end>
    end
    object Lista_CaixaTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCaixa
    end
    object Combo_CaixaSituacao: TcxEditRepositoryImageComboBoxItem
      Properties.Images = imgCaixa
      Properties.Items = <
        item
          Description = 'Caixa Principal'
          ImageIndex = 3
          Value = '0'
        end
        item
          Description = 'Saldo Positivo'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Saldo Negativo'
          ImageIndex = 1
          Value = '2'
        end
        item
          Description = 'Caixa Livre'
          ImageIndex = 2
          Value = '3'
        end>
    end
    object Lista_PessoaTodas: TcxEditRepositoryLookupComboBoxItem
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
    object Combo_HonorarioPeriodo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Mensal Ilimitado'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Semanal'
          Value = '2'
        end
        item
          Description = 'Mensal Determinado'
          Value = '8'
        end
        item
          Description = 'Bimestral Ilimitado'
          Value = '4'
        end
        item
          Description = 'Trimestral Ilimitado'
          Value = '6'
        end
        item
          Description = 'Personalizado'
          Value = '9'
        end
        item
          Description = 'Anual'
          Value = '5'
        end
        item
          Description = 'Quinzenal'
          Value = '3'
        end>
    end
    object Combo_ContratoItemSituacao: TcxEditRepositoryImageComboBoxItem
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
          Value = '2'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = '3'
        end
        item
          Description = 'Aguardando Ativa'#231#227'o'
          ImageIndex = 8
          Value = '0'
        end>
    end
    object ComboDespesaReceitaSomente: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Despesa'
          ImageIndex = 0
          Value = 'D'
        end
        item
          Description = 'Receita'
          Value = 'R'
        end>
    end
    object Lista_CaixaAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCaixaAtivos
    end
    object Lista_CaixaTodosAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCaixaTodosAtivos
    end
    object Lista_ReservasAtivas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'RESERVA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsReservasAtivas
    end
    object Combo_DocumentoTipo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Doc. Fiscal'
          ImageIndex = 0
          Value = 'F'
        end
        item
          Description = 'Recibo Sistema'
          Value = 'R'
        end
        item
          Description = 'Extrato Banc.'
          Value = 'E'
        end
        item
          Description = 'Doc. Pendente'
          Value = '0'
        end
        item
          Description = 'Recibo Externo'
          Value = 'B'
        end
        item
          Description = 'Ent. Boleto'
          Value = 'EB'
        end
        item
          Description = 'Ent. Recibo'
          Value = 'ER'
        end
        item
          Description = 'Transf. Banc.'
          Value = 'T'
        end
        item
          Description = 'Ent. PIX'
          Value = 'P'
        end>
    end
    object Combo_ReferenciaPeriodo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Ano/M'#234's Vencimento'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Ano/M'#234's Anterior'
          Value = '2'
        end>
    end
    object Combo_ReferenciaTipo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Data Aquisi'#231#227'o'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Ano/M'#234's'
          Value = '2'
        end>
    end
    object Lista_CaixaResumo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'RESUMO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCaixa
    end
    object Lista_TipoDespesaTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TIPO_DESPESA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoDespesaTodos
    end
    object Lista_TipoDespesaAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TIPO_DESPESA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.GridLines = glVertical
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoDespesaAtivos
    end
    object Combo_DocTipoLista: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Doc. Fiscal'
          ImageIndex = 0
          Value = 'F'
        end
        item
          Description = 'Recibo Sistema'
          Value = 'R'
        end
        item
          Description = 'Extrato Banc.'
          Value = 'E'
        end
        item
          Description = 'Recibo Externo'
          Value = 'B'
        end
        item
          Description = 'Transf. Banc.'
          Value = 'T'
        end
        item
          Description = 'Doc. Pendente'
          Value = '0'
        end>
    end
    object Combo_FaturaTipo: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Boleto'
          ImageIndex = 44
          Value = 'B'
        end
        item
          Description = 'PIX'
          ImageIndex = 52
          Value = 'P'
        end
        item
          Description = 'Recibo'
          ImageIndex = 2
          Value = 'R'
        end>
    end
  end
  object sqlGrupoContabilTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
        'CONTABIL_GRUPO'#13#10'ORDER BY DESCRICAO')
    Left = 296
    Top = 16
    object sqlGrupoContabilTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilTodosCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilTodosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoContabilTodos: TDataSource
    DataSet = sqlGrupoContabilTodos
    Left = 296
    Top = 72
  end
  object sqlGrupoContabilAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
        'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 176
    Top = 16
    object sqlGrupoContabilAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilAtivosCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilAtivosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoContabiAtivos: TDataSource
    DataSet = sqlGrupoContabilAtivos
    Left = 176
    Top = 72
  end
  object sqlGrupoContabilSaidas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
        'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'1'#39#13#10'ORDE' +
        'R BY DESCRICAO')
    Left = 420
    Top = 16
    object sqlGrupoContabilSaidasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilSaidasCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilSaidasBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoContabilSaidas: TDataSource
    DataSet = sqlGrupoContabilSaidas
    Left = 420
    Top = 72
  end
  object sqlGrupoContabilEntradas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
        'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'2'#39#13#10'ORDE' +
        'R BY DESCRICAO')
    Left = 562
    Top = 16
    object sqlGrupoContabilEntradasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilEntradasCONTABIL_GRUPO_ID: TBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilEntradasBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoContabiEntradas: TDataSource
    DataSet = sqlGrupoContabilEntradas
    Left = 562
    Top = 72
  end
  object sqlBalanceteGrupo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, BALANCETE_GRUPO_ID, SIGLA'#13#10'FROM T_BALANCETE_GR' +
        'UPO'#13#10'ORDER BY DESCRICAO')
    Left = 722
    Top = 16
    object sqlBalanceteGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlBalanceteGrupoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlBalanceteGrupoSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
  end
  object dtsBalanceteGrupo: TDataSource
    DataSet = sqlBalanceteGrupo
    Left = 722
    Top = 68
  end
  object sqlPlanoContasAtivo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM T_CONTABIL_CONTA'#13#10'WHER' +
        'E SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 296
    Top = 138
    object sqlPlanoContasAtivoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsPlanoContasAtivo: TDataSource
    DataSet = sqlPlanoContasAtivo
    Left = 300
    Top = 192
  end
  object sqlPlanoContasTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM T_CONTABIL_CONTA'#13#10'ORDE' +
        'R BY DESCRICAO')
    Left = 862
    Top = 139
    object sqlPlanoContasTodosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsPlanoContasTodos: TDataSource
    DataSet = sqlPlanoContasTodos
    Left = 862
    Top = 191
  end
  object sqlPlanoContasReceitas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
        #13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_GRUPO CB ' +
        'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
        'UACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 4'#13#10'ORDER BY DESCRICAO')
    Left = 176
    Top = 144
    object sqlPlanoContasReceitasCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasReceitasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsPlanoContasReceitas: TDataSource
    DataSet = sqlPlanoContasReceitas
    Left = 176
    Top = 196
  end
  object sqlCentroCustoTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_CE' +
        'NTRO_CUSTO'#13#10'ORDER BY DESCRICAO')
    Left = 861
    Top = 16
    object sqlCentroCustoTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCentroCustoTodosCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoTodosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCentroCustoTodos: TDataSource
    DataSet = sqlCentroCustoTodos
    Left = 861
    Top = 68
  end
  object sqlCentroCustoAtivo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_CE' +
        'NTRO_CUSTO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'ORDER BY DESCRICAO')
    Left = 425
    Top = 270
    object sqlCentroCustoAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCentroCustoAtivoCENTRO_CUSTO_ID: TBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCentroCustoAtivo: TDataSource
    DataSet = sqlCentroCustoAtivo
    Left = 425
    Top = 322
  end
  object sqlCompReceitaTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT (CC.DESCRICAO  || '#39' >> '#39' || BG.SIGLA) AS DESCRICAO, CC.CO' +
        'NTABIL_CONTA_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_BALA' +
        'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
        'ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
        'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUACAO = '#39'A'#39#13#10'  AND CB.O' +
        'PERACAO = 4'#13#10'ORDER BY CC.DESCRICAO')
    Left = 424
    Top = 140
    object sqlCompReceitaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 67
    end
    object sqlCompReceitaTodosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompReceitaTodos: TDataSource
    DataSet = sqlCompReceitaTodos
    Left = 424
    Top = 196
  end
  object sqlPlanoContasDespesasTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
        #13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_GRUPO CB ' +
        'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
        'UACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 563
    Top = 139
    object sqlPlanoContasDespesasTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsPlanoContasDespesasTodos: TDataSource
    DataSet = sqlPlanoContasDespesasTodos
    Left = 567
    Top = 195
  end
  object dtsPlanoContasDespesasAtivo: TDataSource
    DataSet = sqlPlanoContasDespesasAtivo
    Left = 722
    Top = 192
  end
  object sqlPlanoContasDespesasAtivo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
        #13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_GRUPO CB ' +
        'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
        'UACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 3'#13#10'ORDER BY DESCRICAO')
    Left = 722
    Top = 136
    object sqlPlanoContasDespesasAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 44
    Top = 12
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
  end
  object sqlCompSaidaTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT (CC.DESCRICAO  || '#39' >> '#39' || BG.SIGLA) AS DESCRICAO, CC.CO' +
        'NTABIL_CONTA_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_BALA' +
        'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
        'ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
        'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUACAO = '#39'A'#39#13#10'  AND CB.O' +
        'PERACAO <> 4'#13#10'ORDER BY CC.DESCRICAO')
    Left = 304
    Top = 268
    object sqlCompSaidaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 67
    end
    object sqlCompSaidaTodosCONTABIL_CONTA_ID: TBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompSaidaTodos: TDataSource
    DataSet = sqlCompSaidaTodos
    Left = 304
    Top = 324
  end
  object sqlCabecalho: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT BALANCETE_GRUPO_ID, CABECALHO'#13#10'FROM T_BALANCETE_GRUPO'#13#10'WH' +
        'ERE BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID')
    Left = 176
    Top = 268
    ParamData = <
      item
        Name = 'BALANCETE_GRUPO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlCabecalhoBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCabecalhoCABECALHO: TBlobField
      FieldName = 'CABECALHO'
    end
    object sqlCabecalhoTEXTO_CABECALHO: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'TEXTO_CABECALHO'
    end
  end
  object dtsCabecalho: TDataSource
    DataSet = sqlCabecalho
    Left = 176
    Top = 324
  end
  object sqlCaixa: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CAIXA_ID, RESUMO'#13#10'FROM J_CAIXA'#13#10'ORDER BY DESCR' +
        'ICAO')
    Left = 529
    Top = 270
    object sqlCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlCaixaCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlCaixaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
  end
  object dtsCaixa: TDataSource
    DataSet = sqlCaixa
    Left = 529
    Top = 322
  end
  object imgCaixa: TImageList
    DrawingStyle = dsTransparent
    Left = 50
    Top = 190
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004444
      4400444444004444440044444400444444004444440000000000000000000000
      000000000000000000000000000000000000000000000000000099330000E3A1
      6C00FBC58E00F6BA7E00F2B27100ECA55F00E69A4E00E08E3D00DA822A00D679
      1D00C25D05009933000000000000000000000000000000669900006699000066
      9900006699000066990000669900006699000066990000669900006699000066
      9900006699000066990000669900000000000000000044444400444444004444
      4400444444004444440044444400444444004444440044444400444444004444
      4400444444004444440044444400000000000000000000000000000000004444
      4400D6BEAE00D6BEAE00D6BEAE00D6BEAE004444440000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000FCC79100F8BF8500F4B67800EEAB6700E89E5400E2934300DC863300D77C
      210099330000000000000000000000000000006699005785F3004C78F1004B76
      F1004B76F1004A75F1004974F1004974F1004873F1004772F1004772F1004772
      F1004772F1004772F100446DF0000066990000000000444444007272CA007272
      CA007272CA007272CA007272CA007272CA007272CA007272CA007272CA007272
      CA007272CA007272CA0044444400000000000000000000000000000000004444
      4400D6BEAE00D6BEAE00D6BEAE00D6BEAE004444440000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000F1B57F00FAC38B00F6BA7E00F1B06F00EBA45D00E5984B00DE8C3A00D176
      2100993300000000000000000000000000000066990094D7FF0083BCFF007FB6
      FF0079B0FF0074AAFF006EA3FF00699DFF006598FF005F92FF005B8CFF005887
      FF005384FF005180FF004570F6000066990000000000444444005656C2005656
      C2005656C2005656C2005656C20076767600767676005656C2005656C2005656
      C2005656C2005656C20044444400000000000000000044444400444444004444
      4400DAC6BA00DAC6BA00DAC6BA00DAC6BA004444440044444400444444004444
      4400444444004444440044444400000000000000000000000000000000000000
      000099330000FCC79100F8BD8300F3B47500EDA96500E89E5400E19141009933
      000000000000000000000000000000000000006699009BE2FF0090CBFF008CC7
      FF0088C2FF0083BCFF007FB6FF0079B0FF0074AAFF006FA4FF00699EFF006598
      FF006091FF005C8DFF004A75F6000066990000000000444444004242BA004242
      BA004242BA004242BA004242BA00B6B6B600B6B6B6004242BA004242BA004242
      BA004242BA004242BA0044444400000000000000000044444400EEE2DE00DAC6
      BA00DAC6BA00DAC6BA00DAC6BA00DAC6BA00DAC6BA00EEE2DE005A5A5A00EAEA
      EA00EAEAEA00EAEAEA0044444400000000000000000000000000000000000000
      00000000000099330000DC945900EDAC6F00E7A26100CD7C3D00993300000000
      000000000000000000000000000000000000006699009DE4FF009BDAFF0098D5
      FF0094D0FF0090CBFF008DC8FF0088C2FF0083BCFF007DB6FF0079B0FF0074AA
      FF006EA3FF00699EFF004F7CF6000066990000000000444444002E2E76002E2E
      76002E2E76002E2E76002E2E7600EEEEEE00EEEEEE002E2E76002E2E76002E2E
      76002E2E76002E2E760044444400000000000000000044444400A69A9600EAEA
      EA00DECEC200DECEC200DECEC200DECEC200EAEAEA00A69A96009E9E9E00EAEA
      EA00EAEAEA00EAEAEA0044444400000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000000000000000
      000000000000000000000000000000000000006699009DE4FF009DDBFF009DDB
      FF009DDBFF009BDAFF0098D5FF0094D0FF0090CBFF008CC7FF0088C2FF0083BC
      FF007DB6FF0079B0FF005684F6000066990000000000444444004242BA004242
      BA004242BA004242BA004242BA0076767600767676004242BA004242BA004242
      BA004242BA004242BA004444440000000000000000000000000044444400AEA6
      9E00F2EAE600E2D2CA00E2D2CA00F2EAE600AEA69E00AAAAAA00DADADA00EAEA
      EA00EAEAEA00EAEAEA0044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006699009DE2FF009DE0FF009DDB
      FF009DDBFF009DDBFF009DDBFF009DDBFF009BDAFF0097D4FF0094D0FF0090CB
      FF008CC7FF0088C2FF005C8BF6000066990000000000444444007272CA007272
      CA007272CA007272CA007272CA007272CA007272CA007272CA007272CA007272
      CA007272CA007272CA0044444400000000000000000000000000000000004444
      4400B2AEA600F2EAE600F2EAE600B2AEA600AAAAAA00DADADA00EAEAEA00DADA
      DA00EAEAEA00DADADA0044444400000000000000000000000000000000000000
      0000000000000000000006699E0006699E0006699E0006699E00000000000000
      000000000000000000000000000000000000006699009DE2FF009DE0FF009DDB
      FF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009BD8
      FF0097D4FF0094D0FF006292F6000066990000000000444444007272CA005E5E
      7A003E3E3E004E4E6E006E6EAE007272CA007272CA006E6EAE004E4E6E003E3E
      3E005E5E7A007272CA0044444400000000000000000000000000000000000000
      0000444444004444440044444400AAAAAA00DADADA00DADADA00DADADA00DADA
      DA00DADADA00DADADA0044444400000000000000000000000000000000000000
      00000000000006699E0053A2D30075B2F50068A5F3003F88D40006699E000000
      000000000000000000000000000000000000006699009DE2FF009DE0FF009DDB
      FF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009DDBFF009DDB
      FF009DDBFF009DDBFF006697F6000066990000000000444444007E7EA6004A4A
      4A00DEDEDE00A6A6A6005E5E7A007272CA007272CA005E5E7A00A6A6A600DEDE
      DE004A4A4A007E7EA60044444400000000000000000000000000000000000000
      0000000000000000000044444400DADADA00DADADA00DADADA00DADADA00DADA
      DA00CECECE00BABABA0044444400000000000000000000000000000000000000
      000006699E005DABD60092CEFF008AC4FF007EB6FF0073A9FF003F88D4000669
      9E0000000000000000000000000000000000006699009CE7FF009CE7FF009CE7
      FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF009DE4FF006697F600006699000000000000000000444444004444
      44006E6E6E00DEDEDE006E6E6E006E6E6E006E6E6E006E6E6E00DEDEDE006E6E
      6E00444444004444440000000000000000000000000000000000000000000000
      0000000000000000000044444400DADADA00DADADA00DADADA00DADADA00CECE
      CE00BABABA00AAAAAA0044444400000000000000000000000000000000000000
      000006699E0089CBF30097D4FF008EC9FF0085BEFF007AB1FF00619AF5000669
      9E0000000000000000000000000000000000006699002A5ED2002A5ED2002A5E
      D2002A5ED2002A5ED2002A5ED2002A5ED2002A5ED2002A5ED2002A5ED2002A5E
      D2002A5ED2002A5ED2002A5ED200006699000000000000000000000000000000
      000044444400B6B6B600DEDEDE00DEDEDE00DEDEDE00DEDEDE00B6B6B6004444
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400CECECE00CECECE00CECECE00CECECE00CECE
      CE00FEFEFE00CECECE0044444400000000000000000000000000000000000000
      000006699E0089CBF30099D6FF0093D0FF008AC4FF0080B8FF0068A5F3000669
      9E0000000000000000000000000000000000006699006396FF006396FF006396
      FF006497FF006396FF006497FF006396FF006396FF0000669900006699000066
      9900006699000066990000669900000000000000000000000000000000000000
      0000000000004444440044444400444444004444440044444400444444000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400DADADA00DADADA00DADADA00DADADA00DADA
      DA00DADADA004444440000000000000000000000000000000000000000000000
      000006699E005DABD6009DDBFF0097D4FF0090CBFF0085BEFF004A94D6000669
      9E00000000000000000000000000000000000066990071A8DF0085BEFF0085BE
      FF0085BEFF0085BEFF0084BDFF0085BEFF0071A8DF0000669900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400444444004444440044444400444444004444
      4400444444000000000000000000000000000000000000000000000000000000
      00000000000006699E005DABD60089CBF30083C4F30053A2D30006699E000000
      00000000000000000000000000000000000000000000006699009DE2FF009DE4
      FF009DE4FF009DE4FF009DE4FF009DE2FF000066990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006699E0006699E0006699E0006699E00000000000000
      0000000000000000000000000000000000000000000000000000006699000066
      9900006699000066990000669900006699000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFC003FFFFFFFFE07FC0038001
      8001E07FE00700008001E07FE007000080018001F00F000080018001F81F0000
      80018001FC3F00008001C001FFFF00008001E001FC3F00008001F001F81F0000
      8001FC01F00F0000C003FC01F00F0000F00FFC01F00F0001F81FFC03F00F003F
      FFFFFC07F81F807FFFFFFFFFFC3FC0FF00000000000000000000000000000000
      000000000000}
  end
  object sqlPessoasTodas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT NOME, PESSOA_ID'#13#10'FROM J_PESSOA'#13#10'ORDER BY NOME')
    Left = 752
    Top = 272
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
    Left = 752
    Top = 328
  end
  object dtsCaixaAtivos: TDataSource
    DataSet = sqlCaixaAtivos
    Left = 622
    Top = 321
  end
  object sqlCaixaAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CAIXA_ID'#13#10'FROM J_CAIXA'#13#10'WHERE SITUACAO = '#39'A'#39#13#10 +
        '  AND (INTERNO IS NULL OR INTERNO = '#39'N'#39')'#13#10'ORDER BY DESCRICAO')
    Left = 622
    Top = 269
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object FMTBCDField1: TBCDField
      FieldName = 'CAIXA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object sqlCaixaTodosAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, CAIXA_ID, RESUMO'#13#10'FROM J_CAIXA'#13#10'WHERE SITUACAO' +
        ' = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 854
    Top = 280
    object sqlCaixaTodosAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlCaixaTodosAtivosCAIXA_ID: TBCDField
      FieldName = 'CAIXA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlCaixaTodosAtivosRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 30
    end
  end
  object dtsCaixaTodosAtivos: TDataSource
    DataSet = sqlCaixaTodosAtivos
    Left = 854
    Top = 329
  end
  object sqlReservasAtivas: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, RESERVA_ID'#13#10'FROM T_RESERVA'#13#10'WHERE SITUACAO = '#39 +
        'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 166
    Top = 392
    object sqlReservasAtivasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlReservasAtivasRESERVA_ID: TBCDField
      FieldName = 'RESERVA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
  end
  object dtsReservasAtivas: TDataSource
    DataSet = sqlReservasAtivas
    Left = 166
    Top = 441
  end
  object sqlTipoDespesaTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, TIPO_DESPESA_iD'#13#10'FROM J_TIPO_DESPESA'#13#10'ORDER BY' +
        ' DESCRICAO')
    Left = 286
    Top = 392
    object sqlTipoDespesaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlTipoDespesaTodosTIPO_DESPESA_ID: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
  end
  object dtsTipoDespesaTodos: TDataSource
    DataSet = sqlTipoDespesaTodos
    Left = 286
    Top = 441
  end
  object sqlTipoDespesaAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, TIPO_DESPESA_iD'#13#10'FROM J_TIPO_DESPESA'#13#10'WHERE SI' +
        'TUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 406
    Top = 400
    object StringField2: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object FMTBCDField2: TBCDField
      FieldName = 'TIPO_DESPESA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
  end
  object dtsTipoDespesaAtivos: TDataSource
    DataSet = sqlTipoDespesaAtivos
    Left = 406
    Top = 449
  end
  object sqlBalanceteAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT DESCRICAO, BALANCETE_GRUPO_ID, SIGLA, PRINCIPAL'#13#10'FROM T_B' +
        'ALANCETE_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO')
    Left = 538
    Top = 400
    object sqlBalanceteAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlBalanceteAtivosBALANCETE_GRUPO_ID: TBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlBalanceteAtivosSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
    object sqlBalanceteAtivosPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 1
    end
  end
  object dtsBalanceteAtivos: TDataSource
    DataSet = sqlBalanceteAtivos
    Left = 538
    Top = 452
  end
  object sqlCompromissoReserva: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT R.*'#13#10'FROM T_LANCAMENTO_COMPROMISSO L'#13#10' LEFT OUTER JOIN T_' +
        'CONTABIL_RESERVA R ON'#13#10'  L.LANCAMENTO_COMPROMISSO_ID = R.LANCAME' +
        'NTO_COMPROMISSO_ID'#13#10' WHERE L.LANCAMENTO_COMPROMISSO_ID = :LANCAM' +
        'ENTO_COMPROMISSO_ID')
    Left = 656
    Top = 399
    ParamData = <
      item
        Name = 'LANCAMENTO_COMPROMISSO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end