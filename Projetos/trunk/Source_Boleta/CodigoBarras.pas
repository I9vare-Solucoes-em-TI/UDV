unit CodigoBarras;

interface

uses
  SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, FuncAux, Dialogs;

Type
  TBarra = class
  public
     CodigoBanco,
     Agencia,
     ContaCorrente,
     DigContaCorrente,
     DigCodigoCedente,
     Carteira,
     CodigoCedente,
     NossoNumero,
     ConvenioBB,
     Documento : String;
     Vencimento : TDateTime;
     Valor : Currency;
     procedure Limpar;
  end;

  TCodigoBarras = class(TObject)
  private
    FCampoLivre : String;
    FMoeda: char;
    FDadosBarra : TBarra;
    FCodigoBarras: string;
    FLinhaDigitavel: string;
    FNomeArquivo: string;
    FImagem : TImage;

    function GetFatorVencto: string;
    function GetCampoLivre: string;
    function GetDigitoNossoNum: char;
    procedure MontaCodigoDeBarras;
    procedure MontaLinhaDigitavel;
    procedure GetImagem;
    function Define2de5: string;
    procedure Limpar;
    procedure FormatarDadosBanco;
    procedure Banco237;
  public
    procedure SalvarCodigoBarrasArquivo;
    procedure ProcessarDadosBarra;
    procedure LimparTudo;
    constructor Create;
    destructor Destroy; override;
    property DadosBarra: TBarra read FDadosBarra write FDadosBarra;
    property CodigoBarras: string read FCodigoBarras write FCodigoBarras;
    property LinhaDigitavel: string read FLinhaDigitavel;
    property NomeArquivo: string read FNomeArquivo write FNomeArquivo;
  end;

implementation

uses Rotinas;

{ TDadosBarra }

procedure TBarra.Limpar;
begin
  Valor         := 0;
  CodigoBanco   := '';
  NossoNumero   := '';
  Vencimento    := 0;
  Carteira      := '';
  Agencia       := '';
  ContaCorrente := '';
end;

procedure TCodigoBarras.Banco237;
begin
  with FDadosBarra do
  begin
    if Length(NossoNumero) < 11 then
      NossoNumero := Padl(NossoNumero, 11, '0');

    if Length(ContaCorrente) < 7 then
      ContaCorrente := Padl(ContaCorrente, 7, '0');

    Agencia := RetiraZerosEsquerda(Agencia);
    if Length(Agencia) < 4 then
      Agencia := Padl(Agencia, 4, '0');

    if Carteira <> '' then
    begin
      if Length(Carteira) <> 2 then
        Carteira := RetZeros(RetiraZerosEsquerda(Carteira), 2);
    end
    else Carteira := '06';
  end;
end;

constructor TCodigoBarras.Create;
begin
  inherited;
  FDadosBarra := TBarra.create;
  FImagem := TImage.Create(nil);
  FMoeda := '9';
  Limpar;
end;

destructor TCodigoBarras.Destroy;
begin
  inherited;
  FDadosBarra.Free;
  FImagem.Free;
end;

procedure TCodigoBarras.FormatarDadosBanco;
begin
  if FDadosBarra.CodigoBanco = '237' then
    Banco237;
end;

function TCodigoBarras.Define2de5: string;
{Traduz dígitos do código de barras para valores de 0 e 1, formando um código do tipo Intercalado 2 de 5}
var
  CodigoAuxiliar: string;
  Codigo, Start: string;
  Stop: string;
  T2de5: array[0..9] of string;
  Codifi: string;
  I: integer;

begin
  Result := 'Erro';
  Start := '0000';
  Stop := '100';
  T2de5[0] := '00110';
  T2de5[1] := '10001';
  T2de5[2] := '01001';
  T2de5[3] := '11000';
  T2de5[4] := '00101';
  T2de5[5] := '10100';
  T2de5[6] := '01100';
  T2de5[7] := '00011';
  T2de5[8] := '10010';
  T2de5[9] := '01010';

  { Digitos }

  Codigo := FCodigoBarras;
  for I := 1 to length(Codigo) do
  begin
    if pos(Codigo[I], '0123456789') <> 0 then
      Codifi := Codifi + T2de5[StrToInt(Codigo[I])]
    else
      Exit;
  end;

  {Se houver um número ímpar de dígitos no Código, acrescentar um ZERO no início}
  if odd(length(Codigo)) then
    Codifi := T2de5[0] + Codifi;

  {Intercalar números - O primeiro com o segundo, o terceiro com o quarto, etc...}
  I := 1;
  CodigoAuxiliar := '';
  while I <= (length(Codifi) - 9) do
  begin
    CodigoAuxiliar := CodigoAuxiliar + Codifi[I] + Codifi[I + 5] + Codifi[I + 1] + Codifi[I + 6] + Codifi[I + 2] + Codifi[I + 7] + Codifi[I + 3] + Codifi[I + 8] + Codifi[I + 4] + Codifi[I + 9];
    I := I + 10;
  end;

  { Acrescentar caracteres Start e Stop }
  Result := Start + CodigoAuxiliar + Stop;
end;

procedure TCodigoBarras.GetImagem;

function InicioDesenhoBarras : Integer;
var i :  Integer;
begin
  Result := 0;
  for I := 1 to FImagem.Picture.Bitmap.Height do
  begin
    if FImagem.Canvas.Pixels[50, FImagem.Picture.Bitmap.Height - i] = 0 then
    begin
      Result := FImagem.Picture.Bitmap.Height-i + 10;
      Break;
    end;
  end;
  if Result = 0 then
    Result := 430;
end;

const
  CorBarra = clBlack;
  CorEspaco = clWhite;
  LarguraBarraFina = 1;
  LarguraBarraGrossa = 3;
  AlturaBarra = 50;
var
  X: integer;
  Col: integer;
  Lar: integer;
  TopBarras : Integer;
  CodigoAuxiliar: string;
  ImgBarras: TImage;
begin
  CodigoAuxiliar := Define2de5;
  ImgBarras := TImage.Create(nil);
  try
    ImgBarras.Height := AlturaBarra;
    ImgBarras.Width := 0;
    for X := 1 to Length(CodigoAuxiliar) do
      case CodigoAuxiliar[X] of
        '0': ImgBarras.Width := ImgBarras.Width + LarguraBarraFina;
        '1': ImgBarras.Width := ImgBarras.Width + LarguraBarraGrossa;
      end;

    Col := 0;

    if CodigoAuxiliar <> 'Erro' then
    begin
      for X := 1 to length(CodigoAuxiliar) do
      begin
        {Desenha barra}
        with ImgBarras.Canvas do
        begin
          if Odd(X) then
            Pen.Color := CorBarra
          else
            Pen.Color := CorEspaco;

          if CodigoAuxiliar[X] = '0' then
          begin
            for Lar := 1 to LarguraBarraFina do
            begin
              MoveTo(Col, 0);
              LineTo(Col, AlturaBarra);
              Col := Col + 1;
            end;
          end
          else
          begin
            for Lar := 1 to LarguraBarraGrossa do
            begin
              MoveTo(Col, 0);
              LineTo(Col, AlturaBarra);
              Col := Col + 1;
            end;
          end;
        end;
      end;
    end
    else
      ImgBarras.Canvas.TextOut(0, 0, 'Erro');
      TopBarras := InicioDesenhoBarras;
      FImagem.Canvas.CopyRect(Rect(16, TopBarras, 16 + ImgBarras.Width, TopBarras + ImgBarras.Height),
                             ImgBarras.Canvas, Rect(0, 0, ImgBarras.width, ImgBarras.height));
  finally
    ImgBarras.Free;
  end;
end;

procedure TCodigoBarras.Limpar;
begin
  FDadosBarra.Limpar;
  FCodigoBarras        := '';
  FLinhaDigitavel      := '';

  FImagem.Picture.Assign(nil);
end;

procedure TCodigoBarras.LimparTudo;
begin
  Limpar;
end;

function TCodigoBarras.GetFatorVencto: string;
var
  FatVencto: LongInt;
begin
  if FDadosBarra.Vencimento < EncodeDate(1997, 10, 7) then
    ShowMessage('O vencimento do boleto deve ser superior à 7-Outubro-1997');
  FatVencto := Abs(Trunc(FDadosBarra.Vencimento) - Trunc(EncodeDate(1997, 10, 7)));
  Result := PadL(IntToStr(FatVencto), 4, '0');
end;

function TCodigoBarras.GetCampoLivre: string;
  const Filler: string = '00';
var
  viTamanhoConvenio : Integer;
  CLivre: string;
begin
  inherited;
  with FDadosBarra do
  begin
    if CodigoBanco = '237' then //Bradesco
    begin
      Result := Agencia +
                Carteira +
                NossoNumero +
                ContaCorrente + '0';
    end
    else
    if CodigoBanco = '001' then //Banco do Brasil
    begin
      viTamanhoConvenio := Length(ConvenioBB);
      if (viTamanhoConvenio = 4) and (Length(NossoNumero) > 7) then
        ShowMessage('O tamanho do NossoNúmero não pode ser maior que 7 caracteres!')
      else
      if (viTamanhoConvenio = 6) then
           ShowMessage('O tamanho do NossoNúmero não pode ser maior que 10 caracteres!')
      else
        if (viTamanhoConvenio = 7) and (Length(NossoNumero) > 11) then
           ShowMessage('O tamanho do NossoNúmero não pode ser maior que 11 caracteres!');

      if ConvenioBB = '' then
        ShowMessage('É necessário informar o convênio!')
      else
      if viTamanhoConvenio > 7 then
        ShowMessage('UNIT preparada apenas para convenios de até 7 dígitos!');

      if Length(ConvenioBB) = 4 then
        Result := Padl(ConvenioBB, 4, '0') + Padl(NossoNumero, 7, '0') + Agencia + CodigoCedente + Carteira
      else
        if (Length(ConvenioBB) = 6) then
          Result := Padl(ConvenioBB, 6, '0') + Padl(NossoNumero, 17, '0') + '21' // 21 indica que o N.N. tem 17 dígitos
        else
          if Length(ConvenioBB) = 7 then
            Result := '000000' + Padl(ConvenioBB, 7, '0') + Padl(NossoNumero, 10, '0') + Carteira;
    end
    else
    if CodigoBanco = '341' then //Itau
    begin
      if Pos(Carteira, '106 107 122 142 143 195 196 198') = 0 then
      begin
        Clivre := Carteira + Padl(NossoNumero, 8, '0') +
          GetDigitoNossoNum +
          Padl(IntToStr(StrToInt(Agencia)), 4, '0') +
          Padl(ContaCorrente, 5, '0') +
          DigContaCorrente +
          '000';
      end
      else
      begin
        Clivre := Carteira + Padl(NossoNumero, 8, '0') +
          Padl(Documento, 7, '0') +
          Padl(CodigoCedente, 5, '0');
        CLivre := CLivre + Modulo10(CLivre) + '0';
      end;

      Result := CLivre;
    end;
  end;
end;

function TCodigoBarras.GetDigitoNossoNum: char;
var
  Num: string;
begin
  inherited;
  with FDadosBarra do
  begin
    if CodigoBanco = '341' then //Itaú
    begin
      if Pos(carteira, '126 131 146 150 168') <> 0 then
      begin
        Num := Padl(Carteira, 3, '0') +
          Padl(NossoNumero, 8, '0');
      end
      else
      begin
        Num := Padl(IntToStr(StrToInt(Agencia)), 4, '0') +
          Padl(ContaCorrente, 5, '0') +
          Padl(Carteira, 3, '0') +
          Padl(NossoNumero, 8, '0');
      end;
    end;
  end;
  Result := Modulo10(Num)[1];
end;

procedure TCodigoBarras.MontaCodigoDeBarras;
begin
  FormatarDadosBanco;
  
  FCampoLivre := GetCampoLivre;

  FCodigoBarras := FDadosBarra.CodigoBanco + // Identificacao do CodigoBanco (3 posicoes)
                   FMoeda + // Identificacao da Moeda
                   '0' + // Digito auto-verificador (por enquanto é zero)
                   GetFatorVencto + // Fator de vencimento (4 posicoes)
  Padl(IntToStr(Trunc(FDadosBarra.Valor * 100)), 10, '0') + // Valor do titulo (10 posicoes)
  FCampoLivre;

  // Especifica o digito auto-verificador
  FCodigoBarras[5] := CalcDigVerificador(FCodigoBarras);
end;

procedure TCodigoBarras.MontaLinhaDigitavel;
{
   A linha digitável é baseada na informações do código de barras.
   As informações que fazem parte do código de barras são:
   Posição         Conteúdo
   1 a 3           Número do banco
   4               Código da Moeda - 9 para Real
   5               Digito verificador do Código de Barras
   6 a 19          Valor (12 inteiros e 2 decimais)
   20 a 44         Campo Livre definido por cada banco
}
var
   p1, p2, p3, p4, p5, p6,
   Campo1, Campo2, Campo3, Campo4, Campo5 : string;
begin
  {
      Campo 1 - composto pelo código do banco, código da moeda, as cinco primeiras posições
      do campo livre e DV (modulo10) desse campo
   }
   p1 := Copy(FCodigoBarras,1,4);
   p2 := Copy(FCodigoBarras,20,5);
   p3 := Modulo10(p1+p2);
   p4 := p1+p2+p3;
   p5 := Copy(p4,1,5);
   p6 := Copy(p4,6,5);
   Campo1 := p5+'.'+p6;

   {
      Campo 2 - composto pelas posiçoes 6 a 15 do campo livre
      e DV (modulo10) deste campo
   }
   p1 := Copy(FCodigoBarras,25,10);
   p2 := Modulo10(p1);
   p3 := p1+p2;
   p4 := Copy(p3,1,5);
   p5 := Copy(p3,6,6);
   Campo2 := p4+'.'+p5;

   {
      Campo 3 - composto pelas posicoes 16 a 25 do campo livre
      e DV (modulo10) deste campo
   }
   p1 := Copy(FCodigoBarras,35,10);
   p2 := Modulo10(p1);
   p3 := p1+p2;
   p4 := Copy(p3,1,5);
   p5 := Copy(p3,6,6);
   Campo3 := p4+'.'+p5;

   {
      Campo 4 - digito verificador do FCodigoBarras de barras
   }
   Campo4 := Copy(FCodigoBarras,5,1);

   {
      Campo 5 - composto pelo valor nominal do documento, sem indicacao
      de zeros a esquerda e sem edicao (sem ponto e virgula). Quando se
      tratar de valor zerado, a representacao deve ser 000 (tres zeros).
   }
   Campo5 := Copy(FCodigoBarras,6,14);

   FLinhaDigitavel := Campo1 + ' ' + Campo2 + ' ' + Campo3 + ' ' + Campo4 + ' ' + Campo5;
end;

procedure TCodigoBarras.SalvarCodigoBarrasArquivo;
begin
  if FNomeArquivo <> '' then
  begin
     if FileExists(FNomeArquivo) then
     begin
       try
         FImagem.Picture.LoadFromFile(FNomeArquivo);
         GetImagem;
         FImagem.Picture.SaveToFile(FNomeArquivo);
         Limpar;
       except
         ShowMessage('Erro ao salvar imagem com código de barras!');
       end;
     end
     else ShowMessage('Arquivo não existe!');
  end;
end;

procedure TCodigoBarras.ProcessarDadosBarra;
begin
  if FCodigoBarras = '' then
    MontaCodigoDeBarras;
  MontaLinhaDigitavel;
end;

end.
