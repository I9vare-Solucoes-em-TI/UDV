unit GeradorLogEnvioSelo;

interface

uses
  System.SysUtils,
  I9Connection;

type
  IGeradorLogEnvioSelo = interface
    ['{B1A03D55-09E1-4339-988B-FA5B6EA93751}']

    procedure GerarLogEnvioSelo(
      vpConector: TI9Connection;
      const vpSistema: string;
      const vpSeloLivroId: Integer;
      const vpDataEnvio: TDateTime;
      const vpSituacao: string;
      const vpObservacao: string;
      const vpValue: Exception);
  end;

implementation

end.
