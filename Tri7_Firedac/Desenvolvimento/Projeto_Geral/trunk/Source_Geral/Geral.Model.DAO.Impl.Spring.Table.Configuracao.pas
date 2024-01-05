unit Geral.Model.DAO.Impl.Spring.Table.Configuracao;

interface

uses
  Spring.Persistence.Mapping.Attributes,
  Geral.Model.DAO.Impl.Spring.Table.ConfiguracaoGrupo;

type
  [Entity]
  [Table('G_CONFIG')]
  TTableConfiguracao = class
  private
    [Column('CONFIG_ID', [TColumnProperty.cpPrimaryKey])]
    FConfigID: Integer;

    [Column('CONFIG_GRUPO_ID')]
    [ForeignJoinColumn('CONFIG_GRUPO_ID', 'G_CONFIG_GRUPO', 'CONFIG_GRUPO_ID')]
    FConfigGrupoID: Integer;

    [ManyToOne(True, [], 'FConfigGrupoID')]
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
    FTexto: TArray<Byte>;

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
    property ConfigGrupoID: Integer read FConfigGrupoID write FConfigGrupoID;

    property TableConfiguracaoGrupo: TTableConfiguracaoGrupo
      read FTableConfiguracaoGrupo write FTableConfiguracaoGrupo;

    property Secao: string read FSecao write FSecao;
    property Nome: string read FNome write FNome;
    property Valor: string read FValor write FValor;
    property Descricao: string read FDescricao write FDescricao;
    property Texto: TArray<Byte> read FTexto write FTexto;
    property Terminal: string read FTerminal write FTerminal;
    property TipoValor: string read FTipoValor write FTipoValor;
    property Atualizado: string read FAtualizado write FAtualizado;
    property Obrigatorio: string read FObrigatorio write FObrigatorio;

    destructor Destroy; override;
  end;

implementation

{ TTableConfiguracao }

destructor TTableConfiguracao.Destroy;
begin
  FTableConfiguracaoGrupo.Free;
  inherited;
end;

end.
