unit MunicipioComparer;

interface

uses
  System.Generics.Defaults,
  Municipio,
  CampoOrdenacaoList;

type
  TMunicipioComparer = class(TComparer<IMunicipio>, IComparer<IMunicipio>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_MUNICIPIO: string = 'Municipio';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IMunicipio;
      const Right: IMunicipio): Integer; override;

    class function New(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
        IComparer<IMunicipio>; static;
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

{ TMunicipioComparer }

function TMunicipioComparer.Compare(
  const Left: IMunicipio;
  const Right: IMunicipio): Integer;
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

      if viCampoOrdenacao.Nome.Equals(CG_MUNICIPIO) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(string.Compare(Left.Municipio, Right.Municipio))
        else
          viIntegerList.Add(string.Compare(Right.Municipio, Left.Municipio));
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TMunicipioComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

class function TMunicipioComparer.New(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList): IComparer<IMunicipio>;
begin
  Result := TMunicipioComparer.Create(vpCampoOrdenacaoList);
end;

end.
