unit Geral.Model.DAO.Impl.Spring.Factory.ConfiguracaoGrupo;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.DAO.Impl.Spring.Table.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.Sistema;

type
  TConfiguracaoGrupoFactory = class(TInterfacedObject,
    IFactory<IConfiguracaoGrupo>)
  private
    FTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
    FSistema: ISistema;
  public
    constructor Create(
      const vpTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
      const vpSistema: ISistema); reintroduce;

    function GetInstance: IConfiguracaoGrupo;

    class function New(
      const vpTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
      const vpSistema: ISistema):
      IFactory<IConfiguracaoGrupo>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.ConfiguracaoGrupo;

{ TConfiguracaoGrupoFactory }

constructor TConfiguracaoGrupoFactory.Create(
  const vpTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
  const vpSistema: ISistema);
begin
  inherited Create;
  FTableConfiguracaoGrupo := vpTableConfiguracaoGrupo;
  FSistema := vpSistema;
end;

function TConfiguracaoGrupoFactory.GetInstance: IConfiguracaoGrupo;
begin
  Result := TConfiguracaoGrupo.New(
    FTableConfiguracaoGrupo.ConfigGrupoID,
    FTableConfiguracaoGrupo.Descricao,
    FSistema);
end;

class function TConfiguracaoGrupoFactory.New(
  const vpTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
  const vpSistema: ISistema):
  IFactory<IConfiguracaoGrupo>;
begin
  Result := Create(
    vpTableConfiguracaoGrupo,
    vpSistema);
end;

end.
