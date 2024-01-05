unit ConsultorCNPJReceitaWS;

interface

uses
  ConsultorCNPJ,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.ParametrosProxy,
  RetornoConsultaCNPJ;

type
  TConsultorCNPJReceitaWS = class(TInterfacedObject, IConsultorCNPJ)
  private
    FParametrosProxy: IMaybe<IParametrosProxy>;
  public
    constructor Create(
      const vpParametrosProxy: IMaybe<IParametrosProxy>); reintroduce;

    function ConsultarCNPJ(
      const vpValue: string): IRetornoConsultaCNPJ;

    class function New(
      const vpParametrosProxy: IMaybe<IParametrosProxy>): IConsultorCNPJ;
  end;

implementation

uses
  IPPeerClient,
  REST.Client,
  System.SysUtils,
  CNPJUtils,
  Data.DB,
  Datasnap.DBClient,
  REST.Response.Adapter,
  ConsultaCNPJException,
  System.Math,
  System.Types,
  BooleanHelper,
  StringUtils,
  RetornoConsultaCNPJImpl;

{ TConsultorCNPJReceitaWS }

function TConsultorCNPJReceitaWS.ConsultarCNPJ(
  const vpValue: string): IRetornoConsultaCNPJ;
{$REGION 'Constantes'}
const
  CI_BASE_URL: string = 'https://www.receitaws.com.br/v1/cnpj/%s';
  CI_ACCEPT: string = 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  CI_ACCEPT_CHARSET: string = 'UTF-8, *;q=0.8';
  CI_ACCEPT_ENCODING: string = 'identity';
  CI_HANDLE_REDIRECTS: Boolean = True;
  CI_RAISE_EXCEPTION_ON_500: Boolean = False;
  CI_HTTP_STATUS_CODE_OK: Integer = 200;
  CI_DATE_SEPARATOR: Char = '/';
  CI_SHORT_DATE_FORMAT: string = 'dd/MM/yyyy';
  CI_STORE_DEFS: Boolean = True;
{$ENDREGION}
  
{$REGION 'Variáveis'}
var
  viRESTClient: TRESTClient;
  viRESTResponse: TRESTResponse;
  viRESTRequest: TRESTRequest;
  viClientDataSet: TClientDataSet;
  viCustomJSONDataSetAdapter: TCustomJSONDataSetAdapter;
  viFormatSettings: TFormatSettings;
{$ENDREGION}
begin
  Result := nil;

  viRESTClient := TRESTClient.Create(
    string.Format(
      CI_BASE_URL,
      [TCNPJUtils.RetirarFormatacao(
        vpValue)]));

  viRESTResponse := TRESTResponse.Create(nil);
  viRESTRequest := TRESTRequest.Create(nil);
  
  try
    {$REGION 'Configurar RESTClient'}
    with viRESTClient do
    begin
      Accept := CI_ACCEPT;
      AcceptCharset := CI_ACCEPT_CHARSET;
      AcceptEncoding := CI_ACCEPT_ENCODING;
      HandleRedirects := CI_HANDLE_REDIRECTS;
      RaiseExceptionOn500 := CI_RAISE_EXCEPTION_ON_500;

      if FParametrosProxy.HasValue then
      begin
        ProxyServer := FParametrosProxy.Value.Server;
        ProxyPort := FParametrosProxy.Value.Port;
        ProxyUsername := FParametrosProxy.Value.Username;
        ProxyPassword := FParametrosProxy.Value.Password;
      end;

    end;
    {$ENDREGION}    

    {$REGION 'Configurar RESTRequest'}
    with viRESTRequest do
    begin
      Client := viRESTClient;
      Response := viRESTResponse;
      SynchronizedEvents := False;
    end;  
    {$ENDREGION}

    try
      viRESTRequest.Execute;
    except
      on E: Exception do
        raise EConsultaCNPJException.Create(E.Message); 
    end;

    if (CompareValue(viRESTResponse.StatusCode,
      CI_HTTP_STATUS_CODE_OK) = EqualsValue).&Not then
      raise EConsultaCNPJException.Create(
        string.Format(
          '%s %s%s%s',
          [viRESTResponse.StatusCode.ToString,
          viRESTResponse.StatusText,
          TStringUtils.GetQuebraLinhaDupla,
          viRESTResponse.Content]));

    viClientDataSet := TClientDataSet.Create(nil);
    {$REGION 'Configurar ClientDataSet'}
    viClientDataSet.StoreDefs := CI_STORE_DEFS;
    {$ENDREGION}
    
    viCustomJSONDataSetAdapter := TCustomJSONDataSetAdapter.Create(nil);
    {$REGION 'Configurar CustomJSONDataSetAdapter'}
    viCustomJSONDataSetAdapter.Dataset := viClientDataSet;
    {$ENDREGION}
    
    try
      viCustomJSONDataSetAdapter.UpdateDataSet(viRESTResponse.JSONValue);  
      try
        if viClientDataSet.IsEmpty then
          Exit;

        viClientDataSet.First;

        if viClientDataSet.FieldByName('status').AsString.Equals('ERROR') then
          raise EConsultaCNPJException.Create(
            viClientDataSet.FieldByName('message').AsString);

        viFormatSettings := TFormatSettings.Create;            
        {$REGION 'Configurar FormatSettings'}
        with viFormatSettings do
        begin
          DateSeparator := CI_DATE_SEPARATOR;
          ShortDateFormat := CI_SHORT_DATE_FORMAT;
        end;  
        {$ENDREGION}
  
        Result := TRetornoConsultaCNPJ.Create;      
        {$REGION 'Preencher RetornoConsultaCNPJ'}
        with Result, viClientDataSet do
        begin
          DataSituacao := StrToDateDef(
            FieldByName('data_situacao').AsString, ZeroValue, viFormatSettings);

          Nome := FieldByName('nome').AsString;
          UF := FieldByName('uf').AsString;
          Telefone := FieldByName('telefone').AsString;
          Situacao := FieldByName('situacao').AsString;
          Bairro := FieldByName('bairro').AsString;
          Logradouro := FieldByName('logradouro').AsString;
          Numero := FieldByName('numero').AsString;
          CEP := FieldByName('cep').AsString;
          Municipio := FieldByName('municipio').AsString;

          DataAbertura := StrToDateDef(
            FieldByName('abertura').AsString, ZeroValue, viFormatSettings);

          NomeFantasia := FieldByName('fantasia').AsString;    
          CNPJ := FieldByName('cnpj').AsString;
          Tipo := FieldByName('tipo').AsString;
          Complemento := FieldByName('complemento').AsString;
          Email := FieldByName('email').AsString;
          MotivoSituacao := FieldByName('motivo_situacao').AsString;
        end;  
        {$ENDREGION}  
      finally
        viClientDataSet.Close;
      end;      
    finally
      FreeAndNil(viClientDataSet);
      FreeAndNil(viCustomJSONDataSetAdapter);
    end;
  finally  
    FreeAndNil(viRESTClient);
    FreeAndNil(viRESTResponse);
    FreeAndNil(viRESTRequest);
  end;
end;

constructor TConsultorCNPJReceitaWS.Create(
  const vpParametrosProxy: IMaybe<IParametrosProxy>);
begin
  inherited Create;
  FParametrosProxy := vpParametrosProxy;
end;

class function TConsultorCNPJReceitaWS.New(
  const vpParametrosProxy: IMaybe<IParametrosProxy>): IConsultorCNPJ;
begin
  Result := Self.Create(
    vpParametrosProxy);
end;

end.
