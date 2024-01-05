unit RegimeComunhaoDAOImpl;

interface

uses
  I9Connection,
  RegimeComunhaoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  RegimeComunhao,
  RegimeComunhaoList;

type
  TRegimeComunhaoDAO = class(TInterfacedObject, IRegimeComunhaoDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IRegimeComunhao;

    function GetByID(
      const vpValue: Variant): IRegimeComunhao; virtual; abstract;

    function GetList: TRegimeComunhaoList; virtual; abstract;

    function GetListBySituacao(
      const vpValue: Boolean): TRegimeComunhaoList; virtual; abstract;

    procedure Inserir(
      const vpValue: IRegimeComunhao); virtual; abstract;

    procedure Alterar(
      const vpValue: IRegimeComunhao); virtual; abstract;

    procedure Excluir(
      const vpValue: IRegimeComunhao); virtual; abstract;
  end;

implementation

uses
  RegimeComunhaoImpl,
  System.SysUtils,
  BooleanHelper,
  RegimeBensDAOImpl;

{ TRegimeComunhaoDAO }

constructor TRegimeComunhaoDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TRegimeComunhaoDAO.Get(
  const vpValue: TDataSet): IRegimeComunhao;
{$REGION 'Variáveis'}
var
  viField: TField;
  viRegimeBensDAO: TRegimeBensDAO;
{$ENDREGION}
begin
  Result := TRegimeComunhao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_RC_TB_REGIMECOMUNHAO_ID');
    if Assigned(viField) then
      RegimeComunhaoID := viField.AsInteger;

    viField := FindField('G_RC_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_RC_TEXTO');
    if Assigned(viField) then
      Texto := viField.AsString;

    viField := FindField('G_RC_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_RB_TB_REGIMEBENS_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viRegimeBensDAO := TRegimeBensDAO.Create(FFDConnection);
      try
        RegimeBens := viRegimeBensDAO.Get(vpValue);
      finally
        FreeAndNil(viRegimeBensDAO);
      end;
    end;
  end;
end;

end.
