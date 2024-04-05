{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Controller.Factory.Entity.PKI.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Controller.Factory.Entity.PKI;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.PKI;

type
  TTipoCertificado = (tcXSignPKCS, tcEldos);

  TSelecaoCertificadoDigitalFactory = class(TInterfacedObject,
    IFactory<ISelecaoCertificadoDigital>)
  private
    FTipoCertificado: TTipoCertificado;

    constructor Create(
      const vpTipoCertificado: TTipoCertificado); reintroduce;
  public
    function GetInstance: ISelecaoCertificadoDigital;

    class function New: IFactory<ISelecaoCertificadoDigital>; overload;

    class function New(
      const vpTipoCertificado: TTipoCertificado): IFactory<ISelecaoCertificadoDigital>; overload;
  end;

  TValidarAssinatura_Factory = class(TInterfacedObject,
    IFactory<IValidarAssinatura>)
  public
    function GetInstance: IValidarAssinatura;
    class function New: IFactory<IValidarAssinatura>;
  end;

  TAssinaturaArquivoCADES_Factory = class(TInterfacedObject,
    IFactory<IAssinaturaArquivo>)
  public
    function GetInstance: IAssinaturaArquivo;
    class function New: IFactory<IAssinaturaArquivo>;
  end;

  TAssinaturaArquivoPADES_Factory = class(TInterfacedObject,
    IFactory<IAssinaturaPADES>)
  public
    function GetInstance: IAssinaturaPADES;
    class function New: IFactory<IAssinaturaPADES>;
  end;

  TAssinaturaTextoFactory = class(TInterfacedObject,
    IFactory<IAssinaturaTexto>)
  public
    function GetInstance: IAssinaturaTexto;
    class function New: IFactory<IAssinaturaTexto>;
  end;

  TAssinaturaXmlDSigFactory = class(TInterfacedObject, IFactory<IAssinaturaXmlDSig>)
  public
    function GetInstance: IAssinaturaXmlDSig;
    class function New: IFactory<IAssinaturaXmlDSig>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.PKI.XSignPKCS,
  Controles,
  Geral.Model.Entity.Impl.PKI.Eldos;

{ TSelecaoCertificadoDigitalFactory }

constructor TSelecaoCertificadoDigitalFactory.Create(
  const vpTipoCertificado: TTipoCertificado);
begin
  inherited Create;
  FTipoCertificado := vpTipoCertificado;
end;

function TSelecaoCertificadoDigitalFactory.GetInstance:
  ISelecaoCertificadoDigital;
begin
  if FTipoCertificado = TTipoCertificado.tcXSignPKCS then
  begin
    Result := Geral.Model.Entity.Impl.PKI.XSignPKCS.TSelecaoCertificadoDigital.New(
      dtmControles.BuscarParametroOutroSistema(
        'USUARIO_XSIGN_PKCS',
        'GERAL',
        'PKI',
        '5'),
      dtmControles.BuscarParametroOutroSistema(
        'LICENCA_XSIGN_PKCS',
        'GERAL',
        'PKI',
        '5'));

    Exit;
  end;

  Result := Geral.Model.Entity.Impl.PKI.Eldos.TSelecaoCertificadoDigital.New;
end;

class function TSelecaoCertificadoDigitalFactory.New: IFactory<ISelecaoCertificadoDigital>;
begin
  Result := New(
    TTipoCertificado.tcXSignPKCS);
end;

class function TSelecaoCertificadoDigitalFactory.New(
  const vpTipoCertificado: TTipoCertificado): IFactory<ISelecaoCertificadoDigital>;
begin
  Result := Create(
    vpTipoCertificado);
end;

{ TAssinaturaArquivoCADES_Factory }

function TAssinaturaArquivoCADES_Factory.GetInstance: IAssinaturaArquivo;
begin
  Result := Geral.Model.Entity.Impl.PKI.XSignPKCS.TAssinaturaArquivoCADES.New;
end;

class function TAssinaturaArquivoCADES_Factory.New:
  IFactory<IAssinaturaArquivo>;
begin
  Result := Create;
end;

{ TAssinaturaTextoFactory }

function TAssinaturaTextoFactory.GetInstance: IAssinaturaTexto;
begin
  Result := TAssinaturaTexto.New;
end;

class function TAssinaturaTextoFactory.New: IFactory<IAssinaturaTexto>;
begin
  Result := Create;
end;

{ TAssinaturaArquivoPADES_Factory }

function TAssinaturaArquivoPADES_Factory.GetInstance: IAssinaturaPADES;
begin
  Result := TAssinaturaArquivoPADES.New;
end;

class function TAssinaturaArquivoPADES_Factory.New: IFactory<IAssinaturaPADES>;
begin
  Result := Create;
end;

{ TAssinaturaXmlDSigFactory }

function TAssinaturaXmlDSigFactory.GetInstance: IAssinaturaXmlDSig;
begin
  Result := TElAssinaturaXmlDSig.New;
end;

class function TAssinaturaXmlDSigFactory.New: IFactory<IAssinaturaXmlDSig>;
begin
  Result := Create;
end;

{ TValidarAssinatura_Factory }

function TValidarAssinatura_Factory.GetInstance: IValidarAssinatura;
begin
  Result := TValidarAssinatura.New;
end;

class function TValidarAssinatura_Factory.New: IFactory<IValidarAssinatura>;
begin
  Result := Create;
end;

end.
