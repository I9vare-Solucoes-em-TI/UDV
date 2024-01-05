unit GeradorLogErroTXT;

interface

uses
  GeradorLogErro,
  System.SysUtils;

type
  TGeradorLogErroTXT = class(TInterfacedObject, IGeradorLogErro)
  private
    FDiretorio: string;
    FSistema: string;
  public
    constructor Create(
      const vpDiretorio: string;
      const vpSistema: string); reintroduce;

    procedure GerarLogErro(
      const vpValue: Exception);

    class function New(
      const vpDiretorio: string;
      const vpSistema: string): IGeradorLogErro;
  end;

implementation

uses
  System.Math,
  BooleanHelper,
  System.Classes,
  System.Types,
  System.StrUtils;

{ TGeradorLogErroTXT }

constructor TGeradorLogErroTXT.Create(
  const vpDiretorio: string;
  const vpSistema: string);
begin
  inherited Create;
  FDiretorio := vpDiretorio;
  FSistema := vpSistema;
end;

procedure TGeradorLogErroTXT.GerarLogErro(
  const vpValue: Exception);
{$REGION 'Constantes'}
const
  CI_PASTA: string = 'LogErro';
  CI_FORMATO: string = 'dd_mm_yyyy';
  CI_EXTENSAO: string = '.txt';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viDiretorio: string;
  viArquivo: TStrings;
  viNomeArquivo: string;
  viCaminhoArquivo: string;
{$ENDREGION}
begin
  viDiretorio := IncludeTrailingPathDelimiter(FDiretorio) + CI_PASTA;
  if DirectoryExists(viDiretorio).&Not then
    CreateDir(viDiretorio);

  viArquivo := TStringList.Create;
  try
    viNomeArquivo := FormatDateTime(CI_FORMATO, Date) + CI_EXTENSAO;

    viCaminhoArquivo := IncludeTrailingPathDelimiter(viDiretorio) +
      viNomeArquivo;

    if FileExists(viCaminhoArquivo) then
      viArquivo.LoadFromFile(viCaminhoArquivo);

    if CompareValue(viArquivo.Count, ZeroValue) = GreaterThanValue then
      viArquivo.Add(DupeString('-', 100));

    viArquivo.Add('Hora: ' + TimeToStr(Time));
    viArquivo.Add('Sistema: ' + FSistema);
    viArquivo.Add('Classe do Erro: ' + vpValue.ClassName);
    viArquivo.Add('Mensagem do Erro:');
    viArquivo.Add(vpValue.Message);

    viArquivo.SaveToFile(viCaminhoArquivo);
  finally
    FreeAndNil(viArquivo);
  end;
end;

class function TGeradorLogErroTXT.New(
  const vpDiretorio: string;
  const vpSistema: string): IGeradorLogErro;
begin
  Result := Create(
    vpDiretorio,
    vpSistema);
end;

end.
