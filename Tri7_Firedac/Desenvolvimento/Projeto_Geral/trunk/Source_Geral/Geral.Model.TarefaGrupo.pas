unit Geral.Model.TarefaGrupo;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TTarefaGrupo = class
  private
    FTarefaGrupoId: Integer;
    FDescricao: string;
    FSituacao: String;
    FServentia: Integer;
  public
    property TarefaGrupoId: Integer read FTarefaGrupoId write FTarefaGrupoId;
    property Descricao: string read FDescricao write FDescricao;
    property Situacao: String read FSituacao write FSituacao;
    property Serventia: Integer read FServentia write FServentia;
  end;

  TTarefaGrupoDAO = class(TDAO<TTarefaGrupo>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TTarefaGrupo; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TTarefaGrupo); override;
  end;

  TTarefaGrupoBusiness = class
  public
    class function Consultar(
      const vpSistemaId: Integer): TList<TTarefaGrupo>;
  end;

implementation

uses
  Controles,
  System.SysUtils;

{ TTarefaGrupoDAO }

function TTarefaGrupoDAO.CreateObject(
  const vpDataSet: TDataSet): TTarefaGrupo;
begin
  Result := TTarefaGrupo.Create;
  Result.TarefaGrupoId := vpDataSet.FieldByName('TAREFA_GRUPO_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.Serventia := vpDataSet.FieldByName('SERVENTIA').AsInteger;
end;

procedure TTarefaGrupoDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TTarefaGrupo);
begin
  inherited;
  vpParams.ParamByName('TAREFA_GRUPO_ID').AsIntegers[vpIndex] := vpValue.TarefaGrupoId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('SERVENTIA').AsIntegers[vpIndex] := vpValue.Serventia;
end;

function TTarefaGrupoDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TTarefaGrupoDAO.GetTableName: string;
begin
  Result := 'G_TAREFA_GRUPO';
end;

{ TTarefaGrupoBusiness }

class function TTarefaGrupoBusiness.Consultar(
  const vpSistemaId: Integer): TList<TTarefaGrupo>;
var
  viTarefaGrupoDAO: TTarefaGrupoDAO;
begin
  viTarefaGrupoDAO := nil;
  try
    viTarefaGrupoDAO := TTarefaGrupoDAO.Create(
      dtmControles.DB);

    Result := viTarefaGrupoDAO.GetList(
      -1,
      0,
      'SERVENTIA = :P_SERVENTIA',
      [vpSistemaId],
      'TAREFA_GRUPO_ID');
  finally
    FreeAndNil(viTarefaGrupoDAO);
  end;
end;

end.

