{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Business.Impl.UsuarioPKI.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Business.Impl.UsuarioPKI;

interface

uses
  Data.DB,
  Geral.Model.Business.Spec.UsuarioPKI,
  Geral.Model.Entity.Spec.PKI,
  I9Connection;

type
  TUsuarioPKI_Business = class(TInterfacedObject, IUsuarioPKI_Business)
  private
    FConnection: TI9Connection;

    constructor Create(
      const vpConnection: TI9Connection); reintroduce;
  public
    class function New(
      const vpConnection: TI9Connection): IUsuarioPKI_Business;

    function ValidarVinculo(
      const vpUsuarioID: Integer;
      const vpX509Certificate: IX509Certificate): Integer;

    function ValidarCadastro(
      const vpX509Certificate: IX509Certificate;
      const vpSistemaId: Integer): Integer;

    function ValidarCadastroUsuario(
      const vpSerialNumero: string;
      const vpUsuarioId: Integer): Boolean;

    function GetObject(
      const vpUsuarioID: Integer): TDataSet;
  end;

implementation

uses
  I9Query,
  System.SysUtils;

{ TUsuarioPKI_Business }

constructor TUsuarioPKI_Business.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TUsuarioPKI_Business.GetObject(
  const vpUsuarioID: Integer): TDataSet;
var
  viQuery: TI9Query;
begin
  Result := nil;

  viQuery := TI9Query.Create(nil);

  viQuery.Connection := FConnection;

  viQuery.SQL.Text :=
    'SELECT '+
    '  G_UP.USUARIO_PKI_ID, '+
    '  G_UP.USUARIO_ID, '+
    '  G_UP.EMISSOR, '+
    '  G_UP.NUMERO_SERIE, '+
    '  G_UP.SITUACAO '+
    'FROM G_USUARIO_PKI G_UP '+
    'WHERE G_UP.USUARIO_ID = :P_USUARIO_ID ';

  viQuery.ParamByName('P_USUARIO_ID').AsInteger := vpUsuarioID;

  viQuery.Open;

  Result := viQuery;
end;

class function TUsuarioPKI_Business.New(
  const vpConnection: TI9Connection): IUsuarioPKI_Business;
begin
  Result := Create(
    vpConnection);
end;

function TUsuarioPKI_Business.ValidarCadastro(
  const vpX509Certificate: IX509Certificate;
  const vpSistemaId: Integer): Integer;
var
  viQuery: TI9Query;
  viAtivo: Boolean;
begin
  Result := 0;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    G_UP.USUARIO_PKI_ID, '+
      '    G_UP.SITUACAO '+
      'FROM '+
      '    G_USUARIO_PKI G_UP '+
      'INNER JOIN '+
      '    G_USUARIO_SISTEMA G_US ON G_US.USUARIO_ID = G_UP.USUARIO_ID '+
      'WHERE '+
      '    G_UP.EMISSOR = :EMISSOR AND '+
      '    G_UP.NUMERO_SERIE = :NUMERO_SERIE AND '+
      '    G_US.SISTEMA_ID = :SISTEMA_ID ';
    {$ENDREGION}

    viQuery.ParamByName('EMISSOR').AsString := vpX509Certificate.Issuer.CommonName;
    viQuery.ParamByName('NUMERO_SERIE').AsString := vpX509Certificate.SerialNumber;
    viQuery.ParamByName('SISTEMA_ID').AsInteger := vpSistemaId;

    viQuery.Open;

    if viQuery.IsEmpty then
      raise Exception.Create('O certificado digital informado não está cadastrado.');

    if viQuery.RecordCount > 1 then
      raise Exception.Create('Existe mais de um certificado digital vinculado à um usuário com o mesmo sistema.');

    viAtivo := viQuery.FieldByName('SITUACAO').AsString = 'A';
    if not viAtivo then
      raise Exception.Create('O certificado digital informado não está ativo.');

    Result := viQuery.FieldByName('USUARIO_PKI_ID').AsInteger;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TUsuarioPKI_Business.ValidarCadastroUsuario(
  const vpSerialNumero: string;
  const vpUsuarioId: Integer): Boolean;
var
  viQuery: TI9Query;
  viAtivo: Boolean;
begin
  Result := False;
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    G_UP.USUARIO_PKI_ID '+
      'FROM '+
      '    G_USUARIO_PKI G_UP '+
      'WHERE '+
      '    G_UP.NUMERO_SERIE = :NUMERO_SERIE AND '+
      '    G_UP.SITUACAO = :SITUACAO AND '+
      '    G_UP.USUARIO_ID = :USUARIO_ID ';
    {$ENDREGION}

    viQuery.ParamByName('NUMERO_SERIE').AsString := vpSerialNumero;
    viQuery.ParamByName('SITUACAO').AsString := 'A';
    viQuery.ParamByName('USUARIO_ID').AsInteger := vpUsuarioId;

    viQuery.Open;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;

end;

function TUsuarioPKI_Business.ValidarVinculo(
  const vpUsuarioID: Integer;
  const vpX509Certificate: IX509Certificate): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  Result := 0;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_UP.USUARIO_PKI_ID, ' +
      'G_UP.SITUACAO ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_USUARIO_PKI G_UP ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_UP.USUARIO_ID = :P_USUARIO_ID AND ' +
      'G_UP.EMISSOR = :P_EMISSOR AND ' +
      'G_UP.NUMERO_SERIE = :P_NUMERO_SERIE';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_USUARIO_ID').AsInteger := vpUsuarioID;

    viQuery.ParamByName(
      'P_EMISSOR').AsString := vpX509Certificate.Issuer.CommonName;

    viQuery.ParamByName(
      'P_NUMERO_SERIE').AsString := vpX509Certificate.SerialNumber;
    {$ENDREGION}

    viQuery.Open;
    try
      if viQuery.IsEmpty then
        raise Exception.Create(
          'O usuário informado não está vinculado ao ' +
          'certificado digital informado.');

      // A = Ativo
      if viQuery.FieldByName(
        'SITUACAO').AsString <> 'A' then
        raise Exception.Create(
          'O usuário informado está vinculado ao ' +
          'certificado digital informado porém, ' +
          'o mesmo não está ativo.');

      Result := viQuery.FieldByName(
        'USUARIO_PKI_ID').AsInteger;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

end.
