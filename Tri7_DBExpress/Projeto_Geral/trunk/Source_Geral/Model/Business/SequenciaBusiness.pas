unit SequenciaBusiness;

interface

uses
  SequenciaDAO,
  Sequencia;

type
  TSequenciaBusiness = class
  private
    FSequenciaDAO: ISequenciaDAO;

    function GetSequenciaDAO: ISequenciaDAO;

    procedure SetSequenciaDAO(
      const Value: ISequenciaDAO);
  public
    property SequenciaDAO: ISequenciaDAO read GetSequenciaDAO
      write SetSequenciaDAO;

    function GerarSequencia(
      const vpTabela: string): ISequencia;
  end;

implementation

uses
  SequenciaImpl;

{ TSequenciaBusiness }

function TSequenciaBusiness.GerarSequencia(
  const vpTabela: string): ISequencia;
{$REGION 'Variáveis'}
var
  viSequencia: ISequencia;
{$ENDREGION}
begin
  Result := nil;

  viSequencia := SequenciaDAO.GetByID(vpTabela);
  if Assigned(viSequencia) then
  begin
    viSequencia.Sequencia := Succ(viSequencia.Sequencia);
    SequenciaDAO.Alterar(viSequencia);
    Result := viSequencia;
    Exit;
  end;

  viSequencia := TSequencia.Create;
  with viSequencia do
  begin
    Tabela := vpTabela;
    Sequencia := 1;
  end;
  SequenciaDAO.Inserir(viSequencia);
  Result := viSequencia;
end;

function TSequenciaBusiness.GetSequenciaDAO: ISequenciaDAO;
begin
  Result := FSequenciaDAO;
end;

procedure TSequenciaBusiness.SetSequenciaDAO(
  const Value: ISequenciaDAO);
begin
  FSequenciaDAO := Value;
end;

end.
