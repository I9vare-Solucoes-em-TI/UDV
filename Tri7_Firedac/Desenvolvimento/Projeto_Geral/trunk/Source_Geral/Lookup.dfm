object dtmLookup: TdtmLookup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 621
  Width = 1263
  object cxEditRepository1: TcxEditRepository
    Left = 32
    Top = 7
    object cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem
    end
    object cxEditRepository1DateItem1: TcxEditRepositoryDateItem
    end
    object listaG_Banco: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'BANCO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Banco
    end
    object listaG_TB_DocumentoTipo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
    object Combo_CapacidadeCivil: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Capaz'
          Value = 'Capaz'
        end
        item
          Description = 'Incapaz'
          Value = 'Incapaz'
        end
        item
          Description = 'Relativamente incapaz'
          Value = 'Relativamente incapaz'
        end>
    end
    object Combo_SimNao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taRightJustify
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 2
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          ImageIndex = 7
          Value = 'N'
        end
        item
          Description = 'Sim (Importado)'
          ImageIndex = 44
          Value = 'I'
        end
        item
          Description = 'Anuente'
          ImageIndex = 32
          Value = 'A'
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
        end
        item
          Description = 'Conjuge Anuente'
          Value = 'PA'
        end>
    end
    object ListaG_TB_TBTxModeloGrupo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
    object Combo_Nacionalidade: TcxEditRepositoryImageComboBoxItem
      Properties.ImageAlign = iaRight
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Brasileiro'
          Value = 'Brasileiro'
        end
        item
          Description = 'Estrangeiro'
          Value = 'Estrangeiro'
        end
        item
          Description = 'Naturalizado'
          Value = 'Naturalizado'
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
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
      Properties.ClearKey = 46
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
      Properties.MaxLength = 0
    end
    object Lista_MedidaTipoDescricao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'MEDIDA_TIPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Medida_Tipo
    end
    object listaG_TB_Bairro: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.Alignment.Horz = taLeftJustify
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
        end
        item
          Description = 'Caixa'
          Value = 5
        end
        item
          Description = 'Protesto'
          Value = 13
        end
        item
          Description = 'Livro Di'#225'rio'
          Value = 17
        end
        item
          Description = 'Financeiro'
          Value = 18
        end
        item
          Description = 'Administrativo'
          Value = 20
        end
        item
          Description = 'Geral'
          Value = 99
        end
        item
          Description = 'Geral'
          Value = '9'
        end>
    end
    object Lista_UsuarioAssinante: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO_COMPLETA'
        end
        item
          FieldName = 'NUMERO'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
    object Lista_SeloTipoCartorio: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'IBGE_PAIS_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPaisIBGE
      Properties.MaxLength = 90
    end
    object Lista_IBGE_Pais_Desc: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'DESCRICAO'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPaisIBGE
      Properties.MaxLength = 90
    end
    object ListaRegimeBens: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
      Properties.DropDownAutoSize = True
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
          Description = 'Valor em Caixa'
          Value = '1'
        end
        item
          Description = 'Valor no Banco e/ou a Receber'
          Value = '2'
        end
        item
          Description = 'Cheque'
          ImageIndex = 51
          Value = 'C'
        end
        item
          Description = 'Dinheiro'
          ImageIndex = 53
          Value = 'D'
        end
        item
          Description = 'Mensalista'
          ImageIndex = 10
          Value = 'M'
        end
        item
          Description = 'Moeda'
          ImageIndex = 59
          Value = 'O'
        end
        item
          Description = 'A Compensar'
          ImageIndex = 3
          Value = 'S'
        end
        item
          Description = 'Deposito/Transferencia'
          ImageIndex = 52
          Value = 'T'
        end
        item
          Description = 'Sangria'
          ImageIndex = 4
          Value = 'G'
        end
        item
          Description = 'Aporte'
          ImageIndex = 3
          Value = 'A'
        end
        item
          Description = 'Compensar Devolvido'
          ImageIndex = 17
          Value = '7'
        end
        item
          Description = 'Conta Cliente Servi'#231'os'
          ImageIndex = 36
          Value = '8'
        end
        item
          Description = 'Conta Cliente Retirada'
          ImageIndex = 31
          Value = '9'
        end
        item
          Description = 'Cart'#227'o'
          ImageIndex = 54
          Value = 'R'
        end
        item
          Description = 'Boleto'
          ImageIndex = 66
          Value = 'B'
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
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'SELO_GRUPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO_COMPLETA'
        end>
      Properties.ListSource = dtsSeloGrupo
    end
    object Lista_EmailTextoPadrao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
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
    object listaProvimentoEsferaNivel: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PROVIMENTO_ESFERA_NIVEL_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsProvimentoEsferaNivel
    end
    object listaProvimentoOrigem: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PROVIMENTO_ORIGEM_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsProvimentoOrigem
    end
    object listaProvimentoTipo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'PROVIMENTO_TIPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsProvimentoTipo
    end
    object ListaG_EmolumentoTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'EMOLUMENTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsEmolumentoTodos
    end
    object Lista_NaturezaTituloSistema: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'NATUREZA_TITULO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'SISTEMA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsNaturezaTituloTodos
    end
    object ListaTodasNatureza: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.ListColumns = <>
    end
    object LIsta_NaturezaTituloTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'NATUREZA_TITULO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsNaturezaTituloTodos
    end
    object Combo_ImagemDespesaReceita: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 4
          Value = 'D'
        end
        item
          ImageIndex = 3
          Value = 'C'
        end
        item
          ImageIndex = 59
          Value = '0'
        end
        item
          ImageIndex = 4
          Value = 'G'
        end>
    end
    object listaR_TB_Tipo_Andamento: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_TIPO_ANDAMENTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsR_TB_Tipo_Andamento
    end
    object Combo_AndamentoCaixa: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Edi'#231#227'o'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Pr'#233'-Fechamento'
          Value = '2'
        end
        item
          Description = 'Conferido'
          Value = '3'
        end
        item
          Description = 'Caixa Fechado'
          Value = '4'
        end
        item
          Description = 'Corre'#231#227'o'
          Value = '5'
        end
        item
          Description = 'Caixa Reaberto'
          Value = '6'
        end>
    end
    object Combo_Especie1: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Valor no Banco e/ou a Receber'
          Value = '2'
        end
        item
          Description = 'Valor em Caixa'
          Value = '1'
        end
        item
          Description = 'Mensalista a Receber'
          ImageIndex = 10
          Value = 'M'
        end
        item
          Description = 'Dinheiro/Moeda'
          ImageIndex = 53
          Value = 'D'
        end
        item
          Description = 'Cr'#233'dito em Conta'
          ImageIndex = 52
          Value = 'T'
        end
        item
          Description = 'Cheque'
          ImageIndex = 51
          Value = 'C'
        end
        item
          Description = 'A Compensar'
          ImageIndex = 3
          Value = 'S'
        end
        item
          Description = 'Sangria'
          ImageIndex = 4
          Value = 'G'
        end
        item
          Description = 'Aporte'
          ImageIndex = 3
          Value = 'A'
        end
        item
          Description = 'Conta Cliente'
          ImageIndex = 11
          Value = 'E'
        end
        item
          Description = 'Compensar Devolvido'
          ImageIndex = 17
          Value = '7'
        end
        item
          Description = 'Conta Cliente Servi'#231'os'
          ImageIndex = 36
          Value = '8'
        end
        item
          Description = 'Conta Cliente Retirada'
          ImageIndex = 31
          Value = '9'
        end
        item
          Description = 'Cart'#227'o'
          ImageIndex = 54
          Value = 'R'
        end
        item
          Description = 'Boleto'
          ImageIndex = 66
          Value = 'B'
        end>
    end
    object Lista_Mensalista: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'MENSALISTA_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsMensalista
    end
    object Combo_FinanceiroLancamento: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aguardando Lan'#231'amento'
          ImageIndex = 8
          Value = '0'
        end
        item
          Description = 'J'#225' Lan'#231'ado'
          ImageIndex = 6
          Value = '1'
        end
        item
          Description = 'Aguardando Lan'#231'amento'
          ImageIndex = 8
        end>
    end
    object Lista_ContaCliente: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'CONTA_CLIENTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsContaCliente
    end
    object Lista_ContaClienteAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'CONTA_CLIENTE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsContaClienteAtiva
    end
    object ListaG_EmolumentoPeriodoAtivo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'EMOLUMENTO_PERIODO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_Emolumento_PeriodoAtivos
    end
    object Combo_PossuiGemeo: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 2
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          ImageIndex = 7
          Value = 'N'
        end>
    end
    object Combo_SituacaoCaixa: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aguardando'
          ImageIndex = 8
          Value = '3'
        end
        item
          Description = 'Caixa Aberto'
          ImageIndex = 5
          Value = '1'
        end
        item
          Description = 'Caixa Fechado'
          ImageIndex = 9
          Value = '2'
        end
        item
          Description = 'Confirmado'
          ImageIndex = 6
          Value = '4'
        end
        item
          Description = 'Estornado'
          ImageIndex = 7
          Value = '5'
        end
        item
          Description = 'Conta Mensalista'
          ImageIndex = 17
          Value = '6'
        end
        item
          Description = #192' Compensar'
          ImageIndex = 54
          Value = '7'
        end
        item
          Description = 'Isento'
          ImageIndex = 35
          Value = '8'
        end
        item
          Description = 'D'#233'bito em Conta Corrente'
          ImageIndex = 55
          Value = '9'
        end
        item
          Description = 'Pagamento Mensalista - D'#233'bito em Conta'
          ImageIndex = 44
          Value = '10'
        end
        item
          Description = 'Pagamento a Compensar - D'#233'bito em Conta '
          ImageIndex = 44
          Value = '11'
        end
        item
          Description = 'Lan'#231'amento  Conta Cliente'
          ImageIndex = 11
          Value = '12'
        end>
    end
    object Combo_SituacaoServico: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aguardando no Pedido'
          ImageIndex = 8
          Value = '1'
        end
        item
          Description = 'Aguardando no Caixa'
          ImageIndex = 8
          Value = '2'
        end
        item
          Description = 'Dispon'#237'vel'
          ImageIndex = 3
          Value = '3'
        end
        item
          Description = 'Indispon'#237'vel'
          ImageIndex = 4
          Value = '4'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = '5'
        end
        item
          Description = 'Concluido'
          ImageIndex = 6
          Value = '6'
        end>
    end
    object Formata_Fone_9Digito: TcxEditRepositoryMaskItem
      Properties.AlwaysShowBlanksAndLiterals = True
      Properties.ClearKey = 16430
      Properties.EditMask = '!\(99\)99999-9999;0;_'
      Properties.MaxLength = 0
    end
    object Lista_AndamentoRI: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_TIPO_ANDAMENTO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsR_TB_Tipo_Andamento
    end
    object cxEditRepository1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'C_TIPO_CARTAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListSource = dtsTipoCartao
    end
    object Lista_TipoCartao: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TIPO_CARTAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsTipoCartao
    end
    object ListaTipoRegistroHoraCerta: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o'
          ImageIndex = 0
          Value = 'AV'
        end
        item
          Description = 'Notifica'#231#227'o'
          Value = 'N'
        end
        item
          Description = 'Notifica'#231#227'o Hora Certa'
          Value = 'H'
        end
        item
          Description = 'Registro'
          Value = 'R'
        end>
    end
    object ListaTipoRegistro: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o'
          ImageIndex = 0
          Value = 'AV'
        end
        item
          Description = 'Notifica'#231#227'o'
          Value = 'N'
        end
        item
          Description = 'Registro'
          Value = 'R'
        end>
    end
    object Lista_IBGE_Pais_Estrangeiro: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'IBGE_PAIS_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsPaisEstrangeiro
    end
    object listaG_TB_Profissao_Fixo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'TB_PROFISSAO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_Profissao
    end
    object ListaG_TB_Orgao_Expedidor: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ORGAO'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_Orgao_Expedidor
    end
    object Combo_Sexo_Animal: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'F'#234'mea'
          ImageIndex = 0
          Value = 'F'
        end
        item
          Description = 'Macho'
          Value = 'M'
        end
        item
          Description = 'Ignorado'
          Value = 'I'
        end>
    end
    object Combo_Tipo_OS_Todos: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Compensa'#231#227'o Direta'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'OS Valor de Cr'#233'dito'
          Value = '2'
        end
        item
          Description = 'OS Dedu'#231#227'o'
          Value = '3'
        end
        item
          Description = 'Sistema Interno'
          Value = '0'
        end>
    end
    object Combo_GrupoCampoObrigatorio: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Pessoa F'#237'sica'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Pessoa Juridica'
          Value = '2'
        end
        item
          Description = 'Sinal P'#250'blico'
          Value = '3'
        end
        item
          Description = 'Doc. Pessoa F'#237'sica'
          Value = '4'
        end
        item
          Description = 'Certid'#227'o de Nascimento'
          Value = '5'
        end
        item
          Description = 'Certid'#227'o de Casamento'
          Value = '6'
        end
        item
          Description = 'Filia'#231#227'o'
          Value = '7'
        end
        item
          Description = 'Tutor (Respons'#225'vel)'
          Value = '8'
        end
        item
          Description = 'Contato'
          Value = '9'
        end
        item
          Description = 'Restri'#231#227'o (Reconhecimento Firma)'
          Value = '10'
        end
        item
          Description = 'Dados Complementares'
          Value = '11'
        end
        item
          Description = 'Certid'#227'o de '#211'bito'
          Value = '12'
        end
        item
          Description = 'Contato Comercial'
          Value = '13'
        end
        item
          Description = 'Pessoa Exposta Politicamente'
          Value = '14'
        end>
    end
    object Combo_Tipo_OS_Imagem: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          ImageIndex = 53
          Value = '1'
        end
        item
          ImageIndex = 30
          Value = '2'
        end
        item
          ImageIndex = 17
          Value = '3'
        end
        item
          ImageIndex = 52
          Value = '4'
        end
        item
          ImageIndex = 55
          Value = '5'
        end
        item
          ImageIndex = 60
          Value = '6'
        end
        item
          ImageIndex = 35
          Value = '7'
        end
        item
          ImageIndex = 9
          Value = '9'
        end>
    end
    object listaG_TB_DocumentoTipoPrincipal: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'TB_DOCUMENTOTIPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_DocumentoTipoPrincipal
    end
    object listaG_TB_DocumentoTipoOutros: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'TB_DOCUMENTOTIPO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_DocumentoTipoOutros
    end
    object Formata_FoneSemDDD8: TcxEditRepositoryMaskItem
      Properties.ClearKey = 16430
      Properties.EditMask = '!9999-9999;1;_'
    end
    object Formata_FoneSemDDD9: TcxEditRepositoryMaskItem
      Properties.ClearKey = 16430
      Properties.EditMask = '!99999-9999;0;_'
      Properties.ValidateOnEnter = False
    end
    object Lista_UsuariosTodos: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'LOGIN'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuariosTodos
    end
    object Combo_SimNaoSimples: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 2
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          ImageIndex = 7
          Value = 'N'
        end>
    end
    object Combo_SimNaoNulo: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Sim'
          ImageIndex = 0
          Value = 'S'
        end
        item
          Description = 'N'#227'o'
          ImageIndex = 1
          Value = 'N'
        end
        item
          Description = 'N'#227'o'
          ImageIndex = 1
        end>
    end
    object ListaTipoRegistroCompleto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o'
          ImageIndex = 0
          Value = 'AV'
        end
        item
          Description = 'Notifica'#231#227'o'
          Value = 'N'
        end
        item
          Description = 'Notifica'#231#227'o Hora Certa'
          Value = 'H'
        end
        item
          Description = 'Registro'
          Value = 'R'
        end
        item
          Description = 'Projeto Posse Legal'
          Value = 'P'
        end>
    end
    object ListaTipoRegistroPosseLegal: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o'
          ImageIndex = 0
          Value = 'AV'
        end
        item
          Description = 'Notifica'#231#227'o'
          Value = 'N'
        end
        item
          Description = 'Registro'
          Value = 'R'
        end
        item
          Description = 'Projeto Posse Legal'
          Value = 'P'
        end>
    end
    object Lista_Planilha_Registro_Diario: TcxEditRepositoryLookupComboBoxItem
      Properties.ListColumns = <
        item
          FieldName = 'CONTROLE_ID'
        end>
      Properties.ListSource = dtsPlanilhaRegistroDiario
    end
    object Combo_SubTipoAtoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Registro RTD'
          ImageIndex = 0
          Value = '71'
        end
        item
          Description = 'Registro RPJ '
          Value = '72'
        end
        item
          Description = 'Averba'#231#227'o RTD'
          Value = '73'
        end
        item
          Description = 'Averba'#231#227'o RPJ'
          Value = '74'
        end
        item
          Description = 'Certid'#227'o Positiva'
          Value = '75'
        end
        item
          Description = 'Certid'#227'o Negativa'
          Value = '76'
        end
        item
          Description = 'Certid'#227'o Inteiro teor'
          Value = '77'
        end>
    end
    object Combo_CodigoTipoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Certid'#227'o'
          Value = '7'
        end
        item
          Description = 'Apostilamento de HAIA'
          Value = '21'
        end
        item
          Description = 'Averba'#231#227'o de Registro Civil das Pessoas Jur'#237'dicas'
          Value = '18'
        end
        item
          Description = 'Registro Civil das Pessoas Jur'#237'dicas'
          Value = '17'
        end
        item
          Description = 'Averba'#231#227'o de Registro de T'#237'tulos e Documentos'
          Value = '16'
        end
        item
          Description = 'Registro de T'#237'tulos e Documentos'
          ImageIndex = 0
          Value = '15'
        end>
    end
    object Combo_TipoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Isento/Cinza'
          ImageIndex = 0
          Value = '44'
        end
        item
          Description = 'Autentica'#231#227'o, reconhecimento de firma e distribui'#231#227'o/azul'
          Value = '45'
        end
        item
          Description = 'Registral/Vermelho'
          Value = '46'
        end
        item
          Description = 'Notarial/Verde'
          Value = '47'
        end
        item
          Description = 'Certid'#227'o e Averba'#231#227'o / Marrom'
          Value = '48'
        end
        item
          Description = 'Registro de Im'#243'veis e Escrituras/ Roxo'
          Value = '49'
        end>
    end
    object listaG_TB_DocumentoTipoDesc: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'DESCRICAO'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_DocumentoTipo
    end
    object Combo_SubTipoAtoRegistroRTD_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Registro RTD'
          ImageIndex = 0
          Value = '71'
        end>
    end
    object Combo_SubTipoAtoRegistroRPJ_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Registro RPJ'
          ImageIndex = 0
          Value = '72'
        end>
    end
    object Combo_SubTipoAtoAverbacaoRTD_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o RTD'
          ImageIndex = 0
          Value = '73'
        end>
    end
    object Combo_SubTipoAtoAverbacaoRPJ_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Averba'#231#227'o RPJ'
          ImageIndex = 0
          Value = '74'
        end>
    end
    object Combo_SubTipoAtoCertidao_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Certid'#227'o Positiva'
          ImageIndex = 0
          Value = '75'
        end
        item
          Description = 'Certid'#227'o Negativa'
          Value = '76'
        end
        item
          Description = 'Certid'#227'o Inteiro Teor'
          Value = '77'
        end>
    end
    object Lista_UsuariosAtivos: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'LOGIN'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuariosAtivos
    end
    object Combo_StatusSolicitacaoSelos: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Solicitado'
          ImageIndex = 0
          Value = 'S'
        end
        item
          Description = 'Recebido'
          Value = 'R'
        end>
    end
    object Combo_ModoDeExecucao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Todos'
          ImageIndex = 0
          Value = '0'
        end
        item
          Description = 'Nova Base'
          Value = '1'
        end
        item
          Description = 'Nova Base/Atual'
          Value = '2'
        end
        item
          Description = 'Corre'#231#227'o Dados'
          Value = '3'
        end>
    end
    object Combo_SubTipoAtoNotarial_AL: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Apostilamento de HAIA'
          ImageIndex = 0
          Value = '163'
        end>
    end
    object Combo_GrupoCampoObrigatorioValidacao: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Pessoa F'#237'sica'
          ImageIndex = 0
          Value = '1'
        end
        item
          Description = 'Pessoa Juridica'
          Value = '2'
        end
        item
          Description = 'Sinal P'#250'blico'
          Value = '3'
        end
        item
          Description = 'Doc. Pessoa F'#237'sica'
          Value = '4'
        end
        item
          Description = 'Certid'#227'o de Nascimento'
          Value = '5'
        end
        item
          Description = 'Certid'#227'o de Casamento'
          Value = '6'
        end
        item
          Description = 'Filia'#231#227'o'
          Value = '7'
        end
        item
          Description = 'Tutor (Respons'#225'vel)'
          Value = '8'
        end
        item
          Description = 'Contato'
          Value = '9'
        end
        item
          Description = 'Restri'#231#227'o (Reconhecimento Firma)'
          Value = '10'
        end
        item
          Description = 'Dados Complementares'
          Value = '11'
        end
        item
          Description = 'Certid'#227'o de '#211'bito'
          Value = '12'
        end
        item
          Description = 'Cart'#227'o'
          Value = '13'
        end
        item
          Description = 'Foto'
          Value = '14'
        end
        item
          Description = 'Digital'
          Value = '15'
        end
        item
          Description = 'Contato Comercial'
          Value = '16'
        end
        item
          Description = 'Pessoa Exposta Politicamente'
          Value = '17'
        end>
    end
    object Lista_UsuariosTodosNomeCompleto: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'USUARIO_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME_COMPLETO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsUsuariosTodos
    end
    object ListaG_TB_Modalidade: TcxEditRepositoryLookupComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'TB_MODALIDADE_ID'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsG_TB_Modalidade
    end
    object Combo_TipoPeriodo: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Diario'
          Value = 'D'
        end
        item
          Description = 'Semanal'
          Value = 'S'
        end
        item
          Description = 'Dec'#234'ndio TJ'
          Value = 'C'
        end
        item
          Description = 'Quinzenal'
          Value = 'Q'
        end
        item
          Description = 'Mensal'
          Value = 'M'
        end>
    end
    object Combo_SituacaoTarefa: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Aguardando'
          ImageIndex = 0
          Value = 'A'
        end
        item
          Description = 'Vencida'
          Value = 'V'
        end
        item
          Description = 'Realizada'
          Value = 'R'
        end
        item
          Description = 'Cancelada'
          Value = 'C'
        end>
    end
    object Combo_CoafTpEnv: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'T'#237'tular'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Respons'#225'vel'
          Value = 2
        end
        item
          Description = 'Depositante'
          Value = 3
        end
        item
          Description = 'S'#243'cio'
          Value = 4
        end
        item
          Description = 'Gerente/Diretor'
          Value = 5
        end
        item
          Description = 'Sacador'
          Value = 6
        end
        item
          Description = 'Procurador/Representante Legal'
          Value = 7
        end
        item
          Description = 'Outros'
          Value = 8
        end>
    end
    object Combo_OSSituacao: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dtmControles.imgCadBasicos
      Properties.Items = <
        item
          Description = 'Aberto'
          ImageIndex = 58
          Value = 'A'
        end
        item
          Description = 'Fechado'
          ImageIndex = 5
          Value = 'F'
        end
        item
          Description = 'Cancelado'
          ImageIndex = 7
          Value = 'C'
        end>
    end
  end
  object sqlG_Banco: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_BANCO'#13#10'ORDER BY DESCRICAO')
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
    Left = 121
    Top = 61
  end
  object sqlG_TB_DocumentoTipo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * '#13#10'FROM G_TB_DOCUMENTOTIPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER ' +
        'BY DESCRICAO')
    Left = 236
    Top = 8
    object sqlG_TB_DocumentoTipoTB_DOCUMENTOTIPO_ID: TBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_TB_DocumentoTipoDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_DocumentoTipoTEXTO: TBlobField
      FieldName = 'TEXTO'
    end
    object sqlG_TB_DocumentoTipoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlG_TB_DocumentoTipoDESCRICAO_SIMPLIFICADA: TStringField
      FieldName = 'DESCRICAO_SIMPLIFICADA'
      Size = 30
    end
  end
  object dtsG_TB_DocumentoTipo: TDataSource
    DataSet = sqlG_TB_DocumentoTipo
    Left = 236
    Top = 64
  end
  object sqlG_TB_EstadoCivil: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_TB_ESTADOCIVIL'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND SISTEM' +
        'A_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO')
    Left = 372
    Top = 8
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_TB_EstadoCivilTB_ESTADOCIVIL_ID: TBCDField
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
    object sqlG_TB_EstadoCivilCERTIDAO_CASAMENTO: TStringField
      FieldName = 'CERTIDAO_CASAMENTO'
      Size = 1
    end
  end
  object dtsG_TB_EstadoCivil: TDataSource
    DataSet = sqlG_TB_EstadoCivil
    Left = 372
    Top = 64
  end
  object sqlG_TB_Profissao: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_TB_PROFISSAO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY DES' +
        'CRICAO')
    Left = 484
    Top = 8
    object sqlG_TB_ProfissaoTB_PROFISSAO_ID: TBCDField
      FieldName = 'TB_PROFISSAO_ID'
      Origin = 'TB_PROFISSAO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlG_TB_ProfissaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_ProfissaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object sqlG_TB_ProfissaoCODIGO_CBO: TStringField
      FieldName = 'CODIGO_CBO'
      Origin = 'CODIGO_CBO'
      Size = 10
    end
  end
  object dtsG_TB_Profissao: TDataSource
    DataSet = sqlG_TB_Profissao
    Left = 484
    Top = 64
  end
  object sqlG_TB_RegimeComunhao: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_TB_REGIMECOMUNHAO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER B' +
        'Y DESCRICAO')
    Left = 604
    Top = 8
    object sqlG_TB_RegimeComunhaoTB_REGIMECOMUNHAO_ID: TBCDField
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
  object sqlG_TB_TipoLogradouro: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_TB_TIPOLOGRADOURO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER B' +
        'Y DESCRICAO')
    Left = 260
    Top = 247
    object sqlG_TB_TipoLogradouroTB_TIPOLOGRADOURO_ID: TBCDField
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
  object sqlG_TB_TxModeloGrupo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT TB_TXMODELOGRUPO_ID, DESCRICAO'#13#10'FROM G_TB_TXMODELOGRUPO'#13#10 +
        'ORDER BY DESCRICAO')
    Left = 130
    Top = 127
    object sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TBCDField
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
  object sqlG_Natureza_Titulo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_NATUREZA_TITULO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND SIST' +
        'EMA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO')
    Left = 263
    Top = 128
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_Natureza_TituloCODIGO_NATUREZA_SEF: TBCDField
      FieldName = 'CODIGO_NATUREZA_SEF'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloEMOLUMENTO_ID: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloNATUREZA_TITULO_ID: TBCDField
      FieldName = 'NATUREZA_TITULO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Natureza_TituloPRAZO: TBCDField
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
    object sqlG_Natureza_TituloSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object sqlG_Natureza_TituloCODIGO_DOI: TBCDField
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
  object sqlG_Emolumento: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_EMOLUMENTO'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID'#13#10'  AN' +
        'D (SITUACAO IS NULL OR SITUACAO <> '#39'I'#39')'#13#10'ORDER BY DESCRICAO')
    Left = 372
    Top = 128
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_EmolumentoEMOLUMENTO_ID: TBCDField
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
  object sqlG_Emolumento_Periodo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_EMOLUMENTO_PERIODO'#13#10'ORDER BY DESCRICAO')
    Left = 484
    Top = 128
    object sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TBCDField
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
  object sqlG_Medida_Tipo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_MEDIDA_TIPO'#13#10'ORDER BY DESCRICAO')
    Left = 130
    Top = 247
    object sqlG_Medida_TipoMEDIDA_TIPO_ID: TBCDField
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
  object sqlG_TB_Bairro: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_TB_BAIRRO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'      AND SISTE' +
        'MA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO')
    Left = 604
    Top = 128
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_TB_BairroTB_BAIRRO_ID: TBCDField
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
  object sqlG_Usuario: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT USUARIO_ID,'#13#10' TROCARSENHA, '#13#10'LOGIN, '#13#10'SENHA, '#13#10'SITUACAO,'#13 +
        #10' NOME_COMPLETO, '#13#10'FUNCAO, '#13#10'ASSINA'#13#10' FROM G_USUARIO'#13#10'ORDER BY L' +
        'OGIN')
    Left = 388
    Top = 248
    object sqlG_UsuarioUSUARIO_ID: TBCDField
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
  object sqlG_Natureza: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * '#13#10'FROM G_NATUREZA'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'     AND SISTE' +
        'MA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO')
    Left = 484
    Top = 248
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_NaturezaNATUREZA_ID: TBCDField
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
    object sqlG_NaturezaSISTEMA_ID: TBCDField
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
  object sqlUsuarioSistema: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT U.USUARIO_ID, U.LOGIN'#13#10'FROM G_USUARIO U RIGHT OUTER JOIN ' +
        'G_USUARIO_SISTEMA S'#13#10'  ON U.USUARIO_ID = S.USUARIO_ID'#13#10'WHERE (S.' +
        'SISTEMA_ID = :SISTEMA_ID'#13#10'      OR U.USUARIO_ID = 123456)'#13#10'ORDER' +
        ' BY U.LOGIN')
    Left = 588
    Top = 248
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    object sqlUsuarioSistemaUSUARIO_ID: TBCDField
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
  object sqlUsuarioAssinante: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT U.USUARIO_ID, U.NOME_COMPLETO, FUNCAO'#13#10'FROM G_USUARIO U R' +
        'IGHT OUTER JOIN G_USUARIO_SISTEMA S'#13#10'  ON U.USUARIO_ID = S.USUAR' +
        'IO_ID'#13#10'WHERE S.SISTEMA_ID = :SISTEMA_ID'#13#10'      AND U.ASSINA = '#39'S' +
        #39#13#10'ORDER BY U.NOME_COMPLETO')
    Left = 700
    Top = 248
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '0'
      end>
    object FMTBCDField1: TBCDField
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
  object sqlC_Caixa_Servico: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM C_CAIXA_SERVICO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'      AND S' +
        'ISTEMA_ID = :SISTEMA_ID'#13#10'ORDER BY DESCRICAO')
    Left = 700
    Top = 128
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlC_Caixa_ServicoINTERNO_SISTEMA: TStringField
      FieldName = 'INTERNO_SISTEMA'
      Size = 1
    end
    object sqlC_Caixa_ServicoCAIXA_SERVICO_ID: TBCDField
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
    object sqlC_Caixa_ServicoSISTEMA_ID: TBCDField
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
  object sqlSeloGrupo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_SELO_GRUPO'#13#10'ORDER BY DESCRICAO')
    Left = 122
    Top = 363
    object sqlSeloGrupoSELO_GRUPO_ID: TBCDField
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
    object sqlSeloGrupoNUMERO: TBCDField
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
  object sqlSeloTipoCartorio: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_SELO_TIPO_CARTORIO'#13#10'ORDER BY SELO_TIPO_CARTORIO' +
        '_ID')
    Left = 234
    Top = 363
    object sqlSeloTipoCartorioSELO_TIPO_CARTORIO_ID: TBCDField
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
    PersistDataPacket.Data = {
      450000009619E0BD010000001800000002000000000003000000450008434841
      56455F494404000100000000000556414C4F5201004900000001000557494454
      480200020078000000}
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
    object ClientTempCHAVE_ID: TIntegerField
      FieldName = 'CHAVE_ID'
    end
    object ClientTempVALOR: TStringField
      FieldName = 'VALOR'
      Size = 120
    end
  end
  object sqlMunicipioIBGE: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_MUNICIPIO'#13#10'ORDER BY MUNICIPIO')
    Left = 410
    Top = 366
    object sqlMunicipioIBGEMUNICIPIO_ID: TBCDField
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
    object sqlMunicipioIBGECEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
  end
  object dtsMunicipioIBGE: TDataSource
    DataSet = sqlMunicipioIBGE
    Left = 410
    Top = 422
  end
  object sqlPaisIBGE: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_IBGE_PAIS'#13#10'ORDER BY DESCRICAO')
    Left = 507
    Top = 368
    object sqlPaisIBGEIBGE_PAIS_ID: TBCDField
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
  object sqlRegineBens: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_TB_REGIMEBENS'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY D' +
        'ESCRICAO')
    Left = 593
    Top = 367
    object sqlRegineBensTB_REGIMEBENS_ID: TBCDField
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
  object sqlCaixaServicoTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM C_CAIXA_SERVICO'#13#10'ORDER BY DESCRICAO')
    Left = 700
    Top = 360
    object StringField1: TStringField
      FieldName = 'INTERNO_SISTEMA'
      Size = 1
    end
    object FMTBCDField2: TBCDField
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
    object FMTBCDField3: TBCDField
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
  object sqlEmailTextoPadrao: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM G_EMAIL_TEXTO_PADRAO')
    Left = 793
    Top = 27
    object sqlEmailTextoPadraoEMAIL_TEXTO_PADRAO_ID: TBCDField
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
    Left = 793
    Top = 84
  end
  object sqlSistema: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT SISTEMA_ID, DESCRICAO'#13#10'FROM G_SISTEMA'#13#10'WHERE SITUACAO = '#39 +
        'A'#39#13#10'ORDER BY SISTEMA_ID')
    Left = 798
    Top = 329
    object sqlSistemaSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlSistemaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dtsSistema: TDataSource
    DataSet = sqlSistema
    Left = 796
    Top = 381
  end
  object sqlProvimentoEsferaNivel: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_PROVIMENTO_ESFERA_NIVEL'#13#10'ORDER BY DESCRICAO')
    Left = 956
    Top = 22
    object sqlProvimentoEsferaNivelPROVIMENTO_ESFERA_NIVEL_ID: TBCDField
      FieldName = 'PROVIMENTO_ESFERA_NIVEL_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlProvimentoEsferaNivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlProvimentoEsferaNivelSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsProvimentoEsferaNivel: TDataSource
    DataSet = sqlProvimentoEsferaNivel
    Left = 956
    Top = 67
  end
  object sqlProvimentoOrigem: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_PROVIMENTO_ORIGEM'#13#10'ORDER BY DESCRICAO')
    Left = 956
    Top = 110
    object sqlProvimentoOrigemPROVIMENTO_ORIGEM_ID: TBCDField
      FieldName = 'PROVIMENTO_ORIGEM_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlProvimentoOrigemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlProvimentoOrigemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsProvimentoOrigem: TDataSource
    DataSet = sqlProvimentoOrigem
    Left = 956
    Top = 163
  end
  object sqlProvimentoTipo: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_PROVIMENTO_TIPO'#13#10'ORDER BY DESCRICAO')
    Left = 955
    Top = 207
    object sqlProvimentoTipoPROVIMENTO_TIPO_ID: TBCDField
      FieldName = 'PROVIMENTO_TIPO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlProvimentoTipoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlProvimentoTipoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsProvimentoTipo: TDataSource
    DataSet = sqlProvimentoTipo
    Left = 956
    Top = 251
  end
  object sqlEmolumentoTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_EMOLUMENTO'#13#10'WHERE SISTEMA_ID = :SISTEMA_ID'#13#10'ORDE' +
        'R BY DESCRICAO')
    Left = 32
    Top = 128
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FMTBCDField4: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsEmolumentoTodos: TDataSource
    DataSet = sqlEmolumentoTodos
    Left = 32
    Top = 184
  end
  object dtsNaturezaTituloTodos: TDataSource
    DataSet = sqlNaturezaTituloTodos
    Left = 816
    Top = 224
  end
  object sqlNaturezaTituloTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT NT.*, S.DESCRICAO AS SISTEMA'#13#10'FROM G_NATUREZA_TITULO NT '#13 +
        #10'  LEFT  OUTER JOIN G_SISTEMA S ON'#13#10'  NT.SISTEMA_ID = S.SISTEMA_' +
        'ID'#13#10'WHERE NT.SITUACAO = '#39'A'#39#13#10'ORDER BY NT.DESCRICAO')
    Left = 817
    Top = 168
    object sqlNaturezaTituloTodosCODIGO_NATUREZA_SEF: TBCDField
      FieldName = 'CODIGO_NATUREZA_SEF'
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosEMOLUMENTO_ID: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosNATUREZA_TITULO_ID: TBCDField
      FieldName = 'NATUREZA_TITULO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlNaturezaTituloTodosPRAZO: TBCDField
      FieldName = 'PRAZO'
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlNaturezaTituloTodosABRIR_MATRICULA: TStringField
      FieldName = 'ABRIR_MATRICULA'
      Size = 1
    end
    object sqlNaturezaTituloTodosSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosCODIGO_DOI: TBCDField
      FieldName = 'CODIGO_DOI'
      Precision = 15
      Size = 2
    end
    object sqlNaturezaTituloTodosTIPO_COBRANCA: TStringField
      FieldName = 'TIPO_COBRANCA'
      Size = 1
    end
    object sqlNaturezaTituloTodosTIPO_TITULO: TStringField
      FieldName = 'TIPO_TITULO'
      Size = 1
    end
    object sqlNaturezaTituloTodosSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 30
    end
  end
  object sqlR_TB_Tipo_Andamento: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM R_TB_TIPO_ANDAMENTO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER B' +
        'Y DESCRICAO')
    Left = 924
    Top = 330
    object sqlR_TB_Tipo_AndamentoTB_TIPO_ANDAMENTO_ID: TBCDField
      FieldName = 'TB_TIPO_ANDAMENTO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlR_TB_Tipo_AndamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlR_TB_Tipo_AndamentoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlR_TB_Tipo_AndamentoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsR_TB_Tipo_Andamento: TDataSource
    DataSet = sqlR_TB_Tipo_Andamento
    Left = 924
    Top = 386
  end
  object sqlConfiguracaoSalva: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'
      'FROM G_CONFIGURACAO_SALVA'
      'WHERE SISTEMA_ID = :SISTEMA_ID'
      '  AND LOCAL = :LOCAL'
      '  AND ORDEM = '#39'0'#39';')
    Left = 116
    Top = 486
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = '18'
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        ParamType = ptInput
        Value = 'FINANCEIRO_RELATORIO'
      end>
    object sqlConfiguracaoSalvaCONFIGURACAO_SALVA_ID: TBCDField
      FieldName = 'CONFIGURACAO_SALVA_ID'
      Origin = 'CONFIGURACAO_SALVA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlConfiguracaoSalvaLOCAL: TStringField
      FieldName = 'LOCAL'
      Origin = 'LOCAL'
      Size = 60
    end
    object sqlConfiguracaoSalvaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object sqlConfiguracaoSalvaVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Size = 30
    end
    object sqlConfiguracaoSalvaSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 18
      Size = 2
    end
    object sqlConfiguracaoSalvaORDEM: TStringField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      Size = 3
    end
  end
  object sqlConfiguracaoDados: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_CONFIGURACAO_SALVA'#13#10'WHERE SISTEMA_ID = :SISTEMA' +
        '_ID'#13#10'  AND LOCAL = :LOCAL'#13#10'  AND DESCRICAO = :DESCRICAO'#13#10'  AND O' +
        'RDEM <> '#39'0'#39';')
    Left = 225
    Top = 485
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
      end>
    object sqlConfiguracaoDadosCONFIGURACAO_SALVA_ID: TBCDField
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
    object sqlConfiguracaoDadosSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsConfiguracaoSalva: TDataSource
    DataSet = sqlConfiguracaoSalva
    Left = 116
    Top = 542
  end
  object dtsConfiguracaoDados: TDataSource
    DataSet = sqlConfiguracaoDados
    Left = 225
    Top = 541
  end
  object sqlMensalista: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM C_MENSALISTA'#13#10'ORDER BY DESCRICAO')
    Left = 311
    Top = 490
    object sqlMensalistaMENSALISTA_ID: TBCDField
      FieldName = 'MENSALISTA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlMensalistaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object sqlMensalistaVALOR_CREDITO_INICIAL: TBCDField
      FieldName = 'VALOR_CREDITO_INICIAL'
      Precision = 20
      Size = 3
    end
    object sqlMensalistaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsMensalista: TDataSource
    DataSet = sqlMensalista
    Left = 311
    Top = 546
  end
  object sqlContaCliente: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT *'#13#10'FROM C_CONTA_CLIENTE'#13#10'ORDER BY DESCRICAO')
    Left = 399
    Top = 489
    object sqlContaClienteCONTA_CLIENTE_ID: TBCDField
      FieldName = 'CONTA_CLIENTE_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlContaClienteSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlContaClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object dtsContaCliente: TDataSource
    DataSet = sqlContaCliente
    Left = 399
    Top = 544
  end
  object sqlContaClienteAtiva: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM C_CONTA_CLIENTE'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY D' +
        'ESCRICAO')
    Left = 495
    Top = 489
    object FMTBCDField5: TBCDField
      FieldName = 'CONTA_CLIENTE_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object StringField7: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object dtsContaClienteAtiva: TDataSource
    DataSet = sqlContaClienteAtiva
    Left = 495
    Top = 544
  end
  object sqlG_Emolumento_PeriodoAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * FROM G_EMOLUMENTO_PERIODO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER ' +
        'BY DESCRICAO')
    Left = 28
    Top = 240
    object sqlG_Emolumento_PeriodoAtivosEMOLUMENTO_PERIODO_ID: TBCDField
      FieldName = 'EMOLUMENTO_PERIODO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlG_Emolumento_PeriodoAtivosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_Emolumento_PeriodoAtivosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlG_Emolumento_PeriodoAtivosDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
    end
  end
  object dtsG_Emolumento_PeriodoAtivos: TDataSource
    DataSet = sqlG_Emolumento_PeriodoAtivos
    Left = 28
    Top = 296
  end
  object sqlTipoCartao: TI9Query
    AutoCalcFields = False
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM C_TIPO_CARTAO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'ORDER BY TIP' +
        'O DESC')
    Left = 599
    Top = 489
    object sqlTipoCartaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object sqlTipoCartaoPERCENTUAL: TBCDField
      FieldName = 'PERCENTUAL'
      Precision = 20
      Size = 2
    end
    object sqlTipoCartaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlTipoCartaoTIPO_CARTAO_ID: TBCDField
      FieldName = 'TIPO_CARTAO_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlTipoCartaoQTD_PARCELA: TBCDField
      FieldName = 'QTD_PARCELA'
      Precision = 20
      Size = 2
    end
    object sqlTipoCartaoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dtsTipoCartao: TDataSource
    DataSet = sqlTipoCartao
    Left = 599
    Top = 544
  end
  object sqlPaisEstrangeiro: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_IBGE_PAIS'#13#10'WHERE CODIGO <> '#39'076'#39#13#10'ORDER BY DESC' +
        'RICAO')
    Left = 43
    Top = 368
    object sqlPaisEstrangeiroIBGE_PAIS_ID: TBCDField
      FieldName = 'IBGE_PAIS_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlPaisEstrangeiroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
  end
  object dtsPaisEstrangeiro: TDataSource
    DataSet = sqlPaisEstrangeiro
    Left = 42
    Top = 423
  end
  object sqlG_TB_Orgao_Expedidor: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT *'#13#10'FROM G_TB_ORGAO_EXPEDIDOR'#13#10'WHERE STATUS = '#39'A'#39#13#10'ORDER B' +
        'Y DESCRICAO')
    Left = 688
    Top = 472
    object sqlG_TB_Orgao_ExpedidorORGAO: TStringField
      FieldName = 'ORGAO'
      Required = True
      Size = 30
    end
    object sqlG_TB_Orgao_ExpedidorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlG_TB_Orgao_ExpedidorSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dtsG_TB_Orgao_Expedidor: TDataSource
    DataSet = sqlG_TB_Orgao_Expedidor
    Left = 696
    Top = 520
  end
  object sqlG_TB_DocumentoTipoPrincipal: TI9Query
    ConnectionName = 'Devart InterBase'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * '#13#10'FROM G_TB_DOCUMENTOTIPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND (P' +
        'RIORIDADE = '#39'P'#39' OR PRIORIDADE = '#39'A'#39' )'#13#10'ORDER BY '#13#10'  ORDEM,'#13#10'  DE' +
        'SCRICAO')
    Left = 836
    Top = 440
    object FMTBCDField6: TBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField9: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object BlobField1: TBlobField
      FieldName = 'TEXTO'
    end
    object StringField10: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'DESCRICAO_SIMPLIFICADA'
      Size = 30
    end
  end
  object dtsG_TB_DocumentoTipoPrincipal: TDataSource
    DataSet = sqlG_TB_DocumentoTipoPrincipal
    Left = 836
    Top = 496
  end
  object dtsG_TB_DocumentoTipoOutros: TDataSource
    DataSet = sqlG_TB_DocumentoTiposOutros
    Left = 996
    Top = 520
  end
  object sqlG_TB_DocumentoTiposOutros: TI9Query
    ConnectionName = 'Devart InterBase'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'SELECT * '#13#10'FROM G_TB_DOCUMENTOTIPO'#13#10'WHERE SITUACAO = '#39'A'#39#13#10'AND (P' +
        'RIORIDADE = '#39'O'#39' OR PRIORIDADE = '#39'A'#39' )'#13#10'ORDER BY '#13#10'  ORDEM,'#13#10'  DE' +
        'SCRICAO')
    Left = 996
    Top = 464
    object FMTBCDField7: TBCDField
      FieldName = 'TB_DOCUMENTOTIPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField12: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object BlobField2: TBlobField
      FieldName = 'TEXTO'
    end
    object StringField13: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'DESCRICAO_SIMPLIFICADA'
      Size = 30
    end
  end
  object dtsUsuariosTodos: TDataSource
    DataSet = sqlUsuariosTodos
    Left = 28
    Top = 544
  end
  object sqlUsuariosTodos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_USUARIO'#13#10'ORDER BY LOGIN')
    Left = 28
    Top = 496
    object sqlUsuariosTodosUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlUsuariosTodosTROCARSENHA: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object sqlUsuariosTodosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object sqlUsuariosTodosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object sqlUsuariosTodosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object sqlUsuariosTodosNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object sqlUsuariosTodosFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object sqlUsuariosTodosASSINA: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
    object sqlUsuariosTodosFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
  end
  object sqlPlanilhaRegistroDiario: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  CONTROLE_ID,'
      '  EXTRACT(MONTH FROM DATA) AS MES,'
      '  EXTRACT(YEAR FROM DATA) AS ANO'
      'FROM'
      '  C_REGISTRO_DIARIO'
      'WHERE'
      '  CONTROLE_ID IS NOT NULL'
      'ORDER BY'
      '  CONTROLE_ID DESC')
    Left = 696
    Top = 48
    object sqlPlanilhaRegistroDiarioCONTROLE_ID: TBCDField
      FieldName = 'CONTROLE_ID'
      Origin = 'CONTROLE_ID'
      Precision = 18
      Size = 2
    end
    object sqlPlanilhaRegistroDiarioMES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MES'
      Origin = 'MES'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlPlanilhaRegistroDiarioANO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dtsPlanilhaRegistroDiario: TDataSource
    DataSet = sqlPlanilhaRegistroDiario
    Left = 696
    Top = 88
  end
  object sqlUsuariosAtivos: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT USUARIO_ID,'
      ' TROCARSENHA, '
      'LOGIN, '
      'SENHA, '
      'SITUACAO,'
      ' NOME_COMPLETO, '
      'FUNCAO, '
      'ASSINA'
      ' FROM G_USUARIO'
      'WHERE SITUACAO = '#39'A'#39
      'ORDER BY LOGIN'
      '')
    Left = 1020
    Top = 344
    object BCDField1: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField15: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object StringField17: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object StringField18: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'NOME_COMPLETO'
      Size = 120
    end
    object StringField20: TStringField
      FieldName = 'FUNCAO'
      Size = 60
    end
    object StringField21: TStringField
      FieldName = 'ASSINA'
      Size = 1
    end
  end
  object dtsUsuariosAtivos: TDataSource
    DataSet = sqlUsuariosAtivos
    Left = 1020
    Top = 400
  end
  object sqlG_TB_Modalidade: TI9Query
    Connection = dtmControles.DB
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM G_TB_MODALIDADE'
      'WHERE SITUACAO = '#39'A'#39
      'AND SISTEMA_ID = :SISTEMA_ID'
      'ORDER BY DESCRICAO')
    Left = 1092
    Top = 32
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlG_TB_ModalidadeTB_MODALIDADE_ID: TBCDField
      FieldName = 'TB_MODALIDADE_ID'
      Origin = 'TB_MODALIDADE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlG_TB_ModalidadeSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object sqlG_TB_ModalidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 120
    end
    object sqlG_TB_ModalidadeSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Origin = 'SISTEMA_ID'
      Precision = 18
      Size = 2
    end
  end
  object dtsG_TB_Modalidade: TDataSource
    DataSet = sqlG_TB_Modalidade
    Left = 1092
    Top = 88
  end
end
