unit InterfaceDataSnap;

interface

type
   IInterfaceDataSnap = interface
    ['{80E808A6-A34F-4165-880E-D8701A4EAE94}']
    function ProtestoProcessarFechamento(vpValor: WideString; vpTipo: WideString): Boolean;stdcall;
    function ProtestoProcessarAntecipacao(vpValor: WideString; vpTipo: WideString): Boolean;stdcall;
    function ProtestoLiberarFinanceiroID(vpOperacao: WideString; vpFinanceiroID: Integer): Boolean;stdcall;
    function IntimacaoProcessarFechamento(vpValor: WideString; vpTipo: WideString): Boolean;stdcall;
    function IntimacaoProcessarAntecipacao(vpValor: WideString; vpTipo: WideString): Boolean;stdcall;
    function IntimacaoLiberarFinanceiroID(vpOperacao: WideString; vpFinanceiroID: Integer): Boolean;stdcall;
  end;

implementation

end.
