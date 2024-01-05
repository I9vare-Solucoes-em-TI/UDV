unit EmolumentoPeriodoComparer;

interface

uses
  System.Generics.Defaults,
  EmolumentoPeriodo,
  CampoOrdenacaoList;

type
  TEmolumentoPeriodoComparer = class(TComparer<IEmolumentoPeriodo>,
    IComparer<IEmolumentoPeriodo>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_DATA_INICIAL: string = 'DataInicial';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IEmolumentoPeriodo;
      const Right: IEmolumentoPeriodo): Integer; override;
  end;

implementation

uses
  IntegerList,
  CampoOrdenacao,
  System.Math,
  System.Types,
  System.SysUtils,
  BooleanHelper,
  TipoOrdenacaoHelper,
  System.DateUtils;

{ TEmolumentoPeriodoComparer }

function TEmolumentoPeriodoComparer.Compare(
  const Left: IEmolumentoPeriodo;
  const Right: IEmolumentoPeriodo): Integer;
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

      if viCampoOrdenacao.Nome.Equals(CG_DATA_INICIAL) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(CompareDate(Left.DataInicial, Right.DataInicial))
        else
          viIntegerList.Add(CompareDate(Right.DataInicial, Left.DataInicial));
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TEmolumentoPeriodoComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

end.
