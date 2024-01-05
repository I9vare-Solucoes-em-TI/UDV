unit SeloSituacaoDAOImpl;

interface

uses
  SeloSituacaoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  SeloSituacao,
  SeloSituacaoList;

type
  TSeloSituacaoDAO = class(TInterfacedObject, ISeloSituacaoDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloSituacao;

    function GetByID(
      const vpValue: Variant): ISeloSituacao; virtual; abstract;

    function GetList: TSeloSituacaoList; virtual; abstract;

    procedure Inserir(
      const vpValue: ISeloSituacao); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloSituacao); virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloSituacao); virtual; abstract;
  end;

implementation

uses
  SeloSituacaoImpl,
  BooleanHelper;

{ TSeloSituacaoDAO }

constructor TSeloSituacaoDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TSeloSituacaoDAO.Get(
  const vpValue: TDataSet): ISeloSituacao;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSeloSituacao.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_SS_SELO_SITUACAO_ID');
    if Assigned(viField) then
      SeloSituacaoID := viField.AsInteger;

    viField := FindField('G_SS_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_SS_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

end.
