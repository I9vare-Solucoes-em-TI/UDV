unit EnviadorSelosTJBusiness;

interface

uses
  RegraEnvioSeloList,
  SeloLivroList,
  SeloSituacaoDAO,
  SeloLivroDAO,
  ADM.Model.Entity.Spec.ValidacaoSelosTJ,
  GeradorSelosTJ,
  ADM.Model.Entity.Spec.EnvioSelosTJ,
  SequenciaDAO,
  GeradorLogErro,
  FormatadorMascaraSelo;

type
  TEnviadorSelosTJBusiness = class
  private
    FSeloSituacaoDAO: ISeloSituacaoDAO;
    FSeloLivroDAO: ISeloLivroDAO;
    FValidacaoSelosTJ: IValidacaoSelosTJ;
    FGeradorSelosTJ: IGeradorSelosTJ;
    FEnvioSelosTJ: IEnvioSelosTJ;
    FSequenciaDAO: ISequenciaDAO;
    FGeradorLogErro: IGeradorLogErro;
    FFormatadorMascaraSelo: IFormatadorMascaraSelo;

    function GetSeloSituacaoDAO: ISeloSituacaoDAO;
    function GetSeloLivroDAO: ISeloLivroDAO;
    function GetValidacaoSelosTJ: IValidacaoSelosTJ;
    function GetGeradorSelosTJ: IGeradorSelosTJ;
    function GetEnvioSelosTJ: IEnvioSelosTJ;
    function GetSequenciaDAO: ISequenciaDAO;
    function GetGeradorLogErro: IGeradorLogErro;
    function GetFormatadorMascaraSelo: IFormatadorMascaraSelo;

    function GetList(
      const vpValue: TRegraEnvioSeloList): TSeloLivroList;

    procedure SetSeloSituacaoDAO(
      const Value: ISeloSituacaoDAO);

    procedure SetSeloLivroDAO(
      const Value: ISeloLivroDAO);

    procedure SetValidacaoSelosTJ(
      const Value: IValidacaoSelosTJ);

    procedure SetGeradorSelosTJ(
      const Value: IGeradorSelosTJ);

    procedure SetEnvioSelosTJ(
      const Value: IEnvioSelosTJ);

    procedure SetSequenciaDAO(
      const Value: ISequenciaDAO);

    procedure SetGeradorLogErro(
      const Value: IGeradorLogErro);

    procedure SetFormatadorMascaraSelo(
      const Value: IFormatadorMascaraSelo);
  public
    property SeloSituacaoDAO: ISeloSituacaoDAO read GetSeloSituacaoDAO
      write SetSeloSituacaoDAO;

    property SeloLivroDAO: ISeloLivroDAO read GetSeloLivroDAO
      write SetSeloLivroDAO;

    property ValidacaoSelosTJ: IValidacaoSelosTJ read GetValidacaoSelosTJ
      write SetValidacaoSelosTJ;

    property GeradorSelosTJ: IGeradorSelosTJ read GetGeradorSelosTJ
      write SetGeradorSelosTJ;

    property EnvioSelosTJ: IEnvioSelosTJ read GetEnvioSelosTJ
      write SetEnvioSelosTJ;

    property SequenciaDAO: ISequenciaDAO read GetSequenciaDAO
      write SetSequenciaDAO;

    property GeradorLogErro: IGeradorLogErro read GetGeradorLogErro
      write SetGeradorLogErro;

    property FormatadorMascaraSelo: IFormatadorMascaraSelo
      read GetFormatadorMascaraSelo write SetFormatadorMascaraSelo;

    procedure EnviarSelos(
      const vpValue: TRegraEnvioSeloList);
  end;

implementation

uses
  SeloSituacaoBusiness,
  SeloSituacao,
  System.SysUtils,
  System.DateUtils,
  System.Math,
  System.Types,
  CampoOrdenacaoList,
  CampoOrdenacao,
  CampoOrdenacaoImpl,
  SeloLivroComparer,
  RegraEnvioSelo,
  System.Generics.Defaults,
  SeloLivro,
  IntervaloDatas,
  IntervaloDatasImpl,
  Sequencia,
  SequenciaBusiness;

{ TEnviadorSelosTJBusiness }

procedure TEnviadorSelosTJBusiness.EnviarSelos(
  const vpValue: TRegraEnvioSeloList);
{$REGION 'Constantes'}
const
  CI_TABELA_SEQUENCIA: string = 'SELO_CODIGO_EXPORTACAO';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSeloLivroList: TSeloLivroList;
  viSeloLivroListVerificado: TSeloLivroList;
  viSeloLivro: ISeloLivro;
  viDataExportacao: TDateTime;
  viCodigoExportacao: Integer;
  viSequenciaBusiness: TSequenciaBusiness;
  viSequencia: ISequencia;
{$ENDREGION}
begin
  try
    // 1º Passo - Obter os selos utilizados que ainda não foram exportados
    viSeloLivroList := GetList(vpValue);
    try
      if CompareValue(viSeloLivroList.Count, ZeroValue) = EqualsValue then
        Exit;

      {
        2º Passo - Validar os selos obtidos antes do envio.
        Os selos não validados são os que serão enviados.
      }
      viSeloLivroListVerificado := TSeloLivroList.Create;
      for viSeloLivro in viSeloLivroList do
      begin
        if viSeloLivro.Validado then
          Continue;

        viSeloLivro.Validado := ValidacaoSelosTJ.Validar(
          viSeloLivro);

        if viSeloLivro.Validado then
        begin
          SeloLivroDAO.AlterarValidado(viSeloLivro);
          Continue;
        end;

        viSeloLivroListVerificado.Add(viSeloLivro);
      end;

      try
        if CompareValue(viSeloLivroListVerificado.Count,
          ZeroValue) = EqualsValue then
          Exit;

        // 3º Passo - Atribuir dados de exportação
        viDataExportacao := Now;
        viCodigoExportacao := ZeroValue;

        viSequenciaBusiness := TSequenciaBusiness.Create;
        try
          viSequenciaBusiness.SequenciaDAO := SequenciaDAO;

          viSequencia := viSequenciaBusiness.GerarSequencia(
            CI_TABELA_SEQUENCIA);

          if Assigned(viSequencia) then
            viCodigoExportacao := viSequencia.Sequencia;
        finally
          FreeAndNil(viSequenciaBusiness);
        end;

        for viSeloLivro in viSeloLivroListVerificado do
        begin
          viSeloLivro.DataExportacao := viDataExportacao;
          viSeloLivro.CodigoExportacao := viCodigoExportacao;
        end;

        SeloLivroDAO.AlterarExportacao(viSeloLivroListVerificado,
          viDataExportacao, viCodigoExportacao);

        // 4º Passo - Gerar e enviar selos
        GeradorSelosTJ.SeloLivroList := viSeloLivroListVerificado;
        EnvioSelosTJ.EnviarSelos(GeradorSelosTJ.Gerar);

        // 5º Passo - Validar os selos enviados
        for viSeloLivro in viSeloLivroListVerificado do
        begin
          viSeloLivro.Validado := ValidacaoSelosTJ.Validar(
            viSeloLivro);

          if not viSeloLivro.Validado then
            Continue;

          SeloLivroDAO.AlterarValidado(
            viSeloLivro);
        end;
      finally
        FreeAndNil(viSeloLivroListVerificado);
      end;
    finally
      FreeAndNil(viSeloLivroList);
    end;
  except
    on E: Exception do
    begin
      GeradorLogErro.GerarLogErro(E);
      raise E;
    end;
  end;
end;

function TEnviadorSelosTJBusiness.GetEnvioSelosTJ: IEnvioSelosTJ;
begin
  Result := FEnvioSelosTJ;
end;

function TEnviadorSelosTJBusiness.GetFormatadorMascaraSelo:
  IFormatadorMascaraSelo;
begin
  Result := FFormatadorMascaraSelo;
end;

function TEnviadorSelosTJBusiness.GetGeradorLogErro: IGeradorLogErro;
begin
  Result := FGeradorLogErro;
end;

function TEnviadorSelosTJBusiness.GetGeradorSelosTJ: IGeradorSelosTJ;
begin
  Result := FGeradorSelosTJ;
end;

function TEnviadorSelosTJBusiness.GetList(
  const vpValue: TRegraEnvioSeloList): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_DATA_EXPORTACAO_IS_NULL: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viRegraEnvioSelo: IRegraEnvioSelo;
  viSeloSituacaoBusiness: TSeloSituacaoBusiness;
  viSeloSituacao: ISeloSituacao;
  viCampoOrdenacaoList: TCampoOrdenacaoList;
  viCampoOrdenacao: ICampoOrdenacao;
  viSeloLivroList: TSeloLivroList;
  viComparer: IComparer<ISeloLivro>;
  viData: TDateTime;
  viIntervaloDatas: IIntervaloDatas;
  I: Integer;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  viSeloSituacaoBusiness := TSeloSituacaoBusiness.Create;
  viSeloSituacaoBusiness.SeloSituacaoDAO := SeloSituacaoDAO;

  try
    viSeloSituacao := viSeloSituacaoBusiness.SeloSituacaoUtilizado;
  finally
    FreeAndNil(viSeloSituacaoBusiness);
  end;

  viData := Now;
  viIntervaloDatas := TIntervaloDatas.Create;
  viIntervaloDatas.DataInicial := DateOf(viData);

  for viRegraEnvioSelo in vpValue do
  begin
    viIntervaloDatas.DataFinal := IncMinute(
      viData,
      -viRegraEnvioSelo.Intervalo);

    {viSeloLivroList := SeloLivroDAO.GetList(
      viSeloSituacao,
      viRegraEnvioSelo.SeloGrupo,
      viIntervaloDatas,
      CI_DATA_EXPORTACAO_IS_NULL,
      nil);}

    viSeloLivroList := SeloLivroDAO.GetList(
      viSeloSituacao,
      viRegraEnvioSelo.SeloGrupo,
      viIntervaloDatas.DataFinal,
      CI_DATA_EXPORTACAO_IS_NULL,
      nil);

    try
      Result.AddRange(viSeloLivroList);
    finally
      FreeAndNil(viSeloLivroList);
    end;
  end;

  viCampoOrdenacaoList := TCampoOrdenacaoList.Create;
  try
    viCampoOrdenacao := TCampoOrdenacao.Create(
      TSeloLivroComparer.CG_NUMERO_AGRUPADOR);

    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viComparer := TSeloLivroComparer.Create(viCampoOrdenacaoList);
    Result.Sort(viComparer);

    {$REGION 'Colocar selos agrupadores primeiro'}
    for I := ZeroValue to Pred(Result.Count) do
    begin
      viSeloLivro := Result[I];

      if viSeloLivro.NumeroAgrupador.Equals(
        FormatadorMascaraSelo.FormatarMascaraSelo(viSeloLivro)) then
      begin
        Result.Delete(I);
        Result.Insert(ZeroValue, viSeloLivro);
      end;
    end;
    {$ENDREGION}
  finally
    FreeAndNil(viCampoOrdenacaoList);
  end;
end;

function TEnviadorSelosTJBusiness.GetSeloLivroDAO: ISeloLivroDAO;
begin
  Result := FSeloLivroDAO;
end;

function TEnviadorSelosTJBusiness.GetSeloSituacaoDAO: ISeloSituacaoDAO;
begin
  Result := FSeloSituacaoDAO;
end;

function TEnviadorSelosTJBusiness.GetSequenciaDAO: ISequenciaDAO;
begin
  Result := FSequenciaDAO;
end;

function TEnviadorSelosTJBusiness.GetValidacaoSelosTJ: IValidacaoSelosTJ;
begin
  Result := FValidacaoSelosTJ;
end;

procedure TEnviadorSelosTJBusiness.SetEnvioSelosTJ(
  const Value: IEnvioSelosTJ);
begin
  FEnvioSelosTJ := Value;
end;

procedure TEnviadorSelosTJBusiness.SetFormatadorMascaraSelo(
  const Value: IFormatadorMascaraSelo);
begin
  FFormatadorMascaraSelo := Value;
end;

procedure TEnviadorSelosTJBusiness.SetGeradorLogErro(
  const Value: IGeradorLogErro);
begin
  FGeradorLogErro := Value;
end;

procedure TEnviadorSelosTJBusiness.SetGeradorSelosTJ(
  const Value: IGeradorSelosTJ);
begin
  FGeradorSelosTJ := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSeloLivroDAO(
  const Value: ISeloLivroDAO);
begin
  FSeloLivroDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSeloSituacaoDAO(
  const Value: ISeloSituacaoDAO);
begin
  FSeloSituacaoDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSequenciaDAO(
  const Value: ISequenciaDAO);
begin
  FSequenciaDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetValidacaoSelosTJ(
  const Value: IValidacaoSelosTJ);
begin
  FValidacaoSelosTJ := Value;
end;

end.
