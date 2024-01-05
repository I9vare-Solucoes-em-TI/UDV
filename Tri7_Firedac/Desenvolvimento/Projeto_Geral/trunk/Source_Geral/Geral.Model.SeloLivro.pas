unit Geral.Model.SeloLivro;

interface

uses
  System.Generics.Collections,
  Geral.Model.Validacao;

type
  TSeloLivroBusiness = class
  private
    class function BuscarSeloGeralHabilitarMediaDiaria: Boolean;

    class function BuscarMediaDiaria(
      const vpSeloGrupoId: Integer;
      const vpDataBase: TDateTime): Integer;

    class function BuscarQuantidadeSeloUtilizado(
      const vpSeloGrupoId: Integer;
      const vpDataBase: TDateTime): Integer;
  public
    class function ValidarSolicitacaoSelo(
      const vpSeloGrupoId: Integer;
      const vpDataBase: TDateTime;
      const vpQuantidadeSolicitada: Integer;
      out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
  end;

implementation

uses
  Geral.Model.Util.Decendio,
  System.SysUtils,
  Geral.Model.Util.Data,
  I9Query,
  Controles,
  Data.DB,
  Geral.Model.SeloSituacao,
  System.DateUtils,
  Geral.Model.Config,
  Geral.Model.Sistema,
  Geral.Model.SeloGrupo,
  Geral.Model.Permissao;

{ TSeloLivroBusiness }

class function TSeloLivroBusiness.BuscarMediaDiaria(
  const vpSeloGrupoId: Integer;
  const vpDataBase: TDateTime): Integer;
var
  viDecendio: TDecendio;
  viListaDecendioAnterior: TObjectList<TDecendio>;
  viIntervaloData: TIntervaloData;
  viQuery: TI9Query;
  viQuantidade: Integer;
  viQuantidadeSoma: Integer;
  viMedia: Double;
begin
  Result := 0;
  viDecendio := nil;
  viListaDecendioAnterior := nil;
  viIntervaloData := nil;
  viQuery := nil;

  try
    if vpSeloGrupoId <= 0 then
      Exit;

    if vpDataBase <= 0 then
      Exit;

    viDecendio := TDecendioUtil.BuscarDecendio(vpDataBase);
    if not Assigned(viDecendio) then
      Exit;

    viListaDecendioAnterior := TDecendioUtil.ListarDecendioAnterior(
      viDecendio,
      2);

    if not Assigned(viListaDecendioAnterior) then
      Exit;

    if viListaDecendioAnterior.Count <= 0 then
      Exit;

    viIntervaloData := TDecendioUtil.BuscarIntervaloData(viListaDecendioAnterior);
    if not Assigned(viIntervaloData) then
      Exit;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT '+
      '    CAST(G_SL.DATA AS DATE) AS DATA, '+
      '    COUNT(*) AS QUANTIDADE '+
      'FROM '+
      '    G_SELO_LIVRO G_SL '+
      'INNER JOIN '+
      '    G_SELO_LOTE G_SLO ON G_SLO.SELO_LOTE_ID = G_SL.SELO_LOTE_ID '+
      'WHERE '+
      '    G_SL.SELO_SITUACAO_ID = :SELO_SITUACAO_ID AND '+
      '    G_SL.DATA BETWEEN :DATA_INICIAL AND :DATA_FINAL AND '+
      '    G_SLO.SELO_GRUPO_ID = :SELO_GRUPO_ID '+
      'GROUP BY '+
      '    DATA ';
    {$ENDREGION}

    viQuery.ParamByName('SELO_SITUACAO_ID').AsInteger := CG_SELO_SITUACAO_ID_UTILIZADO;
    viQuery.ParamByName('DATA_INICIAL').AsDateTime := viIntervaloData.DataInicial;
    viQuery.ParamByName('DATA_FINAL').AsDateTime := viIntervaloData.DataFinal;
    viQuery.ParamByName('SELO_GRUPO_ID').AsInteger := vpSeloGrupoId;

    viQuery.Open;
    if viQuery.IsEmpty then
      Exit;

    viQuantidadeSoma := 0;
    viQuery.First;

    while not viQuery.Eof do
    begin
      viQuantidade := viQuery.FieldByName('QUANTIDADE').AsInteger;
      viQuantidadeSoma := viQuantidadeSoma + viQuantidade;
      viQuery.Next;
    end;

    viMedia := viQuantidadeSoma / viQuery.RecordCount;
    Result := Round(viMedia);
  finally
    FreeAndNil(viDecendio);
    FreeAndNil(viListaDecendioAnterior);
    FreeAndNil(viIntervaloData);
    FreeAndNil(viQuery);
  end;
end;

class function TSeloLivroBusiness.BuscarQuantidadeSeloUtilizado(
  const vpSeloGrupoId: Integer;
  const vpDataBase: TDateTime): Integer;
var
  viQuery: TI9Query;
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  Result := 0;
  viQuery := nil;

  try
    if vpSeloGrupoId <= 0 then
      Exit;

    if vpDataBase <= 0 then
      Exit;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT '+
      '    COUNT(*) AS QUANTIDADE '+
      'FROM '+
      '    G_SELO_LIVRO G_SL '+
      'INNER JOIN '+
      '    G_SELO_LOTE G_SLO ON G_SLO.SELO_LOTE_ID = G_SL.SELO_LOTE_ID '+
      'WHERE '+
      '    G_SL.SELO_SITUACAO_ID = :SELO_SITUACAO_ID AND '+
      '    G_SL.DATA BETWEEN :DATA_INICIAL AND :DATA_FINAL AND '+
      '    G_SLO.SELO_GRUPO_ID = :SELO_GRUPO_ID ';
    {$ENDREGION}

    viQuery.ParamByName('SELO_SITUACAO_ID').AsInteger := CG_SELO_SITUACAO_ID_UTILIZADO;

    viDataInicial := StartOfTheDay(vpDataBase);
    viQuery.ParamByName('DATA_INICIAL').AsDateTime := viDataInicial;

    viDataFinal := EndOfTheDay(vpDataBase);
    viQuery.ParamByName('DATA_FINAL').AsDateTime := viDataFinal;

    viQuery.ParamByName('SELO_GRUPO_ID').AsInteger := vpSeloGrupoId;

    viQuery.Open;
    if viQuery.IsEmpty then
      Exit;

    Result := viQuery.FieldByName('QUANTIDADE').AsInteger;
  finally
    FreeAndNil(viQuery);
  end;
end;

class function TSeloLivroBusiness.BuscarSeloGeralHabilitarMediaDiaria: Boolean;
var
  viValor: string;
begin
  viValor := TConfigBusiness.BuscarValor(
    CI_COD_SISTEMA_CAIXA,
    'SELO',
    'GERAL',
    'HABILITAR_MEDIA_DIARIA');

  // S = Sim
  Result := SameText(
    viValor,
    'S');
end;

class function TSeloLivroBusiness.ValidarSolicitacaoSelo(
  const vpSeloGrupoId: Integer;
  const vpDataBase: TDateTime;
  const vpQuantidadeSolicitada: Integer;
  out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
var
  viQuantidadeSeloUtilizado: Integer;
  viMediaDiaria: Integer;
  viQuantidadeFinal: Integer;
  viErroValidacao: TErroValidacao;
  viMensagem: string;
  viSeloGrupoDao: TSeloGrupoDao;
  viSeloGrupo: TDataSet;
  viNumero: Integer;
  viDescricaoCompleta: string;
  viData: string;
  viPossuiErroValidacao: Boolean;
begin
  Result := False;
  vpListaErroValidacao := nil;
  viSeloGrupoDao := nil;
  viSeloGrupo := nil;

  try
    if BuscarSeloGeralHabilitarMediaDiaria then
    begin
      viQuantidadeSeloUtilizado := BuscarQuantidadeSeloUtilizado(
        vpSeloGrupoId,
        vpDataBase);

      viQuantidadeFinal := viQuantidadeSeloUtilizado + vpQuantidadeSolicitada;

      viMediaDiaria := BuscarMediaDiaria(
        vpSeloGrupoId,
        vpDataBase);

      if viQuantidadeFinal > viMediaDiaria then
      begin
        if not Assigned(vpListaErroValidacao) then
          vpListaErroValidacao := TObjectList<TErroValidacao>.Create;

        viSeloGrupoDao := TSeloGrupoDao.Create(dtmControles.DB);

        viSeloGrupo := viSeloGrupoDao.GetByID_AsDataSet(
          ['NUMERO',
          'DESCRICAO_COMPLETA'],
          vpSeloGrupoId);

        viNumero := viSeloGrupo.FieldByName('NUMERO').AsInteger;
        viDescricaoCompleta := viSeloGrupo.FieldByName('DESCRICAO_COMPLETA').AsString;

        viData := FormatDateTime(
          'dd/mm/yyyy',
          vpDataBase);

        viMensagem := string.Format(
          'A quantidade de selos solicitada (%d) do tipo %d - %s ' +
          'somada a quantidade de selos utilizados (%s - %d) ' +
          'é maior do que a média diária (%d)',
          [vpQuantidadeSolicitada,
          viNumero,
          viDescricaoCompleta,
          viData,
          viQuantidadeSeloUtilizado,
          viMediaDiaria]);

        viErroValidacao := TErroValidacaoBusiness.CriarErroValidacao(
          viMensagem,
          True,
          'ESP_QT_SELO_MAIOR_MEDIA_DIARIA',
          TTipoOperacao.toEspecial,
          CI_COD_SISTEMA_ADMINISTRATIVO);

        vpListaErroValidacao.Add(viErroValidacao);
      end;
    end;

    viPossuiErroValidacao := Assigned(vpListaErroValidacao) and
      (vpListaErroValidacao.Count > 0);

    if viPossuiErroValidacao then
      Exit;

    Result := True;
  finally
    FreeAndNil(viSeloGrupoDao);
    FreeAndNil(viSeloGrupo);
  end;
end;

end.
