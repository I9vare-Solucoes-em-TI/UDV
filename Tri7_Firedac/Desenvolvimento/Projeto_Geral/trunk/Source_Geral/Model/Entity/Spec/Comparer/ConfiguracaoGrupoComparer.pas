unit ConfiguracaoGrupoComparer;

interface

uses
  System.Generics.Defaults,
  ConfiguracaoGrupo,
  CampoOrdenacaoList;

type
  TConfiguracaoGrupoComparer = class(TComparer<IConfiguracaoGrupo>,
    IComparer<IConfiguracaoGrupo>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_DESCRICAO: string = 'Descricao';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IConfiguracaoGrupo;
      const Right: IConfiguracaoGrupo): Integer; override;
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

{ TConfiguracaoGrupoComparer }

function TConfiguracaoGrupoComparer.Compare(
  const Left: IConfiguracaoGrupo;
  const Right: IConfiguracaoGrupo): Integer;
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

constructor TConfiguracaoGrupoComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

end.
