unit ValidadorEmail;

interface

type
  TValidadorEmail = class sealed
  private
    const CI_PATTERN: string = '^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)'+
      '@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$';
  public
    class procedure Validar(
      const vpEmail: string); static;
  end;

implementation

uses
  System.RegularExpressions,
  ValidacaoEmailException;

{ TValidadorEmail }

class procedure TValidadorEmail.Validar(
  const vpEmail: string);
begin
  if not TRegEx.IsMatch(vpEmail, CI_PATTERN) then
    raise EValidacaoEmailException.Create;
end;

end.
