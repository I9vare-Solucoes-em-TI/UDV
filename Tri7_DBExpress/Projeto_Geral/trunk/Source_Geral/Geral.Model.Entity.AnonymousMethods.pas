unit Geral.Model.Entity.AnonymousMethods;

interface

type
  TAction = reference to procedure;

  TAction<T> = reference to procedure(
    const vpArg: T);

  TFuncion<TResult> = reference to function: TResult;

  TFunction<T, TResult> = reference to function(
    const vpArg: T): TResult;

  TFunction<T1, T2, TResult> = reference to function(
    const vpArg1: T1;
    const vpArg2: T2): TResult;

  TFunction<T1, T2, T3, TResult> = reference to function(
    const vpArg1: T1;
    const vpArg2: T2;
    const vpArg3: T3): TResult;

  TFunction<T1, T2, T3, T4, TResult> = reference to function(
    const vpArg1: T1;
    const vpArg2: T2;
    const vpArg3: T3;
    const vpArg4: T4): TResult;

implementation

end.
