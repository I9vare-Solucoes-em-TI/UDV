{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Controller.Factory.Entity.PDF.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Controller.Factory.Entity.PDF;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.PDF;

type
  TPDF_LibraryFactory = class(TInterfacedObject, IFactory<IPDF_Library>)
  public
    function GetInstance: IPDF_Library;
    class function New: IFactory<IPDF_Library>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.PDF.Debenu;

const
  CL_LICENSE_KEY_DEBENU: string = 'jf77x88g5rt3bc3i99m44rs3y';

{ TPDF_LibraryFactory }

function TPDF_LibraryFactory.GetInstance: IPDF_Library;
begin
  Result := TPDF_Library.New(
    CL_LICENSE_KEY_DEBENU);
end;

class function TPDF_LibraryFactory.New: IFactory<IPDF_Library>;
begin
  Result := Create;
end;

end.
