unit ConsultorCNPJ;

interface

uses
  RetornoConsultaCNPJ;

type
  IConsultorCNPJ = interface
    ['{78A7344A-A6FE-4524-8199-C29C547B6E9C}']

    function ConsultarCNPJ(
      const vpValue: string): IRetornoConsultaCNPJ;
  end;

implementation

end.
