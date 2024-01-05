unit Geral.Model.PessoaExposta;

interface

type
  TPessoaExpostaBusiness = class
  public
    class function PessoaExposta(
      const vpCPF: string;
      const vpDataBase: TDateTime): Boolean;
  end;

implementation

uses
  System.SysUtils,
  Rotinas,
  Controles,
  I9Query,
  Data.DB;

{ TPessoaExpostaBusiness }

class function TPessoaExpostaBusiness.PessoaExposta(
  const vpCPF: string;
  const vpDataBase: TDateTime): Boolean;
var
  viCPF: string;
  viQuery: TI9Query;
begin
  Result := False;
  viQuery := nil;

  try
    viCPF := Rotinas.RetornaNumerico(
      vpCPF);

    if viCPF.IsEmpty then
      Exit;

    if viCPF.Length <> 11 then
      Exit;

    if vpDataBase <= 0 then
      Exit;

    viQuery := TI9Query.Create(
      nil);

    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT FIRST 1 '+
      '    1 '+
      'FROM '+
      '    G_PESSOA_EXPOSTA G_PE '+
      'WHERE '+
      '    G_PE.CPF = :P_CPF AND '+
      '    :P_DATA_BASE BETWEEN G_PE.DATA_INICIO_EXERCICIO AND '+
      '    IIF(G_PE.DATA_FIM_CARENCIA IS NOT NULL, G_PE.DATA_FIM_CARENCIA, '+
      '    IIF(G_PE.DATA_FIM_EXERCICIO IS NOT NULL, G_PE.DATA_FIM_EXERCICIO, :P_DATA_BASE)) '+
      'ORDER BY '+
      '    G_PE.PESSOA_EXPOSTA_ID ';
    {$ENDREGION}

    viQuery.ParamByName(
      'P_CPF').AsString := viCPF;

    viQuery.ParamByName(
      'P_DATA_BASE').AsDateTime := vpDataBase;

    viQuery.Open;
    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

end.
