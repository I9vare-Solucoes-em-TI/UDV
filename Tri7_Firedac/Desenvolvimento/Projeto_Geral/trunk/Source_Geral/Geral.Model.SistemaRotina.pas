unit Geral.Model.SistemaRotina;

interface

type
  TSistemaRotinaBusiness = class
  public
    class function BuscarSistemaRotinaId(
      const vpChaveRotina: string;
      const vpSistemaId: Integer): Integer;
  end;

implementation

uses
  I9Query,
  System.SysUtils,
  Controles;


{ TSistemaRotinaBusiness }

class function TSistemaRotinaBusiness.BuscarSistemaRotinaId(
  const vpChaveRotina: string;
  const vpSistemaId: Integer): Integer;
var
  viQuery: TI9Query;
begin
  Result := 0;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;
    viQuery.SQL.Text := 'SELECT SR.SISTEMA_ROTINA_ID '+
                        'FROM G_SISTEMA_ROTINA SR '+
                        'INNER JOIN G_SISTEMA_MENU SM ON '+
                        '  SR.SISTEMA_MENU_ID = SM.SISTEMA_MENU_ID '+
                        'WHERE SR.CHAVE_ROTINA = :P_CHAVE_ROTINA '+
                        '  AND SM.SISTEMA_ID = :P_SISTEMA_ID ';

    viQuery.ParamByName('P_CHAVE_ROTINA').AsString := vpChaveRotina;
    viQuery.ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaId;
    viQuery.Open;

    Result := viQuery.FieldByName('SISTEMA_ROTINA_ID').AsInteger;

    viQuery.Close;
  finally
    FreeAndNil(viQuery);
  end;
end;

end.
