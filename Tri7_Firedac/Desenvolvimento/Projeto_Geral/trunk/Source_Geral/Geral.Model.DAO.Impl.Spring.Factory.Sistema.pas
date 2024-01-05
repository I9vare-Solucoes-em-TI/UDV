unit Geral.Model.DAO.Impl.Spring.Factory.Sistema;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Sistema,
  Geral.Model.DAO.Impl.Spring.Table.Sistema;

type
  TSistemaFactory = class(TInterfacedObject, IFactory<ISistema>)
  private
    FTableSistema: TTableSistema;
  public
    constructor Create(
      const vpTableSistema: TTableSistema); reintroduce;

    function GetInstance: ISistema;

    class function New(
      const vpTableSistema: TTableSistema): IFactory<ISistema>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Sistema,
  Geral.Model.Entity.Impl.Factory.Situacao;

{ TSistemaFactory }

constructor TSistemaFactory.Create(
  const vpTableSistema: TTableSistema);
begin
  inherited Create;
  FTableSistema := vpTableSistema;
end;

function TSistemaFactory.GetInstance: ISistema;
begin
  Result := TSistema.New(
    FTableSistema.SistemaID,
    FTableSistema.Descricao,
    TSituacaoFactory.New(
      FTableSistema.Situacao).GetInstance,
    FTableSistema.Versao);
end;

class function TSistemaFactory.New(
  const vpTableSistema: TTableSistema): IFactory<ISistema>;
begin
  Result := Create(
    vpTableSistema);
end;

end.
