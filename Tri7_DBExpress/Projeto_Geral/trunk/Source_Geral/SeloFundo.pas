unit SeloFundo;

interface

uses
  FundoTipo,
  System.Generics.Collections;

type
  TSeloFundo = class
  private
    FSeloFundoID: Integer;
    FSeloLivroID: Integer;
    FFundoTipo: TFundoTipo;
    FValorEmolumento: Currency;
    FValorCalculado: Currency;
    FItemServico: Integer;
    FTabela: string;

    function GetValor: Currency;

    procedure SetSeloFundoID(
      const Value: Integer);

    procedure SetSeloLivroID(
      const Value: Integer);

    procedure SetFundoTipo(
      const Value: TFundoTipo);

    procedure SetValorEmolumento(
      const Value: Currency);

    procedure SetValorCalculado(
      const Value: Currency);

    procedure SetItemServico(
      const Value: Integer);

    procedure SetTabela(
      const Value: string);
  public
    constructor Create(
      const vpFundoTipo: TFundoTipo); overload;

    constructor Create(
      const vpFundoTipo: TFundoTipo;
      const vpValorEmolumento: Currency); overload;

    constructor Create(
      const vpSeloFundoID: Integer;
      const vpSeloLivroID: Integer;
      const vpFundoTipo: TFundoTipo;
      const vpValorCalculado: Currency); overload;

    constructor Create(
      const vpSeloFundoID: Integer;
      const vpFundoTipo: TFundoTipo;
      const vpValorCalculado: Currency;
      const vpItemServico: Integer;
      const vpTabela: string); overload;

    property SeloFundoID: Integer read FSeloFundoID write SetSeloFundoID;
    property SeloLivroID: Integer read FSeloLivroID write SetSeloLivroID;
    property FundoTipo: TFundoTipo read FFundoTipo write SetFundoTipo;

    property ValorEmolumento: Currency read FValorEmolumento
      write SetValorEmolumento;

    property Valor: Currency read GetValor;

    property ValorCalculado: Currency read FValorCalculado
      write SetValorCalculado;

    property ItemServico: Integer read FItemServico write SetItemServico;
    property Tabela: string read FTabela write SetTabela;
  end;

  TSeloFundos = class(TObjectList<TSeloFundo>)
  private
    function GetValor: Currency;
    function GetValorCalculado: Currency;
  public
    property Valor: Currency read GetValor;
    property ValorCalculado: Currency read GetValorCalculado;

    function Get(
      const vpFundoTipo: TFundoTipo): TSeloFundos;
  end;

  TCalculadoraSeloFundos = class
  private
    class function Get(
      const vpValorEmolumento: Currency;
      const vpFundoTipos: TFundoTipos): TSeloFundos; overload;

    class function Get(
      const vpValoresEmolumento: TArray<Currency>;
      const vpFundoTipos: TFundoTipos): TSeloFundos; overload;
  public
    class function Get(
      const vpValoresEmolumento: TList<Currency>;
      const vpFundoTipos: TFundoTipos): TSeloFundos; overload;
  end;

implementation

uses
  Rotinas,
  Controles;

{ TSeloFundo }

constructor TSeloFundo.Create(
  const vpFundoTipo: TFundoTipo;
  const vpValorEmolumento: Currency);
begin
  Create(vpFundoTipo);

  FundoTipo := vpFundoTipo;
  ValorEmolumento := vpValorEmolumento;
end;

constructor TSeloFundo.Create(
  const vpSeloFundoID: Integer;
  const vpSeloLivroID: Integer;
  const vpFundoTipo: TFundoTipo;
  const vpValorCalculado: Currency);
begin
  Create(vpFundoTipo, 0);

  SeloFundoID := vpSeloFundoID;
  SeloLivroID := vpSeloLivroID;
  ValorCalculado := vpValorCalculado;
end;

constructor TSeloFundo.Create(
  const vpFundoTipo: TFundoTipo);
begin
  inherited Create;

  FundoTipo := vpFundoTipo;
end;

function TSeloFundo.GetValor: Currency;
{$REGION 'Variáveis'}
var
  viValores: TListCurrency;
{$ENDREGION}
begin
  viValores := RetornarListCurrency(ValorEmolumento);
  try
    Result := GetPorcentagem(
      dtmControles.MetodoArredondamento,
      viValores,
      FundoTipo.Percentual);
  finally
    viValores.Free;
  end;
end;

procedure TSeloFundo.SetFundoTipo(
  const Value: TFundoTipo);
begin
  FFundoTipo := Value;
end;

procedure TSeloFundo.SetSeloFundoID(
  const Value: Integer);
begin
  FSeloFundoID := Value;
end;

procedure TSeloFundo.SetSeloLivroID(
  const Value: Integer);
begin
  FSeloLivroID := Value;
end;

procedure TSeloFundo.SetValorCalculado(
  const Value: Currency);
begin
  FValorCalculado := Value;
end;

procedure TSeloFundo.SetValorEmolumento(
  const Value: Currency);
begin
  FValorEmolumento := Value;
end;

procedure TSeloFundo.SetItemServico(
  const Value: Integer);
begin
  FItemServico := Value;
end;

procedure TSeloFundo.SetTabela(
  const Value: string);
begin
  FTabela := Value;
end;

constructor TSeloFundo.Create(
  const vpSeloFundoID: Integer;
  const vpFundoTipo: TFundoTipo;
  const vpValorCalculado: Currency;
  const vpItemServico: Integer;
  const vpTabela: string);
begin
  Create(
    vpSeloFundoID,
    0,
    vpFundoTipo,
    vpValorCalculado);

  SeloFundoID := vpSeloFundoID;
  ValorCalculado := vpValorCalculado;
  ItemServico := vpItemServico;
  Tabela := vpTabela;
end;

{ TSeloFundos }

function TSeloFundos.Get(
  const vpFundoTipo: TFundoTipo): TSeloFundos;
var
  viSeloFundo: TSeloFundo;
begin
  Result := TSeloFundos.Create(False);

  for viSeloFundo in Self do
    if viSeloFundo.FundoTipo.Equals(vpFundoTipo) then
      Result.Add(viSeloFundo);
end;

function TSeloFundos.GetValor: Currency;
var
  viSeloFundo: TSeloFundo;
begin
  Result := 0;

  for viSeloFundo in Self do
    Result := Result + viSeloFundo.Valor;
end;

function TSeloFundos.GetValorCalculado: Currency;
var
  viSeloFundo: TSeloFundo;
begin
  Result := 0;

  for viSeloFundo in Self do
    Result := Result + viSeloFundo.ValorCalculado;
end;

{ TCalculadoraSeloFundos }

class function TCalculadoraSeloFundos.Get(
  const vpValorEmolumento: Currency;
  const vpFundoTipos: TFundoTipos): TSeloFundos;
{$REGION 'Variáveis'}
var
  viFundoTipo: TFundoTipo;
{$ENDREGION}
begin
  Result := TSeloFundos.Create(False);

  for viFundoTipo in vpFundoTipos do
    if viFundoTipo.Situacao then
      Result.Add(TSeloFundo.Create(viFundoTipo, vpValorEmolumento));
end;

class function TCalculadoraSeloFundos.Get(
  const vpValoresEmolumento: TArray<Currency>;
  const vpFundoTipos: TFundoTipos): TSeloFundos;
{$REGION 'Variáveis'}
var
  viValorEmolumento: Currency;
  viSeloFundos: TSeloFundos;
{$ENDREGION}
begin
  Result := TSeloFundos.Create;

  for viValorEmolumento in vpValoresEmolumento do
  begin
    viSeloFundos := Get(viValorEmolumento, vpFundoTipos);
    try
      Result.AddRange(viSeloFundos);
    finally
      viSeloFundos.Free;
    end;
  end;
end;

class function TCalculadoraSeloFundos.Get(
  const vpValoresEmolumento: TList<Currency>;
  const vpFundoTipos: TFundoTipos): TSeloFundos;
{$REGION 'Variáveis'}
var
  viArrayCurrency: TArray<Currency>;
{$ENDREGION}
begin
  viArrayCurrency := vpValoresEmolumento.ToArray;
  try
    Result := Get(viArrayCurrency, vpFundoTipos);
  finally
    Finalize(viArrayCurrency);
  end;
end;

end.
