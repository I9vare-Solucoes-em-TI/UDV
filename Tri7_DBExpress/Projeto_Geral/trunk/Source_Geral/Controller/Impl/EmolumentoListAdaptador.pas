unit EmolumentoListAdaptador;

interface

uses
  Adaptador,
  EmolumentoList,
  cxDropDownEdit;

type
  TEmolumentoListAdaptador = class(TInterfacedObject,
    IAdaptador<TEmolumentoList, TcxComboBox>)
  public
    procedure Adaptar(
      const vpOrigem: TEmolumentoList;
      const vpDestino: TcxComboBox); overload;

    procedure Adaptar(
      const vpOrigem: TcxComboBox;
      const vpDestino: TEmolumentoList); overload; virtual; abstract;
  end;

implementation

uses
  Emolumento,
  EmolumentoImpl;

{ TEmolumentoListAdaptador }

procedure TEmolumentoListAdaptador.Adaptar(
  const vpOrigem: TEmolumentoList;
  const vpDestino: TcxComboBox);
{$REGION 'Variáveis'}
var
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  for viEmolumento in vpOrigem do
    vpDestino.Properties.Items.AddObject(viEmolumento.Descricao,
      TEmolumento(viEmolumento));
end;

end.
