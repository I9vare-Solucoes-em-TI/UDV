unit ConfiguracaoFundo;

interface

uses
  FundoTipo, EmolumentoImpl;

type
   TConfiguracaoFundo = class
   private
     FConfiguracaoFundoId: Integer;
     FFundoTipo: TFundoTipo;
     FEmolumento: TEmolumento;

      procedure SetConfiguracaoFundoId(const Value: Integer);
      procedure SetFundoTipo(const Value: TFundoTipo);
      procedure SetEmolumento(const Value: TEmolumento);
   public
     constructor Create(
      const vpConfiguracaoFundoId: Integer;
      const vpFundoTipo: TFundoTipo;
      const vpEmolumento: TEmolumento);

     property ConfiguracaoFundoId: Integer read FConfiguracaoFundoId write SetConfiguracaoFundoId;
     property FundoTipo: TFundoTipo read FFundoTipo write SetFundoTipo;
     property Emolumento: TEmolumento read FEmolumento write SetEmolumento;
   end;
implementation

{ TConfiguracaoFundo }

constructor TConfiguracaoFundo.Create(
  const vpConfiguracaoFundoId: Integer;
  const vpFundoTipo: TFundoTipo;
  const vpEmolumento: TEmolumento);
begin
  inherited Create;

  ConfiguracaoFundoId := vpConfiguracaoFundoId;
  FundoTipo := vpFundoTipo;
  Emolumento := vpEmolumento;
end;

procedure TConfiguracaoFundo.SetConfiguracaoFundoId(const Value: Integer);
begin
  FConfiguracaoFundoId := Value;
end;

procedure TConfiguracaoFundo.SetFundoTipo(const Value: TFundoTipo);
begin
  FFundoTipo := Value;
end;

procedure TConfiguracaoFundo.SetEmolumento(const Value: TEmolumento);
begin
  FEmolumento := Value;
end;

end.
