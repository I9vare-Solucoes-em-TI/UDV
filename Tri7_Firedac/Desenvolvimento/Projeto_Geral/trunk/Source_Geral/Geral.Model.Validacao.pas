unit Geral.Model.Validacao;

interface

uses
  Geral.Model.Permissao;

type
  TErroValidacao = class
  private
    FMensagem: string;
    FPermiteAutorizacao: Boolean;
    FChaveRotina: string;
    FTipoOperacao: TTipoOperacao;
    FSistemaId: Integer;
    FSistemaRotinaId: Integer;
  public
    constructor Create(
      const vpMensagem: string;
      const vpPermiteAutorizacao: Boolean;
      const vpChaveRotina: string;
      const vpTipoOperacao: TTipoOperacao;
      const vpSistemaId: Integer;
      const vpSistemaRotinaId: Integer); reintroduce;

    property Mensagem: string read FMensagem;
    property PermiteAutorizacao: Boolean read FPermiteAutorizacao;
    property ChaveRotina: string read FChaveRotina;
    property TipoOperacao: TTipoOperacao read FTipoOperacao;
    property SistemaId: Integer read FSistemaId;
    property SistemaRotinaId: Integer read FSistemaRotinaId;
  end;

  TErroValidacaoBusiness = class
  public
    class function CriarErroValidacao(
      const vpMensagem: string;
      const vpPermiteAutorizacao: Boolean;
      const vpChaveRotina: string;
      const vpTipoOperacao: TTipoOperacao;
      const vpSistemaId: Integer): TErroValidacao;
  end;

implementation

uses
  System.SysUtils,
  Geral.Model.SistemaRotina;

{ TErroValidacao }

constructor TErroValidacao.Create(
  const vpMensagem: string;
  const vpPermiteAutorizacao: Boolean;
  const vpChaveRotina: string;
  const vpTipoOperacao: TTipoOperacao;
  const vpSistemaId: Integer;
  const vpSistemaRotinaId: Integer);
begin
  inherited Create;
  FMensagem := vpMensagem;
  FPermiteAutorizacao := vpPermiteAutorizacao;
  FChaveRotina := vpChaveRotina;
  FTipoOperacao := vpTipoOperacao;
  FSistemaId := vpSistemaId;
  FSistemaRotinaId := vpSistemaRotinaId;
end;

{ TErroValidacaoBusiness }

class function TErroValidacaoBusiness.CriarErroValidacao(
  const vpMensagem: string;
  const vpPermiteAutorizacao: Boolean;
  const vpChaveRotina: string;
  const vpTipoOperacao: TTipoOperacao;
  const vpSistemaId: Integer): TErroValidacao;
var
  viSistemaRotinaId: Integer;
begin
  Result := nil;
  try
    viSistemaRotinaId := 0;

    if vpPermiteAutorizacao then
    begin
      viSistemaRotinaId := TSistemaRotinaBusiness.BuscarSistemaRotinaId(
        vpChaveRotina,
        vpSistemaId);

      if viSistemaRotinaId <= 0 then
        raise Exception.CreateFmt(
          'Não foi possível identificar a rotina do sistema com base nas seguintes informações:%s' +
          'Chave Rotina: %s.%s' +
          'Sistema ID: %d.',
          [sLineBreak,
          vpChaveRotina,
          sLineBreak,
          vpSistemaId]);
    end;

    Result := TErroValidacao.Create(
      vpMensagem,
      vpPermiteAutorizacao,
      vpChaveRotina,
      vpTipoOperacao,
      vpSistemaId,
      viSistemaRotinaId);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

end.
