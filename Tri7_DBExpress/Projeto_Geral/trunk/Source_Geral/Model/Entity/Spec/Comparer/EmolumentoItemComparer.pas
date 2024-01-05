unit EmolumentoItemComparer;

interface

uses
  System.Generics.Defaults,
  EmolumentoItem;

type
  TEmolumentoItemComparer = class(TComparer<IEmolumentoItem>,
    IComparer<IEmolumentoItem>)
  public
    function Compare(
      const Left: IEmolumentoItem;
      const Right: IEmolumentoItem): Integer; override;
  end;

implementation

{ TEmolumentoItemComparer }

function TEmolumentoItemComparer.Compare(
  const Left: IEmolumentoItem;
  const Right: IEmolumentoItem): Integer;
begin
  Result := Left.EmolumentoItemID - Right.EmolumentoItemID;
end;

end.
