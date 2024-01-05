unit RegraEnvioSeloComparer;

interface

uses
  System.Generics.Defaults,
  RegraEnvioSelo,
  CampoOrdenacaoList;

type
  TRegraEnvioSeloComparer = class(TComparer<IRegraEnvioSelo>,
    IComparer<IRegraEnvioSelo>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_REGRA_ENVIO_SELO_ID: string = 'RegraEnvioSeloID';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IRegraEnvioSelo;
      const Right: IRegraEnvioSelo): Integer; override;
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

{ TRegraEnvioSeloComparer }

function TRegraEnvioSeloComparer.Compare(
  const Left: IRegraEnvioSelo;
  const Right: IRegraEnvioSelo): Integer;
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

      if viCampoOrdenacao.Nome.Equals(CG_REGRA_ENVIO_SELO_ID) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(CompareValue(
            Left.RegraEnvioSeloID, Right.RegraEnvioSeloID))
        else
          viIntegerList.Add(CompareValue(
            Right.RegraEnvioSeloID, Left.RegraEnvioSeloID))
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TRegraEnvioSeloComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

end.
