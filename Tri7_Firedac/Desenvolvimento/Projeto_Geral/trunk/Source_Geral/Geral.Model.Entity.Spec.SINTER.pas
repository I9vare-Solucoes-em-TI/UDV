unit Geral.Model.Entity.Spec.SINTER;

interface

uses
  Geral.Model.Entity.Spec.PKI,
  System.Classes;

type
  ISINTER_Result = interface;

  ISINTER = interface
    ['{05D0CDDA-D4F2-4DDC-9DE3-FB9FCE6201A5}']

    function EnviarLote(
      const vpSistemaID: Integer;
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate): ISINTER_Result;
  end;

  ISINTER_Result = interface
    ['{88132923-12FB-4E38-A7D9-818741D8D922}']

    function HTTP_Code: Integer;
    function HTTP_Status: string;
    function HTTP_Response: TStream;
  end;

implementation

end.
