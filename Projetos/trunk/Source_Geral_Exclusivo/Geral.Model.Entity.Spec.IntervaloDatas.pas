{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Spec.IntervaloDatas.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Spec.IntervaloDatas;

interface

type
  IIntervaloDatas = interface
    ['{9B269AAB-7B5A-418B-AFAD-8AD253E444E4}']

    function DataInicial: TDateTime;
    function DataFinal: TDateTime;
  end;

implementation

end.
