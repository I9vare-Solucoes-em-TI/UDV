unit Geral.Model.Util.DataSet;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.JSON,
  System.Rtti;

type
  TPredicate = reference to function(const vpRegistro: TDataSet): Boolean;

  TCriterioClassificacao = reference to function(
    const vpRegistro: TDataSet;
    out vpScore: Integer): Boolean;

  TDataSetUtil = class
  private
    class function BuscarValorDateTime(
      const vpDateTime: TDateTime;
      const vpEmUtc: Boolean): TJSONValue;

    class function BuscarValorDate(
      const vpDate: TDate): TJSONValue;

    class function BuscarValorCurrency(
      const vpCurrency: Currency): TJSONValue;

    class function BuscarValorInteger(
      const vpInteger: Integer): TJSONValue;

    class function BuscarValorString(
      const vpString: string): TJSONValue;

    class function BuscarObjeto(
      const vpDataSet: TDataSet;
      const vpEmUtc: Boolean = False): TJSONObject;
  public
    class function Copiar(
      const vpDados: TDataSet): TDataSet; overload;

    class function Copiar(
      const vpDados: TDataSet;
      const vpQuantidadeRegistroPular: Integer;
      const vpQuantidadeMaximaRegistro: Integer): TDataSet; overload;

    class function Paginar(
      const vpDados: TDataSet;
      const vpQuantidadeRegistro: Integer): TList<TDataSet>;

    class function Filtrar(
      const vpDados: TDataSet;
      const vpCondicao: TPredicate): TDataSet;

    class function ExisteRegistro(
      const vpDados: TDataSet;
      const vpCondicao: TPredicate): Boolean;

    class function Copiar(
      const vpDados: TDataSet;
      const vpListaCampoCopiar: TArray<string>;
      const vpListaCampoLimpar: TArray<string>): TDataSet; overload;

    class function ListarColunas(
      const vpDados: TDataSet): TArray<string>;

    class function BuscarQuantidadePagina(
      const vpQuantidadeRegistro: Integer;
      const vpQuantidadeRegistroPorPagina: Integer): Integer;

    class function BuscarQuantidadeRegistroPular(
      const vpPaginacaoHabilitada: Boolean;
      const vpQuantidadeRegistro: Integer;
      const vpQuantidadeRegistroPorPagina: Integer;
      const vpPagina: Integer): Integer;

    class function CopiarEstrutura(
      const vpDataSet: TDataSet): TDataSet;

    class function ConverterArrayJson(
      const vpDataSet: TDataSet): TJSONArray;

    class function Classificar(
      const vpDataSet: TDataSet;
      const vpListaCriterioClassificacao: TList<TCriterioClassificacao>): TDataSet;

    class function BuscarMaiorValor(
      const vpDataSet: TDataSet;
      const vpNomeCampo: string): TValue;

    class function BuscarMaiorValorAsType<T>(
      const vpDataSet: TDataSet;
      const vpNomeCampo: string): T;
  end;

implementation

uses
  FireDAC.Comp.DataSet,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  I9MemTable,
  System.DateUtils;

{ TDataSetUtil }

class function TDataSetUtil.Copiar(
  const vpDados: TDataSet): TDataSet;
var
  viMemTable: TI9MemTable;
begin
  Result := nil;
  try
    viMemTable := TI9MemTable.Create(nil);
    Result := viMemTable;

    viMemTable.CopyDataSet(
      vpDados,
      [coStructure, coRestart, coAppend]);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDataSetUtil.BuscarValorCurrency(
  const vpCurrency: Currency): TJSONValue;
begin
  Result := TJSONNumber.Create(vpCurrency);
end;

class function TDataSetUtil.BuscarMaiorValor(
  const vpDataSet: TDataSet;
  const vpNomeCampo: string): TValue;
var
  viMemTable: TI9MemTable;
  viField: TField;
  viValue: Variant;
begin
  viMemTable := nil;
  try
    Result := TValue.Empty;
    if vpDataSet.IsEmpty then
      Exit;

    viMemTable := TI9MemTable.Create(nil);
    viField := vpDataSet.FieldByName(vpNomeCampo);

    viMemTable.FieldDefs.Add(
      viField.FieldName,
      viField.DataType,
      viField.Size,
      viField.Required);

    viMemTable.Open;
    viMemTable.CopyDataSet(vpDataSet);
    viMemTable.IndexFieldNames := vpNomeCampo;
    viMemTable.Last;

    viValue := viMemTable.FieldByName(vpNomeCampo).Value;
    Result := TValue.FromVariant(viValue);
  finally
    FreeAndNil(viMemTable);
  end;
end;

class function TDataSetUtil.BuscarMaiorValorAsType<T>(
  const vpDataSet: TDataSet;
  const vpNomeCampo: string): T;
var
  viValue: TValue;
begin
  viValue := BuscarMaiorValor(
    vpDataSet,
    vpNomeCampo);

  Result := viValue.AsType<T>
end;

class function TDataSetUtil.BuscarObjeto(
  const vpDataSet: TDataSet;
  const vpEmUtc: Boolean = False): TJSONObject;
var
  viField: TField;
  viJsonValue: TJSONValue;
begin
  Result := nil;
  try
    Result := TJSONObject.Create;

    for viField in vpDataSet.Fields  do
    begin

      case viField.DataType of
        ftDateTime: viJsonValue := BuscarValorDateTime(viField.AsDateTime, vpEmUtc);
        ftDate: viJsonValue := BuscarValorDate(viField.AsDateTime);
        ftCurrency: viJsonValue := BuscarValorCurrency(viField.AsCurrency);
        ftInteger: viJsonValue := BuscarValorInteger(viField.AsInteger);
        ftString: viJsonValue := BuscarValorString(viField.AsString);
      else
        raise Exception.Create('Não foi possível mapear algum tipo do dataset.');
      end;

      Result.AddPair(viField.FieldName, viJsonValue);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDataSetUtil.BuscarQuantidadePagina(
  const vpQuantidadeRegistro: Integer;
  const vpQuantidadeRegistroPorPagina: Integer): Integer;
var
  viRestoDivisao: Integer;
begin
  Result := vpQuantidadeRegistro div vpQuantidadeRegistroPorPagina;

  viRestoDivisao := vpQuantidadeRegistro mod vpQuantidadeRegistroPorPagina;
  if viRestoDivisao > 0 then
    Inc(Result);
end;

class function TDataSetUtil.BuscarQuantidadeRegistroPular(
  const vpPaginacaoHabilitada: Boolean;
  const vpQuantidadeRegistro: Integer;
  const vpQuantidadeRegistroPorPagina: Integer;
  const vpPagina: Integer): Integer;
var
  viQuantidadePagina: Integer;
  viPagina: Integer;
begin
  Result := 0;
  if not vpPaginacaoHabilitada then
    Exit;

  if vpQuantidadeRegistro = 0 then
    Exit;

  viQuantidadePagina := BuscarQuantidadePagina(
    vpQuantidadeRegistro,
    vpQuantidadeRegistroPorPagina);

  viPagina := vpPagina;

  if viPagina > viQuantidadePagina then
    viPagina := viQuantidadePagina;

  if viPagina = 0 then
    viPagina := 1;

  Result := (viPagina - 1) * vpQuantidadeRegistroPorPagina;
end;

class function TDataSetUtil.BuscarValorDate(
  const vpDate: TDate): TJSONValue;
begin
  Result := TJSONString.Create(FormatDateTime('yyyy-mm-dd', vpDate));
end;

class function TDataSetUtil.BuscarValorDateTime(
  const vpDateTime: TDateTime;
  const vpEmUtc: Boolean): TJSONValue;
begin
  Result := TJSONString.Create(DateToISO8601(vpDateTime, vpEmUtc));
end;

class function TDataSetUtil.BuscarValorInteger(
  const vpInteger: Integer): TJSONValue;
begin
  Result := TJSONNumber.Create(vpInteger);
end;

class function TDataSetUtil.BuscarValorString(
  const vpString: string): TJSONValue;
begin
  Result := TJSONString.Create(vpString);
end;

class function TDataSetUtil.Classificar(
  const vpDataSet: TDataSet;
  const vpListaCriterioClassificacao: TList<TCriterioClassificacao>): TDataSet;
var
  viBookmark: TBookmark;
  viCriterioClassificacao: TCriterioClassificacao;
  viConsiderarRegistro: Boolean;
  viCriterioScore: Integer;
  viCriterioConsiderarRegistro: Boolean;
  viScoreRegistro: Integer;
  viField: TField;
begin
  Result := nil;
  viBookmark := vpDataSet.Bookmark;
  vpDataSet.DisableControls;

  try
    try
      Result := TI9MemTable.Create(nil);

      for viField in vpDataSet.Fields do
      begin
        Result.FieldDefs.Add(
          viField.FieldName,
          viField.DataType,
          viField.Size,
          viField.Required);
      end;

      Result.FieldDefs.Add(
        '_SCORE',
        TFieldType.ftInteger);

      Result.Open;

      vpDataSet.First;
      while not vpDataSet.Eof do
      begin
        try
          viConsiderarRegistro := True;
          viScoreRegistro := 0;

          for viCriterioClassificacao in vpListaCriterioClassificacao do
          begin
            viCriterioConsiderarRegistro := viCriterioClassificacao(
              vpDataSet,
              viCriterioScore);

            {
              Se um critério retorna que o registro não será considerado,
              não é necessário executar a lógica dos demais critérios
            }
            if not viCriterioConsiderarRegistro then
            begin
              viConsiderarRegistro := False;
              Break;
            end;

            Inc(
              viScoreRegistro,
              viCriterioScore);
          end;

          if not viConsiderarRegistro then
            Continue;

          Result.Append;
          Result.CopyFields(vpDataSet);
          Result.FieldByName('_SCORE').AsInteger := viScoreRegistro;
          Result.Post;
        finally
          vpDataSet.Next;
        end;
      end;

      Result.First;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    vpDataSet.GotoBookmark(viBookmark);
    vpDataSet.EnableControls;
  end;
end;

class function TDataSetUtil.ConverterArrayJson(
  const vpDataSet: TDataSet): TJSONArray;
var
  viJsonObject: TJSONObject;
  viRecNo: Integer;
begin
  Result := TJSONArray.Create;

  viRecNo := vpDataSet.RecNo;
  vpDataSet.DisableControls;
  try
    vpDataSet.First;
    while not vpDataSet.Eof do
    begin
      viJsonObject := BuscarObjeto(vpDataSet);
      Result.AddElement(viJsonObject);

      vpDataSet.Next;
    end;

  finally
    vpDataSet.EnableControls;
    vpDataSet.RecNo := viRecNo;
  end;
end;

class function TDataSetUtil.Copiar(
  const vpDados: TDataSet;
  const vpListaCampoCopiar: TArray<string>;
  const vpListaCampoLimpar: TArray<string>): TDataSet;
var
  viCampo: TField;
  viEncontrou: Boolean;
  viTamanhoListaCampoCopiar: Integer;
  viTamanhoListaCampoLimpar: Integer;
  viApenasCopiar: Boolean;
  viNomeCampo: string;
begin
  Result := nil;
  try
    Result := Copiar(vpDados);

    viTamanhoListaCampoCopiar := Length(vpListaCampoCopiar);
    viTamanhoListaCampoLimpar := Length(vpListaCampoLimpar);

    if (viTamanhoListaCampoCopiar > 0) and
      (viTamanhoListaCampoLimpar > 0) then
      raise Exception.Create('Não é permitido informar a lista de campos para copiar e limpar.');

    viApenasCopiar := (viTamanhoListaCampoCopiar = 0) and
      (viTamanhoListaCampoLimpar = 0);

    if viApenasCopiar then
      Exit;

    Result.First;
    while not Result.Eof do
    begin
      Result.Edit;

      for viCampo in Result.Fields do
      begin
        viNomeCampo := viCampo.FieldName;

        if viTamanhoListaCampoCopiar > 0 then
        begin
          viEncontrou := MatchText(
            viNomeCampo,
            vpListaCampoCopiar);

          if not viEncontrou then
            viCampo.Clear;

          Continue;
        end;

        if viTamanhoListaCampoLimpar > 0 then
        begin
          viEncontrou := MatchText(
            viNomeCampo,
            vpListaCampoLimpar);

          if viEncontrou then
            viCampo.Clear;
        end;
      end;

      Result.Post;
      Result.Next;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDataSetUtil.Copiar(
  const vpDados: TDataSet;
  const vpQuantidadeRegistroPular: Integer;
  const vpQuantidadeMaximaRegistro: Integer): TDataSet;
var
  viMemTable: TI9MemTable;
  viBookmark: TBookmark;
begin
  Result := nil;
  viBookmark := vpDados.Bookmark;

  try
    try
      viMemTable := TI9MemTable.Create(nil);
      Result := viMemTable;

      viMemTable.CopyDataSet(
        vpDados,
        [coStructure]);

      vpDados.First;
      vpDados.RecNo := vpQuantidadeRegistroPular + 1;

      while (not vpDados.Eof) and (viMemTable.RecordCount < vpQuantidadeMaximaRegistro) do
      begin
        viMemTable.Append;
        viMemTable.CopyFields(vpDados);
        viMemTable.Post;
        vpDados.Next;
      end;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    vpDados.GotoBookmark(viBookmark);
  end;
end;

class function TDataSetUtil.CopiarEstrutura(
  const vpDataSet: TDataSet): TDataSet;
var
  viMemTable: TI9MemTable;
begin
  Result := nil;
  try
    viMemTable := TI9MemTable.Create(nil);
    Result := viMemTable;

    viMemTable.CopyDataSet(
      vpDataSet,
      [coStructure]);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TDataSetUtil.ExisteRegistro(
  const vpDados: TDataSet;
  const vpCondicao: TPredicate): Boolean;
var
  viMemTable: TDataSet;
begin
  viMemTable := nil;
  try
    viMemTable := Self.Filtrar(vpDados, vpCondicao);

    Result := not viMemTable.IsEmpty;
  finally
    FreeAndNil(viMemTable);
  end;
end;

class function TDataSetUtil.Filtrar(
  const vpDados: TDataSet;
  const vpCondicao: TPredicate): TDataSet;
var
  viAdicionarRegistro: Boolean;
  viMemTable: TI9MemTable;
  viBookmark: TBookmark;
begin
  Result := nil;
  viBookmark := vpDados.Bookmark;
  vpDados.DisableControls;

  try
    try
      viMemTable := TI9MemTable.Create(nil);
      Result := viMemTable;

      viMemTable.CopyDataSet(
        vpDados,
        [coStructure]);

      vpDados.First;
      while not vpDados.Eof do
      begin
        try
          viAdicionarRegistro := vpCondicao(vpDados);
          if not viAdicionarRegistro then
            Continue;

          Result.Append;
          Result.CopyFields(vpDados);
          Result.Post;
        finally
          vpDados.Next;
        end;
      end;

      Result.First;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    vpDados.GotoBookmark(viBookmark);
    vpDados.EnableControls;
  end;
end;

class function TDataSetUtil.ListarColunas(
  const vpDados: TDataSet): TArray<string>;
var
  viLista: TStrings;
  viField: TField;
begin
  viLista := nil;
  try
    viLista := TStringList.Create;
    for viField in vpDados.Fields do
      viLista.Add(viField.FieldName);

    Result := viLista.ToStringArray;
  finally
    FreeAndNil(viLista);
  end;
end;

class function TDataSetUtil.Paginar(
  const vpDados: TDataSet;
  const vpQuantidadeRegistro: Integer): TList<TDataSet>;
var
  I: Integer;
  viQuantidadeRegistroTotal: Integer;
  viQuantidadePagina: Integer;
  viDados: TDataSet;
  viQuantidadeRegistroPular: Integer;
begin
  Result := nil;

  try
    viQuantidadeRegistroTotal := vpDados.RecordCount;

    viQuantidadePagina := BuscarQuantidadePagina(
      viQuantidadeRegistroTotal,
      vpQuantidadeRegistro);

    Result := TObjectList<TDataSet>.Create;

    for I := 1 to viQuantidadePagina do
    begin

      viQuantidadeRegistroPular := TDataSetUtil.BuscarQuantidadeRegistroPular(
        True,
        viQuantidadeRegistroTotal,
        vpQuantidadeRegistro,
        I);

      viDados := TDataSetUtil.Copiar(
        vpDados,
        viQuantidadeRegistroPular,
        vpQuantidadeRegistro);

      Result.Add(viDados);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

end.
