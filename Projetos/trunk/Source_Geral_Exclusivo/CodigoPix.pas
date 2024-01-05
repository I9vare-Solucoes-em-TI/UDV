unit CodigoPix;

interface

Uses System.SysUtils;

  type
    TPix = Record
      Identificacao : String;
      Valor         : Currency;
      Texto         : String;
      PixTexto      : String;
      ChavePix      : String;
      Cidade        : String;
    End;

  function CRC16CCITT(texto: string): WORD;
  function bloco54Valor(valor : Currency): string;
  function blocoTextoSimples(idBloco : String; conteudo : string): string;
  function GerarCodigoPIX:String;

  var
    vgPIx : TPix;

implementation

uses
  Rotinas;

function blocoTextoSimples(idBloco : String; conteudo : string): string;
var
    tam : integer;
begin
    tam := Length(conteudo);
    idBloco := idBloco + ZeroEsquerda(tam,2) + conteudo;
    blocoTextoSimples := idBloco;
end;

function bloco54Valor(valor : Currency): string;
var
  texto : string;
	txtValor : string;
  tam : integer;
begin
    texto        := '54';
  	txtValor     := FormatFloat('0.00', Valor);
    txtValor     := TrocaVirgPPto(txtValor);
    tam          := Length(txtValor);
    texto        := texto + ZeroEsquerda(tam,2) + txtValor;
    bloco54Valor := texto;
end;

function CRC16CCITT(texto: string): WORD;
const
  polynomial = $1021;
var
  crc: WORD;
  i, j: Integer;
  b: Byte;
  bit, c15: Boolean;
begin
  crc := $FFFF;
  for i := 1 to length(texto) do
  begin
    b := Byte(texto[i]);
    for j := 0 to 7 do
    begin
      bit := (((b shr (7 - j)) and 1) = 1);
      c15 := (((crc shr 15) and 1) = 1);
      crc := crc shl 1;
      if (c15 xor bit) then
        crc := crc xor polynomial;
    end;
  end;
  CRC16CCITT := crc and $FFFF;
end;

function GerarCodigoPIX:String;
var
  Texto, chavePix : String;
begin
  chavePix := '00020126580014BR.GOV.BCB.PIX0136'+
               vgPIx.ChavePix+
              '520400005303986'+
               bloco54Valor(vgPIx.Valor)+
              '5802BR5903UDV'+
               blocoTextoSimples('60', vgPIx.Cidade)+
              '62260522'+
              '3H4bVCgzv3yW8RfSg3TRDR6304';

//              '610974980'+
//              '-97062290525M3MW0759920616439223257466304';
//               '-97062290525LSQP0759920616439249123196304';
  chavePix := chavePix + IntToHex(CRC16CCITT(chavePix), 4);
  Result   := chavePix;
  Result   := chavePix;

//    00020126580014br.gov.bcb.pix0136 e9c04b01-46c5-444a-a117-61510dc73733 52040000530398654045.325802BR5925CENTRO ESPIRITA BENEFICEN6015Aparecida de Go 610974980-97062290525M3MW0759920616439223257466304 CE9C
//    00020126580014br.gov.bcb.pix0136 4f95b28d-1159-444c-bcd5-a2851cf52297 52040000530398654045.325802BR5925CENTRO ESPIRITA BENEFICEN6015Aparecida de Go 610974980-97062290525LSQP0759920616439249123196304 16B9

//    00020126580014BR.GOV.BCB.PIX0136 e9c04b01-46c5-444a-a117-61510dc73733 52040000530398654043.525802BR5903UDV6015APARECIDA DE GO                       610974980-97062290525M3MW0759920616439223257466304 CFDD'
//    00020126580014BR.GOV.BCB.PIX0136 4f95b28d-1159-444c-bcd5-a2851cf52297 52040000530398654043.525802BR5903UDV6015APARECIDA DE GO                       610974980-97062290525M3MW0759920616439223257466304 C39A'

//    00020126580014br.gov.bcb.pix0136 4f95b28d-1159-444c-bcd5-a2851cf52297 52040000530398654045.325802BR5925CENTRO ESPIRITA BENEFICEN6015Aparecida de Go  610974980-97062290525LSQP075992061643924912319630416B9
//    00020126580014BR.GOV.BCB.PIX0136 4f95b28d-1159-444c-bcd5-a2851cf52297 52040000530398654043.525802BR5903UDV6015APARECIDA DE GO610974980-97062290525M3MW0759920616439223257466304C39A'

//  00020126580014BR.GOV.BCB.PIX01366c71277c-b5f2-49d3-ba4a-946af17d5e71 5204000053039865802BR5920TRI   SOLUCOES EM TI6009SAO PAULO62250521gUMxnZOgKKK6xi5J5dEY36304A051
//                                  6c71277c-b5f2-49d3-ba4a-946af17d5e71                                                          62260522
end;

end.

