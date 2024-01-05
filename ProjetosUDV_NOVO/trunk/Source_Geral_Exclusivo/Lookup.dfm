object dtmLookup: TdtmLookup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 516
  Width = 952
  object cxEditRepository1: TcxEditRepository
    Left = 45
    Top = 396
    object cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem
    end
    object cxEditRepository1DateItem1: TcxEditRepositoryDateItem
    end
    object Combo_Sexo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Masculino'
          ImageIndex = 0
          Value = 'M'
        end
        item
          Description = 'Feminino'
          Value = 'F'
        end>
    end
    object Combo_SimNao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taRightJustify
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 6
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          Value = 'N'
        end>
    end
    object Combo_TipoQualificacao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Todos'
          Value = 'TD'
        end
        item
          Description = 'Pessoa Solteira'
          ImageIndex = 0
          Value = 'PS'
        end
        item
          Description = 'Pessoa Jur'#237'dica'
          Value = 'PJ'
        end
        item
          Description = 'Pessoa Casada'
          Value = 'PC'
        end
        item
          Description = 'Im'#243'vel'
          Value = 'IM'
        end
        item
          Description = 'Sistema'
          Value = 'ST'
        end>
    end
    object ListaG_TB_TBTxModeloGrupo: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'TB_TXMODELOGRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_TxModeloGrupo
    end
    object Combo_AtivoInativo: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Ativo'
          ImageIndex = 0
          Value = 'A'
        end
        item
          Description = 'Inativo'
          ImageIndex = 1
          Value = 'I'
        end>
    end
    object Combo_UF: TcxEditRepositoryComboBoxItem
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PR'
        'PI'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
    end
    object Formata_Fone: TcxEditRepositoryMaskItem
      Properties.EditMask = '!\(99\)9999-9999;1;_'
      Properties.MaxLength = 0
      Properties.ValidateOnEnter = False
    end
    object Formata_CPF: TcxEditRepositoryMaskItem
      Properties.EditMask = '999\.999\.999\-99;0;_'
      Properties.MaxLength = 0
    end
    object Formata_CNPJ: TcxEditRepositoryMaskItem
      Properties.EditMask = '99\.999\.999\/9999\-99;0;_'
    end
    object Formata_DataSEMhora: TcxEditRepositoryDateItem
      Properties.SaveTime = False
      Properties.ShowTime = False
    end
    object listaG_Usuario: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'LOGIN'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Usuario
    end
    object Lista_UsuarioSistema: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'LOGIN'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuarioSistema
    end
    object Combo_Sistema: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Registro de Im'#243'veis'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Tabelionato de Notas'
          Value = 2
        end>
    end
    object Lista_UsuarioAssinante: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME_COMPLETO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuarioAssinante
    end
    object Combo_EntradaSaida: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
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
          ImageIndex = 30
          Value = '3'
        end
        item
          Description = 'Retirada'
          ImageIndex = 17
          Value = '4'
        end
        item
          Description = 'Transfer'#234'ncia'
          ImageIndex = 54
          Value = '5'
        end>
    end
    object Combo_TiposValoresMarcacoes: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Fixo'
          ImageIndex = 0
          Value = 'F'
        end
        item
          Description = 'Texto'
          Value = 'T'
        end
        item
          Description = 'Config'
          Value = 'C'
        end
        item
          Description = 'Lista'
          Value = 'L'
        end
        item
          Description = 'Somatorio'
          Value = 'R'
        end
        item
          Description = 'Duplicar'
          Value = 'P'
        end>
    end
    object Combo_Permissao: TcxEditRepositoryCheckBoxItem
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
    end
    object Check_SimNao: TcxEditRepositoryCheckBoxItem
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
    end
    object Combo_Correcao: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 6
          Value = 'C'
        end
        item
          ImageIndex = 7
          Value = 'E'
        end>
    end
    object Lista_CedenteTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CEDENTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCedenteTodos
    end
    object Lista_CedenteAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CEDENTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCedenteAtivos
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
    object Combo_Grau: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'N'#227'o Associado'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Quadro S'#243'cio'
          Value = '1'
        end
        item
          Description = 'Corpo Instrutivo'
          Value = '2'
        end
        item
          Description = 'Corpo do Conselho'
          Value = '3'
        end
        item
          Description = 'Quadro de Mestre'
          Value = '4'
        end>
    end
    object Combo_Situacao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Frequente'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Afastado'
          Value = '2'
        end
        item
          Description = 'Licen'#231'a'
          Value = '3'
        end
        item
          Description = 'Suspenso'
          Value = '4'
        end
        item
          Description = 'Transferido'
          Value = '5'
        end
        item
          Description = 'Falecido'
          Value = '6'
        end
        item
          Description = 'Cadastro Avulso'
          Value = '0'
        end>
    end
    object Lista_GrupoAssociadoTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoTodos
      Properties.PopupAlignment = taRightJustify
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
          Description = 'Mensal'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Uma Vez'
          Value = '2'
        end
        item
          Description = 'Determinado'
          Value = '3'
        end
        item
          Description = 'Bimestral'
          Value = '4'
        end
        item
          Description = 'Trimestral'
          Value = '5'
        end>
    end
    object Combo_SituacaoPagamento: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Pendente'
          ImageIndex = 53
          Value = '1'
        end
        item
          Description = 'Quitado'
          ImageIndex = 6
          Value = '2'
        end
        item
          Description = 'Isento'
          ImageIndex = 33
          Value = '3'
        end>
    end
    object Combo_SimNaoDiferenca: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 3
          Value = 'S'
        end
        item
          Value = 'N'
        end>
    end
    object Combo_SituacaoCompLocal: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
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
      Properties.Images = dtmControles.imgCadBasicos
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
    object Combo_SimNaoImagem: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 6
          Value = 'S'
        end
        item
          ImageIndex = 7
          Value = 'N'
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
    object Lista_ContasAgendadasMensal: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTABIL_CONTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsCompromissoMensal
    end
    object Lista_Pessoas: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPessoas
    end
    object Combo_Obrigatorio: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          ImageIndex = 43
          Value = 'S'
        end
        item
          ImageIndex = 39
          Value = 'N'
        end>
    end
    object Combo_SituacaoCompGeral: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
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
    object Lista_AssociadosAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsAssociadosAtivos
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
    object Lista_GrupoAssociadoAtivo: TcxEditRepositoryLookupComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PESSOA_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsGrupoAtivo
      Properties.PopupAlignment = taRightJustify
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
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aberto'
          ImageIndex = 51
          Value = '1'
        end
        item
          Description = 'Pago'
          ImageIndex = 45
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
    object Combo_Meses: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Janeiro'
          ImageIndex = 0
          Value = '01'
        end
        item
          Description = 'Fevereiro'
          Value = '02'
        end
        item
          Description = 'Mar'#231'o'
          Value = '03'
        end
        item
          Description = 'Abril'
          Value = '04'
        end
        item
          Description = 'Maio'
          Value = '05'
        end
        item
          Description = 'Junho'
          Value = '06'
        end
        item
          Description = 'Julho'
          Value = '07'
        end
        item
          Description = 'Agosto'
          Value = '08'
        end
        item
          Description = 'Setembro'
          Value = '09'
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
    object Combo_Detalhado: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 6
          Value = 'S'
        end
        item
          Value = 'N'
        end
        item
          Value = 'N'
        end
        item
          Description = 'Vinculado'
          ImageIndex = 60
          Value = 'V'
        end>
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
    object Lista_EmailTextoPadrao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'EMAIL_TEXTO_PADRAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsEmailTextoPadrao
    end
    object Combo_TipoCusto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Operacional'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'N'#227'o-Operacional'
          Value = '2'
        end
        item
          Description = 'Repasse'
          Value = '3'
        end>
    end
  end
  object sqlG_TB_TxModeloGrupo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT TB_TXMODELOGRUPO_ID, DESCRICAO'#13#10'FROM G_TB_TXMODELOGRUPO'#13#10 +
      'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 406
    Top = 387
    object sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TFMTBCDField
      FieldName = 'TB_TXMODELOGRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_TxModeloGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsG_TB_TxModeloGrupo: TDataSource
    DataSet = sqlG_TB_TxModeloGrupo
    Left = 406
    Top = 443
  end
  object sqlG_Usuario: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM G_USUARIO'#13#10'ORDER BY LOGIN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 508
    Top = 396
    object sqlG_UsuarioUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_UsuarioTROCARSENHA: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object sqlG_UsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object sqlG_UsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object sqlG_UsuarioSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlG_UsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlG_UsuarioFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object sqlG_UsuarioASSINA: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
  end
  object dtsG_Usuario: TDataSource
    DataSet = sqlG_Usuario
    Left = 508
    Top = 452
  end
  object sqlUsuarioSistema: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT U.USUARIO_ID, U.LOGIN'#13#10'FROM G_USUARIO U RIGHT OUTER JOIN ' +
      'G_USUARIO_SISTEMA S'#13#10'  ON U.USUARIO_ID = S.USUARIO_ID'#13#10'WHERE (S.' +
      'SISTEMA_ID = :SISTEMA_ID'#13#10'      OR U.USUARIO_ID = 123456)'#13#10'ORDER' +
      ' BY U.LOGIN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 596
    Top = 396
    object sqlUsuarioSistemaUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlUsuarioSistemaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
  end
  object dtsUsuarioSistema: TDataSource
    DataSet = sqlUsuarioSistema
    Left = 596
    Top = 452
  end
  object sqlUsuarioAssinante: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT U.USUARIO_ID, U.NOME_COMPLETO, FUNCAO'#13#10'FROM G_USUARIO U R' +
      'IGHT OUTER JOIN G_USUARIO_SISTEMA S'#13#10'  ON U.USUARIO_ID = S.USUAR' +
      'IO_ID'#13#10'WHERE S.SISTEMA_ID = :SISTEMA_ID'#13#10'      AND U.ASSINA = '#39'S' +
      #39#13#10'ORDER BY U.NOME_COMPLETO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Params = <>
    Left = 696
    Top = 396
    object FMTBCDField1: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
    object sqlUsuarioAssinanteNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlUsuarioAssinanteFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
  end
  object dtsUsuarioAssinante: TDataSource
    DataSet = sqlUsuarioAssinante
    Left = 696
    Top = 452
  end
  object sqlCedenteTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CEDENTE_ID'#13#10'FROM T_CEDENTE'#13#10'ORDER BY PRINCIPAL' +
      ' DESC, DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 36
    Top = 276
    object sqlCedenteTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCedenteTodosCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCedenteTodos: TDataSource
    DataSet = sqlCedenteTodos
    Left = 36
    Top = 332
  end
  object sqlCedenteAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CEDENTE_ID'#13#10'FROM T_CEDENTE'#13#10'WHERE SITUACAO = '#39 +
      'A'#39#13#10'ORDER BY PRINCIPAL DESC, DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 128
    Top = 276
    object sqlCedenteAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlCedenteAtivosCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCedenteAtivos: TDataSource
    DataSet = sqlCedenteAtivos
    Left = 128
    Top = 332
  end
  object sqlGrupoContabilTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
      'CONTABIL_GRUPO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRIC' +
      'AO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 256
    Top = 24
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
    Left = 256
    Top = 80
  end
  object sqlGrupoContabilAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'   AND CEDENTE_ID = :CEDEN' +
      'TE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 136
    Top = 24
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
    Left = 136
    Top = 80
  end
  object sqlGrupoContabilSaidas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'1'#39#13#10'    ' +
      ' AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 380
    Top = 24
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
    Left = 380
    Top = 80
  end
  object sqlGrupoContabilEntradas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_' +
      'CONTABIL_GRUPO'#13#10'WHERE SITUACAO = '#39'A'#39' '#13#10'     AND TIPO = '#39'2'#39#13#10'    ' +
      ' AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 512
    Top = 24
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
    Left = 512
    Top = 80
  end
  object sqlBalanceteGrupo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, BALANCETE_GRUPO_ID, SIGLA'#13#10'FROM T_BALANCETE_GR' +
      'UPO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 640
    Top = 24
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
    Left = 640
    Top = 76
  end
  object sqlPlanoContasAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM T_CONTABIL_CONTA'#13#10'WHER' +
      'E SITUACAO = '#39'A'#39#13#10'     AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DE' +
      'SCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 596
    Top = 148
    object sqlPlanoContasAtivoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
  end
  object dtsPlanoContasAtivo: TDataSource
    DataSet = sqlPlanoContasAtivo
    Left = 596
    Top = 200
  end
  object sqlPlanoContasTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CONTABIL_CONTA_ID, DESCRICAO'#13#10'FROM T_CONTABIL_CONTA'#13#10'WHER' +
      'E CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 716
    Top = 148
    object FMTBCDField2: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
  end
  object dtsPlanoContasTodos: TDataSource
    DataSet = sqlPlanoContasTodos
    Left = 716
    Top = 200
  end
  object sqlPlanoContasReceitas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.FIXO, CB.BALANCETE' +
      '_GRUPO_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_' +
      'GRUPO CB ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHE' +
      'RE CC.SITUACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 4'#13#10'    AND CC.CEDENT' +
      'E_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 480
    Top = 152
    object sqlPlanoContasReceitasCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasReceitasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlPlanoContasReceitasFIXO: TStringField
      FieldName = 'FIXO'
      Size = 1
    end
    object sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsPlanoContasReceitas: TDataSource
    DataSet = sqlPlanoContasReceitas
    Left = 480
    Top = 204
  end
  object sqlCompromissoMensal: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.DESCRICAO, LC.CONTABIL_CONTA_ID, '#13#10'            CB.BALA' +
      'NCETE_GRUPO_ID, '#13#10'            LC.VALOR_ATUAL, LC.ANO_MES_FINAL, ' +
      'LC.PERIODO, ANO_MES_INICIAL'#13#10'FROM T_LANCAMENTO_COMPROMISSO LC LE' +
      'FT OUTER JOIN T_CONTABIL_CONTA CC ON'#13#10'  LC.CONTABIL_CONTA_ID = C' +
      'C.CONTABIL_CONTA_ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CB ON'#13#10' ' +
      ' CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE LC.SITUACAO ' +
      '= 1'#13#10'     AND LC.CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY CC.DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 252
    Top = 152
    object sqlCompromissoMensalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlCompromissoMensalCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlCompromissoMensalVALOR_ATUAL: TFMTBCDField
      FieldName = 'VALOR_ATUAL'
      Precision = 20
      Size = 3
    end
    object sqlCompromissoMensalANO_MES_FINAL: TStringField
      FieldName = 'ANO_MES_FINAL'
      Size = 10
    end
    object sqlCompromissoMensalPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object sqlCompromissoMensalANO_MES_INICIAL: TStringField
      FieldName = 'ANO_MES_INICIAL'
      Size = 10
    end
  end
  object dtsCompromissoMensal: TDataSource
    DataSet = sqlCompromissoMensal
    Left = 252
    Top = 208
  end
  object sqlPessoas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT NOME, PESSOA_ID, BOLETO_EMAIL'#13#10'FROM T_PESSOA'#13#10'WHERE CEDEN' +
      'TE_ID = :CEDENTE_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 352
    Top = 152
    object sqlPessoasNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlPessoasPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPessoasBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
  end
  object dtsPessoas: TDataSource
    DataSet = sqlPessoas
    Left = 352
    Top = 204
  end
  object sqlAssociadosAtivos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT NOME, PESSOA_ID'#13#10'FROM T_PESSOA'#13#10'WHERE SITUACAO IN ('#39'1'#39', '#39 +
      '3'#39')'#13#10'     AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 752
    Top = 24
    object StringField2: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsAssociadosAtivos: TDataSource
    DataSet = sqlAssociadosAtivos
    Left = 752
    Top = 76
  end
  object sqlCentroCustoTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_CE' +
      'NTRO_CUSTO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 860
    Top = 24
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
    Left = 860
    Top = 76
  end
  object sqlCentroCustoAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, CENTRO_CUSTO_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_CE' +
      'NTRO_CUSTO'#13#10'WHERE CEDENTE_ID = :CEDENTE_ID'#13#10'     AND SITUACAO = ' +
      #39'A'#39' '#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 860
    Top = 136
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'CENTRO_CUSTO_ID'
      Precision = 20
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCentroCustoAtivo: TDataSource
    DataSet = sqlCentroCustoAtivo
    Left = 860
    Top = 188
  end
  object dtsGrupoTodos: TDataSource
    DataSet = sqlGrupoTodos
    Left = 148
    Top = 212
  end
  object sqlGrupoTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, PESSOA_GRUPO_ID'#13#10'FROM T_PESSOA_GRUPO'#13#10'WHERE CE' +
      'DENTE_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 148
    Top = 156
    object sqlGrupoTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlGrupoTodosPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object sqlGrupoAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, PESSOA_GRUPO_ID'#13#10'FROM T_PESSOA_GRUPO'#13#10'WHERE CE' +
      'DENTE_ID = :CEDENTE_ID'#13#10'   AND SITUACAO = '#39'A'#39#13#10'ORDER BY DESCRICA' +
      'O'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 60
    Top = 156
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsGrupoAtivo: TDataSource
    DataSet = sqlGrupoAtivo
    Left = 60
    Top = 212
  end
  object sqlCompReceitaTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT (CC.DESCRICAO  || '#39' >> '#39' || BG.SIGLA) AS DESCRICAO, CC.CO' +
      'NTABIL_CONTA_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_BALA' +
      'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
      'ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
      'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.CEDENTE_ID = :CEDENTE_ID'#13#10 +
      '  AND CC.SITUACAO = '#39'A'#39#13#10'  AND CB.OPERACAO = 4'#13#10'ORDER BY CC.DESC' +
      'RICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 240
    Top = 276
    object sqlCompReceitaTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 97
    end
    object sqlCompReceitaTodosCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompReceitaTodos: TDataSource
    DataSet = sqlCompReceitaTodos
    Left = 240
    Top = 332
  end
  object sqlPlanoContasDespesasTodos: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.FIXO, CB.BALANCETE' +
      '_GRUPO_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_' +
      'GRUPO CB ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHE' +
      'RE CC.SITUACAO = '#39'A'#39#13#10'    AND CC.CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER' +
      ' BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 376
    Top = 280
    object sqlPlanoContasDespesasTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasTodosFIXO: TStringField
      FieldName = 'FIXO'
      Size = 1
    end
    object sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsPlanoContasDespesasTodos: TDataSource
    DataSet = sqlPlanoContasDespesasTodos
    Left = 372
    Top = 336
  end
  object dtsPlanoContasDespesasAtivo: TDataSource
    DataSet = sqlPlanoContasDespesasAtivo
    Left = 536
    Top = 336
  end
  object sqlPlanoContasDespesasAtivo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.FIXO, CB.BALANCETE' +
      '_GRUPO_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN  T_CONTABIL_' +
      'GRUPO CB ON'#13#10'   CC.CONTABIL_GRUPO_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHE' +
      'RE CC.SITUACAO = '#39'A'#39#13#10'    AND CB.OPERACAO = 3'#13#10'    AND CC.CEDENT' +
      'E_ID = :CEDENTE_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 536
    Top = 280
    object sqlPlanoContasDespesasAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
    object sqlPlanoContasDespesasAtivoFIXO: TStringField
      FieldName = 'FIXO'
      Size = 1
    end
    object sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 28
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
      'NTABIL_CONTA_ID'#13#10'FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_BALA' +
      'NCETE_GRUPO BG'#13#10'  ON CC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_' +
      'ID'#13#10'  LEFT OUTER JOIN T_CONTABIL_GRUPO CB'#13#10'  ON CC.CONTABIL_GRUP' +
      'O_ID = CB.CONTABIL_GRUPO_ID'#13#10'WHERE CC.CEDENTE_ID = :CEDENTE_ID'#13#10 +
      '  AND CC.SITUACAO = '#39'A'#39#13#10'  AND CB.OPERACAO <> 4'#13#10'ORDER BY CC.DES' +
      'CRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftBCD
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 232
    Top = 396
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
      Size = 97
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'CONTABIL_CONTA_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsCompSaidaTodos: TDataSource
    DataSet = sqlCompSaidaTodos
    Left = 232
    Top = 452
  end
  object sqlCabecalho: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT B.BALANCETE_GRUPO_ID, B.CABECALHO,'#13#10'       C.DESCRICAO AS' +
      ' NOME, C.RAZAO_SOCIAL, C.CNPJ_CPF, C.END_CIDADE, C.END_UF'#13#10'FROM ' +
      'T_BALANCETE_GRUPO B LEFT OUTER JOIN T_CEDENTE C ON'#13#10'  B.CEDENTE_' +
      'ID = C.CEDENTE_ID'#13#10'WHERE B.BALANCETE_GRUPO_ID = :BALANCETE_GRUPO' +
      '_ID'#13#10'     AND B.CEDENTE_ID = :CEDENTE_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'BALANCETE_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    OnCalcFields = sqlCabecalhoCalcFields
    Left = 128
    Top = 396
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
    object sqlCabecalhoNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sqlCabecalhoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 120
    end
    object sqlCabecalhoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 15
    end
    object sqlCabecalhoEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 60
    end
    object sqlCabecalhoEND_UF: TStringField
      FieldName = 'END_UF'
      Size = 3
    end
    object sqlCabecalhoCALC_CPNJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_CPNJ'
      Size = 30
      Calculated = True
    end
  end
  object dtsCabecalho: TDataSource
    DataSet = sqlCabecalho
    Left = 128
    Top = 452
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink
    Version = 0
    Left = 724
    Top = 280
    object dxComponentPrinterLink: TdxGridReportLink
      DesignerCaption = 'Pesquisa Avan'#231'aca'
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'New Report'
      ReportDocument.CreationDate = 40568.908658217600000000
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Centro Esp'#237'rita Beneficente Uni'#227'o do Vegetal'
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsCards.Shadow.Color = clBlack
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsFormatting.UseNativeStyles = True
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object sqlConfiguracaoSalva: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM G_CONFIGURACAO_SALVA'#13#10'WHERE SISTEMA_ID = :SISTEMA' +
      '_ID'#13#10'  AND LOCAL = :LOCAL'#13#10'  AND ORDEM = '#39'0'#39';'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCAL'
        ParamType = ptInput
      end>
    Params = <>
    Left = 748
    Top = 340
    object sqlConfiguracaoSalvaCONFIGURACAO_SALVA_ID: TFMTBCDField
      FieldName = 'CONFIGURACAO_SALVA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlConfiguracaoSalvaLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 60
    end
    object sqlConfiguracaoSalvaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlConfiguracaoSalvaVALOR: TStringField
      FieldName = 'VALOR'
      Size = 30
    end
    object sqlConfiguracaoSalvaSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object sqlConfiguracaoDados: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM G_CONFIGURACAO_SALVA'#13#10'WHERE SISTEMA_ID = :SISTEMA' +
      '_ID'#13#10'  AND LOCAL = :LOCAL'#13#10'  AND DESCRICAO = :DESCRICAO'#13#10'  AND O' +
      'RDEM <> '#39'0'#39';'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 857
    Top = 340
    object sqlConfiguracaoDadosCONFIGURACAO_SALVA_ID: TFMTBCDField
      FieldName = 'CONFIGURACAO_SALVA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlConfiguracaoDadosLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 60
    end
    object sqlConfiguracaoDadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlConfiguracaoDadosVALOR: TStringField
      FieldName = 'VALOR'
      Size = 30
    end
    object sqlConfiguracaoDadosSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsConfiguracaoSalva: TDataSource
    DataSet = sqlConfiguracaoSalva
    Left = 756
    Top = 404
  end
  object dtsConfiguracaoDados: TDataSource
    DataSet = sqlConfiguracaoDados
    Left = 865
    Top = 404
  end
  object sqlReservasAtivas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT DESCRICAO, RESERVA_ID, BALANCETE_GRUPO_ID'#13#10'FROM T_RESERVA' +
      #13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND CEDENTE_ID = :CEDENTE_ID'#13#10'ORDER BY D' +
      'ESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'CEDENTE_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 862
    Top = 240
    object sqlReservasAtivasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlReservasAtivasRESERVA_ID: TFMTBCDField
      FieldName = 'RESERVA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlReservasAtivasBALANCETE_GRUPO_ID: TFMTBCDField
      FieldName = 'BALANCETE_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsReservasAtivas: TDataSource
    DataSet = sqlReservasAtivas
    Left = 862
    Top = 289
  end
  object sqlEmailTextoPadrao: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_EMAIL_TEXTO_PADRAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 641
    Top = 259
    object sqlEmailTextoPadraoEMAIL_TEXTO_PADRAO_ID: TFMTBCDField
      FieldName = 'EMAIL_TEXTO_PADRAO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlEmailTextoPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlEmailTextoPadraoTEXTO: TBlobField
      FieldName = 'TEXTO'
    end
    object sqlEmailTextoPadraoASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 90
    end
  end
  object dtsEmailTextoPadrao: TDataSource
    DataSet = sqlEmailTextoPadrao
    Left = 641
    Top = 316
  end
  object SaveDialog1: TSaveDialog
    FileName = 'RelatorioTemp.xls'
    Left = 792
    Top = 449
  end
end
