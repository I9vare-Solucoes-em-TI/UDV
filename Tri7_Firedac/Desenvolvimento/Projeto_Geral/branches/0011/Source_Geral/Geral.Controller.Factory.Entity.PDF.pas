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
