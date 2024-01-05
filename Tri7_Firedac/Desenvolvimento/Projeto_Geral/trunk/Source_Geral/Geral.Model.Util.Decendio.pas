unit Geral.Model.Util.Decendio;

interface

uses
  Geral.Model.Util.Data,
  System.Generics.Collections;

type
  TSequencia = (
    tsPrimeiro,
    tsSegundo,
    tsTerceiro
  );

  TDecendio = class
  private
    FIntervaloData: TIntervaloData;
    FMes: Integer;
    FAno: Integer;
    FSequencia: TSequencia;
  public
    property IntervaloData: TIntervaloData read FIntervaloData write FIntervaloData;
    property Mes: Integer read FMes write FMes;
    property Ano: Integer read FAno write FAno;
    property Sequencia: TSequencia read FSequencia write FSequencia;

    destructor Destroy; override;
  end;

  TDecendioUtil = class
  private
    const CL_DIA_INICIAL_DECENDIO_1 = 1;
    const CL_DIA_FINAL_DECENDIO_1 = 10;

    const CL_DIA_INICIAL_DECENDIO_2 = 11;
    const CL_DIA_FINAL_DECENDIO_2 = 20;

    const CL_DIA_INICIAL_DECENDIO_3 = 21;
  public
    class function BuscarDecendio(
      const vpDataBase: TDateTime): TDecendio;

    class function BuscarDecendioAnterior(
      const vpDecendio: TDecendio): TDecendio;

    class function ListarDecendioAnterior(
      const vpDecendio: TDecendio;
      const vpQuantidade: Integer): TObjectList<TDecendio>;

    class function BuscarIntervaloData(
      const vpListaDecendio: TObjectList<TDecendio>): TIntervaloData;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

{ TDecendioUtil }

class function TDecendioUtil.BuscarDecendio(
  const vpDataBase: TDateTime): TDecendio;
var
  viAno: Word;
  viMes: Word;
  viDia: Word;
  viDiaInicial: Integer;
  viDiaFinal: Integer;
  viSequencia: TSequencia;
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
  viIntervaloData: TIntervaloData;
begin
  Result := nil;
  try
    if vpDataBase <= 0 then
      Exit;

    DecodeDate(
      vpDataBase,
      viAno,
      viMes,
      viDia);

    case viDia of
      CL_DIA_INICIAL_DECENDIO_1..CL_DIA_FINAL_DECENDIO_1:
      begin
        viDiaInicial := CL_DIA_INICIAL_DECENDIO_1;
        viDiaFinal := CL_DIA_FINAL_DECENDIO_1;
        viSequencia := TSequencia.tsPrimeiro;
      end;

      CL_DIA_INICIAL_DECENDIO_2..CL_DIA_FINAL_DECENDIO_2:
      begin
        viDiaInicial := CL_DIA_INICIAL_DECENDIO_2;
        viDiaFinal := CL_DIA_FINAL_DECENDIO_2;
        viSequencia := TSequencia.tsSegundo;
      end;
    else
      viDiaInicial := CL_DIA_INICIAL_DECENDIO_3;

      viDiaFinal := DaysInAMonth(
        viAno,
        viMes);

      viSequencia := TSequencia.tsTerceiro;
    end;

    viDataInicial := RecodeDay(
      vpDataBase,
      viDiaInicial);

    viDataInicial := StartOfTheDay(viDataInicial);

    viDataFinal := RecodeDay(
      vpDataBase,
      viDiaFinal);

    viDataFinal := EndOfTheDay(viDataFinal);

    viIntervaloData := TIntervaloData.Create;
    viIntervaloData.DataInicial := viDataInicial;
    viIntervaloData.DataFinal := viDataFinal;

    Result := TDecendio.Create;
    Result.IntervaloData := viIntervaloData;
    Result.Mes := viMes;
    Result.Ano := viAno;
    Result.Sequencia := viSequencia;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDecendioUtil.BuscarDecendioAnterior(
  const vpDecendio: TDecendio): TDecendio;
var
  viMes: Integer;
  viAno: Integer;
  viDiaInicial: Integer;
  viDataBase: TDateTime;
begin
  Result := nil;
  try
    if not Assigned(vpDecendio) then
      Exit;

    viMes := vpDecendio.Mes;
    viAno := vpDecendio.Ano;

    case vpDecendio.Sequencia of
      TSequencia.tsPrimeiro:
      begin
        Dec(viMes);
        if viMes <= 0 then
        begin
          viMes := MonthDecember;
          Dec(viAno);
        end;

        viDiaInicial := CL_DIA_INICIAL_DECENDIO_3;
      end;

      TSequencia.tsSegundo: viDiaInicial := CL_DIA_INICIAL_DECENDIO_1;
    else
      viDiaInicial := CL_DIA_INICIAL_DECENDIO_2;
    end;

    viDataBase := EncodeDate(
      viAno,
      viMes,
      viDiaInicial);

    Result := BuscarDecendio(viDataBase);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDecendioUtil.BuscarIntervaloData(
  const vpListaDecendio: TObjectList<TDecendio>): TIntervaloData;
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  Result := nil;
  try
    if not Assigned(vpListaDecendio) then
      Exit;

    if vpListaDecendio.Count <= 0 then
      Exit;

    viDataInicial := vpListaDecendio.First.IntervaloData.DataInicial;
    viDataFinal := vpListaDecendio.Last.IntervaloData.DataFinal;

    Result := TIntervaloData.Create;
    Result.DataInicial := viDataInicial;
    Result.DataFinal := viDataFinal;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDecendioUtil.ListarDecendioAnterior(
  const vpDecendio: TDecendio;
  const vpQuantidade: Integer): TObjectList<TDecendio>;
var
  viDecendio: TDecendio;
  viDecendioAnterior: TDecendio;
  I: Integer;
begin
  Result := nil;
  try
    if not Assigned(vpDecendio) then
      Exit;

    if vpQuantidade <= 0 then
      Exit;

    Result := TObjectList<TDecendio>.Create;
    viDecendio := vpDecendio;

    for I := 1 to vpQuantidade do
    begin
      viDecendioAnterior := BuscarDecendioAnterior(viDecendio);

      Result.Insert(
        0,
        viDecendioAnterior);

      viDecendio := viDecendioAnterior;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

{ TDecendio }

destructor TDecendio.Destroy;
begin
  FreeAndNil(FIntervaloData);
  inherited;
end;

end.
