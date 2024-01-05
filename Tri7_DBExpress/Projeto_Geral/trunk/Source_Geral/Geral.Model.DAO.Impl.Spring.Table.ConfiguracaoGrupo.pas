unit Geral.Model.DAO.Impl.Spring.Table.ConfiguracaoGrupo;

interface

uses
  Spring.Persistence.Mapping.Attributes,
  Geral.Model.DAO.Impl.Spring.Table.Sistema;

type
  [Entity]
  [Table('G_CONFIG_GRUPO')]
  TTableConfiguracaoGrupo = class
  private
    [Column('CONFIG_GRUPO_ID', [TColumnProperty.cpPrimaryKey])]
    FConfigGrupoID: Integer;

    [Column('DESCRICAO', [], 60)]
    FDescricao: string;

    [Column('SISTEMA_ID')]
    [ForeignJoinColumn('SISTEMA_ID', 'G_SISTEMA', 'SISTEMA_ID')]
    FSistemaID: Integer;

    [ManyToOne(True, [], 'FSistemaID')]
    FTableSistema: TTableSistema;
  public
    property ConfigGrupoID: Integer read FConfigGrupoID write FConfigGrupoID;
    property Descricao: string read FDescricao write FDescricao;
    property SistemaID: Integer read FSistemaID write FSistemaID;
    property TableSistema: TTableSistema read FTableSistema write FTableSistema;

    destructor Destroy; override;
  end;

implementation

{ TTableConfiguracaoGrupo }

destructor TTableConfiguracaoGrupo.Destroy;
begin
  FTableSistema.Free;
  inherited;
end;

end.
