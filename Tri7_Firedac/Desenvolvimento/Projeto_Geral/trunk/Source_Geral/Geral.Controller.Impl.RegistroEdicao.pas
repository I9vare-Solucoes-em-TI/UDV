unit Geral.Controller.Impl.RegistroEdicao;

interface

uses
  Geral.Controller.Spec.RegistroEdicao,
  Data.DB;

type
  TControleRegistroEdicao = class(TInterfacedObject, IControleRegistroEdicao)
  private
    function CriarDataSet: TDataSet;

    function RegistroEdicao(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string): TDataSet;

    function Inserir(
      const vpRegistroEdicao: TDataSet): Integer;
  public
    function Bloquear(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string): TDataSet;

    function VerificarBloqueio(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpTimeoutSegundos: Integer): TDataSet;

    function Desbloquear(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpUsuarioID: Integer): Integer;

    class function New: IControleRegistroEdicao;
  end;

implementation

uses
  System.SysUtils,
  Controles,
  Rotinas,
  I9MemTable,
  System.DateUtils,
  System.StrUtils,
  I9Query;

{ TControleRegistroEdicao }

function TControleRegistroEdicao.Bloquear(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string): TDataSet;
{$REGION 'Variáveis'}
var
  viInTransaction: Boolean;
  viRegistroEdicaoID: Integer;
  viData: TDateTime;
  viIP_Maquina: string;
  viNomeEstacao: string;
  viUsuarioID: Integer;
{$ENDREGION}
begin
  Result := CriarDataSet;

  viInTransaction := dtmControles.DB.InTransaction;
  if not viInTransaction then
    dtmControles.DB.StartTransaction;

  try
    Result.Append;

    viRegistroEdicaoID := dtmControles.GerarSequencia(
      'G_REGISTRO_EDICAO');

    Result.FieldByName(
      'REGISTRO_EDICAO_ID').AsInteger := viRegistroEdicaoID;

    Result.FieldByName(
      'TABELA').AsString := vpTabela;

    Result.FieldByName(
      'CHAVE').AsInteger := vpChave;

    Result.FieldByName(
      'CAMPO').AsString := vpCampo;

    viData := dtmControles.DataHoraBanco(
      3);

    Result.FieldByName(
      'DATA').AsDateTime := viData;

    viIP_Maquina := Rotinas.RetornaIP;

    Result.FieldByName(
      'IP_MAQUINA').AsString := viIP_Maquina;

    viNomeEstacao := Rotinas.NomeEstacao;

    Result.FieldByName(
      'NOME_ESTACAO').AsString := viNomeEstacao;

    viUsuarioID := vgUsuarioID.ToInteger;

    Result.FieldByName(
      'USUARIO_ID').AsInteger := viUsuarioID;

    Result.FieldByName(
      'LOGIN').AsString := vgLogin;

    Result.Post;

    Inserir(
      Result);

    if not viInTransaction then
      dtmControles.DB.Commit;
  except
    on E: Exception do
    begin
      if not viInTransaction then
        dtmControles.DB.Rollback;

      raise Exception.CreateFmt(
        'Não foi possível bloquear devido ao motivo abaixo:%s%s.',
        [DupeString(
          sLineBreak,
          2),
        E.Message]);
    end;
  end;
end;

function TControleRegistroEdicao.CriarDataSet: TDataSet;
{$REGION 'Variáveis'}
var
  viResult: TI9MemTable;
  viField: TField;
{$ENDREGION}
begin
  viResult := TI9MemTable.Create(
    nil);

  Result := viResult;

  {$REGION 'Criar campos'}
  viField := TIntegerField.Create(Result);
  viField.FieldName := 'REGISTRO_EDICAO_ID';
  viField.DataSet := Result;

  viField := TStringField.Create(Result);
  viField.FieldName := 'TABELA';
  viField.DataSet := Result;
  viField.Size := 60;

  viField := TIntegerField.Create(Result);
  viField.FieldName := 'CHAVE';
  viField.DataSet := Result;

  viField := TStringField.Create(Result);
  viField.FieldName := 'CAMPO';
  viField.DataSet := Result;
  viField.Size := 60;

  viField := TDateTimeField.Create(Result);
  viField.FieldName := 'DATA';
  viField.DataSet := Result;

  viField := TStringField.Create(Result);
  viField.FieldName := 'IP_MAQUINA';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TStringField.Create(Result);
  viField.FieldName := 'NOME_ESTACAO';
  viField.DataSet := Result;
  viField.Size := 60;

  viField := TIntegerField.Create(Result);
  viField.FieldName := 'USUARIO_ID';
  viField.DataSet := Result;

  viField := TStringField.Create(Result);
  viField.FieldName := 'LOGIN';
  viField.DataSet := Result;
  viField.Size := 30;
  {$ENDREGION}

  Result.Open;
end;

function TControleRegistroEdicao.Desbloquear(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string;
  const vpUsuarioID: Integer): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viInTransaction: Boolean;
{$ENDREGION}
begin
  Result := 0;

  viQuery := TI9Query.Create(
    nil);

  try
    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;

    try
      viQuery.Connection := dtmControles.DB;

      viQuery.SQL.Text := {$REGION 'Comando SQL DELETE'}
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_REGISTRO_EDICAO G_RE ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'G_RE.TABELA = :P_TABELA AND ' +
        'G_RE.CHAVE = :P_CHAVE AND ' +
        'G_RE.CAMPO = :P_CAMPO AND ' +
        'G_RE.USUARIO_ID = :P_USUARIO_ID';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preecher valores dos parâmetros'}
      viQuery.ParamByName(
        'P_TABELA').AsString := vpTabela;

      viQuery.ParamByName(
        'P_CHAVE').AsInteger := vpChave;

      viQuery.ParamByName(
        'P_CAMPO').AsString := vpCampo;

      viQuery.ParamByName(
        'P_USUARIO_ID').AsInteger := vpUsuarioID;
      {$ENDREGION}

      Result := viQuery.ExecSQL;

      if not viInTransaction then
        dtmControles.DB.Commit;
    except
      on E: Exception do
      begin
        if not viInTransaction then
          dtmControles.DB.Rollback;

        raise Exception.CreateFmt(
          'Não foi possível desbloquear devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          E.Message]);
      end;
    end;
  finally
    viQuery.Free;
  end;
end;

function TControleRegistroEdicao.Inserir(
  const vpRegistroEdicao: TDataSet): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viRegistroEdicaoID: Integer;
  viTabela: string;
  viChave: Integer;
  viCampo: string;
  viUsuarioID: Integer;
  viData: TDateTime;
  viIP_Maquina: string;
  viNomeEstacao: string;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL INSERT'}
      'INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_REGISTRO_EDICAO ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'REGISTRO_EDICAO_ID, ' +
      'TABELA, ' +
      'CHAVE, ' +
      'CAMPO, ' +
      'USUARIO_ID, ' +
      'DATA, ' +
      'IP_MAQUINA, ' +
      'NOME_ESTACAO' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusula VALUES e Parâmetros'}
      'VALUES ' +
      '(' +
      ':P_REGISTRO_EDICAO_ID, ' +
      ':P_TABELA, ' +
      ':P_CHAVE, ' +
      ':P_CAMPO, ' +
      ':P_USUARIO_ID, ' +
      ':P_DATA, ' +
      ':P_IP_MAQUINA, ' +
      ':P_NOME_ESTACAO' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viRegistroEdicaoID := vpRegistroEdicao.FieldByName(
      'REGISTRO_EDICAO_ID').AsInteger;

    viQuery.ParamByName(
      'P_REGISTRO_EDICAO_ID').AsInteger := viRegistroEdicaoID;

    viTabela := vpRegistroEdicao.FieldByName(
      'TABELA').AsString;

    viQuery.ParamByName(
      'P_TABELA').AsString := viTabela;

    viChave := vpRegistroEdicao.FieldByName(
      'CHAVE').AsInteger;

    viQuery.ParamByName(
      'P_CHAVE').AsInteger := viChave;

    viCampo := vpRegistroEdicao.FieldByName(
      'CAMPO').AsString;

    viQuery.ParamByName(
      'P_CAMPO').AsString := viCampo;

    viUsuarioID := vpRegistroEdicao.FieldByName(
      'USUARIO_ID').AsInteger;

    viQuery.ParamByName(
      'P_USUARIO_ID').AsInteger := viUsuarioID;

    viData := vpRegistroEdicao.FieldByName(
      'DATA').AsDateTime;

    viQuery.ParamByName(
      'P_DATA').AsDateTime := viData;

    viIP_Maquina := vpRegistroEdicao.FieldByName(
      'IP_MAQUINA').AsString;

    viQuery.ParamByName(
      'P_IP_MAQUINA').AsString := viIP_Maquina;

    viNomeEstacao := vpRegistroEdicao.FieldByName(
      'NOME_ESTACAO').AsString;

    viQuery.ParamByName(
      'P_NOME_ESTACAO').AsString := viNomeEstacao;
    {$ENDREGION}

    Result := viQuery.ExecSQL;
  finally
    viQuery.Free;
  end;
end;

class function TControleRegistroEdicao.New: IControleRegistroEdicao;
begin
  Result := Create;
end;

function TControleRegistroEdicao.RegistroEdicao(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string): TDataSet;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  Result := viQuery;

  viQuery.Connection := dtmControles.DB;

  viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_RE.REGISTRO_EDICAO_ID, ' +
    'G_RE.TABELA, ' +
    'G_RE.CHAVE, ' +
    'G_RE.CAMPO, ' +
    'G_RE.DATA, ' +
    'G_RE.IP_MAQUINA, ' +
    'G_RE.NOME_ESTACAO, ' +
    'G_U.USUARIO_ID, ' +
    'G_U.LOGIN ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_REGISTRO_EDICAO G_RE ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_USUARIO G_U ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_U.USUARIO_ID = G_RE.USUARIO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_RE.TABELA = :P_TABELA AND ' +
    'G_RE.CHAVE = :P_CHAVE AND ' +
    'G_RE.CAMPO = :P_CAMPO';
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'Preencher valores dos parâmetros'}
  viQuery.ParamByName(
    'P_TABELA').AsString := vpTabela;

  viQuery.ParamByName(
    'P_CHAVE').AsInteger := vpChave;

  viQuery.ParamByName(
    'P_CAMPO').AsString := vpCampo;
  {$ENDREGION}

  Result.Open;
end;

function TControleRegistroEdicao.VerificarBloqueio(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string;
  const vpTimeoutSegundos: Integer): TDataSet;
{$REGION 'Variáveis'}
var
  viRegistroEdicao: TDataSet;
  viDataAtual: TDateTime;
  viData: TDateTime;
  viIntervaloSegundos: Double;
  viUsuarioID: Integer;
{$ENDREGION}
begin
  Result := CriarDataSet;

  viRegistroEdicao := RegistroEdicao(
    vpTabela,
    vpChave,
    vpCampo);

  try
    if viRegistroEdicao.IsEmpty then
      Exit;

    viDataAtual := dtmControles.DataHoraBanco(
      3);

    viData := viRegistroEdicao.FieldByName(
      'DATA').AsDateTime;

    viIntervaloSegundos := SecondSpan(
      viDataAtual,
      viData);

    if viIntervaloSegundos > vpTimeoutSegundos then
    begin
      viUsuarioID := viRegistroEdicao.FieldByName(
        'USUARIO_ID').AsInteger;

      Desbloquear(
        vpTabela,
        vpChave,
        vpCampo,
        viUsuarioID);

      Exit;
    end;

    Result.Append;

    Result.CopyFields(
      viRegistroEdicao);

    Result.Post;
  finally
    viRegistroEdicao.Close;
    viRegistroEdicao.Free;
  end;
end;

end.
