unit Conversor;

interface

type
  IConversor<A, B> = interface
    ['{C75BE1A6-9D8D-44EB-BACC-C466F7DF3EFB}']

    function Converter(
      const vpValue: A): B;
  end;

implementation

end.
