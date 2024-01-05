unit ConsultaCNPJException;

interface

uses
  System.SysUtils;

type
  EConsultaCNPJException = class(Exception)
  public
    constructor Create(
      const Msg: string); reintroduce;
  end;

implementation

uses
  StringUtils;

{ EConsultaCNPJException }

constructor EConsultaCNPJException.Create(
  const Msg: string);
begin
  inherited Create('Não foi possível consultar o CNPJ devido ao motivo ' +
    'abaixo: ' + TStringUtils.GetQuebraLinhaDupla + Msg);
end;

end.
