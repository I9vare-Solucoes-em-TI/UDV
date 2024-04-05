{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Business.Spec.UsuarioPKI.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

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
      const vpX509Certificate: IX509Certificate;
      const vpSistemaId: Integer): Integer;

    function ValidarCadastroUsuario(
      const vpSerialNumero: string;
      const vpUsuarioId: Integer): Boolean;

    function GetObject(
      const vpUsuarioId: Integer): TDataSet;
  end;

implementation

end.
