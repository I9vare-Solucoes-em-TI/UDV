unit Geral.Model.Autorizacao;

interface

uses
  Geral.Model.Permissao,
  System.Generics.Collections;

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
  public
    property AutorizacaoId: Integer read FAutorizacaoId write FAutorizacaoId;
    property DataAutorizacao: TDateTime read FDataAutorizacao write FDataAutorizacao;
    property SolicitanteId: Integer read FSolicitanteId write FSolicitanteId;
    property SistemaRotinaId: Integer read FSistemaRotinaId write FSistemaRotinaId;
    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    property Tabela: string read FTabela write FTabela;
    property CampoId: Integer read FCampoId write FCampoId;
    property AutorizanteId: Integer read FAutorizanteId write FAutorizanteId;
  end;

  TAutorizacaoBusiness = class
  public
    class function CriarAutorizacao(
      const vpSistemaRotinaId: Integer;
      const vpTipoOperacao: TTipoOperacao;
      const vpAutorizanteId: Integer): TAutorizacao;

    class function VerificarAutorizacao(
      const vpSistemaRotinaId: Integer;
      const vpTipoOperacao: TTipoOperacao;
      const vpListaAutorizacao: TObjectList<TAutorizacao>): Boolean;

    class procedure SalvarAutorizacao(
      const vpAutorizacao: TAutorizacao);
  end;

implementation

uses
  System.SysUtils,
  I9Query,
  Controles;

{ TAutorizacaoBusiness }

class function TAutorizacaoBusiness.CriarAutorizacao(
  const vpSistemaRotinaId: Integer;
  const vpTipoOperacao: TTipoOperacao;
  const vpAutorizanteId: Integer): TAutorizacao;
begin
  Result := nil;
  try
    Result := TAutorizacao.Create;

    Result.DataAutorizacao := dtmControles.DataHoraBanco(
      3,
      False);

    Result.SolicitanteId   := Controles.vgUsuarioID.ToInteger;
    Result.SistemaRotinaId := vpSistemaRotinaId;
    Result.TipoOperacao    := vpTipoOperacao;
    Result.AutorizanteId   := vpAutorizanteId;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class procedure TAutorizacaoBusiness.SalvarAutorizacao(
  const vpAutorizacao: TAutorizacao);
var
  viSql: string;
  viQuery: TI9Query;
begin
  viQuery := nil;

  {$REGION 'SQL Insersão G_AUTORIZACAO'}
  viSql := 'INSERT INTO G_AUTORIZACAO ( '+
           '    AUTORIZACAO_ID, '+
           '    DATA_AUTORIZACAO, '+
           '    SOLICITANTE_ID, '+
           '    SISTEMA_ROTINA_ID, '+
           '    TIPO_OPERACAO, '+
           '    TABELA, '+
           '    CAMPO_ID, '+
           '    AUTORIZANTE_ID) '+
           '  VALUES ( '+
           '    :AUTORIZACAO_ID, '+
           '    :DATA_AUTORIZACAO, '+
           '    :SOLICITANTE_ID, '+
           '    :SISTEMA_ROTINA_ID, '+
           '    :TIPO_OPERACAO, '+
           '    :TABELA, '+
           '    :CAMPO_ID, '+
           '    :AUTORIZANTE_ID); ';
  {$ENDREGION}

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;
    viQuery.SQL.Text := viSql;

    {$REGION 'Parâmetros Inserção'}
    viQuery.ParamByName('AUTORIZACAO_ID').AsInteger    := dtmControles.GerarSequencia('G_AUTORIZACAO');
    viQuery.ParamByName('DATA_AUTORIZACAO').AsDateTime := vpAutorizacao.DataAutorizacao;
    viQuery.ParamByName('SOLICITANTE_ID').AsInteger    := vpAutorizacao.SolicitanteId;
    viQuery.ParamByName('SISTEMA_ROTINA_ID').AsInteger := vpAutorizacao.SistemaRotinaId;
    viQuery.ParamByName('TIPO_OPERACAO').AsInteger     := Ord(vpAutorizacao.TipoOperacao)+1;
    viQuery.ParamByName('TABELA').AsString             := vpAutorizacao.Tabela;
    viQuery.ParamByName('CAMPO_ID').AsInteger          := vpAutorizacao.CampoId;
    viQuery.ParamByName('AUTORIZANTE_ID').AsInteger    := vpAutorizacao.AutorizanteId;
    {$ENDREGION}

    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;

end;

class function TAutorizacaoBusiness.VerificarAutorizacao(
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
    if (vpSistemaRotinaId = viAutorizacao.SistemaRotinaId) and
      (vpTipoOperacao = viAutorizacao.TipoOperacao) then
    begin
      Result := True;
      Exit;
    end;
end;

end.
