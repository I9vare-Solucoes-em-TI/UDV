{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Spec.PDF.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

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

    procedure SaveToFileTiff(
      const vpFileName: string);

    procedure SaveToFileJpeg(
      const vpFileName: string;
      const vpPagina: integer);

   function MergeFiles(
    const vpFileIn1, vpFileIn2, vpFileOut: string): Boolean;

    procedure SetPDF_A_Mode(
      const vpValue: TPDF_A_Mode);

    procedure SetAuthor(
      const vpValue: string);

    procedure SetTitle(
      const vpValue: string);

    procedure SetSubject(
      const vpValue: string);

    procedure SetKeywords(
      const vpValue: string);

    procedure SetCreator(
      const vpValue: string);

    procedure SetProducer(
      const vpValue: string);
  end;

implementation

end.
