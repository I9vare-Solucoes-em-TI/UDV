unit Geral.Model.Business.Impl.CalculoEmolumentos;

interface

uses
  I9Connection,
  Geral.Model.Business.Spec.CalculoEmolumentos;

type
  TConsultaEmolumentoPeriodo = class(TInterfacedObject, IConsultaEmolumentoPeriodo)

  private

    FConnection: TI9Connection;

    constructor Create(
      const vpConnection: TI9Connection
    ); reintroduce;

  public

    function Consultar(const vpDataBase: TDateTime): Integer;

    class function New(const vpConnection: TI9Connection): IConsultaEmolumentoPeriodo;

  end;

implementation

uses
  I9Query;

{ TConsultaEmolumentoPeriodo }

function TConsultaEmolumentoPeriodo.Consultar(const vpDataBase: TDateTime): Integer;
var
  viQuery: TI9Query;
begin
  viQuery := TI9Query.Create(nil);
  try
    viQuery.Connection := FConnection;
    viQuery.SQL.Text :=
      ' SELECT FIRST 1 '+
      '        G_EP.EMOLUMENTO_PERIODO_ID '+
      '   FROM G_EMOLUMENTO_PERIODO G_EP '+
      '  WHERE G_EP.DATA_INICIAL <= :P_DATA_BASE '+
      '  ORDER BY G_EP.DATA_INICIAL DESC ';

    viQuery.ParamByName('P_DATA_BASE').AsDateTime := vpDataBase;
    viQuery.Open;
    viQuery.First;

    Result := viQuery.FieldByName('EMOLUMENTO_PERIODO_ID').AsInteger;

  finally
    viQuery.Close;
    viQuery.Free;
  end;
end;

constructor TConsultaEmolumentoPeriodo.Create(const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

class function TConsultaEmolumentoPeriodo.New(const vpConnection: TI9Connection): IConsultaEmolumentoPeriodo;
begin
  Result := Create(vpConnection);
end;

end.
