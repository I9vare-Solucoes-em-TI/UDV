unit LookupBoleto;

interface

uses
  I9Query,
  System.SysUtils, System.Classes, ACBrBoleto, ACBrBase,
  frxClass, frxExportPDF, Vcl.Forms, Winapi.Windows, DbxDevartInterBase,
  Data.DB, Datasnap.DBClient, SimpleDS, frxExportAPDF, frxExportBaseDialog, ACBrBoletoConversao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TRetornoImprimiuBoleto = record
    boletoId: Integer;
    ImprimiuBoleto: Boolean;
    LivroFinanceiro: string;
  end;

  TBoletoDados = record
    BancoDigito, BancoNumero : Integer;
    BancoNome : string;
    CedenteNome, CedenteCPF, CedenteCodigo, CedenteAgenciaNumero, CedenteAgenciaDigito,
    CedenteContaNumero, CedenteContaDigito, CedenteModalidade, CedenteUF, CedenteBairro,
    CedenteCidade, CedenteCEP, CedenteLog, CedenteEmail, CedenteTelefone, EnderecoAssociado  : String;
    ContaVencimento, ContaDataOperacao : TDateTime;
    ContaNumeroDoc, ContaNossoNumero, ContaCarteira, ContaConvenio : string;
    ContaValorDoc, ContaValorBoleto  : Currency;
    FaturaTipo, PixTexto : String;

    ValorMulta, ValorTaxa, ValorMedioBoleto  : Currency;
    CobrarBoleto, CobrarMulta, CalcularMediaBoleto, LayoutModelo : string;
    CobrarCompromissoMultaId, CobrarCompromissoTaxaId, CompromissoJurosId, ReservaJurosId : integer;

    SacadoNome, SacadoCNPJCPF, SacadoLogradouro, SacadoNumero,
    SacadoBairro, SacadoCEP, SacadoUF, SacadoCidade : string;

    RegistroTipo : integer;
    RegistroResumo, DiretorioPadrao, DiretorioRemessa, DiretorioRetorno,
    DiretorioRecibo, EnvioEmail, CaminhoArquivo : String;

    // Tesouraria
    ExclusivoSys2FamiliaImprimir : Boolean;
    ExclusivoSys2GrupoNome, ExclusivoSys2PrazoPagamento : String;
  end;

  TdtmLookupBoleto = class(TDataModule)
    ACBrBoleto1: TACBrBoleto;
    sqlRemessa: TI9Query;
    dtsRemessa: TDataSource;
    sqlRemessaVALOR: TBCDField;
    sqlRemessaBOLETA_ID: TBCDField;
    sqlRemessaPESSOA_ID: TBCDField;
    sqlRemessaDATA_VENCIMENTO: TSQLTimeStampField;
    sqlRemessaDATA_EMISSAO: TSQLTimeStampField;
    sqlRemessaREMESSA_SITUACAO: TStringField;
    sqlRemessaPESSOA_GRUPO_ID: TBCDField;
    frxPDFExport1: TfrxPDFExport;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    viValoresMontados : array[0..1000,1..4] of string;
  public
    function CriarTitulo : TRetornoImprimiuBoleto;
    procedure ParametrosRelatorio;
    Function VerificarGerarRemessa(vpMsg : Boolean = False):Boolean;
    procedure ConfiguraComponenteAcBr;
  end;

var
  dtmLookupBoleto: TdtmLookupBoleto;
  vgBoletoDados : tBoletoDados;
  vgTitulo : TACBrTitulo;
//  frxPDFExport1 : TfrxAPDFExport;

implementation

uses
  VisualizaRelatorios, Rotinas, GerenciadorRecebimento, Controles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


{ TdtmLookupBoleto }

procedure TdtmLookupBoleto.ConfiguraComponenteAcBr;
begin
//  ACBrBoleto1.ACBrBoletoFC.DirLogo  := '';
//  ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
//  ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
  ACBrBoleto1.Banco.Digito          := vgBoletoDados.BancoDigito;
  ACBrBoleto1.Banco.Numero          := vgBoletoDados.BancoNumero;
  ACBrBoleto1.Banco.Nome            := vgBoletoDados.BancoNome;

  // Dados do Cedente
  ACBrBoleto1.Cedente.Nome          := vgBoletoDados.CedenteNome;
  ACBrBoleto1.Cedente.CNPJCPF       := vgBoletoDados.CedenteCPF;
  ACBrBoleto1.Cedente.CodigoCedente := vgBoletoDados.CedenteCodigo;
  ACBrBoleto1.Cedente.Agencia       := vgBoletoDados.CedenteAgenciaNumero;
  ACBrBoleto1.Cedente.AgenciaDigito := vgBoletoDados.CedenteAgenciaDigito;
  ACBrBoleto1.Cedente.Conta         := vgBoletoDados.CedenteContaNumero;
  ACBrBoleto1.Cedente.ContaDigito   := vgBoletoDados.CedenteContaDigito;
  ACBrBoleto1.Cedente.Modalidade    := vgBoletoDados.CedenteModalidade;
  ACBrBoleto1.Cedente.Convenio      := vgBoletoDados.ContaConvenio;

  ACBrBoleto1.Cedente.UF            := vgBoletoDados.CedenteUF;
  ACBrBoleto1.Cedente.Logradouro    := vgBoletoDados.CedenteLog;
  ACBrBoleto1.Cedente.Complemento   := '';
  ACBrBoleto1.Cedente.Bairro        := vgBoletoDados.CedenteBairro;
  ACBrBoleto1.Cedente.Cidade        := vgBoletoDados.CedenteCidade;
  ACBrBoleto1.Cedente.CEP           := vgBoletoDados.CedenteCEP;
  ACBrBoleto1.Cedente.Telefone      := vgBoletoDados.CedenteTelefone;

  ACBrBoleto1.Cedente.ResponEmissao := tbCliEmite;
  ACBrBoleto1.Cedente.CaracTitulo   := tcSimples;
  ACBrBoleto1.Cedente.TipoCarteira  := tctRegistrada;
  ACBrBoleto1.Cedente.TipoInscricao := pJuridica;

  ACBrBoleto1.Cedente.CodigoTransmissao := '';
  ACBrBoleto1.Cedente.NumeroRes         := '';
end;

function TdtmLookupBoleto.CriarTitulo:TRetornoImprimiuBoleto;
var
  viBoletoId: Integer;
  viDiretorioPadrao: string;
  viPathArquivoPDF: string;

  procedure MontarCodigoBarras;
  var
    i : Integer;
  begin
    for i := 1 to 4 do
      viValoresMontados[0,i] := '';

    with ACBrBoleto1 do
    begin
      viValoresMontados[0,1] := Banco.MontarCampoNossoNumero( ListadeBoletos[0] );
      viValoresMontados[0,2] := Banco.MontarCampoCodigoCedente( ListadeBoletos[0] );
      viValoresMontados[0,3] := Banco.MontarCodigoBarras( ListadeBoletos[0] );
      viValoresMontados[0,4] := Banco.MontarLinhaDigitavel(viValoresMontados[0,3],ListadeBoletos[0]);
    end;
  end;

begin
  Result.ImprimiuBoleto := False;
  vgTitulo := ACBrBoleto1.CriarTituloNaLista;
  with vgTitulo do
  begin
    Vencimento         := vgBoletoDados.ContaVencimento;
    DataDocumento      := vgBoletoDados.ContaDataOperacao;
    NumeroDocumento    := 'Nº Doc: ' + vgBoletoDados.ContaNumeroDoc;
    EspecieDoc         := 'DM';
    Aceite             := atNao;
    DataProcessamento  := Now;
    Carteira           := vgBoletoDados.ContaCarteira;
    ValorDocumento     := vgBoletoDados.ContaValorBoleto;

    Sacado.NomeSacado  := vgBoletoDados.SacadoNome;
    Sacado.CNPJCPF     := vgBoletoDados.SacadoCNPJCPF;
    Sacado.Logradouro  := vgBoletoDados.SacadoLogradouro;
    Sacado.Numero      := vgBoletoDados.SacadoNumero;
    Sacado.Bairro      := vgBoletoDados.SacadoBairro;
    Sacado.CEP         := vgBoletoDados.SacadoCEP;
    Sacado.UF          := vgBoletoDados.SacadoUF;
    Sacado.Cidade      := vgBoletoDados.SacadoCidade;

    ValorAbatimento    := 0;
    LocalPagamento     := 'PAGÁVEL EM QUALQUER BANCO ATÉ O VENCIMENTO';
    ValorMoraJuros     := 0;
    ValorDesconto      := 0;
    DataMoraJuros      := 0;
    DataMoraJuros      := 0;

    DataDesconto       := 0;
    DataAbatimento     := 0;
//    DataProtesto       := '';
    PercentualMulta    := 0;
    Mensagem.Text      := '';

    case vgBoletoDados.RegistroTipo of
      1 : OcorrenciaOriginal.Tipo := toRemessaRegistrar;
      2 : OcorrenciaOriginal.Tipo := toRemessaBaixar;
    end;

    Instrucao1         := '';
    Instrucao2         := '';
    Parcela            := 1;

    case vgBoletoDados.BancoNumero of
      1   : ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
      104 : ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
      237 : ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
      341 : ACBrBoleto1.Banco.TipoCobranca := cobItau;
      399 : ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
      748 : ACBrBoleto1.Banco.TipoCobranca := cobSicred;
      756 : ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
    end;
    NossoNumero        := vgBoletoDados.ContaNossoNumero;
  end;
  ConfiguraComponenteAcBr;
  MontarCodigoBarras;
end;

procedure TdtmLookupBoleto.DataModuleCreate(Sender: TObject);
begin
  sqlRemessa.Connection := dtmControles.DB;
  sqlRemessa.Open;

{  frxPDFExport1 := TfrxAPDFExport.Create(nil);
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.Compressed := True;   }
//  dtmLookupBoleto.frxPDFExport1.PDFA := True;
//  frxPDFExport1.EmbeddedFonts := False;
//  frxPDFExport1.OpenAfterExport := False;   }
end;

procedure TdtmLookupBoleto.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(frxPDFExport1);
end;

procedure TdtmLookupBoleto.ParametrosRelatorio;
begin
  with ACBrBoleto1 do
  begin
    CriarFuncoesRelatorio(frmGerenciadorRecebimento.frxReport1);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['NomeBanco']             := QuotedStr(Banco.Nome);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['CodigoBanco']           := QuotedStr(IntToStr(Banco.Numero)+'-'+IntToStr(Banco.Digito));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['LocalPagamento']        := QuotedStr(vgTitulo.LocalPagamento);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['DataVencimento']        := QuotedStr(DateToStr(vgTitulo.Vencimento));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['AnoMesFatura']          := QuotedStr(PegarAnoMes(DateToStr(vgTitulo.Vencimento), False, True));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['NomeCedente']           := QuotedStr(Cedente.Nome);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['AgenciaCodigoCedente']  := QuotedStr(viValoresMontados[0,2]);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['DataDocumento']         := QuotedStr(DateToStr(vgTitulo.DataDocumento));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['NumeroDocumento']       := QuotedStr(vgTitulo.NumeroDocumento);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['EspecieDocumento']      := QuotedStr(vgTitulo.EspecieDoc);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['Aceite']                := QuotedStr('N');
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['DataProcessamento']     := QuotedStr(DateToStr(vgTitulo.DataProcessamento));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['NossoNumero']           := QuotedStr(viValoresMontados[0,1]);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['Carteira']              := QuotedStr(vgTitulo.Carteira);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['EspecieMoeda']          := QuotedStr('REAL');
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['ValorDocumento']        := QuotedStr(FormatFloat(',#0.00', vgTitulo.ValorDocumento));
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['FaturaTipo']            := QuotedStr(vgBoletoDados.FaturaTipo);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['PixTexto']              := QuotedStr(vgBoletoDados.PixTexto);

    if vgBoletoDados.CobrarBoleto = 'S' then
    begin
      if vgBoletoDados.CalcularMediaBoleto = 'S' then
           frmGerenciadorRecebimento.frxReport1.Variables.Variables['ValorTaxaBoleto'] := QuotedStr(FormatFloat(',#0.00',vgBoletoDados.ValorMedioBoleto))
      else frmGerenciadorRecebimento.frxReport1.Variables.Variables['ValorTaxaBoleto'] := QuotedStr(FormatFloat(',#0.00',vgBoletoDados.ValorTaxa));
    end
    else frmGerenciadorRecebimento.frxReport1.Variables.Variables['ValorTaxaBoleto'] := QuotedStr(CurrToStr(0));

    if vgTitulo.Sacado.CNPJCPF <> '' then
      if length(vgTitulo.Sacado.CNPJCPF) <= 11 then
           frmGerenciadorRecebimento.frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(' - '+ FormataCPF(vgTitulo.Sacado.CNPJCPF))
      else frmGerenciadorRecebimento.frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(' - '+ FormataCNPJ(vgTitulo.Sacado.CNPJCPF));

    frmGerenciadorRecebimento.frxReport1.Variables.Variables['SacadoNome']            := QuotedStr(vgTitulo.Sacado.NomeSacado);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['LinhaDigitavel']        := QuotedStr(viValoresMontados[0,4]);
    frmGerenciadorRecebimento.frxReport1.Variables.Variables['CodigoBarra']           := QuotedStr(viValoresMontados[0,3]);

    frmGerenciadorRecebimento.frxReport1.Variables.Variables['Resumo'] := QuotedStr(vgBoletoDados.RegistroResumo);

    if vgBoletoDados.ExclusivoSys2FamiliaImprimir then
    begin
      frmGerenciadorRecebimento.frxReport1.Variables.Variables['FAMILIAR']   := QuotedStr('S');
      frmGerenciadorRecebimento.frxReport1.Variables.Variables['SacadoGrupo'] := QuotedStr('Grupo Associado '+ vgBoletoDados.ExclusivoSys2GrupoNome);
    end
    else frmGerenciadorRecebimento.frxReport1.Variables.Variables['FAMILIAR']  := QuotedStr('N');

    frmGerenciadorRecebimento.frxReport1.Variables.Variables['PrazoPagamento'] := QuotedStr(vgBoletoDados.ExclusivoSys2PrazoPagamento);
  end;
end;

function TdtmLookupBoleto.VerificarGerarRemessa(vpMsg : Boolean = False):Boolean;
var
  viQtdRemessa : Integer;
begin
  viQtdRemessa := dtmControles.GetInt(' SELECT COUNT(BOLETA_ID) FROM T_BOLETA '+
                                      ' WHERE (((NOT REMESSA_SITUACAO IS NULl) AND (SITUACAO = ''1'')) OR '+
                                      '       ((NOT REMESSA_SITUACAO IS NULl) AND (SITUACAO = ''3'') AND (NOT REMESSA_ID IS NULL))) '+
                                      '   AND FATURA_TIPO = ''B''');
  if (viQtdRemessa = 0) and vpMsg then
    Application.MessageBox('Nenhum boleto pra gerar remessa!!!','Informação', MB_ICONINFORMATION + MB_OK);

  Result := viQtdRemessa > 0;
end;

end.
