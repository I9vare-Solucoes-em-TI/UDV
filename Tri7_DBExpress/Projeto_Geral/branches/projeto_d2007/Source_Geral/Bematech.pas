unit Bematech;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Controles, Rotinas, DBClient, Modulo, WPCTRRich, Clipbrd;

type

  CAMPOS_BEMATECH = Record
    ComandoBematech: Integer;
    ComunicaBematech : String;
    Modelo : String;
  end;

  procedure AbrirPortaImpressoraBematech;
  procedure FecharPortaImpressoraBematech;
  procedure ModeloImpressoraBematech;

  procedure Autenticar(Texto : String);
  procedure ImprimirReciboBematech(wptTexto : TWPRichText);
  Function Calc_Tam_String(Str1, Str2: String): String;


implementation

uses ControleVariaveis;

var vgDadosBematech : CAMPOS_BEMATECH;
    vgPortaAberta : Boolean;

Function Calc_Tam_String(Str1, Str2: String): String;
var
  Tam1, Tam2, Dif: Integer;
  Str2Corrigida: String;
begin
  Tam1 := Length(Str1);
  Str2Corrigida := Trim(Str2);
  Tam2 := Length(Str2Corrigida);
  if Tam1<Tam2 then
    Dif  := 0
  else
    Dif  := Tam1-Tam2;
  Calc_Tam_String := Str2Corrigida+StringOfChar(' ', Dif);
end;

procedure AbrirPortaImpressoraBematech;
var Controle  : integer;
    sComando: string;
begin
  // Fecha a porta aberta impressora bematech
  Controle := FechaPorta();
  if Controle <= 0 then
    Application.MessageBox('Problemas ao fechar a porta de Comunica��o!', 'Erro', MB_OK + MB_ICONERROR);

  vgDadosBematech.ComunicaBematech := dtmControles.BuscarConfig('BEMATECH', 'PARAMETROS', 'PORTA_IMPRESSORA', 'S') + #0;  {'COM2'#0; 'LPT1'#0; 'USB'#0;}

  // Abrir a porta de comunica��o da impressora bematech
  Controle := IniciaPorta(Pchar(vgDadosBematech.ComunicaBematech));
  if Controle <= 0 then
    Application.MessageBox('Problemas ao abrir a porta de Comunica��o!', 'Erro', MB_OK + MB_ICONERROR);

  ModeloImpressoraBematech;

  vgPortaAberta := True;

  sComando := Chr(27) + Chr(116) + chr(49); // Ativa tabela Abicomp
  vgDadosBematech.ComandoBematech := ComandoTX( sComando, Length( sComando ));
end;

procedure FecharPortaImpressoraBematech;
var Controle  : integer;
    sComando: string;
begin
  sComando := Chr(27) + Chr(116) + chr(48); // Desativa tabela Abicomp
  vgDadosBematech.ComandoBematech := ComandoTX( sComando, Length( sComando));

  Controle := FechaPorta();

  vgPortaAberta := False;

  if Controle <= 0 then
    Application.MessageBox('Problemas ao fechar a porta de Comunica��o!', 'Erro', MB_OK + MB_ICONERROR);
end;

procedure ModeloImpressoraBematech;
var ModeloImpressora : integer;
begin
  ModeloImpressora := 2;  // Impressora MP20 MI ou CI
  vgDadosBematech.Modelo := dtmControles.BuscarConfig('BEMATECH', 'PARAMETROS', 'MODELO_BEMATECH', 'S');

  // Configura o modelo da impressora
//  vgDadosBematech.ComandoBematech := ConfiguraModeloImpressora(ModeloImpressora);
  vgDadosBematech.ComandoBematech := ConfiguraModeloImpressora(5);
  if vgDadosBematech.ComandoBematech = -2 Then
  begin
    Application.MessageBox('Par�metro inv�lido na fun��o "ConfiguraModeloImpressora."', 'Erro',
      MB_OK + MB_ICONERROR);
  end;

end;

procedure Autenticar(Texto : String);
var Buffer : String;
begin
  // Inicia Autentica��o
  Buffer  := Texto + Chr(13) + Chr(10);
  vgDadosBematech.ComandoBematech := FormataTX(Buffer, 1, 0, 0, 0, 0);

end;

procedure ImprimirReciboBematech(wptTexto : TWPRichText);
var Buffer, Aux, Texto, Codigo : string;
    i, j, Tamanho, TAux : integer;

  print : textfile ;
begin
  if not vgPortaAberta then
    AbrirPortaImpressoraBematech;


AssignFile ( print ,  '\\nome_computador_local\nome_compartilhado_impressora' ) ; // A impress�o � no proprio computador onde esta instalado a impressora ou na rede tbm se quizer !!!
Rewrite (print);
WriteLn (print , 'Linha impressa 1');
WriteLn (print , 'Linha impressa 2');
WriteLn (print , 'Linha impressa 3');
CloseFile (print);
exit;
    // Somente para teste
//    wptTexto.SaveToFile('d:\Teste.txt');

  for i := 0 to wptTexto.Lines.Count - 1 do
  begin
    Aux := wptTexto.Lines.Strings[i];
    Tamanho := 0;
    TAux    := 0;
    Codigo := Copy(Aux,Pos('[', Aux)+1, Pos(']', Aux)-2);
    if pos('CodCx', Codigo) > 0 then
      Delete(Aux, Pos('[', Aux), Pos(']', Aux));

    while Pos('[', Aux) <> 0 do
    begin
      Codigo := Copy(Aux,Pos('[', Aux)+1, Pos(']', Aux)-2);
      if pos('CodCx', Codigo) > 0 then
        Codigo := '';
      Delete(Aux, Pos('[', Aux), Pos(']', Aux));
      if Pos('[', Aux) <> 0 then
         Texto  := Copy(Aux,1 , Pos('[', Aux)-1)
      else begin
           Texto := Aux;
           Aux   := '';
      end;
      Delete(Aux, 1, Pos('[', Aux) -1);
      TAux := length(Texto);

      if vgDadosBematech.Modelo = '1' then
        for j := 1 to tamanho do
          Texto := ' ' + Texto;

      Buffer  := Texto + Chr(13);
      vgDadosBematech.ComandoBematech := FormataTX(Buffer, StrToInt(Codigo[1]), StrToInt(Codigo[2]), StrToInt(Codigo[3]), StrToInt(Codigo[4]), StrToInt(Codigo[5]));

      Tamanho := TAux;
    end;

    Buffer  := Aux + Chr(13) + Chr(10);
    if vgDadosBematech.Modelo = '1' then
         vgDadosBematech.ComandoBematech := FormataTX(Buffer, 2, 0, 0, 0, 0)
    else vgDadosBematech.ComandoBematech := FormataTX(Buffer, 3, 0, 0, 0, 0);
  end;
end;

end.
