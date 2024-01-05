unit EmolumentoDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  EmolumentoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  Emolumento,
  EmolumentoList,
  Sistema;

type
  TEmolumentoDAO = class(TInterfacedObject, IEmolumentoDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEmolumento;

    function GetByID(
      const vpValue: Variant): IEmolumento; virtual; abstract;

    function GetList: TEmolumentoList; virtual; abstract;

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEmolumentoList;

    procedure Inserir(
      const vpValue: IEmolumento); virtual; abstract;

    procedure Alterar(
      const vpValue: IEmolumento); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumento); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper,
  EmolumentoImpl,
  SistemaDAOImpl,
  FireDAC.Stan.Option;

{ TEmolumentoDAO }

constructor TEmolumentoDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TEmolumentoDAO.Get(
  const vpValue: TDataSet): IEmolumento;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TEmolumento.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_E_EMOLUMENTO_ID');
    if Assigned(viField) then
      EmolumentoID := viField.AsInteger;

    viField := FindField('G_E_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) then
    begin
      viSistemaDAO := TSistemaDAO.Create(nil);
      try
        Sistema := viSistemaDAO.Get(vpValue);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;

    viField := FindField('G_E_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

function TEmolumentoDAO.GetListBySistemaESituacao(
  const vpSistema: ISistema;
  const vpSituacao: Boolean): TEmolumentoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 8;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := TEmolumentoList.Create;

  viFDQuery := TI9Query.Create(nil);
  viFDQuery.Connection := FFDConnection;

  viFDQuery.FetchOptions.Unidirectional := True;
  viFDQuery.FetchOptions.RecordCountMode := cmTotal;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_E.EMOLUMENTO_ID G_E_EMOLUMENTO_ID,');
        Add('G_E.DESCRICAO G_E_DESCRICAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_EMOLUMENTO G_E');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_E.SISTEMA_ID = :P_SISTEMA_ID AND');
        Add('G_E.SITUACAO = :P_SITUACAO');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistema.SistemaID;
      ParamByName('P_SITUACAO').AsString := vpSituacao.ToCharAtivoInativo;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result.Capacity := RecordCount;

        while Eof.&Not do
          try
            viEmolumento := Get(viFDQuery);
            viEmolumento.Sistema := vpSistema;
            viEmolumento.Situacao := vpSituacao;
            Result.Add(viEmolumento);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

end.
