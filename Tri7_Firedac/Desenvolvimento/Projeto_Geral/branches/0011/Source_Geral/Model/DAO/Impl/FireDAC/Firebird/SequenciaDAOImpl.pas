unit SequenciaDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  SequenciaDAO,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Data.DB,
  Sequencia,
  SequenciaList;

type
  TSequenciaDAO = class(TInterfacedObject, ISequenciaDAO)
  private
    FFDConnection: TI9Connection;

    procedure PreencherParametros(
      const vpFDDataSet: TFDDataSet;
      const vpValue: ISequencia);
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISequencia;

    function GetByID(
      const vpValue: Variant): ISequencia;

    function GetList: TSequenciaList; virtual; abstract;

    procedure Inserir(
      const vpValue: ISequencia);

    procedure Alterar(
      const vpValue: ISequencia); virtual; abstract;

    procedure Excluir(
      const vpValue: ISequencia); virtual; abstract;

    procedure AlterarSequencia(
      const vpValue: ISequencia);
  end;

implementation

uses
  System.SysUtils,
  SequenciaImpl,
  FireDAC.Stan.Param;

{ TSequenciaDAO }

procedure TSequenciaDAO.AlterarSequencia(
  const vpValue: ISequencia);
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 12;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
{$ENDREGION}
begin
  viFDQuery := TI9Query.Create(nil);

  try
    with viFDQuery do
    begin
      Connection := FFDConnection;

      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL UPDATE'}

        {$REGION 'Cláusula UPDATE'}
        Add('UPDATE');
        Add('G_SEQUENCIA');
        {$ENDREGION}

        {$REGION 'Cláusula SET, Colunas e Parâmetros'}
        Add('SET');
        Add('SEQUENCIA = :P_SEQUENCIA');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('TABELA = :P_TABELA');
        {$ENDREGION}

        {$ENDREGION}
      end;

      PreencherParametros(viFDQuery, vpValue);
      ExecSQL;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

constructor TSequenciaDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TSequenciaDAO.Get(
  const vpValue: TDataSet): ISequencia;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSequencia.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_S_TABELA');
    if Assigned(viField) then
      Tabela := viField.AsString;

    viField := FindField('G_S_SEQUENCIA');
    if Assigned(viField) then
      Sequencia := viField.AsInteger;
  end;
end;

function TSequenciaDAO.GetByID(
  const vpValue: Variant): ISequencia;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 6;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
{$ENDREGION}
begin
  Result := nil;

  viFDQuery := TI9Query.Create(nil);
  viFDQuery.Connection := FFDConnection;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_S.SEQUENCIA G_S_SEQUENCIA');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_SEQUENCIA G_S');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_S.TABELA = :P_TABELA;');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_TABELA').AsString := vpValue;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viFDQuery);
        Result.Tabela := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

procedure TSequenciaDAO.Inserir(
  const vpValue: ISequencia);
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 12;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
{$ENDREGION}
begin
  viFDQuery := TI9Query.Create(nil);

  try
    with viFDQuery do
    begin
      Connection := FFDConnection;

      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL INSERT'}
        Add('INSERT');

        {$REGION 'Cláusula INTO'}
        Add('INTO');
        Add('G_SEQUENCIA');
        {$ENDREGION}

        {$REGION 'Colunas'}
        Add('(');
        Add('TABELA,');
        Add('SEQUENCIA');
        Add(')');
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        Add('VALUES');
        Add('(');
        Add(':P_TABELA,');
        Add(':P_SEQUENCIA');
        Add(')');
        {$ENDREGION}

        {$ENDREGION}
      end;

      PreencherParametros(viFDQuery, vpValue);
      ExecSQL;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

procedure TSequenciaDAO.PreencherParametros(
  const vpFDDataSet: TFDDataSet;
  const vpValue: ISequencia);
{$REGION 'Variáveis'}
var
  viFDParam: TFDParam;
{$ENDREGION}
begin
  with vpFDDataSet, vpValue do
  begin
    viFDParam := FindParam('P_TABELA');
    if Assigned(viFDParam) then
      viFDParam.AsString := Tabela;

    viFDParam := FindParam('P_SEQUENCIA');
    if Assigned(viFDParam) then
      viFDParam.AsInteger := Sequencia;
  end;
end;

end.
