unit ConfiguracaoBusiness;

interface

uses
  Sistema,
  ConfiguracaoList,
  ConfiguracaoGrupoDAO,
  ConfiguracaoDAO;

type
  TConfiguracaoBusiness = class
  private
    FConfiguracaoGrupoDAO: IConfiguracaoGrupoDAO;
    FConfiguracaoDAO: IConfiguracaoDAO;

    function GetConfiguracaoGrupoDAO: IConfiguracaoGrupoDAO;
    function GetConfiguracaoDAO: IConfiguracaoDAO;

    procedure SetConfiguracaoGrupoDAO(
      const Value: IConfiguracaoGrupoDAO);

    procedure SetConfiguracaoDAO(
      const Value: IConfiguracaoDAO);
  public
    property ConfiguracaoGrupoDAO: IConfiguracaoGrupoDAO
      read GetConfiguracaoGrupoDAO write SetConfiguracaoGrupoDAO;

    property ConfiguracaoDAO: IConfiguracaoDAO read GetConfiguracaoDAO
      write SetConfiguracaoDAO;

    function GetConfiguracaoList(
      const vpValue: ISistema): TConfiguracaoList;
  end;

implementation

uses
  ConfiguracaoGrupoList,
  System.Generics.Defaults,
  ConfiguracaoGrupo,
  CampoOrdenacao,
  CampoOrdenacaoList,
  CampoOrdenacaoImpl,
  ConfiguracaoGrupoComparer,
  System.SysUtils,
  Configuracao,
  ConfiguracaoComparer;

{ TConfiguracaoBusiness }

function TConfiguracaoBusiness.GetConfiguracaoDAO: IConfiguracaoDAO;
begin
  Result := FConfiguracaoDAO;
end;

function TConfiguracaoBusiness.GetConfiguracaoGrupoDAO: IConfiguracaoGrupoDAO;
begin
  Result := FConfiguracaoGrupoDAO;
end;

function TConfiguracaoBusiness.GetConfiguracaoList(
  const vpValue: ISistema): TConfiguracaoList;
{$REGION 'Variáveis'}
var
  viConfiguracaoGrupoList: TConfiguracaoGrupoList;
{$ENDREGION}

  procedure CarregarConfiguracaoGrupoList;
  begin
    viConfiguracaoGrupoList := ConfiguracaoGrupoDAO.GetList(vpValue);
  end;

  procedure OrdenarConfiguracaoGrupoList;
  {$REGION 'Constantes'}
  const
    CI_CAPACITY: Integer = 1;
  {$ENDREGION}

  {$REGION 'Variáveis'}
  var
    viComparer: IComparer<IConfiguracaoGrupo>;
    viCampoOrdenacao: ICampoOrdenacao;
    viCampoOrdenacaoList: TCampoOrdenacaoList;
  {$ENDREGION}
  begin
    viCampoOrdenacaoList := TCampoOrdenacaoList.Create;
    viCampoOrdenacaoList.Capacity := CI_CAPACITY;

    viCampoOrdenacao := TCampoOrdenacao.Create(TConfiguracaoGrupoComparer.
      CG_DESCRICAO);

    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viComparer := TConfiguracaoGrupoComparer.Create(viCampoOrdenacaoList);

    try
      viConfiguracaoGrupoList.Sort(viComparer);
    finally
      FreeAndNil(viCampoOrdenacaoList);
    end;
  end;

  procedure OrdenarConfiguracaoList;
  {$REGION 'Constantes'}
  const
    CI_CAPACITY: Integer = 3;
  {$ENDREGION}

  {$REGION 'Variáveis'}
  var
    viComparer: IComparer<IConfiguracao>;
    viCampoOrdenacao: ICampoOrdenacao;
    viCampoOrdenacaoList: TCampoOrdenacaoList;
  {$ENDREGION}
  begin
    viCampoOrdenacaoList := TCampoOrdenacaoList.Create;
    viCampoOrdenacaoList.Capacity := CI_CAPACITY;

    viCampoOrdenacao := TCampoOrdenacao.Create(TConfiguracaoComparer.
      CG_CONFIGURACAO_GRUPO_DESCRICAO);

    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viCampoOrdenacao := TCampoOrdenacao.Create(TConfiguracaoComparer.CG_SECAO);
    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viCampoOrdenacao := TCampoOrdenacao.Create(TConfiguracaoComparer.CG_NOME);
    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viComparer := TConfiguracaoComparer.Create(viCampoOrdenacaoList);

    try
      Result.Sort(viComparer);
    finally
      FreeAndNil(viCampoOrdenacaoList);
    end;
  end;

begin
  CarregarConfiguracaoGrupoList;
  OrdenarConfiguracaoGrupoList;

  try
    Result := ConfiguracaoDAO.GetList(viConfiguracaoGrupoList);
    OrdenarConfiguracaoList;
  finally
    FreeAndNil(viConfiguracaoGrupoList);
  end;
end;

procedure TConfiguracaoBusiness.SetConfiguracaoDAO(
  const Value: IConfiguracaoDAO);
begin
  FConfiguracaoDAO := Value;
end;

procedure TConfiguracaoBusiness.SetConfiguracaoGrupoDAO(
  const Value: IConfiguracaoGrupoDAO);
begin
  FConfiguracaoGrupoDAO := Value;
end;

end.
