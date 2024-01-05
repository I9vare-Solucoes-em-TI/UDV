unit Geral.Model.Entity.Spec.Zip;

interface

uses
  Geral.Model.Entity.Spec.List;

type
  IFileCompression = interface
    ['{9155F64A-B020-4B79-94A4-1CA6A163D578}']

    procedure Compress(
      const vpFileName: string;
      const vpZipFileName: string);

    procedure CompressFiles(
      const vpFileNames: IList<string>;
      const vpZipFileName: string);
  end;

implementation

end.
