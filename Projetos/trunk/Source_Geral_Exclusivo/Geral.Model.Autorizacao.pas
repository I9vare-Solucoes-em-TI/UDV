{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Autorizacao.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Autorizacao;

interface

uses
  Geral.Model.Permissao,
  System.Generics.Collections,
  Geral.Model.ConexaoDb;

type
  TAutorizacao = class
  private
    FAutorizacaoId: Integer;
    FDataAutorizacao: TDateTime;
    FSolicitanteId: Integer;
    FSistemaRotinaId: Integer;
    FTipoOperacao: TTipoOperacao;
    FTabela: string;
    FCampoId: Integer;
    FAutorizanteId: Integer;
    FJustificativa: string;
  public
    property AutorizacaoId: Integer read FAutorizacaoId write FAutorizacaoId;
    property DataAutorizacao: TDateTime read FDataAutorizacao write FDataAutorizacao;
    property SolicitanteId: Integer read FSolicitanteId write FSolicitanteId;
    property SistemaRotinaId: Integer read FSistemaRotinaId write FSistemaRotinaId;
    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    property Tabela: string read FTabela write FTabela;
    property CampoId: Integer read FCampoId write FCampoId;
    property AutorizanteId: Integer read FAutorizanteId write FAutorizanteId;
    property Justificativa: string read FJustificativa write FJustificativa;
  end;

  TAutorizacaoBusiness = class
  private
    FConexaoDb: TConexaoDb;
    FUsuarioId: Integer;

  public
    constructor Create(
      const vpConexaoDb: TConexaoDb;
      const vpUsuarioId: Integer); reintroduce;

    function CriarAutorizacao(
      const vpSistemaRotinaId: Integer;
      const vpTipoOperacao: TTipoOperacao;
      const vpAutorizanteId: Integer): TAutorizacao;

    function VerificarAutorizacao(
      const vpSistemaRotinaId: Integer;
      const vpTipoOperacao: TTipoOperacao;
      const vpListaAutorizacao: TObjectList<TAutorizacao>): Boolean;

    procedure SalvarAutorizacao(
      const vpAutorizacao: TAutorizacao);

    procedure Excluir(
      const vpTabela: string;
      const vpCampoId: Integer);
  end;

implementation

uses
  System.SysUtils,
  I9Query,
  Geral.Model.Sequencia,
  Data.DB;

{ TAutorizacaoBusiness }

constructor TAutorizacaoBusiness.Create(
  const vpConexaoDb: TConexaoDb;
  const vpUsuarioId: Integer);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
  FUsuarioId := vpUsuarioId;
end;

function TAutorizacaoBusiness.CriarAutorizacao(
  const vpSistemaRotinaId: Integer;
  const vpTipoOperacao: TTipoOperacao;
  const vpAutorizanteId: Integer): TAutorizacao;
begin
  Result := nil;
  try
    Result := TAutorizacao.Create;

    Result.DataAutorizacao := FConexaoDb.BuscarDataHoraBanco;

    Result.SolicitanteId   := FUsuarioId;
    Result.SistemaRotinaId := vpSistemaRotinaId;
    Result.TipoOperacao    := vpTipoOperacao;
    Result.AutorizanteId   := vpAutorizanteId;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

procedure TAutorizacaoBusiness.Excluir(
  const vpTabela: string;
  const vpCampoId: Integer);
var
  viQuery: TI9Query;
  viInTransaction: Boolean;
begin
  viQuery := nil;
  try
    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      viQuery := TI9Query.Create(nil);
      viQuery.Connection := FConexaoDb.Connection;

      viQuery.SQL.Text := {$REGION 'SQL'}
        'DELETE '+
        'FROM '+
        '    G_AUTORIZACAO G_A '+
        'WHERE '+
        '    G_A.TABELA = :TABELA AND '+
        '    G_A.CAMPO_ID = :CAMPO_ID ';
      {$ENDREGION}

      viQuery.ParamByName('TABELA').AsString := vpTabela;
      viQuery.ParamByName('CAMPO_ID').AsInteger := vpCampoId;
      viQuery.ExecSQL;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TAutorizacaoBusiness.SalvarAutorizacao(
  const vpAutorizacao: TAutorizacao);
var
  viSql: string;
  viQuery: TI9Query;
  viSequenciaBusiness: TSequenciaBusiness;
begin
  viQuery := nil;
  viSequenciaBusiness := nil;

  {$REGION 'SQL Insersão G_AUTORIZACAO'}
  viSql := 'INSERT INTO G_AUTORIZACAO ( '+
           '    AUTORIZACAO_ID, '+
           '    DATA_AUTORIZACAO, '+
           '    SOLICITANTE_ID, '+
           '    SISTEMA_ROTINA_ID, '+
           '    TIPO_OPERACAO, '+
           '    TABELA, '+
           '    CAMPO_ID, '+
           '    JUSTIFICATIVA, '+
           '    AUTORIZANTE_ID) '+
           '  VALUES ( '+
           '    :AUTORIZACAO_ID, '+
           '    :DATA_AUTORIZACAO, '+
           '    :SOLICITANTE_ID, '+
           '    :SISTEMA_ROTINA_ID, '+
           '    :TIPO_OPERACAO, '+
           '    :TABELA, '+
           '    :CAMPO_ID, '+
           '    :JUSTIFICATIVA, '+
           '    :AUTORIZANTE_ID) ';
  {$ENDREGION}

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
    viQuery.SQL.Text := viSql;

    {$REGION 'Parâmetros Inserção'}

    viSequenciaBusiness := TSequenciaBusiness.Create(
      FConexaoDb);

    viQuery.ParamByName('AUTORIZACAO_ID').AsInteger    := viSequenciaBusiness.GerarSequencia('G_AUTORIZACAO');
    viQuery.ParamByName('DATA_AUTORIZACAO').AsDateTime := vpAutorizacao.DataAutorizacao;
    viQuery.ParamByName('SOLICITANTE_ID').AsInteger    := vpAutorizacao.SolicitanteId;
    viQuery.ParamByName('SISTEMA_ROTINA_ID').AsInteger := vpAutorizacao.SistemaRotinaId;
    viQuery.ParamByName('TIPO_OPERACAO').AsInteger     := Ord(vpAutorizacao.TipoOperacao)+1;
    viQuery.ParamByName('TABELA').AsString             := vpAutorizacao.Tabela;
    viQuery.ParamByName('CAMPO_ID').AsInteger          := vpAutorizacao.CampoId;

    if vpAutorizacao.AutorizanteId >0  then
      viQuery.ParamByName('AUTORIZANTE_ID').AsInteger    := vpAutorizacao.AutorizanteId
    else
    begin
      viQuery.ParamByName('AUTORIZANTE_ID').Bound := True;
      viQuery.ParamByName('AUTORIZANTE_ID').DataType := TFieldType.ftInteger;
      viQuery.ParamByName('AUTORIZANTE_ID').Clear;
    end;


    if not vpAutorizacao.Justificativa.IsEmpty then
      viQuery.ParamByName('JUSTIFICATIVA').AsString      := vpAutorizacao.Justificativa
    else
    begin
      viQuery.ParamByName('JUSTIFICATIVA').Bound := True;
      viQuery.ParamByName('JUSTIFICATIVA').DataType := TFieldType.ftString;
      viQuery.ParamByName('JUSTIFICATIVA').Clear;
    end;


    {$ENDREGION}

    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
    FreeAndNil(viSequenciaBusiness);
  end;

end;

function TAutorizacaoBusiness.VerificarAutorizacao(
  const vpSistemaRotinaId: Integer;
  const vpTipoOperacao: TTipoOperacao;
  const vpListaAutorizacao: TObjectList<TAutorizacao>): Boolean;
var
  viAutorizacao: TAutorizacao;
begin
  Result := False;

  if not Assigned(vpListaAutorizacao) then
    Exit;

  for viAutorizacao in vpListaAutorizacao do
  begin
    if (vpSistemaRotinaId = viAutorizacao.SistemaRotinaId) and
      (vpTipoOperacao = viAutorizacao.TipoOperacao) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

end.
