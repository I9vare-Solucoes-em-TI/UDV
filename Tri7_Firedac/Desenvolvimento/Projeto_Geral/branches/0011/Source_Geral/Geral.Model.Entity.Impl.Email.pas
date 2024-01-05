unit Geral.Model.Entity.Impl.Email;

interface

uses
  Geral.Model.Entity.Spec.Email,
  Geral.Model.Entity.Spec.List;

type
  TEmail = class(TInterfacedObject, IEmail)
  private
    FRemetente: IEmailItem;
    FDe: IEmailItem;
    FPara: IList<IEmailItem>;
    FCc: IList<IEmailItem>;
    FCco: IList<IEmailItem>;
    FResponderA: IEmailItem;
    FAssunto: string;
    FCorpo: string;
    FAnexo: IList<string>;
    FConfirmacaoLeitura: IEmailItem;
    FTypeHtml: Boolean;

    constructor Create(
      const vpRemetente: IEmailItem;
      const vpDe: IEmailItem;
      const vpPara: IList<IEmailItem>;
      const vpCc: IList<IEmailItem>;
      const vpCco: IList<IEmailItem>;
      const vpResponderA: IEmailItem;
      const vpAssunto: string;
      const vpCorpo: string;
      const vpAnexo: IList<string>;
      const vpConfirmacaoLeitura: IEmailItem;
      const vpTypeHtml: Boolean); reintroduce;
  public
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

    class function New(
      const vpRemetente: IEmailItem;
      const vpDe: IEmailItem;
      const vpPara: IList<IEmailItem>;
      const vpCc: IList<IEmailItem>;
      const vpCco: IList<IEmailItem>;
      const vpResponderA: IEmailItem;
      const vpAssunto: string;
      const vpCorpo: string;
      const vpAnexo: IList<string>;
      const vpConfirmacaoLeitura: IEmailItem;
      const vpTypeHtml: Boolean = False): IEmail;
  end;

  TEmailItem = class(TInterfacedObject, IEmailItem)
  private
    FNome: string;
    FEmail: string;

    constructor Create(
      const vpNome: string;
      const vpEmail: string); reintroduce;
  public
    function Nome: string;
    function Email: string;

    class function New(
      const vpNome: string;
      const vpEmail: string): IEmailItem;
  end;

implementation

{ TEmail }

function TEmail.Anexo: IList<string>;
begin
  Result := FAnexo;
end;

function TEmail.Assunto: string;
begin
  Result := FAssunto;
end;

function TEmail.Cc: IList<IEmailItem>;
begin
  Result := FCc;
end;

function TEmail.Cco: IList<IEmailItem>;
begin
  Result := FCco;
end;

function TEmail.ConfirmacaoLeitura: IEmailItem;
begin
  Result := FConfirmacaoLeitura;
end;

function TEmail.TypeHtml: Boolean;
begin
  Result := FTypeHtml;
end;

function TEmail.Corpo: string;
begin
  Result := FCorpo;
end;

constructor TEmail.Create(
  const vpRemetente: IEmailItem;
  const vpDe: IEmailItem;
  const vpPara: IList<IEmailItem>;
  const vpCc: IList<IEmailItem>;
  const vpCco: IList<IEmailItem>;
  const vpResponderA: IEmailItem;
  const vpAssunto: string;
  const vpCorpo: string;
  const vpAnexo: IList<string>;
  const vpConfirmacaoLeitura: IEmailItem;
  const vpTypeHtml: Boolean);
begin
  inherited Create;
  FRemetente := vpRemetente;
  FDe := vpDe;
  FPara := vpPara;
  FCc := vpCc;
  FCco := vpCco;
  FResponderA := vpResponderA;
  FAssunto := vpAssunto;
  FCorpo := vpCorpo;
  FAnexo := vpAnexo;
  FConfirmacaoLeitura := vpConfirmacaoLeitura;
  FTypeHtml := vpTypeHtml;
end;

function TEmail.De: IEmailItem;
begin
  Result := FDe;
end;

class function TEmail.New(
  const vpRemetente: IEmailItem;
  const vpDe: IEmailItem;
  const vpPara: IList<IEmailItem>;
  const vpCc: IList<IEmailItem>;
  const vpCco: IList<IEmailItem>;
  const vpResponderA: IEmailItem;
  const vpAssunto: string;
  const vpCorpo: string;
  const vpAnexo: IList<string>;
  const vpConfirmacaoLeitura: IEmailItem;
  const vpTypeHtml: Boolean = False): IEmail;
begin
  Result := Create(
    vpRemetente,
    vpDe,
    vpPara,
    vpCc,
    vpCco,
    vpResponderA,
    vpAssunto,
    vpCorpo,
    vpAnexo,
    vpConfirmacaoLeitura,
    vpTypeHtml);
end;

function TEmail.Para: IList<IEmailItem>;
begin
  Result := FPara;
end;

function TEmail.Remetente: IEmailItem;
begin
  Result := FRemetente;
end;

function TEmail.ResponderA: IEmailItem;
begin
  Result := FResponderA;
end;

{ TEmailItem }

constructor TEmailItem.Create(
  const vpNome: string;
  const vpEmail: string);
begin
  inherited Create;
  FNome := vpNome;
  FEmail := vpEmail;
end;

function TEmailItem.Email: string;
begin
  Result := FEmail;
end;

class function TEmailItem.New(
  const vpNome: string;
  const vpEmail: string): IEmailItem;
begin
  Result := Create(
    vpNome,
    vpEmail);
end;

function TEmailItem.Nome: string;
begin
  Result := FNome;
end;

end.
