unit RegimeBensDAOImpl;

interface

uses
  I9Connection,
  RegimeBensDAO,
  FireDAC.Comp.Client,
  Data.DB,
  RegimeBens,
  RegimeBensList;

type
  TRegimeBensDAO = class(TInterfacedObject, IRegimeBensDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IRegimeBens;

    function GetByID(
      const vpValue: Variant): IRegimeBens; virtual; abstract;

    function GetList: TRegimeBensList; virtual; abstract;

    procedure Inserir(
      const vpValue: IRegimeBens); virtual; abstract;

    procedure Alterar(
      const vpValue: IRegimeBens); virtual; abstract;

    procedure Excluir(
      const vpValue: IRegimeBens); virtual; abstract;
  end;

implementation

uses
  RegimeBensImpl,
  BooleanHelper;

{ TRegimeBensDAO }

constructor TRegimeBensDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TRegimeBensDAO.Get(
  const vpValue: TDataSet): IRegimeBens;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TRegimeBens.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_RB_TB_REGIMEBENS_ID');
    if Assigned(viField) then
      RegimeBensID := viField.AsInteger;

    viField := FindField('G_RB_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_RB_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

end.
