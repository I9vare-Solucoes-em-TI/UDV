unit Geral.Controller.Factory.Entity.Zip;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Zip;

type
  TFileCompressionFactory = class(TInterfacedObject, IFactory<IFileCompression>)
  public
    function GetInstance: IFileCompression;
    class function New: IFactory<IFileCompression>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Zip;

{ TFileCompressionFactory }

function TFileCompressionFactory.GetInstance: IFileCompression;
begin
  Result := TFileCompression.New;
end;

class function TFileCompressionFactory.New: IFactory<IFileCompression>;
begin
  Result := Create;
end;

end.
