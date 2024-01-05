unit GerenciarBoletos;

interface

uses
  I9Query, I9Connection, Controles, System.SysUtils, ACBrBoleto, ACBrBoletoFCFR,
  Data.DB,
  ACBrBoletoConversao;

const
  CG_SITUACAO_AGUARDANDO = '1';
  CG_SITUACAO_REGISTRADO = '2';
  CG_SITUACAO_CANCELADO  = '3';
  // Situação 4 - Não definido
  CG_SITUACAO_ALTERADO   = '5';

type
  TBoleto = record
    boletoId: Integer;
    bancoId: string;
    vencimento: TDateTime;
    dataDocumento: TDateTime;
    numeroDocumento: string;
    especieDoc: string;
    aceite: string;
    dataProcessamento: TDateTime;
    nossoNumero: string;
    carteira: string;
    valorDocumento: Double;
    parcela: Integer;
    totalParcelas: Integer;
    dataDesconto: TDateTime;
    dataMoraJuros: TDateTime;
    valorDesconto: Double;
    valorMoraJuros: Double;
    percentualMulta: Double;
    nomeSacado: string;
    CNPJCPF: string;
    cidade: string;
    logradouro: string;
    numero: string;
    bairro: string;
    UF: string;
    CEP: string;
    email: string;
    fone: string;
    situacao: string;
  end;

  TBoletoCedente = record
    boletoCedenteId: Integer;
    boletoId: Integer;
    nome: string;
    cpfCnpj: string;
    logradouro: string;
    modalidade: string;
    complemento: string;
    bairro: string;
    cidade: string;
    uf: string;
    cep: string;
    agenciaNumero: string;
    agenciaDigito: string;
    agenciaNome: string;
    agenciaUf: string;
    contaNumero: string;
    contaDigito: string;
    bancoNumero: string;
    bancoDigito: string;
    bancoNome: string;
    convenio: string;
    codigoCedenteNumero: string;
    codigoCedenteDigito: string;
  end;

  TBoletoSacado = record
    boletoSacadoId: Integer;
    boletoId: Integer;
    nome: string;
    cpf: string;
    cidade: string;
    logradouro: string;
    bairro: string;
    uf: string;
    cep: string;
    email: string;
  end;

  TArrayOfBoleto = array of TBoleto;

  TRetornoGerouRemessa = record
    remessaId: Integer;
    gerouRemessa: Boolean;
    msgRetorno: string;
  end;

  TGerenciarBoletos = class

  private

    function BuscarLocalRemessa(vpConector: TI9Connection; vpBancoId: string): string;
    function BuscarLocalRetorno(vpConector: TI9Connection; vpBancoId: string): string;

  public

    function GerarRemessa(
      vpConector: TI9Connection;
      vpBancoId: Integer;
      vpBoleto: TArrayOfBoleto;
      var vpAcbrBoletoFC: TACBrBoletoFCFR
    ): TRetornoGerouRemessa;

    function CarregarDadosDoCedente(
             var vpAcbrBoleto: TACBrBoleto;
             vpBoletoId: Integer;
             vpConector: TI9Connection;
             var vpMsgRetorno: string
    ): Boolean;

    function GravarBoletoRemessa(
      vpConector        : TI9Connection;
      vpBoletoId        : Integer;
      vpTabela          : string;
      vpCampoId         : Integer;
      vpPathRemessa     : string;
      vpPathRetorno     : string;
      vpPathLogotipo    : string;
      vpPathGerarpdf    : string;
      vpMensagem        : string;
      vpEspecie         : string;
      vpMoeda           : string;
      vpAceite          : string;
      vpCarteira        : string;
      vpLocalPagto      : string;
      vpContRemessa     : Integer;
      vpSituacao        : string;
      vpValor           : Currency;
      vpDataEmissao     : TDateTime;
      vpDataVencimento  : TDateTime;
      vpNossoNumero     : Integer;
      vpDataCancelado   : TDateTime;
      vpEnvioEmail      : String;
      vpSelecionado     : String;
      vpBancoId         : String;
      vpBoletoCedente   : TBoletoCedente;
      vpBoletoSacado    : TBoletoSacado;
      out vpMensRetorno : string
    ) : Boolean;

  end;

implementation

{ TGerenciarBoletos }

function TGerenciarBoletos.GravarBoletoRemessa(
  vpConector        : TI9Connection;
  vpBoletoId        : Integer;
  vpTabela          : string;
  vpCampoId         : Integer;
  vpPathRemessa     : string;
  vpPathRetorno     : string;
  vpPathLogotipo    : string;
  vpPathGerarpdf    : string;
  vpMensagem        : string;
  vpEspecie         : string;
  vpMoeda           : string;
  vpAceite          : string;
  vpCarteira        : string;
  vpLocalPagto      : string;
  vpContRemessa     : Integer;
  vpSituacao        : string;
  vpValor           : Currency;
  vpDataEmissao     : TDateTime;
  vpDataVencimento  : TDateTime;
  vpNossoNumero     : Integer;
  vpDataCancelado   : TDateTime;
  vpEnvioEmail      : string;
  vpSelecionado     : string;
  vpBancoId         : String;
  vpBoletoCedente   : TBoletoCedente;
  vpBoletoSacado    : TBoletoSacado;
  out vpMensRetorno : string
): Boolean;
const
  VI_MENS_ERRO = 'Erro ao gravar os dados do Boleto/Controle de Remessas';
var
  viInTransaction: Boolean;
  viQryConsulta: TI9Query;
  viQryBoleto: TI9Query;
  viQryBoletoCedente: TI9Query;
  viQryBoletoSacado: TI9Query;
  viQryBoletoVinculo: TI9Query;
  viBoletoCedenteId: Integer;
  viBoletoSacadoId: Integer;
  viBoletoVinculoId: Integer;
  viValorBoletos: Currency;
begin
  viInTransaction := vpConector.InTransaction;
  if not viInTransaction then
    vpConector.StartTransaction;

  try
    {$REGION 'C_BOLETO'}
    if vpBoletoId <= 0 then
      vpBoletoId := dtmControles.GerarSequencia('C_BOLETO');

    viQryBoleto := TI9Query.Create(nil);
    try
      viQryBoleto.Close;
      viQryBoleto.Connection := vpConector;
      viQryBoleto.SQL.Clear;
      viQryBoleto.SQL.Add(' UPDATE OR INSERT ');
      viQryBoleto.SQL.Add('   INTO C_BOLETO ( ');
      viQryBoleto.SQL.Add('        BOLETO_ID ');
      viQryBoleto.SQL.Add('        , PATH_REMESSA ');
      viQryBoleto.SQL.Add('        , PATH_RETORNO ');
      viQryBoleto.SQL.Add('        , PATH_LOGOTIPO ');
      viQryBoleto.SQL.Add('        , PATH_GERARPDF ');
      viQryBoleto.SQL.Add('        , MENSAGEM ');
      viQryBoleto.SQL.Add('        , ESPECIE ');
      viQryBoleto.SQL.Add('        , MOEDA ');
      viQryBoleto.SQL.Add('        , ACEITE ');
      viQryBoleto.SQL.Add('        , CARTEIRA ');
      viQryBoleto.SQL.Add('        , LOCAL_PAGTO ');
      viQryBoleto.SQL.Add('        , CONT_REMESSA ');
      viQryBoleto.SQL.Add('        , SITUACAO ');
      viQryBoleto.SQL.Add('        , VALOR ');
      viQryBoleto.SQL.Add('        , DATA_EMISSAO ');
      viQryBoleto.SQL.Add('        , DATA_VENCIMENTO ');
      viQryBoleto.SQL.Add('        , NOSSO_NUMERO ');
      viQryBoleto.SQL.Add('        , DATA_CANCELADO ');
      viQryBoleto.SQL.Add('        , ENVIO_EMAIL ');
      viQryBoleto.SQL.Add('        , SELECIONADO ');
      viQryBoleto.SQL.Add('        , BANCO_ID ');
      viQryBoleto.SQL.Add(' ) VALUES ( ');
      viQryBoleto.SQL.Add('        ' + IntToStr(vpBoletoId));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpPathRemessa));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpPathRetorno));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpPathLogotipo));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpPathGerarpdf));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpMensagem));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpEspecie));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpMoeda));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpAceite));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpCarteira));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpLocalPagto));
      viQryBoleto.SQL.Add('        , ' + IntToStr(vpContRemessa));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpSituacao));
      viQryBoleto.SQL.Add('        , ' + StringReplace(FormatFloat('#0.00', vpValor), ',', '.', []));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(FormatDateTime('yyyy-mm-dd', vpDataEmissao)));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(FormatDateTime('yyyy-mm-dd', vpDataVencimento)));
      viQryBoleto.SQL.Add('        , ' + IntToStr(vpNossoNumero));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(FormatDateTime('yyyy-mm-dd', vpDataCancelado)));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpEnvioEmail));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpSelecionado));
      viQryBoleto.SQL.Add('        , ' + QuotedStr(vpBancoId));
      viQryBoleto.SQL.Add(' ) ');

      Result := viQryBoleto.ExecSQL > 0;

      if not Result then
      begin
        if not viInTransaction then
          vpConector.Rollback;

        vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Remessa do Boleto';
        Exit;
      end;

    finally
      FreeAndNil(viQryBoleto);
    end;
    {$ENDREGION 'C_BOLETO'}

    {$REGION 'C_BOLETO_CEDENTE'}
    viQryConsulta := TI9Query.Create(nil);
    try
      viQryConsulta.Close;
      viQryConsulta.Connection := vpConector;
      viQryConsulta.SQL.Clear;
      viQryConsulta.SQL.Add(' SELECT ');
      viQryConsulta.SQL.Add('        BC.BOLETO_CEDENTE_ID ');
      viQryConsulta.SQL.Add('   FROM C_BOLETO_CEDENTE BC ');
      viQryConsulta.SQL.Add('  WHERE BC.BOLETO_ID = ' + IntToStr(vpBoletoId));
      viQryConsulta.Open;

      if not viQryConsulta.IsEmpty then
        viBoletoCedenteId := viQryConsulta.FieldByName('BOLETO_CEDENTE_ID').AsInteger
      else
        viBoletoCedenteId := dtmControles.GerarSequencia('C_BOLETO_CEDENTE');

    finally
      FreeAndNil(viQryConsulta);
    end;

    viQryBoletoCedente := TI9Query.Create(nil);
    try
      viQryBoletoCedente.Close;
      viQryBoletoCedente.Connection := vpConector;
      viQryBoletoCedente.SQL.Clear;
      viQryBoletoCedente.SQL.Add(' UPDATE OR INSERT ');
      viQryBoletoCedente.SQL.Add('   INTO C_BOLETO_CEDENTE ( ');
      viQryBoletoCedente.SQL.Add('          BOLETO_CEDENTE_ID ');
      viQryBoletoCedente.SQL.Add('        , BOLETO_ID ');
      viQryBoletoCedente.SQL.Add('        , NOME ');
      viQryBoletoCedente.SQL.Add('        , CPF_CNPJ ');
      viQryBoletoCedente.SQL.Add('        , LOGRADOURO ');
      viQryBoletoCedente.SQL.Add('        , MODALIDADE ');
      viQryBoletoCedente.SQL.Add('        , COMPLEMENTO ');
      viQryBoletoCedente.SQL.Add('        , BAIRRO ');
      viQryBoletoCedente.SQL.Add('        , CIDADE ');
      viQryBoletoCedente.SQL.Add('        , UF ');
      viQryBoletoCedente.SQL.Add('        , CEP ');
      viQryBoletoCedente.SQL.Add('        , AGENCIA_NUMERO ');
      viQryBoletoCedente.SQL.Add('        , AGENCIA_DIGITO ');
      viQryBoletoCedente.SQL.Add('        , AGENCIA_NOME ');
      viQryBoletoCedente.SQL.Add('        , AGENCIA_UF ');
      viQryBoletoCedente.SQL.Add('        , CONTA_NUMERO ');
      viQryBoletoCedente.SQL.Add('        , CONTA_DIGITO ');
      viQryBoletoCedente.SQL.Add('        , BANCO_NUMERO ');
      viQryBoletoCedente.SQL.Add('        , BANCO_DIGITO ');
      viQryBoletoCedente.SQL.Add('        , BANCO_NOME ');
      viQryBoletoCedente.SQL.Add('        , CONVENIO ');
      viQryBoletoCedente.SQL.Add('        , CODIGO_CEDENTE_NUMERO ');
      viQryBoletoCedente.SQL.Add('        , CODIGO_CEDENTE_DIGITO ');
      viQryBoletoCedente.SQL.Add(' ) VALUES ( ');
      viQryBoletoCedente.SQL.Add('          ' + IntToStr(viBoletoCedenteId));
      viQryBoletoCedente.SQL.Add('        , ' + IntToStr(vpBoletoId));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.nome));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.cpfCnpj));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.logradouro));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.modalidade));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.complemento));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.bairro));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.cidade));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.uf));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.cep));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.agenciaNumero));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.agenciaDigito));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.agenciaNome));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.agenciaUf));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.contaNumero));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.contaDigito));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.bancoNumero));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.bancoDigito));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.bancoNome));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.convenio));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.codigoCedenteNumero));
      viQryBoletoCedente.SQL.Add('        , ' + QuotedStr(vpBoletoCedente.codigoCedenteDigito));
      viQryBoletoCedente.SQL.Add(' ) ');

      Result := viQryBoletoCedente.ExecSQL > 0;

      if not Result then
      begin
        if not viInTransaction then
          vpConector.Rollback;

        vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Cedente do Boleto';
        Exit;
      end;

    finally
      FreeAndNil(viQryBoletoCedente);
    end;
    {$ENDREGION 'C_BOLETO_CEDENTE'}

    {$REGION 'C_BOLETO_SACADO'}
    viQryConsulta := TI9Query.Create(nil);
    try
      viQryConsulta.Close;
      viQryConsulta.Connection := vpConector;
      viQryConsulta.SQL.Clear;
      viQryConsulta.SQL.Add(' SELECT ');
      viQryConsulta.SQL.Add('        BS.BOLETO_SACADO_ID ');
      viQryConsulta.SQL.Add('   FROM C_BOLETO_SACADO BS ');
      viQryConsulta.SQL.Add('  WHERE BS.BOLETO_ID = ' + IntToStr(vpBoletoId));
      viQryConsulta.Open;

      if not viQryConsulta.IsEmpty then
        viBoletoSacadoId := viQryConsulta.FieldByName('BOLETO_SACADO_ID').AsInteger
      else
        viBoletoSacadoId := dtmControles.GerarSequencia('C_BOLETO_SACADO');

    finally
      FreeAndNil(viQryConsulta);
    end;

    viQryBoletoSacado := TI9Query.Create(nil);
    try
      viQryBoletoSacado.Close;
      viQryBoletoSacado.Connection := vpConector;
      viQryBoletoSacado.SQL.Clear;
      viQryBoletoSacado.SQL.Add(' UPDATE OR INSERT ');
      viQryBoletoSacado.SQL.Add('   INTO C_BOLETO_SACADO ( ');
      viQryBoletoSacado.SQL.Add('        BOLETO_SACADO_ID ');
      viQryBoletoSacado.SQL.Add('        , BOLETO_ID ');
      viQryBoletoSacado.SQL.Add('        , NOME ');
      viQryBoletoSacado.SQL.Add('        , CPF ');
      viQryBoletoSacado.SQL.Add('        , CIDADE ');
      viQryBoletoSacado.SQL.Add('        , LOGRADOURO ');
      viQryBoletoSacado.SQL.Add('        , BAIRRO ');
      viQryBoletoSacado.SQL.Add('        , UF ');
      viQryBoletoSacado.SQL.Add('        , CEP ');
      viQryBoletoSacado.SQL.Add('        , EMAIL ');
      viQryBoletoSacado.SQL.Add(' ) VALUES ( ');
      viQryBoletoSacado.SQL.Add('         ' + IntToStr(viBoletoSacadoId));
      viQryBoletoSacado.SQL.Add('        , ' + IntToStr(vpBoletoID));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.nome));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.cpf));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.cidade));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.logradouro));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.bairro));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.uf));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.cep));
      viQryBoletoSacado.SQL.Add('        , ' + QuotedStr(vpBoletoSacado.email));
      viQryBoletoSacado.SQL.Add(' ) ');

      Result := viQryBoletoSacado.ExecSQL > 0;

      if not Result then
      begin
        if not viInTransaction then
          vpConector.Rollback;

        vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Sacado do Boleto';
        Exit;
      end;

    finally
      FreeAndNil(viQryBoletoSacado);
    end;
    {$ENDREGION 'C_BOLETO_SACADO'}

    {$REGION 'C_BOLETO_VINCULO'}
    viQryConsulta := TI9Query.Create(nil);
    try
      viQryConsulta.Close;
      viQryConsulta.Connection := vpConector;
      viQryConsulta.SQL.Clear;
      viQryConsulta.SQL.Add(' SELECT ');
      viQryConsulta.SQL.Add('        BV.BOLETO_VINCULO_ID ');
      viQryConsulta.SQL.Add('   FROM C_BOLETO_VINCULO BV ');
      viQryConsulta.SQL.Add('  WHERE BV.BOLETO_ID = ' + IntToStr(vpBoletoId));
      viQryConsulta.SQL.Add('    AND BV.TABELA = ' + QuotedStr('P_TITULO'));
      viQryConsulta.SQL.Add('    AND BV.CAMPO_ID = ' + IntToStr(vpCampoId));
      viQryConsulta.Open;

      if not viQryConsulta.IsEmpty then
        viBoletoVinculoId := viQryConsulta.FieldByName('BOLETO_VINCULO_ID').AsInteger
      else
        viBoletoVinculoId := dtmControles.GerarSequencia('C_BOLETO_VINCULO');

    finally
      FreeAndNil(viQryConsulta);
    end;

    viQryBoletoVinculo := TI9Query.Create(nil);
    try
      viQryBoletoVinculo.Close;
      viQryBoletoVinculo.Connection := vpConector;
      viQryBoletoVinculo.SQL.Clear;
      viQryBoletoVinculo.SQL.Add(' UPDATE OR INSERT ');
      viQryBoletoVinculo.SQL.Add('   INTO C_BOLETO_VINCULO ( ');
      viQryBoletoVinculo.SQL.Add('        BOLETO_VINCULO_ID ');
      viQryBoletoVinculo.SQL.Add('        , BOLETO_ID ');
      viQryBoletoVinculo.SQL.Add('        , TABELA ');
      viQryBoletoVinculo.SQL.Add('        , CAMPO_ID ');
      viQryBoletoVinculo.SQL.Add('        , VALOR_TOTAL ');
      viQryBoletoVinculo.SQL.Add('   ) VALUES ( ');
      viQryBoletoVinculo.SQL.Add('        ' + IntToStr(viBoletoVinculoId));
      viQryBoletoVinculo.SQL.Add('        , ' + IntToStr(vpBoletoId));
      viQryBoletoVinculo.SQL.Add('        , ' + QuotedStr(vpTabela));
      viQryBoletoVinculo.SQL.Add('        , ' + IntToStr(vpCampoId));
      viQryBoletoVinculo.SQL.Add('        , ' + StringReplace(FormatFloat('#0.00', vpValor), ',', '.', []));
      viQryBoletoVinculo.SQL.Add('   ) ');

      Result := viQryBoletoVinculo.ExecSQL > 0;

      if not Result then
      begin
        if not viInTransaction then
          vpConector.Rollback;

        vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Vinculo do Boleto';
        Exit;
      end;

    finally
      FreeAndNil(viQryBoletoVinculo);
    end;
    {$ENDREGION 'C_BOLETO_VINCULO'}

    {$REGION 'C_BOLETO VALOR TOTAL'}
    viQryConsulta := TI9Query.Create(nil);
    try
      viQryConsulta.Close;
      viQryConsulta.Connection := vpConector;
      viQryConsulta.SQL.Clear;
      viQryConsulta.SQL.Add(' SELECT ');
      viQryConsulta.SQL.Add('        SUM(BV.VALOR_TOTAL) VALOR_TOTAL ');
      viQryConsulta.SQL.Add('   FROM C_BOLETO B ');
      viQryConsulta.SQL.Add('  INNER JOIN C_BOLETO_VINCULO BV ON B.BOLETO_ID = BV.BOLETO_ID ');
      viQryConsulta.SQL.Add('  WHERE B.BOLETO_ID = ' + IntToStr(vpBoletoId));
      viQryConsulta.Open;

      viValorBoletos := 0;
      if not viQryConsulta.IsEmpty then
        viValorBoletos := viQryConsulta.FieldByName('VALOR_TOTAL').AsCurrency;

    finally
      FreeAndNil(viQryConsulta);
    end;

    viQryBoleto := TI9Query.Create(nil);
    try
      viQryBoleto.Close;
      viQryBoleto.Connection := vpConector;
      viQryBoleto.SQL.Clear;
      viQryBoleto.SQL.Add(' UPDATE C_BOLETO C ');
      viQryBoleto.SQL.Add('    SET C.VALOR = ' + StringReplace(FormatFloat('#0.00', vpValor), ',', '.', []));
      viQryBoleto.SQL.Add('  WHERE C.BOLETO_ID = ' + IntToStr(vpBoletoId));

      Result := viQryBoleto.ExecSQL > 0;

      if not Result then
      begin
        if not viInTransaction then
          vpConector.Rollback;

        vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Atualização de valores';
        Exit;
      end;

    finally
      FreeAndNil(viQryBoleto);
    end;
    {$ENDREGION 'C_BOLETO VALOR TOTAL'}

    if not viInTransaction then
      vpConector.Commit;
  except
    on e: exception do
    begin
      if not viInTransaction then
        vpConector.Rollback;

      vpMensRetorno := VI_MENS_ERRO + sLineBreak + 'Vinculo do Boleto' + sLineBreak + e.Message;
      Result := False;
      Exit;
    end;
  end;
end;

function TGerenciarBoletos.BuscarLocalRemessa(vpConector: TI9Connection; vpBancoId: string): string;
var
  viQryAux: TI9Query;
begin
  viQryAux := TI9Query.Create(nil);
  try
    viQryAux.Close;
    viQryAux.Connection := vpConector;
    viQryAux.SQL.Clear;
    viQryAux.SQL.Add(' SELECT ');
    viQryAux.SQL.Add('        BN.LOCAL_REMESSA ');
    viQryAux.SQL.Add('   FROM G_BANCO BN ');
    viQryAux.SQL.Add('  WHERE BN.banco_id = ' + QuotedStr(vpBancoId));
    viQryAux.Open;

    if viQryAux.IsEmpty then
      Result := ''
    else
      Result := viQryAux.FieldByName('LOCAL_REMESSA').AsString;

  finally
    FreeAndNil(viQryAux);
  end;
end;

function TGerenciarBoletos.BuscarLocalRetorno(vpConector: TI9Connection; vpBancoId: string): string;
var
  viQryAux: TI9Query;
begin
  viQryAux := TI9Query.Create(nil);
  try
    viQryAux.Close;
    viQryAux.Connection := vpConector;
    viQryAux.SQL.Clear;
    viQryAux.SQL.Add(' SELECT ');
    viQryAux.SQL.Add('        BN.LOCAL_RETORNO ');
    viQryAux.SQL.Add('   FROM G_BANCO BN ');
    viQryAux.SQL.Add('  WHERE BN.banco_id = ' + QuotedStr(vpBancoId));
    viQryAux.Open;

    if viQryAux.IsEmpty then
      Result := ''
    else
      Result := viQryAux.FieldByName('LOCAL_RETORNO').AsString;

  finally
    FreeAndNil(viQryAux);
  end;
end;

function TGerenciarBoletos.CarregarDadosDoCedente(
  var vpAcbrBoleto: TACBrBoleto;
  vpBoletoId: Integer;
  vpConector: TI9Connection;
  var vpMsgRetorno: string
): Boolean;
var
  viQryBoletoCedente: TI9Query;
begin
  viQryBoletoCedente := TI9Query.Create(nil);
  try
    viQryBoletoCedente.Close;
    viQryBoletoCedente.Connection := vpConector;
    viQryBoletoCedente.SQL.Clear;
    viQryBoletoCedente.SQL.Add(' SELECT * ');
    viQryBoletoCedente.SQL.Add('   FROM C_BOLETO_CEDENTE BC ');
    viQryBoletoCedente.SQL.Add('  WHERE BC.BOLETO_ID = ' + IntToStr(vpBoletoId));
    viQryBoletoCedente.Open;

    if viQryBoletoCedente.IsEmpty then
    begin
      vpMsgRetorno := 'Dados do cedente não foram encontrados!';
      Result := False;
      Exit;
    end;

    // Dados do Cedente .......................................................
    vpAcbrBoleto.Cedente.Agencia           := viQryBoletoCedente.FieldByName('AGENCIA_NUMERO').AsString;
    vpAcbrBoleto.Cedente.AgenciaDigito     := viQryBoletoCedente.FieldByName('AGENCIA_DIGITO').AsString;
    vpAcbrBoleto.Cedente.CodigoCedente     := viQryBoletoCedente.FieldByName('CODIGO_CEDENTE_NUMERO').AsString + viQryBoletoCedente.FieldByName('CODIGO_CEDENTE_DIGITO').AsString;
    vpAcbrBoleto.Cedente.Conta             := viQryBoletoCedente.FieldByName('CONTA_NUMERO').AsString;
    vpAcbrBoleto.Cedente.ContaDigito       := viQryBoletoCedente.FieldByName('CONTA_DIGITO').AsString;
    vpAcbrBoleto.Cedente.Convenio          := viQryBoletoCedente.FieldByName('CONVENIO').AsString;
    vpAcbrBoleto.Cedente.Modalidade        := viQryBoletoCedente.FieldByName('MODALIDADE').AsString;

    vpAcbrBoleto.Cedente.Nome              := AnsiUpperCase(Trim(viQryBoletoCedente.FieldByName('NOME').AsString));
    vpAcbrBoleto.Cedente.CNPJCPF           := viQryBoletoCedente.FieldByName('CPF_CNPJ').AsString;
    vpAcbrBoleto.Cedente.Logradouro        := viQryBoletoCedente.FieldByName('LOGRADOURO').AsString;
    vpAcbrBoleto.Cedente.Complemento       := viQryBoletoCedente.FieldByName('COMPLEMENTO').AsString;
    vpAcbrBoleto.Cedente.Bairro            := viQryBoletoCedente.FieldByName('BAIRRO').AsString;
    vpAcbrBoleto.Cedente.Cidade            := viQryBoletoCedente.FieldByName('CIDADE').AsString;
    vpAcbrBoleto.Cedente.UF                := viQryBoletoCedente.FieldByName('UF').AsString;
    vpAcbrBoleto.Cedente.CEP               := viQryBoletoCedente.FieldByName('CEP').AsString;
    vpAcbrBoleto.Cedente.ResponEmissao     := tbCliEmite;
    vpAcbrBoleto.Cedente.CaracTitulo       := tcSimples;
    vpAcbrBoleto.Cedente.TipoCarteira      := tctRegistrada;
    vpAcbrBoleto.Cedente.TipoInscricao     := pJuridica;

    vpAcbrBoleto.Cedente.CodigoTransmissao := '';
    vpAcbrBoleto.Cedente.NumeroRes         := '';
    vpAcbrBoleto.Cedente.Telefone          := viQryBoletoCedente.FieldByName('TELEFONE').AsString;

    Result := True;

  finally
    FreeAndNil(viQryBoletoCedente);
  end;
end;

function TGerenciarBoletos.GerarRemessa(
  vpConector: TI9Connection;
  vpBancoId: Integer;
  vpBoleto: TArrayOfBoleto;
  var vpAcbrBoletoFC: TACBrBoletoFCFR
  ): TRetornoGerouRemessa;
var
  i: Integer;
  viContadorRemessa: Integer;
  viAcbrBoleto: TAcbrBoleto;
  viPastaRemessa: string;
  viMsgRetorno: string;
begin
  viAcbrBoleto := TAcbrBoleto.Create(nil);
  try
    viAcbrBoleto.ACBrBoletoFC := vpAcbrBoletoFC;

    try
      viPastaRemessa := BuscarLocalRemessa(vpConector, vpBoleto[0].bancoId);

      if Trim(viPastaRemessa) = '' then
      begin
        Result.msgRetorno := 'Caminho da Remessa deve ser informado!';
        Result.gerouRemessa := False;
        Exit;
      end;

      try
        if not DirectoryExists(viPastaRemessa) then
          MkDir(viPastaRemessa);
      except
        Result.msgRetorno :=
          'Local do Arquivo de Remessa não Encontrado!' + sLineBreak +
          'Verifique o Local da Pasta em CADASTRO/CEDENTE/CONTAS BANCÁRIAS';
        Result.gerouRemessa := False;
        Abort;
      end;

      viAcbrBoleto.DirArqRemessa := viPastaRemessa;
      viAcbrBoleto.ListadeBoletos.Clear;

       case StrToIntDef(vpBoleto[0].bancoId, 0) of
         1   : viAcbrBoleto.Banco.TipoCobranca := cobBancoDoBrasil;
         104 : viAcbrBoleto.Banco.TipoCobranca := cobCaixaEconomica;
         237 : viAcbrBoleto.Banco.TipoCobranca := cobBradesco;
         341 : viAcbrBoleto.Banco.TipoCobranca := cobItau;
         399 : viAcbrBoleto.Banco.TipoCobranca := cobHSBC;
         748 : viAcbrBoleto.Banco.TipoCobranca := cobSicred;
         756 : viAcbrBoleto.Banco.TipoCobranca := cobBancoob;
       end;

      for i := Low(vpBoleto) to High(vpBoleto) do
      begin

        if not CarregarDadosDoCedente(viAcbrBoleto, vpBoleto[i].boletoId, vpConector, viMsgRetorno) then
        begin
          Result.msgRetorno := 'Dados do cedente estão incompletos';
          Result.gerouRemessa := False;
          Exit;
        end;

        viAcbrBoleto.ChecarDadosObrigatorios;

        with viAcbrBoleto.ListadeBoletos do
        begin
          Add(TACBrTitulo.Create(viAcbrBoleto));

          Objects[i].OcorrenciaOriginal.Tipo := toRemessaRegistrar;

          if vpBoleto[i].situacao = CG_SITUACAO_CANCELADO then
            Objects[i].OcorrenciaOriginal.Tipo := toRemessaBaixar
          else
          begin
            if vpBoleto[i].situacao = CG_SITUACAO_ALTERADO then
              Objects[i].OcorrenciaOriginal.Tipo := toRemessaAlterarVencimento;
          end;

          Objects[i].Vencimento        := vpBoleto[i].vencimento;
          Objects[i].DataDocumento     := vpBoleto[i].dataDocumento;
          Objects[i].NumeroDocumento   := vpBoleto[i].numeroDocumento;
          Objects[i].EspecieDoc        := vpBoleto[i].especieDoc;
          Objects[i].Aceite            := atNao;
          Objects[i].DataProcessamento := vpBoleto[i].dataProcessamento;
          Objects[i].Carteira          := vpBoleto[i].carteira;
          Objects[i].NossoNumero       := vpBoleto[i].nossoNumero;
          Objects[i].ValorDocumento    := vpBoleto[i].valorDocumento;
          Objects[i].Sacado.NomeSacado := vpBoleto[i].nomeSacado;
          Objects[i].Sacado.CNPJCPF    := vpBoleto[i].CNPJCPF;

          if Length(vpBoleto[i].CNPJCPF) <= 11 then
            Objects[i].Sacado.Pessoa := pFisica
          else
            Objects[i].Sacado.Pessoa := pJuridica;

          Objects[i].Sacado.Cidade     := vpBoleto[i].cidade;
          Objects[i].Sacado.Logradouro := vpBoleto[i].logradouro;
          Objects[i].Sacado.Numero     := vpBoleto[i].numero;
          Objects[i].Sacado.Bairro     := vpBoleto[i].bairro;
          Objects[i].Sacado.UF         := vpBoleto[i].UF;
          Objects[i].Sacado.CEP        := vpBoleto[i].CEP;
          Objects[i].Sacado.Email      := vpBoleto[i].email;
          Objects[i].Sacado.Fone       := vpBoleto[i].fone;

          Objects[i].Parcela           := vpBoleto[i].parcela;
          Objects[i].TotalParcelas     := vpBoleto[i].totalParcelas;
          Objects[i].DataDesconto      := vpBoleto[i].dataDesconto;
          Objects[i].DataMoraJuros     := vpBoleto[i].dataMoraJuros;
          Objects[i].ValorDesconto     := vpBoleto[i].valorDesconto;
          Objects[i].ValorMoraJuros    := vpBoleto[i].valorMoraJuros;
          Objects[i].PercentualMulta   := vpBoleto[i].percentualMulta;
        end;
      end;

      // captura o contador de remessa e gera a mesma
      viContadorRemessa := dtmControles.GerarSequencia('BOLETO_REMESSA_'+IntToStr(vpBancoId));
      viAcbrBoleto.NomeArqRemessa := (vpBoleto[0].bancoId) + 'R_' + FormatFloat('00000',viContadorRemessa) + '.REM';
      viAcbrBoleto.GerarRemessa(viContadorRemessa);

      try
        Result.gerouRemessa := FileExists(IncludeTrailingPathDelimiter(viAcbrBoleto.DirArqRemessa) + viAcbrBoleto.NomeArqRemessa);
        Result.remessaId := viContadorRemessa;
      except
        Result.gerouRemessa := False;
        Result.msgRetorno :=
          'Local do Arquivo de Remessa não Encontrado!' + sLineBreak +
          'Verifique o Local da Pasta em CADASTRO/CEDENTE/CONTAS BANCÁRIAS';
        Exit;
      end;

    except
      on e: Exception do
      begin
        Result.gerouRemessa := False;
        Result.msgRetorno := e.Message;
        Exit;
      end;
    end;

  finally
    FreeAndNil(vpAcbrBoletoFC);
  end;
end;

end.
