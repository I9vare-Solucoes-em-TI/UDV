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
    FCobrarParte: Boolean;
    FValorDeducaoCalculado: Currency;

    function GetValor: Currency;
    function GetValorDeducao: Currency;

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
      const vpValorCalculado: Currency;
      const vpValorDeducaoCalculado: Currency); overload;

    constructor Create(
      const vpSeloFundoID: Integer;
      const vpFundoTipo: TFundoTipo;
      const vpValorCalculado: Currency;
      const vpItemServico: Integer;
      const vpTabela: string;
      const vpValorDeducaoCalculado: Currency); overload;

    function BuscarValorCalculado: Currency;

    property SeloFundoID: Integer read FSeloFundoID write SetSeloFundoID;
    property SeloLivroID: Integer read FSeloLivroID write SetSeloLivroID;
    property FundoTipo: TFundoTipo read FFundoTipo write SetFundoTipo;

    property ValorEmolumento: Currency read FValorEmolumento
      write SetValorEmolumento;

    property Valor: Currency read GetValor;
    property ValorDeducao: Currency read GetValorDeducao;

    property ValorCalculado: Currency read FValorCalculado
      write SetValorCalculado;

    property ItemServico: Integer read FItemServico write SetItemServico;
    property Tabela: string read FTabela write SetTabela;
    property CobrarParte: Boolean read FCobrarParte write FCobrarParte;
    property ValorDeducaoCalculado: Currency read FValorDeducaoCalculado write FValorDeducaoCalculado;
  end;

  TSeloFundos = class(TObjectList<TSeloFundo>)
  private
    function GetValor: Currency;
    function GetValorCalculado: Currency;
    function GetValorDeducao: Currency;
    function GetValorDeducaoCalculado: Currency;
  public
    property Valor: Currency read GetValor;
    property ValorCalculado: Currency read GetValorCalculado;
    property ValorDeducao: Currency read GetValorDeducao;
    property ValorDeducaoCalculado: Currency read GetValorDeducaoCalculado;

    function Get(
      const vpFundoTipo: TFundoTipo): TSeloFundos;
  end;

  TCalculadoraSeloFundos = class
  private
    class function UtilizarFundoTipo(
      const vpFundoTipo: TFundoTipo;
      const vpDataAto: TDateTime): Boolean;

    class function Get(
      const vpValorEmolumento: Currency;
      const vpFundoTipos: TFundoTipos;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): TSeloFundos; overload;

    class function Get(
      const vpValoresEmolumento: TArray<Currency>;
      const vpFundoTipos: TFundoTipos;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): TSeloFundos; overload;

    class function BuscarCobrarParte(
      const vpUf: string;
      const vpSistemaId: Integer): Boolean;
  public
    class function Get(
      const vpValoresEmolumento: TList<Currency>;
      const vpFundoTipos: TFundoTipos;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): TSeloFundos; overload;
  end;

implementation

uses
  Rotinas,
  Controles,
  System.SysUtils,
  Geral.Model.Sistema;

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
  const vpValorCalculado: Currency;
  const vpValorDeducaoCalculado: Currency);
begin
  Create(
    vpFundoTipo,
    0);

  SeloFundoID := vpSeloFundoID;
  SeloLivroID := vpSeloLivroID;
  ValorCalculado := vpValorCalculado;
  ValorDeducaoCalculado := vpValorDeducaoCalculado;
end;

constructor TSeloFundo.Create(
  const vpFundoTipo: TFundoTipo);
begin
  inherited Create;

  FundoTipo := vpFundoTipo;
end;

function TSeloFundo.GetValor: Currency;
var
  viValores: TListCurrency;
begin
  Result := 0;
  if not CobrarParte then
    Exit;

  viValores := RetornarListCurrency(ValorEmolumento);
  try
    Result := GetPorcentagem(
      dtmControles.MetodoArredondamento,
      viValores,
      FundoTipo.Percentual);
  finally
    FreeAndNil(viValores);
  end;
end;

function TSeloFundo.GetValorDeducao: Currency;
var
  viValores: TListCurrency;
begin
  Result := 0;
  if CobrarParte then
    Exit;

  viValores := RetornarListCurrency(ValorEmolumento);
  try
    Result := GetPorcentagem(
      dtmControles.MetodoArredondamento,
      viValores,
      FundoTipo.Percentual);
  finally
    FreeAndNil(viValores);
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

function TSeloFundo.BuscarValorCalculado: Currency;
var
  viValorCalculado: Currency;
  viValorDeducaoCalculado: Currency;
begin
  Result := 0;

  viValorCalculado := ValorCalculado;
  viValorDeducaoCalculado := ValorDeducaoCalculado;

  if (viValorCalculado > 0) and
    (viValorDeducaoCalculado > 0) then
    raise Exception.CreateFmt(
      'Valores do fundo %s do selo %d atribuídos',
      [FundoTipo.Sigla,
      SeloLivroID]);

  Result := viValorCalculado + viValorDeducaoCalculado;
end;

constructor TSeloFundo.Create(
  const vpSeloFundoID: Integer;
  const vpFundoTipo: TFundoTipo;
  const vpValorCalculado: Currency;
  const vpItemServico: Integer;
  const vpTabela: string;
  const vpValorDeducaoCalculado: Currency);
begin
  Create(
    vpSeloFundoID,
    0,
    vpFundoTipo,
    vpValorCalculado,
    vpValorDeducaoCalculado);

  SeloFundoID := vpSeloFundoID;
  ValorCalculado := vpValorCalculado;
  ItemServico := vpItemServico;
  Tabela := vpTabela;
  ValorDeducaoCalculado := vpValorDeducaoCalculado;
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

function TSeloFundos.GetValorDeducao: Currency;
var
  viSeloFundo: TSeloFundo;
begin
  Result := 0;

  for viSeloFundo in Self do
    Result := Result + viSeloFundo.ValorDeducao;
end;

function TSeloFundos.GetValorDeducaoCalculado: Currency;
var
  viSeloFundo: TSeloFundo;
begin
  Result := 0;

  for viSeloFundo in Self do
    Result := Result + viSeloFundo.ValorDeducaoCalculado;
end;

{ TCalculadoraSeloFundos }

class function TCalculadoraSeloFundos.Get(
  const vpValorEmolumento: Currency;
  const vpFundoTipos: TFundoTipos;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): TSeloFundos;
var
  viFundoTipo: TFundoTipo;
  viUtilizarFundoTipo: Boolean;
  viSeloFundo: TSeloFundo;
  viCobrarParte: Boolean;
begin
  Result := TSeloFundos.Create(False);

  viCobrarParte := BuscarCobrarParte(
    vpUf,
    vpSistemaId);

  for viFundoTipo in vpFundoTipos do
  begin
    viUtilizarFundoTipo := UtilizarFundoTipo(
      viFundoTipo,
      vpDataAto);

    if not viUtilizarFundoTipo then
      Continue;

    viSeloFundo := TSeloFundo.Create(
      viFundoTipo,
      vpValorEmolumento);

    viSeloFundo.CobrarParte := viCobrarParte;
    Result.Add(viSeloFundo);
  end;
end;

class function TCalculadoraSeloFundos.Get(
  const vpValoresEmolumento: TArray<Currency>;
  const vpFundoTipos: TFundoTipos;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): TSeloFundos;
var
  viValorEmolumento: Currency;
  viSeloFundos: TSeloFundos;
begin
  Result := TSeloFundos.Create;

  for viValorEmolumento in vpValoresEmolumento do
  begin
    viSeloFundos := Get(
      viValorEmolumento,
      vpFundoTipos,
      vpDataAto,
      vpUf,
      vpSistemaId);

    try
      Result.AddRange(viSeloFundos);
    finally
      FreeAndNil(viSeloFundos);
    end;
  end;
end;

class function TCalculadoraSeloFundos.BuscarCobrarParte(
  const vpUf: string;
  const vpSistemaId: Integer): Boolean;
var
  viPara: Boolean;
begin
  Result := True;

  if vpUf.IsEmpty then
    raise Exception.Create('UF vazia');

  if vpSistemaId <= 0 then
    raise Exception.Create('Sistema ID não informado');

  viPara := SameText(
    vpUf,
    'PA');

  if not viPara then
    Exit;

  if vpSistemaId = CI_COD_SISTEMA_PROTESTO then
    Exit;

  Result := False;
end;

class function TCalculadoraSeloFundos.Get(
  const vpValoresEmolumento: TList<Currency>;
  const vpFundoTipos: TFundoTipos;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): TSeloFundos;
var
  viArrayCurrency: TArray<Currency>;
begin
  viArrayCurrency := vpValoresEmolumento.ToArray;
  try
    Result := Get(
      viArrayCurrency,
      vpFundoTipos,
      vpDataAto,
      vpUf,
      vpSistemaId);
  finally
    Finalize(viArrayCurrency);
  end;
end;

class function TCalculadoraSeloFundos.UtilizarFundoTipo(
  const vpFundoTipo: TFundoTipo;
  const vpDataAto: TDateTime): Boolean;
{$REGION 'Variáveis'}
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
{$ENDREGION}
begin
  Result := False;
  viDataInicial := vpFundoTipo.DataInicial;
  viDataFinal := vpFundoTipo.DataFinal;

  if (vpDataAto > 0) and
    ((viDataInicial > 0) or
    (viDataFinal > 0)) then
  begin
    if viDataInicial > 0 then
      if vpDataAto < viDataInicial then
        Exit;

    if viDataFinal > 0 then
      if vpDataAto > viDataFinal then
        Exit;
  end
  else
    if not vpFundoTipo.Situacao then
      Exit;

  Result := True;
end;

end.
