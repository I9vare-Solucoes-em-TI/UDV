{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.GED.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.GED;

interface

type
  TFormatoArquivo = (faImagem, faPDF, faFp3, faRTF);

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

    function NomeArquivo(const vpTipo: string = '';
      const vpSufixo: string = ''): string;
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

    function CaminhoArquivo(const vpNumero: Integer;
      const vpTipo: string = '';
      const vpSufixo: string = ''): string;virtual;

    procedure ForcarCriarDiretorio;

    property Descricao: string read FDescricao;
    property DiretorioExiste: Boolean read GetDiretorioExiste;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.IOUtils,
  Controles;

{ TGED }

function TGED.CaminhoArquivo(const vpNumero: Integer;
  const vpTipo: string = '';
  const vpSufixo: string = ''): string;
begin
  FNumero := vpNumero;

  Result := string.Format(
    '%s%s',
    [IncludeTrailingPathDelimiter(
      SubDiretorio),
    NomeArquivo(vpTipo, vpSufixo)]);
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
    FDiretorio := IncludeTrailingPathDelimiter(FDiretorio) + 'PDFs'
  else if vpFormatoArquivo = TFormatoArquivo.faFp3 then
    FDiretorio := IncludeTrailingPathDelimiter(FDiretorio) + 'FP3'
  else if vpFormatoArquivo = TFormatoArquivo.faRTF then
    FDiretorio := IncludeTrailingPathDelimiter(FDiretorio) + 'RTF';

  FSubPasta  := Trim(vpSubPasta);
  FPrefixo   := Trim(vpPrefixo);
  FSufixo    := Trim(vpSufixo);

  if vpExtensao.Trim.IsEmpty then
  begin
    if vpFormatoArquivo = faImagem then
      FExtensao := Controles.vgImgExt
    else if vpFormatoArquivo = faFp3 then
      FExtensao := '.fp3'
    else if vpFormatoArquivo = faPDF then
      FExtensao := '.pdf'
    else if vpFormatoArquivo = faRTF then
      FExtensao := '.rtf';
  end
  else
    FExtensao := vpExtensao;

  F6Casas    := vpValida6Casas and (vpFormatoArquivo = TFormatoArquivo.faImagem);
  FDescricao := vpDescricao;
end;

procedure TGED.ForcarCriarDiretorio;
begin
  ForceDirectories(FDiretorio);
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

function TGED.NomeArquivo(const vpTipo: string = '';
  const vpSufixo: string = ''): string;
var
  viSufixo: string;
begin
  viSufixo := IfThen(vpSufixo.IsEmpty, FSufixo, vpSufixo);

  Result := TPath.ChangeExtension(
    string.Format(
      '%s%s%s%s',
      [FPrefixo,
      vpTipo,
      NumeroFormatado,
      viSufixo]),
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
  if FFormatoArquivo in [faImagem, faRTF] then
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
