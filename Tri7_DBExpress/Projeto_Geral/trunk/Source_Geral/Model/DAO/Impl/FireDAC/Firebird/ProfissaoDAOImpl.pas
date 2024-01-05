unit ProfissaoDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  ProfissaoDAO,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Data.DB,
  Profissao,
  ProfissaoList;

type
  TProfissaoDAO = class(TInterfacedObject, IProfissaoDAO)
  private
    FFDConnection: TI9Connection;

    procedure PreencherParametros(
      const vpFDDataSet: TFDDataSet;
      const vpValue: IProfissao);
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IProfissao;

    function GetByID(
      const vpValue: Variant): IProfissao; virtual; abstract;

    function GetList: TProfissaoList; virtual; abstract;

    function GetListBySituacao(
      const vpValue: Boolean): TProfissaoList; virtual; abstract;

    procedure Inserir(
      const vpValue: IProfissao);

    procedure Alterar(
      const vpValue: IProfissao); virtual; abstract;

    procedure Excluir(
      const vpValue: IProfissao); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  FireDAC.Stan.Param,
  BooleanHelper,
  ProfissaoImpl;

{ TProfissaoDAO }

constructor TProfissaoDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TProfissaoDAO.Get(
  const vpValue: TDataSet): IProfissao;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TProfissao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_P_TB_PROFISSAO_ID');
    if Assigned(viField) then
      ProfissaoID := viField.AsInteger;

    viField := FindField('G_P_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_P_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_P_CODIGO_CBO');
    if Assigned(viField) then
      CodigoCBO := viField.AsString;
  end;
end;

procedure TProfissaoDAO.Inserir(
  const vpValue: IProfissao);
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 14;
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

      with FormatOptions do
      begin
        StrsEmpty2Null := True;
        StrsTrim2Len := True;
      end;

      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL INSERT'}
        Add('INSERT');

        {$REGION 'Cláusula INTO'}
        Add('INTO');
        Add('G_TB_PROFISSAO');
        {$ENDREGION}

        {$REGION 'Colunas'}
        Add('(');
        Add('TB_PROFISSAO_ID,');
        Add('DESCRICAO,');
        Add('SITUACAO');
        Add(')');
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        Add('VALUES');
        Add('(');
        Add(':P_TB_PROFISSAO_ID,');
        Add(':P_DESCRICAO,');
        Add(':P_SITUACAO');
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

procedure TProfissaoDAO.PreencherParametros(
  const vpFDDataSet: TFDDataSet;
  const vpValue: IProfissao);
{$REGION 'Variáveis'}
var
  viFDParam: TFDParam;
{$ENDREGION}
begin
  with vpFDDataSet, vpValue do
  begin
    viFDParam := FindParam('P_TB_PROFISSAO_ID');
    if Assigned(viFDParam) then
      viFDParam.AsInteger := ProfissaoID;

    viFDParam := FindParam('P_DESCRICAO');
    if Assigned(viFDParam) then
      viFDParam.AsString := Descricao;

    viFDParam := FindParam('P_SITUACAO');
    if Assigned(viFDParam) then
      viFDParam.AsString := Situacao.ToCharAtivoInativo;
  end;
end;

end.
