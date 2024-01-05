unit Geral.Model.Entity.Spec.List.Transform;

interface

uses
  Geral.Model.Entity.Spec.List;

type
  TFunc<T, TResult> = reference to function(const vpValue: T): TResult;

  IListTransform<T, TResult> = interface
    ['{BAB22B59-D8EA-4FB3-9D8D-3CB73C037555}']

    function Transform(
      const vpValue: TFunc<T, TResult>): IList<TResult>;
  end;

implementation

end.
