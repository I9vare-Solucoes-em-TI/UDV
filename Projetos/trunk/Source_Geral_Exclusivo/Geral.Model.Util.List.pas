unit Geral.Model.Util.List;

interface

uses
  System.Generics.Collections;

type
  TMapFunction<T1, T2> = reference to function(const vpElemento: T1): T2;
  TPredicate<T> = reference to function(const vpElemento: T): Boolean;

  TListUtil = class
  public
    class function Paginar<T>(
      const vpLista: TList<T>;
      const vpLimite: Integer): TList<TList<T>>;

    class function Mapear<T1, T2>(
      const vpLista: TList<T1>;
      const vpMapFunction: TMapFunction<T1, T2>): TList<T2>;

    class function Filtrar<T>(
      const vpLista: TList<T>;
      const vpCondicao: TPredicate<T>): TList<T>;
  end;

implementation

uses
  System.SysUtils;

{ TListUtil }

class function TListUtil.Filtrar<T>(
  const vpLista: TList<T>;
  const vpCondicao: TPredicate<T>): TList<T>;
var
  viElemento: T;
  viAdicionarElemento: Boolean;
begin
  Result := nil;
  try
    Result := TList<T>.Create;

    for viElemento in vpLista do
    begin
      viAdicionarElemento := vpCondicao(viElemento);
      if not viAdicionarElemento then
        Continue;

      Result.Add(viElemento);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TListUtil.Mapear<T1, T2>(
  const vpLista: TList<T1>;
  const vpMapFunction: TMapFunction<T1, T2>): TList<T2>;
var
  viElemento: T1;
  viValor: T2;
begin
  Result := nil;
  try
    Result := TList<T2>.Create;

    for viElemento in vpLista do
    begin
      viValor := vpMapFunction(viElemento);
      Result.Add(viValor);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TListUtil.Paginar<T>(
  const vpLista: TList<T>;
  const vpLimite: Integer): TList<TList<T>>;
var
  viValor: T;
  viListaPaginada: TList<T>;
begin
  Result := nil;
  try
    Result := TObjectList<TList<T>>.Create;

    if vpLista.Count = 0 then
      Exit;

    viListaPaginada := TList<T>.Create;
    Result.Add(viListaPaginada);

    for viValor in vpLista do
    begin
      viListaPaginada.Add(viValor);

      if viListaPaginada.Count = vpLimite then
      begin
        viListaPaginada := TList<T>.Create;
        Result.Add(viListaPaginada);
      end;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

end.
