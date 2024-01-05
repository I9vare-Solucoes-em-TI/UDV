unit Geral.Model.Business.Spec.SINTER;

interface

uses
  Data.DB,
  Geral.Model.Entity.Spec.PKI;

type
  TOnNextExtrato = reference to procedure;

  ISINTER_Business = interface
    ['{028BBBE7-3A78-48F2-AD68-15403A3B427B}']

    function EnviarExtratos(
      const vpSistemaID: Integer;
      const vpExtratos: TDataSet;
      const vpUsuarioID: Integer;
      const vpUsuarioPKI_ID: Integer;
      const vpX509Certificate: IX509Certificate;
      const vpOnNextExtrato: TOnNextExtrato): Integer;
  end;

implementation

end.
