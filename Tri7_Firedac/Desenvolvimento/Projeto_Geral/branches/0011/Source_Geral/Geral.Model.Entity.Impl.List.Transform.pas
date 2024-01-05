unit Geral.Model.Entity.Impl.List.Transform;

interface

uses
  Geral.Model.Entity.Spec.List.Transform,
  Geral.Model.Entity.Spec.List;

type
  TListTransform<T, TResult> = class(TInterfacedObject,
    IListTransform<T, TResult>)
  private
    FSource: IList<T>;
    FDest: IList<TResult>;
  public
    constructor Create(
      const vpSource: IList<T>;
      const vpDest: IList<TResult>); reintroduce;

    function Transform(
      const vpValue: TFunc<T, TResult>): IList<TResult>;

    class function New(
      const vpSource: IList<T>;
      const vpDest: IList<TResult>): IListTransform<T, TResult>;
  end;

  TListTransformUniqueValues<T, TResult> = class(TInterfacedObject,
    IListTransform<T, TResult>)
  private
    FSource: IList<T>;
    FDest: IList<TResult>;
    FComparer: TEqualityComparison<TResult>;
  public
    constructor Create(
      const vpSource: IList<T>;
      const vpDest: IList<TResult>;
      const vpComparer: TEqualityComparison<TResult>); reintroduce;

    function Transform(
      const vpValue: TFunc<T, TResult>): IList<TResult>;

    class function New(
      const vpSource: IList<T>;
      const vpDest: IList<TResult>;
      const vpComparer: TEqualityComparison<TResult>):
      IListTransform<T, TResult>; overload;

    class function New(
      const vpSource: IList<T>;
      const vpDest: IList<TResult>): IListTransform<T, TResult>; overload;
  end;

implementation

{ TListTransform<T, TResult> }

constructor TListTransform<T, TResult>.Create(
  const vpSource: IList<T>;
  const vpDest: IList<TResult>);
begin
  inherited Create;
  FSource := vpSource;
  FDest := vpDest;
end;

class function TListTransform<T, TResult>.New(
  const vpSource: IList<T>;
  const vpDest: IList<TResult>): IListTransform<T, TResult>;
begin
  Result := Create(
    vpSource,
    vpDest);
end;

function TListTransform<T, TResult>.Transform(
  const vpValue: TFunc<T, TResult>): IList<TResult>;
{$REGION 'Variáveis'}
var
  viResult: IList<TResult>;
  viFunc: TFunc<T, TResult>;
{$ENDREGION}
begin
  viResult := FDest;
  viFunc := vpValue;

  FSource.ForEach(
    procedure(const vpValue: T)
    begin
      viResult.Add(
        viFunc(
          vpValue));
    end);

  Result := viResult;
end;

{ TListTransformUniqueValues<T, TResult> }

constructor TListTransformUniqueValues<T, TResult>.Create(
  const vpSource: IList<T>;
  const vpDest: IList<TResult>;
  const vpComparer: TEqualityComparison<TResult>);
begin
  inherited Create;
  FSource := vpSource;
  FDest := vpDest;
  FComparer := vpComparer;
end;

class function TListTransformUniqueValues<T, TResult>.New(
  const vpSource: IList<T>;
  const vpDest: IList<TResult>): IListTransform<T, TResult>;
begin
  Result := New(
    vpSource,
    vpDest,
    nil);
end;

class function TListTransformUniqueValues<T, TResult>.New(
  const vpSource: IList<T>;
  const vpDest: IList<TResult>;
  const vpComparer: TEqualityComparison<TResult>):
  IListTransform<T, TResult>;
begin
  Result := Create(
    vpSource,
    vpDest,
    vpComparer);
end;

function TListTransformUniqueValues<T, TResult>.Transform(
  const vpValue: TFunc<T, TResult>): IList<TResult>;
{$REGION 'Variáveis'}
var
  viResult: IList<TResult>;
  viFunc: TFunc<T, TResult>;
{$ENDREGION}
begin
  viResult := FDest;
  viFunc := vpValue;

  FSource.ForEach(
    procedure(const vpValue: T)
    {$REGION 'Variáveis'}
    var
      viFuncResult: TResult;
      B: Boolean;
    {$ENDREGION}
    begin
      viFuncResult := viFunc(
        vpValue);

      if Assigned(
        FComparer) then
        B := viResult.Contains(
          viFuncResult,
          FComparer)
      else
        B := viResult.Contains(
          viFuncResult);

      if not B then
        viResult.Add(
          viFuncResult);
    end);

  Result := viResult;
end;

end.
