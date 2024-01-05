unit ApresentanteCPF_CNPJ_VazioException;

interface

uses
  System.SysUtils;

type
  EApresentanteCPF_CNPJ_VazioException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EApresentanteCPF_CNPJ_VazioException }

constructor EApresentanteCPF_CNPJ_VazioException.Create;
begin
  inherited Create('Por favor, informe o CPF/CNPJ do Apresentante.');
end;

end.
