unit Rotinas;

interface

Uses windows, SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, Menus, SqlExpr, EncdDecd, Mask,
  ActnList, Grids, Variants, Provider, Messages, WPPDFWP, DB, jpeg, Winsock,
  ZLibEx, DBGrids, Registry, NB30, WPCTRRich, Clipbrd, WPRTEDefs, WPCTRMemo,
  Printers, WinSpool, StrUtils, math, cxTextEdit, System.NetEncoding,
  cxCurrencyEdit, cxCalendar, Consts, ImagXpr7_TLB, Tlhelp32, WPRTEDefsConsts,
  IniFiles, ShellAPI, IdBaseComponent, IdComponent, IdIPWatch,
  System.Generics.Collections, cxProgressBar, QrCode;

type
  TExecuteFunction = function:boolean of object;
  Tnumeros = array[1..10] of string[15];
  Tmoeda = array[1..9, 1..2] of string[20];

  TListCurrency = class(TList<Currency>)
  public
    class function Get(
      const vpValues: TArray<Currency>): TListCurrency;

    function GetMaxValue: Currency;
  end;

  DadosCadastroGeral = RECORD
    Tabela, Chave, Caption : string;
    Texto, Sistema, HabTabSistema, UsaCondicao : Boolean;
  end;

  TMetodoArredondamento = (maArimeticoSimetrico, maBanqueiro);

var
  vgFormClass: TFormClass = nil;

const
     EKeyViolation  = 'KEY VIOLATION';
     EFKeyViolation = 'FOREIGN KEY';

     {Valores por extenso}
     aUnidade: Tnumeros = ('um ', 'dois ', 'tr�s ', 'quatro ', 'cinco ', 'seis ', 'sete ', 'oito ', 'nove ', '');
     aDezena: Tnumeros = ('dez ', 'vinte ', 'trinta ', 'quarenta ', 'cinquenta ', 'sessenta ', 'setenta ', 'oitenta ', 'noventa ', '');
     aDezena2: Tnumeros = ('dez ', 'onze ', 'doze ', 'treze ', 'quatorze ', 'quinze ', 'dezesseis ',
                           'dezessete ', 'dezoito ', 'dezenove ');
     aCentena: Tnumeros = ('cento ', 'duzentos ', 'trezentos ', 'quatrocentos ', 'quinhentos ', 'seiscentos ',
                           'setecentos ', 'oitocentos ', 'novecentos ', '');
     aMilhar: Tnumeros = ('mil ', 'milh�o ', 'milh�es ', '', '', '', '', '', '', '');
     aMoeda: Tmoeda = (('cruzeiro ', 'cruzeiros '), ('d�lar ', 'd�lares '), ('real ', 'reais '), ('', ''), ('metro quadrado ', 'metros quadrados '), ('cruzado ', 'cruzados '),
                       ('cruzeiro novo ', 'cruzeiros novos '), ('cruzado novo ', 'cruzados novos '), ('cruzeiro real ', 'cruzeiros reais '));
     aCentavo: Tnumeros = ('centavo', 'centavos', '', '', '', '', '', '', '', '');

     Mes : array [1..12] of Pchar = ('janeiro','fevereiro','mar�o','abril','maio','junho',
                                     'julho','agosto','setembro','outubro','novembro','dezembro');

     Semana : array[1..7] of Pchar =('Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','Sabado');

     StatusAgenda : array[1..7] of Pchar =('Livre','Agendado','Aguardando','Bloqueado','N�o Compareceu', 'Atendido', 'Consultando');

     function GetDataHoraRede(vfIP: string): TDateTime;
     function IsWrongIP(ip: string): Boolean;

     function KillTask(ExeFileName: string): Integer;
     function ProcessoExiste(ExeFileName: string): boolean;

     procedure ConverterTextoPDF(var vpWptTexto : TWPRichText; viPastaDestino, vpArquivoDestino : string);

     procedure ConverterTextoPDFNovo(wptTexto: TWPRichText; vpArquivoPDF : string);
     procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False; vpMaximixar : Boolean = False);
     procedure AtivarFormulario(classForm    : TFormClass;
                                var NewForm;
                                var parent   : TWinControl;
                                borderStyle  : TBorderStyle = bsNone;
                                align        : TAlign       = alClient;
                                showForm     : Boolean      = True;
                                tag          : Integer      = 0);

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
     function RetornaCPFCNPJSemFormatar(Valor : String) : String;
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
     function RetPontos(Pontos:string;QUANT:integer):String;
     function RetornaIP : String;
     function DifHora(Inicio,Fim : String):String;
     function IdadeAtual(Nasc : TDate): Integer;
     function RetornaNumerico(Valor : String) : String;
     function RetornaNumerico_e_X(Valor : String) : String;
     function RetornaNumericoValor(Valor : String; vpRetirarPonto : Boolean = False) : String;
     function RetirarPonto(Valor : String) : String;
     Function Nvl(pValue,IfNull: Variant): Variant;
     function ValidarNomeSobrenome(Valor : string) : Boolean;

    function RetornarListCurrency(
      const vpDataSet: TDataSet;
      const vpCampos: string): TListCurrency; overload;

    function RetornarListCurrency(
      const vpStringList: TStringList;
      const vpCampos: string): TListCurrency; overload;

    function RetornarListCurrency(
      const vpValor: Currency): TListCurrency; overload;

    function RetornarListCurrency(
      const vpValores: TArray<Currency>): TListCurrency; overload;

    function RetornarListCurrency(
      const vpValor: Currency;
      const vpQuantidade: Integer): TListCurrency; overload;

    function RetornarMaiorValor(
      const vpValores: TArray<Currency>): Currency;

    function GetPorcentagem(
      const vpMetodoArredondamento: TMetodoArredondamento;
      const vpValores: TList<Currency>;
      const vpTaxa: Double): Currency; overload;

     function RetirarBarra(Valor : String) : String;
     function RetornaAlfaNumerico(Valor : String) : String;
     function RetornaNumeroLetras(Valor : String) : String;
     function RetornaAlfa(Valor : String) : String;
     Function IdadeN(Nascimento:TDateTime; Idade2 : String = ''; SomenteAno : Boolean = False) : String;
     Function IdadeAno(Nascimento:TDateTime; Idade2 : String = '') : Integer;
     Function RetNull(Valor : String; vpTipo : String = 'S') : String;
     Function RetNullInteger(Valor: Integer): String;

     Function CompressStringOld(Source:AnsiString):AnsiString;
     Function DeCompressStringOld(Source:AnsiString):AnsiString;
     Function CompressString(const Str: AnsiString):AnsiString;
     function CompressStringStream(const Str: AnsiString): TStringStream;
     Function DeCompressString(const Str: AnsiString):AnsiString;
     function ConverterWptoolsHtml(RICH : TRichEdit; vpTextoAdicional : TStrings): string;

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
     function SubstituirTexto(vTextoOld, vTextoLocalizar, vTextoSubstituir: string): string;
     procedure SetarAtributosArquivo(vpArquivo : String; vpReadOnly, vpArchive, vpSysFile, vpHidden : Boolean);
     procedure InserirImagemTexto(vpArquivoImagem, vpVariavel : string; vpWptTexto : TWPRichText);
     procedure InserirQrCodeTexto(var vpWptTexto : TWPRichText);
     function RetirarCabecalhoRodapeTexto(wptTexto : TWPRichText) : TWPRichText;
     function CalcularDataVencimento(vpData: TDate; vpTipo, vpQtd : integer; vpLancamentoAgendado : Boolean = False):TDate;
     procedure MontarDataInicioFinal(vpData : String; var vpData1, vpData2 : string; vpDividor :String = '.'; vpMes : String = '');
     Function VerificarDia(vpData, vpDia : String):String;
     function GetExtArquivo(vpArquivo : String) : String;
     function PegarNumeroLetra(vpValor, vpTipoValor : string) : String;
     function RetirarPontuacaoFinalTexto(vpTexto : String):String;
     function RetornarEstadoExtenso(vpTexto : String):String;
     function GetComputerNameFunc : string;
     function IdadeCerta(Data1:TDateTime; Data2:String;  SomenteAno : Boolean = False): String;

    function Arredondamento(
      const vpMetodoArredondamento: TMetodoArredondamento;
      const vpValor: Currency;
      const vpDecimais: Integer): Currency;

     Function PegarAnoMes(vpData : String; Inverter : Boolean = False;
            vpDescritivo : Boolean = False):String;
     Function GerarSenhaWeb:String;
     function RetornaAlfaNumericoEspecial (Valor:String):String;
     function ValidarCpf(num: string): boolean;
     function ValidarCNPJ(Dado : string) : boolean;
     function ValidarCPFCNPJ(vpValor : string):Boolean;
     function ValidarCpfNovo(CPF: string): Boolean;
     function ZeroEsquerda(const I: integer; const Casas: byte): string;
     function Similar_Text(str1, str2 : String): Integer;
     function Similar_Text_2(Origem, Destino: string): Single;

     //Fun��o que retorno a formata��o do codigo para o nome da imagem
     function FormataCodigoImagem(vpNumero : Integer) : String;
     function FormataPastaImagem(vpNumero : Integer) : String;

     // Fun��es de Impressora
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

    //Nome da Esta��o
    function NomeEstacao: string;

    //Fun��o Fon�tica
    function TiraAcentos(Palavra: PAnsiChar): PAnsiChar;
    function Soundex(Str: PAnsiChar) : PAnsiChar;

    //Tratamento de Textos no Wptools
    procedure AdicionarMarcacaoAutomaticaNoTexto(wptAuxiliar: TWPRichText; vpNomeMarcacao: string);
    procedure AdicionarMarcacaoManualNoTexto(wptAuxiliar: TWPRichText);
    procedure ExcluirDicionarioDoTexto(wptAuxiliar: TWPRichText);
    procedure ExcluirMarcacaoDoTexto(wptAuxiliar: TWPRichText);
    function  AvancarRetornarMarcacaoNoTexto(wptAuxiliar: TWPRichText; vpDirecao : TExecuteFunction): string;
    procedure RetirarProtecaoDoTexto(wptAuxiliar: TWPRichText; vpTudo: Boolean = False);
    procedure RetirarMarcacaoInternaDoTexto(wptAuxiliar: TWPRichText; vpPalavra: string; vpTudo: Boolean = False);
    procedure SubstituirTextoWptools(vwptTexto: TWPRichText; vVariavelLocalizar: string; vTextoSubstituir: string);
    procedure SubstituirTextoWptoolsPorWptools(vwptTexto: TWPRichText; vVariavelLocalizar: string; vwptTextoSubstituir: TWPRichText);
    function ExisteMarcacaoNoWptools(vwptTexto: TWPRichText; vVariavelLocalizar: string): Boolean;
    procedure CriarBmpDeWptools(wptTexto: TWPRichText; vpArquivo: String; vpBit: string);
    procedure IniciarIncrementarProgressBar(vpProgress : tcxProgressBar; vpValor : Integer; vpIncrementar : Boolean = False);

    function GerarPDFdeBMP(vpArquivoBMP, vpArquivoPDF: string; vpXpress: TImagXpress):Boolean;

    function RetornaPastaEXE(): string;
    // Registro do Windows
    procedure GravaRegistro(Raiz: HKEY; Chave, Valor, Endereco: string; vpAdicionarAspas : Boolean = False);
    procedure ApagaRegistro(Raiz: HKEY; Chave, Valor : string; vpDeletarRegistro : Boolean = False);
    Function LerRegistro(Raiz: HKEY; Chave, Variavel : string):String;
    Function PegarUsuarioWindows:String;
    function RetornaNumericoEspecial(Valor : String) : String;
    function PadronizacaoLayout(vpTipo, vpGrupo, vpCampo, vpValorDefault : string):String;
    function TrocarAnoMes(MesAno:string):string;
    Function PegarMesExtenso(vpMesNumero : String):String;
    procedure AbrirPlanilha(vpArquivo: string = 'RelTemp.xls'; vpDiretorio: string = 'c:\Temp');

    procedure EnableDisableControls(Form: TForm; ClassComponents: array of TControlClass; State: Boolean; Condition : Boolean = False);
    function RetorneAno(vpData: TDateTime): Integer;
    function RetorneDataRegistro(vpData: TDateTime): string;
    function RetireCaracterEspecialNoTextoXml(vpTexto: string): string;
    function RetorneHora(vpData: TDateTime): string;
    function RetorneLocalNascimento(vpLocal: Integer): string;
    function RemoveAcentoECedilha(vpTexto: string): string;
    function RetorneSexo(vpTipo: string): string;
    function RetorneSexoAnimal(vpTipo: string): string;
    function NaoPodeConterPalavras(vpNome: string): string;
    function RetorneDescricaoCorPele(vpTipo: Integer): string;
    function RetorneRegimeCasamento(vpTipo: Integer): string;
    function DoValido(vpDO: string): Boolean;
    function RetornaDoCorreto(vpDO: string): string;
    function FaixaDoValido(vpDO: string): Boolean;
    function DnvValido(vpDNV: string): Boolean;
    function RetornaDnvCorreto(vpDNV: string): string;
    function FaixaDnvValido(vpDNV: string): Boolean;
    function MinutosParaHora(vpMinutos: Integer): string;
    function RetornaLetra(viTexto: string): string;
    function RetorneEstadoCivil(vpEstadoCivilId: Integer): string;
    function RetorneIdade(vpDataAtual: TDateTime; vpDataAntiga: TDateTime): Integer;
    function RetorneTipoLocalObito(vpLocal: Integer): string;
    function RetorneDiaDaSemana(vpDia: Integer): string;
    function RetorneTipoDocumento(vpDocumento: string): string;
    function RetorneOrgaoEmissor(vpAbreviatura: string): Integer;
    function PegarTexto(vpTexto: string; vpPosicao: Integer): string;
    procedure RetornarMsgAbortar(vpMsg : string);
    function FormataData(vpData: TDateTime): string;
    function EncodeBase64(const inStr: string): string;
    function ValidarEMail(aStr: string): Boolean;
    function RetorneTipoSanguineo(vpTipoSanguineo: string): string;

    function ConectadoInternet: Boolean;
    function Virgula2Casas(Valor : string): Currency;
    function Em(vpBase: Variant; vpComparacoes: Array of Variant): Boolean;
    function RetornarTrimestreAno(vpTrimestre, vpOpcao : Integer; vpAno : String):String;
    function RetornarValorListaString(var vpLista : String; vpSeparador : String):String;
    procedure OpenFileInExplorer(const vpFile: string);
    function RetornaTextoArquivo(vpArquivoTXT: string): string;

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
         vgPesquisaPadraoLayout : String;

         // Controle Visual
         vgLinhaGridHorizontal, vgLinhaGridVertical : String;


implementation

uses
  Winapi.WinInet, Winapi.ActiveX, LanDateTimeTools;

{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

function GetDataHoraRede(vfIP: string): TDateTime;
begin
  Result := ServerDateTime(vfIP);
end;

procedure OpenFileInExplorer(const vpFile: string);
begin
  ShellExecute(
    0,
    nil,
    PWideChar(
      'explorer.exe'),
    PWideChar(
      string.Format(
        '/select, %s',
        [vpFile])),
    nil,
    SW_SHOWNORMAL);
end;

function RetornaTextoArquivo(vpArquivoTXT: string): string;
var
  viTexto: TStringList;
begin
  Result := EmptyStr;

  viTexto := nil;
  try
    viTexto := TStringList.Create;
    viTexto.LoadFromFile(vpArquivoTXT);
    Result := viTexto.Text;
  finally
    FreeAndNil(viTexto);
  end;
end;

function IsWrongIP(ip: string): Boolean;
var
  z, i: Integer;
  st: array[1..3] of byte;
const
  ziff = ['0'..'9'];
begin
  st[1]  := 0;
  st[2]  := 0;
  st[3]  := 0;
  z      := 0;
  Result := False;
  for i := 1 to Length(ip) do if ip[i] in ziff then
  else
  begin
    if ip[i] = '.' then
    begin
      Inc(z);
      if z < 4 then st[z] := i
      else
      begin
        IsWrongIP := True;
        Exit;
      end;
    end
    else
    begin
      IsWrongIP := True;
      Exit;
    end;
  end;
  if (z <> 3) or (st[1] < 2) or (st[3] = Length(ip)) or (st[1] + 2 > st[2]) or
    (st[2] + 2 > st[3]) or (st[1] > 4) or (st[2] > st[1] + 4) or (st[3] > st[2] + 4) then
  begin
    IsWrongIP := True;
    Exit;
  end;
  z := StrToInt(Copy(ip, 1, st[1] - 1));
  if (z > 255) or (ip[1] = '0') then
  begin
    IsWrongIP := True;
    Exit;
  end;
  z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
  if (z > 255) or ((z <> 0) and (ip[st[1] + 1] = '0')) then
  begin
    IsWrongIP := True;
    Exit;
  end;
  z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
  if (z > 255) or ((z <> 0) and (ip[st[2] + 1] = '0')) then
  begin
    IsWrongIP := True;
    Exit;
  end;

  z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
  if (z > 255) or ((z <> 0) and (ip[st[3] + 1] = '0')) then
  begin
    IsWrongIP := True;
    Exit;
  end;
end;

procedure RetornarMsgAbortar(vpMsg : string);
begin
   Application.MessageBox(Pchar(vpMsg),'Aviso', MB_OK + MB_ICONINFORMATION);
   Abort;
end;

function RetornarValorListaString(var vpLista : String; vpSeparador : String):String;
var
  viItemLista : String;
begin
  viItemLista := Copy(vpLista,1,Pos(vpSeparador,vpLista)-1);
  if viItemLista = '' then
  begin
    viItemLista :=  vpLista;
    vpLista     := '';
  end
  else Delete(vpLista,1,Pos(vpSeparador,vpLista));
  Result := viItemLista;
end;

function ValidarCPFCNPJ(vpValor : string):Boolean;
var
  viValor : string;
begin
  if vpValor = '' then
    Result := False
  else
  begin
    viValor := RetornaNumerico(vpValor);
    if Length(viValor) > 11 then
         Result := ValidarCNPJ(viValor)
    else Result :=  ValidarCPF(viValor);
  end;
end;

function RetornarTrimestreAno(vpTrimestre, vpOpcao : Integer; vpAno : String):String;
var
  viTrimestre: Integer;
begin
  if vpOpcao = 1 then
  begin
    case vpTrimestre of
      1: Result := '01/01/'+ vpAno;
      2: Result := '01/04/'+ vpAno;
      3: Result := '01/07/'+ vpAno;
      4: Result := '01/10/'+ vpAno;
    end
  end
  else
  begin
    case vpTrimestre of
      1: Result := '31/03/'+ vpAno;
      2: Result := '30/06/'+ vpAno;
      3: Result := '30/09/'+ vpAno;
      4: Result := '31/12/'+ vpAno;
    end
  end;
end;

function ConectadoInternet: Boolean;
var
  dw_ConnectionTypes : DWORD;
begin
  dw_ConnectionTypes:= INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_PROXY;
  Result:=InternetGetConnectedState(@dw_ConnectionTypes,0);
end;

function Virgula2Casas(Valor : string):Currency;
begin
   Insert(',', Valor, length(Valor)- 1);
   Valor := FormatFloat('0.00', StrToFloat(Valor));
   Result := StrToCurr(Valor);
end;

function Em(vpBase: Variant; vpComparacoes: Array of Variant): Boolean;
{$REGION 'Vari�veis'}
var
  i: Integer;
{$ENDREGION}
begin
  Result := False;

  for i := Low(vpComparacoes) to High(vpComparacoes) do
  begin
    if vpBase = vpComparacoes[i] then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function RetornarListCurrency(
  const vpDataSet: TDataSet;
  const vpCampos: string): TListCurrency;
{$REGION 'Vari�veis'}
var
  viCampo: string;
{$ENDREGION}
begin
  Result := TListCurrency.Create;

  for viCampo in vpCampos.Split([';']) do
    Result.Add(vpDataSet.FieldByName(viCampo).AsCurrency);
end;

function RetornarListCurrency(
  const vpStringList: TStringList;
  const vpCampos: string): TListCurrency;
{$REGION 'Vari�veis'}
var
  viCampo: string;
{$ENDREGION}
begin
  Result := TListCurrency.Create;

  for viCampo in vpCampos.Split([';']) do
    Result.Add(StrToCurr(vpStringList.Values[viCampo]));
end;

function RetornarListCurrency(
  const vpValor: Currency): TListCurrency; overload;
begin
  Result := TListCurrency.Create;
  Result.Add(vpValor);
end;

function RetornarListCurrency(
  const vpValores: TArray<Currency>): TListCurrency;
begin
  Result := TListCurrency.Get(vpValores);
end;

function RetornarListCurrency(
  const vpValor: Currency;
  const vpQuantidade: Integer): TListCurrency;
{$REGION 'Vari�veis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := TListCurrency.Create;

  for I := 1 to vpQuantidade do
    Result.Add(vpValor);
end;

function RetornarMaiorValor(
  const vpValores: TArray<Currency>): Currency;
{$REGION 'Vari�veis'}
var
  viListCurrency: TListCurrency;
{$ENDREGION}
begin
  viListCurrency := TListCurrency.Get(vpValores);
  try
    Result := viListCurrency.GetMaxValue;
  finally
    viListCurrency.Free;
  end;
end;

function GetTaxaBaseUnitaria(
  const vpTaxa: Double): Double;
{$REGION 'Constantes'}
const
  CI_FATOR_MULTIPLICADOR: Double = 0.01;
{$ENDREGION}
begin
  Result := vpTaxa * CI_FATOR_MULTIPLICADOR;
end;

function GetPorcentagem(
  const vpMetodoArredondamento: TMetodoArredondamento;
  const vpValor: Currency;
  const vpTaxa: Double): Currency; overload;
{$REGION 'Constantes'}
const
  CI_CASAS_DECIMAIS: Integer = 2;
{$ENDREGION}

{$REGION 'Vari�veis'}
var
  viTaxaBaseUnitaria: Double;
{$ENDREGION}
begin
  viTaxaBaseUnitaria := GetTaxaBaseUnitaria(
    vpTaxa);

  Result := Arredondamento(
    vpMetodoArredondamento,
    vpValor * viTaxaBaseUnitaria,
    CI_CASAS_DECIMAIS);
end;

function GetPorcentagem(
  const vpMetodoArredondamento: TMetodoArredondamento;
  const vpValores: TList<Currency>;
  const vpTaxa: Double): Currency;
{$REGION 'Vari�veis'}
var
  viValor: Currency;
{$ENDREGION}
begin
  Result := 0;

  for viValor in vpValores do
    Result := Result + GetPorcentagem(
      vpMetodoArredondamento,
      viValor,
      vpTaxa);
end;

function ConverterWptoolsHtml(RICH : TRichEdit; vpTextoAdicional : TStrings): string;
var
   I,J,MAX_ARRAY: integer;
   HTML: string;
   F,FO: array [0..5] of string;
   STR,LGT: integer;
   SIZE: integer;
   COR : string;
   viHtml: TStringList;
begin
   DeleteFile(Pchar('c:\Temp\Body.html'));
   viHtml := TStringList.Create;

   RICH.Lines.Add('');
   RICH.Lines.AddStrings(vpTextoAdicional);

   STR := RICH.SelStart;
   LGT := RICH.SelLength;
   MAX_ARRAY := 5;

   for J := 0 to MAX_ARRAY do
   begin
     F[J] := '';
     FO[J] := '';
   end;

   for I := 0 to length(RICH.text) do
   begin
     RICH.SelStart := I;
     RICH.SelLength := 1;

     for J := 0 to MAX_ARRAY do
       FO[J] := F[J];

     if (RICH.SelAttributes.Style - [fsItalic] - [fsUnderline] - [fsStrikeOut] = [fsBold]) then
       F[0] := '<b>'
     else
       F[0] := '</b>';

     if (RICH.SelAttributes.Style - [fsItalic] - [fsBold] - [fsStrikeOut] = [fsUnderline]) then
       F[1] := '<u>'
     else
       F[1] := '</u>';

     if (RICH.SelAttributes.Style - [fsUnderline] - [fsBold] - [fsStrikeOut] = [fsItalic]) then
       F[2] := '<i>'
     else
       F[2] := '</i>';

     if RICH.SelAttributes.size < 10 then
       SIZE := 1
     else if RICH.SelAttributes.size < 12 then
       SIZE := 2
     else if RICH.SelAttributes.size < 14 then
       SIZE := 3
     else if RICH.SelAttributes.size < 18 then
       SIZE := 4
     else if RICH.SelAttributes.size < 22 then
       SIZE := 5
     else if RICH.SelAttributes.size < 32 then
       SIZE := 6
     else
       SIZE := 7;
     COR := ColorToString(RICH.SelAttributes.Color);
     if (COR = 'clWindowText') or (COR = 'clBlack') then
       COR := '#000000'
     else if COR = 'clWite' then
       COR := '#FFFFFF'
     else if COR = 'clAqua' then
       COR := '#00FFFF'
     else if COR = 'clFuchsia' then
       COR := '#FF00FF'
     else if COR = 'clBlue' then
       COR := '#0000FF'
     else if COR = 'clYellow' then
       COR := '#FFFF00'
     else if COR = 'clLime' then
       COR := '#00FF00'
     else if COR = 'clRed' then
       COR := '#FF0000'
     else if COR = 'clSilver' then
       COR := '#C0C0C0'
     else if COR = 'clGray' then
       COR := '#808080'
     else if COR = 'clTeal' then
       COR := '#008080'
     else if COR = 'clPurple' then
       COR := '#800080'
     else if COR = 'clNavy' then
       COR := '#000080'
     else if COR = 'clOlive' then
       COR := '#808000'
     else if COR = 'clGreen' then
       COR := '#008000'
     else if COR = 'clMaroon' then
       COR := '#800000'
     else if copy(COR,1,1) = '$' then
       COR := '#'+copy(COR,length(COR)-1,2)
                 +copy(COR,length(COR)-3,2)
                 +copy(COR,length(COR)-5,2)
     else
       COR := '#000000';
     F[3] := '</font><font face="'+RICH.SelAttributes.Name+'" size='+inttostr(SIZE)+' color="'+COR+'">';

     if RICH.Paragraph.Alignment = taCenter then
       F[4] := '<center>'
     else
       F[4] := '</center>';

     if RICH.Paragraph.Alignment = taRightJustify then
       F[5] := '<div align="right">'
     else
       F[5] := '</div>';

     for J := 0 to MAX_ARRAY do
       if FO[J] <> F[J] then
         HTML := HTML + F[J];

     if copy(RICH.text,I+1,1) = #13 then
       HTML := HTML + '<br>';

     HTML := HTML + RemoveAcentos(copy(RICH.text,I+1,1));
   end;
   RICH.SelStart := STR;
   RICH.SelLength := LGT;

   result := HTML;

   viHtml.Add(HTML);
   viHtml.SaveToFile('c:\Temp\Body.html');
   FreeAndNil(viHtml);
end;

procedure AbrirPlanilha(vpArquivo: string = 'RelTemp.xls'; vpDiretorio: string = 'c:\Temp');
begin
  try
    ShellExecute(Application.Handle, 'Open', PwideChar(vpArquivo), nil, PwideChar(vpDiretorio + '\'), SW_SHOWNORMAL);
  except

  end;
end;

Function PegarMesExtenso(vpMesNumero : String):String;
var
  vgListaMeses : TStringList;
begin
  vgListaMeses := TStringList.Create;
  vgListaMeses.Add('1=JANEIRO');
  vgListaMeses.Add('2=FEVEREIRO');
  vgListaMeses.Add('3=MAR�O');
  vgListaMeses.Add('4=ABRIL');
  vgListaMeses.Add('5=MAIO');
  vgListaMeses.Add('6=JUNHO');
  vgListaMeses.Add('7=JULHO');
  vgListaMeses.Add('8=AGOSTO');
  vgListaMeses.Add('9=SETEMBRO');
  vgListaMeses.Add('10=OUTUBRO');
  vgListaMeses.Add('11=NOVEMBRO');
  vgListaMeses.Add('12=DEZEMBRO');
  Result := vgListaMeses.Values[InttoStr(StrtoInt(vpMesNumero))];
end;


function TrocarAnoMes(MesAno:string):string;
var
  viMes, viAno : String;
begin
  viMes := Copy(MesAno, 1,2);
  viAno := Copy(MesAno, 3,4);
  Result := viAno+viMes;
end;

function PadronizacaoLayout(vpTipo, vpGrupo, vpCampo,
      vpValorDefault : string):String;
var
  Ini  : TIniFile;
  viMenu : string;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  if vpTipo = '' then
  begin
    try
      viMenu := Ini.ReadString(vpGrupo, vpCampo, '');
    except
      viMenu := vpValorDefault;
    end;
  end
  else viMenu := vpTipo;

  if viMenu = '' then
    viMenu := vpValorDefault;

  result := viMenu;

  Ini.WriteString(vpGrupo, vpCampo, viMenu);
  Ini.Free;
end;


procedure ConverterTextoPDFNovo(wptTexto: TWPRichText; vpArquivoPDF : string);
var bit: TBitmap;
    i,w, h: Integer;
    viArquivo : String;
    XpressPDF : TImagXpress;
begin
  if not DirectoryExists('C:\Temp') then
    CreateDir('C:\Temp');

  viArquivo := 'C:\Temp\ImgPDF.jpg';

  DeleteFile(vpArquivoPDF);

  try
    XpressPDF := TImagXpress.Create(nil);

    for i := 0 to wptTexto.PageCount-1 do
    begin
      bit := TBitmap.Create;
      bit.PixelFormat := pf24bit;

      w := MulDiv(wptTexto.Header.PageWidth, 300, 1440);
      bit.Width := w;
      h := MulDiv(wptTexto.Header.PageHeight, 300, 1440);
      bit.Height := h;

      bit.Canvas.Brush.Color := clWhite;
      bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
      bit.Canvas.FillRect(Rect(0, 0, w, h));

      wptTexto.PrintPageOnCanvas(bit.Canvas,
      Rect(0, 0, w, h), i, [ppmPaintTransparent, // ppmPrintFrame,
      ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);

      DeleteFile(viArquivo);

      bit.SaveToFile(viArquivo);

      bit.Free;

      //Gerar PDF
      XpressPDF.PageNbr  := i;
      XpressPDF.FileName := viArquivo;
      XpressPDF.SaveFileName  := vpArquivoPDF;
      XpressPDF.SaveMultiPage := True;
      XpressPDF.SaveFileType  := FT_PDF;
      XpressPDF.SavePDFCompression := PDF_CCITTFAX4;
      XpressPDF.SaveFile;
      XpressPDF.FileName := '';
    end;
    FreeAndNil(XpressPDF);
  except
    FreeAndNil(XpressPDF);
    Application.MessageBox('ERRO ao gerar pdf!!!','Informa��o', MB_ICONERROR + MB_OK);
  end;
end;

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

   //Remove mais de um espa�o em branco junto
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

function ZeroEsquerda(const I: integer; const Casas: byte): string;
var
  Ch: Char;
begin
  Result := IntToStr(I);
  if Length(Result) > Casas then
  begin
    Ch := '*';
    Result := '';
  end
  else
    Ch := '0';
  while Length(Result) < Casas do
    Result := Ch + Result;
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
       if CharInSet(Dado[I], ['0'..'9']) then
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

function ValidarCpfNovo(CPF: string): Boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              Result := false;
              exit;
            end;

// try - protege o c�digo para eventuais erros de convers�o de tipo na fun��o StrToInt
  try
{ *-- C�lculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-�simo caractere do CPF em um n�mero
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um n�mero no respectivo caractere num�rico

{ *-- C�lculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then Result := true
    else Result := false;
  except
    Result := false
  end;
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
    02: begin // testar se � ano bissexto
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
    ShowMessage('M�s inv�lido!');
  end;
end;

function RetornaAlfaNumericoEspecial(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if CharInSet(Valor[i],['0'..'9', 'a'..'z', 'A'..'Z', '-', '/', '.', '_', ' ', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�' ,'�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�']) then
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
       Registro.WriteString(Valor, '"' + Endereco + '"') //Grava o endere�o da sua aplica��o no Registro
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
    Registro.DeleteValue(Valor); //Grava o endere�o da sua aplica��o no Registro
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

  Result :=  viDiaExtenso + ' dias do m�s de ' + viMesExtenso + ' do ano de ' + viAnoExtenso;
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
  UserName :array[0..127] of widechar;
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

function ArredondamentoArimeticoSimetrico(
  Valor: Currency;
  Decimais: Integer): Currency;
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

function ArredondamentoBanqueiro(
  const vpValor: Currency;
  const vpDecimais: Integer): Currency;
{$REGION 'Vari�veis'}
var
  viFormato: string;
  viValorFormatado: string;
{$ENDREGION}
begin
  viFormato := '0';

  if vpDecimais > 0 then
    viFormato := viFormato + '.' + DupeString(
      '0',
      vpDecimais);

  viValorFormatado := FormatCurr(
    viFormato,
    vpValor);

  Result := StrToCurr(
    viValorFormatado);
end;

function Arredondamento(
  const vpMetodoArredondamento: TMetodoArredondamento;
  const vpValor: Currency;
  const vpDecimais: Integer): Currency;
begin
  if vpMetodoArredondamento = TMetodoArredondamento.maArimeticoSimetrico then
  begin
    Result := ArredondamentoArimeticoSimetrico(
      vpValor,
      vpDecimais);

    Exit;
  end;

  Result := ArredondamentoBanqueiro(
    vpValor,
    vpDecimais);
end;

Function PegarAnoMes(vpData : String; Inverter : Boolean = False;
            vpDescritivo : Boolean = False):String;
var
  viMes, viAno : String;
begin
  viMes  := copy(vpData,4,2);
  viAno  := copy(vpData,7,4);

  if vpDescritivo then
    Result := AnsiUpperCase(Mes[viMes.ToInteger]) + ' de '+ viAno
  else
  begin
    if Inverter then
         Result := viMes+viAno
    else Result := viAno+viMes;
  end;

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
      end
      else
      if Tipo = 'I' then
      begin
        Edit := TcxCurrencyEdit.Create(Form);
        TcxCurrencyEdit(Edit).Properties.DisplayFormat := '000';
        TcxCurrencyEdit(Edit).Properties.EditFormat    := '000';
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

    if nMes = 1 then Result := Result + FloatToStr(nMes)+ ' M�s '

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
      if CharInSet(ipbuffer[i], ['1'..'9','a'..'z', 'A'..'Z']) then
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

  // Volta para a impressora Padr�o
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

  // Verifica se a impressora padr�o esta setada para trocar por outra. (Troca somente dentro do sistema)
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
      if CharInSet(vpValor[i],['0'..'9']) then
        viResultado := viResultado + vpValor[i];
    end
    else
    begin
      if not CharInSet(vpValor[i],['0'..'9']) then
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

function CalcularDataVencimento(vpData: TDate; vpTipo, vpQtd : integer;
      vpLancamentoAgendado : Boolean = False):TDate;
var
  viMes, viDia, viData : string;
  viAno, vlQtdAdicional  : integer;

  Function CalculoMensal:TDate;
  begin
    viMes := copy(DateToStr(vpData),4,2);
    viAno := StrToInt(copy(DateToStr(vpData),7,4));

    viAno := StrToInt(viMes)+vlQtdAdicional-1;
    viAno := trunc(viAno/12);
    viMes := IntToStr((StrToInt(viMes)+vlQtdAdicional)-(viAno*12));

    viAno := StrToInt(copy(DateToStr(vpData),7,4))+viAno;
    if Length(viMes) = 1 then
      viMes := '0'+viMes;

    viDia  := copy(DateToStr(vpData),1,2);
    viData := viDia+'/'+viMes+'/'+IntToStr(viAno);
    Result := StrToDate(VerificarDia(viData, viDia)+'/'+viMes+'/'+IntToStr(viAno));
  end;

  Function CalculoBimestralTrimestral(vpPeriodo : Integer):TDate;
  begin
    viMes := copy(DateToStr(vpData),4,2);
    viAno := StrToInt(copy(DateToStr(vpData),7,4));

    viAno := StrToInt(viMes)+(vlQtdAdicional*vpPeriodo)-1;
    viAno := trunc(viAno/12);
    viMes := IntToStr((StrToInt(viMes)+(vlQtdAdicional*vpPeriodo))-(viAno*12));

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

    viAno  := (viAno+vlQtdAdicional);
    viDia  := copy(DateToStr(vpData),1,2);
    viData := viDia+'/'+viMes+'/'+IntToStr(viAno);
    Result := StrToDate(VerificarDia(viData, viDia)+'/'+viMes+'/'+IntToStr(viAno));
  end;
begin
  if vpLancamentoAgendado then
  begin
    vlQtdAdicional := vpQtd;
    Case vpTipo of
      2   : vlQtdAdicional := 330;
      3   : vlQtdAdicional := 48;
      4   : vlQtdAdicional := 6;
      5   : vlQtdAdicional := 2;
      6   : vlQtdAdicional := 4;
    End;
  end
  else vlQtdAdicional := vpQtd;

  Case vpTipo of
    1,8 : Result := CalculoMensal;
    2   : Result := (7*vlQtdAdicional)+vpData;
    3   : Result := (15*vlQtdAdicional)+vpData;
    4   : Result := CalculoBimestralTrimestral(2);
    5   : Result := CalculoAnual;
    6   : Result := CalculoBimestralTrimestral(3);
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

function RetornaNumericoValor(Valor : String; vpRetirarPonto : Boolean = False) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
  begin
    if vpRetirarPonto then
    begin
      if CharInSet(Valor[i],['0'..'9',',']) then
         Result := Result + Valor[i];
    end
    else
      if CharInSet(Valor[i],['0'..'9',',','.']) then
         Result := Result + Valor[i];
  end;
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
    if CharInSet(Valor[i], ['0'..'9',',']) then
       Result := Result + Valor[i];
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function ProcessoExiste(ExeFileName: string): boolean;
const
  PROCESS_TERMINATE=$0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32{declarar Uses Tlhelp32};
begin
  result := false;

  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
    begin
      Result := true;
      exit;
    end;

    ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
  end;

  CloseHandle(FSnapshotHandle);
end;

function GerarPDFdeBMP(vpArquivoBMP, vpArquivoPDF: string; vpXpress: TImagXpress):Boolean;
begin
  try
    if FileExists(vpArquivoPDF) then
      DeleteFile(vpArquivoPDF);

    vpXpress.PageNbr := 1;
    vpXpress.FileName := vpArquivoBMP;
    vpXpress.SaveFileType := FT_TIFF_G4;
    vpXpress.SaveCompressSize := TIFF_CCITTFAX4;
    vpXpress.SaveFileName := vpArquivoPDF+'.tiff';
    vpXpress.IResX := 300;
    vpXpress.IResY := 300;
    vpXpress.SaveFile;


    vpXpress.PageNbr := 1;
    vpXpress.FileName := vpArquivoPDF+'.tiff';
    vpXpress.SaveFileType := FT_PDF;
    vpXpress.SaveCompressSize := PDF_Compress_Default;
    vpXpress.SaveFileName := vpArquivoPDF;
    vpXpress.IResX := 300;
    vpXpress.IResY := 300;
    vpXpress.SaveFile;

    DeleteFile(vpArquivoPDF+'.tiff');

    Result := True;
  except
    Result := False;
  end;
end;

function RetornaPastaEXE(): string;
begin
  Result := Copy(ExtractFilePath(ParamStr(0)),1,Length(ExtractFilePath(ParamStr(0)))-1);
end;

procedure CriarBmpDeWptools(wptTexto: TWPRichText; vpArquivo: String; vpBit: string);
var
  vBit: TBitmap;
  vWidth, vHeight: Integer;
const
  pagno = 0;
begin
  wptTexto.ReformatAll();
  vBit := TBitmap.Create;
  if vpBit = '1' then
    vBit.PixelFormat := pf1bit
  else if vpBit = '4' then
    vBit.PixelFormat := pf4bit
  else if vpBit = '8' then
    vBit.PixelFormat := pf8bit
  else if vpBit = '15' then
    vBit.PixelFormat := pf15bit
  else if vpBit = '16' then
    vBit.PixelFormat := pf16bit
  else if vpBit = '24' then
    vBit.PixelFormat := pf24bit
  else if vpBit = '32' then
    vBit.PixelFormat := pf32bit;

  vWidth := MulDiv(wptTexto.Header.PageWidth, 300, 1440);
  vBit.Width := vWidth;
  vHeight := MulDiv(wptTexto.Header.PageHeight, 300, 1440);
  vBit.Height := vHeight;

  vBit.Canvas.Brush.Color := clWhite;
  vBit.Canvas.FillRect(Rect(0, 0, vBit.Width, vBit.Height));
  vBit.Canvas.FillRect(Rect(0, 0, vWidth, vHeight));

  wptTexto.PrintPageOnCanvas(vBit.Canvas,
    Rect(0, 0, vWidth, vHeight), pagno, [ppmForPDFOutput, // ppmPrintFrame,
    ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);


  DeleteFile(vpArquivo);

  vBit.SaveToFile(vpArquivo);

  vBit.free;
end;

function ExisteMarcacaoNoWptools(vwptTexto: TWPRichText;
  vVariavelLocalizar: string): Boolean;
begin
  vwptTexto.Finder.ToStart;
  vwptTexto.CPPosition := $0;
  if vwptTexto.Finder.Next(vVariavelLocalizar) then
    Result := True
  else
    Result := False;
end;

function SubstituirTexto(vTextoOld, vTextoLocalizar, vTextoSubstituir: string): string;
begin
  Result := StringReplace(vTextoOld, vTextoLocalizar, vTextoSubstituir,[rfReplaceAll,rfIgnoreCase]);
end;

procedure SubstituirTextoWptoolsPorWptools(
  vwptTexto: TWPRichText; vVariavelLocalizar: string;
  vwptTextoSubstituir: TWPRichText);
var
  vSair: boolean;
begin
  vSair := False;
  vwptTexto.Finder.ToStart;
  vwptTexto.CPPosition := $0;
  repeat
    if vwptTexto.Finder.Next(vVariavelLocalizar) then
    begin
      vwptTexto.Finder.SelectText;
      vwptTexto.ClearSelection(True);
      vwptTexto.CPPosition := vwptTexto.SelStart;
      Clipboard.Open;
      Clipboard.Clear;
      vwptTextoSubstituir.CPPosition := $0;
      vwptTextoSubstituir.SelectAll;
      vwptTextoSubstituir.CopyToClipboard;
      vwptTexto.PasteFromClipboard;
      Clipboard.Clear;
      Clipboard.Close;
    end
    else
      vSair := True;
  until
    (vSair = True);
end;

procedure SubstituirTextoWptools(vwptTexto: TWPRichText;
  vVariavelLocalizar, vTextoSubstituir: string);
var
  vSair: boolean;
begin
  vSair := False;
  vwptTexto.Finder.ToStart;
  vwptTexto.CPPosition := $0;

  repeat
    if vwptTexto.Finder.Next(vVariavelLocalizar) then
    begin
      vwptTexto.Finder.SelectText;
      vwptTexto.ClearSelection(True);
      vwptTexto.CPPosition := vwptTexto.SelStart;
      if vVariavelLocalizar = '�w�NumeroPagina�w�' then
        vwptTexto.InputTextField(wpoPageNumber)
      else
        vwptTexto.InputString(vTextoSubstituir);
    end
    else
      vSair := True;
  until
    (vSair = True);
end;

procedure AdicionarMarcacaoAutomaticaNoTexto(wptAuxiliar: TWPRichText; vpNomeMarcacao: string);
var
  vMarcacao : string;
  wptMemoria: TWPRichText;
begin
  vMarcacao := vpNomeMarcacao;

  // Cria Wptools na Memoria
  try
    wptMemoria := TWPRichText.Create(nil);
    wptMemoria.Parent := wptAuxiliar;
    wptMemoria.Visible := False;
    wptMemoria.Clear;

    //Definir Propriedades
    wptMemoria.CurrAttr.FontName := wptAuxiliar.CurrAttr.FontName;
    wptMemoria.CurrAttr.Color := wptAuxiliar.CurrAttr.Color;
    wptMemoria.CurrAttr.Style := wptAuxiliar.CurrAttr.Style;
    wptMemoria.CurrAttr.Size := wptAuxiliar.CurrAttr.Size;

    wptMemoria.InputString(PChar(vMarcacao));
    wptMemoria.SelectAll;
    wptMemoria.BookmarkInput('wel');

    // Insere a prote��o
    wptMemoria.CurrAttr.AddStyle([afsProtected]);
    wptMemoria.HideSelection;

    // Grava a Marca��o pronta no Texto
    wptMemoria.SelectAll;
    Clipboard.Open;
    Clipboard.Clear;
    wptMemoria.CopyToClipboard;
    wptAuxiliar.PasteFromClipboard;
    wptAuxiliar.SetFocus;
    Clipboard.Clear;
    Clipboard.Close;
  finally
    wptMemoria.Free;
    wptMemoria := nil;
  end;
end;

procedure AdicionarMarcacaoManualNoTexto(wptAuxiliar: TWPRichText);
var
  vMarcacao : string;
  wptMemoria: TWPRichText;
begin
  vMarcacao := wptAuxiliar.SelText;

  // Verifica se tem algum texto selelcionado ou focado.
  if vMarcacao = '' then
  begin
    wptAuxiliar.SelectWord;
    vMarcacao := wptAuxiliar.SelText;
    if (vMarcacao = '') then
      Abort;
  end;

  // Cria Wptools na Memoria
  try
    wptMemoria := TWPRichText.Create(nil);
    wptMemoria.Parent := wptAuxiliar;
    wptMemoria.Visible := False;
    wptMemoria.Clear;

    vMarcacao := '�m�'+vMarcacao+'�m�';

    //Definir Propriedades
    wptMemoria.CurrAttr.FontName := wptAuxiliar.CurrAttr.FontName;
    wptMemoria.CurrAttr.Color := wptAuxiliar.CurrAttr.Color;
    wptMemoria.CurrAttr.Style := wptAuxiliar.CurrAttr.Style;
    wptMemoria.CurrAttr.Size := wptAuxiliar.CurrAttr.Size;

    wptMemoria.InputString(PChar(vMarcacao));
    wptMemoria.SelectAll;
    wptMemoria.BookmarkInput(wptAuxiliar.SelText);

    // Insere a prote��o
    wptMemoria.CurrAttr.AddStyle([afsProtected]);
    wptMemoria.HideSelection;

    // Grava a Marca��o pronta no Texto
    wptMemoria.SelectAll;
    Clipboard.Open;
    Clipboard.Clear;
    wptMemoria.CopyToClipboard;
    wptAuxiliar.PasteFromClipboard;
    wptAuxiliar.SetFocus;
    Clipboard.Clear;
    Clipboard.Close;
  finally
    wptMemoria.Free;
    wptMemoria := nil;
  end;
end;

procedure ExcluirDicionarioDoTexto(wptAuxiliar: TWPRichText);
var
  vOk: boolean;
  vLista: TWPTextObjList;
  vObjeto: TWPTextObj;
  procedure ExecutarBusca;
  begin
    wptAuxiliar.HideSelection;
    vOk := False;

    // Avan�a para a pr�xima marca��o
    if wptAuxiliar.CPPosition > 0 then
      wptAuxiliar.CPMoveNext;

    repeat
      vLista.Clear;
      wptAuxiliar.OpenCodesAtCP(vLista,wpobjHyperlink);
      wptAuxiliar.CPMoveNext;
    until
      vLista.Count = 0;
  end;
begin
  try
    wptAuxiliar.CPPosition := $0;
    vLista := TWPTextObjList.Create;
    vObjeto := TWPTextObj.Create;

    ExecutarBusca;

    repeat
      repeat
        vLista.Clear;
        wptAuxiliar.OpenCodesAtCP(vLista,wpobjHyperlink);
        vObjeto := wptAuxiliar.HyperlinkAtCP;

        // Procura a Marca��o e seta o objeto da mesma
        while ((vLista.Count > 0) and (Pos('�', vObjeto.Name) = 0)) do
        begin
          vObjeto := wptAuxiliar.HyperlinkAtCP;
          vOk := True;
          Break;
        end;

        if (vOk) and ((Copy(vObjeto.Source,pos('�',vObjeto.Source)+2,1)) <> '') then
          wptAuxiliar.DeleteHyperlink(False)
        else
          wptAuxiliar.CPMoveNext;
      until
        (vOk or (not(wptAuxiliar.CPMoveNext)));

      ExecutarBusca;

    until
      not(wptAuxiliar.CPMoveNext);
  finally
    FreeAndNil(vLista);
    FreeAndNil(vObjeto);
  end;
end;

procedure ExcluirMarcacaoDoTexto(wptAuxiliar: TWPRichText);
var
  vObjeto: TWPTextObj;
  vFlag : Boolean;
  vProtecaoVoltar: TProtectProp;
begin
  vProtecaoVoltar := wptAuxiliar.ProtectedProp;
  vFlag := False;
  wptAuxiliar.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  wptAuxiliar.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement, wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
  wptAuxiliar.CurrAttr.DeleteStyle([afsProtected]);

  try
//    vObjeto := TWPTextObj.Create;
    vObjeto := wptAuxiliar.BookmarkAtCP;
    if vObjeto = nil then
    begin
      Application.MessageBox(
        'Nenhuma marca��o selecionada para excluir!' + #13#10 +
        'Posicione o cursor sobre a marca��o desejada!',
        'Aten��o',
        MB_OK + MB_ICONWARNING
      );
      Exit;
    end;

    try
      vObjeto.Name := 'EXCLUIR%';
      wptAuxiliar.BookmarkSelect('EXCLUIR%', FALSE);
      wptAuxiliar.ClearSelection;
      wptAuxiliar.BookmarkDeleteMarkers('EXCLUIR%');

      if wptAuxiliar.Visible then
        wptAuxiliar.SetFocus;
//      wptAuxiliar.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
      wptAuxiliar.ProtectedProp := vProtecaoVoltar;
      wptAuxiliar.EditOptions := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement,wpActivateUndo,wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
    except
    end;
  finally
//    FreeAndNil(vObjeto);
  end;
end;

function  AvancarRetornarMarcacaoNoTexto(wptAuxiliar: TWPRichText; vpDirecao : TExecuteFunction): string;
var
  vOk: boolean;
  vLista: TWPTextObjList;
  vValorAnterior: string;
  vObjeto: TWPTextObj;
  vFlag: Boolean;
  vProtecaoVoltar: TProtectProp;
begin
  vProtecaoVoltar := wptAuxiliar.ProtectedProp;
  wptAuxiliar.HideSelection;
  vOk := False;
  vFlag := True;

  // Avan�a para a pr�xima marca��o
  vpDirecao;
  try
    vLista := TWPTextObjList.Create;
    vObjeto := TWPTextObj.Create;

    repeat
      vLista.Clear;
      wptAuxiliar.OpenCodesAtCP(vLista,wpobjBookmark);
      vpDirecao;
    until
      (wptAuxiliar.CPPosition <= 2) or (vLista.Count = 0);

    repeat
      vLista.Clear;
      wptAuxiliar.OpenCodesAtCP(vLista,wpobjBookmark);
      vObjeto := wptAuxiliar.BookmarkAtCP;
      try
        while (vLista.Count > 0) and (vObjeto.Name <> 'wel') do //wel=autom�tica, n�o pode navegar
        begin
          // ** Altera o Valor da Marca��o para poder seleciona-la
          vValorAnterior := vLista[0].Name;
          wptAuxiliar.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
          wptAuxiliar.EditOptions := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement, wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
          vObjeto := wptAuxiliar.BookmarkAtCP;
          vObjeto.Name := 'SELECIONARAQUI%';
          vOk := True;
          Break;
        end;
      except
      end;

      if vOk then
      begin
        wptAuxiliar.CPPosition := wptAuxiliar.CPPosition - 1;
        wptAuxiliar.BookmarkSelect('SELECIONARAQUI%',True);

        // ** Retorna o Valor da Marca��o original, depois de seleciona-la.
        vObjeto.Name := vValorAnterior;
//        wptAuxiliar.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
        wptAuxiliar.ProtectedProp := vProtecaoVoltar;
        wptAuxiliar.EditOptions := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement,wpActivateUndo,wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
        wptAuxiliar.SetFocus;
        vFlag := False;
      end
      else vpDirecao;
    until
      (vOk or (not(vpDirecao)));
  finally
    FreeAndNil(vLista);
    FreeAndNil(vObjeto);
  end;

  if vFlag then
    Application.MessageBox('Final de Marca��o!!!', 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);

//  RetirarProtecaoDoTexto(wptAuxiliar, False);
  wptAuxiliar.CurrAttr.DeleteStyle([afsProtected]);
  Result := vValorAnterior;
end;

procedure RetirarProtecaoDoTexto(wptAuxiliar: TWPRichText; vpTudo: Boolean = False);
var
  vProtecaoVoltar: TProtectProp;
begin
  vProtecaoVoltar := wptAuxiliar.ProtectedProp;
  wptAuxiliar.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  if vpTudo then
    wptAuxiliar.SelectAll;
  wptAuxiliar.CurrAttr.DeleteStyle([ afsProtected ]);
  wptAuxiliar.ProtectedProp := vProtecaoVoltar;
//  wptAuxiliar.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure RetirarMarcacaoInternaDoTexto(wptAuxiliar: TWPRichText; vpPalavra: string; vpTudo: Boolean = False);
var
  vProtecaoVoltar: TProtectProp;
begin
  vProtecaoVoltar := wptAuxiliar.ProtectedProp;
  wptAuxiliar.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  if vpTudo then
  begin
    wptAuxiliar.SelectAll;
    wptAuxiliar.BookmarkDeleteAllMarkers;
  end
  else
  begin
    wptAuxiliar.BookmarkSelect(vpPalavra, False);
    wptAuxiliar.BookmarkDeleteMarkers(vpPalavra);
  end;
//  wptAuxiliar.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  wptAuxiliar.ProtectedProp := vProtecaoVoltar;
end;

//************************************************************
// Fun��o utilizada para retirar acentos e cedilha
// Ex.: TiraAcentos('JOS�')  = 'JOSE'
//      TiraAcentos('CAL�A') = 'CALCA'
//************************************************************
function TiraAcentos(Palavra: PAnsiChar): PAnsiChar;
begin
  TiraAcentos := Palavra;
  if Palavra = nil then
    Exit;
  while Palavra^ <> #0 do
  begin
    case Palavra^ of
         '�', '�', '�', '�', '�', '�',
         '�', '�', '�', '�', '�', '�': Palavra^ := 'A';
         '�', '�', '�', '�',
         '�', '�', '�', '�': Palavra^ := 'E';
         '�', '�', '�', '�',
         '�', '�', '�', '�': Palavra^ := 'I';
         '�', '�', '�', '�', '�',
         '�', '�', '�', '�', '�': Palavra^ := 'O';
         '�', '�', '�', '�',
         '�', '�', '�', '�': Palavra^ := 'U';
         '�', '�': Palavra^ := 'C';
         '�', '�': Palavra^ := 'N';
         '�', '�', '�', '�': Palavra^ := 'Y';
    else
      if Ord(Palavra^) > 127 then
        Palavra^ := #32;
    end;
    Inc(Palavra);
  end;
end;

//***************************************************
//  In�cio da fun��o Soundex que retorna c�digo
//  fon�tico da palavra passada como par�metro
// Ex.: Soundex('PAULO') = 'PL'
//      Soundex('PAULA') = 'PL'
//***************************************************
function Soundex(Str: PAnsiChar) : PAnsiChar;
var
  Aux      : AnsiString;
  posicao  : integer;
  x        : integer;
begin
  Aux := TiraAcentos(Str);  //Retirando os acentos
  Aux := AnsiString(Trim(String(Aux)));         // Retirando os espa�os iniciais e finais

  {Excluindo caracteres duplicados
  Exemplo.: Wellington = Welington}
  for x:=1 to length(Aux) do
  begin
    if x < length(Aux) then
    begin
      if Copy(Aux,x,1) = Copy(Aux,x+1,1) then
        delete (Aux,x,1);
    end;
  end;

  {Trocando todos os W por V
   Ex.: Waldir = Valdir }
  posicao :=  Pos('W',String(Aux));
  while Pos('W',String(Aux)) > 0 do
  begin
    Delete(Aux,posicao,1);
    Insert('V',Aux,posicao);
    posicao := Pos('W',String(Aux));
  end;

  {Quando U for inicio da palavra e a letra seguinte for vogal
   troca-se por V
   Ex.:  WELLINGTON = UELLINGTON}
  posicao := Pos('U',String(Aux));
  while (posicao > 0) and (posicao = 1) and (Pos(Copy(String(Aux),posicao+1,1),'AEIOU') > 0) do
  begin
    Delete(Aux, posicao,1);
    Insert('V',Aux, posicao);
    posicao := Pos('U',String(Aux));
  end;

  {Trocando Y por I
   Ex.: YOLANDA = IOLANDA}
  posicao := Pos('Y',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,posicao,1);
    Insert('I',Aux,posicao);
    posicao := Pos('Y',String(Aux));
  end;

  {Quando C for inicio da palavra e a seguinte for EI
   troca-se por S
   Ex.: CELINA = SELINA}
  posicao := Pos('C',String(Aux));
  while (posicao > 0) and (posicao =1) and (Pos(Copy(String(Aux),posicao+1,1),'EI')>0) do
  begin
    Delete(Aux,Posicao,1);
    Insert('S',Aux,posicao);
    posicao := Pos('C',String(Aux));
  end;

  {Troca-se K por C
   Ex.: KARLA = CARLA}
  posicao := Pos('K',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,Posicao,1);
    Insert('C',Aux,posicao);
    posicao := pos('K',String(Aux));
  end;

  {Troca-se PH por F
   Ex.:"PHELIPE = FELIPE}
  posicao := Pos('PH',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,Posicao,2);
    Insert('F',Aux,posicao);
    posicao := pos('PH',String(Aux));
  end;

  {Troca-se SCH por X, pois SCH tem som de X
  Ex.: SCHIMENES = XIMENES}
  posicao := Pos('SCH',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,posicao,3);
    Insert('X',Aux,posicao);
    posicao := pos('SCH',String(Aux));
  end;

  {Troca-se CH por X
  Ex.: CHICO = XICO}
  posicao := Pos('CH',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,posicao,2);
    Insert('X',Aux,Posicao);
    posicao := pos('CH',String(Aux));
  end;

  {Troca-se SH por X, pois tb�m tem som de X}
  posicao := Pos('SH',String(Aux));
  while posicao > 0 do
  begin
    Delete(Aux,posicao,2);
    Insert('X',Aux, posicao);
    posicao := pos('SH',String(Aux));
  end;

  {Troca-se Z por S quando terminar palavra
   Ex.: Luiz = Luis}
  for x:=1 to length(Aux) do
  begin
    if (Copy(Aux,x,1) = ' ') then
    begin
      if Copy (Aux,x-1,1) = 'Z' then
      begin
        delete (Aux,x-1,1);
        insert('S',Aux,x-1);
      end;
    end
    else if (x = length(Aux)) then
    begin
      if Copy (Aux,x,1) = 'Z' then
      begin
        delete (Aux,x,1);
        insert('S',Aux,x);
      end;
    end;
  end;

  {Quando S estiver entre duas vogais tem som de Z
   Ex.: Josimar = Jozimar}
  for x:=1 to length(Aux) do
  begin
    if (Copy(Aux,x,1) = 'S') and (x <>1) and (x <> length(Aux)) then
    begin
      if (Pos(Copy(String(Aux),x-1,1),'AEIOU') > 0) and (Pos(Copy(String(Aux),x+1,1),'AEIOU') > 0) then
      begin
        delete(Aux,x,1);
        insert('Z',Aux,x);
      end;
    end;
  end;

  {Exclu�-se H pois H n�o tem som fon�tico quando
   inicia palavras
   Ex.: Hilda = Ilda}
  for x:=1 to length(Aux) do
  begin
    if (Copy(Aux,x,1) = 'H') and (x <> length(Aux)) then
    begin
      if x =1 then
        delete(Aux,x,1)
      else if (Copy(Aux,x-1,1) = ' ') then
        delete(Aux,x,1);
    end;
  end;

  {Troca-se QU por C}
  posicao := Pos('QU',String(Aux));
  while (posicao > 0)  do
  begin
    Delete(Aux,posicao,2);
    Insert('C',Aux,Posicao);
    posicao := Pos('QU',String(Aux));
  end;

  {Retira-se todas vogais}
  posicao := Pos('A',String(Aux));
  while posicao > 0 do
  begin
    delete(Aux,posicao,1);
    posicao := pos('A',String(Aux));
  end;

  posicao := Pos('E',String(Aux));
  while posicao > 0 do
  begin
    delete(Aux,posicao,1);
    posicao := pos('E',String(Aux));
  end;

  posicao := Pos('I',String(Aux));
  while posicao > 0 do
  begin
    delete(Aux,posicao,1);
    posicao := pos('I',String(Aux));
  end;

  posicao := Pos('O',String(Aux));
  while posicao > 0 do
  begin
    delete(Aux,posicao,1);
    posicao := pos('O',String(Aux));
  end;

  posicao := Pos('U',String(Aux));
  while posicao > 0 do
  begin
    delete(Aux,posicao,1);
    posicao := pos('U',String(Aux));
  end;

  Soundex := PAnsiChar(Aux);
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

  try
    Img := TImage.Create(nil);
    Img.Picture.LoadFromFile(vpArquivoImagem);
    vpWptTexto.TextObjects.InsertCopy(Img.Picture.Graphic);

    vpWptTexto.ReformatAll;
  finally
    Img.Free;
  end;
end;

procedure InserirQrCodeTexto(var vpWptTexto : TWPRichText);
var
  Img : TImage;
  viValor : String;
  viImg : TBitmap;
begin
  if (vpWptTexto.BookmarkSelect('Qr�code�selo�a�', True)) or
     (vpWptTexto.BookmarkSelect('Qr�code�selo�g�a�', True)) or
     (vpWptTexto.BookmarkSelect('Qrcode�selo�g�a�', True))
     then
  begin
    viValor := vpWptTexto.SelText;
    vpWptTexto.ClearSelection(True);
    vpWptTexto.CPPosition := vpWptTexto.SelStart;

    viImg := GerarQrCode(viValor);//Gera o QrCode
    viImg.SaveToFile(ExtractFilePath(Application.ExeName)+'qrcode.bmp');
    FreeAndNil(viImg);

    try
      Img := TImage.Create(nil);
      Img.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'qrcode.bmp');
      vpWptTexto.TextObjects.InsertCopy(Img.Picture.Graphic);
      vpWptTexto.ReformatAll;
    finally
      Img.Free;
    end;
  end;
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

{Criar e Exibir os fomul�rios evitando efeito de montagem no mesmo}
procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False; vpMaximixar : Boolean = False);
begin
  if ClasseForm.InheritsFrom(
    TForm) then
    vgFormClass := TFormClass(
      ClasseForm);

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

      if vpMaximixar then
           TForm(Reference).WindowState := wsMaximized
      else TForm(Reference).WindowState := wsNormal;

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

{Cria e ativa um formul�rio atribuindo o parent e outras propriedades}
procedure AtivarFormulario(classForm    : TFormClass;
                           var NewForm;
                           var parent   : TWinControl;
                           borderStyle  : TBorderStyle = bsNone;
                           align        : TAlign       = alClient;
                           showForm     : Boolean      = True;
                           tag          : Integer      = 0);
var
  form: TForm;
begin
  if not Assigned(parent) then
    Exit;

  form := TForm(ClassForm.NewInstance);
  TForm(NewForm) := form;
  try
    Application.ProcessMessages;
    form.Create(nil);
    form.Parent      := parent;
    form.BorderStyle := borderStyle;
    form.Align       := align;
    form.Tag         := tag;

    if showForm then
      form.Show;
  except
    TForm(NewForm):= nil;
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
//   if not (Tecla in ['0'..'9',#8,#13]) then
  if not (CharInSet(Tecla, ['0'..'9',#8,#13])) then
    Tecla:= #0;
end;

Procedure Digitafloat( var Tecla:char);
begin
  if not (CharInSet(Tecla, ['0'..'9',#8,','])) then
    Tecla:= #0;
end;

procedure DigitaFone(Var Tecla : Char);
begin
  if not (CharInSet(Tecla, ['0'..'9',#8,'(', ')', '-'])) then
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
   if Pos(
        xCNPJ,
        '00000000000000|' +
        '11111111111111|' +
        '22222222222222|' +
        '33333333333333|' +
        '44444444444444|' +
        '55555555555555|' +
        '66666666666666|' +
        '77777777777777|' +
        '88888888888888|' +
        '99999999999999'
      ) > 0
   then
   begin
      result := false;
      exit;
   end;

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

   if Pos(
        num,
        '00000000000|' +
        '11111111111|' +
        '22222222222|' +
        '33333333333|' +
        '44444444444|' +
        '55555555555|' +
        '66666666666|' +
        '77777777777|' +
        '88888888888|' +
        '99999999999'
      ) > 0
   then
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

function RetornaCPFCNPJSemFormatar(Valor : String) : String;
begin
  if Length(RetiraZerosEsquerda(Valor)) <= 11 then
    Result := RetZeros(RetiraZerosEsquerda(Valor),11)
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

function RetPontos(Pontos:string;QUANT:integer):String;
var
  I,Tamanho:integer;
begin
  Tamanho := length(Pontos);

  if Tamanho = (QUANT div 2) then
    Tamanho := Trunc(Tamanho * (QUANT/100))
  else
  if Tamanho < (QUANT div 2) then
    Tamanho := 0;

  Result := Pontos;

  for I:=1 to quant-tamanho do
    Result := Result + '.';
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

function RetornaIP: String;
var
  r : TIdIPWatch;
begin
  try
    r := TIdIPWatch.Create(nil);
    Result := r.LocalIP;
  finally
    r.free;
  end;
end;

function DifHora(Inicio,Fim : String):String;
{Retorna a diferen�a entre duas horas}
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
//    if not (Valor[i] in ['0'..'9']) then
  if CharInSet(Valor[i], ['0'..'9', 'a'..'z', 'A'..'Z', '-', '/', '.', '_', ' ']) then
  begin
     Result := Result + Valor[i];
  end;
end;

function RetornaNumeroLetras(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if (Valor[i] in ['0'..'9', 'a'..'z', 'A'..'Z', ' ']) then
       Result := Result + Valor[i];
end;

function RetornaAlfa(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
//    if not (Valor[i] in ['0'..'9']) then
  if CharInSet(Valor[i], ['a'..'z', 'A'..'Z']) then
  begin
     Result := Result + Valor[i];
  end;
end;

function RetornaNumerico(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if CharInSet(Valor[i], ['0'..'9']) then
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

function RetornaNumerico_e_X(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
  begin
    if (CharInSet(Valor[i], ['0'..'9'])) or (Valor[i] = 'X') or (Valor[i] = 'x') then
       Result := Result + Valor[i];
  end;
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

  if meses = -1 then
    dec(anos);

  if anos = 1 then
     sAno := ' Ano '
  else
    if anos = 0 then
         sAno := ''
    else sAno := ' Anos ';

  if meses < 2 then
     sMes := ' M�s '
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

Function RetNull(Valor : String; vpTipo : String = 'S') : String;
begin
  if vpTipo = 'S' then
  begin
    if (Trim(Valor) = '') or (Trim(Valor) = '''''') then
         Result := 'Null'
    else Result := Valor;
  end
  else
  begin
     if Valor = null then
          Result := 'Null'
     else Result := VarToStr(vpTipo);
  end;
end;

Function RetNullInteger(Valor: Integer): String;
begin
  Result := IntToStr(Valor);
  if Valor = 0 then
    Result := 'Null'
end;


function CompressStringOld(Source: AnsiString): AnsiString;
var
  ms :TMemoryStream;
  CompStream: TZCompressionStream;
begin
  Result := '';
  if (Source <> '') then
  begin
    Source := UTF8Encode(Source);

    ms := tMemoryStream.Create;
    CompStream := TZCompressionStream.Create (ms);
    CompStream.Write (BytesOf(Source), 2*Length(BytesOf(Source)));
    CompStream.Free;
    ms.position := 0;
    SetLength(Result,Ms.size );
    SetString(Result, PAnsiChar(Ms.Memory), Ms.Size div SizeOf(Result[1]) - 1);
    ms.Free;

    CompStream := nil;
    ms := nil;
  end
  else
    Result := Source;
end;

function DeCompressStringOld(Source: AnsiString):AnsiString;
var
  ms: tMemoryStream;
  Decomp: TZDecompressionStream;
  C: AnsiChar;
Begin
  Result := '';
  try
    if (Source <> '') and (Pos('{\rtf',string(Source)) = 0) and (Pos('<?xml',string(Source)) = 0) and (Source <> #0) then
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
        Result := Source;
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
end;

function CompressString(const Str: AnsiString): AnsiString;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  Utf8Stream := TStringStream.Create(Str, TEncoding.UTF8);
  try
    Compressed := TMemoryStream.Create;
    try
      ZCompressStream(Utf8Stream, Compressed);
      Compressed.Position := 0;
      Base64Stream := TStringStream.Create('', TEncoding.ASCII);
      try
        EncodeStream(Compressed, Base64Stream);
        Result := Base64Stream.DataString;
      finally
        Base64Stream.Free;
      end;
    finally
      Compressed.Free;
    end;
  finally
    Utf8Stream.Free;
  end;
end;

function CompressStringStream(const Str: AnsiString): TStringStream;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  Utf8Stream := TStringStream.Create(Str, TEncoding.UTF8);
  try
    Compressed := TMemoryStream.Create;
    try
      ZCompressStream(Utf8Stream, Compressed);
      Compressed.Position := 0;
      Base64Stream := TStringStream.Create('', TEncoding.ASCII);
      EncodeStream(Compressed, Base64Stream);
      Result := Base64Stream;
    finally
      Compressed.Free;
    end;
  finally
    Utf8Stream.Free;
  end;
end;

function DecompressString(const Str: AnsiString): AnsiString;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  try
    if (Str <> '') and (Pos('{\rtf',string(Str)) = 0) and (Pos('<?xml',string(Str)) = 0) and (Str <> #0) then
    begin
      Base64Stream := TStringStream.Create(Str, TEncoding.ASCII);
      try
        Compressed := TMemoryStream.Create;
        try
          DecodeStream(Base64Stream, Compressed);
          Compressed.Position := 0;
          Utf8Stream := TStringStream.Create('', TEncoding.UTF8);
          try
            ZDecompressStream(Compressed, Utf8Stream);
            Result := Utf8Stream.DataString;
          finally
            Utf8Stream.Free;
          end;
        finally
          Compressed.Free;
        end;
      finally
        Base64Stream.Free;
      end;
    end
    else
      Result := DeCompressStringOld(Str);
  except
    Result := DeCompressStringOld(Str);
  end;
end;

function Alltrim(Text: string): string;
begin
  while Pos(' ', Text) > 0 do
    Delete(Text, Pos(' ', Text), 1);
  Result := Text;
end;

function RemoveAcentos(sTexto: string): string;
const
  ComAcento = '����������������������������&�`.';
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
      if cTexto <> '' then
      begin
        if cTexto[Length(cTexto)] <> ' ' then
          cTexto := cTexto + ' ';
      end;

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
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
begin
  Result := '';
  try
    Lib := LoadLibrary('rpcrt4.dll');
    if Lib <> 0 then
    begin
      @Func := GetProcAddress(Lib, 'UuidCreateSequential');
      if Assigned(Func) then
      begin
        if (Func(@GUID1) = 0) and
          (Func(@GUID2) = 0) and
          (GUID1.D4[2] = GUID2.D4[2]) and
          (GUID1.D4[3] = GUID2.D4[3]) and
          (GUID1.D4[4] = GUID2.D4[4]) and
          (GUID1.D4[5] = GUID2.D4[5]) and
          (GUID1.D4[6] = GUID2.D4[6]) and
          (GUID1.D4[7] = GUID2.D4[7]) then
        begin
          Result :=
          IntToHex(GUID1.D4[2], 2) + '-' +
          IntToHex(GUID1.D4[3], 2) + '-' +
          IntToHex(GUID1.D4[4], 2) + '-' +
          IntToHex(GUID1.D4[5], 2) + '-' +
          IntToHex(GUID1.D4[6], 2) + '-' +
          IntToHex(GUID1.D4[7], 2);
        end;
      end;
    end;
  except
    on E :Exception do
       Application.MessageBox(PChar(e.message), 'Erro', MB_ICONERROR + MB_OK);
  end;
end;

function ConvertChars(S: String): String;
const SChars = '��������������������������������������';
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
        begin
          viResult := viResult + ' '+ UpCase(viP[1]) + copy(viP,2,30);
          if viP[1] = '�' then
            viResult := '�' + copy(viP,2,30)
          else
            if viP[1] = '�' then
              viResult := '�' + copy(viP,2,30);
        end
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
  Chave, SerialHD: String;
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
//Fun��o para retornar o valor correspondente na tabela dos c�digos de barras
Var sBarCodeTable : Array [0..105] of String;
    liContador : integer;
begin
  sBarCodeTable[0] := '�';
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
  sBarCodeTable[91] := '�';
  sBarCodeTable[92] := '�';
  sBarCodeTable[93] := '�';
  sBarCodeTable[94] := '�';
  sBarCodeTable[95] := '�';
  sBarCodeTable[96] := '�';
  sBarCodeTable[97] := '�';
  sBarCodeTable[98] := '�';
  sBarCodeTable[99] := '�';
  sBarCodeTable[100] := '�';
  sBarCodeTable[101] := '�';
  sBarCodeTable[102] := '�';
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
//Fun��o para retornar a codifica��o do c�digo de barras 128
var lWeighting,
    lResult,
    iContador: integer;
    sBarCode: String;
begin
  //Inicializa vari�veis
  lWeighting := 1;
  lResult := 103;
  GenerateBarCode128AB := Null;

  //Primeiro caracter
  sBarCode := VerifyBarCodeTable(1, '', lResult);

  //Calcula d�gito verificador m�dulo 103
  for iContador := 1 To Length(vExpression) do
  begin
    lResult := lResult + lWeighting * VerifyBarCodeTable(0, vExpression[iContador]);
    lWeighting := lWeighting + 1;
  end;

  lResult := lResult Mod 103;

  //Retorna c�digo de barras
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

function RetornaNumericoEspecial(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if CharInSet(Valor[i],['0'..'9', '.', ',', ' ']) then
       Result := Result + Valor[i];
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
      Result := 'Amap�'
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
      Result := 'Esp�rito Santo'
  else
    if vpTexto = 'GO' then
      Result := 'Goi�s'
  else
    if vpTexto = 'MA' then
      Result := 'Maranh�o'
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
      Result := 'Par�'
  else
    if vpTexto = 'PB' then
      Result := 'Para�ba'
  else
    if vpTexto = 'PE' then
      Result := 'Pernambuco'
  else
    if vpTexto = 'PI' then
      Result := 'Piau�'
  else
    if vpTexto = 'PR' then
      Result := 'Paran�'
  else
    if vpTexto = 'RJ' then
      Result := 'Rio de Janeiro'
  else
    if vpTexto = 'RN' then
      Result := 'Rio Grande do Norte'
  else
    if vpTexto = 'RO' then
      Result := 'Rond�nia'
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
      Result := 'S�o Paulo'
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
   npalavras: Integer; // N�mero de "palavras"
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
 // 1. Transformar os textos para a mesma caixa e remover espa�os em branco
 Origem := AnsiUpperCase(Trim(RemoveAcentos(Origem)));
 Destino := AnsiUpperCase(Trim(RemoveAcentos(Destino)));
 // 2a. Verificar se os textos s�o vazios: se forem, similaridade 0 e sai
 if not Validacao then
 begin
   Result := 0;
   Exit;
 end;
 // 2b. Verificar se os textos s�o iguais: se forem, similaridade 100%
 // e termina o processo
 if SameText(Origem, Destino) then
 begin
   Result := 100;
   Exit;
 end;
 // 3. para cada caracter do texto origem verificar se ele existe no texto
 // destino, e em caso positivo, incrementar 1 no contador de similaridade.
 SimilaridadeCaracter;
 // 4. o quociente contador / n�mero de caracteres no destino indica a
 // similaridade sem considerar a ordem dos caracteres.
 Result := SimCar / Length(Destino);
 if Result = 0 then
   Exit;
 // 5. considerando a ordem, remove-se os caracteres da origem que n�o
 // existem no destino e os caracteres do destino que n�o existem na
 // origem, igualando os dois textos
 RemoveNaoCoincidentes(Origem, Destino);
 RemoveNaoCoincidentes(Destino, Origem);
 // 6. agora, com uma fun��o que gere uma lista de "palavras" formadas
 // pelos caracteres da origem, da seguinte forma:
 // origem ajustada: "peto", com os caracteres n�o coincidentes removidos,
 // a lista gerada seria a seguinte
 // p, e, t, o, pe, et, to, pet, eto, peto: 4 caracteres = 10 palavras
 // map = m, a, p, ma, ap, map: 3 caracteres = 6 palavras
 // jorge = j, o, r, g, e, jo, or, rg, ge, jor, org, rge, jorg, orge,
 // jorge: 5 caracteres = 15 palavras
 // O n�mero de "palavras" dentro da lista � definido pela f�rmula
 // 0,5j^2+0,5j, onde j � o n�mero de caracteres do texto origem ajustado.
 GeraLista;
 // Cada palavra da lista encontrada dentro da palavra destino ajustada
 // incrementa uma unidade no contador de similaridade de ordem.
 // A similaridade de ordem � o quociente do contador sobre o n�mero de
 // palavras da lista.
 SimilaridadeOrdem;

 Result := Round(Result * 100);
end;

Function Nvl(pValue,IfNull: Variant): Variant;
begin
  if pValue = Null then
    Result := IfNull
  else
    Result := pValue
end;

function ValidarNomeSobrenome(Valor : string) : Boolean;
var
  i: integer;
begin
  Valor := Trim(Valor);
  Result := False;
  for i:= 1 to Length(Valor) do
    if Valor[i] = ' ' then
    begin
      Result := True;
      Break;
    end;
end;

procedure EnableDisableControls(Form: TForm; ClassComponents: array of TControlClass; State: Boolean; Condition : Boolean = False);
var
  i,j: Integer;
begin
  for I := 0 to Form.ComponentCount -1 do
    for j := Low(ClassComponents) to High(ClassComponents) do
        if (Form.Components[i] is ClassComponents[j]) then
          if Condition then
          begin
            if (Form.Components[i] as ClassComponents[j]).Tag = 379 then
              (Form.Components[i] as ClassComponents[j]).Enabled := State
          end
          else
           (Form.Components[i] as ClassComponents[j]).Enabled := State;
end;

function RetorneAno(vpData: TDateTime): Integer;
begin
  Result := StrToInt(FormatDateTime('yyyy', vpData));
end;

function RetorneDataRegistro(vpData: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', vpData) + 'T' +
  FormatDateTime('hh:nn:ss', vpData) + '.089-03:00';
end;

function RetorneHora(vpData: TDateTime): string;
begin
  Result := '';
  if FormatDateTime('hh:nn', vpData) <> '00:00' then
    Result := FormatDateTime('hh:nn', vpData);
end;

function RetireCaracterEspecialNoTextoXml(vpTexto: string): string;
var
  i: Integer;
  viAux: string;
begin
  viAux := '';

  for i := 1 to Length(vpTexto) do begin
    if not CharInSet(vpTexto[i],['>','<','"','''','�','.','*','&',',']) then
      viAux := viAux + Copy(vpTexto, i, 1);
  end;

  Result := Trim(viAux);
end;

function RetorneLocalNascimento(vpLocal: Integer): string;
begin
  Result := 'FORA_UNIDADE_SAUDE';
  if vpLocal in [1,2] then
    Result := 'UNIDADE_SAUDE';
end;

function RemoveAcentoECedilha(vpTexto: string): string;
const
  vcComAcento = '������������������������������������������������';
  vcSemAcento = 'aeiouAEIOUaeiouAEIOUaeiouAEIOUaoAOaeiouAEIOUcCnN';
var
  i: Integer;
Begin
  for i := 1 to Length(vpTexto) do begin
    if Pos(vpTexto[i],vcComAcento) <> 0 Then
      vpTexto[i] := vcSemAcento[Pos(vpTexto[i],vcComAcento)];
  end;

  Result := vpTexto;
end;

function RetorneSexo(vpTipo: string): string;
begin
  if Trim(vpTipo) = '' then
    Result := 'IGNORADO'
  else if Trim(vpTipo) = 'F' then
    Result := 'FEMININO'
  else if Trim(vpTipo) = 'M' then
    Result := 'MASCULINO';
end;

function RetorneSexoAnimal(vpTipo: string): string;
begin
  if Trim(vpTipo) = '' then
    Result := 'IGNORADO'
  else if Trim(vpTipo) = 'F' then
    Result := 'F�MEA'
  else if Trim(vpTipo) = 'M' then
    Result := 'MACHO';
end;

function NaoPodeConterPalavras(vpNome: string): string;
const
  Palavras: array [1..49] of string = (
    'falecido','falecida','desconhecido','desconhecida','natimorto','natimorta',
    'rec�m-nascido','recem-nascido','rec�m nascido','recem nascido','rec�m-nascida',
    'recem-nascida','rec�m nascida','recem nascida','cad�ver','cadaver','ignorado',
    'ignorada','identificado','identificada','complementos','feto','identidade',
    'inv�lido','inv�lida','invalido','invalida','n�o','existe','m�e','mae',
    'teste','fulano','rec�n nascido','recen nascido','rec�n-nascido',
    'recen-nascido','rec�m nacido','recem nacido','rec�m-nacido',
    'recem-nacido','rec�n nascida','recen nascida','rec�n-nascida',
    'recen-nascida','rec�m nacida','recem nacida','rec�mnacida','recem-nacida');
var
  i: Integer;
begin
  Result := '';
  for i := Low(Palavras) to High(Palavras) do begin
    if Pos(Palavras[i], Trim(vpNome)) > 0 then begin
      Result := Palavras[i];
      Exit;
    end;
  end;
end;

function RetorneDescricaoCorPele(vpTipo: Integer): string;
begin
  case vpTipo of
   1: Result := 'BRANCA';
   2: Result := 'PRETA';
   3: Result := 'AMARELA';
   4: Result := 'PARDA';
   5: Result := 'INDIGENA';
  else
    Result := 'IGNORADO';
  end;
end;

function RetorneRegimeCasamento(vpTipo: Integer): string;
begin
  case vpTipo of
   1, 5: Result := 'COMUNHAO_PARCIAL';
   2: Result := 'COMUNHAO_UNIVERSAL';
   3, 6: Result := 'SEPARACAO_BENS';
  else
    Result := 'OUTROS';
  end;
end;

function DnvValido(vpDNV: string): Boolean;
begin
  Result := vpDNV = RetornaDnvCorreto(vpDNV);
end;

function FaixaDnvValido(vpDNV: string): Boolean;
{$REGION 'Vari�veis'}
var
  viNumDnv: Integer;
{$ENDREGION}
begin
  Result := False;

  if (Length(vpDNV) = 8) and (StrToInt(vpDNV) <= 43700000) then
    Result := True
  else
  begin
    viNumDnv := StrToInt(Copy(vpDNV, 3, 8));

    if (Copy(vpDNV, 1, 2) = '00') and (viNumDnv >= 43700001) and (viNumDnv <= 48101000) then
      Result := True
    else if (Copy(vpDNV, 1, 2) = '30') and (viNumDnv > 48101000) then
      Result := True;
  end;
end;

function RetornaDnvCorreto(vpDNV: string): string;
{$REGION 'Vari�veis'}
var
  viNumDnv: Integer;
{$ENDREGION}

  function calculeDVSegundaGeracao(vpNum: Integer): string;
  begin
    if (vpNum mod 11) in [0, 10] then
      Result := '0'
    else
      Result := IntToStr(vpNum mod 11);
  end;

  function calculeDVTerceiraGeracao(vpNum: string): string;
  {$REGION 'Vari�veis'}
  var
    viSomaPesos: Integer;
  {$ENDREGION}
  begin
    viSomaPesos :=
      3 * StrToInt(Copy(vpNum, 1, 1)) +
      2 * StrToInt(Copy(vpNum, 2, 1)) +
      9 * StrToInt(Copy(vpNum, 3, 1)) +
      8 * StrToInt(Copy(vpNum, 4, 1)) +
      7 * StrToInt(Copy(vpNum, 5, 1)) +
      6 * StrToInt(Copy(vpNum, 6, 1)) +
      5 * StrToInt(Copy(vpNum, 7, 1)) +
      4 * StrToInt(Copy(vpNum, 8, 1)) +
      3 * StrToInt(Copy(vpNum, 9, 1)) +
      2 * StrToInt(Copy(vpNum, 10, 1));

    if (viSomaPesos mod 11) in [0, 1] then
      Result := '0'
    else
      Result := IntToStr(11 - (viSomaPesos mod 11));
  end;
begin
  if (Length(vpDnv) = 8) and (StrToInt(vpDnv) <= 43700000) then
    Result := vpDNV
  else
  begin
    viNumDnv := StrToInt(Copy(vpDNV, 3, 8));

    if (viNumDnv >= 43700001) and (viNumDnv <= 48101000) then
      Result := '00' + IntToStr(viNumDnv) + calculeDVSegundaGeracao(viNumDnv)
    else if viNumDnv > 48101000 then
      Result := '30' + IntToStr(viNumDnv) + calculeDVTerceiraGeracao(vpDNV);
  end;
end;

function DoValido(vpDO: string): Boolean;
begin
  Result := vpDO = RetornaDoCorreto(vpDO);
end;

function RetornaDoCorreto(vpDO: string): string;
{$REGION 'Vari�veis'}
var
  viNumDO: Integer;
{$ENDREGION}

  function calculeDVSegundaGeracao(vpNum: Integer): string;
  begin
    if (vpNum mod 11) in [0, 10] then
      Result := '0'
    else
      Result := IntToStr(vpNum mod 11);
  end;

  function calculeDVTerceiraGeracao(vpNum: string): string;
  {$REGION 'Vari�veis'}
  var
    viSomaPesos: Integer;
  {$ENDREGION}
  begin
    viSomaPesos :=
      9 * StrToInt(Copy(vpNum, 1, 1)) +
      8 * StrToInt(Copy(vpNum, 2, 1)) +
      7 * StrToInt(Copy(vpNum, 3, 1)) +
      6 * StrToInt(Copy(vpNum, 4, 1)) +
      5 * StrToInt(Copy(vpNum, 5, 1)) +
      4 * StrToInt(Copy(vpNum, 6, 1)) +
      3 * StrToInt(Copy(vpNum, 7, 1)) +
      2 * StrToInt(Copy(vpNum, 8, 1));

    if (viSomaPesos mod 11) in [0, 1] then
      Result := '0'
    else
      Result := IntToStr(11 - (viSomaPesos mod 11));
  end;
begin
  if (Length(vpDO) = 8) and (StrToInt(vpDO) <= 12075500) then
    Result := vpDO
  else
  begin
    viNumDO := StrToInt(Copy(vpDO, 1, 8));

    if (viNumDO >= 12075501) and (viNumDO <= 13599999) then
      Result := IntToStr(viNumDO) + calculeDVSegundaGeracao(viNumDO)
    else if viNumDO > 13600002 then
      Result := IntToStr(viNumDO) + calculeDVTerceiraGeracao(IntToStr(viNumDO));
  end;
end;

function FaixaDoValido(vpDO: string): Boolean;
{$REGION 'Vari�veis'}
var
  viNumDO: Integer;
{$ENDREGION}
begin
  Result := False;

  if (Length(vpDO) = 8) and (StrToInt(vpDO) <= 12075500) then
    Result := True
  else
  begin
    viNumDO := StrToInt(Copy(vpDO, 1, 8));

    if (viNumDO >= 12075501) and (viNumDO <= 13599999) then
      Result := True
    else if viNumDO > 13600002 then
      Result := True;
  end;
end;

function MinutosParaHora(vpMinutos: Integer): string;
var
  Hr, min : Integer;
begin
  hr := 0;
  while vpMinutos >= 60 do begin
    vpMinutos := vpMinutos - 60;
    hr := hr + 1;
  end;
  min := vpMinutos;
  Result := FormatFloat('00:', hr) + FormatFloat('00', min);
end;

function RetornaLetra(viTexto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(viTexto) do
    if CharInSet(viTexto[i], ['A'..'Z']) then
       Result := Result + viTexto[i];
end;

function RetorneIdade(vpDataAtual: TDateTime; vpDataAntiga: TDateTime): Integer;
begin
  Result :=
    (StrToInt(FormatDateTime('YYYY', vpDataAtual)) - StrToInt(FormatDateTime('YYYY', vpDataAntiga)));
end;

function RetorneEstadoCivil(vpEstadoCivilId: Integer): string;
begin
  Result := '';
  case vpEstadoCivilId of
    44: Result := 'SOLTEIRO';
    45: Result := 'CASADO';
    46,47: Result := 'DIVORCIADO';
    49,50: Result := 'SEPARADO';
    51: Result := 'VIUVO';
  end;
end;

function RetorneTipoLocalObito(vpLocal: Integer): string;
begin
  Result := 'OUTROS';
  case vpLocal of
    1: Result := 'HOSPITAL';
    2: Result := 'OUTROS_SERVICOS_SAUDE';
    3: Result := 'DOMICILIO';
    5: Result := 'VIA_PUBLICA';
  end;
end;

function RetorneDiaDaSemana(vpDia: Integer): string;
begin
  Result := '';
  case vpDia of
    1: Result := 'Domingo';
    2: Result := 'Segunda-Feira';
    3: Result := 'Ter�a-Feira';
    4: Result := 'Quarta-Feira';
    5: Result := 'Quinta-Feira';
    6: Result := 'Sexta-Feira';
    7: Result := 'S�bado';
  end;
end;

function RetorneTipoDocumento(vpDocumento: string): string;
begin
  if vpDocumento = 'CPF' then
    Result := 'CPF'
  else  if vpDocumento = 'RG' then
    Result := 'RG'
  else  if vpDocumento = 'NIT' then
    Result := 'NIT'
  else  if vpDocumento = 'RIC' then
    Result := 'RIC'
  else  if vpDocumento = 'RNE' then
    Result := 'RNE'
  else  if vpDocumento = 'T�tulo de Eleitor' then
    Result := 'TITULO_DE_ELEITOR'
  else  if vpDocumento = 'Passaporte' then
    Result := 'PASSAPORTE'
  else  if vpDocumento = 'CNH' then
    Result := 'CNH'
  else  if vpDocumento = 'CTPS' then
    Result := 'CTPS'
  else  if vpDocumento = 'Carteira de Mar�timo' then
    Result := 'CARTEIRA_DE_MARITIMO'
  else  if vpDocumento = 'DOCUMENTO ESTRANGEIRO' then
    Result := 'DOC_ESTRANGEIRO'
  else  if vpDocumento = 'Certid�o de Nascimento' then
    Result := 'CERT_DE_NASCIMENTO'
    else  if vpDocumento = 'Certid�o de Reservista' then
    Result := 'CERT_DE_RESERVISTA'
  else
    Result := 'NAO_IDENTIFICADO';
end;

function RetorneOrgaoEmissor(vpAbreviatura: string): Integer;
begin
  if vpAbreviatura = 'SSP' then
    Result := 1
  else if vpAbreviatura = 'MIN.AERONAUT' then
    Result := 2
  else if vpAbreviatura = 'MIN.EXERCITO' then
    Result := 3
  else if vpAbreviatura = 'MIN.MARINHA' then
    Result := 4
  else if vpAbreviatura = 'SE/DPMAF' then
    Result := 5
  else if vpAbreviatura = 'CRA' then
    Result := 6
  else if vpAbreviatura = 'CRAS' then
    Result := 7
  else if vpAbreviatura = 'CRB' then
    Result := 8
  else if vpAbreviatura = 'CRC' then
    Result := 9
  else if vpAbreviatura = 'CRECI' then
    Result := 10
  else if vpAbreviatura = 'CORECON' then
    Result := 11
  else if vpAbreviatura = 'COREN' then
    Result := 12
  else if vpAbreviatura = 'CREA' then
    Result := 13
  else if vpAbreviatura = 'CONRE' then
    Result := 14
  else if vpAbreviatura = 'CRF' then
    Result := 15
  else if vpAbreviatura = 'CREFITO' then
    Result := 16
  else if vpAbreviatura = 'CRM' then
    Result := 17
  else if vpAbreviatura = 'CRMV' then
    Result := 18
  else if vpAbreviatura = 'OMBCRE' then
    Result := 19
  else if vpAbreviatura = 'CRN' then
    Result := 20
  else if vpAbreviatura = 'CRO' then
    Result := 21
  else if vpAbreviatura = 'CONRERP' then
    Result := 22
  else if vpAbreviatura = 'CRP' then
    Result := 23
  else if vpAbreviatura = 'CRQ' then
    Result := 24
  else if vpAbreviatura = 'CORE' then
    Result := 25
  else if vpAbreviatura = 'OAB' then
    Result := 26
  else if vpAbreviatura = 'CRBIO' then
    Result := 27
  else if vpAbreviatura = 'CRFA' then
    Result := 28
  else if vpAbreviatura = 'CRESS' then
    Result := 29
  else if vpAbreviatura = 'CRTR' then
    Result := 30
  else if vpAbreviatura = 'DETRAN' then
    Result := 31
  else if vpAbreviatura = 'PM' then
    Result := 32
  else if vpAbreviatura = 'CBM' then
    Result := 33
  else if vpAbreviatura = 'IBA' then
    Result := 34
  else if vpAbreviatura = 'SEDS' then
    Result := 35
  else if vpAbreviatura = 'SMDS' then
    Result := 36
  else if vpAbreviatura = 'DOCUMENT. EXPED. EXT' then
    Result := 90
  else
    Result := 99; // OUTROS
end;

function PegarTexto(vpTexto: string; vpPosicao: Integer): string;
var
  vpCampo: Integer;
  i: Integer;
begin
  Result := '';
  vpCampo := 1;

  for i := 1 to Length(vpTexto) do
  begin
    if vpTexto[i] = ';' then
      Inc(vpCampo)
    else if vpCampo = vpPosicao then
      Result := Result + vpTexto[i]
    else if vpCampo > vpPosicao then
    begin
      Result := Trim(Result);
      Exit;
    end;
  end;

  Result := Trim(Result);
end;

{ TListCurrency }

class function TListCurrency.Get(
  const vpValues: TArray<Currency>): TListCurrency;
{$REGION 'Vari�veis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := TListCurrency.Create;

  for viValue in vpValues do
    Result.Add(viValue);
end;

function TListCurrency.GetMaxValue: Currency;
{$REGION 'Vari�veis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := First;

  for viValue in Self do
    if viValue > Result then
      Result := viValue;
end;

procedure IniciarIncrementarProgressBar(vpProgress : tcxProgressBar;
    vpValor : Integer; vpIncrementar : Boolean = False);
begin
  if not vpIncrementar then
  begin
    vpProgress.Properties.Max := vpValor;
    vpProgress.Properties.Min := 0;
    vpProgress.Position       := 0;
    vpProgress.Visible        := True;
  end
  else vpProgress.Position := vpProgress.Position + vpValor;
  vpProgress.Refresh;
end;

function FormataData(vpData: TDateTime): string;
begin
  Result := FormatDateTime('dd/mm/yyyy', vpData);
end;

function EncodeBase64(const inStr: string): string;

  function Encode_Byte(b: Byte): char;
  const
    Base64Code: string[64] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  begin
    Result := Char(Base64Code[(b and $3F)+1]);
  end;
var
  i: Integer;
begin
  i := 1;
  Result := '';

  while i <= Length(InStr) do
  begin
    Result := Result + Encode_Byte(Byte(inStr[i]) shr 2);
    Result := Result + Encode_Byte((Byte(inStr[i]) shl 4) or (Byte(inStr[i+1]) shr 4));
    if i+1 <= Length(inStr) then
      Result := Result + Encode_Byte((Byte(inStr[i+1]) shl 2) or (Byte(inStr[i+2]) shr 6))
    else
      Result := Result + '=';
    if i+2 <= Length(inStr) then
      Result := Result + Encode_Byte(Byte(inStr[i+2]))
    else
      Result := Result + '=';
    Inc(i, 3);
  end;
end;

function ValidarEMail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

function RetorneTipoSanguineo(vpTipoSanguineo: string): string;
begin
  if vpTipoSanguineo = 'APO' then
    Result := 'A+'
  else if vpTipoSanguineo = 'ANE' then
    Result := 'A-'
  else if vpTipoSanguineo = 'ABP' then
    Result := 'AB+'
  else if vpTipoSanguineo = 'ABN' then
    Result := 'AB-'
  else if vpTipoSanguineo = 'BPO' then
    Result := 'B+'
  else if vpTipoSanguineo = 'BNE' then
    Result := 'B-'
  else if vpTipoSanguineo = 'OPO' then
    Result := 'O+'
  else if vpTipoSanguineo = 'ONE' then
    Result := 'O-';
end;

end.
