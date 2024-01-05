unit GerenciadorSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, cxControls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCurrencyEdit, cxTextEdit, Menus, cxLookAndFeelPainters,
  cxGroupBox, cxDropDownEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ExtCtrls, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, cxRadioGroup,
  DBClient, cxImageComboBox, cxCalendar, SimpleDS, cxCheckBox, frxClass,
  frxDBSet, cxDBEdit, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, ComCtrls, dxCore, cxDateUtils, cxSplitter, dxBarBuiltInMenu,
  Data.DBXInterBase, DbxDevartInterBase;

type
  TDadosRecibo = Record
    Recibo, Cedente, CNPJ, Pessoa, CPF, RG : String;
    Data : TDateTime;
  End;

  TfrmGerenciadorSaidas = class(TForm)
    pgcSaidas: TcxPageControl;
    tabGerenciador: TcxTabSheet;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    tabBalancete: TcxTabControl;
    Panel5: TPanel;
    ClientDataSetCONTABIL_CONTA_ID: TIntegerField;
    ClientDataSetREFERENCIA: TStringField;
    ClientDataSetDOCUMENTO: TStringField;
    ClientDataSetOBSERVACAO: TStringField;
    ClientDataSetBALANCETE_GRUPO_ID: TIntegerField;
    ClientDataSetCENTRO_CUSTO_ID: TIntegerField;
    ClientDataSetVALOR: TCurrencyField;
    sqlCompromissoRealizado: TSimpleDataSet;
    sqlCompromissoRealizadocalc_referencia: TStringField;
    dtsCompromissoRealizado: TDataSource;
    sqlCompromissoRealizadoSITUACAO: TStringField;
    sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID: TFMTBCDField;
    sqlCompromissoRealizadoPESSOA_ID: TFMTBCDField;
    sqlCompromissoRealizadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoRealizadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoRealizadoBOLETA_ID: TFMTBCDField;
    sqlCompromissoRealizadoDIFERENCA: TStringField;
    sqlCompromissoRealizadoVALOR_ORIGEM: TFMTBCDField;
    sqlCompromissoRealizadoQTD_ADICIONAL: TFMTBCDField;
    sqlCompromissoRealizadoATUALIZADO: TStringField;
    sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoRealizadoPESSOA_NOME: TStringField;
    sqlCompromissoRealizadoSAIDA_NUMERO: TFMTBCDField;
    sqlCompromissoRealizadoSAIDA_TIPO: TStringField;
    sqlCompromissoRealizadocalc_Descricao: TStringField;
    sqlCompromissoRealizadoDESCRICAO: TStringField;
    sqlCompromissoRealizadoCENTRO_CUSTO_ID: TFMTBCDField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    sqlCompromissoRealizadoPESSOA_CPF: TStringField;
    sqlCompromissoRealizadoPESSOA_RG: TStringField;
    sqlCompromissoRealizadoSAIDA_DOCUMENTO: TStringField;
    sqlCompromissoRealizadoDETALHADO: TStringField;
    sqlCompromissoRealizadoCOMPROMISSO_DETALHADO_ID: TFMTBCDField;
    ClientDataSetDETALHADO: TStringField;
    ClientDataSetCHAVE_DETALHAMENTO: TIntegerField;
    ClientDetalhe: TClientDataSet;
    dtsDetalhe: TDataSource;
    ClientDetalheCONTABIL_CONTA_ID: TIntegerField;
    ClientDetalheREFERENCIA: TStringField;
    ClientDetalheDOCUMENTO: TStringField;
    ClientDetalheOBSERVACAO: TStringField;
    ClientDetalheBALANCETE_GRUPO_ID: TIntegerField;
    ClientDetalheDETALHADO: TStringField;
    ClientDetalheCHAVE_DETALHAMENTO: TIntegerField;
    ClientDetalheVALOR: TFloatField;
    ClientDetalheCENTRO_CUSTO_ID: TIntegerField;
    ClientDataSetDESCRICAO: TStringField;
    ClientDetalheDESCRICAO: TStringField;
    ClientDetalheCALC_VINCULO: TBooleanField;
    sqlCompromissoRealizadoCALC_VINCULO: TStringField;
    sqlCompromissoRealizadoOBSERVACAO: TStringField;
    lblInformacaoLancamento: TcxLabel;
    sqlCompromissoRealizadoSelecionar: TBooleanField;
    pnlCampos: TPanel;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel2: TcxLabel;
    lblDocumento: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel10: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    lcxCentroCusto: TcxLookupComboBox;
    cbxReferencia: TcxComboBox;
    edtDocumento: TcxTextEdit;
    edtValor: TcxCurrencyEdit;
    edtDescricao: TcxTextEdit;
    edtObservacao: TcxTextEdit;
    pnlBotoes: TPanel;
    pgcCompromissos: TcxPageControl;
    tabCompromissos: TcxTabSheet;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableCompromissos: TcxGridDBTableView;
    cxGridDBTableCompromissosDetalhado: TcxGridDBColumn;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn2: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn3: TcxGridDBColumn;
    cxGridDBTableDescricao: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn4: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn1: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    tabDetalhamento: TcxTabSheet;
    pgcDetalhar: TcxPageControl;
    tabDetalharAgrupado: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableDetalhar: TcxGridDBTableView;
    cxGridDBTableSelecionar: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    pnlAdicionar: TPanel;
    btnItemIncluir: TcxButton;
    btnExcluir: TcxButton;
    pnlGravar: TPanel;
    btnAdicionarCompromisso: TcxButton;
    btnCancelar: TcxButton;
    btnLimparCompromisso: TcxButton;
    cxGridDBTableDetalharValorDetalhar: TcxGridDBColumn;
    ClientDataSetVALOR_TOTAL: TAggregateField;
    sqlCompromissoRealizadoVALOR_TOTAL: TAggregateField;
    sqlCompromissoRealizadocalc_ValorPagar: TCurrencyField;
    pnlDetalhamento: TPanel;
    pnlValorDetalhado: TPanel;
    pnlValoraDetalhar: TPanel;
    sqlCompromissoRealizadoDATA_LANCAMENTO: TSQLTimeStampField;
    sqlCompromissoRealizadoCONTABILIZAR: TStringField;
    sqlCompromissoRealizadoTIPO_REGISTRO: TStringField;
    sqlCompromissoRealizadoCOMPROMISSO_CONTABILIZAR_ID: TFMTBCDField;
    sqlCompromissoRealizadocalc_Observacao: TStringField;
    sqlCompromissoRealizadoVALOR_CONTABILIZAR: TCurrencyField;
    sqlCompromissoRealizadoVALOR_PAGO: TFMTBCDField;
    ClientDataSetCOMPROMISSO_DETALHADO_ID: TIntegerField;
    popExportacao: TPopupMenu;
    ExportalExcel1: TMenuItem;
    btnRegistrar: TcxButton;
    btnCancelarDetalhamento: TcxButton;
    cxBtnFechar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnAdicionarCompromissoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure ClientDataSetAfterScroll(DataSet: TDataSet);
    procedure btnRegistrarClick(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure sqlCompromissoRealizadoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure pgcCompromissosChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ClientDetalheCalcFields(DataSet: TDataSet);
    procedure acmniDetalharItemClick(Sender: TObject);
    procedure ClientDetalheAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableSelecionarPropertiesChange(Sender: TObject);
    procedure btnItemIncluirClick(Sender: TObject);
    procedure sqlCompromissoRealizadoAfterPost(DataSet: TDataSet);
    procedure cxGridDBTableDetalharCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableSelecionarCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnCancelarDetalhamentoClick(Sender: TObject);
  private

    vgReciboSaida, vlDetalhamentoId, vgDetalhandoCompromissoId : Integer;
    vgDadosRecibo : TDadosRecibo;
    vlCriandoForm, vlDetalhamentoIniciado, vlGravandoValor : Boolean;
    vlValorADetalhar, vlValorDetalhadoTotal: Currency;
    procedure ImprimirRecibo(vpRecibo : Integer; vpTipo : String);
    procedure ParametrosRelatorioRecibo;
    function SomarCompromissosDetalhados(vpOpcao : Integer; vpSomar : Boolean = False):Boolean;
    function SomarCompromissosNaoContabilizados(vpSomar : Boolean):Currency;
    procedure HabilitarRegistroDetalhamento(vpHabilitar : Boolean);
    procedure HabilitarModeloEntrada(vpHabilitado : Boolean; vpCor1, vpCor2, vpCor3 : TColor) ;
    procedure HabilitarOpcoesRegistro(vpHabilitado : Boolean);
    procedure HabilitarCampos(vpHabilitado : Boolean);
    procedure HabilitarOpcaoDetalhar(vpOpcao : Integer; vpCor1, vpCor2, vpCor3 : TColor);
    procedure HabilitarDetalhamento(vpHabilitar : Boolean);
    procedure VerificarValorADetalhar;
  public
    { Public declarations }
  end;

var
  frmGerenciadorSaidas: TfrmGerenciadorSaidas;

implementation

uses Controles, Lookup, Rotinas, ConfirmacaoRecibo, ValidarPermissaoUsuario,
  VisualizaRelatorios, Lookup_Contabil;

{$R *.dfm}

procedure TfrmGerenciadorSaidas.acmniDetalharItemClick(Sender: TObject);
begin
  pgcSaidas.ActivePageIndex := 0;
  btnCancelarClick(self);
  tabBalancete.TabIndex    := 0;

  lcxCompromisso.EditValue := sqlCompromissoRealizadoCONTABIL_CONTA_ID.AsInteger;
  cbxReferencia.EditValue  := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString);
  edtValor.EditValue       := sqlCompromissoRealizadoVALOR_ATUAL.AsCurrency;
  edtDocumento.EditValue   := sqlCompromissoRealizadoSAIDA_DOCUMENTO.AsString;
  edtObservacao.EditValue  := sqlCompromissoRealizadoOBSERVACAO.AsString;
  edtDescricao.EditValue   := sqlCompromissoRealizadoDESCRICAO.AsString;
  lcxCentroCusto.EditValue := sqlCompromissoRealizadoCENTRO_CUSTO_ID.AsString;
  vgDetalhandoCompromissoId   := sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID.AsInteger;
  btnAdicionarCompromissoClick(self);
  HabilitarRegistroDetalhamento(False);
end;

procedure TfrmGerenciadorSaidas.btnAdicionarCompromissoClick(Sender: TObject);

  procedure AdicionarRegistro(vpClient : TClientDataSet; vpDetalhar : Boolean);
  begin
    vpClient.Append;
    vpClient.FieldByName('CONTABIL_CONTA_ID').AsInteger := lcxCompromisso.EditValue;
    vpClient.FieldByName('REFERENCIA').AsString         := cbxReferencia.EditValue;
    vpClient.FieldByName('VALOR').AsCurrency            := edtValor.EditValue;

    if edtDocumento.EditValue = null then
         vpClient.FieldByName('DOCUMENTO').AsVariant    := ''
    else vpClient.FieldByName('DOCUMENTO').AsVariant    := edtDocumento.EditValue;

    if edtObservacao.EditValue = null then
         vpClient.FieldByName('OBSERVACAO').AsString    := ''
    else vpClient.FieldByName('OBSERVACAO').AsString    := edtObservacao.EditValue;

    vpClient.FieldByName('DESCRICAO').AsString          := edtDescricao.EditValue;
    vpClient.FieldByName('BALANCETE_GRUPO_ID').AsVariant:= vgTabBalancete[tabBalancete.TabIndex];
    vpClient.FieldByName('CENTRO_CUSTO_ID').AsVariant   := lcxCentroCusto.EditValue;
    vpClient.FieldByName('DETALHADO').AsVariant         := 'N';

    if not vpDetalhar then
    begin
      vpClient.Post;
      Exit;
    end;

    if vpClient.RecordCount = 0 then
    begin
      vlDetalhamentoId := dtmControles.GerarSequencia('TI_COMPROMISSO_DETALHADO');
      vpClient.FieldByName('CHAVE_DETALHAMENTO').AsInteger := vlDetalhamentoId;

      vpClient.FieldByName('COMPROMISSO_DETALHADO_ID').AsInteger := sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID.AsInteger;
      vpClient.Post;

      ClientDataSet.Edit;
      ClientDataSetDETALHADO.AsString := 'S';
      ClientDataSetCHAVE_DETALHAMENTO.AsInteger := vlDetalhamentoId;
      ClientDataSet.Post;
    end
    else
    begin
      vpClient.FieldByName('CHAVE_DETALHAMENTO').AsInteger := ClientDataSetCHAVE_DETALHAMENTO.AsInteger;
      vpClient.post;
    end;

    SomarCompromissosDetalhados(2);
  end;

  procedure Validar;
  begin
    VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso de Despesa/Saída',lcxCompromisso);
    VerificarPreenchimentoLCX_TX(lcxCentroCusto.Text, 'Centro de Custo',lcxCentroCusto);

    VerificarPreenchimentoEDT_TX(edtDocumento.Text, 'Documento',edtDocumento);

    if (edtValor.Text = '') or (edtValor.EditValue <= 0) then
    begin
      Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtValor.SetFocus;
      abort;
    end;
    VerificarPreenchimentoEDT_TX(edtDescricao.Text, 'Descrição',edtDescricao);

  end;

begin
  Validar;

  if pgcCompromissos.ActivePageIndex = 0 then
       AdicionarRegistro(ClientDataSet, False)
  else AdicionarRegistro(ClientDetalhe, True);

  HabilitarOpcoesRegistro(False);

  btnLimparCompromissoClick(Self);
  HabilitarCampos(False);
  HabilitarDetalhamento(pgcCompromissos.ActivePageIndex = 0);
  if btnItemIncluir.Enabled then
    btnItemIncluir.SetFocus;

end;

procedure TfrmGerenciadorSaidas.btnCancelarClick(Sender: TObject);
begin
  btnLimparCompromissoClick(self);

  if pnlCampos.Visible then
  begin
    HabilitarCampos(False);
    Exit;
  end;

  if vgDetalhandoCompromissoId > 0 then
  begin
    vlValorDetalhadoTotal := 0;
    HabilitarRegistroDetalhamento(True);
    pgcSaidas.ActivePageIndex := 1;
  end;

  HabilitarOpcoesRegistro(True);
  btnLimparCompromissoClick(self);
  pgcCompromissos.ActivePageIndex := 0;
  vgDetalhandoCompromissoId       := 0;
  ClientDataSet.EmptyDataSet;
  ClientDetalhe.EmptyDataSet;

  pnlGravar.Visible       := True;
  vlDetalhamentoIniciado := False;

  HabilitarCampos(False);
end;

procedure TfrmGerenciadorSaidas.btnCancelarDetalhamentoClick(Sender: TObject);
begin
  btnCancelarClick(self);
end;

procedure TfrmGerenciadorSaidas.btnExcluirClick(Sender: TObject);
begin
  if pgcCompromissos.ActivePageIndex = 0 then
  begin
    ClientDetalhe.First;
    while not ClientDetalhe.Eof do
      ClientDetalhe.Delete;

    ClientDataSet.Delete;
    if ClientDataSet.IsEmpty then
         btnCancelarClick(Self)
    else sqlCompromissoRealizado.Refresh;
  end;
end;

procedure TfrmGerenciadorSaidas.btnLimparCompromissoClick(Sender: TObject);
begin
  lcxCompromisso.EditValue := null;
  cbxReferencia.editValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
  edtDocumento.Clear;
  edtValor.EditValue := 0;
  edtObservacao.Clear;
  edtDescricao.Clear;

  if pnlCampos.Visible then
    lcxCompromisso.SetFocus;
end;

procedure TfrmGerenciadorSaidas.btnRegistrarClick(Sender: TObject);
var
  viPessoaId, viPessoaNome, viPessoaCPF, viPessoaRG, viTipoSaida, viCompromissoContabilizar : string;

  procedure RegistrarCompromisso(vpClientRegistrar : TClientDataSet;
        vpDetalhado, vpCompromissoDetalhado : String; vpRegistroParcial : Boolean = False);

    procedure RegistrarItensTotal;
    begin
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('CONTABIL_CONTA_ID').AsBCD      := vpClientRegistrar.FieldByName('Contabil_Conta_Id').AsInteger;
        ParamByName('VALOR_ATUAL').AsCurrency       := vpClientRegistrar.FieldByName('Valor').AsCurrency;
        ParamByName('VALOR_ORIGEM').AsCurrency      := vpClientRegistrar.FieldByName('Valor').AsCurrency;
        ParamByName('ANO_MES_REFERENCIA').AsString  := dtmLookup.FormatarAnoMes(vpClientRegistrar.FieldByName('Referencia').AsString, 'S');
        ParamByName('CENTRO_CUSTO_ID').AsBCD        := vpClientRegistrar.FieldByName('Centro_Custo_Id').AsInteger;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vpClientRegistrar.FieldByName('Balancete_Grupo_Id').AsInteger;
        ParamByName('SAIDA_DOCUMENTO').AsString     := vpClientRegistrar.FieldByName('DOCUMENTO').AsString;
        ParamByName('DESCRICAO').AsString           := vpClientRegistrar.FieldByName('DESCRICAO').AsString;
        ParamByName('OBSERVACAO').AsString          := vpClientRegistrar.FieldByName('OBSERVACAO').AsString;
        ParamByName('DETALHADO').AsString           := vpDetalhado;
      end;
    end;

    procedure RegistrarItensParcial(vpClientRegistrar : TSimpleDataSet);
    begin
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('CONTABIL_CONTA_ID').AsBCD      := vpClientRegistrar.FieldByName('Contabil_Conta_Id').AsInteger;
        ParamByName('VALOR_ATUAL').AsCurrency       := vpClientRegistrar.FieldByName('CALC_VALORPAGAR').AsCurrency;
        ParamByName('VALOR_ORIGEM').AsCurrency      := vpClientRegistrar.FieldByName('CALC_VALORPAGAR').AsCurrency;
        ParamByName('ANO_MES_REFERENCIA').AsString  := vpClientRegistrar.FieldByName('ANO_MES_REFERENCIA').AsString;
        ParamByName('CENTRO_CUSTO_ID').AsBCD        := vpClientRegistrar.FieldByName('Centro_Custo_Id').AsInteger;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vpClientRegistrar.FieldByName('Balancete_Grupo_Id').AsInteger;
        ParamByName('SAIDA_DOCUMENTO').AsString     := 'Registro Detalhado Parcial';
        ParamByName('DESCRICAO').AsString           := vpClientRegistrar.FieldByName('DESCRICAO').AsString;
        ParamByName('OBSERVACAO').AsString          := vpClientRegistrar.FieldByName('OBSERVACAO').AsString;
        ParamByName('CONTABILIZAR').AsString        := 'S';
        ParamByName('SAIDA_NUMERO').AsCurrency      := vgReciboSaida;
        ParamByName('PESSOA_NOME').AsString         := vpClientRegistrar.FieldByName('PESSOA_NOME').AsString;
        ParamByName('PESSOA_CPF').AsString          := vpClientRegistrar.FieldByName('PESSOA_CPF').AsString;
        ParamByName('PESSOA_RG').AsString           := vpClientRegistrar.FieldByName('PESSOA_RG').AsString;
        ParamByName('SAIDA_TIPO').AsString          := vpClientRegistrar.FieldByName('SAIDA_TIPO').AsString;
        ParamByName('DETALHADO').AsString           := 'N';
      end;
    end;

  begin
    ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_VENCIDO( '+
                       '              COMPROMISSO_VENCIDO_ID, '+
                       '              CONTABIL_CONTA_ID, '+
                       '              VALOR_ATUAL, '+
                       '              VALOR_ORIGEM, '+
                       '              VALOR_ANTERIOR, '+
                       '              ANO_MES_REFERENCIA, '+
                       '              TIPO_OPERACAO, '+
                       '              OBRIGATORIO, '+
                       '              ATUALIZADO, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              CEDENTE_ID, '+
                       '              BALANCETE_GRUPO_ID, '+
                       '              DATA_REALIZACAO, '+
                       '              DATA_LANCAMENTO, '+
                       '              SAIDA_NUMERO, '+
                       '              SAIDA_TIPO, '+
                       '              SAIDA_PESSOA_ID, '+
                       '              SAIDA_DOCUMENTO, '+
                       '              DESCRICAO, '+
                       '              OBSERVACAO, '+
                       '              PESSOA_NOME, '+
                       '              PESSOA_CPF, '+
                       '              PESSOA_RG, '+
                       '              ANO_MES_REALIZADO, '+
                       '              DETALHADO, '+
                       '              COMPROMISSO_DETALHADO_ID, '+
                       '              COMPROMISSO_CONTABILIZAR_ID, '+
                       '              CONTABILIZAR, '+
                       '              SITUACAO) '+
                       ' VALUES(      :COMPROMISSO_VENCIDO_ID, '+
                       '              :CONTABIL_CONTA_ID, '+
                       '              :VALOR_ATUAL, '+
                       '              :VALOR_ORIGEM, '+
                       '              :VALOR_ANTERIOR, '+
                       '              :ANO_MES_REFERENCIA, '+
                       '              :TIPO_OPERACAO, '+
                       '              :OBRIGATORIO, '+
                       '              :ATUALIZADO, '+
                       '              :CENTRO_CUSTO_ID, '+
                       '              :CEDENTE_ID, '+
                       '              :BALANCETE_GRUPO_ID, '+
                       '              :DATA_REALIZACAO, '+
                       '              :DATA_LANCAMENTO, '+
                       '              :SAIDA_NUMERO, '+
                       '              :SAIDA_TIPO, '+
                       RetNull(viPessoaId)+', '+
                       '              :SAIDA_DOCUMENTO, '+
                       '              :DESCRICAO, '+
                       '              :OBSERVACAO, '+
                       '              :PESSOA_NOME, '+
                       '              :PESSOA_CPF, '+
                       '              :PESSOA_RG, '+
                       '              :ANO_MES_REALIZADO, '+
                       '              :DETALHADO, '+
                       RetNull(vpCompromissoDetalhado)+', '+
                       RetNull(viCompromissoContabilizar)+', '+
                       '              :CONTABILIZAR, '+
                       '              :SITUACAO)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('COMPROMISSO_VENCIDO_ID').AsBCD := dtmControles.GerarSequencia('T_COMPROMISSO_VENCIDO');

      if not vpRegistroParcial then
           RegistrarItensTotal
      else RegistrarItensParcial(sqlCompromissoRealizado);

      ParamByName('VALOR_ANTERIOR').AsCurrency    := 0;
      ParamByName('TIPO_OPERACAO').AsString       := 'D';
      ParamByName('OBRIGATORIO').AsString         := 'N';
      ParamByName('ATUALIZADO').AsString          := 'A';
      ParamByName('CEDENTE_ID').AsBCD             := vgCedenteAtivo;
      ParamByName('DATA_REALIZACAO').AsString     := FormatDateTime('DD.MM.YYYY HH:MM:SS', vgDadosConfirmacao.Data);
      ParamByName('DATA_LANCAMENTO').AsString     := FormatDateTime('DD.MM.YYYY HH:MM:SS', vgDadosConfirmacao.Data);
      ParamByName('ANO_MES_REALIZADO').AsInteger  := dtmLookup.PegarAnoMes(DateToStr(vgDadosConfirmacao.Data));
      ParamByName('SITUACAO').AsString            := '2';
      ExecSQL(FALSE);
    end;
  end;

  procedure RealizarValidacao;
  begin
    // Detalhamento Individual
    ClientDataSet.DisableControls;
    while not ClientDataSet.Eof do
    begin
      if ClientDataSetDETALHADO.AsString = 'I' then
      begin
        Application.MessageBox('Existe compromisso com detalhamento incompleto!!!', 'Atenção', MB_OK + MB_ICONWARNING);
        ClientDataSet.EnableControls;
        Abort;
      end;
      ClientDataSet.Next
    end;
    ClientDataSet.EnableControls;

    // Detalhamento de Itens a Contabilizar
    if (vlDetalhamentoIniciado and (vlValorADetalhar <> vlValorDetalhadoTotal)) or
       ((vgDetalhandoCompromissoId > 0) and not(vlDetalhamentoIniciado)) then
    begin
      Application.MessageBox('O Detalhamento está incompleto!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  end;

  procedure PreencherDadosRegistro;
  var
    viCompromissoLista : TStringList;
  begin
    viPessoaNome := '';
    viPessoaCPF  := '';
    viPessoaRG   := '';
    viPessoaId   := '';

    if vgDetalhandoCompromissoId > 0 then
    begin
      viCompromissoLista := dtmControles.GetFields(' SELECT PESSOA_NOME, PESSOA_ID, SAIDA_NUMERO, DATA_REALIZACAO'+
                                                   ' FROM T_COMPROMISSO_VENCIDO '+
                                                   ' WHERE COMPROMISSO_VENCIDO_ID = '+IntToStr(vgDetalhandoCompromissoId));
      viPessoaNome :=  viCompromissoLista.Values['PESSOA_NOME'];
      viPessoaCPF  := '';
      viPessoaRG   := '';

      if (viCompromissoLista.Values['PESSOA_ID'] = '') then
           viPessoaId := ''
      else viPessoaId := viCompromissoLista.Values['PESSOA_ID'];

      vgReciboSaida           := StrToInt(viCompromissoLista.Values['SAIDA_NUMERO']);
      vgDadosConfirmacao.Data := StrToDate(Copy(viCompromissoLista.Values['DATA_REALIZACAO'], 1, 10));
      vgDadosConfirmacao.Qtd  := 1;
      FreeAndNil(viCompromissoLista);
    end;
  end;

  procedure DetalharItemIndividual;
  begin
    ClientDetalhe.First;
    while not ClientDetalhe.eof do
    begin
      RegistrarCompromisso(ClientDetalhe, 'N', ClientDetalheCHAVE_DETALHAMENTO.AsString);
      ClientDetalhe.Next;
    end;
  end;

  procedure RegistrarItensDetalhadosNaoContabeis;

    procedure AtualizarRegistro(vpTotal : Boolean);
    begin
      if vpTotal then
        ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SAIDA_DOCUMENTO = :SAIDA_DOCUMENTO,' +
                           '                        CONTABILIZAR = :CONTABILIZAR, '+
                           '                       TIPO_REGISTRO = :TIPO_REGISTRO, '+
                           '            COMPROMISSO_DETALHADO_ID = :COMPROMISSO_DETALHADO_ID, '+
                           '                        SAIDA_NUMERO = :SAIDA_NUMERO, '+
                           '                     DATA_REALIZACAO = :DATA_REALIZACAO, '+
                           '                           DETALHADO = :DETALHADO '+
                           ' WHERE COMPROMISSO_VENCIDO_ID = '+sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID.AsString,2)
      else
        ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SAIDA_DOCUMENTO = :SAIDA_DOCUMENTO,' +
                           '                       TIPO_REGISTRO = :TIPO_REGISTRO '+
                           ' WHERE COMPROMISSO_VENCIDO_ID = '+sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID.AsString,2);

      With dtmControles.sqlAuxiliar do
      begin
        ParamByName('SAIDA_DOCUMENTO').AsString := 'Registro Detalhado';

        if vpTotal then
        begin
          ParamByName('CONTABILIZAR').AsString              := 'S';
          ParamByName('TIPO_REGISTRO').AsString             := 'T';
          ParamByName('COMPROMISSO_DETALHADO_ID').AsInteger := vlDetalhamentoId;
          ParamByName('SAIDA_NUMERO').AsInteger             := vgReciboSaida;
          ParamByName('DATA_REALIZACAO').AsDate             := vgDadosConfirmacao.Data;
          ParamByName('DETALHADO').AsString                 := 'N';
        end
        else
        begin
          if (sqlCompromissoRealizadoVALOR_CONTABILIZAR.AsCurrency = sqlCompromissoRealizadocalc_ValorPagar.AsCurrency) then
               ParamByName('TIPO_REGISTRO').AsString        := 'F'
          else ParamByName('TIPO_REGISTRO').AsString        := 'P';
        end;
        ExecSQL(FALSE);
      end;
    end;

  begin
    if not vlDetalhamentoIniciado then
      exit;

    sqlCompromissoRealizado.Filtered := False;
    sqlCompromissoRealizado.Filter   := 'Selecionar = True';
    sqlCompromissoRealizado.Filtered := True;

    sqlCompromissoRealizado.First;
    while not sqlCompromissoRealizado.eof do
    begin
      if (sqlCompromissoRealizadoVALOR_CONTABILIZAR.AsCurrency = sqlCompromissoRealizadocalc_ValorPagar.AsCurrency) and
          (sqlCompromissoRealizadoTIPO_REGISTRO.IsNull) then
        AtualizarRegistro(True)
      else
      begin
        AtualizarRegistro(False);
        viCompromissoContabilizar := sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID.AsString;
        RegistrarCompromisso(ClientDataSet, 'N',  IntToStr(vlDetalhamentoId), True);
      end;
      sqlCompromissoRealizado.Next;
    end;
    sqlCompromissoRealizado.ApplyUpdates(-1);
    sqlCompromissoRealizado.Filtered := False;
    sqlCompromissoRealizado.Refresh;
  end;

  procedure AtualizarRegistroDetalhado;
  begin
    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET DETALHADO = '+QuotedStr('S')+','+
                       '                           COMPROMISSO_DETALHADO_ID = '+IntToStr(vlDetalhamentoId)+
                       ' WHERE COMPROMISSO_VENCIDO_ID = '+IntToStr(vgDetalhandoCompromissoId),1);
  end;

begin

  RealizarValidacao;

  vgDadosConfirmacao.Saida      := True;
  viCompromissoContabilizar     := '';

  if Application.MessageBox('Confirmar Detalhamento do Registro?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  vgDadosConfirmacao.Confirmado := True;
  PreencherDadosRegistro;

  if vlDetalhamentoIniciado then
    vlDetalhamentoId := dtmControles.GerarSequencia('TI_COMPROMISSO_DETALHADO');

  try
    dtmControles.StartTransaction;
    ClientDataSet.First;
    while not ClientDataSet.eof do
    begin
      if vgDetalhandoCompromissoId = 0 then
      begin
        if not vlDetalhamentoIniciado then
             RegistrarCompromisso(ClientDataSet, ClientDataSetDETALHADO.AsString,  ClientDetalheCHAVE_DETALHAMENTO.AsString)
        else RegistrarCompromisso(ClientDataSet, 'S',  IntToStr(vlDetalhamentoId));
      end;

      DetalharItemIndividual;
      ClientDataSet.Next;
    end;

    RegistrarItensDetalhadosNaoContabeis;
    dtmControles.Commit;
  except
    vgDadosConfirmacao.Confirmado := False;
    dtmControles.Roolback;
    Application.MessageBox('Problemas no Registro da Despesa. Operação Cancelada!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  AtualizarRegistroDetalhado;
  btnCancelarClick(Self);
  vgDadosConfirmacao.Confirmado := False;
end;

procedure TfrmGerenciadorSaidas.ClientDataSetAfterScroll(DataSet: TDataSet);
begin
  btnRegistrar.Enabled            := not ClientDataSet.IsEmpty;
  btnExcluir.Enabled              := (not ClientDataSet.IsEmpty) and (vgDetalhandoCompromissoId = 0);
  btnAdicionarCompromisso.Enabled := (vgDetalhandoCompromissoId = 0);
end;

procedure TfrmGerenciadorSaidas.ClientDetalheAfterScroll(DataSet: TDataSet);
begin
  btnExcluir.Enabled               := (not ClientDetalhe.IsEmpty);
  btnAdicionarCompromisso.Enabled  := True;
end;

procedure TfrmGerenciadorSaidas.ClientDetalheCalcFields(DataSet: TDataSet);
begin
  ClientDetalheCALC_VINCULO.AsBoolean := ClientDetalheCHAVE_DETALHAMENTO.AsInteger > 0;
end;

procedure TfrmGerenciadorSaidas.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciadorSaidas.cxGridDBTableDetalharCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if ((AViewInfo.RecordViewInfo.GridRecord.Values[0] = False) or (AViewInfo.RecordViewInfo.GridRecord.Values[0] = null))
     and (vlValorDetalhadoTotal = vlValorADetalhar) then
    ACanvas.Font.Color := clSilver;

  if (AViewInfo.RecordViewInfo.GridRecord.Values[0] = True) and
     (AViewInfo.RecordViewInfo.GridRecord.Values[2] <> AViewInfo.RecordViewInfo.GridRecord.Values[3]) then
  begin
    ACanvas.Brush.Color := $0080FFFF;
    ACanvas.Font.Color := clBlue;
  end;
end;

procedure TfrmGerenciadorSaidas.cxGridDBTableSelecionarCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if ((AViewInfo.RecordViewInfo.GridRecord.Values[0] = False) or (AViewInfo.RecordViewInfo.GridRecord.Values[0] = null))
     and (vlValorDetalhadoTotal = vlValorADetalhar) then
    ACanvas.Brush.Color := clSilver;
end;

procedure TfrmGerenciadorSaidas.cxGridDBTableSelecionarPropertiesChange(
  Sender: TObject);
begin
  vlDetalhamentoIniciado := True;
  sqlCompromissoRealizado.Post;
end;

procedure TfrmGerenciadorSaidas.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  viValor : Variant;
begin
  viValor := AViewInfo.RecordViewInfo.GridRecord.Values[0];
  if viValor = 'P' then
    ACanvas.Font.Color := clRed
  else
    if (viValor = 'F') or (viValor = 'T') then
      ACanvas.Font.Color := clGray;
end;

procedure TfrmGerenciadorSaidas.btnItemIncluirClick(Sender: TObject);
begin
  HabilitarCampos(True);
  lcxCompromisso.SetFocus;
end;

procedure TfrmGerenciadorSaidas.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnAdicionarCompromissoClick(self);
end;

procedure TfrmGerenciadorSaidas.FormActivate(Sender: TObject);
begin
  dtmLookup.CarregarPeriodo(cbxReferencia,8,'',IntToStr(vgPeriodoAtual));
  cbxReferencia.editValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
  tabBalanceteChange(tabBalancete);
end;

procedure TfrmGerenciadorSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlCompromissoRealizado.close;
  dtmLookup.sqlPlanoContasDespesasAtivo.Filtered := False;
  Action := caFree;
  frmGerenciadorSaidas := nil;;
end;

procedure TfrmGerenciadorSaidas.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  sqlCompromissoRealizado.Connection := dtmControles.DB;
  dtmLookup.CarregarTabBalancete(tabBalancete);
  tabDetalhamento.TabVisible      := False;
  pgcCompromissos.ActivePageIndex := 0;
  vlCriandoForm := False;
  HabilitarCampos(False);
end;

procedure TfrmGerenciadorSaidas.FormShow(Sender: TObject);
begin
  pgcSaidas.ActivePageIndex := 0;
end;

procedure TfrmGerenciadorSaidas.HabilitarCampos(vpHabilitado: Boolean);
begin
  pnlCampos.Visible          := vpHabilitado;
  pnlGravar.Visible          := vpHabilitado;
  pnlAdicionar.Visible       := (not vpHabilitado);
  pnlDetalhamento.Visible    := ClientDataSet.RecordCount > 0;
  tabDetalhamento.TabVisible := ClientDataSet.RecordCount > 0;
end;

procedure TfrmGerenciadorSaidas.HabilitarDetalhamento(vpHabilitar: Boolean);
begin
  if vlCriandoForm then
    exit;

  btnItemIncluir.Enabled := (pgcCompromissos.ActivePageIndex = 0) and (vgDetalhandoCompromissoId = 0);
  btnExcluir.Enabled     := (btnItemIncluir.Enabled) and (not ClientDataSet.IsEmpty);

  if pgcCompromissos.ActivePageIndex = 0 then
    ClientDataSetAfterScroll(ClientDataSet)
end;

procedure TfrmGerenciadorSaidas.HabilitarModeloEntrada(vpHabilitado: Boolean;
  vpCor1, vpCor2, vpCor3: TColor);
begin
  edtDocumento.Enabled    := not vpHabilitado;
  lblDocumento.Enabled    := not vpHabilitado;

  if vpHabilitado then
    edtDocumento.Clear
  else
    if pnlCampos.Visible then
      lcxCompromisso.SetFocus;

  tabCompromissos.Caption := 'Compromisso(s) Contabilizado(s)';
end;

procedure TfrmGerenciadorSaidas.HabilitarOpcaoDetalhar(vpOpcao : Integer; vpCor1, vpCor2, vpCor3 : TColor);
begin

end;

procedure TfrmGerenciadorSaidas.HabilitarOpcoesRegistro(vpHabilitado: Boolean);
begin
  VerificarValorADetalhar;
end;

procedure TfrmGerenciadorSaidas.HabilitarRegistroDetalhamento(
  vpHabilitar: Boolean);
begin
  btnItemIncluir.Enabled          := vpHabilitar;
  btnCancelarDetalhamento.Visible := not vpHabilitar;

  if vpHabilitar then
       btnRegistrar.Caption := 'Registrar Despesa/Saída'
  else btnRegistrar.Caption := 'Confirmar Detalhamento';
end;

procedure TfrmGerenciadorSaidas.ImprimirRecibo(vpRecibo : Integer; vpTipo : String);
begin

end;

procedure TfrmGerenciadorSaidas.lcxCompromissoPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtDescricao.EditValue := lcxCompromisso.text;
end;

procedure TfrmGerenciadorSaidas.ParametrosRelatorioRecibo;
begin

end;

procedure TfrmGerenciadorSaidas.pgcCompromissosChange(Sender: TObject);
begin
  pgcDetalhar.HideTabs := True;
  if pgcCompromissos.ActivePageIndex <> 1 then
  begin
    ClientDataSetAfterScroll(ClientDataSet);
    pnlBotoes.Visible := True;
  end;
  HabilitarDetalhamento(pgcCompromissos.ActivePageIndex = 0);
end;

function TfrmGerenciadorSaidas.SomarCompromissosDetalhados(vpOpcao : Integer; vpSomar : Boolean = False):Boolean;
var
  viValorDetalhado, viValorRestante : Currency;
  viMensagem : string;

  procedure DefinirSituacao(vpColor1, vpColor2 : TColor; vpMensagem, vpSituacao : string);
  begin
    pnlValorDetalhado.Color      := vpColor1;
    pnlValorDetalhado.Font.Color := vpColor2;
    if vpMensagem <> '' then
      pnlValorDetalhado.Caption  := viMensagem + ' - '+ vpMensagem + ' << RESTANTE: R$ '+FormatFloat(',#0.00, ', viValorRestante)+' >>';

    if vpOpcao = 1 then
      Exit;

    ClientDataSet.edit;
    ClientDataSetDETALHADO.AsString := vpSituacao;
    ClientDataSet.post;
    ClientDetalheAfterScroll(ClientDetalhe);
  end;

  function RealizarSoma:Currency;
  var
    viSoma : Currency;
  begin
    ClientDetalhe.DisableControls;
    ClientDetalhe.First;
    viSoma := 0;
    while not ClientDetalhe.eof do
    begin
      viSoma := viSoma + ClientDetalheVALOR.AsCurrency;
      ClientDetalhe.Next;
    end;
    Result := viSoma;
    ClientDetalhe.EnableControls;
  end;

begin
  if pgcSaidas.ActivePageIndex > 0 then
    exit;

  if vpOpcao = 1 then
       viValorDetalhado := SomarCompromissosNaoContabilizados(vpSomar)
  else viValorDetalhado := RealizarSoma;

  if viValorDetalhado = 0 then
  begin
    pnlValorDetalhado.Caption := ' Compromisso(s) ainda ainda não Detalhado!!!';
    DefinirSituacao(clWhite, clBlue, '', 'N');
    Exit;
  end;

  viValorRestante := vlValorADetalhar - viValorDetalhado;
  viMensagem := ' Valor Detalhado: '+FormatFloat('R$ ,#0.00',viValorDetalhado);

  if vlValorADetalhar = viValorDetalhado then
    DefinirSituacao(clWhite, clGreen, 'DETALHAMENTO COMPLETO!!!', 'S')
  else
    if vlValorADetalhar < viValorDetalhado then
         DefinirSituacao(clWhite, clRed, 'Detalhamento superior ao valor do compromisso!!!','I')
    else DefinirSituacao(clWhite, clRed, 'Detalhamento incompleto...','I');
end;

function TfrmGerenciadorSaidas.SomarCompromissosNaoContabilizados(vpSomar : Boolean):Currency;
var
  viValorDetalhado, viValorTotal, viValorSelecionado : Currency;

  procedure VerificarValorDetalhado;
  begin
    if pgcSaidas.ActivePageIndex > 0 then
      exit;

    vlGravandoValor := True;
    viValorDetalhado := sqlCompromissoRealizadoVALOR_CONTABILIZAR.AsCurrency + viValorTotal;

    sqlCompromissoRealizado.Edit;
    if sqlCompromissoRealizadoSelecionar.AsBoolean then
    begin
      if viValorDetalhado <= vlValorADetalhar then
           sqlCompromissoRealizadocalc_ValorPagar.AsCurrency := sqlCompromissoRealizadoVALOR_CONTABILIZAR.AsCurrency
      else sqlCompromissoRealizadocalc_ValorPagar.AsCurrency := vlValorADetalhar - viValorTotal;
    end
    else sqlCompromissoRealizadocalc_ValorPagar.AsCurrency := 0;
    sqlCompromissoRealizado.Post;

    if sqlCompromissoRealizadoVALOR_TOTAL.AsString <> '' then
         viValorTotal := StrToCurr(sqlCompromissoRealizadoVALOR_TOTAL.AsString)
    else viValorTotal := 0;

    if viValorTotal = 0 then
      vlDetalhamentoIniciado := False;

    vlValorDetalhadoTotal := viValorTotal;
    sqlCompromissoRealizadoAfterScroll(sqlCompromissoRealizado);
    vlGravandoValor := False;
  end;

begin
   if sqlCompromissoRealizadoVALOR_TOTAL.AsString <> '' then
        viValorTotal := StrToCurr(sqlCompromissoRealizadoVALOR_TOTAL.AsString)
   else viValorTotal := 0;

  if vpSomar then
    VerificarValorDetalhado;

  Result := viValorTotal;
end;

procedure TfrmGerenciadorSaidas.sqlCompromissoRealizadoAfterPost(
  DataSet: TDataSet);
begin
  if vlGravandoValor then
    exit;

  SomarCompromissosDetalhados(1, True);
end;

procedure TfrmGerenciadorSaidas.sqlCompromissoRealizadoAfterScroll(
  DataSet: TDataSet);
begin
  cxGridDBTableSelecionar.Options.Editing := (sqlCompromissoRealizadoSelecionar.AsBoolean) or (vlValorDetalhadoTotal = 0) or
                                             ((vlValorDetalhadoTotal > 0) and (vlValorDetalhadoTotal <> vlValorADetalhar));

end;

procedure TfrmGerenciadorSaidas.tabBalanceteChange(Sender: TObject);
begin
  dtmLookup.sqlPlanoContasDespesasAtivo.Filtered := False;
  dtmLookup.sqlPlanoContasDespesasAtivo.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlPlanoContasDespesasAtivo.Filtered := True;

  dtmLookup.sqlCentroCustoAtivo.Filtered := False;
  dtmLookup.sqlCentroCustoAtivo.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlCentroCustoAtivo.Filtered := True;

  lcxCentroCusto.EditValue  := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  cbxReferencia.editValue   := vgPeriodoAtualS;
  lcxCentroCusto.EditValue  := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  lcxCompromisso.EditValue  := null;
end;

procedure TfrmGerenciadorSaidas.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if not ClientDataSet.IsEmpty then
  begin
    Application.MessageBox('Já existe(m) lançamento(s) adicionado(s) em outro Balancete!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
end;

procedure TfrmGerenciadorSaidas.VerificarValorADetalhar;
begin
  pnlValoraDetalhar.Caption := ' O Valor para Detalhamento é de R$ '+ FormatFloat(',#0.00', ClientDataSetVALOR.AsCurrency);
  vlValorADetalhar := ClientDataSetVALOR.AsCurrency;
  SomarCompromissosDetalhados(2);
end;

end.


