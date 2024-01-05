unit Geral.Controller.SeloTipoCartorio;

interface

uses
  System.Generics.Collections,
  Geral.Model.SeloTipoCartorio;

type
  TSeloTipoCartorioController = class
  public
    function Buscar(
      const vpSeloTipoCartorioId: Integer): TSeloTipoCartorio; overload;
  end;

implementation

{ TSeloTipoCartorioController }

function TSeloTipoCartorioController.Buscar(
  const vpSeloTipoCartorioId: Integer): TSeloTipoCartorio;
var
  viSeloTipoCartorioBusiness: TSeloTipoCartorioBusiness;
begin
  viSeloTipoCartorioBusiness := nil;
  try
    viSeloTipoCartorioBusiness := TSeloTipoCartorioBusiness.Create;
    Result := viSeloTipoCartorioBusiness.Buscar(vpSeloTipoCartorioId);
  finally
    viSeloTipoCartorioBusiness.Free;
  end;
end;

end.
