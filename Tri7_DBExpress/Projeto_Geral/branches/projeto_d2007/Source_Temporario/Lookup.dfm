object dtmLookup: TdtmLookup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 536
  Width = 879
  object cxEditRepository1: TcxEditRepository
    Left = 33
    Top = 8
    object cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem
    end
    object cxEditRepository1DateItem1: TcxEditRepositoryDateItem
    end
    object listaG_Banco: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'BANCO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Banco
    end
    object listaG_TB_DocumentoTipo: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'TB_DOCUMENTOTIPO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Tipo de Documento'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_DocumentoTipo
    end
    object listaG_TB_EstadoCivil: TcxEditRepositoryLookupComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'TB_ESTADOCIVIL_ID'
      Properties.ListColumns = <
        item
          Caption = 'Estado Civil'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_EstadoCivil
    end
    object listaG_TB_TipoLogradouro: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'TB_TIPOLOGRADOURO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Tipo de Logradouro'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_TipoLogradouro
    end
    object listaG_TB_Profissao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsEditList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_PROFISSAO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Profiss'#227'o'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_Profissao
    end
    object listaG_TB_RegimeComunhao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_REGIMECOMUNHAO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Regime de Comunh'#227'o'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_RegimeComunhao
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
        end
        item
          Description = 'Ignorado'
          Value = 'I'
        end>
    end
    object Combo_SimNao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taRightJustify
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 0
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
        end
        item
          Description = 'Ambos Falecidos'
          Value = 'AF'
        end
        item
          Description = 'Pai Vivo e M'#227'e Falecida'
          Value = 'PV'
        end
        item
          Description = 'M'#227'e Viva e Pai Falecido'
          Value = 'MV'
        end
        item
          Description = 'M'#227'e Falecida'
          Value = 'MF'
        end
        item
          Description = 'Pais Vivos Casados'
          Value = 'P1'
        end
        item
          Description = 'Conjuge Individual'
          Value = 'P3'
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
    object Combo_Doi_TipoTransacao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.ImageAlign = iaRight
      Properties.Items = <
        item
          Description = 'Adjudica'#231#227'o'
          ImageIndex = 0
          Value = '15'
        end
        item
          Description = 'Arremata'#231#227'o em Hasta P'#250'blica'
          Value = '41'
        end
        item
          Description = 'Cess'#227'o de Direitos'
          Value = '37'
        end
        item
          Description = 'Compra e Venda'
          Value = '11'
        end
        item
          Description = 'Da'#231#227'o em Pagamento'
          Value = '19'
        end
        item
          Description = 'Desapropria'#231#227'o'
          Value = '25'
        end
        item
          Description = 'Dissolu'#231#227'o de Sociedade'
          Value = '43'
        end
        item
          Description = 'Distrato de Neg'#243'cio'
          Value = '21'
        end
        item
          Description = 'Doa'#231#227'o'
          Value = '53'
        end
        item
          Description = 'Doa'#231#227'o em adiantamento da leg'#237'tima'
          Value = '55'
        end
        item
          Description = 'Heran'#231'a, Legado ou Mea'#231#227'o (adjudica'#231#227'o)'
          Value = '27'
        end
        item
          Description = 'Incorpora'#231#227'o e loteamento'
          Value = '45'
        end
        item
          Description = 'Integraliza'#231#227'o/Subscri'#231#227'o de capital'
          Value = '47'
        end
        item
          Description = 'Partilha amig'#225'vel ou litigiosa'
          Value = '49'
        end
        item
          Description = 'Permuta'
          Value = '13'
        end
        item
          Description = 'Procura'#231#227'o em Causa Pr'#243'pria'
          Value = '31'
        end
        item
          Description = 'Promessa de Cess'#227'o de Direitos'
          Value = '35'
        end
        item
          Description = 'Promessa de Compra e Venda'
          Value = '33'
        end
        item
          Description = 'Retorno de Capital pr'#243'prio'
          Value = '51'
        end
        item
          Description = 'Outros'
          Value = '39'
        end>
    end
    object Combo_Doi_TipoImovel: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.ImageAlign = iaRight
      Properties.Items = <
        item
          Description = 'Casa'
          ImageIndex = 0
          Value = '67'
        end
        item
          Description = 'Apto'
          Value = '65'
        end
        item
          Description = 'Loja'
          Value = '15'
        end
        item
          Description = 'Sala/Conjunto'
          Value = '17'
        end
        item
          Description = 'Terreno/fra'#231#227'o'
          Value = '71'
        end
        item
          Description = 'Galp'#227'o'
          Value = '31'
        end
        item
          Description = 'Pr'#233'dio Comercial'
          Value = '33'
        end
        item
          Description = 'Pr'#233'dio Residencial'
          Value = '35'
        end
        item
          Description = 'Fazenda/S'#237'tio/Ch'#225'cara'
          Value = '69'
        end
        item
          Description = 'Outros'
          Value = '89'
        end>
    end
    object Combo_Doi_Situacao: TcxEditRepositoryImageComboBoxItem
      Properties.ImageAlign = iaRight
      Properties.Items = <
        item
          Description = 'DOI Normal'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'DOI Retificadora'
          Value = '1'
        end
        item
          Description = 'DOI Canceladora'
          Value = '2'
        end>
    end
    object Combo_Doi_Atribuicao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Of'#237'cio de Notas'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Registro de Im'#243'veis'
          Value = '2'
        end
        item
          Description = 'Registro de T'#237'tulos e Documentos'
          Value = '3'
        end>
    end
    object Combo_Doi_RetificacaoAto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'A opera'#231#227'o n'#227'o '#233' uma retifica'#231#227'o de ato anterior'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'A opera'#231#227'o '#233' uma retifica'#231#227'o de um ato anterior'
          Value = '1'
        end>
    end
    object Combo_Doi_FormaAlienacao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.ImageAlign = iaRight
      Properties.Items = <
        item
          Description = #192' vista'
          ImageIndex = 0
          Value = '5'
        end
        item
          Description = 'A prazo'
          Value = '7'
        end
        item
          Description = 'N'#227'o se Aplica'
          Value = '9'
        end>
    end
    object Combo_Doi_ValorAlienacaoNaoConsta: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Valor est'#225' sendo informado'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Valor n'#227'o consta nos documentos'
          Value = '1'
        end>
    end
    object Combo_Doi_SituacaoConstrucao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.ImageAlign = iaRight
      Properties.Items = <
        item
          Description = 'Constru'#231#227'o Averbada'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Em Constru'#231#227'o'
          Value = '1'
        end
        item
          Description = 'N'#227'o se Aplica'
          Value = '2'
        end>
    end
    object Combo_Doi_Localizacao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Urbano'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Rural'
          Value = '3'
        end>
    end
    object Combo_Doi_AreaNaoConsta: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = #193'rea est'#225' sendo informada'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = #193'rea n'#227'o consta nos documentos'
          Value = '1'
        end>
    end
    object Combo_Doi_ITBIeITCDnaoConsta: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Valor est'#225' sendo informada'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Valor n'#227'o consta nos documentos'
          Value = '1'
        end>
    end
    object ListaG_Natureza_Titulo: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'NATUREZA_TITULO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Natureza Formal do T'#237'tulo'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Natureza_Titulo
    end
    object listaG_Emolumento: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'EMOLUMENTO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Tabela de Emolumentos'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Emolumento
    end
    object ListaG_Emolumento_Periodo: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'EMOLUMENTO_PERIODO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          FieldName = 'DESCRICAO'
        end
        item
          Caption = 'Data Inicial'
          RepositoryItem = Formata_DataSEMhora
          FieldName = 'DATA_INICIAL'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Emolumento_Periodo
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
        'TO'
        '-')
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
    object Lista_MedidaTipoDescricao: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'MEDIDA_TIPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Medida_Tipo
    end
    object listaG_TB_Bairro: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'TB_BAIRRO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_Bairro
    end
    object Formata_DataSEMhora: TcxEditRepositoryDateItem
      Properties.SaveTime = False
      Properties.ShowTime = False
    end
    object Combo_TipoTitulo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Reg. Livro2'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Reg. Livro3'
          Value = '2'
        end
        item
          Description = 'Averb. Livro2'
          Value = '3'
        end
        item
          Description = 'Averb. Livro3'
          Value = '4'
        end
        item
          Description = 'Certid'#227'o'
          Value = '5'
        end>
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
    object Lista_Natureza: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'NATUREZA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Natureza
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
        end
        item
          Description = 'RTD & Pessoa Jur'#237'dica'
          Value = 7
        end
        item
          Description = 'Registro Civil'
          Value = 12
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
    object Combo_CreditoDebito: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Cr'#233'dito'
          ImageIndex = 3
          Value = 'C'
        end
        item
          Description = 'D'#233'bito'
          ImageIndex = 4
          Value = 'D'
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
    object listaC_Caixa_Servico: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_SERVICO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsC_Caixa_Servico
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
    object Lista_ArquivoCorrecao: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aguardando Corre'#231#227'o'
          ImageIndex = 8
          Value = 'A'
        end
        item
          Description = 'Em Corre'#231#227'o'
          ImageIndex = 41
          Value = 'B'
        end
        item
          Description = 'Corrigido, Aguardando Importa'#231#227'o...'
          ImageIndex = 45
          Value = 'C'
        end
        item
          Description = 'Notifica'#231#245'es Importadas'
          ImageIndex = 6
          Value = 'D'
        end
        item
          Description = 'Dividido em Partes'
          ImageIndex = 4
          Value = 'E'
        end
        item
          Description = 'Exclu'#237'do/Inv'#225'lido'
          ImageIndex = 7
          Value = 'F'
        end>
    end
    object Lista_SeloGrupo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end
        item
          FieldName = 'NUMERO'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
    object Lista_SeloTipoCartorio: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'SELO_TIPO_CARTORIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListSource = dtsSeloTipoCartorio
    end
    object Combo_Boleto_Situacao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Aguardando'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Compensado'
          Value = '2'
        end
        item
          Description = 'Fechado'
          Value = '3'
        end>
    end
    object Combo_SimNaoOpcional: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 0
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          Value = 'N'
        end
        item
          Description = 'Opcional'
          Value = 'O'
        end>
    end
    object Lista_MunicipioUF: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'MUNICIPIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'SIGLA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsMunicipioIBGE
    end
    object Lista_MunicipioDescricao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'MUNICIPIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'MUNICIPIO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsMunicipioIBGE
    end
    object Lista_IBGE_Pais: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'IBGE_PAIS_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPaisIBGE
    end
    object ListaRegimeBens: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_REGIMEBENS_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsRegimeBens
    end
    object Lista_CaixaServicoTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CAIXA_SERVICO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListSource = dtsCaixaServicosTodos
    end
    object Combo_Serventias: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Tabelionato de Notas'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Registro de Im'#243'veis'
          Value = '2'
        end
        item
          Description = 'Registro Civil'
          Value = '3'
        end
        item
          Description = 'RTD & Pessoa Jur'#237'dica'
          Value = '4'
        end
        item
          Description = 'Protesto'
          Value = '5'
        end
        item
          Description = 'Geral'
          Value = '9'
        end>
    end
    object Combo_Especie: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
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
          Description = 'Deposito/Transferencia'
          ImageIndex = 54
          Value = 'T'
        end>
    end
    object Combo_ServicoLivroDiario: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Tabelionato de Notas'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Registro de Im'#243'veis'
          Value = '2'
        end
        item
          Description = 'RTD e Pessoa Jur'#237'dica'
          Value = '3'
        end
        item
          Description = 'Registro Civil'
          Value = '4'
        end
        item
          Description = 'Protesto'
          Value = '5'
        end
        item
          Description = 'Geral'
          Value = '9'
        end>
    end
    object Lista_SeloDescricaoCompleta: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO_COMPLETA'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
  end
  object sqlG_Banco: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM G_BANCO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 124
    Top = 8
    object sqlG_BancoBANCO_ID: TStringField
      FieldName = 'BANCO_ID'
      Required = True
      Size = 10
    end
    object sqlG_BancoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dtsG_Banco: TDataSource
    DataSet = sqlG_Banco
    Left = 124
    Top = 64
  end
  object sqlG_TB_DocumentoTipo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * '#13#10'FROM G_TB_DOCUMENTOTIPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER ' +
      'BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 236
    Top = 8
    object sqlG_TB_DocumentoTipoTB_DOCUMENTOTIPO_ID: TFMTBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_DocumentoTipoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlG_TB_DocumentoTipoTEXTO: TBlobField
      FieldName = 'TEXTO'
      Size = 1
    end
    object sqlG_TB_DocumentoTipoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_DocumentoTipo: TDataSource
    DataSet = sqlG_TB_DocumentoTipo
    Left = 236
    Top = 64
  end
  object sqlG_TB_EstadoCivil: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_TB_ESTADOCIVIL'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND SISTEM' +
      'A_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 372
    Top = 8
    object sqlG_TB_EstadoCivilTB_ESTADOCIVIL_ID: TFMTBCDField
      FieldName = 'TB_ESTADOCIVIL_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_EstadoCivilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_EstadoCivilSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_EstadoCivil: TDataSource
    DataSet = sqlG_TB_EstadoCivil
    Left = 372
    Top = 64
  end
  object sqlG_TB_Profissao: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_TB_PROFISSAO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY DES' +
      'CRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 484
    Top = 8
    object sqlG_TB_ProfissaoTB_PROFISSAO_ID: TFMTBCDField
      FieldName = 'TB_PROFISSAO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_ProfissaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_ProfissaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_Profissao: TDataSource
    DataSet = sqlG_TB_Profissao
    Left = 484
    Top = 64
  end
  object sqlG_TB_RegimeComunhao: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_TB_REGIMECOMUNHAO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER B' +
      'Y DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 604
    Top = 8
    object sqlG_TB_RegimeComunhaoTB_REGIMECOMUNHAO_ID: TFMTBCDField
      FieldName = 'TB_REGIMECOMUNHAO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_RegimeComunhaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_RegimeComunhaoTEXTO: TBlobField
      FieldName = 'TEXTO'
      Size = 1
    end
    object sqlG_TB_RegimeComunhaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_RegimeComunhao: TDataSource
    DataSet = sqlG_TB_RegimeComunhao
    Left = 580
    Top = 64
  end
  object sqlG_TB_TipoLogradouro: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_TB_TIPOLOGRADOURO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER B' +
      'Y DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 260
    Top = 247
    object sqlG_TB_TipoLogradouroTB_TIPOLOGRADOURO_ID: TFMTBCDField
      FieldName = 'TB_TIPOLOGRADOURO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_TipoLogradouroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_TipoLogradouroSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_TipoLogradouro: TDataSource
    DataSet = sqlG_TB_TipoLogradouro
    Left = 260
    Top = 303
  end
  object sqlG_TB_TxModeloGrupo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT TB_TXMODELOGRUPO_ID, DESCRICAO'#13#10'FROM G_TB_TXMODELOGRUPO'#13#10 +
      'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 130
    Top = 127
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
    Left = 130
    Top = 183
  end
  object sqlG_Natureza_Titulo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_NATUREZA_TITULO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND SISTE' +
      'MA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 260
    Top = 128
    object sqlG_Natureza_TituloCODIGO_NATUREZA_SEF: TFMTBCDField
      FieldName = 'CODIGO_NATUREZA_SEF'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloEMOLUMENTO_ID: TFMTBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloNATUREZA_TITULO_ID: TFMTBCDField
      FieldName = 'NATUREZA_TITULO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Natureza_TituloPRAZO: TFMTBCDField
      FieldName = 'PRAZO'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlG_Natureza_TituloABRIR_MATRICULA: TStringField
      FieldName = 'ABRIR_MATRICULA'
      Size = 1
    end
    object sqlG_Natureza_TituloSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloCODIGO_DOI: TFMTBCDField
      FieldName = 'CODIGO_DOI'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloTIPO_COBRANCA: TStringField
      FieldName = 'TIPO_COBRANCA'
      Size = 1
    end
    object sqlG_Natureza_TituloTIPO_TITULO: TStringField
      FieldName = 'TIPO_TITULO'
      Size = 1
    end
  end
  object dtsG_Natureza_Titulo: TDataSource
    DataSet = sqlG_Natureza_Titulo
    Left = 260
    Top = 184
  end
  object sqlG_Emolumento: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_EMOLUMENTO'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID'#13#10'  AN' +
      'D (SITUACAO IS NULL OR SITUACAO <> '#39'I'#39')'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 372
    Top = 128
    object sqlG_EmolumentoEMOLUMENTO_ID: TFMTBCDField
      FieldName = 'EMOLUMENTO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_EmolumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_EmolumentoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsG_Emolumento: TDataSource
    DataSet = sqlG_Emolumento
    Left = 372
    Top = 184
  end
  object sqlG_Emolumento_Periodo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM G_EMOLUMENTO_PERIODO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 484
    Top = 128
    object sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TFMTBCDField
      FieldName = 'EMOLUMENTO_PERIODO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Emolumento_PeriodoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Emolumento_PeriodoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlG_Emolumento_PeriodoDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
    end
  end
  object dtsG_Emolumento_Periodo: TDataSource
    DataSet = sqlG_Emolumento_Periodo
    Left = 484
    Top = 184
  end
  object sqlG_Medida_Tipo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_MEDIDA_TIPO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 130
    Top = 247
    object sqlG_Medida_TipoMEDIDA_TIPO_ID: TFMTBCDField
      FieldName = 'MEDIDA_TIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Medida_TipoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Medida_TipoSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 10
    end
  end
  object dtsG_Medida_Tipo: TDataSource
    DataSet = sqlG_Medida_Tipo
    Left = 130
    Top = 303
  end
  object sqlG_TB_Bairro: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * FROM G_TB_BAIRRO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'      AND SISTE' +
      'MA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 604
    Top = 128
    object sqlG_TB_BairroTB_BAIRRO_ID: TFMTBCDField
      FieldName = 'TB_BAIRRO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_BairroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object sqlG_TB_BairroSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsG_TB_Bairro: TDataSource
    DataSet = sqlG_TB_Bairro
    Left = 604
    Top = 184
  end
  object sqlG_Usuario: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT * FROM G_USUARIO'#13#10'ORDER BY LOGIN'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 388
    Top = 248
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
    Left = 388
    Top = 304
  end
  object sqlG_Natureza: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT * '#13#10'FROM G_NATUREZA'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'     AND SISTE' +
      'MA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 484
    Top = 248
    object sqlG_NaturezaNATUREZA_ID: TFMTBCDField
      FieldName = 'NATUREZA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_NaturezaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object sqlG_NaturezaSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsG_Natureza: TDataSource
    DataSet = sqlG_Natureza
    Left = 484
    Top = 296
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
    Left = 588
    Top = 248
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
    Left = 588
    Top = 304
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
    Left = 700
    Top = 248
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
    Left = 700
    Top = 304
  end
  object sqlC_Caixa_Servico: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT * FROM C_CAIXA_SERVICO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'      AND S' +
      'ISTEMA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftFMTBcd
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    Left = 700
    Top = 128
    object sqlC_Caixa_ServicoINTERNO_SISTEMA: TStringField
      FieldName = 'INTERNO_SISTEMA'
      Size = 1
    end
    object sqlC_Caixa_ServicoCAIXA_SERVICO_ID: TFMTBCDField
      FieldName = 'CAIXA_SERVICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlC_Caixa_ServicoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlC_Caixa_ServicoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlC_Caixa_ServicoTIPO_TRANSACAO: TStringField
      FieldName = 'TIPO_TRANSACAO'
      Size = 1
    end
    object sqlC_Caixa_ServicoSISTEMA_ID: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 3
    end
  end
  object dtsC_Caixa_Servico: TDataSource
    DataSet = sqlC_Caixa_Servico
    Left = 700
    Top = 184
  end
  object sqlSeloGrupo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_SELO_GRUPO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 122
    Top = 363
    object sqlSeloGrupoSELO_GRUPO_ID: TFMTBCDField
      FieldName = 'SELO_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object sqlSeloGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlSeloGrupoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 260
    end
    object sqlSeloGrupoNUMERO: TFMTBCDField
      FieldName = 'NUMERO'
      Precision = 20
      Size = 2
    end
  end
  object dtsSeloGrupo: TDataSource
    DataSet = sqlSeloGrupo
    Left = 122
    Top = 419
  end
  object sqlSeloTipoCartorio: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 
      'SELECT *'#13#10'FROM G_SELO_TIPO_CARTORIO'#13#10'ORDER BY SELO_TIPO_CARTORIO' +
      '_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 234
    Top = 363
    object sqlSeloTipoCartorioSELO_TIPO_CARTORIO_ID: TFMTBCDField
      FieldName = 'SELO_TIPO_CARTORIO_ID'
      Precision = 20
      Size = 2
    end
    object sqlSeloTipoCartorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object dtsSeloTipoCartorio: TDataSource
    DataSet = sqlSeloTipoCartorio
    Left = 234
    Top = 419
  end
  object ClientTemp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CHAVE_ID'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 326
    Top = 369
    Data = {
      450000009619E0BD010000001800000002000000000003000000450008434841
      56455F494404000100000000000556414C4F5201004900000001000557494454
      480200020078000000}
    object ClientTempCHAVE_ID: TIntegerField
      FieldName = 'CHAVE_ID'
    end
    object ClientTempVALOR: TStringField
      FieldName = 'VALOR'
      Size = 120
    end
  end
  object sqlMunicipioIBGE: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_MUNICIPIO'#13#10'ORDER BY MUNICIPIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 410
    Top = 366
    object sqlMunicipioIBGEMUNICIPIO_ID: TFMTBCDField
      FieldName = 'MUNICIPIO_ID'
      Precision = 20
      Size = 2
    end
    object sqlMunicipioIBGEMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 120
    end
    object sqlMunicipioIBGECODIGO_IBGE: TStringField
      FieldName = 'CODIGO_IBGE'
      Size = 10
    end
    object sqlMunicipioIBGESIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
  end
  object dtsMunicipioIBGE: TDataSource
    DataSet = sqlMunicipioIBGE
    Left = 410
    Top = 422
  end
  object sqlPaisIBGE: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_IBGE_PAIS'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 507
    Top = 368
    object sqlPaisIBGEIBGE_PAIS_ID: TFMTBCDField
      FieldName = 'IBGE_PAIS_ID'
      Precision = 20
      Size = 2
    end
    object sqlPaisIBGEDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
  end
  object dtsPaisIBGE: TDataSource
    DataSet = sqlPaisIBGE
    Left = 506
    Top = 423
  end
  object sqlRegineBens: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT *'#13#10'FROM G_TB_REGIMEBENS'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 593
    Top = 367
    object sqlRegineBensTB_REGIMEBENS_ID: TFMTBCDField
      FieldName = 'TB_REGIMEBENS_ID'
      Precision = 20
      Size = 2
    end
    object sqlRegineBensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlRegineBensSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsRegimeBens: TDataSource
    DataSet = sqlRegineBens
    Left = 591
    Top = 422
  end
  object sqlCaixaServicoTodos: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 'SELECT * FROM C_CAIXA_SERVICO'#13#10'ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 700
    Top = 360
    object StringField1: TStringField
      FieldName = 'INTERNO_SISTEMA'
      Size = 1
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'CAIXA_SERVICO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'TIPO_TRANSACAO'
      Size = 1
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 3
    end
  end
  object dtsCaixaServicosTodos: TDataSource
    DataSet = sqlCaixaServicoTodos
    Left = 700
    Top = 416
  end
end
