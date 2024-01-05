unit Geral.Model.SeloGrupo;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param;

type
  TSeloGrupo = class
  private
    FSeloGrupoId: Integer;
    FDescricao: string;
    FControleAutomatico: string;
    FNomeGrupo: string;
    FIdGrupoSelo: Integer;
    FPaginaAcresce: string;
    FSituacao: string;
    FNumero: Integer;
    FTipoCartorio: string;
    FDescricaoCompleta: string;
    FEstoqueMinimo: Integer;
    FSistemaId: Integer;
    FSeloUsuario: string;
    FSubtipoAto: Integer;
    FTipoAto: Integer;
  public
    property SeloGrupoId: Integer read FSeloGrupoId write FSeloGrupoId;
    property Descricao: string read FDescricao write FDescricao;
    property ControleAutomatico: string read FControleAutomatico write FControleAutomatico;
    property NomeGrupo: string read FNomeGrupo write FNomeGrupo;
    property IdGrupoSelo: Integer read FIdGrupoSelo write FIdGrupoSelo;
    property PaginaAcresce: string read FPaginaAcresce write FPaginaAcresce;
    property Situacao: string read FSituacao write FSituacao;
    property Numero: Integer read FNumero write FNumero;
    property TipoCartorio: string read FTipoCartorio write FTipoCartorio;
    property DescricaoCompleta: string read FDescricaoCompleta write FDescricaoCompleta;
    property EstoqueMinimo: Integer read FEstoqueMinimo write FEstoqueMinimo;
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property SeloUsuario: string read FSeloUsuario write FSeloUsuario;
    property SubtipoAto: Integer read FSubtipoAto write FSubtipoAto;
    property TipoAto: Integer read FTipoAto write FTipoAto;
  end;

  TSeloGrupoDao = class(TDAO<TSeloGrupo>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TSeloGrupo; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TSeloGrupo); override;
  end;

implementation

{ TSeloGrupoDao }

function TSeloGrupoDao.CreateObject(
  const vpDataSet: TDataSet): TSeloGrupo;
begin
  Result := TSeloGrupo.Create;
  Result.SeloGrupoId := vpDataSet.FieldByName('SELO_GRUPO_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.ControleAutomatico := vpDataSet.FieldByName('CONTROLE_AUTOMATICO').AsString;
  Result.NomeGrupo := vpDataSet.FieldByName('NOME_GRUPO').AsString;
  Result.IdGrupoSelo := vpDataSet.FieldByName('ID_GRUPO_SELO').AsInteger;
  Result.PaginaAcresce := vpDataSet.FieldByName('PAGINA_ACRESCE').AsString;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.Numero := vpDataSet.FieldByName('NUMERO').AsInteger;
  Result.TipoCartorio := vpDataSet.FieldByName('TIPO_CARTORIO').AsString;
  Result.DescricaoCompleta := vpDataSet.FieldByName('DESCRICAO_COMPLETA').AsString;
  Result.EstoqueMinimo := vpDataSet.FieldByName('ESTOQUE_MINIMO').AsInteger;
  Result.SistemaId := vpDataSet.FieldByName('SISTEMA_ID').AsInteger;
  Result.SeloUsuario := vpDataSet.FieldByName('SELO_USUARIO').AsString;
  Result.SubtipoAto := vpDataSet.FieldByName('SUBTIPO_ATO').AsInteger;
  Result.TipoAto := vpDataSet.FieldByName('TIPO_ATO').AsInteger;
end;

procedure TSeloGrupoDao.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TSeloGrupo);
begin
  vpParams.ParamByName('SELO_GRUPO_ID').AsIntegers[vpIndex] := vpValue.SeloGrupoId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('CONTROLE_AUTOMATICO').AsStrings[vpIndex] := vpValue.ControleAutomatico;
  vpParams.ParamByName('NOME_GRUPO').AsStrings[vpIndex] := vpValue.NomeGrupo;
  vpParams.ParamByName('ID_GRUPO_SELO').AsIntegers[vpIndex] := vpValue.IdGrupoSelo;
  vpParams.ParamByName('PAGINA_ACRESCE').AsStrings[vpIndex] := vpValue.PaginaAcresce;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('NUMERO').AsIntegers[vpIndex] := vpValue.Numero;
  vpParams.ParamByName('TIPO_CARTORIO').AsStrings[vpIndex] := vpValue.TipoCartorio;
  vpParams.ParamByName('DESCRICAO_COMPLETA').AsStrings[vpIndex] := vpValue.DescricaoCompleta;
  vpParams.ParamByName('ESTOQUE_MINIMO').AsIntegers[vpIndex] := vpValue.EstoqueMinimo;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('SELO_USUARIO').AsStrings[vpIndex] := vpValue.SeloUsuario;
  vpParams.ParamByName('SUBTIPO_ATO').AsIntegers[vpIndex] := vpValue.SubtipoAto;
  vpParams.ParamByName('TIPO_ATO').AsIntegers[vpIndex] := vpValue.TipoAto;
end;

function TSeloGrupoDao.GetColumns: TArray<string>;
begin
  Result := [
    'SELO_GRUPO_ID',
    'DESCRICAO',
    'CONTROLE_AUTOMATICO',
    'NOME_GRUPO',
    'ID_GRUPO_SELO',
    'PAGINA_ACRESCE',
    'SITUACAO',
    'NUMERO',
    'TIPO_CARTORIO',
    'DESCRICAO_COMPLETA',
    'ESTOQUE_MINIMO',
    'SISTEMA_ID',
    'SELO_USUARIO',
    'SUBTIPO_ATO',
    'TIPO_ATO'
  ];
end;

function TSeloGrupoDao.GetTableName: string;
begin
  Result := 'G_SELO_GRUPO';
end;

end.
