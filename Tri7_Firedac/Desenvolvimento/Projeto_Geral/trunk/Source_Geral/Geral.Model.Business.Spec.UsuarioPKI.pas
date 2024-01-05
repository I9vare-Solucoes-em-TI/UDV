unit Geral.Model.Business.Spec.UsuarioPKI;

interface

uses
  Data.DB,
  Geral.Model.Entity.Spec.PKI;

type
  IUsuarioPKI_Business = interface
    ['{F288B17D-3682-432F-9796-BD535388ADDA}']

    function ValidarVinculo(
      const vpUsuarioID: Integer;
      const vpX509Certificate: IX509Certificate): Integer;

    function ValidarCadastro(
      const vpX509Certificate: IX509Certificate): Integer;

    function GetObject(
      const vpUsuarioId: Integer): TDataSet;
  end;

implementation

end.
