unit Geral.Model.DAO.Impl.Aurelius.Table.ConfiguracaoGrupo;

interface

uses
  Aurelius.Mapping.Attributes,
  Geral.Model.DAO.Impl.Aurelius.Table.Sistema;

type
  [Entity]
  [Id('FConfigGrupoID', TIdGenerator.None)]
  [Table('G_CONFIG_GRUPO')]
  TTableConfiguracaoGrupo = class
  private
    [Column('CONFIG_GRUPO_ID',
      [TColumnProp.Unique, TColumnProp.Required, TColumnProp.NoUpdate])]
    FConfigGrupoID: Integer;

    [Column('DESCRICAO', [], 60)]
    FDescricao: string;

    [Association([TAssociationProp.Required], CascadeTypeAllButRemove)]
    [JoinColumn('SISTEMA_ID', [TColumnProp.Required], 'SISTEMA_ID')]
    FTableSistema: TTableSistema;
  public
    property ConfigGrupoID: Integer read FConfigGrupoID write FConfigGrupoID;
    property Descricao: string read FDescricao write FDescricao;
    property TableSistema: TTableSistema read FTableSistema write FTableSistema;
  end;

implementation

initialization
  RegisterEntity(TTableConfiguracaoGrupo);

end.
