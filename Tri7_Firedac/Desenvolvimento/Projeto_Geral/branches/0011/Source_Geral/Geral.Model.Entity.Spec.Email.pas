unit Geral.Model.Entity.Spec.Email;

interface

uses
  Geral.Model.Entity.Spec.List;

type
  IEmail = interface;

  IEnvioEmail = interface
    ['{E90951DC-138E-4824-8ADC-B0E3886C14EB}']

    procedure Enviar(
      const vpEmail: IEmail);
  end;

  IEmailItem = interface;

  IEmail = interface
    ['{8654154D-775F-4A55-A4DB-4DDE065A63E7}']

    function Remetente: IEmailItem;
    function De: IEmailItem;
    function Para: IList<IEmailItem>;
    function Cc: IList<IEmailItem>;
    function Cco: IList<IEmailItem>;
    function ResponderA: IEmailItem;
    function Assunto: string;
    function Corpo: string;
    function Anexo: IList<string>;
    function ConfirmacaoLeitura: IEmailItem;
    function TypeHtml: Boolean;
  end;

  IEmailItem = interface
    ['{91730249-0E3A-4673-BE57-8E4EA29ACC63}']

    function Nome: string;
    function Email: string;
  end;

implementation

end.
