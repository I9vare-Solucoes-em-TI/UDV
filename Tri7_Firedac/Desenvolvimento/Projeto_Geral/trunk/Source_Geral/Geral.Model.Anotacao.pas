unit Geral.Model.Anotacao;

interface

uses
  Data.DB,
  Firedac.Stan.Param,
  Geral.Model.DAO,
  System.Classes,
  System.Generics.Collections;

type
  TAnotacao = class
  strict private
    FAnotacaoId: Integer;
    FUsuarioId: Integer;
    FMensagem: TStream;
    FData: TDateTime;
    FTitulo: String;
    FSistemaId: Integer;
    FGeral: String;
    FSituacao: String;
    FGrupo: String;
    FExclusivoSistemaOrigem: string;
  public
    property AnotacaoId: Integer read FAnotacaoId write FAnotacaoId;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property Mensagem: TStream read FMensagem write FMensagem;
    property Data: TDateTime read FData write FData;
    property Titulo: String read FTitulo write FTitulo;
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property Geral: String read FGeral write FGeral;
    property Situacao: String read FSituacao write FSituacao;
    property Grupo: String read FGrupo write FGrupo;
    property ExclusivoSistemaOrigem: string read FExclusivoSistemaOrigem write FExclusivoSistemaOrigem;
  end;

  TAnotacaoUtil = class
  public
    class function Preencher(
      const vpAnotacaoId: Integer;
      const vpUsuarioId: Integer;
      const vpMensagem: TStream;
      const vpData: TDateTime;
      const vpTitulo: String;
      const vpSistemaId: Integer;
      const vpGeral: String;
      const vpSituacao: String;
      const vpGrupo: String;
      const vpExclusivoSistemaOrigem: string): TAnotacao;
  end;

  TAnotacaoDAO = class(TDAO<TAnotacao>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TAnotacao; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TAnotacao); override;
  end;

  TAnotacaoBusiness = class
  public
    class function Excluir(
      const vpAnotacaoId: Integer): Integer;
  end;

implementation

uses
  Controles,
  System.SysUtils;

{ TAnotacaoDAO }

function TAnotacaoDAO.CreateObject(
  const vpDataSet: TDataSet): TAnotacao;
begin
  Result := TAnotacaoUtil.Preencher(
    vpDataSet.FieldByName('ANOTACAO_ID').AsInteger,
    vpDataSet.FieldByName('USUARIO_ID').AsInteger,
    vpDataSet.CreateBlobStream(vpDataSet.FieldByName('MENSAGEM'), TBlobStreamMode.bmRead),
    vpDataSet.FieldByName('DATA').AsDateTime,
    vpDataSet.FieldByName('TITULO').AsString,
    vpDataSet.FieldByName('SISTEMA_ID').AsInteger,
    vpDataSet.FieldByName('GERAL').AsString,
    vpDataSet.FieldByName('SITUACAO').AsString,
    vpDataSet.FieldByName('GRUPO').AsString,
    vpDataSet.FieldByName('EXCLUSIVO_SISTEMA_FINANCEIRO').AsString);
end;

procedure TAnotacaoDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TAnotacao);
begin
  inherited;
  vpParams.ParamByName('ANOTACAO_ID').AsIntegers[vpIndex] := vpValue.AnotacaoId;
  vpParams.ParamByName('USUARIO_ID').AsIntegers[vpIndex] := vpValue.UsuarioId;
  vpParams.ParamByName('MENSAGEM').AsStreams[vpIndex] := vpValue.Mensagem;
  vpParams.ParamByName('DATA').AsDateTimes[vpIndex] := vpValue.Data;
  vpParams.ParamByName('TITULO').AsStrings[vpIndex] := vpValue.Titulo;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('GERAL').AsStrings[vpIndex] := vpValue.Geral;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('GRUPO').AsStrings[vpIndex] := vpValue.Grupo;
  vpParams.ParamByName('EXCLUSIVO_SISTEMA_FINANCEIRO').AsStrings[vpIndex] := vpValue.ExclusivoSistemaOrigem;
end;

function TAnotacaoDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TAnotacaoDAO.GetTableName: string;
begin
  Result := 'G_ANOTACAO';
end;

{ TAnotacaoUtil }

class function TAnotacaoUtil.Preencher(
  const vpAnotacaoId: Integer;
  const vpUsuarioId: Integer;
  const vpMensagem: TStream;
  const vpData: TDateTime;
  const vpTitulo: String;
  const vpSistemaId: Integer;
  const vpGeral: String;
  const vpSituacao: String;
  const vpGrupo: String;
  const vpExclusivoSistemaOrigem: string): TAnotacao;
begin
  Result := TAnotacao.Create;
  Result.AnotacaoId := vpAnotacaoId;
  Result.UsuarioId := vpUsuarioId;
  Result.Mensagem := vpMensagem;
  Result.Data := vpData;
  Result.Titulo := vpTitulo;
  Result.SistemaId := vpSistemaId;
  Result.Geral := vpGeral;
  Result.Situacao := vpSituacao;
  Result.Grupo := vpGrupo;
  Result.ExclusivoSistemaOrigem := vpExclusivoSistemaOrigem;
end;

{ TTAnotacaoBusiness }

class function TAnotacaoBusiness.Excluir(
  const vpAnotacaoId: Integer): Integer;
var
  viAnotacaoDAO: TAnotacaoDAO;
begin
  viAnotacaoDAO := nil;
  try
    viAnotacaoDAO := TAnotacaoDAO.Create(DtmControles.DB);
    Result := viAnotacaoDAO.Delete(vpAnotacaoId);
  finally
    FreeAndNil(viAnotacaoDAO);
  end;
end;

end.
