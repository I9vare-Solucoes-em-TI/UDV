unit EstadoCadastroHelper;

interface

uses
  EstadoCadastro;

type
  TEstadoCadastroHelper = record helper for TEstadoCadastro
  private
    const CI_INCLUINDO: string = 'Incluindo';
    const CI_ALTERANDO: string = 'Alterando';
    const CI_VISUALIZANDO: string = 'Visualizando';

    function Equals(
      const vpValue: TEstadoCadastro): Boolean;
  public
    function IsVisualizando: Boolean;
    function ToString: string;
    function IsNotVisualizando: Boolean;
    function IsIncluindo: Boolean;
    function IsAlterando: Boolean;
    function IsNenhum: Boolean;
    function IsNotNenhum: Boolean;
  end;

implementation

uses
  System.StrUtils;

{ TEstadoCadastroHelper }

function TEstadoCadastroHelper.Equals(
  const vpValue: TEstadoCadastro): Boolean;
begin
  Result := Self = vpValue;
end;

function TEstadoCadastroHelper.IsAlterando: Boolean;
begin
  Result := Equals(ecAlterando);
end;

function TEstadoCadastroHelper.IsIncluindo: Boolean;
begin
  Result := Equals(ecIncluindo);
end;

function TEstadoCadastroHelper.IsNenhum: Boolean;
begin
  Result := Equals(ecNenhum);
end;

function TEstadoCadastroHelper.IsNotNenhum: Boolean;
begin
  Result := not IsNenhum;
end;

function TEstadoCadastroHelper.IsNotVisualizando: Boolean;
begin
  Result := not IsVisualizando;
end;

function TEstadoCadastroHelper.IsVisualizando: Boolean;
begin
  Result := Equals(ecVisualizando);
end;

function TEstadoCadastroHelper.ToString: string;
begin
  Result := IfThen(IsIncluindo, CI_INCLUINDO,
    IfThen(IsAlterando, CI_ALTERANDO,
    IfThen(IsVisualizando, CI_VISUALIZANDO)));
end;

end.
