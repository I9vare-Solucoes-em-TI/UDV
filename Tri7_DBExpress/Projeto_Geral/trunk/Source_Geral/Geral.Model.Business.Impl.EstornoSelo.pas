unit Geral.Model.Business.Impl.EstornoSelo;

interface

uses
  Geral.Model.Business.Spec.EstornoSelo,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.SeloLivro;

type
  TOpcaoEstornoSelo = (oesCancelarSeloExportado, oesManterVinculoSeloCancelado);

  TEstornoSelo = class(TInterfacedObject, IEstornoSelo)
  private
    FSeloLivroList: IList<ISeloLivro>;
    FOpcaoEstornoSeloList: IList<TOpcaoEstornoSelo>;
  public
    constructor Create(
      const vpSeloLivroList: IList<ISeloLivro>;
      const vpOpcaoEstornoSeloList: IList<TOpcaoEstornoSelo>); reintroduce;

    function Estornar: IMaybe<IList<ISeloLivro>>;

    class function New(
      const vpSeloLivroList: IList<ISeloLivro>;
      const vpOpcaoEstornoSeloList: IList<TOpcaoEstornoSelo>): IEstornoSelo;
  end;

implementation

uses
  SeloSelecionado,
  System.SysUtils,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.List.Transform,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.Entity.Impl.SeloLivro;

{ TEstornoSelo }

constructor TEstornoSelo.Create(
  const vpSeloLivroList: IList<ISeloLivro>;
  const vpOpcaoEstornoSeloList: IList<TOpcaoEstornoSelo>);
begin
  inherited Create;
  FSeloLivroList := vpSeloLivroList;
  FOpcaoEstornoSeloList := vpOpcaoEstornoSeloList;
end;

function TEstornoSelo.Estornar: IMaybe<IList<ISeloLivro>>;
begin
  if frmSeloSelecionado.LiberarSeloVinculado(
    string.Empty,
    string.Empty,
    FSeloLivroList.First.ID,
    FOpcaoEstornoSeloList.Contains(
      TOpcaoEstornoSelo.oesCancelarSeloExportado),
    FOpcaoEstornoSeloList.Contains(
      TOpcaoEstornoSelo.oesManterVinculoSeloCancelado)) then
    Exit(
      TSome<IList<ISeloLivro>>.New(
        TListTransform<ISeloLivro, ISeloLivro>.New(
          FSeloLivroList,
          TListFactory<ISeloLivro>.New.GetInstance)
        .Transform(
          function(
            const vpValue: ISeloLivro): ISeloLivro
          begin
            Result := TSeloLivro.New(
              vpValue.ID,
              vpValue.Numero,
              vpValue.Sigla,
              vpValue.Validado)
          end)));

  Result := TNone<IList<ISeloLivro>>.New;
end;

class function TEstornoSelo.New(
  const vpSeloLivroList: IList<ISeloLivro>;
  const vpOpcaoEstornoSeloList: IList<TOpcaoEstornoSelo>): IEstornoSelo;
begin
  Result := Create(
    vpSeloLivroList,
    vpOpcaoEstornoSeloList);
end;

end.
