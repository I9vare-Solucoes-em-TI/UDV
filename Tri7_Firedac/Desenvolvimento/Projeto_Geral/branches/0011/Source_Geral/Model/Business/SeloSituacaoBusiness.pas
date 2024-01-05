unit SeloSituacaoBusiness;

interface

uses
  SeloSituacaoDAO,
  SeloSituacao;

type
  TSeloSituacaoBusiness = class
  private
    FSeloSituacaoDAO: ISeloSituacaoDAO;

    function GetSeloSituacaoDAO: ISeloSituacaoDAO;

    function GetSeloSituacaoUtilizado: ISeloSituacao;

    procedure SetSeloSituacaoDAO(
      const Value: ISeloSituacaoDAO);
  public
    property SeloSituacaoDAO: ISeloSituacaoDAO read GetSeloSituacaoDAO
      write SetSeloSituacaoDAO;

    property SeloSituacaoUtilizado: ISeloSituacao read GetSeloSituacaoUtilizado;
  end;

implementation

{ TSeloSituacaoBusiness }

function TSeloSituacaoBusiness.GetSeloSituacaoDAO: ISeloSituacaoDAO;
begin
  Result := FSeloSituacaoDAO;
end;

function TSeloSituacaoBusiness.GetSeloSituacaoUtilizado: ISeloSituacao;
{$REGION 'Constantes'}
const
  CI_SELO_SITUACAO_ID: Integer = 2;
{$ENDREGION}
begin
  Result := SeloSituacaoDAO.GetByID(CI_SELO_SITUACAO_ID);
end;

procedure TSeloSituacaoBusiness.SetSeloSituacaoDAO(
  const Value: ISeloSituacaoDAO);
begin
  FSeloSituacaoDAO := Value;
end;

end.
