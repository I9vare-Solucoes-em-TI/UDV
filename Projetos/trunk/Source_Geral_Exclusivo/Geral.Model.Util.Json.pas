{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Util.Json.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Util.Json;

interface

uses
  System.Classes,
  System.JSON;

type
  TJsonUtil = class
  private
    class function TrimBytes(
      const ABytes: array of Byte): TArray<Byte>;
  public
    class function BuscarJsonValue(
      const vpStream: TStream;
      const vpIsUtf8: Boolean = True): TJSONValue;

    class procedure SalvarEmArquivo(
      const vpJsonObject: TJSONValue;
      const vpCaminhoArquivo: string;
      const vpFormatarJson: Boolean);

    class procedure SalvarEmStream(
      const vpJsonObject: TJSONObject;
      const vpStreamRetorno: TStream);
    
    class function BuscarBytes(
      const vpJsonValue: TJSONValue): TArray<Byte>;
  end;

implementation

uses
  System.IOUtils,
  REST.Json,
  Geral.Model.Util.Stream;

{ TJsonUtil }

class function TJsonUtil.BuscarBytes(
  const vpJsonValue: TJSONValue): TArray<Byte>;
var
  viBytes: TArray<Byte>;
begin
  SetLength(
    viBytes,
    vpJsonValue.EstimatedByteSize);

  vpJsonValue.ToBytes(
    viBytes,
    0);

  Result := TrimBytes(viBytes);
end;

class function TJsonUtil.BuscarJsonValue(
  const vpStream: TStream;
  const vpIsUtf8: Boolean = True): TJSONValue;
var
  viBytes: TArray<Byte>;
begin
  viBytes := TStreamUtil.BuscarBytes(vpStream);

  Result := TJSONObject.ParseJSONValue(
    viBytes,
    0,
    vpIsUtf8);
end;

class procedure TJsonUtil.SalvarEmArquivo(
  const vpJsonObject: TJSONValue;
  const vpCaminhoArquivo: string;
  const vpFormatarJson: Boolean);
var
  viConteudo: string;
begin
  if vpFormatarJson then
    viConteudo := TJson.Format(vpJsonObject)
  else
    viConteudo := vpJsonObject.ToString;

  TFile.WriteAllText(
    vpCaminhoArquivo,
    viConteudo);
end;

class procedure TJsonUtil.SalvarEmStream(
  const vpJsonObject: TJSONObject;
  const vpStreamRetorno: TStream);
var
  viBytes: TArray<Byte>;
  viBytesTrim: TArray<Byte>;
begin
  SetLength(viBytes, vpJsonObject.EstimatedByteSize);
  vpJsonObject.ToBytes(viBytes, 0);
  viBytesTrim := TrimBytes(viBytes);
  vpStreamRetorno.Write(viBytesTrim, Length(viBytesTrim));
end;

class function TJsonUtil.TrimBytes(
  const ABytes: array of Byte): TArray<Byte>;
var
  StartIndex, EndIndex, Length: Integer;
begin
  StartIndex := Low(ABytes);
  EndIndex := High(ABytes);

  // Encontra o índice de início excluindo os espaços em branco à esquerda
  while (StartIndex <= EndIndex) and (ABytes[StartIndex] = 0) do
    Inc(StartIndex);

  // Encontra o índice de fim excluindo os espaços em branco à direita
  while (EndIndex >= StartIndex) and (ABytes[EndIndex] = 0) do
    Dec(EndIndex);

  // Calcula o novo tamanho do array
  Length := EndIndex - StartIndex + 1;

  // Cria um novo array de bytes com o tamanho adequado
  SetLength(Result, Length);

  // Copia os bytes relevantes para o novo array
  Move(ABytes[StartIndex], Result[Low(Result)], Length);
end;

end.
