unit SeloLoteDAOImpl;

interface

uses
  I9Connection,
  SeloLoteDAO,
  Data.SqlExpr,
  Data.DB,
  SeloLote,
  SeloLoteList;

type
  TSeloLoteDAO = class(TInterfacedObject, ISeloLoteDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloLote;

    function GetByID(
      const vpValue: Variant): ISeloLote; virtual; abstract;

    function GetList: TSeloLoteList; virtual; abstract;

    class function GetColunas(
      const vpLoadSeloGrupo: Boolean): string; static;

    procedure Inserir(
      const vpValue: ISeloLote); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloLote); virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloLote); virtual; abstract;
  end;

implementation

uses
  SeloLoteImpl,
  System.SysUtils,
  System.Math,
  BooleanHelper,
  SituacaoSeloLote,
  SituacaoSeloLoteHelper,
  SeloGrupoDAOImpl,
  System.StrUtils;

{ TSeloLoteDAO }

constructor TSeloLoteDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloLoteDAO.Get(
  const vpValue: TDataSet): ISeloLote;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSeloGrupoDAO: TSeloGrupoDAO;
{$ENDREGION}
begin
  Result := TSeloLote.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_SLO_SELO_LOTE_ID');
    if Assigned(viField) then
      SeloLoteID := viField.AsInteger;

    viField := FindField('G_SLO_NUMERO_ATUAL');
    if Assigned(viField) then
      NumeroAtual := viField.AsInteger;

    viField := FindField('G_SLO_SITUACAO');
    if Assigned(viField) then
      if viField.IsNull then
        Situacao := TSituacaoSeloLote.GetNull
      else
        Situacao := TSituacaoSeloLote.FromChar(
          viField.AsString.Chars[ZeroValue]);

    viField := FindField('G_SLO_DATA_LOTE');
    if Assigned(viField) then
      DataLote := viField.AsDateTime;

    viField := FindField('G_SLO_NUMERO_INICIAL');
    if Assigned(viField) then
      NumeroInicial := viField.AsInteger;

    viField := FindField('G_SLO_NUMERO_FINAL');
    if Assigned(viField) then
      NumeroFinal := viField.AsInteger;

    viField := FindField('G_SLO_OBSERVACAO');
    if Assigned(viField) then
      Observacao := viField.AsString;

    viField := FindField('G_SG_SELO_GRUPO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSeloGrupoDAO := TSeloGrupoDAO.Create(FConnection);
      try
        SeloGrupo := viSeloGrupoDAO.Get(vpValue);
      finally
        FreeAndNil(viSeloGrupoDAO);
      end;
    end;

    viField := FindField('G_SLO_SIGLA');
    if Assigned(viField) then
      Sigla := viField.AsString;

    viField := FindField('G_SLO_NOTA_FISCAL');
    if Assigned(viField) then
      NotaFiscal := viField.AsString;

    viField := FindField('G_SLO_QUANTIDADE');
    if Assigned(viField) then
      Quantidade := viField.AsInteger;
  end;
end;

class function TSeloLoteDAO.GetColunas(
  const vpLoadSeloGrupo: Boolean): string;
begin
  Result := {$REGION 'Colunas'}
    'G_SLO.SELO_LOTE_ID G_SLO_SELO_LOTE_ID, ' +
    'G_SLO.NUMERO_ATUAL G_SLO_NUMERO_ATUAL, ' +
    'G_SLO.SITUACAO G_SLO_SITUACAO, ' +
    'G_SLO.DATA_LOTE G_SLO_DATA_LOTE, ' +
    'G_SLO.NUMERO_INICIAL G_SLO_NUMERO_INICIAL, ' +
    'G_SLO.NUMERO_FINAL G_SLO_NUMERO_FINAL, ' +
    'G_SLO.OBSERVACAO G_SLO_OBSERVACAO, ' +

    IfThen(vpLoadSeloGrupo, TSeloGrupoDAO.GetColunas,
      'G_SLO.SELO_GRUPO_ID G_SLO_SELO_GRUPO_ID') + ', ' +

    'G_SLO.SIGLA G_SLO_SIGLA, ' +
    'G_SLO.NOTA_FISCAL G_SLO_NOTA_FISCAL, ' +
    'G_SLO.QUANTIDADE G_SLO_QUANTIDADE';
  {$ENDREGION}
end;

end.
