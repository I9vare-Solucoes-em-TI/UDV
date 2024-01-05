unit ConfiguracaoDAOImpl;

interface

uses
  ConfiguracaoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  Configuracao,
  ConfiguracaoList,
  ConfiguracaoGrupoList;

type
  TConfiguracaoDAO = class(TInterfacedObject, IConfiguracaoDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IConfiguracao;

    function GetByID(
      const vpValue: Variant): IConfiguracao; virtual; abstract;

    function GetList: TConfiguracaoList; overload; virtual; abstract;

    function GetList(
      const vpConfiguracaoGrupoList: TConfiguracaoGrupoList):
        TConfiguracaoList; overload;

    procedure Inserir(
      const vpValue: IConfiguracao); virtual; abstract;

    procedure Alterar(
      const vpValue: IConfiguracao); virtual; abstract;

    procedure Excluir(
      const vpValue: IConfiguracao); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper,
  ConfiguracaoImpl,
  ConfiguracaoGrupoDAOImpl,
  FireDAC.Stan.Option,
  IntegerList,
  ConfiguracaoGrupoListHelper,
  IntegerListHelper;

{ TConfiguracaoDAO }

constructor TConfiguracaoDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TConfiguracaoDAO.Get(
  const vpValue: TDataSet): IConfiguracao;
{$REGION 'Variáveis'}
var
  viField: TField;
  viConfiguracaoGrupoDAO: TConfiguracaoGrupoDAO;
{$ENDREGION}
begin
  Result := TConfiguracao.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_C_CONFIG_ID');
    if Assigned(viField) then
      ConfiguracaoID := viField.AsInteger;

    viField := FindField('G_CG_CONFIG_GRUPO_ID');
    if Assigned(viField) then
    begin
      viConfiguracaoGrupoDAO := TConfiguracaoGrupoDAO.Create(FFDConnection);
      try
        ConfiguracaoGrupo := viConfiguracaoGrupoDAO.Get(vpValue);
      finally
        FreeAndNil(viConfiguracaoGrupoDAO);
      end;
    end;

    viField := FindField('G_C_SECAO');
    if Assigned(viField) then
      Secao := viField.AsString;

    viField := FindField('G_C_NOME');
    if Assigned(viField) then
      Nome := viField.AsString;

    viField := FindField('G_C_VALOR');
    if Assigned(viField) then
      Valor := viField.AsString;

    viField := FindField('G_C_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;
  end;
end;

function TConfiguracaoDAO.GetList(
  const vpConfiguracaoGrupoList: TConfiguracaoGrupoList): TConfiguracaoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 11;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TFDQuery;
  viConfiguracao: IConfiguracao;
  viListConfiguracaoGrupoID: TIntegerList;
{$ENDREGION}
begin
  Result := TConfiguracaoList.Create;

  viFDQuery := TFDQuery.Create(nil);
  viFDQuery.Connection := FFDConnection;

  viFDQuery.FetchOptions.Unidirectional := True;
  viFDQuery.FetchOptions.RecordCountMode := cmTotal;

  viListConfiguracaoGrupoID := vpConfiguracaoGrupoList.
    GetListConfiguracaoGrupoID;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_C.CONFIG_ID G_C_CONFIG_ID,');
        Add('G_C.CONFIG_GRUPO_ID G_C_CONFIG_GRUPO_ID,');
        Add('G_C.SECAO G_C_SECAO,');
        Add('G_C.NOME G_C_NOME,');
        Add('G_C.VALOR G_C_VALOR,');
        Add('G_C.DESCRICAO G_C_DESCRICAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_CONFIG G_C');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_C.CONFIG_GRUPO_ID IN (' +
          viListConfiguracaoGrupoID.ToString + ')');
        {$ENDREGION}

        {$ENDREGION}
      end;

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result.Capacity := RecordCount;

        while Eof.&Not do
          try
            viConfiguracao := Get(viFDQuery);

            viConfiguracao.ConfiguracaoGrupo := vpConfiguracaoGrupoList.
              GetByConfiguracaoGrupoID(FieldByName(
                'G_C_CONFIG_GRUPO_ID').AsInteger);

            Result.Add(viConfiguracao);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
    FreeAndNil(viListConfiguracaoGrupoID);
  end;
end;

end.
