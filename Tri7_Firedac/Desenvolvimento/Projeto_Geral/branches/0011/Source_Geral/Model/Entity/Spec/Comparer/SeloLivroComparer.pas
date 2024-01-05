unit SeloLivroComparer;

interface

uses
  System.Generics.Defaults,
  SeloLivro,
  CampoOrdenacaoList;

type
  TSeloLivroComparer = class(TComparer<ISeloLivro>, IComparer<ISeloLivro>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_DATA: string = 'Data';
    const CG_NUMERO_AGRUPADOR: string = 'NumeroAgrupador';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: ISeloLivro;
      const Right: ISeloLivro): Integer; override;
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

{ TSeloLivroComparer }

function TSeloLivroComparer.Compare(
  const Left: ISeloLivro;
  const Right: ISeloLivro): Integer;
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

      if viCampoOrdenacao.Nome.Equals(CG_DATA) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(CompareDateTime(Left.Data, Right.Data))
        else
          viIntegerList.Add(CompareDateTime(Right.Data, Left.Data));

      if viCampoOrdenacao.Nome.Equals(CG_NUMERO_AGRUPADOR) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(string.Compare(
            Left.NumeroAgrupador, Right.NumeroAgrupador))
        else
          viIntegerList.Add(string.Compare(
            Right.NumeroAgrupador, Left.NumeroAgrupador));
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TSeloLivroComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

end.
