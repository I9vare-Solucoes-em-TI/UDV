unit Geral.Model.UF;

interface

type
  TUfBusiness = class
  public
    class function ConsultarDescricao(
      const vpSigla: string): string;
  end;

implementation

uses
  System.SysUtils,
  I9Query,
  Controles,
  Data.DB;

{ TUfBusiness }

class function TUfBusiness.ConsultarDescricao(
  const vpSigla: string): string;
var
  viQuery: TI9Query;
begin
  Result := string.Empty;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT '+
      '    G_U.DESCRICAO '+
      'FROM '+
      '    G_UF G_U '+
      'WHERE '+
      '    G_U.SIGLA = :SIGLA ';
    {$ENDREGION}

    viQuery.ParamByName('SIGLA').AsString := vpSigla;
    viQuery.Open;

    if viQuery.IsEmpty then
      Exit;

    Result := viQuery.FieldByName('DESCRICAO').AsString;
  finally
    FreeAndNil(viQuery);
  end;
end;

end.
