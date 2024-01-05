unit Geral.Model.Sistema;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Generics.Collections;

const
   CI_SISTEMA_REGISTRO_IMOVEIS         = 'Registro de Imóveis';
   CI_SISTEMA_TABELIONATO_DE_NOTAS     = 'Tabelionato de Notas';
   CI_SISTEMA_DOCUMENTOS               = 'Documentos';
   CI_SISTEMA_CAIXA                    = 'Caixa';
   CI_SISTEMA_CONTRATOS                = 'Contratos';
   CI_SISTEMA_RTD                      = 'Registro de Títulos e Documentos';
   CI_SISTEMA_HDS                      = 'Help Desk Serenity';
   CI_SISTEMA_REUNIOES                 = 'Reuniões';
   CI_SISTEMA_FINANCAS                 = 'Financeiro';
   CI_SISTEMA_ESCOLAR                  = 'Escolar';
   CI_SISTEMA_RC                       = 'Registro Cívil';
   CI_SISTEMA_PROTESTO                 = 'Protesto';
   CI_SISTEMA_SELO                     = 'Selo';
   CI_SISTEMA_REGISTRO_DIARIO          = 'Registro Diário';
   CI_SISTEMA_JURIDICO                 = 'Jurídico';
   CI_SISTEMA_ADMINISTRATIVO           = 'Administrativo';
   CI_SISTEMA_GERAL                    = 'Geral';

   CI_COD_SISTEMA_REGISTRO_IMOVEIS     = 1;
   CI_COD_SISTEMA_TABELIONATO_DE_NOTAS = 2;
   CI_COD_SISTEMA_DOCUMENTOS           = 4;
   CI_COD_SISTEMA_CAIXA                = 5;
   CI_COD_SISTEMA_CONTRATOS            = 6;
   CI_COD_SISTEMA_RTD                  = 7;
   CI_COD_SISTEMA_HDS                  = 8;
   CI_COD_SISTEMA_REUNIOES             = 9;
   CI_COD_SISTEMA_FINANCAS             = 10;
   CI_COD_SISTEMA_ESCOLAR              = 11;
   CI_COD_SISTEMA_RC                   = 12;
   CI_COD_SISTEMA_PROTESTO             = 13;
   CI_COD_SISTEMA_SELO                 = 15;
   CI_COD_SISTEMA_REGISTRO_DIARIO      = 17;
   CI_COD_SISTEMA_JURIDICO             = 18;
   CI_COD_SISTEMA_ADMINISTRATIVO       = 20;
   CI_COD_SISTEMA_GERAL                = 999;

type
  TSistema = class
  strict private
    FSistemaId: Integer;
    FDescricao: String;
    FSituacao: String;
    FVersao: String;
  public
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property Descricao: String read FDescricao write FDescricao;
    property Situacao: String read FSituacao write FSituacao;
    property Versao: String read FVersao write FVersao;
  public
  end;

  TSistemaDAO = class(TDAO<TSistema>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TSistema; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TSistema); override;
  public
    function BuscarNomeSistema(
      const vpSistemaID: Integer): string;
  end;

  TSistemaBusiness = class
  public
    class function Buscar(
      const vpSistemaId: Integer): TSistema;

    class function BuscarNomeSistema(
      const vpSistemaId: Integer): string;

    class function Listar: TObjectList<TSistema>; overload;

    class function Listar(
      const vpSituacao: String): TObjectList<TSistema>; overload;
  end;

implementation

uses
  Controles,
  System.SysUtils;

{ TSistemaBusiness }

class function TSistemaBusiness.Listar: TObjectList<TSistema>;
var
  viSistemaDAO: TSistemaDAO;
begin
  viSistemaDAO := nil;
  try
    viSistemaDAO := TSistemaDAO.Create(dtmControles.DB);

    Result := viSistemaDAO.GetList(
      0,
      0,
      '',
      [],
      'SISTEMA_ID');

  finally
    viSistemaDAO.Free;
  end;
end;

class function TSistemaBusiness.Buscar(
  const vpSistemaId: Integer): TSistema;
var
  viSistemaDAO: TSistemaDAO;
begin
  viSistemaDAO := nil;
  try
    viSistemaDAO := TSistemaDAO.Create(dtmControles.DB);
    Result := viSistemaDAO.GetByID(vpSistemaId);
  finally
    viSistemaDAO.Free;
  end;
end;

class function TSistemaBusiness.BuscarNomeSistema(
  const vpSistemaId: Integer): string;
var
  viSistemaDAO: TSistemaDAO;
begin
  Result := string.Empty;
  viSistemaDAO := nil;

  try
    viSistemaDAO := TSistemaDAO.Create(
      dtmControles.DB);

    Result := viSistemaDAO.BuscarNomeSistema(
      vpSistemaId);
  finally
    FreeAndNil(viSistemaDAO);
  end;
end;

class function TSistemaBusiness.Listar(
  const vpSituacao: String): TObjectList<TSistema>;
var
  viSistemaDAO: TSistemaDAO;
begin
  viSistemaDAO := nil;
  try
    viSistemaDAO := TSistemaDAO.Create(dtmControles.DB);

    Result := viSistemaDAO.GetList(
      0,
      0,
      'SITUACAO = :P_SITUACAO',
      [vpSituacao],
      'SISTEMA_ID');

  finally
    viSistemaDAO.Free;
  end;
end;

{ TSistemaDAO }

function TSistemaDAO.BuscarNomeSistema(
  const vpSistemaID: Integer): string;
var
  viSistema: TDataSet;
begin
  Result := string.Empty;
  viSistema := nil;

  try
    viSistema := GetByID_AsDataSet(
      ['DESCRICAO'],
      vpSistemaID);

    if viSistema.IsEmpty then
      Exit;

    Result := viSistema.FieldByName('DESCRICAO').AsString;
  finally
    FreeAndNil(viSistema);
  end;
end;

function TSistemaDAO.CreateObject(
  const vpDataSet: TDataSet): TSistema;
begin
  Result := TSistema.Create;
  Result.SistemaId := vpDataSet.FieldByName('SISTEMA_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.Versao := vpDataSet.FieldByName('VERSAO').AsString;
end;

procedure TSistemaDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TSistema);
begin
  inherited;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('VERSAO').AsStrings[vpIndex] := vpValue.Versao;
end;

function TSistemaDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TSistemaDAO.GetTableName: string;
begin
  Result := 'G_SISTEMA';
end;

end.
