unit Geral.Model.Business.Impl.SINTER;

interface

uses
  Geral.Model.Business.Spec.SINTER,
  Data.DB,
  Geral.Model.Entity.Spec.PKI,
  I9Connection,
  Geral.Model.Entity.Spec.List,
  System.JSON,
  Geral.Model.Entity.Spec.Zip,
  Geral.Model.Entity.Spec.SINTER,
  System.Classes;

type
  TGerarSequencia = reference to function(
    const vpTabela: string): Variant;

  TDataHoraServidor = reference to function: TDateTime;

  TAtualizarOuInserirSequencia = reference to function(
    const vpTabela: string;
    const vpSequencia: Integer): Integer;

  TSINTER_Business = class(TInterfacedObject, ISINTER_Business)
  private
    FConnection: TI9Connection;
    FGerarSequencia: TGerarSequencia;
    FDataHoraServidor: TDataHoraServidor;
    FAtualizarOuInserirSequencia : TAtualizarOuInserirSequencia;
    FAssinaturaArquivo: IAssinaturaArquivo;
    FFileCompression: IFileCompression;
    FDiretorioRaizArquivos: string;
    FSINTER: ISINTER;

    constructor Create(
      const vpConnection: TI9Connection;
      const vpGerarSequencia: TGerarSequencia;
      const vpDataHoraServidor: TDataHoraServidor;
      const vpAtualizarOuInserirSequencia: TAtualizarOuInserirSequencia;
      const vpAssinaturaArquivo: IAssinaturaArquivo;
      const vpFileCompression: IFileCompression;
      const vpDiretorioRaizArquivos: string;
      const vpSINTER: ISINTER); reintroduce;

    function CriarSINTER(
      const vpUsuarioID: Integer;
      const vpDataEnvio: TDateTime;
      const vpUsuarioPKI_ID: Integer;
      const vpSistemaID: Integer): Integer;

    function CriarLotes(
      const vpSINTER_ID: Integer;
      const vpExtratos: TDataSet;
      const vpX509Certificate: IX509Certificate;
      const vpDataEnvio: TDateTime;
      const vpSistemaID: Integer;
      const vpOnNextExtrato: TOnNextExtrato): IList<Integer>;

    function CriarLote(
      const vpSINTER_ID: Integer;
      const vpSequencia: Integer): Integer;

    function UltimaSequenciaLote(
      const vpDataEnvio: TDateTime): Integer;

    function DiretorioTemp(
      const vpSistemaID: Integer): string;

    function SiglaServentia(
      const vpSistemaID: Integer): string;

    function NomeArquivo(
      const vpDataEnvio: TDateTime;
      const vpSequencia: Integer): string;

    function DiretorioArquivo(
      const vpSistemaID: Integer;
      const vpDataEnvio: TDateTime): string;

    procedure EnviarLote(
      const vpSINTER_LoteID: Integer;
      const vpDataEnvio: TDateTime;
      const vpSequencia: Integer;
      const vpExtratos: TJSONArray;
      const vpDiretorioTemp: string;
      const vpX509Certificate: IX509Certificate;
      const vpSistemaID: Integer);

    function AtualizarLote(
      const vpSINTER_LoteID: Integer;
      const vpHTTP_Code: Integer;
      const vpHTTP_Status: string;
      const vpHTTP_Response: TStream): Integer;
  public
    function EnviarExtratos(
      const vpSistemaID: Integer;
      const vpExtratos: TDataSet;
      const vpUsuarioID: Integer;
      const vpUsuarioPKI_ID: Integer;
      const vpX509Certificate: IX509Certificate;
      const vpOnNextExtrato: TOnNextExtrato): Integer;

    class function New(
      const vpConnection: TI9Connection;
      const vpGerarSequencia: TGerarSequencia;
      const vpDataHoraServidor: TDataHoraServidor;
      const vpAtualizarOuInserirSequencia: TAtualizarOuInserirSequencia;
      const vpAssinaturaArquivo: IAssinaturaArquivo;
      const vpFileCompression: IFileCompression;
      const vpDiretorioRaizArquivos: string;
      const vpSINTER: ISINTER): ISINTER_Business;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  I9Query,
  Geral.Model.Entity.Impl.Factory.List,
  System.DateUtils,
  System.IOUtils,
  FireDAC.Stan.Param;

{ TSINTER_Business }

function TSINTER_Business.AtualizarLote(
  const vpSINTER_LoteID: Integer;
  const vpHTTP_Code: Integer;
  const vpHTTP_Status: string;
  const vpHTTP_Response: TStream): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viParam: TFDParam;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE'}

      {$REGION 'Cláusula UPDATE'}
      'UPDATE ' +
      'G_SINTER_LOTE G_SIN_L ' +
      {$ENDREGION}

      {$REGION 'Cláusula SET, Colunas e Parâmetros'}
      'SET ' +
      'G_SIN_L.HTTP_CODE = :P_HTTP_CODE, ' +
      'G_SIN_L.HTTP_STATUS = :P_HTTP_STATUS, ' +
      'G_SIN_L.HTTP_RESPONSE = :P_HTTP_RESPONSE ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SIN_L.SINTER_LOTE_ID = :P_SINTER_LOTE_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_HTTP_CODE').AsInteger := vpHTTP_Code;

    viQuery.ParamByName(
      'P_HTTP_STATUS').AsString := vpHTTP_Status;

    viParam := viQuery.ParamByName(
      'P_HTTP_RESPONSE');

    if vpHTTP_Response.Size > 0 then
      viParam.LoadFromStream(
        vpHTTP_Response,
        TFieldType.ftBlob)
    else
    begin
      viParam.Bound := True;
      viParam.DataType := TFieldType.ftBlob;
      viParam.Clear;
    end;

    viQuery.ParamByName(
      'P_SINTER_LOTE_ID').AsInteger := vpSINTER_LoteID;
    {$ENDREGION}

    Result := viQuery.ExecSQL;
  finally
    viQuery.Free;
  end;
end;

constructor TSINTER_Business.Create(
  const vpConnection: TI9Connection;
  const vpGerarSequencia: TGerarSequencia;
  const vpDataHoraServidor: TDataHoraServidor;
  const vpAtualizarOuInserirSequencia: TAtualizarOuInserirSequencia;
  const vpAssinaturaArquivo: IAssinaturaArquivo;
  const vpFileCompression: IFileCompression;
  const vpDiretorioRaizArquivos: string;
  const vpSINTER: ISINTER);
begin
  inherited Create;
  FConnection := vpConnection;
  FGerarSequencia := vpGerarSequencia;
  FDataHoraServidor := vpDataHoraServidor;
  FAtualizarOuInserirSequencia := vpAtualizarOuInserirSequencia;
  FAssinaturaArquivo := vpAssinaturaArquivo;
  FFileCompression := vpFileCompression;
  FDiretorioRaizArquivos := vpDiretorioRaizArquivos;
  FSINTER := vpSINTER;
end;

function TSINTER_Business.CriarSINTER(
  const vpUsuarioID: Integer;
  const vpDataEnvio: TDateTime;
  const vpUsuarioPKI_ID: Integer;
  const vpSistemaID: Integer): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viSINTER_ID: Integer;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'Comando SQL INSERT'}
      'INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_SINTER ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'SINTER_ID, ' +
      'USUARIO_ID, ' +
      'DATA_ENVIO, ' +
      'USUARIO_PKI_ID, ' +
      'SISTEMA_ID' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusula VALUES e Parâmetros'}
      'VALUES ' +
      '(' +
      ':P_SINTER_ID, ' +
      ':P_USUARIO_ID, ' +
      ':P_DATA_ENVIO, ' +
      ':P_USUARIO_PKI_ID, ' +
      ':P_SISTEMA_ID' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viSINTER_ID := FGerarSequencia(
      'G_SINTER');

    viQuery.ParamByName(
      'P_SINTER_ID').AsInteger := viSINTER_ID;

    viQuery.ParamByName(
      'P_USUARIO_ID').AsInteger := vpUsuarioID;

    viQuery.ParamByName(
      'P_DATA_ENVIO').AsDateTime := vpDataEnvio;

    viQuery.ParamByName(
      'P_USUARIO_PKI_ID').AsInteger := vpUsuarioPKI_ID;

    viQuery.ParamByName(
      'P_SISTEMA_ID').AsInteger := vpSistemaID;
    {$ENDREGION}

    viQuery.ExecSQL;
    Result := viSINTER_ID;
  finally
    viQuery.Free;
  end;
end;

function TSINTER_Business.DiretorioArquivo(
  const vpSistemaID: Integer;
  const vpDataEnvio: TDateTime): string;
{$REGION 'Variáveis'}
var
  viAno: Word;
  viMes: Word;
  viDia: Word;
  viMesAbreviado: string;
{$ENDREGION}
begin
  DecodeDate(
    vpDataEnvio,
    viAno,
    viMes,
    viDia);

  case viMes of
    1: viMesAbreviado := 'JAN';
    2: viMesAbreviado := 'FEV';
    3: viMesAbreviado := 'MAR';
    4: viMesAbreviado := 'ABR';
    5: viMesAbreviado := 'MAI';
    6: viMesAbreviado := 'JUN';
    7: viMesAbreviado := 'JUL';
    8: viMesAbreviado := 'AGO';
    9: viMesAbreviado := 'SET';
    10: viMesAbreviado := 'OUT';
    11: viMesAbreviado := 'NOV';
  else
    viMesAbreviado := 'DEZ';
  end;

  Result := string.Format(
    '%s%s%s%d%s%.2d_%s%s%.2d',
    [IncludeTrailingPathDelimiter(
      FDiretorioRaizArquivos),
    SiglaServentia(
      vpSistemaID),
    TPath.DirectorySeparatorChar,
    viAno,
    TPath.DirectorySeparatorChar,
    viMes,
    viMesAbreviado,
    TPath.DirectorySeparatorChar,
    viDia]);
end;

function TSINTER_Business.DiretorioTemp(
  const vpSistemaID: Integer): string;
begin
  Result := string.Format(
    '%s%s%s%s',
    [TPath.GetLibraryPath,
    'SINTER',
    TPath.PathSeparator,
    SiglaServentia(
      vpSistemaID)]);
end;

function TSINTER_Business.CriarLote(
  const vpSINTER_ID: Integer;
  const vpSequencia: Integer): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viSINTER_LoteID: Integer;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'Comando SQL INSERT'}
      'INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_SINTER_LOTE ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'SINTER_LOTE_ID, ' +
      'SINTER_ID, ' +
      'SEQUENCIA' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusula VALUES e Parâmetros'}
      'VALUES ' +
      '(' +
      ':P_SINTER_LOTE_ID, ' +
      ':P_SINTER_ID, ' +
      ':P_SEQUENCIA' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viSINTER_LoteID := FGerarSequencia(
      'G_SINTER_LOTE');

    viQuery.ParamByName(
      'P_SINTER_LOTE_ID').AsInteger := viSINTER_LoteID;

    viQuery.ParamByName(
      'P_SINTER_ID').AsInteger := vpSINTER_ID;

    viQuery.ParamByName(
      'P_SEQUENCIA').AsInteger := vpSequencia;
    {$ENDREGION}

    viQuery.ExecSQL;
    Result := viSINTER_LoteID;
  finally
    viQuery.Free;
  end;
end;

function TSINTER_Business.CriarLotes(
  const vpSINTER_ID: Integer;
  const vpExtratos: TDataSet;
  const vpX509Certificate: IX509Certificate;
  const vpDataEnvio: TDateTime;
  const vpSistemaID: Integer;
  const vpOnNextExtrato: TOnNextExtrato): IList<Integer>;
{$REGION 'Constantes'}
const
  CI_LIMITE_EXTRATOS_LOTE: Integer = 1000;
  CI_RECORDS_PER_TRANSACTION: Integer = 1000;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viBookmark: TBookmark;
  viSINTER_LoteID: Integer;
  viSequenciaExtrato: Integer;
  I: Integer;
  viSINTER_ItemID: Integer;
  viSINTER_Item: TI9Query;
  viTabela: string;
  viCampoID: Integer;
  viExtrato: TJSONObject;
  viExtratos: TJSONArray;
  viSequenciaLote: Integer;
  viUltimaSequenciaLote: Integer;
  viDiretorioTemp: string;
{$ENDREGION}
begin
  Result := TListFactory<Integer>.New.GetInstance;
  viBookmark := vpExtratos.Bookmark;
  vpExtratos.DisableControls;

  viSINTER_Item := TI9Query.Create(
    nil);

  viDiretorioTemp := DiretorioTemp(
    vpSistemaID);

  try
    if not TDirectory.Exists(
      viDiretorioTemp) then
      try
        TDirectory.CreateDirectory(
          viDiretorioTemp);
      except
        on E: Exception do
          raise Exception.CreateFmt(
            'Não foi possível criar o diretório %s devido ao ' +
            'motivo abaixo:%s%s',
            [viDiretorioTemp,
            DupeString(
              sLineBreak,
              2),
            E.Message]);
      end;

    vpExtratos.First;
    viSINTER_LoteID := 0;
    viExtratos := nil;
    viSequenciaLote := 0;
    viSequenciaExtrato := 0;
    viSINTER_Item.Connection := FConnection;

    // Criar colunas SINTER_LOTE_ID e EXTRATO na tabela G_SINTER_ITEM
    viSINTER_Item.SQL.Text := {$REGION 'Comando SQL INSERT'}
      'INSERT ' +

      {$REGION 'Cláusula INTO'}
      'INTO ' +
      'G_SINTER_ITEM ' +
      {$ENDREGION}

      {$REGION 'Colunas'}
      '(' +
      'SINTER_ITEM_ID, ' +
      'SINTER_LOTE_ID, ' +
      'TABELA, ' +
      'CAMPO_ID, ' +
      'EXTRATO' +
      ') ' +
      {$ENDREGION}

      {$REGION 'Cláusula VALUES e Parâmetros'}
      'VALUES ' +
      '(' +
      ':P_SINTER_ITEM_ID, ' +
      ':P_SINTER_LOTE_ID, ' +
      ':P_TABELA, ' +
      ':P_CAMPO_ID, ' +
      ':P_EXTRATO' +
      ')';
      {$ENDREGION}

    {$ENDREGION}

    viSINTER_Item.Params.ArraySize := CI_RECORDS_PER_TRANSACTION;
    I := 0;

    viSINTER_ItemID := FGerarSequencia(
      'G_SINTER_ITEM');

    while not vpExtratos.Eof do
      try
        Inc(
          viSequenciaExtrato);

        if viSequenciaExtrato = 1 then
        begin
          viUltimaSequenciaLote := UltimaSequenciaLote(
            vpDataEnvio);

          viSequenciaLote := viUltimaSequenciaLote;

          Inc(
            viSequenciaLote);

          viSINTER_LoteID := CriarLote(
            vpSINTER_ID,
            viSequenciaLote);

          viExtratos := TJSONArray.Create;

          Result.Add(
            viSINTER_LoteID);
        end;

        {$REGION 'Preencher valores dos parâmetros'}
        viSINTER_Item.ParamByName(
          'P_SINTER_ITEM_ID').AsIntegers[I] := viSINTER_ItemID;

        Inc(
          viSINTER_ItemID);

        viSINTER_Item.ParamByName(
          'P_SINTER_LOTE_ID').AsIntegers[I] := viSINTER_LoteID;

        viTabela := vpExtratos.FieldByName(
          'TABELA').AsString;

        viSINTER_Item.ParamByName(
          'P_TABELA').AsStrings[I] := viTabela;

        viCampoID := vpExtratos.FieldByName(
          'CAMPO_ID').AsInteger;

        viSINTER_Item.ParamByName(
          'P_CAMPO_ID').AsIntegers[I] := viCampoID;

        viExtrato := TJSONObject(
          TJSONObject.ParseJSONValue(
            vpExtratos.FieldByName(
              'EXTRATO').AsString));

        viSINTER_Item.ParamByName(
          'P_EXTRATO').AsStrings[I] := viExtrato.ToJSON;

        viExtratos.Add(
          viExtrato);
        {$ENDREGION}

        Inc(
          I);

        if I = CI_RECORDS_PER_TRANSACTION then
        begin
          viSINTER_Item.Execute(
            I);

          I := 0;
        end;

        if viSequenciaExtrato = CI_LIMITE_EXTRATOS_LOTE then
        begin
          EnviarLote(
            viSINTER_LoteID,
            vpDataEnvio,
            viSequenciaLote,
            viExtratos,
            viDiretorioTemp,
            vpX509Certificate,
            vpSistemaID);

          viSequenciaExtrato := 0;
          viExtratos.Free;
        end;
      finally
        vpExtratos.Next;

        if Assigned(
          vpOnNextExtrato) then
          vpOnNextExtrato;
      end;

    if I > 0 then
      viSINTER_Item.Execute(
        I);

    if viSequenciaExtrato > 0 then
    begin
      EnviarLote(
        viSINTER_LoteID,
        vpDataEnvio,
        viSequenciaLote,
        viExtratos,
        viDiretorioTemp,
        vpX509Certificate,
        vpSistemaID);

      viExtratos.Free;
    end;

    Dec(
      viSINTER_ItemID);

    FAtualizarOuInserirSequencia(
      'G_SINTER_ITEM',
      viSINTER_ItemID);
  finally
    vpExtratos.GotoBookmark(
      viBookmark);

    vpExtratos.EnableControls;
    viSINTER_Item.Free;

    if TDirectory.Exists(
      viDiretorioTemp) then
      TDirectory.Delete(
        viDiretorioTemp,
        True);
  end;
end;

function TSINTER_Business.EnviarExtratos(
  const vpSistemaID: Integer;
  const vpExtratos: TDataSet;
  const vpUsuarioID: Integer;
  const vpUsuarioPKI_ID: Integer;
  const vpX509Certificate: IX509Certificate;
  const vpOnNextExtrato: TOnNextExtrato): Integer;
{$REGION 'Variáveis'}
var
  viInTransaction: Boolean;
  viSINTER_ID: Integer;
  viDataEnvio: TDateTime;
{$ENDREGION}
begin
  viInTransaction := FConnection.InTransaction;
  if not viInTransaction then
    FConnection.StartTransaction;

  try
    viDataEnvio := FDataHoraServidor;

    viSINTER_ID := CriarSINTER(
      vpUsuarioID,
      viDataEnvio,
      vpUsuarioPKI_ID,
      vpSistemaID);

    CriarLotes(
      viSINTER_ID,
      vpExtratos,
      vpX509Certificate,
      viDataEnvio,
      vpSistemaID,
      vpOnNextExtrato);

    if not viInTransaction then
      FConnection.Commit;

    Result := viSINTER_ID;
  except
    on E: Exception do
    begin
      if not viInTransaction then
        FConnection.Rollback;

      raise Exception.CreateFmt(
        'Não foi possível enviar os extratos devido ao motivo abaixo:%s%s',
        [DupeString(
          sLineBreak,
          2),
        E.Message]);
    end;
  end;
end;

procedure TSINTER_Business.EnviarLote(
  const vpSINTER_LoteID: Integer;
  const vpDataEnvio: TDateTime;
  const vpSequencia: Integer;
  const vpExtratos: TJSONArray;
  const vpDiretorioTemp: string;
  const vpX509Certificate: IX509Certificate;
  const vpSistemaID: Integer);
{$REGION 'Variáveis'}
var
  viLote: TJSONObject;
  viFormatSettings: TFormatSettings;
  viCaminhoArquivoTemp: string;
  viNomeArquivo: string;
  viStrings: TStrings;
  viCaminhoArquivoTempAssinado: string;
  viCaminhoArquivoTempCompactado: string;
  viArquivosCompactar: IList<string>;
  viCaminhoArquivo: string;
  viDiretorioArquivo: string;
  viSINTER_Result: ISINTER_Result;
  viApagarArquivo: Boolean;
  viHTTP_Code: Integer;
  viHTTP_Status: string;
  viHTTP_Response: TStream;
{$ENDREGION}
begin
  viLote := TJSONObject.Create;
  viCaminhoArquivoTemp := string.Empty;
  viCaminhoArquivoTempAssinado := string.Empty;
  viCaminhoArquivoTempCompactado := string.Empty;
  viCaminhoArquivo := string.Empty;
  viApagarArquivo := False;

  try
    viFormatSettings := TFormatSettings.Create;
    viFormatSettings.DateSeparator := '/';

    viLote.AddPair(
      'dataGeracao',
      FormatDateTime(
        'dd/mm/yyyy',
        vpDataEnvio,
        viFormatSettings));

    viLote.AddPair(
      'sequencial',
      string.Format(
        '%.4d',
        [vpSequencia]));

    viLote.AddPair(
      'extratos',
      vpExtratos);

    viNomeArquivo := NomeArquivo(
      vpDataEnvio,
      vpSequencia);

    viCaminhoArquivoTemp := string.Format(
      '%s%s.json',
      [IncludeTrailingPathDelimiter(
        vpDiretorioTemp),
      viNomeArquivo]);

    viStrings := TStringList.Create;
    try
      viStrings.Text := viLote.ToJSON;

      viStrings.SaveToFile(
        viCaminhoArquivoTemp);
    finally
      viStrings.Free;
    end;

    viCaminhoArquivoTempAssinado := FAssinaturaArquivo.Assinar(
      viCaminhoArquivoTemp,
      vpX509Certificate);

    viCaminhoArquivoTempCompactado := TPath.ChangeExtension(
      viCaminhoArquivoTempAssinado,
      'zip');

    viArquivosCompactar := TListFactory<string>.New.GetInstance;

    viArquivosCompactar.Add(
      viCaminhoArquivoTemp);

    viArquivosCompactar.Add(
      viCaminhoArquivoTempAssinado);

    FFileCompression.CompressFiles(
      viArquivosCompactar,
      viCaminhoArquivoTempCompactado);

    viDiretorioArquivo := DiretorioArquivo(
      vpSistemaID,
      vpDataEnvio);

    if not TDirectory.Exists(
      viDiretorioArquivo) then
      try
        TDirectory.CreateDirectory(
          viDiretorioArquivo);
      except
        on E: Exception do
          raise Exception.CreateFmt(
            'Não foi possível criar o diretório %s devido ao ' +
            'motivo abaixo:%s%s',
            [viDiretorioArquivo,
            DupeString(
              sLineBreak,
              2),
            E.Message]);
      end;

    viCaminhoArquivo := string.Format(
      '%s%s',
      [IncludeTrailingPathDelimiter(
        viDiretorioArquivo),
      TPath.GetFileName(
        viCaminhoArquivoTempCompactado)]);

    TFile.Copy(
      viCaminhoArquivoTempCompactado,
      viCaminhoArquivo,
      True);

    try
      viSINTER_Result := FSINTER.EnviarLote(
        vpSistemaID,
        viCaminhoArquivo,
        vpX509Certificate);

      viHTTP_Code := viSINTER_Result.HTTP_Code;
      viHTTP_Status := viSINTER_Result.HTTP_Status;
      viHTTP_Response := viSINTER_Result.HTTP_Response;

      // 200 = OK
      if viHTTP_Code = 200 then
        viApagarArquivo := False
      else
        viApagarArquivo := True;

      AtualizarLote(
        vpSINTER_LoteID,
        viHTTP_Code,
        viHTTP_Status,
        viHTTP_Response);
    except
      viApagarArquivo := True;
      raise;
    end;
  finally
    viLote.Free;

    if not viCaminhoArquivoTemp.IsEmpty and
      TFile.Exists(
        viCaminhoArquivoTemp) then
      TFile.Delete(
        viCaminhoArquivoTemp);

    if not viCaminhoArquivoTempAssinado.IsEmpty and
      TFile.Exists(
        viCaminhoArquivoTempAssinado) then
      TFile.Delete(
        viCaminhoArquivoTempAssinado);

    if not viCaminhoArquivoTempCompactado.IsEmpty and
      TFile.Exists(
        viCaminhoArquivoTempCompactado) then
      TFile.Delete(
        viCaminhoArquivoTempCompactado);

    if viApagarArquivo and
      not viCaminhoArquivo.IsEmpty and
      TFile.Exists(
        viCaminhoArquivo) then
      TFile.Delete(
        viCaminhoArquivo);
  end;
end;

class function TSINTER_Business.New(
  const vpConnection: TI9Connection;
  const vpGerarSequencia: TGerarSequencia;
  const vpDataHoraServidor: TDataHoraServidor;
  const vpAtualizarOuInserirSequencia: TAtualizarOuInserirSequencia;
  const vpAssinaturaArquivo: IAssinaturaArquivo;
  const vpFileCompression: IFileCompression;
  const vpDiretorioRaizArquivos: string;
  const vpSINTER: ISINTER): ISINTER_Business;
begin
  Result := Create(
    vpConnection,
    vpGerarSequencia,
    vpDataHoraServidor,
    vpAtualizarOuInserirSequencia,
    vpAssinaturaArquivo,
    vpFileCompression,
    vpDiretorioRaizArquivos,
    vpSINTER);
end;

function TSINTER_Business.NomeArquivo(
  const vpDataEnvio: TDateTime;
  const vpSequencia: Integer): string;
begin
  Result := string.Format(
    'LoteSINTER_%s_%.4d',
    [FormatDateTime(
      'ddmmyyyyhhnnss',
      vpDataEnvio),
    vpSequencia]);
end;

function TSINTER_Business.SiglaServentia(
  const vpSistemaID: Integer): string;
begin
  case vpSistemaID of
    1: Result := 'RI';
    2: Result := 'TN';
  else
    Result := 'RTD';
  end;
end;

function TSINTER_Business.UltimaSequenciaLote(
  const vpDataEnvio: TDateTime): Integer;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := FConnection;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_SIN_L.SEQUENCIA ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SINTER G_SIN ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SINTER_LOTE G_SIN_L ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SIN_L.SINTER_ID = G_SIN.SINTER_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SIN.DATA_ENVIO BETWEEN :P_DATA_INICIAL AND :P_DATA_FINAL AND ' +
      'G_SIN_L.HTTP_CODE = :P_HTTP_CODE ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_SIN_L.SEQUENCIA';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viDataInicial := StartOfTheDay(
      vpDataEnvio);

    viQuery.ParamByName(
      'P_DATA_INICIAL').AsDateTime := viDataInicial;

    viDataFinal := EndOfTheDay(
      vpDataEnvio);

    viQuery.ParamByName(
      'P_DATA_FINAL').AsDateTime := viDataFinal;

    // 200 = OK
    viQuery.ParamByName(
      'P_HTTP_CODE').AsInteger := 200;
    {$ENDREGION}

    viQuery.Open;
    try
      viQuery.Last;

      Result := viQuery.FieldByName(
        'SEQUENCIA').AsInteger;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

end.
