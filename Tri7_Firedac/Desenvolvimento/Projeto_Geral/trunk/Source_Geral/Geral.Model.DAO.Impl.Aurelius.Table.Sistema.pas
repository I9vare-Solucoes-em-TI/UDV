unit Geral.Model.DAO.Impl.Aurelius.Table.Sistema;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Id('FSistemaID', TIdGenerator.None)]
  [Table('G_SISTEMA')]
  TTableSistema = class
  private
    [Column('SISTEMA_ID',
      [TColumnProp.Unique, TColumnProp.Required, TColumnProp.NoUpdate])]
    FSistemaID: Integer;

    [Column('DESCRICAO', [], 30)]
    FDescricao: string;

    [Column('SITUACAO', [], 1)]
    FSituacao: string;

    [Column('VERSAO', [], 15)]
    FVersao: string;
  public
    property SistemaID: Integer read FSistemaID write FSistemaID;
    property Descricao: string read FDescricao write FDescricao;
    property Situacao: string read FSituacao write FSituacao;
    property Versao: string read FVersao write FVersao;
  end;

implementation

initialization
  RegisterEntity(TTableSistema);

end.
