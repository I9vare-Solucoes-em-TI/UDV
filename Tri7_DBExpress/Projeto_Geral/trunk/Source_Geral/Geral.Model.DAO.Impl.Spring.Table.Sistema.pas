unit Geral.Model.DAO.Impl.Spring.Table.Sistema;

interface

uses
  Spring.Persistence.Mapping.Attributes;

type
  [Entity]
  [Table('G_SISTEMA')]
  TTableSistema = class
  private
    [Column('SISTEMA_ID', [cpPrimaryKey])]
    FSistemaID: Integer;

    [Column('DESCRICAO')]
    FDescricao: string;

    [Column('SITUACAO')]
    FSituacao: string;

    [Column('VERSAO')]
    FVersao: string;
  public
    property SistemaID: Integer read FSistemaID write FSistemaID;
    property Descricao: string read FDescricao write FDescricao;
    property Situacao: string read FSituacao write FSituacao;
    property Versao: string read FVersao write FVersao;
  end;

implementation

end.
