{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Validacao.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Validacao;

interface

uses
  Geral.Model.Permissao,
  System.Generics.Collections,
  Geral.Model.Autorizacao,
  Geral.Model.ConexaoDb;

type
  TErroValidacao = class
  private
    FMensagem: string;
    FPermiteAutorizacao: Boolean;
    FDescricaoRotina: string;
    FChaveRotina: string;
    FTipoOperacao: TTipoOperacao;
    FSistemaId: Integer;
    FSistemaRotinaId: Integer;

  public
    constructor Create(
      const vpMensagem: string;
      const vpPermiteAutorizacao: Boolean;
      const vpDescricaoRotina: string;
      const vpChaveRotina: string;
      const vpTipoOperacao: TTipoOperacao;
      const vpSistemaId: Integer;
      const vpSistemaRotinaId: Integer); reintroduce;

    property Mensagem: string read FMensagem;
    property PermiteAutorizacao: Boolean read FPermiteAutorizacao;
    property DescricaoRotina: string read FDescricaoRotina;
    property ChaveRotina: string read FChaveRotina;
    property TipoOperacao: TTipoOperacao read FTipoOperacao;
    property SistemaId: Integer read FSistemaId;
    property SistemaRotinaId: Integer read FSistemaRotinaId;
  end;

  TErroValidacaoBusiness = class
  private
    FConexaoDb: TConexaoDb;
    FUsuarioId: Integer;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb;
      const vpUsuarioId: Integer); reintroduce;

    function CriarErroValidacao(
      const vpMensagem: string;
      const vpPermiteAutorizacao: Boolean;
      const vpChaveRotina: string;
      const vpTipoOperacao: TTipoOperacao;
      const vpSistemaId: Integer): TErroValidacao; overload;

    function CriarErroValidacao(
      const vpMensagem: string): TErroValidacao; overload;

    function ValidarAutorizacao(
      const vpListaErroValidacao: TObjectList<TErroValidacao>;
      const vpListaAutorizacao: TObjectList<TAutorizacao>): Boolean;

    { TODO : Criar metodo estático de construção de texto fixo baseado na lista de erros }
  end;

implementation

uses
  System.SysUtils,
  Geral.Model.SistemaRotina;

{ TErroValidacao }

constructor TErroValidacao.Create(
  const vpMensagem: string;
  const vpPermiteAutorizacao: Boolean;
  const vpDescricaoRotina: string;
  const vpChaveRotina: string;
  const vpTipoOperacao: TTipoOperacao;
  const vpSistemaId: Integer;
  const vpSistemaRotinaId: Integer);
begin
  inherited Create;
  FMensagem := vpMensagem;
  FPermiteAutorizacao := vpPermiteAutorizacao;
  FDescricaoRotina := vpDescricaoRotina;
  FChaveRotina := vpChaveRotina;
  FTipoOperacao := vpTipoOperacao;
  FSistemaId := vpSistemaId;
  FSistemaRotinaId := vpSistemaRotinaId;
end;

{ TErroValidacaoBusiness }

function TErroValidacaoBusiness.CriarErroValidacao(
  const vpMensagem: string;
  const vpPermiteAutorizacao: Boolean;
  const vpChaveRotina: string;
  const vpTipoOperacao: TTipoOperacao;
  const vpSistemaId: Integer): TErroValidacao;
var
  viSistemaRotinaId: Integer;
  viSistemaRotinaBusiness: TSistemaRotinaBusiness;
  viDescricaoRotina: string;
begin
  Result := nil;
  viSistemaRotinaBusiness := nil;
  viDescricaoRotina := EmptyStr;

  try
    try
      viSistemaRotinaId := 0;

      if vpPermiteAutorizacao then
      begin
        viSistemaRotinaBusiness := TSistemaRotinaBusiness.Create(
          FConexaoDb,
          FUsuarioId);

        viSistemaRotinaId := viSistemaRotinaBusiness.BuscarSistemaRotinaId(
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

        viDescricaoRotina := viSistemaRotinaBusiness.BuscarDescricaoRotina(viSistemaRotinaId);
      end;

      Result := TErroValidacao.Create(
        vpMensagem,
        vpPermiteAutorizacao,
        viDescricaoRotina,
        vpChaveRotina,
        vpTipoOperacao,
        vpSistemaId,
        viSistemaRotinaId);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    FreeAndNil(viSistemaRotinaBusiness);
  end;
end;

constructor TErroValidacaoBusiness.Create(
  const vpConexaoDb: TConexaoDb;
  const vpUsuarioId: Integer);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
  FUsuarioId := vpUsuarioId;
end;

function TErroValidacaoBusiness.CriarErroValidacao(
  const vpMensagem: string): TErroValidacao;
begin
  Result := CriarErroValidacao(
    vpMensagem,
    False,
    '',
    TTipoOperacao.toNenhum,
    0);
end;

function TErroValidacaoBusiness.ValidarAutorizacao(
  const vpListaErroValidacao: TObjectList<TErroValidacao>;
  const vpListaAutorizacao: TObjectList<TAutorizacao>): Boolean;
var
  viErroValidacao: TErroValidacao;
  viAutorizacaoBusiness: TAutorizacaoBusiness;
begin
  Result := False;
  viAutorizacaoBusiness := nil;

  try
    viAutorizacaoBusiness := TAutorizacaoBusiness.Create(
      FConexaoDb,
      FUsuarioId);

    for viErroValidacao in vpListaErroValidacao do
    begin
      if not viErroValidacao.PermiteAutorizacao then
        raise Exception.Create(viErroValidacao.Mensagem);

      if not viAutorizacaoBusiness.VerificarAutorizacao(
        viErroValidacao.SistemaRotinaId,
        viErroValidacao.TipoOperacao,
        vpListaAutorizacao) then
        raise Exception.Create(viErroValidacao.Mensagem);

    end;

    Result := True;
  finally
    FreeAndNil(viAutorizacaoBusiness);
  end;
end;

end.
