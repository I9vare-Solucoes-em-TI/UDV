{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Exception.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Exception;

interface

type
  TException = class
  public
    class procedure RaiseExceptionModelo(
      const vpAcao: string;
      const vpMensagem: string;
      const vpInstrucao: string = '');
  end;

implementation

uses
  System.SysUtils;

{ TException }

class procedure TException.RaiseExceptionModelo(
  const vpAcao: string;
  const vpMensagem: string;
  const vpInstrucao: string = '');
var
  viMensagem: string;
begin
  viMensagem :=
    'Erro ao ' + vpAcao + '.' + sLineBreak +
    'Motivo: ' + sLineBreak +
    vpMensagem;

  if not vpInstrucao.IsEmpty then
    viMensagem := viMensagem + sLineBreak + vpInstrucao;

  raise Exception.Create(viMensagem);
end;

end.
