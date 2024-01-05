unit GeradorSelosTJ;

interface

uses
  SeloLivroList;

type
  IGeradorSelosTJ = interface
    ['{0D30D67C-B5DB-495D-9250-8D9AFE9C703E}']

    function GetSeloLivroList: TSeloLivroList;
    function Gerar: string;

    procedure SetSeloLivroList(
      const Value: TSeloLivroList);

    procedure Salvar(
      const vpCaminhoArquivo: string);

    property SeloLivroList: TSeloLivroList read GetSeloLivroList
      write SetSeloLivroList;
  end;

implementation

end.
