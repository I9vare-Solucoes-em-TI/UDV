unit Geral.Model.Entity.Impl.GED;

interface

uses
  Geral.Model.Entity.Spec.GED;

type
  TGED = class(TInterfacedObject, IGED)
  private
    FDiretorio: string;
    FPrefixo: string;
    FNumero: Integer;
    FSufixo: string;
    FExtensao: string;

    constructor Create(
      const vpDiretorio: string;
      const vpPrefixo: string;
      const vpNumero: Integer;
      const vpSufixo: string;
      const vpExtensao: string); reintroduce;

    function NomeArquivo: string;
    function Numero6Casas: Boolean;
    function TamanhoSubDiretorio: Integer;
    function NumeroFormatado: string;
    function SubDiretorio: string;
  public
    function CaminhoArquivo: string;

    class function New(
      const vpDiretorio: string;
      const vpPrefixo: string;
      const vpNumero: Integer;
      const vpSufixo: string;
      const vpExtensao: string): IGED;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.IOUtils;

{ TGED }

function TGED.CaminhoArquivo: string;
begin
  Result := string.Format(
    '%s%s',
    [IncludeTrailingPathDelimiter(
      SubDiretorio),
    NomeArquivo]);
end;

constructor TGED.Create(
  const vpDiretorio: string;
  const vpPrefixo: string;
  const vpNumero: Integer;
  const vpSufixo: string;
  const vpExtensao: string);
begin
  inherited Create;
  FDiretorio := vpDiretorio;
  FPrefixo := vpPrefixo;
  FNumero := vpNumero;
  FSufixo := vpSufixo;
  FExtensao := vpExtensao;
end;

function TGED.NumeroFormatado: string;
begin
  Result := string.Format(
    '%.*d',
    [6,
    FNumero]);
end;

class function TGED.New(
  const vpDiretorio: string;
  const vpPrefixo: string;
  const vpNumero: Integer;
  const vpSufixo: string;
  const vpExtensao: string): IGED;
begin
  Result := Create(
    vpDiretorio,
    vpPrefixo,
    vpNumero,
    vpSufixo,
    vpExtensao);
end;

function TGED.NomeArquivo: string;
begin
  Result := TPath.ChangeExtension(
    string.Format(
      '%s%s%s',
      [FPrefixo,
      NumeroFormatado,
      FSufixo]),
    FExtensao);
end;

function TGED.Numero6Casas: Boolean;
begin
  Result := FNumero < 1000000;
end;

function TGED.SubDiretorio: string;
begin
  Result := string.Format(
    '%s%s',
    [IncludeTrailingPathDelimiter(
      FDiretorio),
    NumeroFormatado.Substring(
      0,
      TamanhoSubDiretorio)]);
end;

function TGED.TamanhoSubDiretorio: Integer;
begin
  Result := IfThen(
    Numero6Casas,
    3,
    4);
end;

end.
