unit Geral.Model.DAO.Impl.Aurelius.Table.Configuracao;

interface

uses
  Aurelius.Mapping.Attributes,
  Geral.Model.DAO.Impl.Aurelius.Table.ConfiguracaoGrupo,
  Aurelius.Types.Blob;

type
  [Entity]
  [Id('FConfigID', TIdGenerator.None)]
  [Table('G_CONFIG')]
  TTableConfiguracao = class
  private
    [Column('CONFIG_ID',
      [TColumnProp.Unique, TColumnProp.Required, TColumnProp.NoUpdate])]
    FConfigID: Integer;

    [Association([TAssociationProp.Required], CascadeTypeAllButRemove)]
    [JoinColumn('CONFIG_GRUPO_ID', [TColumnProp.Required], 'CONFIG_GRUPO_ID')]
    FTableConfiguracaoGrupo: TTableConfiguracaoGrupo;

    [Column('SECAO', [], 60)]
    FSecao: string;

    [Column('NOME', [], 120)]
    FNome: string;

    [Column('VALOR', [], 260)]
    FValor: string;

    [Column('DESCRICAO', [], 260)]
    FDescricao: string;

    [Column('TEXTO')]
    FTexto: TBlob;

    [Column('TERMINAL', [], 30)]
    FTerminal: string;

    [Column('TIPO_VALOR', [], 1)]
    FTipoValor: string;

    [Column('ATUALIZADO', [], 1)]
    FAtualizado: string;

    [Column('OBRIGATORIO', [], 1)]
    FObrigatorio: string;
  public
    property ConfigID: Integer read FConfigID write FConfigID;

    property TableConfiguracaoGrupo: TTableConfiguracaoGrupo
      read FTableConfiguracaoGrupo write FTableConfiguracaoGrupo;

    property Secao: string read FSecao write FSecao;
    property Nome: string read FNome write FNome;
    property Valor: string read FValor write FValor;
    property Descricao: string read FDescricao write FDescricao;
    property Texto: TBlob read FTexto write FTexto;
    property Terminal: string read FTerminal write FTerminal;
    property TipoValor: string read FTipoValor write FTipoValor;
    property Atualizado: string read FAtualizado write FAtualizado;
    property Obrigatorio: string read FObrigatorio write FObrigatorio;
  end;

implementation

initialization
  RegisterEntity(TTableConfiguracao);

end.
