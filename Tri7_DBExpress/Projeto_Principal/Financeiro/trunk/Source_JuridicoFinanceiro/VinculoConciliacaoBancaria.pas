unit VinculoConciliacaoBancaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroAuxSimplificado, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxCurrencyEdit, cxImageComboBox, cxCalendar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, cxCheckBox, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit;

type
  TfrmVinculoConciliacaoBancaria = class(TfrmCadastroAuxSimplificado)
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaDBTableView1Column4: TcxGridDBColumn;
    grdBasicaDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    gbcLivroCaixa: TcxGroupBox;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridBasicaDBDataPag: TcxGridDBColumn;
    cxGridBasicaDBPlanoConta: TcxGridDBColumn;
    cxGridPesquisaHistorico: TcxGridDBColumn;
    cxGridBasicaDBFavorecido: TcxGridDBColumn;
    cxGridPesquisaObservacao: TcxGridDBColumn;
    cxGridBasicaDBOperacao: TcxGridDBColumn;
    cxGridBasicaDBValor: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralHISTORICO: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralOPERACAO: TStringField;
    ClientAncestralVALOR: TFMTBCDField;
    ClientAncestralCALC_SELECIONADO: TBooleanField;
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientConciliacao: TClientDataSet;
    ClientConciliacaoDATA: TStringField;
    ClientConciliacaoDESCRICAO: TStringField;
    ClientConciliacaoVALOR: TCurrencyField;
    ClientConciliacaoOPERACAO: TStringField;
    ClientConciliacaoID: TStringField;
    dtsConciliacao: TDataSource;
    ClientAncestralCalc_ValorRegistrar: TCurrencyField;
    cxGridPesquisaValorRegistrar: TcxGridDBColumn;
    ClientConciliacaoCALC_SOMA: TCurrencyField;
    Panel3: TPanel;
    rdbOperacaoSomente: TcxRadioButton;
    rdbOperacaoQualquer: TcxRadioButton;
    ClientAncestralID: TFMTBCDField;
    ClientAncestralDATA: TSQLTimeStampField;
    icxPeriodo: TcxImageComboBox;
    icxManterValor: TcxImageComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure cxGridPesquisaColumn1PropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure rdbOperacaoSomenteClick(Sender: TObject);
    procedure rdbOperacaoQualquerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure icxPeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure icxManterValorPropertiesEditValueChanged(Sender: TObject);
  private
    vlPosicaoID : Integer;
    vlDataMostrarTela : Boolean;
    procedure CarregarItensConciliacao(vpSomenteCaixa : Boolean = False);
    procedure VerificarValorSelecionado;
  public
    { Public declarations }
  end;

var
  frmVinculoConciliacaoBancaria: TfrmVinculoConciliacaoBancaria;
  vgConciliacaoId : String;
  vgLivroCaixa : Boolean;

implementation

uses
  ConciliacaoBancaria, LookupFinanceiro, Lookup, Lookup_Contabil, Rotinas,
  Controles, ConciliacaoDataConciliacao;

{$R *.dfm}

procedure TfrmVinculoConciliacaoBancaria.btnCancelarClick(Sender: TObject);
begin
  frmConciliacaoBancaria.ClientArquivo.EnableControls;
  frmConciliacaoBancaria.ClientArquivo.Filtered := False;
  frmConciliacaoBancaria.ClientArquivo.RecNo := vlPosicaoID;

  vgConciliacaoId := '';
  inherited;
end;

procedure TfrmVinculoConciliacaoBancaria.btnConfirmarClick(Sender: TObject);
var
  viFlag : Boolean;
begin
  ClientAncestral.Filtered := True;
  ClientAncestral.Filter   := 'CALC_SELECIONADO = TRUE';
  ClientAncestral.Filtered := False;
  vgConciliacaoId := '';
  viFlag := False;
  vgConciliacaoDataAlterar  := dtmControles.BuscarConfig('FINANCEIRO','CONCILIACAO','DATA_CONCILIACAO_SINCRONIZAR','S') = 'S';
  vgConciliacaoValorAlterar := 0;
  if icxManterValor.ItemIndex > 0 then
    vgConciliacaoValorAlterar := ClientAncestralVALOR.AsCurrency;

  ClientAncestral.First;
  while not ClientAncestral.Eof do
  begin
    if ClientAncestralCALC_SELECIONADO.AsBoolean then
    begin
      if vgConciliacaoId = '' then
           vgConciliacaoId := ClientAncestralID.AsString
      else vgConciliacaoId := vgConciliacaoId  +','+ ClientAncestralID.AsString;

      if (not viFlag) and (vlDataMostrarTela) and (ClientAncestralDATA.AsString <> ClientConciliacaoDATA.AsString) then
      begin
        ExibirFormulario(TfrmConciliacaoData, frmConciliacaoData, true);
        if not vgConciliacaoDataFlag then
          abort;
        viFlag := True;
      end;
    end;
    ClientAncestral.Next;
  end;
  inherited;
end;

procedure TfrmVinculoConciliacaoBancaria.CarregarItensConciliacao(vpSomenteCaixa : Boolean = False);
var
  viSql : String;

  procedure CarregarDadosLivroCaixa;
  begin
    with frmConciliacaoBancaria do
    begin
      viSql := ' SELECT LIVRO_CAIXA_ID AS ID, DATA_PAGAMENTO AS DATA, HISTORICO, OBSERVACAO, '+
               ' PESSOA_ID, OPERACAO, VALOR, CONTABIL_CONTA_ID '+
               ' FROM J_LIVRO_CAIXA '+
               ' WHERE CONCILIACAO_REGISTRADO_ID IS NULL '+
               '    AND CAIXA_ID = :CAIXA_ID '+
               '    AND SITUACAO IS NULL '+
               '    AND DATA_PAGAMENTO >= :DATA ';
      if rdbOperacaoSomente.Checked then
      begin
        viSql := viSql +
               '    AND (OPERACAO = :OPERACAO1 OR '+
               '      OPERACAO = :OPERACAO2 OR '+
               '      OPERACAO = :OPERACAO3 OR '+
               '      OPERACAO = :OPERACAO4) ';
      end;

      ClientAncestral.Active := False;
      DataSetAncestral.CommandText := viSql;
      DataSetAncestral.ParamByName('CAIXA_ID').AsBCD     := sqlPesquisaConciliacaoCAIXA_ID.AsInteger;
      DataSetAncestral.ParamByName('DATA').AsDate        := StrToDate(dtmControles.GetStr(' SELECT CONCILIACAO_DATA_INICIO FROM J_CAIXA WHERE CAIXA_ID = '+sqlPesquisaConciliacaoCAIXA_ID.AsString));

      if rdbOperacaoSomente.Checked then
      begin
        DataSetAncestral.ParamByName('OPERACAO1').AsString := ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO2').AsString := 'T'+ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO3').AsString := 'A'+ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO4').AsString := 'R'+ClientArquivoOPERACAO.AsString;
      end;
      ClientAncestral.Active := True;
    end;
  end;

  procedure CarregarItemConciliar;
  begin
    with frmConciliacaoBancaria do
    begin
      ClientArquivo.Filtered := False;
      ClientArquivo.Filter   := 'CALC_SELECIONADO = TRUE';
      ClientArquivo.Filtered := True;

      if ClientArquivo.IsEmpty then
      begin
        ClientArquivo.Filtered := False;
        ClientArquivo.RecNo    := vlPosicaoID;
      end
      else ClientArquivo.First;

      ClientConciliacao.EmptyDataSet;
      while not ClientArquivo.Eof do
      begin
        ClientConciliacao.Append;
        ClientConciliacaoDATA.AsString      := ClientArquivoDATA.AsString;
        ClientConciliacaoDESCRICAO.AsString := ClientArquivoDESCRICAO.AsString;
        ClientConciliacaoVALOR.AsCurrency   := ClientArquivoVALOR.AsCurrency;
        if ClientArquivoOPERACAO.AsString = 'R' then
             ClientConciliacaoCALC_SOMA.AsCurrency := ClientArquivoVALOR.AsCurrency
        else ClientConciliacaoCALC_SOMA.AsCurrency := ClientArquivoVALOR.AsCurrency * -1;

        ClientConciliacaoOPERACAO.AsString  := ClientArquivoOPERACAO.AsString;
        ClientConciliacaoID.AsString        := ClientArquivoID.AsString;
        ClientConciliacao.Post;

        if not ClientArquivo.Filtered then
          Break;

        ClientArquivo.Next;
      end;
    end;
  end;

  procedure CarregarDadosAgendados;
  var
   viDataIni, viDataFin, viReferencia, viCondicao, vlCondicaoData : String;
  begin
    with frmConciliacaoBancaria do
    begin
      viSql := ' SELECT LIVRO_FINANCEIRO_ID AS ID, DATA_VENCIMENTO AS DATA, HISTORICO, OBSERVACAO, '+
               ' PESSOA_ID, OPERACAO, VALOR_AGENDADO AS VALOR, CONTABIL_CONTA_ID '+
               ' FROM J_LIVRO_FINANCEIRO LF '+
               ' WHERE SITUACAO = '+QuotedStr('1')+
               '   AND TIPO_CARGA_ID IS NULL ';

      if rdbOperacaoSomente.Checked then
      begin
        viSql := viSql +
               '    AND (OPERACAO = :OPERACAO1 OR '+
               '      OPERACAO = :OPERACAO2 OR '+
               '      OPERACAO = :OPERACAO3 OR '+
               '      OPERACAO = :OPERACAO4) ';
      end;

      viCondicao := '<=';
      vlCondicaoData := '';
      if icxPeriodo.Enabled then
      begin
        case icxPeriodo.ItemIndex of
          0 : begin
                viDataIni := vgDataAtualTipo4;
                viDataFin := vgDataAtualTipo4;
                vlCondicaoData := ' AND (LF.DATA_VENCIMENTO <= ' +QuotedStr(TrocaBarraPPonto(viDataFin))+')';
              end;
          1 : begin
                MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFin, '/');
                viReferencia := QuotedStr(PegarAnoMes(viDataFin));
                vlCondicaoData := ' AND (LF.ANO_MES_REFERENCIA '+viCondicao+viReferencia+')';
              end;
          2 : begin
                viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate+30)));
                viCondicao   := '=';
                vlCondicaoData := ' AND (LF.ANO_MES_REFERENCIA '+viCondicao+viReferencia+')';
              end;
        end;
        viSql := viSql + vlCondicaoData;
      end;

      ClientAncestral.Active := False;
      DataSetAncestral.CommandText := viSql;

      if rdbOperacaoSomente.Checked then
      begin
        DataSetAncestral.ParamByName('OPERACAO1').AsString := ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO2').AsString := 'T'+ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO3').AsString := 'A'+ClientArquivoOPERACAO.AsString;
        DataSetAncestral.ParamByName('OPERACAO4').AsString := 'R'+ClientArquivoOPERACAO.AsString;
      end;
      ClientAncestral.Active := True;
    end;
  end;

begin
  with frmConciliacaoBancaria do
  begin
    if not vpSomenteCaixa then
    begin
      ClientArquivo.DisableControls;
      vlPosicaoID := ClientArquivo.RecNo;
      CarregarItemConciliar;

      gbcLivroCaixa.Caption := 'Registros no Livro Caixa da Conta '+dtmControles.GetStr('SELECT DESCRICAO FROM J_CAIXA WHERE CAIXA_ID = '+
                      sqlPesquisaConciliacaoCAIXA_ID.AsString) + ' ainda n�o conciliado(s).';
    end;

    if vgLivroCaixa then
         CarregarDadosLivroCaixa
    else CarregarDadosAgendados;

    dtmLookup.MarcarDesmarcarItensClietDataSet('N', ClientAncestral);
  end;
end;

procedure TfrmVinculoConciliacaoBancaria.ClientAncestralCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if ClientAncestralCALC_SELECIONADO.AsBoolean then
  begin
    if Pos('R', ClientAncestralOPERACAO.AsString) > 0 then
         ClientAncestralCalc_ValorRegistrar.AsCurrency :=  ClientAncestralVALOR.AsCurrency
    else ClientAncestralCalc_ValorRegistrar.AsCurrency :=  ClientAncestralVALOR.AsCurrency * -1;
  end
  else ClientAncestralCalc_ValorRegistrar.AsCurrency :=  0;
end;

procedure TfrmVinculoConciliacaoBancaria.cxGridPesquisaColumn1PropertiesChange(
  Sender: TObject);
begin
  inherited;
  ClientAncestral.Post;
  if icxManterValor.ItemIndex = 1 then
       btnConfirmar.Enabled := (Arredondamento(dtmControles.MetodoArredondamento, cxGridPesquisa.DataController.Summary.FooterSummaryValues[0],2)) <> 0
  else VerificarValorSelecionado;
end;

procedure TfrmVinculoConciliacaoBancaria.FormActivate(Sender: TObject);
begin
  inherited;
  CarregarItensConciliacao;
  btnConfirmar.Enabled := False;
end;

procedure TfrmVinculoConciliacaoBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action      := caFree;
  frmVinculoConciliacaoBancaria := nil;
  inherited;
end;

procedure TfrmVinculoConciliacaoBancaria.FormCreate(Sender: TObject);
begin
  inherited;
  icxPeriodo.Enabled   := not vgLivroCaixa;
  vlDataMostrarTela    := dtmControles.BuscarConfig('FINANCEIRO','CONCILIACAO','MOSTRAR_TELA_DATA_SINCRONIZAR','S') = 'S';
end;

procedure TfrmVinculoConciliacaoBancaria.icxManterValorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if icxManterValor.ItemIndex = 1 then
       btnConfirmar.Enabled := (Arredondamento(dtmControles.MetodoArredondamento, cxGridPesquisa.DataController.Summary.FooterSummaryValues[0],2)) <> 0
  else VerificarValorSelecionado;
end;

procedure TfrmVinculoConciliacaoBancaria.icxPeriodoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CarregarItensConciliacao;

end;

procedure TfrmVinculoConciliacaoBancaria.rdbOperacaoQualquerClick(
  Sender: TObject);
begin
  inherited;
  CarregarItensConciliacao(True);
end;

procedure TfrmVinculoConciliacaoBancaria.rdbOperacaoSomenteClick(
  Sender: TObject);
begin
  inherited;
  CarregarItensConciliacao(True);
end;

procedure TfrmVinculoConciliacaoBancaria.VerificarValorSelecionado;
var
  viValorBanco, viValorSistema : Currency;
begin
  viValorBanco   := (Arredondamento(dtmControles.MetodoArredondamento, grdBasicaDBTableView1.DataController.Summary.FooterSummaryValues[0],2));
  viValorSistema := (Arredondamento(dtmControles.MetodoArredondamento, cxGridPesquisa.DataController.Summary.FooterSummaryValues[0],2));
  btnConfirmar.Enabled := viValorBanco = viValorSistema;
  if not btnConfirmar.Enabled then
    btnConfirmar.Enabled := viValorBanco = viValorSistema+0.01;
end;

end.
