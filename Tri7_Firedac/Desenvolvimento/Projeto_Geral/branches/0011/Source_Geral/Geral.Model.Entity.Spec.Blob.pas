unit Geral.Model.Entity.Spec.Blob;

interface

uses
  System.SysUtils;

type
  IBlob = interface
    ['{014442CD-88C4-4FAA-8C9F-8C89104DFF7E}']

    function Value: TArray<Byte>;
    function AsBytes: TBytes;
    function AsString: string; overload;

    function AsString(
      const vpEncoding: TEncoding): string; overload;
  end;

implementation

end.
