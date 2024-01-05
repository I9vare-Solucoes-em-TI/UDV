unit SeloLivroDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  SeloLivroDAO,
  FireDAC.Comp.Client,
  Data.DB,
  SeloLivro,
  SeloLivroList,
  SeloSituacao,
  SeloGrupo,
  IntervaloDatas,
  CampoOrdenacaoList;

type
  TSeloLivroDAO = class(TInterfacedObject, ISeloLivroDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloLivro;

    function GetByID(
      const vpValue: Variant): ISeloLivro; virtual; abstract;

    function GetList: TSeloLivroList; overload; virtual; abstract;

    function GetListByTabelaECampoID(
      const vpTabela: string;
      const vpCampoID: Integer): TSeloLivroList;

    function GetList(
      const vpSeloSituacao: ISeloSituacao;
      const vpSeloGrupo: ISeloGrupo;
      const vpIntervaloDatas: IIntervaloDatas;
      const vpDataExportacaoIsNull: Boolean;
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
        TSeloLivroList; overload; virtual; abstract;

    procedure Inserir(
      const vpValue: ISeloLivro); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloLivro); virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloLivro); virtual; abstract;

    procedure AlterarExportacao(
      const vpValue: TSeloLivroList;
      const vpDataExportacao: TDateTime;
      const vpCodigoExportacao: Integer); virtual; abstract;

    procedure AlterarValidado(
      const vpValue: ISeloLivro); virtual; abstract;
  end;

implementation

uses
  SeloLivroImpl,
  SeloSituacaoDAOImpl,
  System.SysUtils,
  BooleanHelper,
  FireDAC.Stan.Option;

{ TSeloLivroDAO }

constructor TSeloLivroDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TSeloLivroDAO.Get(
  const vpValue: TDataSet): ISeloLivro;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSeloSituacaoDAO: TSeloSituacaoDAO;
{$ENDREGION}
begin
  Result := TSeloLivro.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_SL_SELO_LIVRO_ID');
    if Assigned(viField) then
      SeloLivroID := viField.AsInteger;

    viField := FindField('G_SL_NUMERO');
    if Assigned(viField) then
      Numero := viField.AsInteger;

    viField := FindField('G_SS_SELO_SITUACAO_ID');
    if Assigned(viField) then
    begin
      viSeloSituacaoDAO := TSeloSituacaoDAO.Create(FFDConnection);
      try
        SeloSituacao := viSeloSituacaoDAO.Get(vpValue);
      finally
        FreeAndNil(viSeloSituacaoDAO);
      end;
    end;

    viField := FindField('G_SL_DATA');
    if Assigned(viField) then
      Data := viField.AsDateTime;

    viField := FindField('G_SL_OBSERVACAO');
    if Assigned(viField) then
      Observacao := viField.AsString;

    viField := FindField('G_SL_SIGLA');
    if Assigned(viField) then
      Sigla := viField.AsString;

    viField := FindField('G_SL_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_SL_TABELA');
    if Assigned(viField) then
      Tabela := viField.AsString;

    viField := FindField('G_SL_CAMPO_ID');
    if Assigned(viField) then
      CampoID := viField.AsInteger;

    viField := FindField('G_SL_NUMERO_AGRUPADOR');
    if Assigned(viField) then
      NumeroAgrupador := viField.AsString;

    viField := FindField('G_SL_APRESENTANTE');
    if Assigned(viField) then
      Apresentante := viField.AsString;

    viField := FindField('G_SL_IP_MAQUINA');
    if Assigned(viField) then
      IP_Maquina := viField.AsString;

    viField := FindField('G_SL_VALOR_EMOLUMENTO');
    if Assigned(viField) then
      ValorEmolumento := viField.AsCurrency;

    viField := FindField('G_SL_VALOR_TAXA_JUDICIARIA');
    if Assigned(viField) then
      ValorTaxaJudiciaria := viField.AsCurrency;

    viField := FindField('G_SL_VALOR_FUNDESP');
    if Assigned(viField) then
      ValorFundos := viField.AsCurrency;

    viField := FindField('G_SL_VALOR_ISSQN');
    if Assigned(viField) then
      ValorISSQN := viField.AsCurrency;
  end;
end;

function TSeloLivroDAO.GetListByTabelaECampoID(
  const vpTabela: string;
  const vpCampoID: Integer): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 26;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

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
        Add('G_SL.SELO_LIVRO_ID G_SL_SELO_LIVRO_ID,');
        Add('G_SL.NUMERO G_SL_NUMERO,');
        Add('G_SS.SELO_SITUACAO_ID G_SS_SELO_SITUACAO_ID,');
        Add('G_SS.DESCRICAO G_SS_DESCRICAO,');
        Add('G_SS.SITUACAO G_SS_SITUACAO,');
        Add('G_SL.DATA G_SL_DATA,');
        Add('G_SL.OBSERVACAO G_SL_OBSERVACAO,');
        Add('G_SL.SIGLA G_SL_SIGLA,');
        Add('G_SL.DESCRICAO G_SL_DESCRICAO,');
        Add('G_SL.NUMERO_AGRUPADOR G_SL_NUMERO_AGRUPADOR,');
        Add('G_SL.APRESENTANTE G_SL_APRESENTANTE,');
        Add('G_SL.IP_MAQUINA G_SL_IP_MAQUINA,');
        Add('G_SL.VALOR_EMOLUMENTO G_SL_VALOR_EMOLUMENTO,');
        Add('G_SL.VALOR_TAXA_JUDICIARIA G_SL_VALOR_TAXA_JUDICIARIA,');
        Add('G_SL.VALOR_FUNDESP G_SL_VALOR_FUNDESP,');
        Add('G_SL.VALOR_ISSQN G_SL_VALOR_ISSQN');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_SELO_LIVRO G_SL');
        {$ENDREGION}

        {$REGION 'Cláusula INNER JOIN'}
        Add('INNER JOIN');
        Add('G_SELO_SITUACAO G_SS');

        {$REGION 'Cláusula ON'}
        Add('ON');
        Add('G_SL.SELO_SITUACAO_ID = G_SS.SELO_SITUACAO_ID');
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_SL.TABELA = :P_TABELA AND');
        Add('G_SL.CAMPO_ID = :P_CAMPO_ID');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_TABELA').AsString := vpTabela;
      ParamByName('P_CAMPO_ID').AsInteger := vpCampoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result.Capacity := RecordCount;

        while Eof.&Not do
          try
            viSeloLivro := Get(viFDQuery);
            viSeloLivro.Tabela := vpTabela;
            viSeloLivro.CampoID := vpCampoID;
            Result.Add(viSeloLivro);
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
