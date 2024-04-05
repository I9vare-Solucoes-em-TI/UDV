{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       FN.Model.GED.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit FN.Model.GED;

interface

uses
  Geral.Model.GED,
  System.Generics.Collections,
  System.Classes;

type
  TTipoArquivo = (tiLivroCaixa, tiOutros, tiOrcamento);

  TGedFinanceiro = class(TGED)
  private
    FTipoArquivo: TTipoArquivo;

    function GetDiretorio: string;
    function GetSubPasta: string;
    function GetPrefixo: string;
    function GetSufixo: string;
    function GetDescricao: string;

  public
    constructor Create(
      const vpTipoArquivo: TTipoArquivo;
      const vpFormatoArquivo: TFormatoArquivo = faImagem;
      const vpExtensao :string = ''); reintroduce;

    class function GetGED_List(
      const vpTipoArquivoList: TList<TTipoArquivo>): TObjectList<TGED>;

    procedure SaveImagesListInTiff(const vpNumberList: TList<Integer>;
      const vpFileSource: string;
      const vpImageColor: Boolean = False);

  end;


implementation

uses
  System.SysUtils,
  RotinasImagem,
  Controles;

class function TGedFinanceiro.GetGED_List(
  const vpTipoArquivoList: TList<TTipoArquivo>): TObjectList<TGED>;
var
  viTipoImagem: TTipoArquivo;
begin
  Result := TObjectList<TGED>.Create;

  for viTipoImagem in vpTipoArquivoList do
    Result.Add(
      Self.Create(
        viTipoImagem));
end;

{ TGedProtesto }

constructor TGedFinanceiro.Create(const vpTipoArquivo: TTipoArquivo;
  const vpFormatoArquivo: TFormatoArquivo = faImagem;
  const vpExtensao: string = '');
begin
  FTipoArquivo    := vpTipoArquivo;
  FFormatoArquivo := vpFormatoArquivo;

  inherited Create(
    GetDiretorio,
    GetSubPasta,
    GetPrefixo,
    GetSufixo,
    vpExtensao,
    True,
    GetDescricao,
    vpFormatoArquivo);
end;

function TGedFinanceiro.GetDescricao: string;
begin
  case FTipoArquivo of
    tiOutros : Result := 'Outros';
    tiOrcamento : Result := 'Orçamento';
  else
    Result := 'Financeiro'; //Livro Caixa
  end;
end;

function TGedFinanceiro.GetDiretorio: string;
begin
  if FFormatoArquivo = faImagem then
    Result := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S')
  else
    Result := vgDiretorioCorrente;
end;

function TGedFinanceiro.GetPrefixo: string;
begin
  case FTipoArquivo of
    tiOutros    : Result := 'OUT_';
    tiOrcamento : Result := 'O_';
  else
    Result := 'F_';//Livro Caixa
  end;
end;

function TGedFinanceiro.GetSubPasta: string;
begin
  case FTipoArquivo of
    tiOutros : Result := 'Outros';
    tiOrcamento : Result := 'Orcamentos';
  else
    Result := 'Financeiro'; //Livro Caixa
  end;
end;

function TGedFinanceiro.GetSufixo: string;
begin
  Result := '#';
end;

procedure TGedFinanceiro.SaveImagesListInTiff(const vpNumberList: TList<Integer>;
  const vpFileSource: string;
  const vpImageColor: Boolean = False);
var
  viQtde,
  viIdx,
  viNumero: Integer;
begin
  viQtde := RotinasImagem.GetImageCount(vpFileSource);

  if viQtde <> vpNumberList.Count then
     raise Exception.Create(
      'Total de imagens no arquivo é diferente do total na lista!');

  viIdx := 0;
  for viNumero in vpNumberList  do
  begin
    RotinasImagem.SaveTiffFile(
      vpFileSource,
      Self.CaminhoArquivo(viNumero),
      vpImageColor,
      False,
      viIdx);

    Inc(viIdx);
  end;
end;

end.
