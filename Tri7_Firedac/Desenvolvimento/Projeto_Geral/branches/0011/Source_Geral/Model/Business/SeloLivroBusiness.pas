unit SeloLivroBusiness;

interface

uses
  SeloLivroDAO;

type
  TSeloLivroBusiness = class
  private
    FSeloLivroDAO: TSeloLivroDAO;
  public
    constructor Create(
      const vpSeloLivroDAO: TSeloLivroDAO); reintroduce;

    function GetNotSeloUtilizado(
      const vpTabela: string;
      const vpCampoID: Integer): Boolean;

    function GetSeloUtilizado(
      const vpTabela: string;
      const vpCampoID: Integer): Boolean;
  end;

implementation

uses
  SeloSituacao,
  SeloSituacaoImpl;

{ TSeloLivroBusiness }

constructor TSeloLivroBusiness.Create(
  const vpSeloLivroDAO: TSeloLivroDAO);
begin
  inherited Create;
  FSeloLivroDAO := vpSeloLivroDAO;
end;

function TSeloLivroBusiness.GetNotSeloUtilizado(
  const vpTabela: string;
  const vpCampoID: Integer): Boolean;
begin
  Result := not GetSeloUtilizado(vpTabela, vpCampoID);
end;

function TSeloLivroBusiness.GetSeloUtilizado(
  const vpTabela: string;
  const vpCampoID: Integer): Boolean;
{$REGION 'Constantes'}
const
  // 2 = Utilizado
  CI_SELO_SITUACAO_ID: Integer = 2;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSeloSituacao: ISeloSituacao;
{$ENDREGION}
begin
  viSeloSituacao := TSeloSituacao.Create;
  viSeloSituacao.SeloSituacaoID := CI_SELO_SITUACAO_ID;

  Result := FSeloLivroDAO.GetCount(viSeloSituacao,
    vpTabela, vpCampoID) > 0;
end;

end.
