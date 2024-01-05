unit ConfiguracaoComparer;

interface

uses
  System.Generics.Defaults,
  Configuracao,
  CampoOrdenacaoList;

type
  TConfiguracaoComparer = class(TComparer<IConfiguracao>,
    IComparer<IConfiguracao>)
  private
    FCampoOrdenacaoList: TCampoOrdenacaoList;
  public
    {$REGION 'Constantes'}
    const CG_CONFIGURACAO_GRUPO_DESCRICAO: string =
      'ConfiguracaoGrupo.Descricao';

    const CG_SECAO: string = 'Secao';
    const CG_NOME: string = 'Nome';
    {$ENDREGION}

    constructor Create(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList); reintroduce;

    function Compare(
      const Left: IConfiguracao;
      const Right: IConfiguracao): Integer; override;
  end;

implementation

uses
  IntegerList,
  CampoOrdenacao,
  System.SysUtils,
  System.Math,
  System.Types,
  BooleanHelper,
  TipoOrdenacaoHelper,
  ConfiguracaoGrupo,
  ConfiguracaoGrupoComparer,
  CampoOrdenacaoImpl;

{ TConfiguracaoComparer }

function TConfiguracaoComparer.Compare(
  const Left: IConfiguracao;
  const Right: IConfiguracao): Integer;
{$REGION 'Variáveis'}
var
  viIntegerList: TIntegerList;
  I: Integer;
  viCampoOrdenacao: ICampoOrdenacao;
  viComparerConfiguracaoGrupo: IComparer<IConfiguracaoGrupo>;
  viCampoOrdenacaoListConfiguracaoGrupo: TCampoOrdenacaoList;
  viCampoOrdenacaoConfiguracaoGrupo: ICampoOrdenacao;
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

      if viCampoOrdenacao.Nome.Equals(CG_CONFIGURACAO_GRUPO_DESCRICAO) then
      begin
        viCampoOrdenacaoListConfiguracaoGrupo := TCampoOrdenacaoList.Create;
        try
          viCampoOrdenacaoConfiguracaoGrupo := TCampoOrdenacao.Create(
            TConfiguracaoGrupoComparer.CG_DESCRICAO, viCampoOrdenacao.Tipo);

          viCampoOrdenacaoListConfiguracaoGrupo.Add(
            viCampoOrdenacaoConfiguracaoGrupo);

          viComparerConfiguracaoGrupo := TConfiguracaoGrupoComparer.Create(
            viCampoOrdenacaoListConfiguracaoGrupo);

          viIntegerList.Add(viComparerConfiguracaoGrupo.Compare(
            Left.ConfiguracaoGrupo, Right.ConfiguracaoGrupo));

          Continue;
        finally
          FreeAndNil(viCampoOrdenacaoListConfiguracaoGrupo);
        end;
      end;

      if viCampoOrdenacao.Nome.Equals(CG_SECAO) then
      begin
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(string.Compare(Left.Secao, Right.Secao))
        else
          viIntegerList.Add(string.Compare(Right.Secao, Left.Secao));

        Continue;
      end;

      if viCampoOrdenacao.Nome.Equals(CG_NOME) then
        if viCampoOrdenacao.Tipo.IsAscendente then
          viIntegerList.Add(string.Compare(Left.Nome, Right.Nome))
        else
          viIntegerList.Add(string.Compare(Right.Nome, Left.Nome));
    end;

    viIntegerList.TrimExcess;
    Result := viIntegerList.Sum;
  finally
    FreeAndNil(viIntegerList);
  end;
end;

constructor TConfiguracaoComparer.Create(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList);
begin
  inherited Create;
  FCampoOrdenacaoList := vpCampoOrdenacaoList;
end;

end.
