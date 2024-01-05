unit Geral.Controller.Factory.Business.SINTER;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.SINTER;

type
  TSINTER_BusinessFactory = class(TInterfacedObject, IFactory<ISINTER_Business>)
  private
    function DataHoraServidor: TDateTime;
    function DiretorioRaizArquivos: string;
  public
    function GetInstance: ISINTER_Business;
    class function New: IFactory<ISINTER_Business>;
  end;

implementation

uses
  Geral.Model.Business.Impl.SINTER,
  Controles,
  Geral.Controller.Factory.Entity.PKI,
  Geral.Controller.Factory.Entity.Zip,
  Geral.Controller.Factory.Entity.SINTER;

{ TSINTER_BusinessFactory }

function TSINTER_BusinessFactory.DataHoraServidor: TDateTime;
begin
  Result := dtmControles.DataHoraBanco(
    3,
    False);
end;

function TSINTER_BusinessFactory.DiretorioRaizArquivos: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    'DIRETORIO_RAIZ_ARQUIVOS',
    'GERAL',
    'SINTER',
    '5');
end;

function TSINTER_BusinessFactory.GetInstance: ISINTER_Business;
begin
  Result := TSINTER_Business.New(
    dtmControles.DB,
    dtmControles.GerarSequencia,
    DataHoraServidor,
    dtmControles.AtualizarOuInserirSequencia,
    TAssinaturaArquivoCADES_Factory.New.GetInstance,
    TFileCompressionFactory.New.GetInstance,
    DiretorioRaizArquivos,
    TSINTER_Factory.New.GetInstance);
end;

class function TSINTER_BusinessFactory.New: IFactory<ISINTER_Business>;
begin
  Result := Create;
end;

end.
