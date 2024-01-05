unit EmolumentoComparer;

interface

uses
  System.Generics.Defaults,
  Emolumento,
  CampoOrdenacaoList;

type
  TEmolumentoComparer = class(TComparer<IEmolumento>,
    IComparer<IEmolumento>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_DESCRICAO: string = 'Descricao';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IEmolumento;
      const Right: IEmolumento): Integer; override;

    class function New(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
      IComparer<IEmolumento>; static;
  end;

implementation

uses
  IntegerList,
  CampoOrdenacao,
  System.Math,
  System.Types,
  System.SysUtils,
  BooleanHelper,
  TipoOrdenacaoHelper;

{ TEmolumentoComparer }

function TEmolumentoComparer.Compare(
  const Left: IEmolumento;
  const Right: IEmolumento): Integer;
{$REGION 'Variáveis'}
var
  viIntegerList: TIntegerList;
  I: Integer;
  viCampoOrdenacao: ICampoOrdenacao;
{$ENDREGION}
begin
  viIntegerList := TIntegerList.Create;

  try
    for I := ZeroValue to Pred(FCampoOrdenacaoList.Count) do
    begin
      if (CompareValue(I, ZeroValue) = GreaterThanValue) and
        (InRange(Pred(I), ZeroValue, Pred(viIntegerList.Count)).&Not or
        (CompareValue(viIntegerList[Pred(I)],
          ZeroValue) = EqualsValue).&Not) then
        Continue;

      viCampoOrdenacao := FCampoOrdenacaoList[I];

      if viCampoOrdenacao.Nome.Equals(CG_DESCRICAO) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(string.Compare(Left.Descricao, Right.Descricao))
        else
          viIntegerList.Add(string.Compare(Right.Descricao, Left.Descricao));
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TEmolumentoComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

class function TEmolumentoComparer.New(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList): IComparer<IEmolumento>;
begin
  Result := TEmolumentoComparer.Create(vpCampoOrdenacaoList);
end;

end.
