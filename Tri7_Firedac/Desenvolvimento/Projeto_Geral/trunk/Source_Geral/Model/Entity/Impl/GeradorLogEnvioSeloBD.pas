unit GeradorLogEnvioSeloBD;

interface

uses
  GeradorLogEnvioSelo,
  System.SysUtils,
  I9Connection,
  I9Query;

type
  TGeradorLogEnvioSeloBD = class(TInterfacedObject, IGeradorLogEnvioSelo)
  private
    FBDLog: TI9Connection;
    FSistema: string;
  public
    constructor Create(
      const vpBDLog: TI9Connection;
      const vpSistema: string); reintroduce;

    procedure GerarLogEnvioSelo(
      vpConector: TI9Connection;
      const vpSistema: string;
      const vpSeloLivroId: Integer;
      const vpDataEnvio: TDateTime;
      const vpSituacao: string;
      const vpObservacao: string;
      const vpValue: Exception);

    class function New(
      const vpBDLog: string;
      const vpSistema: string): IGeradorLogEnvioSelo;
  end;

implementation

uses
  System.Math,
  BooleanHelper,
  System.Classes,
  System.Types,
  System.StrUtils;

{ TGeradorLogEnvioSeloBD }

constructor TGeradorLogEnvioSeloBD.Create(
  const vpBDLog: TI9Connection;
  const vpSistema: string);
begin
  inherited Create;
  FBDLog := vpBDLog;
  FSistema := vpSistema;
end;

procedure TGeradorLogEnvioSeloBD.GerarLogEnvioSelo(
  vpConector: TI9Connection;
  const vpSistema: string;
  const vpSeloLivroId: Integer;
  const vpDataEnvio: TDateTime;
  const vpSituacao: string;
  const vpObservacao: string;
  const vpValue: Exception);

{$REGION 'Constantes'}
const
  CI_FORMATO: string = 'dd_mm_yyyy';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viQryAux: TI9Query;
{$ENDREGION}
begin
  if not FBDLog.Connected then
    FBDLog.Connected := True;

//  viArquivo.Add('Hora: ' + TimeToStr(Time));
//  viArquivo.Add('Sistema: ' + FSistema);
//  viArquivo.Add('Classe do Erro: ' + vpValue.ClassName);
//  viArquivo.Add('Mensagem do Erro:');
//  viArquivo.Add(vpValue.Message);

  viQryAux := TI9Query.Create(nil);
  try
    viQryAux.Close;
    viQryAux.Connection := FBDLog;
    viQryAux.SQL.Clear;
    viQryAux.SQL.Add(' ');
    viQryAux.SQL.Add('   INSERT INTO G_LOG_ENVIO_SELO ( ');
    viQryAux.SQL.Add('          LOG_ENVIO_SELO_ID ');
    viQryAux.SQL.Add('          , SELO_LIVRO_ID ');
    viQryAux.SQL.Add('          , DATA_ENVIO ');
    viQryAux.SQL.Add('          , SITUACAO ');
    viQryAux.SQL.Add('          , OBSERVACAO ');
    viQryAux.SQL.Add(' ) VALUES ( ');
    viQryAux.SQL.Add('          ' + IntToStr(NovoId));
    viQryAux.SQL.Add('          ,  ');
    viQryAux.SQL.Add('          , :DATA_ENVIO ');
    viQryAux.SQL.Add('          , :SITUACAO ');
    viQryAux.SQL.Add('          , :OBSERVACAO ');
    viQryAux.SQL.Add(' ) ');

    CONTINUAR AMANHÃ COM A GRAVAÇÃO NA TABELA DE LOG DE ENVIO DE SELOS.

    try
      viQryAux.ExecSQL;
    except
      FreeAndNil(viQryAux);
    end;

  finally
    FreeAndNil(viQryAux);
  end;
end;

class function TGeradorLogEnvioSeloBD.New(
  const vpBDLog: string;
  const vpSistema: string): IGeradorLogEnvioSelo;
begin
  Result := Create(
    vpBDLog,
    vpSistema);
end;

end.
