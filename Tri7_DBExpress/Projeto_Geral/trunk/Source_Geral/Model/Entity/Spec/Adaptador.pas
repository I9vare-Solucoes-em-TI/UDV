unit Adaptador;

interface

type
  IAdaptador<A, B> = interface
    ['{CAE25EB9-5C82-4681-90FA-5169486A7C9F}']

    procedure Adaptar(
      const vpOrigem: A;
      const vpDestino: B); overload;

    procedure Adaptar(
      const vpOrigem: B;
      const vpDestino: A); overload;
  end;

implementation

end.
