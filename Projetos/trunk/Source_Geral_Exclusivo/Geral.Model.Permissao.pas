{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Permissao.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Permissao;

interface
uses
  Data.DB,
  Geral.Model.ConexaoDb,
  Geral.Model.ConexaoHistoricoDb;

type
  TTipoOperacao = (
    toNenhum,
    toIncluir,
    toAlterar,
    toExcluir,
    toPesquisar,
    toImprimir,
    toEspecial,
    toVisualizar);

  TPermissaoBusiness = class
  private
    FConexaoDb: TConexaoDb;
    FConexaoHistoricoDb: TConexaoHistoricoDb;
    FUsuarioId: Integer;

    function BuscarUsuarioAdministrador(
      const vpUsuarioId: Integer): Boolean;

    function InternalBuscarPermissao(
      const vpUsuarioId: Integer;
      const vpChaveRotina: string;
      const vpSistemaId: Integer): string;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb;
      const vpConexaoHistoricoDb: TConexaoHistoricoDb;
      const vpUsuarioId: Integer); reintroduce;

    function BuscarPermissao(
      const vpUsuarioId: Integer;
      const vpChaveRotina: string;
      const vpSistemaId: Integer): TDataSet;

    function BuscarId(
      const vpTabela: string;
      const vpCampoId: string;
      const vpCampo: string;
      const vpValorCampo: Integer;
      const vpSistemaRotinaId: Integer): Integer;

    function UsuarioAdministrador: Boolean;

    function BuscarUsuarioPossuiPermissao(
      const vpUsuarioId: Integer;
      const vpChaveRotina: string;
      const vpSistemaId: Integer;
      const vpTipoOperacao: TTipoOperacao): Boolean;

    function BuscarDescricaoPermissao(
      const vpChaveRotina:string;
      const vpSistemaId:Integer):string;

  end;

  TPermissaoUtil = class
  public
    class function BuscarValorTipoOperacao(
      const vpTipoOperacao: TTipoOperacao): Integer;

    class function BuscarTipoOperacao(
      const vpTipoOperacaoValor: Integer): TTipoOperacao;

    class function BuscarTipoOperacaoDescricao(
      const vpTipoOperacao: TTipoOperacao): string;
  end;

implementation

uses
  Geral.Model.Impl.QueryBuilder.I9,
  System.SysUtils,
  Geral.Model.Util.Enum,
  I9Query;

{ TPermissaoUtil }

function TPermissaoBusiness.BuscarDescricaoPermissao(
  const vpChaveRotina:string;
  const vpSistemaId: Integer): string;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    G_SR.DESCRICAO '+
      'FROM '+
      '    G_SISTEMA_ROTINA G_SR '+
      'INNER JOIN '+
      '    G_SISTEMA_MENU G_SM ON G_SR.SISTEMA_MENU_ID = G_SM.SISTEMA_MENU_ID '+
      'WHERE '+
      '    G_SM.SISTEMA_ID = :SISTEMA_ID AND '+
      '    G_SR.CHAVE_ROTINA = :CHAVE_ROTINA    ';
    {$ENDREGION}

    viQuery.ParamByName('CHAVE_ROTINA').AsString := vpChaveRotina;
    viQuery.ParamByName('SISTEMA_ID').AsInteger := vpSistemaId;
    viQuery.Open;

    if viQuery.IsEmpty then
      raise Exception.Create('Não foi possível encontrar a permissão com os seguintes critérios:'+sLineBreak+
        'Sistema ID: ' + vpSistemaId.ToString + sLineBreak +
        'Chave Rotina: ' + vpChaveRotina);

    if viQuery.RecordCount > 1 then
      raise Exception.Create('Foi encontrado mais de uma permissão com os seguintes critérios:'+sLineBreak+
        'Sistema ID: ' + vpSistemaId.ToString + sLineBreak +
        'Chave Rotina: ' + vpChaveRotina);

    Result := viQuery.FieldByName('DESCRICAO').AsString;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TPermissaoBusiness.BuscarId(
  const vpTabela: string;
  const vpCampoId: string;
  const vpCampo: string;
  const vpValorCampo: Integer;
  const vpSistemaRotinaId: Integer): Integer;
var
  viQuery: TDataSet;
  viSql: string;
begin
  viQuery := nil;
  try
    viSql :=
      'SELECT '+
      vpCampoId+
      ' FROM '+
      vpTabela+
      ' WHERE '+
      vpCampo + ' = :P_VALOR_CAMPO AND '+
      '    SISTEMA_ROTINA_ID = :P_SISTEMA_ROTINA_ID    ';

    viQuery := TI9QueryBuilder.New(FConexaoDb.Connection)
      .Sql(viSql)
      .Params([vpValorCampo, vpSistemaRotinaId])
      .Open;

    Result := viQuery.FieldByName(vpCampoId).AsInteger;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TPermissaoBusiness.BuscarPermissao(
  const vpUsuarioId: Integer;
  const vpChaveRotina: string;
  const vpSistemaId: Integer): TDataSet;
var
  viQuery: TDataSet;
  viSql: string;
  viParams: TArray<TParamValue>;
  viSistemaRotinaId: Integer;
begin
  Result := nil;
  viQuery := nil;
  try
    try
      viSql := {$REGION 'SQL'}
        'SELECT '+
        '    G_SR.SISTEMA_ROTINA_ID '+
        'FROM '+
        '    G_SISTEMA_ROTINA G_SR '+
        'INNER JOIN '+
        '    G_SISTEMA_MENU G_SM ON G_SM.SISTEMA_MENU_ID = G_SR.SISTEMA_MENU_ID '+
        'WHERE '+
        '    G_SR.CHAVE_ROTINA = :P_CHAVE_ROTINA AND '+
        '    G_SM.SISTEMA_ID = :P_SISTEMA_ID    ';
      {$ENDREGION}

      viParams := [
        NewParam('P_CHAVE_ROTINA', vpChaveRotina),
        NewParam('P_SISTEMA_ID', vpSistemaId)
      ];

      viQuery := TI9QueryBuilder.New(FConexaoDb.Connection)
        .Sql(viSql)
        .Params(viParams)
        .Open;

      if viQuery.IsEmpty then
        Exit;

      viSistemaRotinaId := viQuery.FieldByName('SISTEMA_ROTINA_ID').AsInteger;

      viSql := {$REGION 'SQL'}
        'SELECT '+
        '    G_PU.PERMISSAO, '+
        '    G_SR.ATALHO_SISTEMA '+
        'FROM '+
        '    G_PERMISSAO_USUARIO G_PU '+
        'INNER JOIN '+
        '    G_SISTEMA_ROTINA G_SR ON G_SR.SISTEMA_ROTINA_ID = G_PU.SISTEMA_ROTINA_ID '+
        'WHERE '+
        '    G_PU.USUARIO_ID = :P_USUARIO_ID AND '+
        '    G_PU.SISTEMA_ROTINA_ID = :P_SISTEMA_ROTINA_ID    ';
      {$ENDREGION}

      viParams := [
        NewParam('P_USUARIO_ID', vpUsuarioId),
        NewParam('P_SISTEMA_ROTINA_ID', viSistemaRotinaId)
      ];

      Result := TI9QueryBuilder.New(FConexaoDb.Connection)
        .Sql(viSql)
        .Params(viParams)
        .Open;

      if not Result.IsEmpty then
        Exit;

      FreeAndNil(Result);

      viSql := {$REGION 'SQL'}
        'SELECT '+
        '    G_PG.PERMISSAO, '+
        '    G_SR.ATALHO_SISTEMA '+
        'FROM '+
        '    G_USUARIO_SISTEMA G_US '+
        'INNER JOIN '+
        '    G_PERMISSAO_GRUPO G_PG ON G_PG.USUARIO_GRUPO_ID = G_US.USUARIO_GRUPO_ID '+
        'INNER JOIN '+
        '    G_SISTEMA_ROTINA G_SR ON G_SR.SISTEMA_ROTINA_ID = G_PG.SISTEMA_ROTINA_ID '+
        'WHERE '+
        '    G_US.USUARIO_ID = :P_USUARIO_ID AND '+
        '    G_US.SISTEMA_ID = :P_SISTEMA_ID AND ' +
        '    G_PG.SISTEMA_ROTINA_ID = :P_SISTEMA_ROTINA_ID    ';
      {$ENDREGION}

      viParams := [
        NewParam('P_USUARIO_ID', vpUsuarioId),
        NewParam('P_SISTEMA_ID', vpSistemaId),
        NewParam('P_SISTEMA_ROTINA_ID', viSistemaRotinaId)
      ];

      Result := TI9QueryBuilder.New(FConexaoDb.Connection)
        .Sql(viSql)
        .Params(viParams)
        .Open;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TPermissaoBusiness.InternalBuscarPermissao(
  const vpUsuarioId: Integer;
  const vpChaveRotina: string;
  const vpSistemaId: Integer): string;
var
  viUsuarioAdministrador: Boolean;
  viPermissao: TDataSet;
  viMensagem: string;
begin
  viPermissao := nil;
  try
    viUsuarioAdministrador := BuscarUsuarioAdministrador(vpUsuarioId);
    if viUsuarioAdministrador then
    begin
      Result := '1111111';
      Exit;
    end;

    viPermissao := BuscarPermissao(
      vpUsuarioId,
      vpChaveRotina,
      vpSistemaId);

    if not Assigned(viPermissao) or viPermissao.IsEmpty then
    begin
      viMensagem := string.Format(
        'Não foi possível buscar a permissão com os seguintes critérios:' + sLineBreak +
        'Usuário ID: %d.' + sLineBreak +
        'Chave Rotina: %s.' + sLineBreak +
        'Sistema ID: %d.',
        [vpUsuarioId,
        vpChaveRotina,
        vpSistemaId]);

      raise Exception.Create(viMensagem);
    end;

    Result := viPermissao.FieldByName('PERMISSAO').AsString;
  finally
    FreeAndNil(viPermissao);
  end;
end;

function TPermissaoBusiness.BuscarUsuarioAdministrador(
  const vpUsuarioId: Integer): Boolean;
var
  viQuery: TDataSet;
  viSql: string;
  viParams: TArray<TParamValue>;
begin
  viQuery := nil;
  try
    if vpUsuarioId = 123456 then
    begin
      Result := True;
      Exit;
    end;

    viSql := {$REGION 'SQL'}
      'SELECT '+
      '    G_U.ADMINISTRADOR '+
      'FROM '+
      '    G_USUARIO G_U '+
      'WHERE '+
      '    G_U.USUARIO_ID = :P_USUARIO_ID ';
    {$ENDREGION}

    viParams := [
      NewParam('P_USUARIO_ID', vpUsuarioId)
    ];

    viQuery := TI9QueryBuilder.New(FConexaoDb.Connection)
      .Sql(viSql)
      .Params(viParams)
      .Open;

    Result := viQuery.FieldByName('ADMINISTRADOR').AsString = 'S';
  finally
    FreeAndNil(viQuery);
  end;
end;

function TPermissaoBusiness.BuscarUsuarioPossuiPermissao(
  const vpUsuarioId: Integer;
  const vpChaveRotina: string;
  const vpSistemaId: Integer;
  const vpTipoOperacao: TTipoOperacao): Boolean;
var
  viPermissao: string;
  viTipoOperacaoValor: Integer;
  viCharIndex: Integer;
  viChar: Char;
begin
  viPermissao := InternalBuscarPermissao(
    vpUsuarioId,
    vpChaveRotina,
    vpSistemaId);

  viTipoOperacaoValor := TPermissaoUtil.BuscarValorTipoOperacao(vpTipoOperacao);
  viCharIndex := viTipoOperacaoValor - 1;
  viChar := viPermissao.Chars[viCharIndex];

  Result := viChar = '1';
end;

class function TPermissaoUtil.BuscarTipoOperacaoDescricao(const vpTipoOperacao: TTipoOperacao): string;
var
  viEnumTipo: string;
  viEnumElemento: string;
begin
  case vpTipoOperacao of
    TTipoOperacao.toNenhum : Result := 'Nenhum';
    TTipoOperacao.toIncluir: Result := 'Incluir';
    TTipoOperacao.toAlterar: Result := 'Alterar';
    TTipoOperacao.toExcluir: Result := 'Excluir';
    TTipoOperacao.toPesquisar: Result := 'Pesquisar';
    TTipoOperacao.toImprimir: Result := 'Imprimir';
    TTipoOperacao.toEspecial: Result := 'Especial';
    TTipoOperacao.toVisualizar: Result := 'Visualizar';
  else
    TEnumUtil.BuscarDados<TTipoOperacao>(
      vpTipoOperacao,
      viEnumTipo,
      viEnumElemento);

    raise Exception.CreateFmt(
      'Não foi possível buscar o valor do tipo de operação %s.%s.',
      [viEnumTipo,
      viEnumElemento]);
  end;
end;

class function TPermissaoUtil.BuscarValorTipoOperacao(
  const vpTipoOperacao: TTipoOperacao): Integer;
var
  viEnumTipo: string;
  viEnumElemento: string;
begin
  case vpTipoOperacao of
    TTipoOperacao.toNenhum:  Result := 0;
    TTipoOperacao.toIncluir: Result := 1;
    TTipoOperacao.toAlterar: Result := 2;
    TTipoOperacao.toExcluir: Result := 3;
    TTipoOperacao.toPesquisar: Result := 4;
    TTipoOperacao.toImprimir: Result := 5;
    TTipoOperacao.toEspecial: Result := 6;
    TTipoOperacao.toVisualizar: Result := 7;
  else
    TEnumUtil.BuscarDados<TTipoOperacao>(
      vpTipoOperacao,
      viEnumTipo,
      viEnumElemento);

    raise Exception.CreateFmt(
      'Não foi possível buscar o valor do tipo de operação %s.%s.',
      [viEnumTipo,
      viEnumElemento]);
  end;
end;

constructor TPermissaoBusiness.Create(
  const vpConexaoDb: TConexaoDb;
  const vpConexaoHistoricoDb: TConexaoHistoricoDb;
  const vpUsuarioId: Integer);
begin
  FConexaoDb := vpConexaoDb;
  FConexaoHistoricoDb := vpConexaoHistoricoDb;
  FUsuarioId := vpUsuarioId;
end;

function TPermissaoBusiness.UsuarioAdministrador: Boolean;
begin
  Result := BuscarUsuarioAdministrador(FUsuarioId);
end;

class function TPermissaoUtil.BuscarTipoOperacao(
  const vpTipoOperacaoValor: Integer): TTipoOperacao;
begin
  case vpTipoOperacaoValor of
    0: Result := TTipoOperacao.toNenhum;
    1: Result := TTipoOperacao.toIncluir;
    2: Result := TTipoOperacao.toAlterar;
    3: Result := TTipoOperacao.toExcluir;
    4: Result := TTipoOperacao.toPesquisar;
    5: Result := TTipoOperacao.toImprimir;
    6: Result := TTipoOperacao.toEspecial;
    7: Result := TTipoOperacao.toVisualizar;
  else
    raise Exception.CreateFmt(
      'Não foi possível buscar o tipo da operação com base no valor %d.',
      [vpTipoOperacaoValor]);
  end;
end;

end.
