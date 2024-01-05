unit GeradorLogErro;

interface

uses
  System.SysUtils;

type
  IGeradorLogErro = interface
    ['{6D29A079-EBF4-47C0-8764-0E488FB38ECF}']

    procedure GerarLogErro(
      const vpValue: Exception);
  end;

implementation

end.
