unit Geral.Model.SeloTipoCartorio;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TSeloTipoCartorio = class
  strict private
    FSeloTipoCartorioId: Integer;
    FDescricao: string;
    FSituacao: string;
    FSistemaId: Integer;
  public
    property SeloTipoCartorioId: Integer read FSeloTipoCartorioId write FSeloTipoCartorioId;
    property Descricao: string read FDescricao write FDescricao;
    property Situacao: string read FSituacao write FSituacao;
    property SistemaId: Integer read FSistemaId write FSistemaId;
  end;

  TSeloTipoCartorioDAO = class(TDAO<TSeloTipoCartorio>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TSeloTipoCartorio; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TSeloTipoCartorio); override;
  end;

  TSeloTipoCartorioBusiness = class
  public
    function Buscar(
      const vpSeloTipoCartorioId: Integer): TSeloTipoCartorio;
  end;

implementation

uses
  Controles,
  System.SysUtils;

{ TSeloTipoCartorioDAO }

function TSeloTipoCartorioDAO.CreateObject(
  const vpDataSet: TDataSet): TSeloTipoCartorio;
begin
  Result := TSeloTipoCartorio.Create;
  Result.SeloTipoCartorioId := vpDataSet.FieldByName('SELO_TIPO_CARTORIO_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.SistemaId  := vpDataSet.FieldByName('SISTEMA_ID').AsInteger;
end;

procedure TSeloTipoCartorioDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TSeloTipoCartorio);
begin
  inherited;
  vpParams.ParamByName('SELO_TIPO_CARTORIO_ID').AsIntegers[vpIndex] := vpValue.SeloTipoCartorioId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
end;

function TSeloTipoCartorioDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TSeloTipoCartorioDAO.GetTableName: string;
begin
  Result := 'G_SELO_TIPO_CARTORIO';
end;

{ TSeloTipoCartorioBusiness }

function TSeloTipoCartorioBusiness.Buscar(
  const vpSeloTipoCartorioId: Integer): TSeloTipoCartorio;
var
  viSeloTipoCartorio: TSeloTipoCartorio;
  viSeloTipoCartorioDAO: TSeloTipoCartorioDAO;
begin
  Result := nil;
  viSeloTipoCartorio := nil;
  viSeloTipoCartorioDAO := nil;
  try
    try
      viSeloTipoCartorioDAO := TSeloTipoCartorioDAO.Create(dtmControles.DB);
      Result := viSeloTipoCartorioDAO.GetByID(vpSeloTipoCartorioId);
    except
      Result.Free;
      raise;
    end;

  finally
    FreeAndNil(viSeloTipoCartorio);
    FreeAndNil(viSeloTipoCartorioDAO);
  end;
end;

end.
