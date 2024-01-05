unit Geral.Model.GED;

interface

type
  TFormatoArquivo = (faImagem, faPDF);

  TGED = class abstract
  private
    FDiretorio: string;
    FSubPasta: string;
    FPrefixo: string;
    FNumero: Integer;
    FSufixo: string;
    FExtensao: string;
    F6Casas: Boolean;
    FDescricao: string;

    function NomeArquivo: string;
    function Numero6Casas: Boolean;
    function TamanhoSubDiretorio: Integer;
    function NumeroFormatado: string;
    function SubDiretorio: string;
    function GetDiretorioExiste: Boolean;
  protected
    FFormatoArquivo: TFormatoArquivo;

  public
    constructor Create(
      const vpDiretorio: string;
      const vpSubPasta: string;
      const vpPrefixo: string;
      const vpSufixo: string;
      const vpExtensao: string;
      const vpValida6Casas: Boolean;
      const vpDescricao: string;
      const vpFormatoArquivo: TFormatoArquivo); reintroduce;

    function CaminhoArquivo(const vpNumero: Integer): string;

    property Descricao: string read FDescricao;
    property DiretorioExiste: Boolean read GetDiretorioExiste;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.IOUtils,
  Controles;

{ TGED }

function TGED.CaminhoArquivo(const vpNumero: Integer): string;
begin
  FNumero := vpNumero;

  Result := string.Format(
    '%s%s',
    [IncludeTrailingPathDelimiter(
      SubDiretorio),
    NomeArquivo]);

end;

constructor TGED.Create(
  const vpDiretorio: string;
  const vpSubPasta: string;
  const vpPrefixo: string;
  const vpSufixo: string;
  const vpExtensao: string;
  const vpValida6Casas: Boolean;
  const vpDescricao: string;
  const vpFormatoArquivo: TFormatoArquivo);
begin
  inherited Create;
  FDiretorio := Trim(vpDiretorio);
  FFormatoArquivo := vpFormatoArquivo;

  if vpFormatoArquivo = TFormatoArquivo.faPDF then
    FDiretorio := IncludeTrailingPathDelimiter(FDiretorio) + 'PDFs';

  FSubPasta  := Trim(vpSubPasta);
  FPrefixo   := Trim(vpPrefixo);
  FSufixo    := Trim(vpSufixo);

  if vpExtensao.Trim.IsEmpty then
  begin
    if vpFormatoArquivo = faImagem then
      FExtensao := Controles.vgImgExt
    else
      FExtensao := '.PDF';
  end
  else
    FExtensao := vpExtensao;

  F6Casas    := vpValida6Casas and (vpFormatoArquivo = TFormatoArquivo.faImagem);
  FDescricao := vpDescricao;
end;

function TGED.GetDiretorioExiste: Boolean;
begin
  Result := DirectoryExists(FDiretorio);
end;

function TGED.NumeroFormatado: string;
begin
  Result := string.Format(
    '%.*d',
    [IfThen(
      Numero6Casas,
      6,
      7),
    FNumero]);
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
  if F6Casas then
    Result := FNumero < 1000000
  else
    Result := False;
end;

function TGED.SubDiretorio: string;
begin
  if FFormatoArquivo = faImagem then
    Result := string.Format(
      '%s%s',
      [IncludeTrailingPathDelimiter(
        IncludeTrailingPathDelimiter(FDiretorio) +
          FSubPasta),
      NumeroFormatado.Substring(
        0,
        TamanhoSubDiretorio)])
  else
    Result := string.Format(
      '%s',
      [IncludeTrailingPathDelimiter(
        IncludeTrailingPathDelimiter(FDiretorio) +
          FSubPasta)]);
end;

function TGED.TamanhoSubDiretorio: Integer;
begin
  Result := IfThen(
    Numero6Casas,
    3,
    4);
end;

end.
