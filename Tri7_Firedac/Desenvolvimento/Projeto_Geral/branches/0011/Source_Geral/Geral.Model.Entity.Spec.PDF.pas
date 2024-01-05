unit Geral.Model.Entity.Spec.PDF;

interface

type
  TPDF_A_Mode = (tpPDF_A_1b, tpPDF_A_3b);

  IPDF_Library = interface
    ['{C54FE1E0-08DF-490F-961E-730605ED85C3}']

    procedure LoadFromFile(
      const vpFileName: string);

    procedure SetCustomInformation(
      const vpKey: string;
      const vpValue: string);

    procedure SaveToFile(
      const vpFileName: string);

    procedure SetPDF_A_Mode(
      const vpValue: TPDF_A_Mode);

    procedure SetKeywords(
      const vpValue: string);
  end;

implementation

end.
