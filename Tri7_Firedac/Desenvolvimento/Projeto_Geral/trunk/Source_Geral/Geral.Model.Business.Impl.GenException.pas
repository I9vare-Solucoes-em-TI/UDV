unit Geral.Model.Business.Impl.GenException;

interface

uses
  Geral.Model.Business.Spec.GenException,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.GenException,
  I9Connection;

type
  TGenExceptionBusiness = class(TInterfacedObject, IGenExceptionBusiness)
  private
    FConnection: TI9Connection;

    constructor Create(
      const vpConnection: TI9Connection); reintroduce;
  public
    class function New(
      const vpConnection: TI9Connection): IGenExceptionBusiness;

    function ByNomeGenerator(
      const vpNomeGenerator: string): IMaybe<IGenException>;

    function Salvar(
      const vpGenException: IGenException): Integer;

    function Excluir(
      const vpGenException: IGenException): Integer;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.GenException,
  Data.DB,
  I9Query,
  I9Transaction;

{ TGenExceptionBusiness }

function TGenExceptionBusiness.ByNomeGenerator(
  const vpNomeGenerator: string): IMaybe<IGenException>;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viTransaction: TI9Transaction;
{$ENDREGION}
begin
  Result := TNone<IGenException>.New;

  viQuery := TI9Query.Create(
    nil);

  viTransaction := TI9Transaction.Create(
    nil);

  try
    viQuery.Connection := FConnection;
    viTransaction.Connection := FConnection;
    viTransaction.Options.ReadOnly := True;
    viQuery.Transaction := viTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_GE.SEQUENCIA ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_GEN_EXCEPTION G_GE ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_GE.NOME_GENERATOR = :P_NOME_GENERATOR';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_NOME_GENERATOR').AsString := vpNomeGenerator;
    {$ENDREGION}

    viTransaction.StartTransaction;
    try
      viQuery.Open;
      try
        if not viQuery.IsEmpty then
          Result := TSome<IGenException>.New(
            TGenException.New(
              vpNomeGenerator,
              viQuery.FieldByName(
                'SEQUENCIA').AsInteger));
      finally
        viQuery.Close;
      end;

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

constructor TGenExceptionBusiness.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TGenExceptionBusiness.Excluir(
  const vpGenException: IGenException): Integer;
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
      'G_GEN_EXCEPTION G_GE ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_GE.NOME_GENERATOR = :P_NOME_GENERATOR';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_NOME_GENERATOR').AsString := vpGenException.NomeGenerator;
    {$ENDREGION}

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

class function TGenExceptionBusiness.New(
  const vpConnection: TI9Connection): IGenExceptionBusiness;
begin
  Result := Create(
    vpConnection);
end;

function TGenExceptionBusiness.Salvar(
  const vpGenException: IGenException): Integer;
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

    viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE OR INSERT'}
      'UPDATE OR INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_GEN_EXCEPTION ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'NOME_GENERATOR, ' +
      'SEQUENCIA' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusula VALUES e Parâmetros'}
      'VALUES ' +
      '(' +
      ':P_NOME_GENERATOR, ' +
      ':P_SEQUENCIA' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_NOME_GENERATOR').AsString := vpGenException.NomeGenerator;

    viQuery.ParamByName(
      'P_SEQUENCIA').AsInteger := vpGenException.Sequencia;
    {$ENDREGION}

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

end.
