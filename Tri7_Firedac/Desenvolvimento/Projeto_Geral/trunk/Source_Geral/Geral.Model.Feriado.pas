unit Geral.Model.Feriado;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TFeriado = class
  private
    FFeriadoId: Integer;
    FDescricao: String;
    FData: TDateTime;
    FSituacao: String;
    FTipo: String;
    FDia: Integer;
    FMes: Integer;
    FAno: Integer;
    FDiaFim: Integer;
    FMesFim: Integer;
    FAnoFim: Integer;
  public
    property FeriadoId: Integer read FFeriadoId write FFeriadoId;
    property Descricao: String read FDescricao write FDescricao;
    property Data: TDateTime read FData write FData;
    property Situacao: String read FSituacao write FSituacao;
    property Tipo: String read FTipo write FTipo;
    property Dia: Integer read FDia write FDia;
    property Mes: Integer read FMes write FMes;
    property Ano: Integer read FAno write FAno;
    property DiaFim: Integer read FDiaFim write FDiaFim;
    property MesFim: Integer read FMesFim write FMesFim;
    property AnoFim: Integer read FAnoFim write FAnoFim;
  end;

  TFeriadoDAO = class(TDAO<TFeriado>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TFeriado; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TFeriado); override;
  end;

  TFeriadoBusiness = class
  public
    class function VerificarFeriado(
      const vpData: TDateTime): Boolean;
  end;

implementation

uses
  I9Query,
  Controles,
  System.SysUtils;

{ TFeriado }

function TFeriadoDAO.CreateObject(
  const vpDataSet: TDataSet): TFeriado;
begin
  Result := TFeriado.Create;
  Result.FeriadoId := vpDataSet.FieldByName('FERIADO_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.Data := vpDataSet.FieldByName('DATA').AsDateTime;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.Tipo := vpDataSet.FieldByName('TIPO').AsString;
  Result.Dia := vpDataSet.FieldByName('DIA').AsInteger;
  Result.Mes := vpDataSet.FieldByName('MES').AsInteger;
  Result.Ano := vpDataSet.FieldByName('ANO').AsInteger;
  Result.DiaFim := vpDataSet.FieldByName('DIA_FIM').AsInteger;
  Result.MesFim := vpDataSet.FieldByName('MES_FIM').AsInteger;
  Result.AnoFim := vpDataSet.FieldByName('ANO_FIM').AsInteger;
end;

procedure TFeriadoDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TFeriado);
begin
  inherited;
  vpParams.ParamByName('FERIADO_ID').AsIntegers[vpIndex] := vpValue.FeriadoId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('DATA').AsDateTimes[vpIndex] := vpValue.Data;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;
  vpParams.ParamByName('TIPO').AsStrings[vpIndex] := vpValue.Tipo;
  vpParams.ParamByName('DIA').AsIntegers[vpIndex] := vpValue.Dia;
  vpParams.ParamByName('MES').AsIntegers[vpIndex] := vpValue.Mes;
  vpParams.ParamByName('ANO').AsIntegers[vpIndex] := vpValue.Ano;
  vpParams.ParamByName('DIA_FIM').AsIntegers[vpIndex] := vpValue.DiaFim;
  vpParams.ParamByName('MES_FIM').AsIntegers[vpIndex] := vpValue.MesFim;
  vpParams.ParamByName('ANO_FIM').AsIntegers[vpIndex] := vpValue.AnoFim;
end;

function TFeriadoDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TFeriadoDAO.GetTableName: string;
begin
  Result := 'G_FERIADO';
end;

{ TFeriadoBusiness }

class function TFeriadoBusiness.VerificarFeriado(
  const vpData: TDateTime): Boolean;
var
  viQuery: TI9Query;
begin
  Result := False;
  viQuery := nil;
  try
    try
      viQuery := TI9Query.Create(nil);
      viQuery.Connection := dtmControles.DB;
      viQuery.SQL.Text :=
      '  SELECT FIRST 1 1 '+
      '    FROM G_FERIADO G_FR '+
      '   WHERE 1 = 1 '+
      '     AND SITUACAO = ''A'' '+
      '     AND ( '+
      // Data informada esta entre data inicial e final com ano informado
      '         :P_DATA '+
      '         BETWEEN CAST(CAST(G_FR.ANO AS INT) || ''-'' || LPAD(CAST(G_FR.MES AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA AS INT) AS DATE) '+
      '             AND CAST(CAST(G_FR.ANO_FIM AS INT) || ''-'' || LPAD(CAST(G_FR.MES_FIM AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA_FIM AS INT) AS DATE) '+
      '         ) OR ( '+
      // Data informada é igual a data inicial informada com ano informado
      '         :P_DATA = CAST(CAST(G_FR.ANO AS INT) || ''-'' || LPAD(CAST(G_FR.MES AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA AS INT) AS DATE) '+
      '         ) OR ( '+
      // Data informada esta entre data inicial e final sem o ano informado
      '         :P_DATA '+
      '         BETWEEN CAST(EXTRACT(YEAR FROM CAST(:P_DATA AS DATE)) || ''-'' || LPAD(CAST(G_FR.MES AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA AS INT) AS DATE) '+
      '             AND CAST(EXTRACT(YEAR FROM CAST(:P_DATA AS DATE)) || ''-'' || LPAD(CAST(G_FR.MES_FIM AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA_FIM AS INT) AS DATE) '+
      '         AND G_FR.ANO IS NULL) OR ( '+
      // Data informada é igual a data inicial informada sem o ano informado
      '         :P_DATA = CAST(EXTRACT(YEAR FROM CAST(:P_DATA AS DATE)) || ''-'' || LPAD(CAST(G_FR.MES AS INT), 2, 0) || ''-'' || CAST(G_FR.DIA AS INT) AS DATE) '+
      '         AND G_FR.ANO IS NULL ) ';

      viQuery.ParamByName('P_DATA').AsDateTime := vpData;
      viQuery.Open;

      Result := not viQuery.IsEmpty;

    except
      raise;
    end;

  finally
    FreeAndNil(viQuery);
  end;
end;

end.
