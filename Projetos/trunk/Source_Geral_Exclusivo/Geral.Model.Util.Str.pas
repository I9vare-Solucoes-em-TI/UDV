unit Geral.Model.Util.Str;

interface

uses
  System.Generics.Collections;

type
  TUtilString = class
  public
    class function RetornarValorListaInteiro(
      const vpLista: TList<Integer>;
      const vpSeparador: string): string;

    class function RetornarValorLista(
      const vpLista: TList<string>;
      const vpSeparador: string): string;

    class function BuscarQuebraLinhaDupla: string;

    class function ConverterBytesParaHex(
      const vpBytes: TArray<Byte>;
      const vpDigitos: Integer;
      const vpLetraMinuscula: Boolean;
      const vpSeparador: string): string;

    class function IncluirDelimitador(
      const vpCaminho: string): string;

    class function PreencherString(vpTexto: string; vpCaracter: String; vpTamanho: integer; vpDirecao: string = 'E'): String;

    class function PegarMesExtenso(vpMesNumero : String):String;

    class function RetornaNumerico(
      const vpValor: string): string;

    class function RetornaAlfa(
      const vpValor: string): string;

    class function MaiusculoMinusculo(
      vpPalavra: string;
      const vpRetirarEspacos: Boolean = True): string;

    class function ValidarEmail(
      const vpEmail: string): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.RegularExpressions;

{ TUtilString }

class function TUtilString.BuscarQuebraLinhaDupla: string;
begin
  Result := DupeString(sLineBreak, 2);
end;

class function TUtilString.ConverterBytesParaHex(
  const vpBytes: TArray<Byte>;
  const vpDigitos: Integer;
  const vpLetraMinuscula: Boolean;
  const vpSeparador: string): string;
var
  viListaHex: TStrings;
  viByte: Byte;
  viHex: string;
begin
  viListaHex := nil;
  try
    viListaHex := TStringList.Create;
    for viByte in vpBytes do
    begin
      viHex := IntToHex(viByte, vpDigitos);
      if vpLetraMinuscula then
        viHex := viHex.ToLower
      else
        viHex := viHex.ToUpper;

      viListaHex.Add(viHex);
    end;

    Result := string.Join(
      vpSeparador,
      viListaHex.ToStringArray);
  finally
    FreeAndNil(viListaHex);
  end;
end;

class function TUtilString.IncluirDelimitador(
  const vpCaminho: string): string;
const
  WINDOWS_DELIMITER = '\';
  LINUX_DELIMITER = '/';

var
  viPath: string;
begin
  viPath := Trim(vpCaminho);

  if Pos(WINDOWS_DELIMITER, viPath) > 0 then
    Result := IncludeTrailingPathDelimiter(viPath)
  else
  if Pos(LINUX_DELIMITER, viPath) > 0 then
  begin
    if (viPath[Length(viPath)] <> LINUX_DELIMITER) then
      Result := viPath + LINUX_DELIMITER
    else
      Result := viPath;
  end
  else
    Result := viPath;
end;

class function TUtilString.MaiusculoMinusculo(
  vpPalavra: string;
  const vpRetirarEspacos: Boolean): string;

  function UpperNome(vpPalavraAux : string):string;
  var
    i, vpPos, viCount  : integer;
    viResult, viP, viUF : string;
    viPosicaoUF : Integer;
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
          if viP[1] = 'à' then
            viP := 'À' + copy(viP,2,30)
          else
            if viP[1] = 'á' then
              viP := 'Á' + copy(viP,2,30);

          viPosicaoUF := Pos('/', viP);
          if (viPosicaoUF = 0 ) then
            viResult := viResult + ' '+ UpCase(viP[1]) + copy(viP,2,30)
          else
          begin
            viResult := viResult + ' '+ UpCase(viP[1]) + copy(viP,2,viPosicaoUF-2);
            viUF     := Copy(viP, viPosicaoUF+1, 10);
            viResult := viResult +'/'+ UpperCase(viUF);
          end;
        end
        else viResult := viResult + ' '+viP;
        Delete(vpPalavraAux,1,vpPos);
      end
      else
      begin
        viPosicaoUF := Pos('-', vpPalavraAux);
        if viPosicaoUF > 0 then
          viUF := Copy(vpPalavraAux, Pos('-', vpPalavraAux)+1, 3)
        else
        begin
          viPosicaoUF := Pos('/', vpPalavraAux);
          viUF := Copy(vpPalavraAux, Pos('/', vpPalavraAux)+1, 3);
        end;

        if Length(Trim(viUF)) = 2 then
        begin
          if (Pos('-', vpPalavraAux) > 0) or (Pos('/', vpPalavraAux) > 0) then
               viResult := viResult + ' '+ UpCase(vpPalavraAux[1]) + copy(vpPalavraAux,2, viPosicaoUF-1)
          else viResult := viResult + ' ';

          viResult := viResult + UpperCase(viUF);
          viResult := Trim(viResult);
          Result := viResult;
        end
        else
        begin
          viResult := viResult +' '+ UpCase(vpPalavraAux[1]) + copy(vpPalavraAux,2,30);
          Result := viResult;
          Break;
        end;
        vpPalavraAux := '';
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

    if vpRetirarEspacos then
      Result := trim(vpPalavra)
    else
      Result := vpPalavra;
  end;
end;

class function TUtilString.PegarMesExtenso(vpMesNumero: String): String;
var
  viListaMeses : TStringList;
begin
  viListaMeses := TStringList.Create;
  try
    viListaMeses.Add('1=JANEIRO');
    viListaMeses.Add('2=FEVEREIRO');
    viListaMeses.Add('3=MARÇO');
    viListaMeses.Add('4=ABRIL');
    viListaMeses.Add('5=MAIO');
    viListaMeses.Add('6=JUNHO');
    viListaMeses.Add('7=JULHO');
    viListaMeses.Add('8=AGOSTO');
    viListaMeses.Add('9=SETEMBRO');
    viListaMeses.Add('10=OUTUBRO');
    viListaMeses.Add('11=NOVEMBRO');
    viListaMeses.Add('12=DEZEMBRO');
    Result := viListaMeses.Values[InttoStr(StrtoInt(vpMesNumero))];
  finally
    FreeAndNil(viListaMeses);
  end;
end;

class function TUtilString.PreencherString(vpTexto, vpCaracter: String; vpTamanho: integer; vpDirecao: string): String;
var
  i : Integer;
  viAuxiliar: string;
  viTexto: string;
begin
  viTexto := '';

  viAuxiliar := '';

  if vpDirecao = 'E' then
  begin
    for i := 1 to vpTamanho - Length(Trim(vpTexto)) do
      viAuxiliar := viAuxiliar + vpCaracter;

    viTexto := Copy(viAuxiliar + vpTexto, 1, vpTamanho)
  end
  else
  begin
    for i := 1 to vpTamanho - Length(Trim(vpTexto)) do
      viAuxiliar := viAuxiliar + vpCaracter;

    viTexto := Copy(vpTexto + viAuxiliar, 1, vpTamanho);
  end;

  Result := viTexto;
end;

class function TUtilString.RetornaAlfa(
  const vpValor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(vpValor) do
    if CharInSet(vpValor[i], ['a'..'z', 'A'..'Z']) then
       Result := Result + vpValor[i];
end;

class function TUtilString.RetornaNumerico(
  const vpValor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(vpValor) do
    if CharInSet(vpValor[i], ['0'..'9']) then
       Result := Result + vpValor[i];
end;

class function TUtilString.RetornarValorLista(
  const vpLista: TList<string>;
  const vpSeparador: string): string;
var
  viLista: TList<string>;
  viValor: string;
begin
  viLista := nil;
  try
    viLista := TList<string>.Create;

    for viValor in vpLista do
      viLista.Add(viValor.QuotedString);


    Result := Result.Join(vpSeparador, viLista.ToArray);
  finally
    FreeAndNil(viLista);
  end;
end;

class function TUtilString.RetornarValorListaInteiro(
  const vpLista: TList<Integer>;
  const vpSeparador: string): string;
var
  viLista: TList<string>;
  viValor: Integer;
begin
  viLista := nil;
  try
    viLista := TList<string>.Create;

    for viValor in vpLista do
      viLista.Add(viValor.ToString);


    Result := Result.Join(vpSeparador, viLista.ToArray);
  finally
    FreeAndNil(viLista);
  end;
end;

class function TUtilString.ValidarEmail(const vpEmail: string): Boolean;
const
  CI_PATTERN = '^((?>[a-zA-Z\d!#$%&''*+\-\/=?^_`{|}~]+\x20*|"((?=[\x01-\x7f])' +
    '[^"\\]|\\[\x01-\x7f])*"\x20*)*(?<angle><))?((?!\.)' +
    '(?>\.?[a-zA-Z\d!#$%&''*+\-\/=?^_`{|}~]+)+|"((?=[\x01-\x7f])' +
    '[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]' +
    '{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d))' +
    '{4}|[a-zA-Z\d\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\' +
    '[\x01-\x7f])+)\])(?(angle)>)$';
begin
  Result := TRegEx.IsMatch(vpEmail, CI_PATTERN);
end;

end.
