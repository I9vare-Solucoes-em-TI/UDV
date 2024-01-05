{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.PDF.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gest�o e Solu��es em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.PDF;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Geral.Model.Entity.Spec.PDF,
  Geral.Controller.Factory.Entity.PDF;

type
  TPDF = class
  private
    class function BuscarFormatoSenhaPdf: string;
  public
    class function ConveterPDFA(const vpOrigem, vpDestino: string): Boolean;
    class function MergeFiles(const vpPrimeiro, vpSegundo, vpDestino: string): Boolean;
    class function BuscarSenhaPDF(const vpValor: string): string;
    class function ProtegerPdfComSenha(const vpOrigem, vpDestino, vpSenha: string): Boolean;
  end;

implementation

uses
  Controles,
  Rotinas,
  System.IOUtils,
  System.StrUtils,
  MensagemUtils;

{ TPDF }

class function TPDF.BuscarFormatoSenhaPdf: string;
var
  viValor: string;
begin
{  viValor := TConfigBusiness.BuscarValor(
    Controles.vgId,
    'PRINCIPAL',
    'GERAL',
    'FORMATO_SENHA_PDF');

  if viValor.IsEmpty then
    raise Exception.Create(
      'Formato de senha PDF n�o definido.' +
      sLineBreak +
      'Par�metro: PRINCIPAL\GERAL\FORMATO_SENHA_PDF.');

  Result := viValor; }
end;

class function TPDF.BuscarSenhaPDF(const vpValor: string): string;
var
  viFormatoSenhaPdf: string;
  viSenha: string;
begin
  viFormatoSenhaPdf := BuscarFormatoSenhaPdf;

  if viFormatoSenhaPdf = 'R' then
    viSenha := RightStr(RetornaNumerico(vpValor), 4)
  else
    viSenha := LeftStr(RetornaNumerico(vpValor), 4);

  Result := viSenha;
end;

class function TPDF.ConveterPDFA(const vpOrigem, vpDestino: string): Boolean;
var
  viPDF_Library: IPDF_Library;
  viKeyWords: string;
  viNomeArquivo: string;
begin
  Result := False;

  if not TPath.GetExtension(vpOrigem).ToUpper.Contains('PDF') then
    raise Exception.CreateFmt('Arquivo de origem %s n�o � um PDF v�lido.', [TPath.GetFileName(vpOrigem)]);

  try
    viPDF_Library := TPDF_LibraryFactory.New.GetInstance;

    viPDF_Library.LoadFromFile(
      vpOrigem);

    viPDF_Library.SetPDF_A_Mode(
          TPDF_A_Mode.tpPDF_A_3b);

    viNomeArquivo := UpperCase(ExtractFileName(vpDestino));
    viNomeArquivo := Copy(viNomeArquivo, 1, length(viNomeArquivo)-4);
    viKeyWords := 'Cart�rio, ' + vgCidade + ', '+ vgUF + ', ' + viNomeArquivo ;

    viPDF_Library.SetTitle(vgCartorioNome);
    viPDF_Library.SetAuthor(vgUsuarioNome);
    viPDF_Library.SetSubject('Documento PDF Gerado em Cart�rio');
    viPDF_Library.SetProducer('Tri7 Solu��es em TI');
    viPDF_Library.SetCreator(vgSistemaNome);
    viPDF_Library.SetKeywords(viKeyWords);

    viPDF_Library.SaveToFile(
          vpDestino);

    Result := True;
  except
    on E : Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Erro: ' + E.Message);
    end;
  end;

end;

class function TPDF.MergeFiles(const vpPrimeiro, vpSegundo,
  vpDestino: string): Boolean;
var
  viPDF_Library: IPDF_Library;
const
  C_ARQUIVO_MERGE = 'c:\Temp\MergeFile.pdf';
begin
  Result := False;

  if not TPath.GetExtension(vpPrimeiro).ToUpper.Contains('PDF') then
    raise Exception.CreateFmt('Primeiro arquivo de origem %s n�o � um PDF v�lido.', [TPath.GetFileName(vpPrimeiro)]);

  if not TPath.GetExtension(vpSegundo).ToUpper.Contains('PDF') then
    raise Exception.CreateFmt('Segundo arquivo de origem %s n�o � um PDF v�lido.', [TPath.GetFileName(vpSegundo)]);

  try
    DeleteFile(C_ARQUIVO_MERGE);
    try
      viPDF_Library := TPDF_LibraryFactory.New.GetInstance;

      if viPDF_Library.MergeFiles(vpPrimeiro, vpSegundo, C_ARQUIVO_MERGE) then
        Result := CopyFile(PWideChar(C_ARQUIVO_MERGE), PWideChar(vpPrimeiro), False);
    finally
      DeleteFile(C_ARQUIVO_MERGE);
    end;
  except
    on E : Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Erro: ' + E.Message);
    end;
  end;

end;

class function TPDF.ProtegerPdfComSenha(const vpOrigem, vpDestino, vpSenha: string): Boolean;
var
  viDiretorioPdfProtegido: string;
begin
  Result := False;

  viDiretorioPdfProtegido := ExtractFileDir(vpDestino);

  if not DirectoryExists(viDiretorioPdfProtegido) then
    ForceDirectories(viDiretorioPdfProtegido);

//  Result := dtmControles.CryptoPdf( vpOrigem, vpDestino, vpSenha);
end;

end.
