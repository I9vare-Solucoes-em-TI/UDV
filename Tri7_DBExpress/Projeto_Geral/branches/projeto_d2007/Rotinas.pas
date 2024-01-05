unit Rotinas;

interface

Uses  windows, SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls, ExtCtrls, ComCtrls, Buttons, Menus, SqlExpr,
      Mask, ActnList, Grids, Variants, Provider, Messages,
      DB, jpeg, Winsock, ZLibEx, DBGrids, Registry, NB30, Clipbrd,
      Printers, WinSpool, cxGridDBTableView,
      cxGraphics, math, cxTextEdit, cxCurrencyEdit, cxCalendar, Consts,StrUtils;

type
  Tnumeros = array[1..10] of string[15];
  Tmoeda = array[1..9, 1..2] of string[20];

  DadosCadastroGeral = RECORD
    Tabela, Chave, Caption : string;
    Texto, Sistema : Boolean;
  end;

const
     EKeyViolation  = 'KEY VIOLATION';
     EFKeyViolation = 'FOREIGN KEY';

     {Valores por extenso}
     aUnidade: Tnumeros = ('um ', 'dois ', 'três ', 'quatro ', 'cinco ', 'seis ', 'sete ', 'oito ', 'nove ', '');
     aDezena: Tnumeros = ('dez ', 'vinte ', 'trinta ', 'quarenta ', 'cinquenta ', 'sessenta ', 'setenta ', 'oitenta ', 'noventa ', '');
     aDezena2: Tnumeros = ('dez ', 'onze ', 'doze ', 'treze ', 'quatorze ', 'quinze ', 'dezesseis ',
                           'dezessete ', 'dezoito ', 'dezenove ');
     aCentena: Tnumeros = ('cento ', 'duzentos ', 'trezentos ', 'quatrocentos ', 'quinhentos ', 'seiscentos ',
                           'setecentos ', 'oitocentos ', 'novecentos ', '');
     aMilhar: Tnumeros = ('mil ', 'milhão ', 'milhões ', '', '', '', '', '', '', '');
     aMoeda: Tmoeda = (('cruzeiro ', 'cruzeiros '), ('dólar ', 'dólares '), ('real ', 'reais '), ('', ''), ('metro quadrado ', 'metros quadrados '), ('cruzado ', 'cruzados '),
                       ('cruzeiro novo ', 'cruzeiros novos '), ('cruzado novo ', 'cruzados novos '), ('cruzeiro real ', 'cruzeiros reais '));
     aCentavo: Tnumeros = ('centavo', 'centavos', '', '', '', '', '', '', '', '');

     Mes : array [1..12] of Pchar = ('janeiro','fevereiro','março','abril','maio','junho',
                                     'julho','agosto','setembro','outubro','novembro','dezembro');

     Semana : array[1..7] of Pchar =('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sabado');

     StatusAgenda : array[1..7] of Pchar =('Livre','Agendado','Aguardando','Bloqueado','Não Compareceu', 'Atendido', 'Consultando');


     procedure ConverterTextoPDF(var vpWptTexto : TWPRichText; viPastaDestino, vpArquivoDestino : string);
     procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False);
     Function Occurs(T, S : String) : Integer;
     Procedure Idade(Var Data1:TDateTime; Data2:TDateTime;var Anos,Meses:word);
     Procedure DigitaInteiro(var Tecla: char);
     Procedure Digitafloat(var Tecla:char);
     procedure DigitaFone(Var Tecla : Char);
     Function AnoBisexto(Ano:Integer): Boolean;
     Function ValidarData(data :string) :boolean;
     Function TrocaVirgPPto(Valor: string): String;
     function TrocaPtoPVirg(Valor: string): String;
     function TrocaBarraPPonto(Valor: string): String;
     function TrocaPtoVirgPVirg(Valor: string): String;
     Function TrocaPtoPBarra(Valor: string): String;
     Function FormataCNPJ(CNPJ : String): String;
     Function FormataCPF(CPF : String): String;
     Function TestaCnpj(xCNPJ: String): Boolean;
     Function TestaCpf(num: String): boolean;
     function RetornaCPFCNPJFormatado(Valor : String) : String;
     function Alltrim(Text: string): string;
     function RemoveAcentos(sTexto: string): string;
     function ChecaEstado(Dado : string) : boolean;
     function ValorExtenso(nValor: Real; cTextoIni, cTextoFim: string; nMoeda: Integer) : String;
     function DataExtenso(vpData : TDate):String;

     function StringBreak(Valor, Quebra: string; StringList: TStringList) : TStringList;
     function GetTipo(vfValor, vfTipo: String): String;
     function JpgToBmp(MyJPEG : TJPEGImage): TBitmap;
     function CriaJPeg(s : TMemoryStream):TJPEGImage;
     function Cifrar(Valor : String): String;
     function TiraBarra (Campo : String):String;
     function TiraCaractere (vpValor, Caractere : String):String;
     function RetBrancos(BRANCOS:string;QUANT:integer;Tipo:Integer = 0):String;
     function RetZeros(Zeros:string;QUANT:integer):String;
     function RetornaIP : String;
     function DifHora(Inicio,Fim : String):String;
     function IdadeAtual(Nasc : TDate): Integer;
     function RetornaNumerico(Valor : String) : String;
     function RetirarPonto(Valor : String) : String;

     function RetirarBarra(Valor : String) : String;
     function RetornaAlfaNumerico(Valor : String) : String;
     Function IdadeN(Nascimento:TDateTime; Idade2 : String = ''; SomenteAno : Boolean = False) : String;
     Function IdadeAno(Nascimento:TDateTime; Idade2 : String = '') : Integer;
     Function RetNull(Valor : String) : String;
     Function CompressString ( Source:String):String;
     Function DeCompressString ( Source:String):String;
     function Getcomputer: string;
     function GetMACAdress: string;
     function GetNomeArquivo(Nome : String):String;
     function Pos_N(SubStr, Str : String; P : Integer): Integer;
     function RetiraZerosEsquerda(Zeros:string):String;
     function MaiusculoMinusculo(vpPalavra : string):String;
     function DataHoraModificacao(Arquivo : String) : TDateTime;
     Procedure CopyFiles(Origem, Destino : String);
     function GetSerialHD : String;
     function TravaSistema(Valor, vpSerialMaster : String) : Boolean;
     procedure ModificarDataSistema;
     procedure SetarAtributosArquivo(vpArquivo : String; vpReadOnly, vpArchive, vpSysFile, vpHidden : Boolean);
     procedure InserirImagemTexto(vpArquivoImagem, vpVariavel : string; vpWptTexto : TWPRichText);
     function RetirarCabecalhoRodapeTexto(wptTexto : TWPRichText) : TWPRichText;
     function CalcularDataVencimento(vpData: TDate; vpTipo, vpQtd : integer):TDate;
     procedure MontarDataInicioFinal(vpData : String; var vpData1, vpData2 : string; vpDividor :String = '.'; vpMes : String = '');
     Function VerificarDia(vpData, vpDia : String):String;
     function GetExtArquivo(vpArquivo : String) : String;
     function PegarNumeroLetra(vpValor, vpTipoValor : string) : String;
     function RetirarPontuacaoFinalTexto(vpTexto : String):String;
     function RetornarEstadoExtenso(vpTexto : String):String;
     function GetComputerNameFunc : string;
     function IdadeCerta(Data1:TDateTime; Data2:String;  SomenteAno : Boolean = False): String;
     function Arredondamento(Valor: Currency; Decimais: integer): Currency;
     Function PegarAnoMes(vpData : String):String;
     Function GerarSenhaWeb:String;
     function RetornaAlfaNumericoEspecial (Valor:String):String;
     function ValidarCpf(num: string): boolean;
     function ValidarCNPJ(Dado : string) : boolean;
     function Similar_Text(str1, str2 : String): Integer;
     function Similar_Text_2(Origem, Destino: string): Single;

     //Função que retorno a formatação do codigo para o nome da imagem
     function FormataCodigoImagem(vpNumero : Integer) : String;
     function FormataPastaImagem(vpNumero : Integer) : String;
          
     // Funções de Impressora
     function GetCurrentPrinterPort: string;
     function GetCurrentPrinterHandle: THandle;
     procedure MudarImpressora(vpPortaImp, vpNomeTrocar : String; vpIndex : integer = 0; vpUSBNome : String = '');

     //Codigo de barras Font Code128AB
     function VerifyBarCodeTable(iTypeSearch :Integer; sCaracter: String = ''; lBarCodePosition: Integer = 0 ): Variant;
     function GenerateBarCode128AB(vExpression : String): Variant;
     function ValidaMes(MesAno:string):string;

     function InputQueryAux(const ACaption, APrompt: string;
        var Value: string; Tipo : String): Boolean;

     // Quantidade de palavras
    Function RetornatQdtPalavras(str : string) : integer;

    function SomaHoras(Hora, HoraSoma :String):String;

    //Nome da Estação
    function NomeEstacao: string;

    // Registro do Windows
    procedure GravaRegistro(Raiz: HKEY; Chave, Valor, Endereco: string; vpAdicionarAspas : Boolean = False);
    procedure ApagaRegistro(Raiz: HKEY; Chave, Valor : string; vpDeletarRegistro : Boolean = False);
    Function LerRegistro(Raiz: HKEY; Chave, Variavel : string):String;
    Function PegarUsuarioWindows:String;

     var w_param_tela, w_param_tela1, w_param_tela2,
         w_param_tela3: String;
         IP_SERVER, SIGLA_SISTEMA : String; // usada pelos clientes
         vgPermissaoRotina : String;
         CRTL, GERARQUIVO, vgIniciar, CorGridesAtivada, SkinAtivo : Boolean;
         Skin : Integer;
         LogoMarca : TBitmap;
         cTipoMoeda: Byte;
         HabilitaSitema : Boolean;
         vgDadosCadastroGeral : DadosCadastroGeral;
         vgImpressoraPadraoPorta, vgImpressoraPadraoTrocar, vgCpfSugerido : String;
         vgIndexImpressora : integer;

         // Controle Visual
         vgLinhaGridHorizontal, vgLinhaGridVertical : String;


implementation

function ValidarCpf(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9:integer;
  d1,d2:integer;
  digitado, calculado:string;
begin
  n1:= StrToInt(num[1]);
  n2:= StrToInt(num[2]);
  n3:= StrToInt(num[3]);
  n4:= StrToInt(num[4]);
  n5:= StrToInt(num[5]);
  n6:= StrToInt(num[6]);
  n7:= StrToInt(num[7]);
  n8:= StrToInt(num[8]);
  n9:= StrToInt(num[9]);
  d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:= 11-(d1 mod 11);
  if d1>=10 then d1:=0;
    d2:= d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:= 11-(d2 mod 11);
  if d2>=10 then d2:=0;
    calculado:= inttostr(d1)+inttostr(d2);
  digitado:= num[10]+num[11];
  if calculado = digitado then
    ValidarCpf:=true
  else
    ValidarCpf:=false;
end;

function Similar_Text(str1, str2 : String): Integer;
var
   viCount,
   I,
   J : Integer;
   viLista1,
   viLista2,
   viListaTemp :TStringList;
begin
   viCount     := 0;
   viLista1    :=TStringList.Create;
   viLista2    :=TStringList.Create;
   viListaTemp :=TStringList.Create;

   //Converte para minusculas e retira os acentos
   str1 := RemoveAcentos(LowerCase(Trim(str1)));
   str2 := RemoveAcentos(LowerCase(Trim(str2)));

   //Remove mais de um espaço em branco junto
   str1 := ReplaceText(str1, '  ', ' ');
   str2 := ReplaceText(str2, '  ', ' ');

   if str1 <> str2 then
   begin
     if (str1 = '') or (str2 = '') then
     begin
       Result := 0;
       Exit;
     end;

     ExtractStrings([' '],[' '],pchar(str1),viLista1);
     ExtractStrings([' '],[' '],pchar(str2),viLista2);

     if(viLista1.Count < viLista2.Count) then
     begin
        viListaTemp.Text := viLista1.Text;
        viLista1.Clear;
        viLista1.Text    := viLista2.Text;
        viLista2.Clear;
        viLista2.Text    := viListaTemp.Text;
     end;

     for I := 0 to viLista1.Count - 1 do
        for J := 0 to viLista2.Count - 1 do
           if(SoundexSimilar(viLista1.Strings[I], viLista2.Strings[J])) then
             Inc(viCount);

     Result := Round((viCount/viLista2.Count)*100);
   end
   else
     Result := 100;

   FreeAndNil(viLista1);
   FreeAndNil(viLista2);
   FreeAndNil(viListaTemp);
end;

function ValidarCNPJ(Dado : string) : boolean;
var  D1 : array[1..12] of byte;
     I,
     DF1,
     DF2,
     DF3,
     DF4,
     DF5,
     DF6,
     Resto1,
     Resto2,
     PrimeiroDigito,
     SegundoDigito : integer;
begin
  Result := true;
  if Length(Dado) = 14 then
  begin
    for I := 1 to 12 do
       if Dado[I] in ['0'..'9'] then
         D1[I] := StrToInt(Dado[I])
       else
         Result := false;

    if Result then
    begin
      DF1 := 0;
      DF2 := 0;
      DF3 := 0;
      DF4 := 0;
      DF5 := 0;
      DF6 := 0;
      Resto1 := 0;
      Resto2 := 0;
      PrimeiroDigito := 0;
      SegundoDigito := 0;
      DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
             7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
      DF2 := DF1 div 11;
      DF3 := DF2 * 11;
      Resto1 := DF1 - DF3;
      if (Resto1 = 0) or (Resto1 = 1) then
           PrimeiroDigito := 0
      else
           PrimeiroDigito := 11 - Resto1;
      DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
             8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
             2*PrimeiroDigito;
      DF5 := DF4 div 11;
      DF6 := DF5 * 11;
      Resto2 := DF4 - DF6;
      if (Resto2 = 0) or (Resto2 = 1) then
        SegundoDigito := 0
      else
        SegundoDigito := 11 - Resto2;
      if (PrimeiroDigito <> StrToInt(Dado[13])) or
        (SegundoDigito <> StrToInt(Dado[14])) then
        Result := false;
    end;
  end
  else
  if Length(Dado) <> 0 then
    Result := false;
end;

function ValidaMes(MesAno:string):string;
var
  NumMes:string;
  mm:integer;
begin
  NumMes:=copy(MesAno,1,2);
  mm:=StrToInt(NumMes);
  case mm of
    01: Result := '31';
    02: begin // testar se é ano bissexto
          if IsLeapYear(StrToInt(copy(MesAno,4,4))) = true then
            Result := '29'
          else
            Result := '28';
        end;
    03: Result := '31';
    04: Result := '30';
    05: Result := '31';
    06: Result := '30';
    07: Result := '31';
    08: Result := '31';
    09: Result := '30';
    10: Result := '31';
    11: Result := '30';
    12: Result := '31';
  else
    ShowMessage('Mês inválido!');
  end;
end;

function RetornaAlfaNumericoEspecial(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if (Valor[i] in ['0'..'9', 'a'..'z', 'A'..'Z', '-', '/', '.', '_', ' ', 'à', 'â', 'ê', 'ô', 'û', 'ã', 'õ', 'á', 'é', 'í', 'ó' ,'ú', 'ç', 'ü', 'À', 'Â', 'Ê', 'Ô', 'Û', 'Ã', 'Õ', 'Á', 'É', 'Í', 'Ó', 'Ú', 'Ç', 'Ü']) then
       Result := Result + Valor[i];
end;

procedure GravaRegistro(Raiz: HKEY; Chave, Valor, Endereco: string; vpAdicionarAspas : Boolean = False);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create(KEY_WRITE); // Chama o construtor do objeto
  Registro.RootKey := Raiz; //Define a chave raiz
  Registro.OpenKey(Chave, True); //Cria a chave
  if vpAdicionarAspas then
       Registro.WriteString(Valor, '"' + Endereco + '"') //Grava o endereço da sua aplicação no Registro
  else Registro.WriteString(Valor, Endereco);
  Registro.CloseKey; // Fecha a chave e o objeto
  Registro.Free;
end;

procedure ApagaRegistro(Raiz: HKEY; Chave, Valor : string; vpDeletarRegistro : Boolean = False);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create(KEY_WRITE); // Chama o construtor do objeto
  Registro.RootKey := Raiz;
  if vpDeletarRegistro then
    Registro.DeleteValue(Valor)
  else
  begin
    Registro.OpenKey(Chave, True); //Cria a chave
    Registro.DeleteValue(Valor); //Grava o endereço da sua aplicação no Registro
    Registro.CloseKey; // Fecha a chave e o objeto
  end;
  Registro.Free;
end;

function DataExtenso(vpData : TDate):String;
var
  viAno,
  viMes,
  viDia : word;
  viAnoExtenso,
  viMesExtenso,
  viDiaExtenso: string;
begin
  DecodeDate(vpData, viAno, viMes, viDia);
  viDiaExtenso := Trim(ValorExtenso(viDia, '', '', 4));
  viMesExtenso := Mes[viMes];
  viAnoExtenso := Trim(ValorExtenso(viAno, '', '', 4));

  Result :=  viDiaExtenso + ' dias do mês de ' + viMesExtenso + ' do ano de ' + viAnoExtenso;
end;

function FormataCodigoImagem(vpNumero : Integer) : String;
begin
  Result := FormatFloat('0000000',vpNumero);
end;

function FormataPastaImagem(vpNumero : Integer) : String;
begin
  Result := Copy(FormatFloat('0000000',vpNumero),1,4);
end;

Function LerRegistro(Raiz: HKEY; Chave, Variavel : string):String;
var
  Reg : TRegistry;
  retorno : String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := Raiz;
    Reg.OpenKey(Chave, False);
    retorno := Reg.ReadString(variavel);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  Result := retorno;
end;

Function PegarUsuarioWindows:String;
var
  BufSize :cardinal;
  UserName :array[0..127] of ansichar;
begin
  BufSize := SizeOf(UserName);
  if BOOL(GetUserName(UserName, BufSize)) then
    Result := UserName;
end;

Function GerarSenhaWeb:String;
var
  vSenhaWeb, vStrBaseSenhaWeb : String;
  i : Integer;
begin
  vSenhaWeb := '';
  vStrBaseSenhaWeb := '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  for i := 1 to 6 do
    vSenhaWeb := vSenhaWeb + vStrBaseSenhaWeb[Random(Length(vStrBaseSenhaWeb) + 1)];
  Result := vSenhaWeb;
end;

function Arredondamento(Valor: Currency;
  Decimais: integer): Currency;
var
  V64: Int64 absolute Result;
  Decimals: Integer;
begin
  Result := Valor;
  Decimals := V64 mod 100;
  Dec(V64, Decimals);
  case Decimals of
    -99 .. -50 : Dec(V64, 100);
    50 .. 99 : Inc(V64, 100);
  end;
end;

Function PegarAnoMes(vpData : String):String;
var
  viMes, viAno : String;
begin
  viMes  := copy(vpData,4,2);
  viAno  := copy(vpData,7,4);
  Result := viAno+viMes;
end;

function InputQueryAux(const ACaption, APrompt: string;
    var Value: string; Tipo : String): Boolean;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

var
  Form: TForm;
  Prompt: TLabel;
  //Edit: TcxDateEdit;
  Edit : TcxCustomTextEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      if Tipo = 'D' then
        Edit := TcxdateEdit.Create(Form)
      else
      if Tipo = '$' then
      begin
        Edit := TcxCurrencyEdit.Create(Form);
        TcxCurrencyEdit(Edit).Properties.DisplayFormat := ',#0.00';
        TcxCurrencyEdit(Edit).Properties.EditFormat    := ',#0.00';
      end;

      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        //MaxLength := 255;
        Text := Value;
        SelectAll;
      end;

      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;          
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

function TiraCaractere (vpValor, Caractere : String):String;
begin
  Result := vpValor;
  while Pos(Caractere,Result) <> 0 do
     Delete(Result,Pos(Caractere,Result),1);
end;

function SomaHoras(Hora, HoraSoma :String):String;
var
  hh, mm, ss :integer;
  vHora, vMinuto, vSegundos :integer;
  viHoraSoma : String;
begin
  viHoraSoma := HoraSoma;
  hh:= StrToInt(Copy(Hora, 1, 2)) + StrToInt(Copy(HoraSoma, 1, pos(':', viHoraSoma)-1));
  delete(viHoraSoma, 1, Pos(':',viHoraSoma));

  mm:= StrToInt(Copy(Hora, 4, 2)) + StrToInt(Copy(viHoraSoma, 1, 2));
  ss:= StrToInt(Copy(Hora, 7, 2)) + StrToInt(Copy(viHoraSoma, 4, 2));

  vSegundos   := ss mod 60;
  vMinuto     := mm mod 60 + (ss div 60);
  vHora       := hh + (mm div 60);

  Result:= FormatFloat('00:', vHora) + FormatFloat('00:', vMinuto) + FormatFloat('00', vSegundos);
end;

Function RetornatQdtPalavras(str : string) : integer;
var
  count : integer;
  i : integer;
  len : integer;
begin
  len := length(str);
  count := 0;
  i := 1;
  while i <= len do
  begin
    while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
      inc(i);

    if i <= len then
      inc(count);

    while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
      inc(i);
  end;
  RetornatQdtPalavras := count;
end;

function NomeEstacao: string;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function IdadeCerta(Data1:TDateTime; Data2:String;  SomenteAno : Boolean = False): String;
var

iDia, iMes, iAno, fDia, fMes, fAno : Word;

nDia, nMes, nAno : Double;

 viDateFim : TDate;

begin

  if Data2 <> '' then
       viDateFim := StrToDate(Data2)
  else viDateFim := Date;

  DecodeDate(Data1,iAno,iMes,iDia);
  DecodeDate(viDateFim,fAno,fMes,fDia);


    nAno := fAno - iAno;

    if nAno > 0 then

    if fMes < iMes then nAno := nAno - 1

    else if(fMes = iMes)and(fDia < iDia)then nAno := nAno - 1;



    if fMes < iMes then

    begin

            nMes := 12 - (iMes-fMes);

            if fDia < iDia then nMes := nMes - 1;

    end

    else  if fMes = iMes then

    begin

            nMes := 0;

            if fDia < iDia then nMes := 11;

    end

    else if fMes > iMes then

    begin

            nMes := fMes - iMes;

            if fDia < iDia then nMes := nMes - 1;

    end;

    nDia := 0;



    if fDia > iDia then nDia := fDia - iDia;

    if fDia < iDia then nDia := (viDateFim-IncMonth(viDateFim,-1))-(iDia-fDia);

    Result := '';


    if nAno = 1 then Result := FloatToStr(nAno)+ ' Ano '

    else if nAno > 1 then Result := FloatToStr(nAno)+ ' Anos ';


    if SomenteAno then
      exit;

    if nMes = 1 then Result := Result + FloatToStr(nMes)+ ' Mês '

    else if nMes > 1 then Result := Result + FloatToStr(nMes)+ ' Meses ';



    if nDia = 1 then Result := Result + FloatToStr(nDia)+ ' Dia '

    else if nDia > 1 then Result := Result + FloatToStr(nDia)+ ' Dias ';

end;

function GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
      i : Integer;
      Name : String;
begin
  nsize := 255;
  Name := '';
  SetLength(ipbuffer,nsize);
  if GetComputerName(pchar(ipbuffer),nsize) then
    for I := 1 to Length(ipbuffer) do
    begin
      if ipbuffer[i] in ['1'..'9','a'..'z', 'A'..'Z'] then
         Name := Name + ipbuffer[i]
      else
        if ipbuffer[i] = '#' then
          break;
    end;
    result := Name;
end;

function RetirarPontuacaoFinalTexto(vpTexto : String):String;
var
  viChar : String[1];
begin
  Result := Trim(vpTexto);

  if Result = '' then
    exit;
  repeat
    viChar := RemoveAcentos(Result[Length(Result)]);
    if not (viChar[1] in ['A'..'Z', 'a'..'z', '0'..'9']) then
      Result := Copy(Result, 1, Length(Result) - 1);
  until (viChar[1] in ['A'..'Z', 'a'..'z', '0'..'9']);
end;

procedure MudarImpressora(vpPortaImp, vpNomeTrocar : String; vpIndex : integer = 0; vpUSBNome : String = '');
var
  I, viPos, viImpressoraAtual : Integer;
  viTextoBusca, viNomeImpressora : String;
  viFlag : Boolean;
begin

  // Volta para a impressora Padrão
  viFlag := True;
  if (vpPortaImp <> '') then
  begin
    viImpressoraAtual := Printer.PrinterIndex;
    for I := 0 to (Printer.printers.Count-1) do
    begin
      Printer.PrinterIndex := I;
      if (GetCurrentPrinterPort = vpPortaImp) and
         ((vpIndex = 0) or ((vpIndex > 0) and (vpIndex = Printer.PrinterIndex))) then
      begin
        if (vpUSBNome = '') or (pos(vpUSBNome, printer.Printers[Printer.PrinterIndex]) > 0) then
        begin
          viFlag := False;
          Break;
        end;
      end;
    end;

    if viFlag then
      Printer.PrinterIndex := viImpressoraAtual;
  end;

  // Verifica se a impressora padrão esta setada para trocar por outra. (Troca somente dentro do sistema)
  viPos := pos(';', vpNomeTrocar);
  if  viPos > 0 then
  begin
    viTextoBusca     := copy(vpNomeTrocar, 1, viPos-1);
    viNomeImpressora := copy(vpNomeTrocar, viPos+1, 50);

    if pos(viTextoBusca, printer.Printers[Printer.PrinterIndex]) > 0 then
      Printer.PrinterIndex := printer.Printers.IndexOf(viNomeImpressora);
  end;
end;

function GetExtArquivo(vpArquivo : String) : String;
var
  viExtensao: string;
begin
  viExtensao := ExtractFileExt(vpArquivo);
  Delete(viExtensao, 1, 1);
  Result     := viExtensao;
end;

function PegarNumeroLetra(vpValor, vpTipoValor : string) : String;
var
  i : integer;
  viResultado : string;
begin
  for i := 1 to length(vpValor) do
  begin
    if vpTipoValor = 'I' then
    begin
      if (vpValor[i] in ['0'..'9']) then
        viResultado := viResultado + vpValor[i];
    end
    else
    begin
      if not (vpValor[i] in ['0'..'9']) then
        viResultado := viResultado + vpValor[i];
    end;
  end;
  PegarNumeroLetra := viResultado;
end;

Function VerificarDia(vpData, vpDia : String):String;
var
  viMes, viAno, viDia : string;
begin
  viDia := copy(vpData,1,2);
  viAno := copy(vpData,7,4);
  viMes := copy(vpData,4,2);

  if viMes = '02' then
  begin
    if AnoBisexto(StrToInt(viAno)) then
         viDia := '29'
    else viDia := '28';
  end
  else
    if StrToInt(viMes) in [1,3,5,7,8,10,12] then
         viDia := '31'
    else viDia := '30';

  if vpDia > viDia then
       Result := viDia
  else Result := vpDia;
end;

procedure MontarDataInicioFinal(vpData : String; var vpData1, vpData2 : string; vpDividor :String = '.'; vpMes : String = '');
var
  viMes, viAno, viDia : string;
begin
  if vpMes = '' then
       viMes := copy(vpData,4,2)
  else viMes := vpMes;
  viAno := copy(vpData,7,4);

  if viMes = '02' then
  begin
    if AnoBisexto(StrToInt(viAno)) then
         viDia := '29'
    else viDia := '28';
  end
  else
    if StrToInt(viMes) in [1,3,5,7,8,10,12] then
         viDia := '31'
    else viDia := '30';

  vpData1 := '01'+vpDividor+viMes+vpDividor+viAno;
  vpData2 := viDia+vpDividor+viMes+vpDividor+viAno;
end;

function CalcularDataVencimento(vpData: TDate; vpTipo, vpQtd : integer):TDate;
var
  viMes, viDia, viData : string;
  viAno  : integer;

  Function CalculoMensal:TDate;
  begin
    viMes := copy(DateToStr(vpData),4,2);
    viAno := StrToInt(copy(DateToStr(vpData),7,4));

    viAno := StrToInt(viMes)+vpQtd-1;
    viAno := trunc(viAno/12);
    viMes := IntToStr((StrToInt(viMes)+vpQtd)-(viAno*12));

    viAno := StrToInt(copy(DateToStr(vpData),7,4))+viAno;
    if Length(viMes) = 1 then
      viMes := '0'+viMes;

    viDia  := copy(DateToStr(vpData),1,2);
    viData := viDia+'/'+viMes+'/'+IntToStr(viAno);
    Result := StrToDate(VerificarDia(viData, viDia)+'/'+viMes+'/'+IntToStr(viAno));
  end;

  Function CalculoTrimestral:TDate;
  begin
    viMes := copy(DateToStr(vpData),4,2);
    viAno := StrToInt(copy(DateToStr(vpData),7,4));

    viAno := StrToInt(viMes)+(vpQtd*3)-1;
    viAno := trunc(viAno/12);
    viMes := IntToStr((StrToInt(viMes)+(vpQtd*3))-(viAno*12));

    viAno := StrToInt(copy(DateToStr(vpData),7,4))+viAno;
    if Length(viMes) = 1 then
      viMes := '0'+viMes;

    viDia  := copy(DateToStr(vpData),1,2);
    viData := viDia+'/'+viMes+'/'+IntToStr(viAno);
    Result := StrToDate(VerificarDia(viData, viDia)+'/'+viMes+'/'+IntToStr(viAno));
  end;

  Function CalculoAnual:TDate;
  begin
    viMes := copy(DateToStr(vpData),4,2);
    viAno := StrToInt(copy(DateToStr(vpData),7,4));

    viAno  := (viAno+vpQtd);
    viDia  := copy(DateToStr(vpData),1,2);
    viData := viDia+'/'+viMes+'/'+IntToStr(viAno);
    Result := StrToDate(VerificarDia(viData, viDia)+'/'+viMes+'/'+IntToStr(viAno));
  end;
begin
  Case vpTipo of
    2   : Result := (7*vpQtd)+vpData;
    3   : Result := (15*vpQtd)+vpData;
    4   : Result := CalculoMensal;
    5   : Result := CalculoAnual;
    6   : Result := CalculoTrimestral;
  end;
end;

procedure InserirImagemTexto(vpArquivoImagem, vpVariavel : string; vpWptTexto : TWPRichText);
var
  Img : TImage;
begin
  vpWptTexto.Finder.ToStart;
  vpWptTexto.CPPosition := $0;
  if vpWptTexto.Finder.Next(vpVariavel) then
  begin
    vpWptTexto.Finder.SelectText;
    vpWptTexto.ClearSelection(True);
    vpWptTexto.CPPosition := vpWptTexto.SelStart;
  end
  else vpWptTexto.CPPosition := $FFFFF;

  Img := TImage.Create(nil);
  Img.Picture.LoadFromFile(vpArquivoImagem);
  vpWptTexto.TextObjects.InsertCopy(Img.Picture.Graphic);

  vpWptTexto.ReformatAll;
  Img.Free;
end;

procedure ConverterTextoPDF(var vpWptTexto : TWPRichText; viPastaDestino, vpArquivoDestino : string);
var
  viWp  : TWPCustomRtfEdit;
  viPdf : TWPPDFExport;
  viPasta : String;
begin
  viPasta := ExtractFilePath(Application.ExeName);
  vpWptTexto.DeleteTrailingSpace(true);
  vpWptTexto.SaveToFile(viPasta+'PdfTemp.rtf');
  viWp  := TWPCustomRtfEdit.CreateDynamic;
  viPdf := TWPPDFExport.Create(nil);
  try
    viPdf.Source     := viWp;
    viPdf.AutoLaunch := False;

    if viPastaDestino = '' then
    begin
      if not DirectoryExists(viPasta+'PDF') then
        MkDir(viPasta+'PDF');
      viPdf.Filename := viPasta+'PDF\'+ vpArquivoDestino+'.pdf';
    end
    else viPdf.Filename := viPastaDestino +'\'+ vpArquivoDestino+'.pdf';

    viWp.LoadFromFile(viPasta+'PdfTemp.rtf', True);
//    viWp.ReformatAll(true);
    viPdf.Print;
  finally
    FreeAndNil(viWp);
    FreeAndNil(viPdf);
  end;
end;

{Criar e Exibir os fomulários evitando efeito de montagem no mesmo}
procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False);
begin
  with Application do
  begin
    if not FormModal then
    begin
      LockWindowUpdate(Handle);
      if TComponent(Reference) = nil then
      begin
        CreateForm(ClasseForm, Reference);
        TForm(Reference).FormStyle   := fsMDIChild;
        TForm(Reference).WindowState := wsMaximized;
      end;

      TForm(Reference).Show;
      LockWindowUpdate(0);
    end
    else
    begin
      if TComponent(Reference) = nil then
         CreateForm(ClasseForm, Reference);

      TForm(Reference).WindowState := wsNormal;
      if vpTop then
      begin
        TForm(Reference).FormStyle := fsStayOnTop;
        TForm(Reference).Show;
      end
      else
      begin
        TForm(Reference).FormStyle := fsNormal;
        TForm(Reference).ShowModal;
      end;
    end;
  end;
end;

function JpgToBmp(MyJPEG : TJPEGImage): TBitmap;
var
  MyBMP : TBitmap;
begin
  Result := nil;
  with MyJPEG do
  begin
    try
      MyBMP := TBitmap.Create;
      with MyBMP do
      begin
        Width := MyJPEG.Width;
        Height := MyJPEG.Height;
        Canvas.Draw(0,0,MyJPEG);
      end;
      Result := MyBMP;
    finally

    end;
  end;
end;

function CriaJPeg(s : TMemoryStream):TJPEGImage;
begin
   if s <> nil then
   begin
     Result := TJPEGImage.Create;
     Result.LoadFromStream(s);
   end
   else Result := nil;
end;


Function Occurs(T, S : String) : Integer;
var P : Integer;
begin
  Result := 0;
  P := Pos (T, S);
  while P > 0 do
  begin
    Inc (Result);
    S := Copy (S, P + Length (T), 255);
    P := Pos (T, S);
  end;
End;

Procedure Idade;
var Ano1,Mes1,Ano2,Mes2,Dia1,Dia2:Word;
begin
   Ano2 := 0;
   Ano1 := 0;
   Mes2 := 0;
   Mes1 := 0;
   Dia2 := 0;
   Dia1 := 0;
   DecodeDate(Data2,Ano2,Mes2,Dia2);
   DecodeDate(Data1,Ano1,Mes1,Dia1);
  if Dia2 < Dia1 then
    if Mes2 > 1 then
    Dec(Mes2)
    else begin
       Mes2:=12;
       Dec(Ano2);
    end;
  if Mes2 < Mes1 then
  begin
    Dec(Ano2);
    Inc(Mes2,12);
  end;
  Anos:=Ano2-Ano1;
  Meses:=Mes2-Mes1;
end;

Procedure DigitaInteiro(var Tecla:char);
begin
   if not (Tecla in ['0'..'9',#8,#13]) then
      Tecla:= #0;
end;

Procedure Digitafloat( var Tecla:char);
begin
    if not (Tecla in ['0'..'9',#8,',']) then
     Tecla:= #0;
end;

procedure DigitaFone(Var Tecla : Char);
begin
  if not (Tecla in ['0'..'9',#8,'(', ')', '-']) then
     Tecla:= #0;
end;

Function AnoBisexto(Ano:Integer):Boolean;
begin
   if (Ano mod 4 <> 0 ) then
      Result := false
      else if (Ano mod 100 <> 0 ) then
              Result := true
           else if (Ano mod 400 <> 0 ) then
                   Result := false
                else Result := true;
end;

function ValidarData(Data :String) :boolean;
begin
   try
      Result := True;
      if Data <> '  /  /    ' then
         StrToDate(Data);
   except
      On EConvertError do
         Result := False;
   end;
end;

Function TrocaPtoPBarra(Valor: string): String;
var i:integer;
begin
  if Trim(Valor) <> '' then
  begin
     for i := 0 to Length(Valor) do
     begin
        if Valor[i] = '.' then
           Valor[i]:='/';
     end;
   end else Valor := '0';
   Result := Valor;
end;

function TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
  if Trim(Valor) <> '' then
  begin
     for i := 0 to Length(Valor) do
     begin
        if Valor[i] = ',' then
           Valor[i]:='.';
     end;
   end else Valor := '0';
   Result := Valor;
end;

function TrocaPtoPVirg(Valor: string): String;
var i:integer;
begin
  if Trim(Valor) <> '' then
  begin
     for i := 0 to Length(Valor) do
     begin
        if Valor[i] = '.' then
           Valor[i]:=',';
     end;
   end else Valor := '0';
   Result := Valor;
end;

function TrocaBarraPPonto(Valor: string): String;
var
  i:integer;
begin
  if Trim(Valor) <> '' then
  begin
     for i := 0 to Length(Valor) do
     begin
        if Valor[i] = '/' then
           Valor[i]:='.';
     end;
   end else Valor := '0';
   Result := Valor;
end;

function TrocaPtoVirgPVirg(Valor: string): String;
var i:integer;
begin
  if Trim(Valor) <> '' then
  begin
     for i := 0 to Length(Valor) do
     begin
        if Valor[i] = ';' then
           Valor[i]:=',';
     end;
   end else Valor := '0';
   Result := Valor;
end;

Function FormataCNPJ(CNPJ : String): String;
var i : integer;
begin
   Result := '';
   for i := 1 to Length(CNPJ) do
   begin
      if Pos(CNPJ[i], '/-.' ) > 0 then
         Delete(CNPJ, i, 1);
   end;
   Result := Copy(CNPJ,1,2)+ '.' + Copy(CNPJ,3,3) + '.' + Copy(CNPJ,6,3) + '/' + Copy(CNPJ,9,4) + '-' + Copy(CNPJ,13,2);
end;

Function FormataCPF(CPF : string): string;
begin
  Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);
end;

function TestaCnpj(xCNPJ: String):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
begin
   d1 := 0;
   d4 := 0;
   xx := 1;
   for nCount := 1 to Length( xCNPJ )-2 do
   begin
      if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
      begin
         if xx < 5 then
         begin
            fator := 6 - xx;
         end
         else begin
            fator := 14 - xx;
         end;
         d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         if xx < 6 then
         begin
            fator := 7 - xx;
         end
         else begin
            fator := 15 - xx;
         end;
         d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         xx := xx+1;
      end;
   end;
   resto := (d1 mod 11);
   if resto < 2 then
      begin
        digito1 := 0;
      end
      else
        begin
          digito1 := 11 - resto;
        end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
        digito2 := 0;
      end
      else
        begin
          digito2 := 11 - resto;
        end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
      begin
        Result := False;
      end
      else
        begin
          Result := True;
        end;
end;

function TestaCpf(num: string): boolean;
var n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
    d1,d2: integer;
    digitado, calculado: string;
begin
   if Length(num) < 11 then
   begin
      result := false;
      exit;
   end;
   n1:=StrToInt(num[1]);
   n2:=StrToInt(num[2]);
   n3:=StrToInt(num[3]);
   n4:=StrToInt(num[4]);
   n5:=StrToInt(num[5]);
   n6:=StrToInt(num[6]);
   n7:=StrToInt(num[7]);
   n8:=StrToInt(num[8]);
   n9:=StrToInt(num[9]);
   d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
   d1:=11-(d1 mod 11);
   if d1>=10 then
      d1:=0;
      d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
      d2:=11-(d2 mod 11);
      if d2>=10 then
         d2:=0;
         calculado:=inttostr(d1)+inttostr(d2);
         digitado:=num[10]+num[11];
         if calculado=digitado
            then TestaCpf:=true
            else TestaCpf:=false;
   vgCpfSugerido := calculado;
end;

function RetornaCPFCNPJFormatado(Valor : String) : String;
begin
  if Length(Valor) = 11 then
     Result := FormataCPF(Valor)
  else
  if Length(Valor) = 14 then
     Result := FormataCNPJ(Valor)
  else
     Result := Valor;
end;

function Cifrar(Valor : String): String;
var i : Integer;
begin
  Result := Valor;
  for i := 1 to Length(Valor) do
      Result[i] := Chr(Ord(Result[i]) + 1);
end;

function TiraBarra (Campo : String):String;
begin
  Result := Campo;
  while Pos('/',Result) <> 0 do
     Delete(Result,Pos('/',Result),1);
end;

function RetBrancos(BRANCOS:string;QUANT:integer;Tipo:Integer = 0):String;
var
  I,Tamanho:integer;
  aux: string;
begin
  aux := BRANCOS;
  Tamanho := length(BRANCOS);
  BRANCOS := '';
  
  for I:=1 to quant-tamanho do
      BRANCOS := BRANCOS+' ';
      
   if Tipo = 0 then
      aux := aux +BRANCOS
   else aux := BRANCOS + aux;
   
  RetBrancos := aux;
end;

function RetZeros(Zeros:string;QUANT:integer):String;
var
  I,Tamanho:integer;
  aux: string;
begin
  aux := Zeros;
  Tamanho := length(Zeros);
  Zeros := '';
  for I:=1 to quant-tamanho do
    Zeros := '0' + Zeros;
  aux := Zeros + aux;
  RetZeros := aux;
end;

function RetornaIP : String;
var
  p : PHostEnt;
  s : array[0..128] of char;
  p2 : pchar;
begin
  GetHostName(@s, 128);
  p := GetHostByName(@s);
  p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  Result := p2;
end;

function DifHora(Inicio,Fim : String):String;
{Retorna a diferença entre duas horas}
var
  FIni,FFim : TDateTime;
begin
  Fini := StrTotime(Inicio);
  FFim := StrToTime(Fim);
 If (Inicio > Fim) then
 begin
   Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
 end
 else begin
      Result := TimeToStr(FFim-Fini);
 end;
end;

function IdadeAtual(Nasc : TDate): Integer;
Var AuxIdade, Meses : String;
  MesesFloat : Real;
  IdadeInc, IdadeReal : Integer;
begin
  AuxIdade := Format('%0.2f', [(Date - Nasc) / 365.6]);
  Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));
  if AuxIdade = '0' then
  begin
    Result := 0;
    Exit;
  end;
  if Meses[1] = '-' then
  begin
    Meses := FloatToStr(StrToFloat(Meses) * -1);
  end;
  Delete(Meses, 1, 2);
  if Length(Meses) = 1 then
  begin
    Meses := Meses + '0';
  end;
  if (Meses <> '0') And (Meses <> '') then
  begin
    MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30.47)
  end
  else
  begin
    MesesFloat := 0;
  end;
  if MesesFloat <> 12 then
  begin
    IdadeReal := Trunc(StrToFloat(AuxIdade));
  end
  else
  begin
    IdadeInc := Trunc(StrToFloat(AuxIdade));
    Inc(IdadeInc);
    IdadeReal := IdadeInc;
  end;
  Result := IdadeReal;
end;

function RetornaAlfaNumerico(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if not (Valor[i] in ['0'..'9']) then
       Result := Result + Valor[i];
end;

function RetornaNumerico(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if Valor[i] in ['0'..'9'] then
       Result := Result + Valor[i];
end;

function RetirarBarra(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if Valor[i] <> '/' then
       Result := Result + Valor[i];
end;

function RetirarPonto(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if Valor[i] in ['0'..'9',','] then
       Result := Result + Valor[i];
end;

Function IdadeAno(Nascimento:TDateTime; Idade2 : String = '') : Integer;
  Type
    Data = Record
        Ano : Word;
        Mes : Word;
        Dia : Word;
    End;
  Const
     Qdm:String = '312831303130313130313031'; // Qtde dia no mes
Var
  Dth : Data; // Data de hoje
  Dtn : Data; // Data de nascimento
  anos, meses : Shortint; // Usadas para calculo da idade
begin
  if Idade2 <> '' then
       DecodeDate(StrtoDate(Idade2),Dth.Ano,Dth.Mes,Dth.Dia)
  else DecodeDate(Date,Dth.Ano,Dth.Mes,Dth.Dia);
  DecodeDate(Nascimento,Dtn.Ano,Dtn.Mes,Dtn.Dia);
  anos := Dth.Ano - Dtn.Ano;
  meses := Dth.Mes - Dtn.Mes;

  if meses < 0 then
  begin
    Dec(anos);
    meses := meses+12;
  end;
  Result := anos;
end;

Function IdadeN(Nascimento:TDateTime; Idade2 : String = ''; SomenteAno : Boolean = False) : String;
  Type
    Data = Record
        Ano : Word;
        Mes : Word;
        Dia : Word;
    End;
  Const
     Qdm:String = '312831303130313130313031'; // Qtde dia no mes
Var
  Dth : Data; // Data de hoje
  Dtn : Data; // Data de nascimento
  anos, meses, dias, nrd : Shortint; // Usadas para calculo da idade
  sAno, sMes, sDia : String;
begin
  if Idade2 <> '' then
       DecodeDate(StrtoDate(Idade2),Dth.Ano,Dth.Mes,Dth.Dia)
  else DecodeDate(Date,Dth.Ano,Dth.Mes,Dth.Dia);
  DecodeDate(Nascimento,Dtn.Ano,Dtn.Mes,Dtn.Dia);
  anos := Dth.Ano - Dtn.Ano;
  meses := Dth.Mes - Dtn.Mes;
  if meses < 0 then
  begin
    Dec(anos);
    meses := meses+12;
  end;
  dias := Dth.Dia - Dtn.Dia;
  if dias < 0 then
  begin
    nrd := StrToInt(Copy(Qdm,(Dth.Mes-1)*2-1,2));
    if ((Dth.Mes-1)=2) and ((Dth.Ano Div 4)=0) then
    begin
      Inc(nrd);
    end;
    dias := dias+nrd;
    meses := meses-1;
  end;

  if anos = 1 then
     sAno := ' Ano '
  else
    if anos = 0 then
         sAno := ''
    else sAno := ' Anos ';

  if meses < 2 then
     sMes := ' Mês '
  else
     sMes := ' Meses ';

  if dias < 2 then
     sDia := ' Dia '
  else
     sDia := ' Dias ';

  if sAno = '' then
    Result := IntToStr(meses) + sMes + IntToStr(dias) + sDia
  else
    if SomenteAno then
         Result := IntToStr(anos)+ sAno
    else Result := IntToStr(anos)+ sAno + IntToStr(meses) + sMes + IntToStr(dias) + sDia;
end;

Function RetNull(Valor : String) : String;
begin
  Result := Valor;
  if Trim(Valor) = '' then
     Result := 'Null';
end;

Function CompressString ( Source:String):String;
var
  ms :TMemoryStream;
  CompStream: TZCompressionStream;
begin
  Result := '';
  if (Source <> '') then
  begin
    ms := tMemoryStream.Create;
    CompStream := TZCompressionStream.Create (ms);
    CompStream.Write ( Source[1], Length(Source));
    CompStream.Free;
    ms.position := 0;
    SetLength(Result,Ms.size );
    ms.read ( Result[1],ms.size);
    ms.Free;

    CompStream := nil;
    ms := nil;
  end
  else
    Result := Source;
end;


Function DeCompressString ( Source:String):String;
var
  ms: tMemoryStream;
  Decomp: TZDecompressionStream;
  C: Char;
Begin
  Result := '';
  try
    if (Source <> '') and (Pos('{\rtf',Source) = 0) and (Pos('<?xml',Source) = 0) and (Source <> #0) then
    begin
      ms     := tMemoryStream.Create;
      ms.Write ( Source[1],Length(Source));
      ms.position := 0;
      try
        DeComp := TZDecompressionStream.Create (ms);
        while deComp.Read ( c ,1 ) <> 0 DO
        begin
          Result := Result + c;
        end;
      except
      end;
      decomp.free;
      ms.free;

      Decomp := nil;
      ms := nil;
    end
    else Result := Source;
  except
    Result := Source;
    decomp.free;
    ms.free;
  end;
End;

function Alltrim(Text: string): string;
begin
  while Pos(' ', Text) > 0 do
    Delete(Text, Pos(' ', Text), 1);
  Result := Text;
end;

function RemoveAcentos(sTexto: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ&´`.';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCUE   ';
var
  iCont : Integer;
begin
  for iCont := 1 to Length(sTexto) do
    if Pos(sTexto[iCont],ComAcento)<>0 Then
      sTexto[iCont] := SemAcento[Pos(sTexto[iCont],ComAcento)];
  Result := sTexto;
end;

function ChecaEstado(Dado : string) : boolean;
const
  Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao : integer;
begin
  Result := true;
  if Dado <> '' then
  begin
     Posicao := Pos(UpperCase(Dado),Estados);
     if (Posicao = 0) or ((Posicao mod 2) = 0) then
     begin
       Result := false;
     end;
  end;
end;

function ValorExtenso(nValor: Real; cTextoIni, cTextoFim: string; nMoeda: Integer): String;
var cTexto, cValor1, cPosicao1, cPosicao2, cPosicao3, cPosicao4: string;

  function StrZero(Num: Real; Zeros, Deci: integer): string;
  var tam, z: integer;
    res, zer: string;
  begin
    Str(Num: Zeros: Deci, res);
    res := Alltrim(res);
    tam := length(res);
    zer := '';
    for z := 1 to (Zeros - tam) do
      zer := zer + '0';
    Result := zer + res;
  end;

  procedure Converte(cNumero: string; nCasas: byte);
  var cNumero1, cNumero2, cNumero3, cNumero4: string;
  begin
    if cNumero = '000' then exit;
    cNumero1 := Copy(cNumero, 1, 1);
    cNumero2 := Copy(cNumero, 2, 1);
    cNumero3 := Copy(cNumero, length(cNumero), 1);
    cNumero4 := Copy(cNumero, length(cNumero) - 1, 2);
    if nCasas = 4 then
    begin
      if StrToInt(cPosicao1 + cPosicao2 + cPosicao3) <> 0 then
        cTexto := cTexto + 'e ';
    end;
    if cNumero1 <> '0' then
    begin
      if cTexto[Length(cTexto)] <> ' ' then
        cTexto := cTexto + ' ';

      if (cNumero4 = '00') and (cNumero1 = '1') then
        cTexto := cTexto + 'cem '
      else
      begin
        cTexto := Trim(cTexto);
        cTexto := cTexto +' '+ aCentena[StrToInt(cNumero1)];
      end;
    end;
    if (cNumero4 >= '10') and (cNumero4 <= '19') then
    begin
      if (cNumero1 <> '0') then
        cTexto := cTexto + 'e ' + aDezena2[StrToInt(cNumero4) - 9]
      else
      begin
        cTexto := Trim(cTexto);
        cTexto := cTexto +' '+ aDezena2[StrToInt(cNumero4) - 9];
      end;
    end;
    if cNumero2 >= '2' then
    begin
      if cNumero1 <> '0' then
        cTexto := cTexto + 'e ' + aDezena[StrToInt(cNumero2)]
      else
      begin
        cTexto := Trim(cTexto);
        cTexto := cTexto +' '+ aDezena[StrToInt(cNumero2)];
      end;
    end;
    if (cNumero3 <> '0') and ((cNumero4 < '10') or (cNumero4 > '19')) then
    begin
      if (cNumero1 <> '0') or (cNumero2 <> '0') then
        cTexto := cTexto + 'e ' + aUnidade[StrToInt(cNumero3)]
      else
      begin
        cTexto := Trim(cTexto);
        cTexto := cTexto +' '+ aUnidade[StrToInt(cNumero3)];
      end;
    end;
    case nCasas of
      1: begin
          if StrToInt(cNumero) = 1 then
            cTexto := cTexto + aMilhar[2]
          else
            cTexto := cTexto + aMilhar[3];
        end;
      2: begin
          if StrToInt(cNumero) > 0 then
            cTexto := cTexto + aMilhar[1];
        end;
      3: begin
          if StrToInt(cPosicao1 + cPosicao2 + cPosicao3) = 1 then
            cTexto := cTexto + aMoeda[cTipoMoeda, 1]
          else
            cTexto := cTexto + aMoeda[cTipoMoeda, 2];
        end;
      4: begin
          if StrToInt(cNumero) = 1 then
            cTexto := cTexto + aCentavo[1]
          else
            cTexto := cTexto + aCentavo[2];
        end;
    end;

  end;

begin
  cTexto := '';
  if nMoeda = 0 then
    cTipoMoeda := 3
  else
    cTipoMoeda := nMoeda;

  cValor1 := StrZero(nValor, 13, 2);
  cPosicao1 := Copy(cValor1, 2, 3);
  cPosicao2 := Copy(cValor1, 5, 3);
  cPosicao3 := Copy(cValor1, 8, 3);
  cPosicao4 := '0' + Copy(cValor1, (length(cValor1) - 1), 2);
  Converte(cPosicao1, 1);
  cTexto := cTextoIni + ' ' + TrimLeft(cTexto);
  Converte(cPosicao2, 2);
  if (StrToInt(cPosicao2) <> 0) and (StrToInt(cPosicao3) <> 0) and (StrToInt(cPosicao4) = 0) then
  begin
    cTexto := Trim(cTexto);
    cTexto := cTexto + ' e';
  end;
  Converte(cPosicao3, 3);
  if (StrToInt(cPosicao3) = 0) and (StrToInt(cPosicao1 + cPosicao2) <> 0) then
    cTexto := cTexto + aMoeda[cTipoMoeda, 2];
  Converte(cPosicao4, 4);

  cTexto := Trim(cTexto);
  Result := cTexto + ' ' + cTextoFim;
  if trim(Result) = '' then
    Result := 'zero';
end;

function Getcomputer: string;
var
  registro: Tregistry;
begin
  registro := tregistry.create;
  registro.RootKey := HKEY_LOCAL_MACHINE;
  registro.openkey('System\CurrentControlSet\Services\VXD\VNETSUP', false);
  result := registro.readstring('ComputerName');
  if Result = '' then
  begin
     registro.openkey('System\ControlSet001\Control\ComputerName\ActiveComputerName', False);
     result := registro.readstring('ComputerName');
  end;
  registro.Free;
end;

function GetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;

  URetCode: PChar;
  RetCode: char;
  I: integer;
  Lenum: PlanaEnum;
  _SystemID: string;
begin
  Result    := '';
  _SystemID := '';
  Getmem(NCB, SizeOf(TNCB));
  Fillchar(NCB^, SizeOf(TNCB), 0);

  Getmem(Lenum, SizeOf(TLanaEnum));
  Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

  Getmem(Adapter, SizeOf(TAdapterStatus));
  Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

  Lenum.Length    := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer  := Pointer(Lenum);
  NCB.ncb_length  := SizeOf(Lenum);
  RetCode         := Netbios(NCB);

  i := 0;
  repeat
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[I];
    RetCode          := Netbios(Ncb);

    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[I];
    // Must be 16
    Ncb.ncb_callname := '*               ';

    Ncb.ncb_buffer := Pointer(Adapter);

    Ncb.ncb_length := SizeOf(TAdapterStatus);
    RetCode        := Netbios(Ncb);
    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
    begin
      _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[5]), 2);
    end;
    Inc(i);
  until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  GetMacAdress := _SystemID;
end;

function ConvertChars(S: String): String;
const SChars = 'áéíóúàèìòùãõâêîôûçüÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕÇÜ';
      NChars = 'aeiouaeiouaoaeioucuAEIOUAEIOUAEIOUAOCU';
var i,aPos: Word;
begin
  for i:= 1 to Length(S) do
    begin
      aPos:= Pos(S[i],SChars);
      if aPos > 0 then S[i]:= NChars[aPos];
    end;
  Result:= S;
end;

function GetNomeArquivo(Nome : String):String;
begin
  Result := Nome;
  while Pos('\',Result) <> 0 do
     Delete(Result,1, Pos('\',Result));
end;

function Pos_N(SubStr, Str : String; P : Integer): Integer;
var i, Posicao : Integer;
begin
  Posicao := 0;
  for i := 1 to P do
  begin
    Posicao := Posicao + Pos(SubStr, Str);
    delete(Str, 1, Pos(SubStr, Str));
  end;
  Result := Posicao;
end;

function RetiraZerosEsquerda(Zeros:string):String;
var
  I,Tamanho:integer;
  aux: string;
  val : Boolean;
begin
  aux := Zeros;
  Tamanho := length(Zeros);
  Zeros := '';
  val := False;
  for I:=1 to tamanho do
    if val then
       Zeros := Zeros + aux[i]
    else if not val then
            if aux[i] <> '0' then
            begin
              Zeros := Zeros + aux[i];
              Val := True;
            end;
  RetiraZerosEsquerda := Zeros;
end;

function MaiusculoMinusculo(vpPalavra : string):String;

  function UpperNome(vpPalavraAux : string):string;
  var
    i, vpPos, viCount  : integer;
    viResult, viP : string;
  begin
    viCount := Length(vpPalavraAux);
    for i := 1 to viCount do
    begin
      vpPalavraAux := trim(vpPalavraAux);
      vpPos := pos(' ', vpPalavraAux);
      if vpPos > 0 then
      begin
        viP := copy(vpPalavraAux, 1, vpPos-1);
        if (viP <> 'das') and (viP <> 'dos') and (viP <> 'de') and (viP <> 'do') and (viP <> 'das') and (viP <> 'da') and
           (viP <> 'e') and (viP <> 'o') and (viP <> 'a') and (viP <> 'das') and (viP <> 'das') and (viP <> 'das') then
             viResult := viResult + ' '+ UpCase(viP[1]) + copy(viP,2,30)
        else viResult := viResult + ' '+viP;
        Delete(vpPalavraAux,1,vpPos);
      end
      else
      begin
         viResult := viResult +' '+ UpCase(vpPalavraAux[1]) + copy(vpPalavraAux,2,30);
         Result := viResult;
         Break;
      end;
    end;
  end;

begin
  if vpPalavra <> '' then
  begin
    // Passa para Minusculo
    vpPalavra := AnsiLowerCase(vpPalavra);

    // Transformar apenas a 1 letra para Maiusculo
    vpPalavra := UpperNome(vpPalavra);

    MaiusculoMinusculo := trim(vpPalavra);
  end;
end;

function DataHoraModificacao(Arquivo: String): TDateTime;
begin
  Result := 0;
  if FileExists(Arquivo) then
     Result := FileDateToDateTime(FileAge(Arquivo));
end;

Procedure CopyFiles(Origem, Destino : String);
begin
  CopyFile(Pchar(Origem), Pchar(Destino), true);
end;

function GetSerialHD : String;
var Serial:DWord;
    DirLen,Flags: DWord;
    DLabel : Array[0..11] of Char;
    DriverCorrente : string;
begin
  Try
    DriverCorrente := copy(ExtractFilePath(Application.ExeName),1,1);
    DriverCorrente := DriverCorrente+':\';
    GetVolumeInformation(PChar(DriverCorrente),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  Except
    Result :='';
  end;
end;

function TravaSistema(Valor, vpSerialMaster : String) : Boolean;
var
  Chave, SerialHD, ComputerName: String;
begin
  SerialHD  := GetSerialHD;

  Chave := Trim('I9@'+ SerialHD + '@Tri7');
  Result := Chave = Valor;
  if Not Result then
  begin
    if vpSerialMaster = SerialHD then
      Result := True
    else
      if pos(UpperCase(vpSerialMaster),GetComputerNameFunc) > 0 then
        Result := True;
  end;
end;

procedure ModificarDataSistema;
var
  FormatoData: PChar;
  FormatoDataBuff: array[0..9] of Char;
begin
  FormatoData := 'dd/MM/yyyy';
  SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, FormatoData);
end;

procedure SetarAtributosArquivo(vpArquivo : String; vpReadOnly, vpArchive, vpSysFile, vpHidden : Boolean);
var
  Attributes, NewAttributes: Word;
begin
  Attributes := FileGetAttr(vpArquivo);
  NewAttributes := Attributes;

  if vpReadOnly then
    NewAttributes := NewAttributes or SysUtils.faReadOnly
  else
    NewAttributes := NewAttributes and not SysUtils.faReadOnly;

  if vpArchive then
    NewAttributes := NewAttributes or faArchive
  else
    NewAttributes := NewAttributes and not faArchive;

  if vpSysFile then
    NewAttributes := NewAttributes or faSysFile
  else
    NewAttributes := NewAttributes and not faSysFile;

  if vpHidden then
    NewAttributes := NewAttributes or faHidden
  else
    NewAttributes := NewAttributes and not faHidden;

  if NewAttributes <> Attributes then
    FileSetAttr(vpArquivo, NewAttributes);
end;

Function VerifyBarCodeTable(iTypeSearch :Integer; sCaracter: String = ''; lBarCodePosition: Integer = 0 ): Variant;
//Função para retornar o valor correspondente na tabela dos códigos de barras
Var sBarCodeTable : Array [0..105] of String;
    liContador : integer;
begin
  sBarCodeTable[0] := '®';
  sBarCodeTable[1] := '!';
  sBarCodeTable[2] := Chr(34);
  sBarCodeTable[3] := '#';
  sBarCodeTable[4] := '$';
  sBarCodeTable[5] := '%';
  sBarCodeTable[6] := '&';
  sBarCodeTable[7] := '''';
  sBarCodeTable[8] := '[';
  sBarCodeTable[9] := ']';
  sBarCodeTable[10] := '*';
  sBarCodeTable[11] := '+';
  sBarCodeTable[12] := ',';
  sBarCodeTable[13] := '-';
  sBarCodeTable[14] := '.';
  sBarCodeTable[15] := '/';
  sBarCodeTable[16] := '0';
  sBarCodeTable[17] := '1';
  sBarCodeTable[18] := '2';
  sBarCodeTable[19] := '3';
  sBarCodeTable[20] := '4';
  sBarCodeTable[21] := '5';
  sBarCodeTable[22] := '6';
  sBarCodeTable[23] := '7';
  sBarCodeTable[24] := '8';
  sBarCodeTable[25] := '9';
  sBarCodeTable[26] := ':';
  sBarCodeTable[27] := ';';
  sBarCodeTable[28] := '<';
  sBarCodeTable[29] := ':=';
  sBarCodeTable[30] := '>';
  sBarCodeTable[31] := '?';
  sBarCodeTable[32] := '@';
  sBarCodeTable[33] := 'A';
  sBarCodeTable[34] := 'B';
  sBarCodeTable[35] := 'C';
  sBarCodeTable[36] := 'D';
  sBarCodeTable[37] := 'E';
  sBarCodeTable[38] := 'F';
  sBarCodeTable[39] := 'G';
  sBarCodeTable[40] := 'H';
  sBarCodeTable[41] := 'I';
  sBarCodeTable[42] := 'J';
  sBarCodeTable[43] := 'K';
  sBarCodeTable[44] := 'L';
  sBarCodeTable[45] := 'M';
  sBarCodeTable[46] := 'N';
  sBarCodeTable[47] := 'O';
  sBarCodeTable[48] := 'P';
  sBarCodeTable[49] := 'Q';
  sBarCodeTable[50] := 'R';
  sBarCodeTable[51] := 'S';
  sBarCodeTable[52] := 'T';
  sBarCodeTable[53] := 'U';
  sBarCodeTable[54] := 'V';
  sBarCodeTable[55] := 'W';
  sBarCodeTable[56] := 'X';
  sBarCodeTable[57] := 'Y';
  sBarCodeTable[58] := 'Z';
  sBarCodeTable[59] := '[';
  sBarCodeTable[60] := '\';
  sBarCodeTable[61] := ']';
  sBarCodeTable[62] := '^';
  sBarCodeTable[63] := '_';
  sBarCodeTable[64] := '`';
  sBarCodeTable[65] := 'a';
  sBarCodeTable[66] := 'b';
  sBarCodeTable[67] := 'c';
  sBarCodeTable[68] := 'd';
  sBarCodeTable[69] := 'e';
  sBarCodeTable[70] := 'f';
  sBarCodeTable[71] := 'g';
  sBarCodeTable[72] := 'h';
  sBarCodeTable[73] := 'i';
  sBarCodeTable[74] := 'j';
  sBarCodeTable[75] := 'k';
  sBarCodeTable[76] := 'l';
  sBarCodeTable[77] := 'm';
  sBarCodeTable[78] := 'n';
  sBarCodeTable[79] := 'o';
  sBarCodeTable[80] := 'p';
  sBarCodeTable[81] := 'q';
  sBarCodeTable[82] := 'r';
  sBarCodeTable[83] := 's';
  sBarCodeTable[84] := 't';
  sBarCodeTable[85] := 'u';
  sBarCodeTable[86] := 'v';
  sBarCodeTable[87] := 'x';
  sBarCodeTable[88] := 'w';
  sBarCodeTable[89] := 'y';
  sBarCodeTable[90] := 'z';
  sBarCodeTable[91] := '¡';
  sBarCodeTable[92] := '¢';
  sBarCodeTable[93] := '£';
  sBarCodeTable[94] := '¤';
  sBarCodeTable[95] := '¥';
  sBarCodeTable[96] := '¦';
  sBarCodeTable[97] := '§';
  sBarCodeTable[98] := '¨';
  sBarCodeTable[99] := '©';
  sBarCodeTable[100] := 'ª';
  sBarCodeTable[101] := '«';
  sBarCodeTable[102] := '¬';
  sBarCodeTable[103] := '{';
  sBarCodeTable[104] := '|';
  sBarCodeTable[105] := '}';

  if iTypeSearch = 0 then
 begin
    for liContador := 0 To 105 do
      if sCaracter = sBarCodeTable[liContador] Then
        VerifyBarCodeTable := liContador;
  end
  else VerifyBarCodeTable := sBarCodeTable[lBarCodePosition];
end;

function GenerateBarCode128AB(vExpression : String): Variant;
//Função para retornar a codificação do código de barras 128
var lWeighting,
    lResult,
    iContador: integer;
    sBarCode: String;
begin
  //Inicializa variáveis
  lWeighting := 1;
  lResult := 103;
  GenerateBarCode128AB := Null;

  //Primeiro caracter
  sBarCode := VerifyBarCodeTable(1, '', lResult);

  //Calcula dígito verificador módulo 103
  for iContador := 1 To Length(vExpression) do
  begin
    lResult := lResult + lWeighting * VerifyBarCodeTable(0, vExpression[iContador]);
    lWeighting := lWeighting + 1;
  end;

  lResult := lResult Mod 103;

  //Retorna código de barras
  GenerateBarCode128AB := sBarCode + vExpression + VerifyBarCodeTable(1, '', lResult) + '~';
end;

function RetirarCabecalhoRodapeTexto(wptTexto : TWPRichText):TWPRichText;
begin
  Result := TWPRichText.Create(nil);
  Result.AsString := wptTexto.AsString;

  Result.WorkOnText := wpHeader;
  Result.ClearHeaderFooter;
  Result.WorkOnText := wpBody;
end;

function GetCurrentPrinterHandle: THandle;
var
  Device, Driver, Port: array[0..255] of Char;
  Mode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, Mode);
  if not OpenPrinter(@Device, Result, nil) then
    RaiseLastWin32Error;
end;

function GetCurrentPrinterPort: string;
var
  Buffer: array of Char;
  Size: DWORD;
  H: THandle;
begin
  H := GetCurrentPrinterHandle;
  try
    WinSpool.GetPrinter(H, 2, nil, 0, @Size);
    SetLength(Buffer, Size);
    try
      WinSpool.GetPrinter(H, 2, @Buffer[0], Size, @Size);
      Result := PPrinterInfo2(@Buffer[0])^.pPortName;
    finally
      Buffer := nil;
    end;
  finally
    ClosePrinter(H);
  end;
end;

function RetornarEstadoExtenso(vpTexto : String):String;
begin
  if vpTexto = 'AC' then
    Result := 'Acre'
  else
    if vpTexto = 'AL' then
      Result := 'Alagoas'
  else
    if vpTexto = 'AM' then
      Result := 'Amazonas'
  else
    if vpTexto = 'AP' then
      Result := 'Amapá'
  else
    if vpTexto = 'BA' then
      Result := 'Bahia'
  else
    if vpTexto = 'CE' then
      Result := 'Ceara'
  else
    if vpTexto = 'DF' then
      Result := 'Distrito Federal'
  else
    if vpTexto = 'ES' then
      Result := 'Espírito Santo'
  else
    if vpTexto = 'GO' then
      Result := 'Goiás'
  else
    if vpTexto = 'MA' then
      Result := 'Maranhão'
  else
    if vpTexto = 'MG' then
      Result := 'Minas Gerais'
  else
    if vpTexto = 'MS' then
      Result := 'Mato Grosso do Sul'
  else
    if vpTexto = 'MT' then
      Result := 'Mato Grosso'
  else
    if vpTexto = 'PA' then
      Result := 'Pará'
  else
    if vpTexto = 'PB' then
      Result := 'Paraíba'
  else
    if vpTexto = 'PE' then
      Result := 'Pernambuco'
  else
    if vpTexto = 'PI' then
      Result := 'Piauí'
  else
    if vpTexto = 'PR' then
      Result := 'Paraná'
  else
    if vpTexto = 'RJ' then
      Result := 'Rio de Janeiro'
  else
    if vpTexto = 'RN' then
      Result := 'Rio Grande do Norte'
  else
    if vpTexto = 'RO' then
      Result := 'Rondônia'
  else
    if vpTexto = 'RR' then
      Result := 'Roraima'
  else
    if vpTexto = 'RS' then
      Result := 'Rio Grande do Sul'
  else
    if vpTexto = 'SC' then
      Result := 'Santa Catarina'
  else
    if vpTexto = 'SE' then
      Result := 'Sergipe'
  else
    if vpTexto = 'SP' then
      Result := 'São Paulo'
  else
    if vpTexto = 'TO' then
      Result := 'Tocantins'
  else Result := '';

end;

function StringBreak(Valor, Quebra: string; StringList: TStringList) : TStringList;
var
   EndOfCurrentString: byte;
begin
  repeat
    EndOfCurrentString := Pos(Quebra, Valor);
    if EndOfCurrentString = 0 then
    StringList.add(Valor)
    else
    StringList.add(Copy(Valor, 1, EndOfCurrentString - 1));
    Valor := Copy(Valor, EndOfCurrentString + length(Quebra),
    length(Valor) - EndOfCurrentString);
  until EndOfCurrentString = 0;
  result := StringList;
end;

function GetTipo(vfValor, vfTipo: String): String;
var
  viLista : TStringList;
  i : Integer;
begin
  viLista := TStringList.Create;
  Result  := '';

  StringBreak(vfTipo, ';',  viLista);
  if viLista.Count > 1 then
  begin
    for i := 0 to viLista.Count - 1 do
    begin
      if POS(viLista.Strings[i], vfValor) > 0 then
      begin
         Result := viLista.Strings[i];
         Break;
      end;
    end;
  end;
  FreeAndNil(viLista);
end;

function Similar_Text_2(Origem, Destino: string): Single;
var
 i: Integer;
 SimCar: Integer; // Similaridade de caracteres
 SimOrd: Integer; // Similaridade de ordem
 Lista: array of string;

 function Validacao: Boolean;
 begin
   Result := (Length(Origem) > 0) and (Length(Destino) > 0);
 end;

 procedure SimilaridadeCaracter;
 var
   j: Integer;
 begin
   SimCar := 0;
   for j := 1 to Length(Origem) do
     if Pos(Origem[j], Destino) > 0 then
       Inc(SimCar);
 end;

 procedure RemoveNaoCoincidentes(var s1, s2: string);
 begin
   i := 1;
   while i <= Length(s1) do
     if Pos(s1[i], s2) = 0 then
       Delete(s1, i, 1)
     else
       Inc(i);
 end;

 procedure GeraLista;
 var
   npalavras: Integer; // Número de "palavras"
   j, k: Integer;
 begin
   npalavras := (Sqr(Length(Origem)) + Length(Origem)) div 2;
   SetLength(Lista, npalavras);
   i := 0;
   for j := 1 to Length(Origem) do // j recebe o tamanho de cada palavra
     for k := 1 to Length(Origem) - j + 1 do
       // k recebe a posicao de cada palavra
     begin
       Lista[i] := Copy(Origem, k, j);
       Inc(i);
     end;
 end;

 procedure SimilaridadeOrdem;
 var
   j: Integer;
 begin
   SimOrd := 0;
   for j := 0 to Length(Lista) - 1 do
     if Pos(Lista[j], Destino) > 0 then
       Inc(SimOrd);
   Result := Result * (SimOrd / Length(Lista));
   SetLength(Lista, 0);
 end;
begin
 // 1. Transformar os textos para a mesma caixa e remover espaços em branco
 Origem := AnsiUpperCase(Trim(RemoveAcentos(Origem)));
 Destino := AnsiUpperCase(Trim(RemoveAcentos(Destino)));
 // 2a. Verificar se os textos são vazios: se forem, similaridade 0 e sai
 if not Validacao then
 begin
   Result := 0;
   Exit;
 end;
 // 2b. Verificar se os textos são iguais: se forem, similaridade 100%
 // e termina o processo
 if SameText(Origem, Destino) then
 begin
   Result := 100;
   Exit;
 end;
 // 3. para cada caracter do texto origem verificar se ele existe no texto
 // destino, e em caso positivo, incrementar 1 no contador de similaridade.
 SimilaridadeCaracter;
 // 4. o quociente contador / número de caracteres no destino indica a
 // similaridade sem considerar a ordem dos caracteres.
 Result := SimCar / Length(Destino);
 if Result = 0 then
   Exit;
 // 5. considerando a ordem, remove-se os caracteres da origem que não
 // existem no destino e os caracteres do destino que não existem na
 // origem, igualando os dois textos
 RemoveNaoCoincidentes(Origem, Destino);
 RemoveNaoCoincidentes(Destino, Origem);
 // 6. agora, com uma função que gere uma lista de "palavras" formadas
 // pelos caracteres da origem, da seguinte forma:
 // origem ajustada: "peto", com os caracteres não coincidentes removidos,
 // a lista gerada seria a seguinte
 // p, e, t, o, pe, et, to, pet, eto, peto: 4 caracteres = 10 palavras
 // map = m, a, p, ma, ap, map: 3 caracteres = 6 palavras
 // jorge = j, o, r, g, e, jo, or, rg, ge, jor, org, rge, jorg, orge,
 // jorge: 5 caracteres = 15 palavras
 // O número de "palavras" dentro da lista é definido pela fórmula
 // 0,5j^2+0,5j, onde j é o número de caracteres do texto origem ajustado.
 GeraLista;
 // Cada palavra da lista encontrada dentro da palavra destino ajustada
 // incrementa uma unidade no contador de similaridade de ordem.
 // A similaridade de ordem é o quociente do contador sobre o número de
 // palavras da lista.
 SimilaridadeOrdem;

 Result := Round(Result * 100);
end;
end.



