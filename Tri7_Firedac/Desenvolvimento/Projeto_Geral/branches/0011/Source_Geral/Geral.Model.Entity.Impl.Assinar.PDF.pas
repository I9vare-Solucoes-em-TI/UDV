unit Geral.Model.Entity.Impl.Assinar.PDF;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MensagemUtils,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.PDF,
  Geral.Controller.Factory.Entity.PDF,
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
      FShowOnAllPages: Boolean;

      procedure ValidaCertificadoSelecionado;
      function GetAssinaturaVisivel: Boolean;
      function GetBackground: Boolean;
      function GetShowOnAllPages: Boolean;

    public
      constructor Create(
        const vpTipoAssinatura: TTipoAssinatura);

      function SelecionarCertificadoDigital: Boolean;

      function ConveterPDFA(const vpOrigem, vpDestino: string): Boolean;

      function AssinarPDF(const vpCaminhoArquivo: string;
        const vpSenha: string): Boolean; overload;

      function AssinarPDF(const vpCaminhoArquivo: string): Boolean; overload;

      function ValidarAssinatura(const vpCaminhoArquivo: string): Boolean;
  end;

implementation

uses
  Controles;

{ TAssinarPDF }

function TAssinarPDF.AssinarPDF(const vpCaminhoArquivo: string;
  const vpSenha: string): Boolean;
begin
  Result := False;

  ValidaCertificadoSelecionado;

  try
    if FTipoCertificado = TTipoCertificado.tcXSignPKCS then
      FAssinaturaArquivoCADES.Assinar(vpCaminhoArquivo, FIX509Certificate.Value)
    else
      FAssinaturaArquivoPADES.Assinar(vpCaminhoArquivo,
        FIX509Certificate.Value,
        GetAssinaturaVisivel,
        GetBackground,
        GetShowOnAllPages,
        vpSenha);

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

function TAssinarPDF.ConveterPDFA(const vpOrigem, vpDestino: string): Boolean;
var
  viPDF_Library: IPDF_Library;
begin
  Result := False;
  try
    viPDF_Library := TPDF_LibraryFactory.New.GetInstance;

    viPDF_Library.LoadFromFile(
      vpOrigem);

    viPDF_Library.SetPDF_A_Mode(
          TPDF_A_Mode.tpPDF_A_3b);

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

constructor TAssinarPDF.Create(const vpTipoAssinatura: TTipoAssinatura);
begin
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
