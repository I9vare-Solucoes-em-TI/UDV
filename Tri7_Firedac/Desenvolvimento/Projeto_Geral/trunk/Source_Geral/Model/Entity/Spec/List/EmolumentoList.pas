unit EmolumentoList;

interface

uses
  System.Generics.Collections,
  Emolumento,
  Sistema;

type
  TEmolumentoList = class(TList<IEmolumento>)
  private
    function IndexOfByDescricaoESistema(
      const vpDescricao: string;
      const vpSistema: ISistema): Integer;

    function IndexOfByDescricao(
      const vpDescricao: string): Integer;
  public
    function GetByDescricaoESistema(
      const vpDescricao: string;
      const vpSistema: ISistema): IEmolumento;

    function GetByDescricao(
      const vpDescricao: string): IEmolumento;

    function ContainsByDescricaoESistema(
      const vpDescricao: string;
      const vpSistema: ISistema): Boolean;

    function ContainsByDescricao(
      const vpDescricao: string): Boolean;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper;

{ TEmolumentoList }

function TEmolumentoList.ContainsByDescricao(
  const vpDescricao: string): Boolean;
begin
  Result := Assigned(GetByDescricao(vpDescricao));
end;

function TEmolumentoList.ContainsByDescricaoESistema(
  const vpDescricao: string;
  const vpSistema: ISistema): Boolean;
begin
  Result := Assigned(GetByDescricaoESistema(vpDescricao, vpSistema));
end;

function TEmolumentoList.GetByDescricao(
  const vpDescricao: string): IEmolumento;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDescricao(vpDescricao);
  if I > -1 then
    Result := Self[I];
end;

function TEmolumentoList.GetByDescricaoESistema(
  const vpDescricao: string;
  const vpSistema: ISistema): IEmolumento;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDescricaoESistema(vpDescricao, vpSistema);
  if I > -1 then
    Result := Self[I];
end;

function TEmolumentoList.IndexOfByDescricao(
  const vpDescricao: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := -1;

  for I := 0 to Pred(Count) do
  begin
    viEmolumento := Self[I];

    if viEmolumento.Descricao.Equals(vpDescricao) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TEmolumentoList.IndexOfByDescricaoESistema(
  const vpDescricao: string;
  const vpSistema: ISistema): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := -1;

  for I := 0 to Pred(Count) do
  begin
    viEmolumento := Self[I];

    if viEmolumento.Descricao.Equals(vpDescricao).&And(
      viEmolumento.Sistema.Equals(vpSistema)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

end.
