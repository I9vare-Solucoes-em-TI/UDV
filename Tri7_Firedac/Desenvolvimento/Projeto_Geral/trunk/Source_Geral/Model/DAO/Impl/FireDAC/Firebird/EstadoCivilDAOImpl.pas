unit EstadoCivilDAOImpl;

interface

uses
  I9Connection,
  EstadoCivilDAO,
  FireDAC.Comp.Client,
  Data.DB,
  EstadoCivil,
  EstadoCivilList,
  Sistema;

type
  TEstadoCivilDAO = class(TInterfacedObject, IEstadoCivilDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEstadoCivil;

    function GetByID(
      const vpValue: Variant): IEstadoCivil; virtual; abstract;

    function GetList: TEstadoCivilList; virtual; abstract;

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEstadoCivilList; virtual; abstract;

    procedure Inserir(
      const vpValue: IEstadoCivil); virtual; abstract;

    procedure Alterar(
      const vpValue: IEstadoCivil); virtual; abstract;

    procedure Excluir(
      const vpValue: IEstadoCivil); virtual; abstract;
  end;

implementation

uses
  EstadoCivilImpl,
  SistemaDAOImpl,
  System.SysUtils,
  BooleanHelper,
  System.Classes;

{ TEstadoCivilDAO }

constructor TEstadoCivilDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TEstadoCivilDAO.Get(
  const vpValue: TDataSet): IEstadoCivil;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TEstadoCivil.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_EC_TB_ESTADOCIVIL_ID');
    if Assigned(viField) then
      EstadoCivilID := viField.AsInteger;

    viField := FindField('G_EC_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_EC_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSistemaDAO := TSistemaDAO.Create(FFDConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;
  end;
end;

end.
