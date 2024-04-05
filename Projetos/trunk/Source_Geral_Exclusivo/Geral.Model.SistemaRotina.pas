{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.SistemaRotina.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.SistemaRotina;

interface
uses
  Geral.Model.ConexaoDb;

type
  TSistemaRotinaBusiness = class
  private
    FConexaoDb: TConexaoDb;
    FUsuarioId: Integer;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb;
      const vpUsuarioId: Integer); reintroduce;

    function BuscarSistemaRotinaId(
      const vpChaveRotina: string;
      const vpSistemaId: Integer): Integer;

    function BuscarDescricaoRotina(
      const vpSistemaRotinaId: Integer): string;
  end;

implementation

uses
  I9Query,
  System.SysUtils;


{ TSistemaRotinaBusiness }

function TSistemaRotinaBusiness.BuscarDescricaoRotina(
  const vpSistemaRotinaId: Integer): string;
var
  viQuery: TI9Query;
begin
  Result := EmptyStr;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
    viQuery.SQL.Text := 'SELECT SR.DESCRICAO '+
                        'FROM G_SISTEMA_ROTINA SR '+
                        'WHERE SR.SISTEMA_ROTINA_ID = :P_SISTEMA_ROTINA_ID ';

    viQuery.ParamByName('P_SISTEMA_ROTINA_ID').AsInteger := vpSistemaRotinaId;
    viQuery.Open;

    Result := viQuery.FieldByName('DESCRICAO').AsString;

    viQuery.Close;
  finally
    FreeAndNil(viQuery);
  end;

end;

function TSistemaRotinaBusiness.BuscarSistemaRotinaId(
  const vpChaveRotina: string;
  const vpSistemaId: Integer): Integer;
var
  viQuery: TI9Query;
begin
  Result := 0;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
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

constructor TSistemaRotinaBusiness.Create(
  const vpConexaoDb: TConexaoDb;
  const vpUsuarioId: Integer);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
  FUsuarioId := vpUsuarioId;
end;

end.
