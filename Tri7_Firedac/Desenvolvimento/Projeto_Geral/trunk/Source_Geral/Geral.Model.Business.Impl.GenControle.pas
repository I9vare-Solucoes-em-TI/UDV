unit Geral.Model.Business.Impl.GenControle;

interface

uses
  Geral.Model.Business.Spec.GenControle,
  Geral.Model.Entity.Spec.GenControle,
  I9Connection,
  Geral.Model.Entity.Spec.Maybe,
  I9Query,
  I9Transaction;

type
  TDataHoraServidor = reference to function: TDateTime;

  TGenControleBusiness = class(TInterfacedObject, IGenControleBusiness)
  private
    FConnection: TI9Connection;
    FDataHoraServidor: TDataHoraServidor;

    function GetDisponivel(
      const vpNomeGenerator: string;
      const vpTransaction: TI9Transaction): IMaybe<IGenControle>;

    function SetEmUso(
      const vpGenControle: IGenControle;
      const vpTransaction: TI9Transaction): IGenControle;

    function AtualizarStatus(
      const vpGenControle: IGenControle;
      const vpTransaction: TI9Transaction): Integer;

    function IncrementarGenerator(
      const vpNomeGenerator: string): Integer;

    function Inserir(
      const vpGenControle: IGenControle;
      const vpTransaction: TI9Transaction): Integer;

    function SetStatus(
      const vpGenControle: IGenControle;
      const vpStatus: string;
      const vpTransaction: TI9Transaction): IGenControle;

    function StatusDisponivel: string;
    function StatusEmUso: string;

    function GetEmUsoDeadlock(
      const vpNomeGenerator: string;
      const vpTransaction: TI9Transaction): IGenControle;

    procedure PreencherParametros(
      const vpQuery: TI9Query;
      const vpGenControle: IGenControle);

    constructor Create(
      const vpConnection: TI9Connection;
      const vpDataHoraServidor: TDataHoraServidor); reintroduce;
  public
    class function New(
      const vpConnection: TI9Connection;
      const vpDataHoraServidor: TDataHoraServidor): IGenControleBusiness;

    function GerarSequencia(
      const vpNomeGenerator: string): IGenControle;

    function Excluir(
      const vpGenControle: IGenControle): Integer;

    function SetDisponivel(
      const vpGenControle: IGenControle): IGenControle;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.GenControle,
  System.SysUtils,
  FireDAC.Stan.Param,
  Data.DB,
  System.DateUtils;

{ TGenControleBusiness }

function TGenControleBusiness.AtualizarStatus(
  const vpGenControle: IGenControle;
  const vpTransaction: TI9Transaction): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viQuery.Transaction := vpTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE'}

      {$REGION 'Cláusula UPDATE'}
      'UPDATE ' +
      'G_GEN_CONTROLE G_GC ' +
      {$ENDREGION}

      {$REGION 'Cláusula SET, Colunas e Parâmetros'}
      'SET ' +
      'G_GC.STATUS = :P_STATUS, ' +
      'G_GC.DATA_CONTROLE = :P_DATA_CONTROLE ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_GC.NOME_GENERATOR = :P_NOME_GENERATOR AND ' +
      'G_GC.SEQUENCIA = :P_SEQUENCIA';
      {$ENDREGION}

    {$ENDREGION}

    PreencherParametros(
      viQuery,
      vpGenControle);

    Result := viQuery.ExecSQL;
  finally
    viQuery.Free;
  end;
end;

constructor TGenControleBusiness.Create(
  const vpConnection: TI9Connection;
  const vpDataHoraServidor: TDataHoraServidor);
begin
  inherited Create;
  FConnection := vpConnection;
  FDataHoraServidor := vpDataHoraServidor;
end;

function TGenControleBusiness.Excluir(
  const vpGenControle: IGenControle): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viTransaction: TI9Transaction;
{$ENDREGION}
begin
  Result := 0;

  viQuery := TI9Query.Create(
    nil);

  viTransaction := TI9Transaction.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viTransaction.Connection := FConnection;
    viQuery.Transaction := viTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL DELETE'}
      'DELETE ' +

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_GEN_CONTROLE G_GC ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE'}
      'WHERE ' +
      'G_GC.NOME_GENERATOR = :P_NOME_GENERATOR AND ' +
      'G_GC.SEQUENCIA = :P_SEQUENCIA';
      {$ENDREGION}

    {$ENDREGION}

    PreencherParametros(
      viQuery,
      vpGenControle);

    viTransaction.StartTransaction;
    try
      Result := viQuery.ExecSQL;
      viTransaction.Commit;
    except
      viTransaction.Rollback;
      raise;
    end;
  finally
    viQuery.Free;
    viTransaction.Free;
  end;
end;

function TGenControleBusiness.GerarSequencia(
  const vpNomeGenerator: string): IGenControle;
{$REGION 'Variáveis'}
var
  viTransaction: TI9Transaction;
  viGenControleDisponivel: IMaybe<IGenControle>;
  viSequencia: Integer;
  viGenControle: IGenControle;
  viGenControleEmUsoDeadlock: IGenControle;
{$ENDREGION}
begin
  Result := nil;

  viTransaction := TI9Transaction.Create(
    nil);

  try
    viTransaction.Connection := FConnection;
    viTransaction.StartTransaction;

    try
      viGenControleDisponivel := GetDisponivel(
        vpNomeGenerator,
        viTransaction);

      if viGenControleDisponivel.HasValue then
        viGenControle := SetEmUso(
          viGenControleDisponivel.Value,
          viTransaction)
      else
      begin
        viGenControleEmUsoDeadlock := GetEmUsoDeadlock(
          vpNomeGenerator,
          viTransaction);

        if Assigned(
          viGenControleEmUsoDeadlock) then
          viGenControle := SetEmUso(
            viGenControleEmUsoDeadlock,
            viTransaction)
        else
        begin
          viSequencia := IncrementarGenerator(
            vpNomeGenerator);

          viGenControle := TGenControle.New(
            vpNomeGenerator,
            viSequencia,
            StatusEmUso,
            FDataHoraServidor);

          Inserir(
            viGenControle,
            viTransaction);
        end;
      end;

      Result := viGenControle;
      viTransaction.Commit;
    except
      viTransaction.Rollback;
      raise;
    end;
  finally
    viTransaction.Free;
  end;
end;

function TGenControleBusiness.GetDisponivel(
  const vpNomeGenerator: string;
  const vpTransaction: TI9Transaction): IMaybe<IGenControle>;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viStatus: string;
  viSequencia: Integer;
  viGenControle: IGenControle;
  viDataControle: TDateTime;
{$ENDREGION}
begin
  Result := TNone<IGenControle>.New;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viQuery.Transaction := vpTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'FIRST 1 ' +
      'G_GC.SEQUENCIA, ' +
      'G_GC.DATA_CONTROLE ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_GEN_CONTROLE G_GC ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_GC.NOME_GENERATOR = :P_NOME_GENERATOR AND ' +
      'G_GC.STATUS = :P_STATUS ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_GC.SEQUENCIA ' +
      {$ENDREGION}

      'FOR UPDATE WITH LOCK';

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_NOME_GENERATOR').AsString := vpNomeGenerator;

    viStatus := StatusDisponivel;

    viQuery.ParamByName(
      'P_STATUS').AsString := viStatus;
    {$ENDREGION}

    viQuery.Open;
    try
      if viQuery.IsEmpty then
        Exit;

      viSequencia := viQuery.FieldByName(
        'SEQUENCIA').AsInteger;

      viDataControle := viQuery.FieldByName(
        'DATA_CONTROLE').AsDateTime;

      viGenControle := TGenControle.New(
        vpNomeGenerator,
        viSequencia,
        viStatus,
        viDataControle);

      Result := TSome<IGenControle>.New(
        viGenControle);
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

function TGenControleBusiness.GetEmUsoDeadlock(
  const vpNomeGenerator: string;
  const vpTransaction: TI9Transaction): IGenControle;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viStatus: string;
  viDataControle: TDateTime;
  viDataAtual: TDateTime;
  viIntervaloMinutos: Double;
  viSequencia: Integer;
{$ENDREGION}
begin
  Result := nil;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viQuery.Transaction := vpTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'FIRST 1 ' +
      'G_GC.SEQUENCIA, ' +
      'G_GC.DATA_CONTROLE ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_GEN_CONTROLE G_GC ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_GC.NOME_GENERATOR = :P_NOME_GENERATOR AND ' +
      'G_GC.STATUS = :P_STATUS ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_GC.DATA_CONTROLE, ' +
      'G_GC.SEQUENCIA ' +
      {$ENDREGION}

      'FOR UPDATE WITH LOCK';

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_NOME_GENERATOR').AsString := vpNomeGenerator;

    viStatus := StatusEmUso;

    viQuery.ParamByName(
      'P_STATUS').AsString := viStatus;
    {$ENDREGION}

    viQuery.Open;
    try
      if viQuery.IsEmpty then
        Exit;

      viDataControle := viQuery.FieldByName(
        'DATA_CONTROLE').AsDateTime;

      viDataAtual := FDataHoraServidor;

      viIntervaloMinutos := MinuteSpan(
        viDataAtual,
        viDataControle);

      if viIntervaloMinutos <= 1 then
        Exit;

      viSequencia := viQuery.FieldByName(
        'SEQUENCIA').AsInteger;

      Result := TGenControle.New(
        vpNomeGenerator,
        viSequencia,
        viStatus,
        viDataControle);
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

function TGenControleBusiness.IncrementarGenerator(
  const vpNomeGenerator: string): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := string.Format(
      'SELECT GEN_ID(%s, 1) FROM RDB$DATABASE',
      [vpNomeGenerator]);

    viQuery.Open;
    try
      Result := viQuery.FieldByName(
        'GEN_ID').AsInteger;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

function TGenControleBusiness.Inserir(
  const vpGenControle: IGenControle;
  const vpTransaction: TI9Transaction): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viQuery.Transaction := vpTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL INSERT'}
      'INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_GEN_CONTROLE ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'NOME_GENERATOR, ' +
      'SEQUENCIA, ' +
      'STATUS, ' +
      'DATA_CONTROLE' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusuala VALUES e Parâmetros'}
      'VALUES' +
      '(' +
      ':P_NOME_GENERATOR, ' +
      ':P_SEQUENCIA, ' +
      ':P_STATUS, ' +
      ':P_DATA_CONTROLE' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    PreencherParametros(
      viQuery,
      vpGenControle);

    Result := viQuery.ExecSQL;
  finally
    viQuery.Free;
  end;
end;

class function TGenControleBusiness.New(
  const vpConnection: TI9Connection;
  const vpDataHoraServidor: TDataHoraServidor): IGenControleBusiness;
begin
  Result := Create(
    vpConnection,
    vpDataHoraServidor);
end;

procedure TGenControleBusiness.PreencherParametros(
  const vpQuery: TI9Query;
  const vpGenControle: IGenControle);
{$REGION 'Variáveis'}
var
  viParam: TFDParam;
{$ENDREGION}
begin
  viParam := vpQuery.FindParam(
    'P_NOME_GENERATOR');

  if Assigned(
    viParam) then
    viParam.AsString := vpGenControle.NomeGenerator;

  viParam := vpQuery.FindParam(
    'P_SEQUENCIA');

  if Assigned(
    viParam) then
    viParam.AsInteger := vpGenControle.Sequencia;

  viParam := vpQuery.FindParam(
    'P_STATUS');

  if Assigned(
    viParam) then
    viParam.AsString := vpGenControle.Status;

  viParam := vpQuery.FindParam(
    'P_DATA_CONTROLE');

  if Assigned(
    viParam) then
    viParam.AsDateTime := vpGenControle.DataControle;
end;

function TGenControleBusiness.SetDisponivel(
  const vpGenControle: IGenControle): IGenControle;
{$REGION 'Variáveis'}
var
  viTransaction: TI9Transaction;
  viGenControle: IGenControle;
{$ENDREGION}
begin
  Result := nil;

  viTransaction := TI9Transaction.Create(
    nil);

  try
    viTransaction.Connection := FConnection;
    viTransaction.StartTransaction;

    try
      viGenControle := SetStatus(
        vpGenControle,
        StatusDisponivel,
        viTransaction);

      Result := viGenControle;
      viTransaction.Commit;
    except
      viTransaction.Rollback;
      raise;
    end;
  finally
    viTransaction.Free;
  end;
end;

function TGenControleBusiness.SetEmUso(
  const vpGenControle: IGenControle;
  const vpTransaction: TI9Transaction): IGenControle;
begin
  Result := SetStatus(
    vpGenControle,
    StatusEmUso,
    vpTransaction);
end;

function TGenControleBusiness.SetStatus(
  const vpGenControle: IGenControle;
  const vpStatus: string;
  const vpTransaction: TI9Transaction): IGenControle;
{$REGION 'Variáveis'}
var
  viGenControle: IGenControle;
{$ENDREGION}
begin
  viGenControle := TGenControle.New(
    vpGenControle.NomeGenerator,
    vpGenControle.Sequencia,
    vpStatus,
    FDataHoraServidor);

  AtualizarStatus(
    viGenControle,
    vpTransaction);

  Result := viGenControle;
end;

function TGenControleBusiness.StatusDisponivel: string;
begin
  Result := 'D';
end;

function TGenControleBusiness.StatusEmUso: string;
begin
  Result := 'E';
end;

end.
