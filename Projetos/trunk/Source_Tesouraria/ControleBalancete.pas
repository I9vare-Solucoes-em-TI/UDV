unit ControleBalancete;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxGroupBox, DBClient, SimpleDS,
  cxCurrencyEdit, cxPC, frxClass, frxDBSet, cxLookAndFeels, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, cxNavigator, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, Data.DBXInterBase, DbxDevartInterBase;

type
  TfrmControleBalancete = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    PanelBotaoFechar: TPanel;
    Panel9: TPanel;
    gbxPeriodo: TcxGroupBox;
    lblMes: TcxLabel;
    lblAno: TcxLabel;
    icxMes: TcxImageComboBox;
    icxAno: TcxImageComboBox;
    cxGroupBox2: TcxGroupBox;
    btnImpBalanceteLeitura: TcxButton;
    cxLabel4: TcxLabel;
    btnImpBalanceteContador: TcxButton;
    Panel1: TPanel;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableCompromissos: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableCompromissosColumn1: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn2: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn3: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn4: TcxGridDBColumn;
    cbxBalancete: TcxGroupBox;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel13: TcxLabel;
    sqlBalanceteAnterior: TI9Query;
    dtsBalanceteAnterior: TDataSource;
    sqlBalanceteAnteriorBALANCETE_ID: TBCDField;
    sqlBalanceteAnteriorREFERENCIA: TStringField;
    sqlBalanceteAnteriorSALDO_CONTA: TBCDField;
    sqlBalanceteAnteriorSALDO_APLICACAO: TBCDField;
    sqlBalanceteAnteriorSALDO_CAIXA: TBCDField;
    sqlBalanceteAnteriorSALDO_NAO_COMPENSADO: TBCDField;
    sqlBalanceteAnteriorSITUACAO: TStringField;
    sqlBalanceteAnteriorCALC_SALDO_BANCO: TCurrencyField;
    sqlBalanceteAnteriorCALC_SALDO_TOTAL: TCurrencyField;
    sqlBalanceteAtual: TI9Query;
    dtsBalanceteAtual: TDataSource;
    sqlBalanceteAtualBALANCETE_ID: TBCDField;
    sqlBalanceteAtualREFERENCIA: TStringField;
    sqlBalanceteAtualSALDO_CONTA: TBCDField;
    sqlBalanceteAtualSALDO_APLICACAO: TBCDField;
    sqlBalanceteAtualSALDO_CAIXA: TBCDField;
    sqlBalanceteAtualSALDO_NAO_COMPENSADO: TBCDField;
    sqlBalanceteAtualSITUACAO: TStringField;
    sqlBalanceteAtualCALC_SALDO_BANCO: TCurrencyField;
    sqlBalanceteAtualCALC_SALDO_TOTAL: TCurrencyField;
    lblBalanceteSituacao: TcxLabel;
    sqlBalanceteAtualOBSERVACAO: TStringField;
    dtsBalancetes: TDataSource;
    ClientBalancetes: TClientDataSet;
    ClientBalancetesBALANCETE_GRUPO_ID: TIntegerField;
    ClientBalancetesENTRADAS: TCurrencyField;
    ClientBalancetesSAIDAS: TCurrencyField;
    ClientBalancetesDIFERENCA: TCurrencyField;
    cxLabel1: TcxLabel;
    sqlBalanceteAtualCALC_SALDO_BALANCETE: TCurrencyField;
    sqlBalanceteAtualCALC_DIFERENCA: TCurrencyField;
    ClientBalancetesPRINCIPAL: TStringField;
    cxGridDBTableCompromissosColumn5: TcxGridDBColumn;
    edtSaldoAtualConta: TcxDBCurrencyEdit;
    edtSaldoAtualNaoCompensado: TcxDBCurrencyEdit;
    edtSaldoAtualAplicacao: TcxDBCurrencyEdit;
    cxDBCurrencyEdit5: TcxDBCurrencyEdit;
    edtSaldoAtualCaixa: TcxDBCurrencyEdit;
    cxGroupBox8: TcxGroupBox;
    cxDBCurrencyEdit8: TcxDBCurrencyEdit;
    cxGroupBox1: TcxGroupBox;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    cxGroupBox9: TcxGroupBox;
    edtDiferenca: TcxDBCurrencyEdit;
    edtObservacao: TcxDBTextEdit;
    pgcSaldoAnterior: TcxPageControl;
    tabSaldoBancarioAnterior: TcxTabSheet;
    tabSaldoBalanceteAnterior: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtSaldoConta: TcxDBCurrencyEdit;
    edtSaldoNaoCompensado: TcxDBCurrencyEdit;
    edtSaldoAplicacao: TcxDBCurrencyEdit;
    cxGroupBox4: TcxGroupBox;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxGroupBox5: TcxGroupBox;
    edtSaldoCaixa: TcxDBCurrencyEdit;
    cxGroupBox6: TcxGroupBox;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    cxLabel2: TcxLabel;
    btnCancelarAnterior: TcxButton;
    btnAlterarAnterior: TcxButton;
    btnConfirmarAnterior: TcxButton;
    btnImpBalanceteDetalhado: TcxButton;
    btnReabrirBalancete: TcxButton;
    btnBalanceteFechar: TcxButton;
    cxLabel3: TcxLabel;
    grdSaldoAnterior: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBBalanceteHistSaldoAnterior: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dtsBalanceteHistorico: TDataSource;
    sqlBalanceteHistorico: TI9Query;
    sqlBalanceteHistoricoBALANCETE_HISTORICO_ID: TBCDField;
    sqlBalanceteHistoricoBALANCETE_ID: TBCDField;
    sqlBalanceteHistoricoBALANCETE_GRUPO_ID: TBCDField;
    sqlBalanceteHistoricoENTRADAS: TBCDField;
    sqlBalanceteHistoricoSAIDAS: TBCDField;
    sqlBalanceteAtualCEDENTE_ID: TBCDField;
    sqlBalanceteAnteriorCEDENTE_ID: TBCDField;
    frxDBDataSetBalanceteLeitura: TfrxDBDataset;
    frxReport1: TfrxReport;
    sqDadosBalanceteLeitura: TI9Query;
    dtsBalanceteLeitura: TDataSource;
    sqDadosBalanceteLeituraVALOR: TBCDField;
    sqDadosBalanceteLeituraPLANO_CONTAS: TStringField;
    sqDadosBalanceteLeituraGRUPO_DESCRICAO: TStringField;
    sqDadosBalanceteLeituraCONTABIL_GRUPO: TStringField;
    sqDadosBalanceteLeituraTIPO_OPERACAO: TStringField;
    sqlBalanceteHistoricoSALDO_FINAL: TBCDField;
    sqlBalanceteHistoricoSALDO_ANTERIOR: TBCDField;
    cxGridDBBalanceteHistSaldoFinal: TcxGridDBColumn;
    sqlBalanceteAnteriorOBSERVACAO: TStringField;
    cxLabel15: TcxLabel;
    edtObservacaoAnterior: TcxDBTextEdit;
    sqlDadosGenericos: TI9Query;
    dtsDadosGenericos: TDataSource;
    frxDBDataSetDadosGenericos: TfrxDBDataset;
    sqlDadosGenericosVALOR_ATUAL: TBCDField;
    sqlDadosGenericosTIPO_OPERACAO: TStringField;
    sqlDadosGenericosGRUPO_DESCRICAO: TStringField;
    sqlDadosGenericosDESCRICAO: TStringField;
    sqlDadosGenericosSAIDA_DOCUMENTO: TStringField;
    sqlDadosGenericosANO_MES_REFERENCIA: TStringField;
    sqDadosBalanceteContador: TI9Query;
    dtsBalanceteContador: TDataSource;
    sqDadosBalanceteContadorVALOR: TBCDField;
    sqDadosBalanceteContadorGRUPO_DESCRICAO: TStringField;
    sqDadosBalanceteContadorCONTABIL_GRUPO: TStringField;
    sqDadosBalanceteContadorTIPO_OPERACAO: TStringField;
    frxDBDataSetBalanceteContador: TfrxDBDataset;
    frxDBDatasetcABECALHO: TfrxDBDataset;
    sqlBalanceteDetalhado: TI9Query;
    dtsBalanceteDetalhado: TDataSource;
    sqlBalanceteDetalhadoDATA_REALIZACAO: TSQLTimeStampField;
    sqlBalanceteDetalhadoVALOR_ATUAL: TBCDField;
    sqlBalanceteDetalhadoTIPO_OPERACAO: TStringField;
    sqlBalanceteDetalhadoRECIBO_NUMERO: TBCDField;
    sqlBalanceteDetalhadoBOLETA_ID: TBCDField;
    sqlBalanceteDetalhadoSAIDA_NUMERO: TBCDField;
    sqlBalanceteDetalhadoSAIDA_TIPO: TStringField;
    sqlBalanceteDetalhadoSAIDA_DOCUMENTO: TStringField;
    sqlBalanceteDetalhadoDESCRICAO: TStringField;
    sqlBalanceteDetalhadoPESSOA_NOME: TStringField;
    sqlBalanceteDetalhadoPLANO_CONTAS: TStringField;
    frxDBDataSetDadosDetalhados: TfrxDBDataset;
    sqlBalanceteDetalhadoCALC_CREDITO: TCurrencyField;
    sqlBalanceteDetalhadoCALC_DEBITO: TCurrencyField;
    sqlBalanceteDetalhadoCALC_DESCRICAO: TStringField;
    sqlBalanceteDetalhadoCALC_TIPO_DOCUMENTO: TStringField;
    sqlBalanceteDetalhadoCALC_NUMERO: TStringField;
    sqlBalanceteDetalhadoCALC_MES_REFERENCIA: TStringField;
    sqlBalanceteDetalhadoANO_MES_REFERENCIA: TStringField;
    btnBalanceteAnual: TcxButton;
    sqlDadosBalanceteAnual: TI9Query;
    FMTBCDField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    dtsDadosBalanceteAnual: TDataSource;
    frxDBDataSetDadosAnual: TfrxDBDataset;
    btnImpBalanceteGeral: TcxButton;
    sqlDadosBalanceteGeral: TI9Query;
    dtsBalanceteGeral: TDataSource;
    sqlDadosBalanceteGeralVALOR: TBCDField;
    sqlDadosBalanceteGeralPLANO_CONTAS: TStringField;
    sqlDadosBalanceteGeralGRUPO_DESCRICAO: TStringField;
    sqlDadosBalanceteGeralCONTABIL_GRUPO: TStringField;
    sqlDadosBalanceteGeralTIPO_OPERACAO: TStringField;
    frxDBDataSetBalanceteGeral: TfrxDBDataset;
    sqlDadosBalanceteGeralBALANCETE: TStringField;
    sqlDadosBalanceteGeralBALANCETE_GRUPO_ID: TBCDField;
    sqlDadosBalanceteGeralGRUPO: TStringField;
    cxBtnFechar: TcxButton;
    btnPesquisar: TcxButton;
    btnCancelarAtual: TcxButton;
    btnAlterarAtual: TcxButton;
    btnConfirmarAtual: TcxButton;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sqlBalanceteAnteriorCalcFields(DataSet: TDataSet);
    procedure sqlBalanceteAtualCalcFields(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarAnteriorClick(Sender: TObject);
    procedure btnConfirmarAnteriorClick(Sender: TObject);
    procedure btnAlterarAtualClick(Sender: TObject);
    procedure btnConfirmarAtualClick(Sender: TObject);
    procedure btnCancelarAtualClick(Sender: TObject);
    procedure btnCancelarAnteriorClick(Sender: TObject);
    procedure sqlBalanceteAnteriorAfterOpen(DataSet: TDataSet);
    procedure btnBalanceteFecharClick(Sender: TObject);
    procedure btnReabrirBalanceteClick(Sender: TObject);
    procedure btnImpBalanceteLeituraClick(Sender: TObject);
    procedure btnImpBalanceteDetalhadoClick(Sender: TObject);
    procedure btnImpBalanceteContadorClick(Sender: TObject);
    procedure sqlBalanceteDetalhadoCalcFields(DataSet: TDataSet);
    procedure btnBalanceteAnualClick(Sender: TObject);
    procedure btnImpBalanceteGeralClick(Sender: TObject);
  private
    vlSaldoBalancetes : Currency;
    vlReferencia : String;
    vlBalanceteAnteriorId : Integer;
    vlBalanceteInicial, vlBalanceteAberto : Boolean;
    procedure HabilitarCamposSaldoAnterior(vpHabilitado : Boolean);
    procedure HabilitarCamposSaldoAtual(vpHabilitado : Boolean);
    procedure CarregarSomaBalancetes(vpMesReferencia : string);
    procedure CarregaBalanceteAnterior(vpBalanceteAtual : String = '');
    procedure IniciarBalanceteAnterior;
    procedure CarregarAno;

    procedure ParametrosRelatorioBalancete;
  public
    { Public declarations }
  end;

var
  frmControleBalancete: TfrmControleBalancete;

implementation

uses Rotinas, Controles, Lookup, ValidarPermissaoUsuario, VisualizaRelatorios,
  Lookup_Contabil;

{$R *.dfm}

procedure TfrmControleBalancete.btnAlterarAnteriorClick(Sender: TObject);
begin
  HabilitarCamposSaldoAnterior(True);
  sqlBalanceteAnterior.Edit;
  if pgcSaldoAnterior.ActivePageIndex = 0 then
       edtSaldoConta.SetFocus
  else grdSaldoAnterior.SetFocus;
end;

procedure TfrmControleBalancete.btnAlterarAtualClick(Sender: TObject);
begin
  HabilitarCamposSaldoAtual(True);
  sqlBalanceteAtual.Edit;  
  edtSaldoAtualConta.SetFocus;
end;

procedure TfrmControleBalancete.btnBalanceteAnualClick(Sender: TObject);
begin
  sqlDadosBalanceteAnual.Active := False;
  sqlDadosBalanceteAnual.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqlDadosBalanceteAnual.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqlDadosBalanceteAnual.Active := True;

  dtmLookup.CarregarCabecalho(ClientBalancetesBALANCETE_GRUPO_ID.AsInteger);
  ExibirRelatorio(frxReport1, '9', ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer)
end;

procedure TfrmControleBalancete.btnBalanceteFecharClick(Sender: TObject);
var
  viSaldoAnterior : Currency;
begin
   if Application.MessageBox('Confirma fechamento do Balancete?', 'Pergunta', MB_YESNO) = IDNO then
     exit;

   if (LiberarPermissaoUsuario('ESP_BALANCETE')[6] = '0') then
    exit;

   try
     dtmControles.StartTransaction;

     ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET BALANCETE_FECHADO = ''S'''+
                        ' WHERE ANO_MES_REALIZADO = '+QuotedStr(vlReferencia)+
                        '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

     // Gravar os Valores do Balancete Fechado
     ClientBalancetes.First;
     while not ClientBalancetes.eof do
     begin
       if sqlBalanceteHistorico.Locate('BALANCETE_GRUPO_ID', ClientBalancetesBALANCETE_GRUPO_ID.AsInteger, [loCaseInsensitive]) then
            viSaldoAnterior := sqlBalanceteHistoricoSALDO_FINAL.AsCurrency
       else viSaldoAnterior := 0;
       sqlBalanceteHistorico.Insert;
       sqlBalanceteHistoricoBALANCETE_HISTORICO_ID.AsCurrency := dtmControles.GerarSequencia('T_BALANCETE_HISTORICO');
       sqlBalanceteHistoricoBALANCETE_ID.AsCurrency           := sqlBalanceteAtualBALANCETE_ID.AsCurrency;
       sqlBalanceteHistoricoBALANCETE_GRUPO_ID.AsCurrency     := ClientBalancetesBALANCETE_GRUPO_ID.AsCurrency;
       sqlBalanceteHistoricoENTRADAS.AsCurrency               := ClientBalancetesENTRADAS.AsCurrency;
       sqlBalanceteHistoricoSAIDAS.AsCurrency                 := ClientBalancetesSAIDAS.AsCurrency;
       sqlBalanceteHistoricoSALDO_ANTERIOR.AsCurrency         := viSaldoAnterior;
       sqlBalanceteHistoricoSALDO_FINAL.AsCurrency            := (ClientBalancetesENTRADAS.AsCurrency - ClientBalancetesSAIDAS.AsCurrency)+viSaldoAnterior;
       sqlBalanceteHistorico.post;
       ClientBalancetes.Next;
     end;

     sqlBalanceteAtual.Edit;
     sqlBalanceteAtualSITUACAO.AsString := '2';
     sqlBalanceteAtual.post;

     dtmControles.Commit;
     btnPesquisarClick(Self);
     btnAlterarAnterior.Enabled := False;
   except
     dtmControles.Roolback;
     ShowMessage('Erro ao Fechar o Balancete. Feche o sistema e tente novamente!!!');
   end;

end;

procedure TfrmControleBalancete.btnCancelarAnteriorClick(Sender: TObject);
begin
  HabilitarCamposSaldoAnterior(False);
  sqlBalanceteAnterior.Cancel;
  sqlBalanceteHistorico.Cancel;  
end;

procedure TfrmControleBalancete.btnCancelarAtualClick(Sender: TObject);
begin
  HabilitarCamposSaldoAtual(False);
  sqlBalanceteAtual.Cancel;
end;

procedure TfrmControleBalancete.btnConfirmarAnteriorClick(Sender: TObject);
var
  viSaldo : Currency;
begin
  if sqlBalanceteHistorico.RecordCount = 1 then
  begin
    sqlBalanceteHistorico.Edit;
    sqlBalanceteHistoricoSALDO_FINAL.AsCurrency := sqlBalanceteAnteriorCALC_SALDO_TOTAL.AsCurrency;
    sqlBalanceteHistorico.Post;
  end
  else
  begin
    viSaldo := 0;
    sqlBalanceteHistorico.First;
    while not sqlBalanceteHistorico.Eof do
    begin
      viSaldo := viSaldo + sqlBalanceteHistoricoSALDO_FINAL.AsCurrency;
      sqlBalanceteHistorico.Next;
    end;

    if viSaldo <> sqlBalanceteAnteriorCALC_SALDO_TOTAL.AsCurrency then
    begin
      Application.MessageBox('Soma dos Saldos do Balancete diferente do SALDO TOTAL EM CAIXA!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end;

  HabilitarCamposSaldoAnterior(False);
  sqlBalanceteAnterior.post;
  sqlBalanceteHistorico.post;
  sqlBalanceteAtual.Refresh;
end;

procedure TfrmControleBalancete.btnConfirmarAtualClick(Sender: TObject);
begin
  HabilitarCamposSaldoAtual(False);
  sqlBalanceteAtual.post;
end;

procedure TfrmControleBalancete.btnImpBalanceteLeituraClick(Sender: TObject);
begin
  sqDadosBalanceteLeitura.Active := False;
  sqDadosBalanceteLeitura.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqDadosBalanceteLeitura.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqDadosBalanceteLeitura.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqDadosBalanceteLeitura.Active := True;

  sqlDadosGenericos.Active := False;
  sqlDadosGenericos.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqlDadosGenericos.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqlDadosGenericos.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqlDadosGenericos.Active := True;

  dtmLookup.CarregarCabecalho(ClientBalancetesBALANCETE_GRUPO_ID.AsInteger);
  ExibirRelatorio(frxReport1, '8', ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer)
end;

procedure TfrmControleBalancete.btnPesquisarClick(Sender: TObject);
var
  viBalanceteAtual : Integer;

  procedure IniciarBalanceteAtual;
  begin
    sqlBalanceteAtual.Active := False;
    sqlBalanceteAtual.ParamByName('BALANCETE_ID').AsInteger := 0;
    sqlBalanceteAtual.Active := True;

    if not vlBalanceteInicial then
    begin
      ExecutaSqlAuxiliar(' SELECT MAX(BALANCETE_ID), REFERENCIA FROM T_BALANCETE '+
                         ' WHERE SITUACAO = ''2'''+
                         '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                         ' GROUP BY REFERENCIA '+
                         ' ORDER BY REFERENCIA DESC ',0);
      vlReferencia := dtmControles.sqlAuxiliar.FieldByName('REFERENCIA').AsString;
      if vlReferencia <> '' then
      begin
        vlReferencia := dtmLookup.InclementarAnoMes(vlReferencia);
        icxMes.EditValue := copy(vlReferencia, 5,2);
        icxAno.EditValue := copy(vlReferencia, 1,4);
      end;
    end;  

    viBalanceteAtual := dtmControles.GerarSequencia('T_BALANCETE');
    sqlBalanceteAtual.Insert;
    sqlBalanceteAtualBALANCETE_ID.AsCurrency := viBalanceteAtual;
    sqlBalanceteAtualSALDO_CONTA.AsCurrency  := 0;
    sqlBalanceteAtualSALDO_CAIXA.AsCurrency  := 0;
    sqlBalanceteAtualSALDO_NAO_COMPENSADO.AsCurrency := 0;
    sqlBalanceteAtualSALDO_APLICACAO.AsCurrency      := 0;
    sqlBalanceteAtualSITUACAO.AsString               := '1';
    sqlBalanceteAtualREFERENCIA.AsString             := vlReferencia;
    sqlBalanceteAtualCEDENTE_ID.AsInteger            := vgCedenteAtivo;
    sqlBalanceteAtual.post;
  end;

begin
  vlReferencia := icxAno.EditValue + icxMes.EditValue;

  if StrToInt(vlReferencia) > vgPeriodoAtual then
  begin
    Application.MessageBox('Período maior que o período atual!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    icxMes.SetFocus;
    exit;
  end;

  if vlBalanceteInicial then
    IniciarBalanceteAtual  // Balancete Inicial
  else
  begin 
    if vlBalanceteAberto then
    begin
      // Balancete Aberto
      ExecutaSqlAuxiliar(' SELECT BALANCETE_ID, REFERENCIA FROM T_BALANCETE '+
                         ' WHERE SITUACAO = ''1'''+
                         '   AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo),0);
      if (dtmControles.sqlAuxiliar.IsEmpty) then
        IniciarBalanceteAtual
      else
      begin
        viBalanceteAtual := dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').AsInteger;
        vlReferencia := dtmControles.sqlAuxiliar.FieldByName('REFERENCIA').AsString;
        if vlReferencia <> '' then
        begin
          icxMes.EditValue := copy(vlReferencia, 5,2);
          icxAno.EditValue := copy(vlReferencia, 1,4);
        end;
      end;
    end
    else
    begin
      // Balancetes Pesquisados    
      ExecutaSqlAuxiliar(' SELECT BALANCETE_ID FROM T_BALANCETE '+
                         ' WHERE REFERENCIA = '+ QuotedStr(vlReferencia)+
                         ' AND SITUACAO <> ''0'''+
                         ' AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo),0);
      if (dtmControles.sqlAuxiliar.IsEmpty) then
      begin
        Application.MessageBox('Não exite balancete neste período!!!', 'Atenção', MB_OK + MB_ICONWARNING);
        icxMes.EditValue := copy(sqlBalanceteAtualREFERENCIA.AsString, 5,2);
        icxAno.EditValue := copy(sqlBalanceteAtualREFERENCIA.AsString, 1,4);
        icxMes.SetFocus;
        exit;
      end;
      viBalanceteAtual := dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').AsInteger;
    end;
  end;
  vlBalanceteInicial := False;
  vlBalanceteAberto  := False;

  sqlBalanceteAtual.Active := False;
  sqlBalanceteAtual.ParamByName('BALANCETE_ID').AsInteger := viBalanceteAtual;
  sqlBalanceteAtual.Active := True;

  CarregaBalanceteAnterior(IntToStr(viBalanceteAtual));

  if sqlBalanceteAtualSITUACAO.AsString = '1' then
       lblBalanceteSituacao.Caption := 'BALANCETE ABERTO - ' + icxMes.Text + '/'+icxAno.Text
  else lblBalanceteSituacao.Caption := 'BALANCETE FECHADO - ' + icxMes.Text + '/'+icxAno.Text;

  btnAlterarAtual.Enabled := sqlBalanceteAtualSITUACAO.AsString = '1';

  // Somente permite abrir o derradeiro balancete fechado.
  btnReabrirBalancete.Enabled := (sqlBalanceteAtualSITUACAO.AsString = '2') and
                                  (dtmControles.GetStr(' SELECT MAX(BALANCETE_ID) AS BALANCETE_ID FROM T_BALANCETE '+
                                                       ' WHERE SITUACAO = ''2'''+
                                                       ' AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo)) = sqlBalanceteAtualBALANCETE_ID.AsString);

  CarregarSomaBalancetes(vlReferencia);
  pgcSaldoAnterior.ActivePageIndex := 0;
  sqlBalanceteATUAL.Refresh;
  sqlBalanceteAnterior.Refresh;

  btnAlterarAnterior.Enabled       := (sqlBalanceteAtualBALANCETE_ID.AsInteger = 2) and (sqlBalanceteAtualSITUACAO.AsString = '1');
  btnAlterarAnterior.Visible      := (sqlBalanceteAtualBALANCETE_ID.AsInteger = 2) and (sqlBalanceteAtualSITUACAO.AsString = '1');
  btnConfirmarAnterior.Visible    := (sqlBalanceteAtualBALANCETE_ID.AsInteger = 2) and (sqlBalanceteAtualSITUACAO.AsString = '1');
  btnCancelarAnterior.Visible     := (sqlBalanceteAtualBALANCETE_ID.AsInteger = 2) and (sqlBalanceteAtualSITUACAO.AsString = '1');
  edtObservacaoAnterior.Visible   := (sqlBalanceteAtualBALANCETE_ID.AsInteger > 2);

  // Impressoes
  btnImpBalanceteLeitura.Enabled   := sqlBalanceteAtualSITUACAO.AsString = '2';
//  btnImpBalanceteGeral.Enabled     := sqlBalanceteAtualSITUACAO.AsString = '2';
  btnImpBalanceteContador.Enabled  := sqlBalanceteAtualSITUACAO.AsString = '2';
  btnImpBalanceteDetalhado.Enabled := sqlBalanceteAtualSITUACAO.AsString = '2';
end;

procedure TfrmControleBalancete.btnReabrirBalanceteClick(Sender: TObject);
begin
  if Application.MessageBox('Reabrir Balancete. Confirma?', 'Pergunta', MB_YESNO) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_BALANCETE')[6] = '0') then
   exit;

  try
    dtmControles.StartTransaction;

    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET BALANCETE_FECHADO = ''N'''+
                       ' WHERE ANO_MES_REALIZADO = '+QuotedStr(vlReferencia)+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

    // Exclui o Historico do Balancete                        
    ExecutaSqlAuxiliar(' DELETE FROM T_BALANCETE_HISTORICO '+
                       ' WHERE BALANCETE_ID = '+ sqlBalanceteAtualBALANCETE_ID.AsString,1);

    // Exclui o Balancete que esta em aberto;
    ExecutaSqlAuxiliar(' DELETE FROM T_BALANCETE '+
                       ' WHERE SITUACAO = ''1'''+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

    // Abre o Balancete
    ExecutaSqlAuxiliar(' UPDATE T_BALANCETE SET SITUACAO = ''1'''+
                       ' WHERE BALANCETE_ID = '+sqlBalanceteAtualBALANCETE_ID.AsString+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

    dtmControles.Commit;
    btnPesquisarClick(Self);
  except
    dtmControles.Roolback;
    ShowMessage('Erro ao Abrir o Balancete. Feche o sistema e tente novamente!!!');
  end;
end;

procedure TfrmControleBalancete.CarregaBalanceteAnterior(vpBalanceteAtual : String = '');
var
  viBalancete : Integer;
  viSql : string;
begin
  // Verifica Chave do Balancete Anterior
  viSql := ' SELECT MAX(BALANCETE_ID) AS BALANCETE_ID FROM T_BALANCETE '+
           ' WHERE SITUACAO = ''2'''+
           '  AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
           '  AND REFERENCIA < '+ QuotedStr(vlReferencia);

  if vpBalanceteAtual <> '' then
    viSql := viSql + ' AND NOT BALANCETE_ID = '+ vpBalanceteAtual;

  ExecutaSqlAuxiliar(viSql,0);

  if dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').IsNull then
  begin
    ExecutaSqlAuxiliar(' SELECT MAX(BALANCETE_ID) AS BALANCETE_ID FROM T_BALANCETE '+
                       ' WHERE SITUACAO = ''0'''+
                       '  AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),0);
    if dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').IsNull then
         IniciarBalanceteAnterior
    else vlBalanceteAnteriorId := dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').AsInteger;
  end
  else vlBalanceteAnteriorId := dtmControles.sqlAuxiliar.FieldByName('BALANCETE_ID').AsInteger;

  sqlBalanceteAnterior.Active := False;
  sqlBalanceteAnterior.ParamByName('BALANCETE_ID').AsInteger := vlBalanceteAnteriorId;
  sqlBalanceteAnterior.Active := True;
end;

procedure TfrmControleBalancete.CarregarAno;
var
  viAno, viAnoInicial : Integer;
begin
  viAnoInicial := 2009;
  viAno := StrToInt(Copy(DateToStr(Date), 7,4));
  icxAno.Properties.Items.Clear;
  repeat
    Inc(viAnoInicial);
    dtmLookup.CarregarIcxComboBox(IntToStr(viAnoInicial), IntToStr(viAnoInicial), icxAno);
  until viAno = viAnoInicial;
end;

procedure TfrmControleBalancete.CarregarSomaBalancetes(vpMesReferencia: string);
var
  viEntradas, viSaidas : Currency;

  function SomarBalancete(vpBalancete, vpTipoOperacao : String):Currency;
  var
    viSql : string;
  begin
    viSql := ' SELECT SUM(VALOR_ATUAL) AS SOMA '+
             ' FROM T_COMPROMISSO_VENCIDO '+
             ' WHERE ANO_MES_REALIZADO = '+ QuotedStr(vpMesReferencia)+
             '   AND TIPO_OPERACAO = '+ QuotedStr(vpTipoOperacao)+
             '   AND BALANCETE_GRUPO_ID = '+vpBalancete+
             '   AND SITUACAO = ''2''';
    if vpTipoOperacao = 'D' then
      viSql := viSql +
               '   AND CONTABILIZAR <> ''N'''+
               '   AND (DETALHADO = ''S'' OR COMPROMISSO_DETALHADO_ID IS NULL)';
    ExecutaSqlAuxiliar(viSql,0);

    Result := dtmControles.sqlAuxiliar.FieldByName('SOMA').AsCurrency;
  end;

  procedure GravarBalancete(vpBalancete : Integer; vpPrincipal : string);
  begin
    ClientBalancetes.Insert;
    ClientBalancetesBALANCETE_GRUPO_ID.AsInteger := vpBalancete;
    ClientBalancetesENTRADAS.AsCurrency          := viEntradas;
    ClientBalancetesSAIDAS.AsCurrency            := viSaidas;
    ClientBalancetesDIFERENCA.AsCurrency         := viEntradas - viSaidas;
    ClientBalancetesPRINCIPAL.AsString           := vpPrincipal;
    ClientBalancetes.Post;
  end;

begin
  vlSaldoBalancetes := 0;
  ClientBalancetes.EmptyDataSet;
  ExecutaSimpleDSAux(' SELECT BALANCETE_GRUPO_ID, PRINCIPAL FROM T_BALANCETE_GRUPO' +
//                     ' WHERE SITUACAO = ''A''' +
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     ' ORDER BY PRINCIPAL',0);
  while not dtmControles.SimpleAuxiliar.Eof do
  begin
    viEntradas := SomarBalancete(dtmControles.SimpleAuxiliar.FieldByName('BALANCETE_GRUPO_ID').AsString, 'C');
    viSaidas   := SomarBalancete(dtmControles.SimpleAuxiliar.FieldByName('BALANCETE_GRUPO_ID').AsString, 'D');
    GravarBalancete(dtmControles.SimpleAuxiliar.FieldByName('BALANCETE_GRUPO_ID').AsInteger,
                    dtmControles.SimpleAuxiliar.FieldByName('PRINCIPAL').AsString);
    vlSaldoBalancetes := vlSaldoBalancetes + (viEntradas - viSaidas);
    dtmControles.SimpleAuxiliar.Next;
  end;
end;

procedure TfrmControleBalancete.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmControleBalancete.btnImpBalanceteGeralClick(Sender: TObject);
begin
  sqlDadosBalanceteGeral.Active := False;
  sqlDadosBalanceteGeral.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqlDadosBalanceteGeral.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqlDadosBalanceteGeral.Active := True;

  sqlDadosGenericos.Active := False;
  sqlDadosGenericos.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqlDadosGenericos.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqlDadosGenericos.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqlDadosGenericos.Active := True;

  dtmLookup.CarregarCabecalho(ClientBalancetesBALANCETE_GRUPO_ID.AsInteger);
  ExibirRelatorio(frxReport1, '11', ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer)
end;

procedure TfrmControleBalancete.btnImpBalanceteContadorClick(Sender: TObject);
begin
  sqDadosBalanceteContador.Active := False;
  sqDadosBalanceteContador.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqDadosBalanceteContador.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqDadosBalanceteContador.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqDadosBalanceteContador.Active := True;

  dtmLookup.CarregarCabecalho(ClientBalancetesBALANCETE_GRUPO_ID.AsInteger);
  ExibirRelatorio(frxReport1, '9', ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer)
end;

procedure TfrmControleBalancete.btnImpBalanceteDetalhadoClick(Sender: TObject);
begin
  sqlBalanceteDetalhado.Active := False;
  sqlBalanceteDetalhado.ParamByName('ANO_MES_REALIZADO').AsString   := vlReferencia;
  sqlBalanceteDetalhado.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  sqlBalanceteDetalhado.ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientBalancetesBALANCETE_GRUPO_ID.AsInteger;
  sqlBalanceteDetalhado.Active := True;

  dtmLookup.CarregarCabecalho(ClientBalancetesBALANCETE_GRUPO_ID.AsInteger);
  ExibirRelatorio(frxReport1, '10', ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer)
end;

procedure TfrmControleBalancete.FormActivate(Sender: TObject);
begin
  icxMes.SetFocus;
end;

procedure TfrmControleBalancete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlBalanceteHistorico.close;
  sqlBalanceteAnterior.Close;
  sqlBalanceteAtual.Close;
  sqDadosBalanceteLeitura.close;
  sqlDadosGenericos.close;
  sqDadosBalanceteContador.Close;
  sqlBalanceteDetalhado.Close;
  sqlDadosBalanceteAnual.Close;
  sqlDadosBalanceteGeral.Close;

  Action := caFree;
  frmControleBalancete := nil;
end;

procedure TfrmControleBalancete.FormCreate(Sender: TObject);
begin
  sqlBalanceteAnterior.Connection       := dtmControles.DB;
  sqlBalanceteHistorico.Connection      := dtmControles.DB;
  sqlBalanceteAtual.Connection          := dtmControles.DB;
  sqDadosBalanceteLeitura.Connection    := dtmControles.DB;
  sqlDadosGenericos.Connection          := dtmControles.DB;
  sqDadosBalanceteContador.Connection   := dtmControles.DB;
  sqlBalanceteDetalhado.Connection      := dtmControles.DB;
  sqlDadosBalanceteAnual.Connection     := dtmControles.DB;
  sqlDadosBalanceteGeral.Connection     := dtmControles.DB;

  vlReferencia       := '';
  vlBalanceteInicial := False;
  vlBalanceteAberto  := True;
  CarregarAno;
  CarregaBalanceteAnterior;

  HabilitarCamposSaldoAnterior(False);
  HabilitarCamposSaldoAtual(False);

  // Pesquisa Balancete Atual
  if vlReferencia <> '' then
  begin
    icxMes.EditValue := copy(vlReferencia, 5,2);
    icxAno.EditValue := copy(vlReferencia, 1,4);
  end
  else
  begin
    icxMes.EditValue := copy(IntToStr(vgPeriodoAtual), 5,2);
    icxAno.EditValue := copy(IntToStr(vgPeriodoAtual), 1,4);
  end;
  btnPesquisarClick(Self);
end;

procedure TfrmControleBalancete.HabilitarCamposSaldoAnterior(
  vpHabilitado: Boolean);
begin
  edtSaldoConta.Enabled         := vpHabilitado;
  edtSaldoAplicacao.Enabled     := vpHabilitado;
  edtSaldoNaoCompensado.Enabled := vpHabilitado;
  edtSaldoCaixa.Enabled         := vpHabilitado;
  btnConfirmarAnterior.Enabled  := vpHabilitado;
  btnCancelarAnterior.Enabled   := vpHabilitado;
  btnAlterarAnterior.Enabled    := not vpHabilitado;
  cxBtnFechar.Enabled           := not vpHabilitado;
  btnAlterarAtual.Enabled       := not vpHabilitado;
  gbxPeriodo.Enabled            := not vpHabilitado;
  cxGridDBBalanceteHistSaldoFinal.Options.Editing  := vpHabilitado;
  cxGridDBBalanceteHistSaldoFinal.Options.Focusing := vpHabilitado;
end;

procedure TfrmControleBalancete.HabilitarCamposSaldoAtual(
  vpHabilitado: Boolean);
begin
  edtSaldoAtualConta.Enabled         := vpHabilitado;
  edtSaldoAtualAplicacao.Enabled     := vpHabilitado;
  edtSaldoAtualNaoCompensado.Enabled := vpHabilitado;
  edtSaldoAtualCaixa.Enabled         := vpHabilitado;
  gbxPeriodo.Enabled                 := vpHabilitado;
  edtObservacao.Enabled              := vpHabilitado;
  btnAlterarAtual.Enabled            := not vpHabilitado;
  cxBtnFechar.Enabled                := not vpHabilitado;
  btnAlterarAnterior.Enabled         := not vpHabilitado;
  gbxPeriodo.Enabled                 := not vpHabilitado;  
  btnConfirmarAtual.Enabled          := vpHabilitado;
  btnCancelarAtual.Enabled           := vpHabilitado;
end;

procedure TfrmControleBalancete.IniciarBalanceteAnterior;
  procedure InicialBalanceteHistorico;
  begin
    ExecutaSimpleDSAux(' SELECT BALANCETE_GRUPO_ID FROM T_BALANCETE_GRUPO' +
                       ' WHERE SITUACAO = ''A''' +
                       ' AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                       ' ORDER BY PRINCIPAL',0);
    sqlBalanceteHistorico.Active := True;
    while not dtmControles.SimpleAuxiliar.Eof do
    begin
      sqlBalanceteHistorico.Insert;
      sqlBalanceteHistoricoBALANCETE_HISTORICO_ID.AsCurrency := dtmControles.GerarSequencia('T_BALANCETE_HISTORICO');
      sqlBalanceteHistoricoBALANCETE_ID.AsCurrency           := vlBalanceteAnteriorId;
      sqlBalanceteHistoricoBALANCETE_GRUPO_ID.AsCurrency     := dtmControles.SimpleAuxiliar.FieldByName('BALANCETE_GRUPO_ID').AsCurrency;
      sqlBalanceteHistoricoENTRADAS.AsCurrency               := 0;
      sqlBalanceteHistoricoSAIDAS.AsCurrency                 := 0;
      sqlBalanceteHistoricoSALDO_Final.AsCurrency            := 0;
      sqlBalanceteHistoricoSALDO_ANTERIOR.AsCurrency         := 0;      
      sqlBalanceteHistorico.post;
      dtmControles.SimpleAuxiliar.Next;
    end;
    vlReferencia := vgReferenciaInicial;
    vlBalanceteInicial := True;
  end;
begin
  sqlBalanceteAnterior.Active := False;
  sqlBalanceteAnterior.ParamByName('BALANCETE_ID').AsInteger := 0;
  sqlBalanceteAnterior.Active := True;

  // Iniciar Dados do Balancete Anterior Inexistente
  vlBalanceteAnteriorId := dtmControles.GerarSequencia('T_BALANCETE');
  sqlBalanceteAnterior.Insert;
  sqlBalanceteAnteriorBALANCETE_ID.AsCurrency := vlBalanceteAnteriorId;
  sqlBalanceteAnteriorSALDO_CONTA.AsCurrency  := 0;
  sqlBalanceteAnteriorSALDO_CAIXA.AsCurrency  := 0;
  sqlBalanceteAnteriorSALDO_NAO_COMPENSADO.AsCurrency := 0;
  sqlBalanceteAnteriorSALDO_APLICACAO.AsCurrency      := 0;
  sqlBalanceteAnteriorSITUACAO.AsString               := '0';
  sqlBalanceteAnteriorCEDENTE_ID.AsInteger            := vgCedenteAtivo;
  sqlBalanceteAnterior.post;
  btnConfirmarAnterior.Enabled := False;
  btnAlterarAnterior.Enabled   := True;
  InicialBalanceteHistorico;
end;

procedure TfrmControleBalancete.ParametrosRelatorioBalancete;
var
  viSaldoAtual : currency;
begin
  CriarFuncoesRelatorio(frxReport1);
  if sqlBalanceteHistorico.Locate('BALANCETE_GRUPO_ID', ClientBalancetesBALANCETE_GRUPO_ID.AsInteger, [loCaseInsensitive]) then
  begin
    // Valores Anteriores
    frxReport1.Variables.Variables['SALDO_ANTERIOR']  := QuotedStr(FormatFloat('#0.00', sqlBalanceteHistoricoSALDO_FINAL.AsCurrency));

    // Valor Atual
    viSaldoAtual := (ClientBalancetesENTRADAS.AsCurrency+sqlBalanceteHistoricoSALDO_FINAL.AsCurrency)-ClientBalancetesSAIDAS.AsCurrency;
    frxReport1.Variables.Variables['SALDO_ATUAL']     := QuotedStr(FormatFloat('#0.00', viSaldoAtual));
  end
  else
  begin
    // Valores Anteriores
    frxReport1.Variables.Variables['SALDO_ANTERIOR']  := QuotedStr(FormatFloat('#0.00', 0));

    // Valor Atual
    viSaldoAtual := (ClientBalancetesENTRADAS.AsCurrency+0)-ClientBalancetesSAIDAS.AsCurrency;
    frxReport1.Variables.Variables['SALDO_ATUAL']     := QuotedStr(FormatFloat('#0.00', viSaldoAtual));
  end;

  frxReport1.Variables.Variables['BALANCETE']      := QuotedStr(dtmControles.GetStr(' SELECT SIGLA FROM T_BALANCETE_GRUPO '+
                                                                ' WHERE BALANCETE_GRUPO_ID = '+ClientBalancetesBALANCETE_GRUPO_ID.AsString));
  frxReport1.Variables.Variables['REFERENCIA_MES'] := QuotedStr(MaiusculoMinusculo(Rotinas.Mes[StrToInt(Copy(vlReferencia, 5,2))]));
  frxReport1.Variables.Variables['REFERENCIA_ANO'] := QuotedStr(MaiusculoMinusculo(Copy(vlReferencia, 1,4)));

  // Valores do Mes
  frxReport1.Variables.Variables['ENTRADAS']  := QuotedStr(FormatFloat('#0.00', ClientBalancetesENTRADAS.AsCurrency));
  frxReport1.Variables.Variables['SAIDAS']    := QuotedStr(FormatFloat('#0.00', ClientBalancetesSAIDAS.AsCurrency));
  frxReport1.Variables.Variables['RESULTADO'] := QuotedStr(FormatFloat('#0.00', ClientBalancetesDIFERENCA.AsCurrency));

  // Observacao
  frxReport1.Variables.Variables['PRINCIPAL']     := QuotedStr(ClientBalancetesPRINCIPAL.AsString);
  frxReport1.Variables.Variables['OBSERVACAO']    := QuotedStr(sqlBalanceteAtualOBSERVACAO.AsString);
end;

procedure TfrmControleBalancete.sqlBalanceteAnteriorAfterOpen(
  DataSet: TDataSet);
begin
  sqlBalanceteHistorico.Active := False;
  sqlBalanceteHistorico.ParamByName('BALANCETE_ID').AsBCD := sqlBalanceteAnteriorBALANCETE_ID.AsInteger;
  sqlBalanceteHistorico.Active := True;
end;

procedure TfrmControleBalancete.sqlBalanceteAnteriorCalcFields(
  DataSet: TDataSet);
begin
  sqlBalanceteAnteriorCALC_SALDO_BANCO.AsCurrency := sqlBalanceteAnteriorSALDO_CONTA.AsCurrency +
                                                     sqlBalanceteAnteriorSALDO_NAO_COMPENSADO.AsCurrency +
                                                     sqlBalanceteAnteriorSALDO_APLICACAO.AsCurrency;
  sqlBalanceteAnteriorCALC_SALDO_TOTAL.AsCurrency := sqlBalanceteAnteriorCALC_SALDO_BANCO.AsCurrency +
                                                     sqlBalanceteAnteriorSALDO_CAIXA.AsCurrency;
end;

procedure TfrmControleBalancete.sqlBalanceteAtualCalcFields(DataSet: TDataSet);
begin
  sqlBalanceteAtualCALC_SALDO_BANCO.AsCurrency := sqlBalanceteAtualSALDO_CONTA.AsCurrency +
                                                     sqlBalanceteAtualSALDO_NAO_COMPENSADO.AsCurrency +
                                                     sqlBalanceteAtualSALDO_APLICACAO.AsCurrency;

  sqlBalanceteAtualCALC_SALDO_TOTAL.AsCurrency := sqlBalanceteAtualCALC_SALDO_BANCO.AsCurrency +
                                                  sqlBalanceteAtualSALDO_CAIXA.AsCurrency;

  sqlBalanceteAtualCALC_SALDO_BALANCETE.AsCurrency := sqlBalanceteAnteriorCALC_SALDO_TOTAL.AsCurrency + vlSaldoBalancetes;
  sqlBalanceteAtualCALC_DIFERENCA.AsCurrency := sqlBalanceteAtualCALC_SALDO_TOTAL.AsCurrency - sqlBalanceteAtualCALC_SALDO_BALANCETE.AsCurrency;

  if sqlBalanceteAtualCALC_DIFERENCA.AsCurrency = 0 then
    edtDiferenca.StyleDisabled.Color := clGreen
  else
    if sqlBalanceteAtualCALC_DIFERENCA.AsCurrency > 0 then
         edtDiferenca.StyleDisabled.Color := clNavy
    else edtDiferenca.StyleDisabled.Color := clMaroon;

//  btnBalanceteFechar.Enabled := (sqlBalanceteAtualCALC_DIFERENCA.AsCurrency = 0) and (sqlBalanceteAtualSITUACAO.AsString = '1');
  btnBalanceteFechar.Enabled := True;
end;

procedure TfrmControleBalancete.sqlBalanceteDetalhadoCalcFields(
  DataSet: TDataSet);
begin
  sqlBalanceteDetalhadoCALC_MES_REFERENCIA.AsString := dtmLookup.FormatarAnoMes(sqlBalanceteDetalhadoANO_MES_REFERENCIA.AsString);

  if sqlBalanceteDetalhadoTIPO_OPERACAO.AsString = 'C' then
  begin
    sqlBalanceteDetalhadoCALC_CREDITO.AsCurrency := sqlBalanceteDetalhadoVALOR_ATUAL.AsCurrency;
    if sqlBalanceteDetalhadoBOLETA_ID.AsCurrency > 0 then
    begin
      sqlBalanceteDetalhadoCALC_TIPO_DOCUMENTO.AsString := 'Boleto';
      sqlBalanceteDetalhadoCALC_NUMERO.AsString         := FormatFloat('###,###', sqlBalanceteDetalhadoBOLETA_ID.AsCurrency);
    end
    else
    begin
      sqlBalanceteDetalhadoCALC_TIPO_DOCUMENTO.AsString := 'Recibo';
      sqlBalanceteDetalhadoCALC_NUMERO.AsString         := FormatFloat('###,###', sqlBalanceteDetalhadoRECIBO_NUMERO.AsCurrency);
    end;
    sqlBalanceteDetalhadoCALC_DESCRICAO.AsString := sqlBalanceteDetalhadoPLANO_CONTAS.AsString;
  end
  else
  begin
    sqlBalanceteDetalhadoCALC_DEBITO.AsCurrency  := sqlBalanceteDetalhadoVALOR_ATUAL.AsCurrency;
    sqlBalanceteDetalhadoCALC_DESCRICAO.AsString := sqlBalanceteDetalhadoDESCRICAO.AsString;
    if sqlBalanceteDetalhadoSAIDA_TIPO.AsString = 'C' then
    begin
      sqlBalanceteDetalhadoCALC_TIPO_DOCUMENTO.AsString := 'Comprovante';
      sqlBalanceteDetalhadoCALC_NUMERO.AsString := sqlBalanceteDetalhadoSAIDA_DOCUMENTO.AsString;
    end
    else
    begin
      sqlBalanceteDetalhadoCALC_TIPO_DOCUMENTO.AsString := 'Recibo';
      sqlBalanceteDetalhadoCALC_NUMERO.AsString         := FormatFloat('###,###', sqlBalanceteDetalhadoSAIDA_NUMERO.AsCurrency);
    end;
  end;
end;

end.
