unit Geral.Model.Entity.Impl.SelecaoPaginas;

interface

uses
  Geral.Model.Entity.Spec.SelecaoPaginas,
  Geral.Model.Entity.Spec.List;

type
  TTodas = class(TInterfacedObject, ISelecaoPaginas)
  private
    FQuantidadeTotalPaginas: Integer;
    FPaginas: IList<Integer>;
  public
    constructor Create(
      const vpQuantidadeTotalPaginas: Integer); reintroduce;

    function Paginas: IList<Integer>;

    class function New(
      const vpQuantidadeTotalPaginas: Integer): ISelecaoPaginas;
  end;

  TPaginas = class(TInterfacedObject, ISelecaoPaginas)
  private
    FTextoPaginas: string;
    FPaginas: IList<Integer>;
  public
    constructor Create(
      const vpTextoPaginas: string); reintroduce;

    function Paginas: IList<Integer>;

    class function New(
      const vpTextoPaginas: string): ISelecaoPaginas;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Factory.List,
  System.SysUtils;

{ TTodas }

constructor TTodas.Create(
  const vpQuantidadeTotalPaginas: Integer);
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  inherited Create;
  FQuantidadeTotalPaginas := vpQuantidadeTotalPaginas;
  FPaginas := TListFactory<Integer>.New.GetInstance;

  for I := 1 to vpQuantidadeTotalPaginas do
    FPaginas.Add(
      I);
end;

class function TTodas.New(
  const vpQuantidadeTotalPaginas: Integer): ISelecaoPaginas;
begin
  Result := Self.Create(
    vpQuantidadeTotalPaginas);
end;

function TTodas.Paginas: IList<Integer>;
begin
  Result := FPaginas;
end;

{ TPaginas }

constructor TPaginas.Create(
  const vpTextoPaginas: string);
{$REGION 'Variáveis'}
var
  viPaginas: TArray<string>;
  viPagina: string;
  viPaginaInicial: Integer;
  viPaginaFinal: Integer;
  I: Integer;
{$ENDREGION}
begin
  inherited Create;
  FTextoPaginas := vpTextoPaginas;
  FPaginas := TListFactory<Integer>.New.GetInstance;

  viPaginas := FTextoPaginas.Split(
    [',']);

  for viPagina in viPaginas do
    if viPagina.Contains(
      '-') then
    begin
      I := viPagina.IndexOf(
        '-');

      viPaginaInicial := viPagina
      .Substring(
        0,
        I)
      .Trim
      .ToInteger;

      viPaginaFinal := viPagina
      .Substring(
        Succ(
          I))
      .Trim
      .ToInteger;

      for I := viPaginaInicial to viPaginaFinal do
        FPaginas.Add(
          I);
    end
    else
      FPaginas.Add(
        viPagina.Trim.ToInteger);
end;

class function TPaginas.New(
  const vpTextoPaginas: string): ISelecaoPaginas;
begin
  Result := Self.Create(
    vpTextoPaginas);
end;

function TPaginas.Paginas: IList<Integer>;
begin
  Result := FPaginas;
end;

end.
