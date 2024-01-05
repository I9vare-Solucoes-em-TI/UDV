unit I9Connection;

interface

uses
  I9Connection,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, System.Classes,
  System.SysUtils,
  I9Query;

type
  TI9Connection = class(TI9Connection)
    fbDriver: TFDPhysFBDriverLink;
  private
    function NewQuery(
      const vpSQL: string;
      const vpParams: TFDParams): TI9Query;
  public
    constructor Create(AOwner: TComponent); override;

    function Execute(const vpSQL: string; const vpParams: TFDParams; var vpDataSet: TDataSet): Integer; overload;
    function Execute(const vpSQL: string; const vpParams: TFDParams): Integer; overload;
  end;

implementation

{ TI9Connection }

constructor TI9Connection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

function TI9Connection.Execute(const vpSQL: string; const vpParams: TFDParams; var vpDataSet: TDataSet): Integer;
var
  QryAux: Ti9Query;
begin
  QryAux := NewQuery(
    vpSQL,
    vpParams);

  QryAux.open;
  Result := QryAux.RowsAffected;
  vpDataSet := QryAux;
end;

function TI9Connection.Execute(
  const vpSQL: string;
  const vpParams: TFDParams): Integer;
var
  viQuery: TI9Query;
begin
  viQuery := NewQuery(
    vpSQL,
    vpParams);

  try
    Result := viQuery.ExecSQL;
  finally
    viQuery.Free;
  end;
end;

function TI9Connection.NewQuery(
  const vpSQL: string;
  const vpParams: TFDParams): TI9Query;
begin
  Result := TI9Query.Create(
    nil);

  Result.Connection := Self;
  Result.SQL.Text := vpSQL;
  Result.Params := vpParams;
end;

end.
