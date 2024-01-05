unit Geral.Model.Entity.Impl.Zip;

interface

uses
  Geral.Model.Entity.Spec.Zip,
  Geral.Model.Entity.Spec.List;

type
  TFileCompression = class(TInterfacedObject, IFileCompression)
  public
    class function New: IFileCompression;

    procedure Compress(
      const vpFileName: string;
      const vpZipFileName: string);

    procedure CompressFiles(
      const vpFileNames: IList<string>;
      const vpZipFileName: string);
  end;

implementation

uses
  System.Zip,
  Geral.Model.Entity.Impl.Factory.List;

{ TFileCompression }

procedure TFileCompression.Compress(
  const vpFileName: string;
  const vpZipFileName: string);
{$REGION 'Variáveis'}
var
  viFileNames: IList<string>;
{$ENDREGION}
begin
  viFileNames := TListFactory<string>.New.GetInstance;

  viFileNames.Add(
    vpFileName);

  CompressFiles(
    viFileNames,
    vpZipFileName);
end;

procedure TFileCompression.CompressFiles(
  const vpFileNames: IList<string>;
  const vpZipFileName: string);
{$REGION 'Variáveis'}
var
  viZIPFile: TZipFile;
  viFileName: string;
{$ENDREGION}
begin
  viZIPFile := TZipFile.Create;
  try
    viZIPFile.Open(
      vpZipFileName,
      TZipMode.zmWrite);

    try
      for viFileName in vpFileNames do
        viZIPFile.Add(
          viFileName);
    finally
      viZIPFile.Close;
    end;
  finally
    viZIPFile.Free;
  end;
end;

class function TFileCompression.New: IFileCompression;
begin
  Result := Create;
end;

end.
