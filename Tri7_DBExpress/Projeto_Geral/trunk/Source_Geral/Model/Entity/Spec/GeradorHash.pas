unit GeradorHash;

interface

type
  IGeradorHash = interface
    ['{625361B5-FA82-471E-AB3C-17B144F0302D}']

    function GerarHash(
      const vpValue: string): string;

    function VerificarHash(
      const vpValue: string;
      const vpHashEsperado: string): Boolean;
  end;

implementation

end.
