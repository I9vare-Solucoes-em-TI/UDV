{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.Assinar.PDF.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gest�o e Solu��es em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.Assinar.PDF;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.PDF,
  Geral.Controller.Factory.Entity.PKI;

type
  TTipoAssinatura = (taCADES, taPADES);

  TAssinarPDF = class
    private
      FTipoCertificado: TTipoCertificado;
      FIX509Certificate: IMaybe<IX509Certificate>;
      FAssinaturaArquivoCADES: IAssinaturaArquivo;
      FAssinaturaArquivoPADES: IAssinaturaPADES;
      FCertificadoSelecionado: Boolean;
      FAssinaturaVisivel: Boolean;
      FBackground: Boolean;
      FShowOnAllPages,
      FManifestoAssinatura: Boolean;
      FNumeroSelo: string;

      procedure ValidaCertificadoSelecionado;
      function GetAssinaturaVisivel: Boolean;
      function GetBackground: Boolean;
      function GetShowOnAllPages: Boolean;

    public
      constructor Create(
        const vpTipoAssinatura: TTipoAssinatura);

      function SelecionarCertificadoDigital: Boolean;

      procedure CertificadoSelecionado(vpSelecionado: Boolean; vpCertificado: IMaybe<IX509Certificate>);

//      function ConveterPDFA(const vpOrigem, vpDestino: string): Boolean; deprecated;

      function AssinarPDF(const vpCaminhoArquivo: string;
        const vpSenha: string): Boolean; overload;

      function AssinarPDF(const vpCaminhoArquivo: string): Boolean; overload;

      function ValidarAssinatura(const vpCaminhoArquivo: string): Boolean;

      property X509Certificate: IMaybe<IX509Certificate> read FIX509Certificate write FIX509Certificate;
      property NumeroSelo: string  read FNumeroSelo write FNumeroSelo;
  end;

implementation

uses
  MensagemUtils,
  Controles;

{ TAssinarPDF }

function TAssinarPDF.AssinarPDF(const vpCaminhoArquivo: string;
  const vpSenha: string): Boolean;
//var
//  viManifestoAssinatura: TManifestoAssinatura;
begin
  Result := False;

  ValidaCertificadoSelecionado;

  try
    if FTipoCertificado = TTipoCertificado.tcXSignPKCS then
      FAssinaturaArquivoCADES.Assinar(vpCaminhoArquivo, FIX509Certificate.Value)
    else
    begin
      {$REGION 'Manifesto de Assinatura'}
      if FManifestoAssinatura then
      begin
//        viManifestoAssinatura := nil;
{        try
          viManifestoAssinatura := TManifestoAssinatura.Create(FIX509Certificate.Value);
          viManifestoAssinatura.NumeroSelo := FNumeroSelo;

          if viManifestoAssinatura.GerarManifestoAssintura then
          begin
            if not TPDF.MergeFiles(vpCaminhoArquivo, viManifestoAssinatura.NomeArquivoManifesto, vpCaminhoArquivo) then
              raise Exception.Create('Erro ao juntar o manifesto de assinatura ao arquivo principal!')
          end
          else
            raise Exception.Create('Erro ao gerar o manifesto de assinatura!')
        finally
          FreeAndNil(viManifestoAssinatura);
        end;                                }
      end;
      {$ENDREGION}

      FAssinaturaArquivoPADES.Assinar(vpCaminhoArquivo,
        FIX509Certificate.Value,
        GetAssinaturaVisivel,
        GetBackground,
        GetShowOnAllPages,
        vpSenha,0,0);
    end;

    Result := True;
  except
    on E : Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Erro: ' + E.Message);
    end;
  end;
end;

function TAssinarPDF.AssinarPDF(const vpCaminhoArquivo: string): Boolean;
begin
  Result := AssinarPDF(vpCaminhoArquivo, EmptyStr);
end;

procedure TAssinarPDF.CertificadoSelecionado(vpSelecionado: Boolean; vpCertificado: IMaybe<IX509Certificate>);
begin
  FCertificadoSelecionado := vpSelecionado;
  FIX509Certificate := vpCertificado;
end;

//function TAssinarPDF.ConveterPDFA(const vpOrigem, vpDestino: string): Boolean;
//begin
//  Result := TPDF.ConveterPDFA(vpOrigem, vpDestino);
//end;

constructor TAssinarPDF.Create(const vpTipoAssinatura: TTipoAssinatura);
begin
  FNumeroSelo := EmptyStr;
  FCertificadoSelecionado := False;

  FAssinaturaVisivel := dtmControles.BuscarParametroOutroSistema(
    'ASSINATURA_VISIVEL',
    'ASSINATURA',
    'PRINCIPAL',
    '5') = 'S';
  FBackground := dtmControles.BuscarParametroOutroSistema(
    'ASSINATURA_BACKGROUND',
    'ASSINATURA',
    'PRINCIPAL',
    '5') = 'S';
  FShowOnAllPages := dtmControles.BuscarParametroOutroSistema(
    'ASSINATURA_TODAS_PAGINAS',
    'ASSINATURA',
    'PRINCIPAL',
    '5') = 'S';
  FManifestoAssinatura := dtmControles.BuscarParametroOutroSistema(
    'HABILITAR_MANIFESTO_ASSINATURA',
    'GERAL',
    'PRINCIPAL',
    '5') = 'S';


  if vpTipoAssinatura = taCADES then
  begin
    FTipoCertificado   := tcXSignPKCS;
    FAssinaturaArquivoCADES := TAssinaturaArquivoCADES_Factory.New.GetInstance;
  end
  else
  begin
    FTipoCertificado   := tcEldos;
    FAssinaturaArquivoPADES := TAssinaturaArquivoPADES_Factory.New.GetInstance;
  end;
end;

function TAssinarPDF.GetAssinaturaVisivel: Boolean;
begin
  Result := FAssinaturaVisivel;
end;

function TAssinarPDF.GetBackground: Boolean;
begin
  Result := FBackground;
end;

function TAssinarPDF.GetShowOnAllPages: Boolean;
begin
  Result := FShowOnAllPages;
end;

procedure TAssinarPDF.ValidaCertificadoSelecionado;
begin
  if not FCertificadoSelecionado then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
        'Por favor, selecione um certificado digital.');
    Abort;
  end;
end;

function TAssinarPDF.ValidarAssinatura(const vpCaminhoArquivo: string): Boolean;
var
  viValidarAssinatura: IValidarAssinatura;
begin
  Result := False;
  try
    viValidarAssinatura := TValidarAssinatura_Factory.New.GetInstance;
    Result := viValidarAssinatura.ValidarAssinatura(vpCaminhoArquivo);

  except
    on E : Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        E.Message);
    end;
  end;
end;

function TAssinarPDF.SelecionarCertificadoDigital: Boolean;
var
  viSelecaoCertificadoDigital: ISelecaoCertificadoDigital;
begin
  Result := False;
  FCertificadoSelecionado := False;

  viSelecaoCertificadoDigital := TSelecaoCertificadoDigitalFactory.New(FTipoCertificado).GetInstance;
  FIX509Certificate := viSelecaoCertificadoDigital.Selecionar;

  if not FIX509Certificate.HasValue then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum certificado digital foi selecionado!');

    Exit;
  end
  else
    FCertificadoSelecionado := True;

  Result := FCertificadoSelecionado;
end;

end.