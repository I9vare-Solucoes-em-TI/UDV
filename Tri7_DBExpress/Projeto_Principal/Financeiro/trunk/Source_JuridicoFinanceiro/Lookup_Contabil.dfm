object dtmLookupContabil: TdtmLookupContabil
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 540
  Width = 1020
  object cxEditRepository1: TcxEditRepository
    Left = 47
    Top = 108
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
          ImageIndex = 0
          Value = 'D'
        end
        item
          Description = 'Cheque'
          Value = 'C'
        end
        item
          Description = 'Transf.Dep'#243'sito'
          Value = 'T'
        end
        item
          Description = 'Boleto'
          Value = 'B'
        end
        item
          Description = 'D'#233'bito Autom'#225'tico'
          Value = 'A'
        end
        item
          Description = 'Cart'#227'o de Cr'#233'dito'
          Value = 'O'
        end
        item
          Description = 'Cart'#227'o de D'#233'bito'
          Value = 'S'
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
        end
        item
          Description = 'Or'#231'amento'
          Value = 'O'
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
          ImageIndex = 54
          Value = 'TR'
        end
        item
          ImageIndex = 44
          Value = 'TD'
        end
        item
          ImageIndex = 30
          Value = 'AR'
        end
        item
          ImageIndex = 17
          Value = 'AD'
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
        end
        item
          Description = 'Saldo Bloqueado'
          ImageIndex = 4
          Value = '4'
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
          Description = 'Prazo Determinado'
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
        end
        item
          Description = 'Desativado'
          ImageIndex = 33
          Value = '4'
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
      Properties.DropDownWidth = 300
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
          Description = 'Sem Doc.'
          Value = '0'
        end
        item
          Description = 'Protocolo'
          Value = 'P'
        end
        item
          Description = 'Boleto Banc'#225'rio'
          Value = 'B'
        end
        item
          Description = 'Recibo Externo'
          Value = 'X'
        end
        item
          Description = 'Doc. Pendente'
          Value = '1'
        end
        item
          Description = 'Transf. Banc'#225'ria'
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
    object Lista_TipoCarga: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TIPO_CARGA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoCarga
    end
    object Lista_TipoModalidade: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TIPO_MODALIDADE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoModalidade
    end
    object Combo_MesExtenso: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taCenter
      Properties.Items = <
        item
          Description = 'Janeiro'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Fevereiro'
          Value = '2'
        end
        item
          Description = 'Mar'#231'o'
          Value = '3'
        end
        item
          Description = 'Abril'
          Value = '4'
        end
        item
          Description = 'Maio'
          Value = '5'
        end
        item
          Description = 'Junho'
          Value = '6'
        end
        item
          Description = 'Julho'
          Value = '7'
        end
        item
          Description = 'Agosto'
          Value = '8'
        end
        item
          Description = 'Setembro'
          Value = '9'
        end
        item
          Description = 'Outubro'
          Value = '10'
        end
        item
          Description = 'Novembro'
          Value = '11'
        end
        item
          Description = 'Dezembro'
          Value = '12'
        end>
    end
    object Combo_TipoCentroCusto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Item Individual'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Grupo'
          Value = '2'
        end>
    end
    object Lista_CentroCustoTipo1: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CENTRO_CUSTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCentroCustoTipo1
    end
  end
  object sqlGrupoContabilTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_' +
      'CONTABIL_GRUPO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 16
    object sqlGrupoContabilTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilTodosCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilTodosBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlGrupoContabilAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 176
    Top = 16
    object sqlGrupoContabilAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilAtivosCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilAtivosBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlGrupoContabilSaidas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'1'#39#13#10'ORDE' +
      'R BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 420
    Top = 16
    object sqlGrupoContabilSaidasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilSaidasCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilSaidasBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlGrupoContabilEntradas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'2'#39#13#10'ORDE' +
      'R BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 562
    Top = 16
    object sqlGrupoContabilEntradasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlGrupoContabilEntradasCONTABIL_GRUPO_ID: TFMTBCDField
      FieldName = 'CONTABIL_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlGrupoContabilEntradasBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlBalanceteGrupo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, BALANCETE_GRUPO_ID, SIGLA'#13#10'FROM J_BALANCETE_GR' +
      'UPO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 722
    Top = 16
    object sqlBalanceteGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlBalanceteGrupoBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlPlanoContasAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM J_CONTABIL_CONTA'#13#10'WHER' +
      'E SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 138
    object sqlPlanoContasAtivoCONTABIL_CONTA_ID: TFMTBCDField
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
  object sqlPlanoContasTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM J_CONTABIL_CONTA'#13#10'ORDE' +
      'R BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 862
    Top = 139
    object sqlPlanoContasTodosCONTABIL_CONTA_ID: TFMTBCDField
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
  object sqlPlanoContasReceitas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
      #13#10'FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN  J_CONTABIL_GRUPO CB ' +
      'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
      'UACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 4'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 176
    Top = 144
    object sqlPlanoContasReceitasCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasReceitasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlCentroCustoTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_CE' +
      'NTRO_CUSTO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 861
    Top = 16
    object sqlCentroCustoTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCentroCustoTodosCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoTodosBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlCentroCustoAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID, '#13#10'    PER' +
      'SONALIZADO, TIPO_ITEM'#13#10'FROM J_CENTRO_CUSTO'#13#10'WHERE SITUACAO = '#39'A'#39 +
      ' '#13#10'  AND TIPO_CENTRO = '#39'1'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 425
    Top = 270
    object sqlCentroCustoAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCentroCustoAtivoCENTRO_CUSTO_ID: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCentroCustoAtivoPERSONALIZADO: TStringField
      FieldName = 'PERSONALIZADO'
      Size = 1
    end
    object sqlCentroCustoAtivoTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
  end
  object dtsCentroCustoAtivo: TDataSource
    DataSet = sqlCentroCustoAtivo
    Left = 425
    Top = 322
  end
  object sqlCompReceitaTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT (CC.DESCRICAO  || '#39' >> '#39' || BG.SIGLA) AS DESCRICAO, CC.CO' +
      'NTABIL_CONTA_ID'#13#10'FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN J_BALA' +
      'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
      'ID'#13#10'  LEFT OUTER JOIN J_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
      'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUACAO = '#39'A'#39#13#10'  AND CB.O' +
      'PERACAO = 4'#13#10'ORDER BY CC.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 424
    Top = 140
    object sqlCompReceitaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 67
    end
    object sqlCompReceitaTodosCONTABIL_CONTA_ID: TFMTBCDField
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
  object sqlPlanoContasDespesasTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
      #13#10'FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN  J_CONTABIL_GRUPO CB ' +
      'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
      'UACAO = '#39'A'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 563
    Top = 139
    object sqlPlanoContasDespesasTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlPlanoContasDespesasAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CB.BALANCETE_GRUPO_ID' +
      #13#10'FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN  J_CONTABIL_GRUPO CB ' +
      'ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SIT' +
      'UACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 3'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 722
    Top = 136
    object sqlPlanoContasDespesasAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlCompSaidaTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT (CC.DESCRICAO  || '#39' >> '#39' || BG.SIGLA) AS DESCRICAO, CC.CO' +
      'NTABIL_CONTA_ID'#13#10'FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN J_BALA' +
      'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
      'ID'#13#10'  LEFT OUTER JOIN J_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
      'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.SITUACAO = '#39'A'#39#13#10'  AND CB.O' +
      'PERACAO <> 4'#13#10'ORDER BY CC.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 304
    Top = 268
    object sqlCompSaidaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 67
    end
    object sqlCompSaidaTodosCONTABIL_CONTA_ID: TFMTBCDField
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
  object sqlCabecalho: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT BALANCETE_GRUPO_ID, CABECALHO'#13#10'FROM J_BALANCETE_GRUPO'#13#10'WH' +
      'ERE BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 176
    Top = 268
    object sqlCabecalhoBALANCETE_GRUPO_ID: TFMTBCDField
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
  object sqlCaixa: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CAIXA_ID, RESUMO'#13#10'FROM J_CAIXA'#13#10'ORDER BY DESCR' +
      'ICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 529
    Top = 270
    object sqlCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlCaixaCAIXA_ID: TFMTBCDField
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
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 50
    Top = 190
    Bitmap = {
      494C010105000900040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F94CEFF0F94CEFF0F94CEFF0F94CEFF0F94CEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000041ADBDFF41ADBDFF41CEEFFF59DEFFFF59DEFFFF59DEFFFF41CEEFFF0F94
      CEFF0F94CEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000041AD
      BDFF41CEEFFF9CE7FFFF9CE7FFFF9CE7FFFF000000FF59DEFFFF59DEFFFF59DE
      FFFF41CEEFFF0F94CEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041ADBDFF41CE
      EFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF000000FF9CE7FFFF9CE7FFFF59DE
      FFFF59DEFFFF41CEEFFF0F94CEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041ADBDFFADF7
      FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF000000FF9CE7FFFF9CE7FFFF9CE7
      FFFF59DEFFFF59DEFFFF0F94CEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041ADBDFFADF7
      FFFFADF7FFFF9CE7FFFF9CE7FFFF000000FF000000FF000000FF9CE7FFFF9CE7
      FFFF9CE7FFFF59DEFFFF0F94CEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041ADBDFFADF7
      FFFFADF7FFFFADF7FFFF9CE7FFFF848484FF000000FF848484FF9CE7FFFF9CE7
      FFFF9CE7FFFF59DEFFFF0F94CEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041ADBDFF41CE
      EFFFADF7FFFFADF7FFFFADF7FFFFADF7FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7
      FFFF9CE7FFFF41CEEFFF0F94CEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000041AD
      BDFF41ADBDFF41ADBDFF41ADBDFF41ADBDFF41ADBDFF41ADBDFF41ADBDFF41AD
      BDFF41ADBDFF41ADBDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000041ADBDFF9CE7FFFF0F94CEFF00000000000000000000000041ADBDFF9CE7
      FFFF0F94CEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000041ADBDFF9CE7FFFF0F94CEFF00000000000000000000000041ADBDFF9CE7
      FFFF0F94CEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000041ADBDFF41CEEFFF41CEEFFF0F94CEFF0F94CEFF0F94CEFF41CEEFFF41CE
      EFFF0F94CEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000041ADBDFF41CEEFFF9CE7FFFF9CE7FFFF9CE7FFFF41CEEFFF0F94
      CEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000041ADBDFF41ADBDFF41ADBDFF41ADBDFF0F94CEFF0000
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
      0000000000000000000000000000000000000000000000000000993200FF9932
      00FF993200FF993200FF993200FF993200FF993200FF993200FF993200FF9932
      00FF993200FF993200FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004343
      43FF434343FF434343FF434343FF434343FF434343FF00000000000000000000
      0000000000000000000000000000000000000000000000000000993200FFE3A1
      6BFFFBC58EFFF6BA7DFFF2B270FFECA55EFFE69A4DFFE08E3CFFDA8229FFD678
      1CFFC25C04FF993200FF000000000000000000000000006599FF006599FF0065
      99FF006599FF006599FF006599FF006599FF006599FF006599FF006599FF0065
      99FF006599FF006599FF006599FF0000000000000000434343FF434343FF4343
      43FF434343FF434343FF434343FF434343FF434343FF434343FF434343FF4343
      43FF434343FF434343FF434343FF000000000000000000000000000000004343
      43FFD6BEAEFFD6BEAEFFD6BEAEFFD6BEAEFF434343FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000009932
      00FFFCC791FFF8BF85FFF4B677FFEEAB66FFE89E53FFE29342FFDC8632FFD77B
      20FF993200FF000000000000000000000000006599FF5685F3FF4B77F1FF4A75
      F1FF4A75F1FF4974F1FF4873F1FF4873F1FF4772F1FF4671F1FF4671F1FF4671
      F1FF4671F1FF4671F1FF436CF0FF006599FF00000000434343FF7171CAFF7171
      CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171
      CAFF7171CAFF7171CAFF434343FF000000000000000000000000000000004343
      43FFD6BEAEFFD6BEAEFFD6BEAEFFD6BEAEFF434343FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000009932
      00FFF1B57EFFFAC38BFFF6BA7DFFF1B06EFFEBA45CFFE5984AFFDE8C39FFD175
      20FF993200FF000000000000000000000000006599FF94D7FFFF83BCFFFF7EB6
      FFFF78B0FFFF73AAFFFF6DA3FFFF689DFFFF6498FFFF5E92FFFF5A8CFFFF5787
      FFFF5284FFFF5080FFFF446FF6FF006599FF00000000434343FF5555C2FF5555
      C2FF5555C2FF5555C2FF5555C2FF757575FF757575FF5555C2FF5555C2FF5555
      C2FF5555C2FF5555C2FF434343FF0000000000000000434343FF434343FF4343
      43FFDAC6BAFFDAC6BAFFDAC6BAFFDAC6BAFF434343FF434343FF434343FF4343
      43FF434343FF434343FF434343FF000000000000000000000000000000000000
      0000993200FFFCC791FFF8BD83FFF3B474FFEDA964FFE89E53FFE19140FF9932
      00FF00000000000000000000000000000000006599FF9BE2FFFF90CBFFFF8CC7
      FFFF88C2FFFF83BCFFFF7EB6FFFF78B0FFFF73AAFFFF6EA4FFFF689EFFFF6498
      FFFF5F91FFFF5B8DFFFF4974F6FF006599FF00000000434343FF4141BAFF4141
      BAFF4141BAFF4141BAFF4141BAFFB6B6B6FFB6B6B6FF4141BAFF4141BAFF4141
      BAFF4141BAFF4141BAFF434343FF0000000000000000434343FFEEE2DEFFDAC6
      BAFFDAC6BAFFDAC6BAFFDAC6BAFFDAC6BAFFDAC6BAFFEEE2DEFF595959FFEAEA
      EAFFEAEAEAFFEAEAEAFF434343FF000000000000000000000000000000000000
      000000000000993200FFDC9458FFEDAC6EFFE7A260FFCD7B3CFF993200FF0000
      000000000000000000000000000000000000006599FF9DE4FFFF9BDAFFFF98D5
      FFFF94D0FFFF90CBFFFF8DC8FFFF88C2FFFF83BCFFFF7CB6FFFF78B0FFFF73AA
      FFFF6DA3FFFF689EFFFF4E7BF6FF006599FF00000000434343FF2D2D75FF2D2D
      75FF2D2D75FF2D2D75FF2D2D75FFEEEEEEFFEEEEEEFF2D2D75FF2D2D75FF2D2D
      75FF2D2D75FF2D2D75FF434343FF0000000000000000434343FFA69A96FFEAEA
      EAFFDECEC2FFDECEC2FFDECEC2FFDECEC2FFEAEAEAFFA69A96FF9E9E9EFFEAEA
      EAFFEAEAEAFFEAEAEAFF434343FF000000000000000000000000000000000000
      00000000000000000000993200FF993200FF993200FF993200FF000000000000
      000000000000000000000000000000000000006599FF9DE4FFFF9DDBFFFF9DDB
      FFFF9DDBFFFF9BDAFFFF98D5FFFF94D0FFFF90CBFFFF8CC7FFFF88C2FFFF83BC
      FFFF7CB6FFFF78B0FFFF5584F6FF006599FF00000000434343FF4141BAFF4141
      BAFF4141BAFF4141BAFF4141BAFF757575FF757575FF4141BAFF4141BAFF4141
      BAFF4141BAFF4141BAFF434343FF000000000000000000000000434343FFAEA6
      9EFFF2EAE6FFE2D2CAFFE2D2CAFFF2EAE6FFAEA69EFFAAAAAAFFDADADAFFEAEA
      EAFFEAEAEAFFEAEAEAFF434343FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006599FF9DE2FFFF9DE0FFFF9DDB
      FFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9BDAFFFF97D4FFFF94D0FFFF90CB
      FFFF8CC7FFFF88C2FFFF5B8BF6FF006599FF00000000434343FF7171CAFF7171
      CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171CAFF7171
      CAFF7171CAFF7171CAFF434343FF000000000000000000000000000000004343
      43FFB2AEA6FFF2EAE6FFF2EAE6FFB2AEA6FFAAAAAAFFDADADAFFEAEAEAFFDADA
      DAFFEAEAEAFFDADADAFF434343FF000000000000000000000000000000000000
      0000000000000000000005689EFF05689EFF05689EFF05689EFF000000000000
      000000000000000000000000000000000000006599FF9DE2FFFF9DE0FFFF9DDB
      FFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9BD8
      FFFF97D4FFFF94D0FFFF6192F6FF006599FF00000000434343FF7171CAFF5D5D
      79FF3D3D3DFF4D4D6DFF6D6DAEFF7171CAFF7171CAFF6D6DAEFF4D4D6DFF3D3D
      3DFF5D5D79FF7171CAFF434343FF000000000000000000000000000000000000
      0000434343FF434343FF434343FFAAAAAAFFDADADAFFDADADAFFDADADAFFDADA
      DAFFDADADAFFDADADAFF434343FF000000000000000000000000000000000000
      00000000000005689EFF52A2D3FF74B2F5FF67A5F3FF3E88D4FF05689EFF0000
      000000000000000000000000000000000000006599FF9DE2FFFF9DE0FFFF9DDB
      FFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDBFFFF9DDB
      FFFF9DDBFFFF9DDBFFFF6597F6FF006599FF00000000434343FF7D7DA6FF4949
      49FFDEDEDEFFA6A6A6FF5D5D79FF7171CAFF7171CAFF5D5D79FFA6A6A6FFDEDE
      DEFF494949FF7D7DA6FF434343FF000000000000000000000000000000000000
      00000000000000000000434343FFDADADAFFDADADAFFDADADAFFDADADAFFDADA
      DAFFCECECEFFBABABAFF434343FF000000000000000000000000000000000000
      000005689EFF5CABD6FF92CEFFFF8AC4FFFF7DB6FFFF72A9FFFF3E88D4FF0568
      9EFF00000000000000000000000000000000006599FF9CE7FFFF9CE7FFFF9CE7
      FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7FFFF9CE7
      FFFF9CE7FFFF9DE4FFFF6597F6FF006599FF0000000000000000434343FF4343
      43FF6D6D6DFFDEDEDEFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFDEDEDEFF6D6D
      6DFF434343FF434343FF00000000000000000000000000000000000000000000
      00000000000000000000434343FFDADADAFFDADADAFFDADADAFFDADADAFFCECE
      CEFFBABABAFFAAAAAAFF434343FF000000000000000000000000000000000000
      000005689EFF89CBF3FF97D4FFFF8EC9FFFF85BEFFFF79B1FFFF609AF5FF0568
      9EFF00000000000000000000000000000000006599FF295DD2FF295DD2FF295D
      D2FF295DD2FF295DD2FF295DD2FF295DD2FF295DD2FF295DD2FF295DD2FF295D
      D2FF295DD2FF295DD2FF295DD2FF006599FF0000000000000000000000000000
      0000434343FFB6B6B6FFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFB6B6B6FF4343
      43FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000434343FFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFFEFEFEFFCECECEFF434343FF000000000000000000000000000000000000
      000005689EFF89CBF3FF99D6FFFF93D0FFFF8AC4FFFF80B8FFFF67A5F3FF0568
      9EFF00000000000000000000000000000000006599FF6296FFFF6296FFFF6296
      FFFF6397FFFF6296FFFF6397FFFF6296FFFF6296FFFF006599FF006599FF0065
      99FF006599FF006599FF006599FF000000000000000000000000000000000000
      000000000000434343FF434343FF434343FF434343FF434343FF434343FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000434343FFDADADAFFDADADAFFDADADAFFDADADAFFDADA
      DAFFDADADAFF434343FF00000000000000000000000000000000000000000000
      000005689EFF5CABD6FF9DDBFFFF97D4FFFF90CBFFFF85BEFFFF4994D6FF0568
      9EFF00000000000000000000000000000000006599FF70A8DFFF85BEFFFF85BE
      FFFF85BEFFFF85BEFFFF84BDFFFF85BEFFFF70A8DFFF006599FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000434343FF434343FF434343FF434343FF434343FF4343
      43FF434343FF0000000000000000000000000000000000000000000000000000
      00000000000005689EFF5CABD6FF89CBF3FF83C4F3FF52A2D3FF05689EFF0000
      00000000000000000000000000000000000000000000006599FF9DE2FFFF9DE4
      FFFF9DE4FFFF9DE4FFFF9DE4FFFF9DE2FFFF006599FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000005689EFF05689EFF05689EFF05689EFF000000000000
      0000000000000000000000000000000000000000000000000000006599FF0065
      99FF006599FF006599FF006599FF006599FF0000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object sqlPessoasTodas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT NOME, PESSOA_ID, UTILIZA_BOLETO'#13#10'FROM J_PESSOA'#13#10'ORDER BY ' +
      'NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 752
    Top = 272
    object sqlPessoasTodasNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPessoasTodasPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPessoasTodasUTILIZA_BOLETO: TStringField
      FieldName = 'UTILIZA_BOLETO'
      Size = 1
    end
  end
  object dtsPessoasTodas: TDataSource
    DataSet = sqlPessoasTodas
    Left = 749
    Top = 329
  end
  object dtsCaixaAtivos: TDataSource
    DataSet = sqlCaixaAtivos
    Left = 622
    Top = 321
  end
  object sqlCaixaAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CAIXA_ID'#13#10'FROM J_CAIXA'#13#10'WHERE SITUACAO = '#39'A'#39#13#10 +
      '  AND (INTERNO IS NULL OR INTERNO = '#39'N'#39')'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 622
    Top = 269
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'CAIXA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object sqlCaixaTodosAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CAIXA_ID, RESUMO'#13#10'FROM J_CAIXA'#13#10'WHERE SITUACAO' +
      ' = '#39'A'#39#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 854
    Top = 280
    object sqlCaixaTodosAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlCaixaTodosAtivosCAIXA_ID: TFMTBCDField
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
  object sqlTipoModalidade: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT *'#13#10'FROM J_TIPO_MODALIDADE'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 181
    Top = 407
    object sqlTipoModalidadeTIPO_MODALIDADE_ID: TFMTBCDField
      FieldName = 'TIPO_MODALIDADE_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlTipoModalidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlTipoModalidadeTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object sqlTipoModalidadeSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsTipoModalidade: TDataSource
    DataSet = sqlTipoModalidade
    Left = 173
    Top = 453
  end
  object sqlTipoCarga: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT *'#13#10'FROM J_TIPO_CARGA'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 301
    Top = 407
    object sqlTipoCargaTIPO_CARGA_ID: TFMTBCDField
      FieldName = 'TIPO_CARGA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlTipoCargaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlTipoCargaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsTipoCarga: TDataSource
    DataSet = sqlTipoCarga
    Left = 301
    Top = 461
  end
  object sqlCentroCustoTipo1: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM J_CE' +
      'NTRO_CUSTO'#13#10'WHERE TIPO_ITEM = '#39'1'#39#13#10'  AND TIPO_CENTRO = '#39'1'#39#13#10'ORDE' +
      'R BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 410
    Top = 405
    object StringField2: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCentroCustoTipo1: TDataSource
    DataSet = sqlCentroCustoTipo1
    Left = 410
    Top = 458
  end
  object ClientPrevisaoCaixa: TClientDataSet
    PersistDataPacket.Data = {
      710000009619E0BD01000000180000000400000000000300000071000556414C
      4F52080004000000010007535542545950450200490006004D6F6E657900034D
      4553040001000000000003414E4F0400010000000000084F5045524143414F01
      004900000001000557494454480200020003000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'MES'
        DataType = ftInteger
      end
      item
        Name = 'ANO'
        DataType = ftInteger
      end
      item
        Name = 'OPERACAO'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 529
    Top = 411
    object ClientPrevisaoCaixaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientPrevisaoCaixaMES: TIntegerField
      FieldName = 'MES'
    end
    object ClientPrevisaoCaixaANO: TIntegerField
      FieldName = 'ANO'
    end
    object ClientPrevisaoCaixaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 3
    end
  end
  object dtsPrevisaoCaixa: TDataSource
    DataSet = ClientPrevisaoCaixa
    Left = 525
    Top = 474
  end
end