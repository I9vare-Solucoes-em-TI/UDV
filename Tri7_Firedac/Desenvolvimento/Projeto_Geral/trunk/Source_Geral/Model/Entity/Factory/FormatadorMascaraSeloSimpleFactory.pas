unit FormatadorMascaraSeloSimpleFactory;

interface

uses
  FormatadorMascaraSelo;

type
  TFormatadorMascaraSeloSimpleFactory = class sealed
  private
    class function GetFormatadorMascaraSeloGO: IFormatadorMascaraSelo; static;
    class function GetFormatadorMascaraSeloCE: IFormatadorMascaraSelo; static;
    class function GetFormatadorMascaraSeloAL: IFormatadorMascaraSelo; static;
    class function GetFormatadorMascaraSeloPA: IFormatadorMascaraSelo; static;
  public
    class function Get(
      const vpUF: string): IFormatadorMascaraSelo; static;
  end;

implementation

uses
  System.SysUtils,
  FormatadorMascaraSeloGO,
  FormatadorMascaraSeloCE,
  FormatadorMascaraSeloAL,
  FormatadorMascaraSeloPA;

{ TFormatadorMascaraSeloSimpleFactory }

class function TFormatadorMascaraSeloSimpleFactory.Get(
  const vpUF: string): IFormatadorMascaraSelo;
begin
  if SameText(
    vpUF,
    'GO') then
    Exit(
      GetFormatadorMascaraSeloGO);

  if SameText(
    vpUF,
    'CE') then
    Exit(
      GetFormatadorMascaraSeloCE);

  if SameText(
    vpUF,
    'AL') then
    Exit(
      GetFormatadorMascaraSeloAL);

  if SameText(
    vpUF,
    'PA') then
    Exit(
      GetFormatadorMascaraSeloPA);

  Result := nil;
end;

class function TFormatadorMascaraSeloSimpleFactory.GetFormatadorMascaraSeloAL:
  IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloAL.New;
end;

class function TFormatadorMascaraSeloSimpleFactory.GetFormatadorMascaraSeloCE:
  IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloCE.New;
end;

class function TFormatadorMascaraSeloSimpleFactory.GetFormatadorMascaraSeloGO:
  IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloGO.New;
end;

class function TFormatadorMascaraSeloSimpleFactory.GetFormatadorMascaraSeloPA:
  IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloPA.New;
end;

end.
