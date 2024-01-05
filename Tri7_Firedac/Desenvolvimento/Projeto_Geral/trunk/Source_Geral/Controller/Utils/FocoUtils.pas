unit FocoUtils;

interface

uses
  Vcl.Controls;

type
  TFocoUtils = class sealed
  private
    class function IsFocused(
      const vpValue: TWinControl): Boolean; static;

    class function IsNotFocused(
      const vpValue: TWinControl): Boolean; static;

    class function CanFocus(
      const vpValue: TWinControl): Boolean; static;

    class procedure SetFocus(
      const vpValue: TWinControl); static;
  public
    class procedure Focar(
      const vpValue: TWinControl); static;
  end;

implementation

uses
  BooleanHelper;

{ TFocoUtils }

class function TFocoUtils.CanFocus(
  const vpValue: TWinControl): Boolean;
begin
  Result := vpValue.CanFocus;
end;

class procedure TFocoUtils.Focar(
  const vpValue: TWinControl);
begin
  if IsNotFocused(vpValue).&And(
    CanFocus(vpValue)) then
    SetFocus(vpValue);
end;

class function TFocoUtils.IsFocused(
  const vpValue: TWinControl): Boolean;
begin
  Result := vpValue.Focused;
end;

class function TFocoUtils.IsNotFocused(
  const vpValue: TWinControl): Boolean;
begin
  Result := IsFocused(vpValue).&Not;
end;

class procedure TFocoUtils.SetFocus(
  const vpValue: TWinControl);
begin
  vpValue.SetFocus;
end;

end.
