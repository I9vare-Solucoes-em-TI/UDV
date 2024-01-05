unit GerenciadorAcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxLabel, cxContainer, cxGroupBox, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, StdCtrls, cxButtons, ExtCtrls, DBClient,
  SimpleDS, Buttons, cxCheckBox, cxSplitter, cxDBEdit, cxRadioGroup,
  FrameCompromisso, FrameEditorSimples, FrameImagem;

type
  TfrmGerenciadorAcao = class(TForm)
    PanelBotoes: TPanel;
    PanelBotoesBasicos: TPanel;
    cxBtnAlterar: TcxButton;
    cxBtnExcluir: TcxButton;
    cxBtnIncluir: TcxButton;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    pgcPesquisa: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    icxPesqGrau: TcxImageComboBox;
    edtPesqNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    lcxPesqGrupo: TcxLookupComboBox;
    tabCompromissos: TcxTabSheet;
    sqlPesquisa: TSimpleDataSet;
    dtsPesquisa: TDataSource;
    sqlPesquisaNOME: TStringField;
    sqlPesquisaCPF: TStringField;
    sqlPesquisaRG: TStringField;
    sqlPesquisaTELEFONES: TStringField;
    sqlPesquisaSITUACAO: TStringField;
    sqlPesquisaGRAU: TStringField;
    sqlPesquisaPESSOA_GRUPO_ID: TFMTBCDField;
    sqlPesquisaPESSOA_ID: TFMTBCDField;
    cxGroupBox1: TcxGroupBox;
    cbxCompromissosMensais: TcxGroupBox;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    splitFamilia: TcxSplitter;
    Panel1: TPanel;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridDBTableValor: TcxGridDBColumn;
    cxGridDBTableView2Column5: TcxGridDBColumn;
    cxGridDBTableView2Column6: TcxGridDBColumn;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    sqlCompromissoAgendado: TSimpleDataSet;
    dtsCompromissoAgendado: TDataSource;
    sqlCompromissoVencido: TSimpleDataSet;
    dtsCompromissoVencido: TDataSource;
    cxGridDBTableDiferenca: TcxGridDBColumn;
    sqlCompromissoVencidocalc_referencia: TStringField;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    sqlCompromissoVencidoSelecionar: TBooleanField;
    popCompromissoVencido: TPopupMenu;
    popExcluir1: TMenuItem;
    N1: TMenuItem;
    popExcluir2: TMenuItem;
    N2: TMenuItem;
    popCancelarBoletaVinculada: TMenuItem;
    N3: TMenuItem;
    popAlterarValor1: TMenuItem;
    sqlCompromissoAgendadoCOMPROMISSO_AGENDADO_ID: TFMTBCDField;
    sqlCompromissoAgendadoPESSOA_ID: TFMTBCDField;
    sqlCompromissoAgendadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoAgendadoANO_MES_INICIAL: TStringField;
    sqlCompromissoAgendadoANO_MES_FINAL: TStringField;
    sqlCompromissoAgendadoPERIODO: TStringField;
    sqlCompromissoAgendadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoAgendadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoAgendadoSITUACAO_LOCAL: TStringField;
    sqlCompromissoAgendadoSITUACAO_GERAL: TStringField;
    sqlCompromissoAgendadoVALOR_ANTERIOR: TFMTBCDField;
    sqlCompromissoVencidoCOMPROMISSO_VENCIDO_ID: TFMTBCDField;
    sqlCompromissoVencidoPESSOA_ID: TFMTBCDField;
    sqlCompromissoVencidoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoVencidoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoVencidoSITUACAO: TStringField;
    sqlCompromissoVencidoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoVencidoBOLETA_ID: TFMTBCDField;
    sqlCompromissoVencidoRECIBO_NUMERO: TFMTBCDField;
    sqlCompromissoVencidoDIFERENCA: TStringField;
    sqlCompromissoAgendadocalc_AnoMesFinal: TStringField;
    sqlCompromissoAgendadocalc_AnoMesInicial: TStringField;
    popCompromissoAgendado: TPopupMenu;
    popExcluirAgendado: TMenuItem;
    MenuItem4: TMenuItem;
    popAlterarValorAgendado: TMenuItem;
    cxGridDBTableQtdAdicional: TcxGridDBColumn;
    sqlCompromissoVencidoQTD_ADICIONAL: TFMTBCDField;
    sqlCompromissoVencidoATUALIZADO: TStringField;
    cxGridDBTableAtualizado: TcxGridDBColumn;
    popRetornarValor: TMenuItem;
    sqlCompromissoVencidoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoVencidoVALOR_ANTERIOR: TFMTBCDField;
    N4: TMenuItem;
    popAtivar: TMenuItem;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    sqlCompromissoVencidocalc_travado: TStringField;
    popLancarCompromissoAVencer: TMenuItem;
    N5: TMenuItem;
    fmeCompromisso1: TfmeCompromisso;
    sqlCompromissoRealizado: TSimpleDataSet;
    dtsCompromissoRealizado: TDataSource;
    sqlCompromissoVencidoDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissoRealizadocalc_referencia: TStringField;
    sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID: TFMTBCDField;
    sqlCompromissoRealizadoPESSOA_ID: TFMTBCDField;
    sqlCompromissoRealizadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoRealizadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoRealizadoSITUACAO: TStringField;
    sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoRealizadoBOLETA_ID: TFMTBCDField;
    sqlCompromissoRealizadoRECIBO_NUMERO: TFMTBCDField;
    sqlCompromissoRealizadoDIFERENCA: TStringField;
    sqlCompromissoRealizadoVALOR_ORIGEM: TFMTBCDField;
    sqlCompromissoRealizadoQTD_ADICIONAL: TFMTBCDField;
    sqlCompromissoRealizadoATUALIZADO: TStringField;
    sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissoAgendadoOBRIGATORIO: TStringField;
    sqlCompromissoVencidoOBRIGATORIO: TStringField;
    popIsentarCompromisso: TMenuItem;
    N6: TMenuItem;
    popLancarCompromissoVencido: TMenuItem;
    sqlCompromissoAgendadoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoAgendadoCEDENTE_ID: TFMTBCDField;
    sqlCompromissoVencidoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoVencidoCEDENTE_ID: TFMTBCDField;
    sqlCompromissoAgendadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoVencidoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TFMTBCDField;
    cxGridDBTableView2Column4: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView2Column7: TcxGridDBColumn;
    sqlPesquisaEMAIL: TStringField;
    sqlPesquisaOBSERVACAO: TStringField;
    sqlPesquisaBOLETO_EMAIL: TStringField;
    sqlPesquisaSELECIONADO: TStringField;
    sqlCompromissoVencidoSELECIONADO: TStringField;
    sqlPesquisacalc_email: TStringField;
    sqlCompromissoRealizadocalc_TipoDocumento: TStringField;
    sqlCompromissoRealizadocalc_NumeroDocumento: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    popRealizado: TPopupMenu;
    popReativarCompromisso: TMenuItem;
    NegociarDivida1: TMenuItem;
    sqlCompromissoRealizadoANO_MES_REALIZADO: TStringField;
    sqlCompromissoVencidoANO_MES_REALIZADO: TStringField;
    lblPessoa: TcxLabel;
    sqlCompromissoVencidoPESSOA_NOME: TStringField;
    sqlCompromissoRealizadoPESSOA_NOME: TStringField;
    sqlPesquisaPESSOA_TERCEIRO_ID: TFMTBCDField;
    N7: TMenuItem;
    popProgramacaoAjuste: TMenuItem;
    cxGridDBTableProgramacao: TcxGridDBColumn;
    sqlCompromissoAgendadocalc_programado: TStringField;
    sqlAjusteProgramado: TSimpleDataSet;
    dtsAjusteProgramado: TDataSource;
    sqlAjusteProgramadocalc_AnoMes: TStringField;
    sqlAjusteProgramadoPROGRAMACAO_AJUSTE_ID: TFMTBCDField;
    sqlAjusteProgramadoCOMPROMISSO_AGENDADO_ID: TFMTBCDField;
    sqlAjusteProgramadoCOMPROMISSO_REAJUSTAR: TStringField;
    sqlAjusteProgramadoCOMPROMISSO_SITUACAO: TStringField;
    sqlAjusteProgramadoANO_MES: TStringField;
    sqlAjusteProgramadoSITUACAO: TStringField;
    sqlAjusteProgramadoPESSOA_ID: TFMTBCDField;
    sqlAjusteProgramadoVALOR_ANTERIOR: TFMTBCDField;
    sqlAjusteProgramadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlAjusteProgramadoSITUACAO_ANTERIOR: TStringField;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxMaskEdit1: TcxMaskEdit;
    cxLabel7: TcxLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    cxTabSheet1: TcxTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxBtnGravar: TcxButton;
    cxBtnCancelar: TcxButton;
    cbxAcao: TcxGroupBox;
    cbxAdvogado: TcxGroupBox;
    Panel3: TPanel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxGroupBox12: TcxGroupBox;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxGrid4: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    pgcVinculo: TcxPageControl;
    tabAcaoVinculos: TcxTabSheet;
    cbxPartes: TcxGroupBox;
    tabAcaoResumo: TcxTabSheet;
    cbxCliente: TcxGroupBox;
    cxGrid6: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridLevel8: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxGridDBTableView8Column1: TcxGridDBColumn;
    cxGridDBTableView8Column2: TcxGridDBColumn;
    cxGridDBTableView8Column3: TcxGridDBColumn;
    cxGridDBTableView8Column4: TcxGridDBColumn;
    cxGridDBTableView8Column5: TcxGridDBColumn;
    cxGrid5: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    fmeEditorSimples1: TfmeEditorSimples;
    tabAcaoAndamento: TcxTabSheet;
    tabAcaoTarefas: TcxTabSheet;
    tabMovimentacao: TcxTabSheet;
    fmeImagem1: TfmeImagem;
    sqlAcao: TSimpleDataSet;
    dtsAcao: TDataSource;
    sqlAcaoACAO_ID: TFMTBCDField;
    sqlAcaoAUTOS: TStringField;
    sqlAcaoCOMPLEMENTO: TStringField;
    sqlAcaoSITUACAO: TStringField;
    sqlAcaoCONTATO: TStringField;
    sqlAcaoTELEFONE: TStringField;
    sqlAcaoEMAIL: TStringField;
    sqlAcaoVALOR: TFMTBCDField;
    sqlAcaoOBSERVACAO: TBlobField;
    sqlAcaoACAO: TStringField;
    sqlAcaoRESUMO: TBlobField;
    sqlAcaoACAO_NATUREZA_ID: TFMTBCDField;
    sqlAcaoACAO_TIPO_ID: TFMTBCDField;
    sqlAcaoACAO_VARA_ID: TFMTBCDField;
    lcxAcaoNatureza: TcxDBLookupComboBox;
    lcxAcaoTipo: TcxDBLookupComboBox;
    edtAcaoComplemento: TcxDBTextEdit;
    edtAcaoAutos: TcxDBTextEdit;
    edtAcaoValor: TcxDBCurrencyEdit;
    icxAcaoSituacao: TcxDBImageComboBox;
    lcxAcaoVara: TcxDBLookupComboBox;
    lcxAcaoComarca: TcxDBLookupComboBox;
    edtAcaoContatoNome: TcxDBTextEdit;
    edtAcaoContatoTelefone: TcxDBTextEdit;
    edtAcaoContatoEmail: TcxDBTextEdit;
    cxImageComboBox1: TcxImageComboBox;
    sqlAcaoVARA: TStringField;
    cxDBComboBox1: TcxDBComboBox;
    icxEstado: TcxDBImageComboBox;
    sqlAcaoCIDADE_ID: TFMTBCDField;
    sqlAcaoUF: TStringField;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure cxBtnIncluirClick(Sender: TObject);
    procedure btnPesquisarRegistroClick(Sender: TObject);
    procedure btnLimparPesquisaClick(Sender: TObject);
    procedure sqlPesquisaAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure lcxPesqGrupoPropertiesEditValueChanged(Sender: TObject);
    procedure icxPesqGrauPropertiesEditValueChanged(Sender: TObject);
    procedure icxPesqSituacaoPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesqNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBtnAlterarClick(Sender: TObject);
    procedure cxGridPesquisaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcPesquisaChange(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure sqlCompromissoVencidoCalcFields(DataSet: TDataSet);
    procedure popExcluir1Click(Sender: TObject);
    procedure popExcluir2Click(Sender: TObject);
    procedure cxGridDBTableView1Column3CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure popAlterarValor1Click(Sender: TObject);
    procedure sqlCompromissoAgendadoCalcFields(DataSet: TDataSet);
    procedure popExcluirAgendadoClick(Sender: TObject);
    procedure popAlterarValorAgendadoClick(Sender: TObject);
    procedure popRetornarValorClick(Sender: TObject);
    procedure sqlCompromissoVencidoAfterScroll(DataSet: TDataSet);
    procedure popAtivarClick(Sender: TObject);
    procedure sqlCompromissoAgendadoAfterScroll(DataSet: TDataSet);
    procedure popLancarCompromissoAVencerClick(Sender: TObject);
    procedure sqlCompromissoRealizadoCalcFields(DataSet: TDataSet);
    procedure rdbCompromissosMensaisClick(Sender: TObject);
    procedure rdbCompromissosDiversosClick(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure popIsentarCompromissoClick(Sender: TObject);
    procedure popLancarCompromissoVencidoClick(Sender: TObject);
    procedure btnEfetuarPagamentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlPesquisaCalcFields(DataSet: TDataSet);
    procedure edtPesqNomeEnter(Sender: TObject);
    procedure sqlCompromissoRealizadoAfterScroll(DataSet: TDataSet);
    procedure popReativarCompromissoClick(Sender: TObject);
    procedure fmeCompromisso1tabBalanceteChange(Sender: TObject);
    procedure cxGridDBTableView2CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure popCancelarBoletaVinculadaClick(Sender: TObject);
    procedure sqlAjusteProgramadoCalcFields(DataSet: TDataSet);
    procedure cxBtnCancelarClick(Sender: TObject);
    procedure lcxAcaoNaturezaEnter(Sender: TObject);
    procedure lcxAcaoNaturezaPropertiesChange(Sender: TObject);
    procedure lcxAcaoNaturezaExit(Sender: TObject);
  private
    vlAbrindoForm, vlCarregarCompromissos, vlTravar : Boolean;
    vlPeriodoAtualS : string;
    vlPeriodoAtualI : Integer;

    vlNovoCadastro, vlAlterando : Boolean;
    vlLocal : String;
    procedure HabilitarPaineis(vpHabilitado : Boolean);

    procedure AtivarCompromissos;
    Procedure AtivarPopMenus;
    procedure LancarCompromissos(vpTipo : Integer);
  public
    { Public declarations }
  end;

var
  frmGerenciadorAcao: TfrmGerenciadorAcao;

implementation

uses Rotinas, Controles, Cadastro, LookupJuridico, Lookup;

//Pessoa, Lookup, LancamentoAdiantado,
//  GerenciadorRecebimento, ProgramacaoAjuste;

{$R *.dfm}

procedure TfrmGerenciadorAcao.popAlterarValor1Click(Sender: TObject);
var
  viValorAtual : String;
  viValorNovo : Currency;
  viFlag : Boolean;
begin
  if not sqlCompromissoVencidoBOLETA_ID.IsNull then
  begin
    Application.MessageBox('Boleto Vinculado. Alteração não permitida!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  viValorAtual := sqlCompromissoVencidoVALOR_ATUAL.AsString;
  viFlag := False;
  repeat
    if InputQuery('ALTERAR VALOR', 'Valor:',viValorAtual) then
    begin
      try
        viValorNovo := StrToCurr(viValorAtual);

        if viValorNovo <= 0 then
           Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING)
        else
        begin
           viFlag := true;
           sqlCompromissoVencido.Edit;
           sqlCompromissoVencidoVALOR_ATUAL.AsCurrency := viValorNovo;
           sqlCompromissoVencido.ApplyUpdates(-1);
        end;
      except
        Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      end;
    end
    else viFlag := true;
  until viFlag;
end;

procedure TfrmGerenciadorAcao.popAlterarValorAgendadoClick(Sender: TObject);
var
  viValorAtual : String;
  viValorNovo : Currency;
  viFlag : Boolean;
begin
  if sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '2' then
  begin
    Application.MessageBox(Pchar('Compromisso Inativo!!!'+#13+#13+
                                 '>> Ative o mesmo para realizar qualquer alteração.'), 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;


  viValorAtual := sqlCompromissoAgendadoVALOR_ATUAL.AsString;
  viFlag := False;
  repeat
    if InputQuery('ALTERAR VALOR', 'Valor:',viValorAtual) then
    begin
      try
        viValorNovo := StrToCurr(viValorAtual);

        if viValorNovo <= 0 then
           Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING)
        else
        begin
           viFlag := true;
           sqlCompromissoAgendado.Edit;
           sqlCompromissoAgendadoVALOR_ANTERIOR.AsCurrency := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency;
           sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency    := viValorNovo;
           sqlCompromissoAgendado.ApplyUpdates(-1);

           // Atualizar valores de compromissos vencidos
           ExecutaSimpleDSAux(' SELECT COMPROMISSO_VENCIDO_ID, VALOR_ATUAL, VALOR_ANTERIOR, ATUALIZADO '+
                              ' FROM T_COMPROMISSO_VENCIDO '+
                              ' WHERE CONTABIL_CONTA_ID = '+ sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsString +
                              '   AND PESSOA_ID = '+ sqlCompromissoAgendadoPESSOA_ID.AsString +
                              '   AND SITUACAO = '+QuotedStr('1'),0);
           if not dtmControles.SimpleAuxiliar.IsEmpty then
           begin
             if Application.MessageBox('Atualizar valores dos compromissos vencidos?', 'Pergunta', MB_YESNO) = IDNO then
               exit;

             dtmControles.SimpleAuxiliar.First;
             while not dtmControles.SimpleAuxiliar.eof do
             begin
               dtmControles.SimpleAuxiliar.Edit;
               dtmControles.SimpleAuxiliar.FieldByName('VALOR_ANTERIOR').AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency;
               dtmControles.SimpleAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency    := viValorNovo;
               dtmControles.SimpleAuxiliar.FieldByName('ATUALIZADO').AsString       := 'S';
               dtmControles.SimpleAuxiliar.ApplyUpdates(-1);
               dtmControles.SimpleAuxiliar.Next;
             end;
             sqlCompromissoVencido.Refresh;
           end;
        end;
      except
        Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      end;
    end
    else viFlag := true;
  until viFlag;

end;

procedure TfrmGerenciadorAcao.popAtivarClick(Sender: TObject);
begin
  if not popAtivar.Checked then
    if Application.MessageBox(Pchar('Isentar Compromisso. Confirma??'+#13+#13+
        'ATENÇÃO: Compromissos vencidos não serão isentos!!!'),
        'Confirmação', MB_YESNO) = IDNO then
      exit;

   sqlCompromissoAgendado.Edit;
   if popAtivar.Checked then
        sqlCompromissoAgendadoSITUACAO_LOCAL.AsString := '1'
   else sqlCompromissoAgendadoSITUACAO_LOCAL.AsString := '2';
   sqlCompromissoAgendado.ApplyUpdates(-1);
end;

procedure TfrmGerenciadorAcao.AtivarCompromissos;
var
  viSql : string;
begin
  if sqlPesquisaPESSOA_ID.AsString = '' then
    exit;

  Screen.Cursor := crHourGlass;
  // Compromisso Ativo
  viSql := ' SELECT * '+
           ' FROM T_COMPROMISSO_AGENDADO '+
           ' WHERE PESSOA_ID = '+sqlPesquisaPESSOA_ID.AsString+
           '    AND ((SITUACAO_GERAL <> ''2'') or (SITUACAO_GERAL IS NULL))';
  viSql := viSql + ' ORDER BY COMPROMISSO_AGENDADO_ID ';
  sqlCompromissoAgendado.Active := False;
  sqlCompromissoAgendado.DataSet.CommandText := viSql;
  sqlCompromissoAgendado.Active := True;

  // Compromisso Vencido
  viSql := ' SELECT * '+
           ' FROM T_COMPROMISSO_VENCIDO '+
           ' WHERE PESSOA_ID = '+sqlPesquisaPESSOA_ID.AsString+
           '    AND SITUACAO = '+QuotedStr('1')+
           '    AND TIPO_OPERACAO = '+QuotedStr('C');
  viSql := viSql + ' ORDER BY ANO_MES_REFERENCIA, COMPROMISSO_VENCIDO_ID ';

  // Compromissos Realizados
  sqlCompromissoRealizado.Active := False;
  sqlCompromissoRealizado.DataSet.ParamByName('PESSOA_ID').AsBCD := sqlPesquisaPESSOA_ID.AsCurrency;
  sqlCompromissoRealizado.Active := True;

  // Compromissos Realizados
  sqlAjusteProgramado.Active := False;
  sqlAjusteProgramado.DataSet.ParamByName('PESSOA_ID').AsBCD := sqlPesquisaPESSOA_ID.AsCurrency;
  sqlAjusteProgramado.Active := True;

//  tabAjusteProgramado.TabVisible := sqlAjusteProgramado.RecordCount > 0;

  sqlCompromissoVencido.Active := False;
  sqlCompromissoVencido.DataSet.CommandText := viSql;
  sqlCompromissoVencido.Active := True;
//  dtmLookup.MarcarDesmarcarCompromissos(sqlCompromissoVencido, False);
  AtivarPopMenus;
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorAcao.AtivarPopMenus;
begin
  popIsentarCompromisso.Enabled := (not sqlCompromissoVencido.IsEmpty) and (sqlCompromissoVencidoOBRIGATORIO.AsString = 'S');
  popExcluir1.Enabled           := (not sqlCompromissoVencido.IsEmpty) and (sqlCompromissoVencidoOBRIGATORIO.AsString = 'N');
  popExcluir2.Enabled           := not sqlCompromissoVencido.IsEmpty;
  popAlterarValor1.Enabled      := not sqlCompromissoVencido.IsEmpty;
  popRetornarValor.Enabled      := (not sqlCompromissoVencido.IsEmpty) and (sqlCompromissoVencidoATUALIZADO.AsString = 'S')
                                   and (sqlCompromissoVencidoVALOR_ANTERIOR.AsCurrency > 0);
  popCancelarBoletaVinculada.Enabled := not sqlCompromissoVencidoBOLETA_ID.IsNull;

  popAlterarValorAgendado.Enabled     := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1');
  popExcluirAgendado.Enabled          := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoOBRIGATORIO.AsString = 'N');
  popAtivar.Enabled                   := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoOBRIGATORIO.AsString = 'S');
  popProgramacaoAjuste.Enabled        := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoOBRIGATORIO.AsString = 'S');
  popLancarCompromissoAVencer.Enabled := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1');
  popLancarCompromissoVencido.Enabled := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1')
                                          and (sqlCompromissoAgendadoPERIODO.AsString = '1');
end;

procedure TfrmGerenciadorAcao.btnConfirmarCompromissoClick(Sender: TObject);
begin
  fmeCompromisso1.btnConfirmarCompromissoClick(Self);

  // Seta todos os compromissos da pessoa com não atualizado.
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET ATUALIZADO = '+QuotedStr('N')+
                     ' WHERE PESSOA_ID = '+ sqlPesquisaPESSOA_ID.AsString,1);

{  with dtmLookup do
  begin
    vgCompromissoVencido.PessoaId          := sqlPesquisaPESSOA_ID.AsInteger;
    vgCompromissoVencido.ContabilContaId   := fmeCompromisso1.lcxCompromisso.EditValue;
    vgCompromissoVencido.Valor             := fmeCompromisso1.edtValor.EditValue;
    vgCompromissoVencido.PeriodoInicial    := copy(fmeCompromisso1.cbxMesAnoInicial.EditValue,4,4) + copy(fmeCompromisso1.cbxMesAnoInicial.EditValue,1,2);
    vgCompromissoVencido.PeriodoTipo       := StrToInt(fmeCompromisso1.icxPeriodo.EditValue);
    vgCompromissoVencido.AnoMesLancamento  := InttoStr(vgPeriodoAtual);
    vgCompromissoVencido.CentroCustoId     := fmeCompromisso1.lcxCentroCusto.EditValue;
    vgCompromissoVencido.BalanceteGrupoId  := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];
    vgCompromissoVencido.BoletoId          := '';
    vgCompromissoVencido.ReciboId          := '';
    vgCompromissoVencido.SituacaoLocal     := '1';

    if fmeCompromisso1.rdbCompromissosDiversos.Checked then
    begin
      vgCompromissoVencido.SituacaoGeral           := '';
      vgCompromissoVencido.LancamentoCompromissoId := '';
      vgCompromissoVencido.Obrigatorio             := 'N';
    end
    else
    begin
      vgCompromissoVencido.SituacaoGeral := '1';
      ExecutaSqlAuxiliar(' SELECT LANCAMENTO_COMPROMISSO_ID, TODOS_SOCIOS FROM T_LANCAMENTO_COMPROMISSO '+
                         ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
                         '   AND SITUACAO = ' +QuotedStr('1'),0);
      vgCompromissoVencido.LancamentoCompromissoId := dtmControles.sqlAuxiliar.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString;
      vgCompromissoVencido.Obrigatorio             := dtmControles.sqlAuxiliar.FieldByName('TODOS_SOCIOS').AsString;
    end;

    if fmeCompromisso1.cbxMesAnoFinal.EditValue = null then
         vgCompromissoVencido.PeriodoFinal := InttoStr(vgPeriodoAtual)
    else vgCompromissoVencido.PeriodoFinal := copy(fmeCompromisso1.cbxMesAnoFinal.EditValue,4,4) + copy(fmeCompromisso1.cbxMesAnoFinal.EditValue,1,2);
    vgCompromissoVencido.AtualizarAgendado := True;
    vgCompromissoVencido.MostrarMensagem   := True;
  end;

  if fmeCompromisso1.rdbCompromissosMensais.Checked then
       dtmLookup.AdicionarCompromisso(True, True, False, 'C')
  else dtmLookup.AdicionarCompromisso(True, True, False, 'C');

  if vgCompromissoVencido.NenhumaAlteracao then
    Application.MessageBox('Nenhuma alteração realizada!!!', 'Informação', MB_OK + MB_ICONWARNING)
  else
  begin
    sqlCompromissoAgendado.Refresh;
    btnLimparCompromissoClick(Self);
  end;
  sqlCompromissoVencido.Refresh;  }

end;

procedure TfrmGerenciadorAcao.btnEfetuarPagamentoClick(Sender: TObject);
begin
{  if (vgGrupoSelecionadoId = 0) or (sqlPesquisaPESSOA_GRUPO_ID.AsInteger <> vgGrupoSelecionadoId) then
  begin
    vgPessoaSelecionadaId := sqlCompromissoVencidoPESSOA_ID.AsInteger;
    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+ QuotedStr('N')+
                       ' WHERE SITUACAO IN (''1'')'+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);
    sqlCompromissoVencido.First;
    while not sqlCompromissoVencido.Eof do
    begin
      if sqlCompromissoVencidoSelecionar.AsBoolean then
        ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+ QuotedStr('S')+
                           ' WHERE COMPROMISSO_VENCIDO_ID = '+ sqlCompromissoVencidoCOMPROMISSO_VENCIDO_ID.AsString,1);
      sqlCompromissoVencido.Next;
    end;
    sqlCompromissoVencido.Refresh;
  end
  else vgPessoaSelecionadaId := 0;

  if sqlPesquisaSITUACAO.AsInteger in [2..4] then
    vgSocioAfastado := vgPessoaSelecionadaId;
  CadGerenciadorRecebimento(False);  }
end;

procedure TfrmGerenciadorAcao.btnLimparCompromissoClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := False;
//  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_PeriodoLimitado;
  fmeCompromisso1.btnLimparCompromissoClick(self);
end;

procedure TfrmGerenciadorAcao.btnLimparPesquisaClick(Sender: TObject);
begin
  edtPesqNome.Clear;
  lcxPesqGrupo.EditValue    := null;
  icxPesqGrau.EditValue     := '-1';
//  icxPesqSituacao.EditValue := '1';
  btnPesquisarRegistroClick(Self);
end;

procedure TfrmGerenciadorAcao.btnPesquisarRegistroClick(Sender: TObject);
var
  viPesquisa, viCondicao : String;
begin
{  viPesquisa := ' SELECT PESSOA_ID, NOME, CPF, RG, SELECIONADO,  '+
                ' TELEFONES, SITUACAO, GRAU, PESSOA_GRUPO_ID, PESSOA_TERCEIRO_ID, '+
                ' EMAIL, OBSERVACAO, BOLETO_EMAIL '+
                ' FROM T_PESSOA '+
                ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo);

  viCondicao := '';

  if vgPessoaSelecionadaId <> 0 then
    viCondicao := ' AND PESSOA_ID = '+ IntToStr(vgPessoaSelecionadaId)
  else
  begin
    if edtPesqNome.Text <> '' then
      viCondicao := ' AND NOME LIKE '+QuotedStr(edtPesqNome.text+'%') ;

    if lcxPesqGrupo.EditValue <> null then
      viCondicao := viCondicao + ' AND PESSOA_GRUPO_ID = '+IntToStr(lcxPesqGrupo.EditValue);

    if icxPesqGrau.EditValue <> '-1' then
      viCondicao := viCondicao + ' AND GRAU = '+QuotedStr(icxPesqGrau.EditValue);

    if icxPesqSituacao.EditValue <> '-1' then
      viCondicao := viCondicao + ' AND SITUACAO = '+QuotedStr(icxPesqSituacao.EditValue);
  end;

  viPesquisa := viPesquisa + viCondicao + 'ORDER BY NOME, GRAU DESC ';
  sqlPesquisa.Active := False;
  sqlPesquisa.DataSet.CommandText := viPesquisa;
  sqlPesquisa.Active := True;

  tabCompromissos.TabVisible := sqlPesquisa.RecordCount > 0;
  tabMovimentacao.TabVisible := sqlPesquisa.RecordCount > 0;
  cxBtnAlterar.Enabled       := sqlPesquisa.RecordCount > 0;
  cxBtnExcluir.Enabled       := sqlPesquisa.RecordCount > 0;  

  if sqlPesquisa.IsEmpty then
    lblPessoa.Caption := '';

  if (not vlAbrindoForm) and (vgPessoaSelecionadaId = 0) then
    edtPesqNome.SetFocus; }
end;

procedure TfrmGerenciadorAcao.popCancelarBoletaVinculadaClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Cancelar Boleto de nº '+
                              FormatFloat('###,###', sqlCompromissoVencidoBOLETA_ID.AsCurrency)+'?'),
      'Confirmação', MB_YESNO) = IDNO then
      exit;

  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET SITUACAO = '+QuotedStr('3')+','+
                     '                        ORDEM = :ORDEM, '+
                     '               DATA_CANCELADO = :DATA_CANCELADO '+
                     ' WHERE BOLETA_ID = '+sqlCompromissoVencidoBOLETA_ID.AsString,2);
  with dtmControles.sqlAuxiliar do
  begin
//    ParamByName('ORDEM').AsInteger         := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
    ParamByName('DATA_CANCELADO').AsString := dtmControles.DataHoraBanco(5);
    ExecSQL(False);
  end;

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET BOLETA_ID = NULL'+
                     ' WHERE BOLETA_ID = '+sqlCompromissoVencidoBOLETA_ID.AsString,1);
  sqlCompromissoVencido.Refresh;
end;

procedure TfrmGerenciadorAcao.cxBtnAlterarClick(Sender: TObject);
begin
{  vgNovoCadastro := False;
  vgSelecionado  := True;
  vgPessoa.PessoaId := sqlPesquisaPESSOA_ID.AsInteger;
  CadPessoa(True);
  sqlPesquisa.Refresh;   }
end;

procedure TfrmGerenciadorAcao.cxBtnCancelarClick(Sender: TObject);
begin
  sqlAcao.CancelUpdates;
  HabilitarPaineis(False);

end;

procedure TfrmGerenciadorAcao.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGerenciadorAcao.cxBtnIncluirClick(Sender: TObject);
begin
  vlNovoCadastro  := True;
  HabilitarPaineis(True);
  pgcPesquisa.ActivePageIndex := 1;
end;

procedure TfrmGerenciadorAcao.cxGridDBTableView1Column3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{  if AViewInfo.RecordViewInfo.GridRecord.Values[9] = True then
    ACanvas.Font.Color := clRed;}
end;

procedure TfrmGerenciadorAcao.cxGridDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[0] = '2' then
    ACanvas.Font.Color := clOlive;

end;

procedure TfrmGerenciadorAcao.cxGridPesquisaDblClick(Sender: TObject);
begin
  cxBtnAlterarClick(self);
end;

procedure TfrmGerenciadorAcao.edtPesqNomeEnter(Sender: TObject);
begin
  if not vlTravar then
  lcxPesqGrupo.EditValue := null;
end;

procedure TfrmGerenciadorAcao.edtPesqNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    vlTravar := True;
    lcxPesqGrupo.EditValue := null;
    vlTravar := False;
    btnPesquisarRegistroClick(Self);
  end;
end;

procedure TfrmGerenciadorAcao.fmeCompromisso1tabBalanceteChange(Sender: TObject);
begin
  fmeCompromisso1.tabBalanceteChange(Sender);

end;

procedure TfrmGerenciadorAcao.FormActivate(Sender: TObject);
begin
{  if vgPessoaSelecionadaId > 0 then
  begin
    btnPesquisarRegistroClick(self);
    if pgcPesquisa.ActivePageIndex = 0 then
      pgcPesquisa.ActivePageIndex := 1;

    vlCarregarCompromissos := True;
    pgcPesquisaChange(self);
    vgPessoaSelecionadaId := 0;
  end;                       }

  if pgcPesquisa.ActivePageIndex = 1 then
  begin
    if fmeCompromisso1.rdbCompromissosDiversos.Checked then
         rdbCompromissosDiversosClick(self)
    else rdbCompromissosMensaisClick(Self);
  end;

end;

procedure TfrmGerenciadorAcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlPesquisa.Active              := False;
  sqlCompromissoAgendado.Active   := False;
  sqlCompromissoVencido.Active    := False;
  sqlCompromissoRealizado.Active  := False;
  sqlAjusteProgramado.Active      := False;

  Action             := caFree;
  frmGerenciadorAcao := nil;
end;

procedure TfrmGerenciadorAcao.FormCreate(Sender: TObject);
begin
  sqlPesquisa.Connection              := dtmControles.DB;
//  sqlCompromissoAgendado.Connection   := dtmControles.DB;
//  sqlCompromissoVencido.Connection    := dtmControles.DB;
//  sqlCompromissoRealizado.Connection  := dtmControles.DB;
//  sqlAjusteProgramado.Connection      := dtmControles.DB;

  sqlAcao.Connection := dtmControles.DB;

 sqlAcao.Active := False;
 sqlAcao.DataSet.ParamByName('ACAO_ID').AsBCD := 0;
 sqlAcao.Active := True;

//  dtmLookup.CarregarTabBalancete(fmeCompromisso1.tabBalancete);
{  vlAbrindoForm := True;
  pgcPesquisa.ActivePageIndex := 0;
  btnPesquisarRegistroClick(self);
  pgcPesquisaChange(SELF);
  vlAbrindoForm   := False;
  vlPeriodoAtualS :=(copy(dtmControles.DataHoraBanco(4),4,2))+'/'+(copy(dtmControles.DataHoraBanco(4),7,4));
  vlCarregarCompromissos := True;     }
end;

procedure TfrmGerenciadorAcao.FormShow(Sender: TObject);
begin
  if pgcPesquisa.ActivePageIndex = 0 then
    edtPesqNome.SetFocus;

//  cxBtnIncluir.Enabled := vgSincronizarReuni = 'N';
//  cxBtnExcluir.Enabled := vgSincronizarReuni = 'N';
end;

procedure TfrmGerenciadorAcao.HabilitarPaineis(vpHabilitado : Boolean);
begin
  cbxAcao.Enabled             := vpHabilitado;
  PanelBotoesBasicos.Enabled  := vpHabilitado;
  vlAlterando                 := vpHabilitado;
end;

procedure TfrmGerenciadorAcao.icxPesqGrauPropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxPesqGrupoPropertiesEditValueChanged(Self);
end;

procedure TfrmGerenciadorAcao.icxPesqSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxPesqGrupoPropertiesEditValueChanged(Self);
end;

procedure TfrmGerenciadorAcao.popLancarCompromissoVencidoClick(Sender: TObject);
begin
  LancarCompromissos(2);
end;

procedure TfrmGerenciadorAcao.LancarCompromissos(vpTipo: Integer);
begin
{  vgLancamentoAdiantado.Compromisso      := sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsInteger;
  vgLancamentoAdiantado.AnoMesInicial    := sqlCompromissoAgendadoANO_MES_INICIAL.AsString;
  vgLancamentoAdiantado.AnoMesFinal      := sqlCompromissoAgendadoANO_MES_FINAL.AsString;
  vgLancamentoAdiantado.Periodo          := sqlCompromissoAgendadoPERIODO.AsInteger;
  vgLancamentoAdiantado.Pessoa           := sqlPesquisaPESSOA_ID.AsInteger;
  vgLancamentoAdiantado.Valor            := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency;
  vgLancamentoAdiantado.Obrigatorio      := sqlCompromissoAgendadoOBRIGATORIO.AsString;
  vgLancamentoAdiantado.CentroCustoId    := sqlCompromissoAgendadoCENTRO_CUSTO_ID.AsInteger;
  vgLancamentoAdiantado.BalanceteGrupoId := sqlCompromissoAgendadoBALANCETE_GRUPO_ID.AsInteger;
  vgLancamentoAdiantado.Tipo             := vpTipo;
  vgLancamentoAdiantado.LancamentoCompromissoId := sqlCompromissoAgendadoLANCAMENTO_COMPROMISSO_ID.AsInteger;
  if vpTipo = 1 then
       vgLancamentoAdiantado.Caption       := 'Lançamento de compromisso adiantando'
  else vgLancamentoAdiantado.Caption       := 'Lançamento de compromisso vencido';
  ExibirFormulario(TfrmLancamentoAdiantado, frmLancamentoAdiantado, True);
  if vgLancamentoAdiantado.vgOK then
  begin
    sqlCompromissoVencido.Refresh;
    if vgCompromissoVencido.NenhumaAlteracao then
      Application.MessageBox('Nenhuma alteração realizada!!!', 'Informação', MB_OK + MB_ICONWARNING)
  end;   }
end;

procedure TfrmGerenciadorAcao.lcxAcaoNaturezaEnter(Sender: TObject);
begin
  vlLocal := '';
end;

procedure TfrmGerenciadorAcao.lcxAcaoNaturezaExit(Sender: TObject);
begin
  dtmLookup.CadastrarRegBasicoGeral(sqlAcao,'J_ACAO_NATUREZA', 'ACAO_NATUREZA_ID', vlLocal);
end;

procedure TfrmGerenciadorAcao.lcxAcaoNaturezaPropertiesChange(Sender: TObject);
begin
  if lcxAcaoNatureza.text <> '' then
    vlLocal := lcxAcaoNatureza.text;
end;

procedure TfrmGerenciadorAcao.lcxPesqGrupoPropertiesEditValueChanged(
  Sender: TObject);
begin
{  if vlTravar then
    exit;

  vlTravar := True;
  edtPesqNome.Clear;
  btnPesquisarRegistroClick(self);
  vlTravar := False;
end;

procedure TfrmGerenciadorAcao.popProgramacaoAjusteClick(Sender: TObject);
begin
{  vgProgramacaoAjuste.PessoaId              := sqlPesquisaPESSOA_ID.AsInteger;
  vgProgramacaoAjuste.CompromissoAgendadoId := sqlCompromissoAgendadoCOMPROMISSO_AGENDADO_ID.AsInteger;
  vgProgramacaoAjuste.ContabilContaId       := sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsInteger;
  vgProgramacaoAjuste.ValorAnterior         := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency;
  vgProgramacaoAjuste.SituacaoAnterior      := sqlCompromissoAgendadoSITUACAO_LOCAL.AsString;
  ExibirFormulario(TfrmProgramacaoAjuste, frmProgramacaoAjuste, True);
  if vgProgramacaoAjuste.Confirmado then
    sqlCompromissoAgendado.Refresh;    }
end;

procedure TfrmGerenciadorAcao.pgcPesquisaChange(Sender: TObject);
begin
  case pgcPesquisa.ActivePageIndex of
   0 : begin
        { if not vlAbrindoForm then
           edtPesqNome.SetFocus;
         vlCarregarCompromissos := True;}
//         tabAjusteProgramado.TabVisible := False;
       end;
   1 : begin
         if vlNovoCadastro then
         begin
           sqlAcao.Insert;
           sqlAcaoSITUACAO.asString := 'A';
           lcxAcaoNatureza.SetFocus;
         end;

{         if vlCarregarCompromissos then
         begin
           AtivarCompromissos;
           btnLimparCompromissoClick(self);
         end;
         vlCarregarCompromissos := False;

         fmeCompromisso1.btnConfirmarCompromisso.Enabled := (sqlPesquisaSITUACAO.AsInteger in [1,3]);
//         fmeCompromisso1.btnEfetuarPagamento.Enabled     := (sqlPesquisaSITUACAO.AsInteger in [1,3]);

{         if (sqlPesquisaPESSOA_GRUPO_ID.AsInteger = vgGrupoSelecionadoId) and (not (sqlPesquisaPESSOA_GRUPO_ID.IsNull)) then
              fmeCompromisso1.btnEfetuarPagamento.Caption := 'Voltar...'
         else fmeCompromisso1.btnEfetuarPagamento.Caption := 'Efetuar Pagamento';    }
       end;
   2: //AtivarCompromissos;
  end;
end;

procedure TfrmGerenciadorAcao.popExcluir1Click(Sender: TObject);
begin
  if not sqlCompromissoVencidoBOLETA_ID.IsNull then
  begin
    ShowMessage('Exclusão não permitida. Existe Boleto vinculado!!!');
    exit;
  end;

  if Application.MessageBox(Pchar('Confirma exclusão deste compromisso?'+#13+#13+
      'ATENÇÃO: A EXCLUSÃO DO COMPROMISSO É IRREVERSÍVEL!!!'),
      'Confirmação', MB_YESNO) = IDNO then
      exit;

  sqlCompromissoVencido.delete;
  sqlCompromissoVencido.ApplyUpdates(-1);
  sqlCompromissoVencido.Refresh;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorAcao.popExcluir2Click(Sender: TObject);
var
  viBoleto : Boolean;
begin
  viBoleto :=  False;

  LockWindowUpdate(Handle);
  sqlCompromissoVencido.First;
  While not sqlCompromissoVencido.eof do
  begin
    if sqlCompromissoVencidoSelecionar.AsBoolean then
    begin
      if not sqlCompromissoVencidoBOLETA_ID.IsNull then
      begin
        viBoleto := True;
        Break;
      end;
    end;
    sqlCompromissoVencido.Next;
  end;

  if viBoleto then
  begin
    LockWindowUpdate(0);
    ShowMessage('Exclusão não permitida. Existe Boleto vinculado!!!');
    exit;
  end;

  if Application.MessageBox(Pchar('Confirma exclusão dos COMPROMISSOS SELECIONADOS?'+#13+#13+
      'ATENÇÃO: A EXCLUSÃO DOS COMPROMISSOS É IRREVERSÍVEL!!!'),
      'Confirmação', MB_YESNO) = IDNO then
      exit;

  sqlCompromissoVencido.First;
  While not sqlCompromissoVencido.eof do
  begin
    if sqlCompromissoVencidoSelecionar.AsBoolean then
    begin
      if sqlCompromissoVencidoOBRIGATORIO.AsString = 'S' then
      begin
        sqlCompromissoVencido.Edit;
        sqlCompromissoVencidoSITUACAO.AsString    := '3';
        sqlCompromissoVencidoSELECIONADO.AsString := 'N';
        sqlCompromissoVencido.ApplyUpdates(-1);
        sqlCompromissoVencido.Next;
      end
      else sqlCompromissoVencido.delete
    end
    else sqlCompromissoVencido.Next;
  end;

  sqlCompromissoVencido.ApplyUpdates(-1);
  sqlCompromissoVencido.Refresh;
  sqlCompromissoVencido.First;
  LockWindowUpdate(0);
  AtivarPopMenus;
  sqlCompromissoRealizado.Refresh;
end;

procedure TfrmGerenciadorAcao.popExcluirAgendadoClick(Sender: TObject);
begin
  if sqlCompromissoAgendadoOBRIGATORIO.AsString = 'S' then
  begin
     Application.MessageBox(Pchar(' Exclusão não permitida!!!'+
                                  ' >> Use a opção de Isentar compromisso.'),'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox(Pchar('Confirma exclusão do agendamento selecionado?'+#13+#13+
      'ATENÇÃO: A EXCLUSÃO DO AGENDAMENTO É IRREVERSÍVEL!!!'),
      'Confirmação', MB_YESNO) = IDNO then
      exit;

  sqlCompromissoAgendado.delete;
  sqlCompromissoAgendado.ApplyUpdates(-1);
  sqlCompromissoAgendado.Refresh;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorAcao.popIsentarCompromissoClick(Sender: TObject);
begin
  if not sqlCompromissoVencidoBOLETA_ID.IsNull then
  begin
    ShowMessage('Operação não permitida. Existe Boleto vinculado!!!');
    exit;
  end;

  if Application.MessageBox(Pchar('Isentar Compromisso. Confima?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

{  sqlCompromissoVencido.Edit;
  sqlCompromissoVencidoSITUACAO.AsString           := '3';
  sqlCompromissoVencidoANO_MES_REALIZADO.AsInteger := vgPeriodoAtual;
  sqlCompromissoVencidoDATA_REALIZACAO.AsString    := dtmControles.DataHoraBanco(4);
  sqlCompromissoVencidoPESSOA_NOME.AsString        := lblPessoa.Caption;
  sqlCompromissoVencidoSELECIONADO.AsString        := 'N';
  sqlCompromissoVencido.ApplyUpdates(-1);
  sqlCompromissoVencido.Refresh;
  sqlCompromissoRealizado.Refresh;    }
end;

procedure TfrmGerenciadorAcao.popLancarCompromissoAVencerClick(Sender: TObject);
begin
  LancarCompromissos(1);
end;

procedure TfrmGerenciadorAcao.popReativarCompromissoClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Reativar Compromisso. Confima?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlCompromissoRealizado.Edit;
  sqlCompromissoRealizadoSITUACAO.AsString           := '1';
  sqlCompromissoRealizadoANO_MES_REALIZADO.AsVariant := Null;
  sqlCompromissoRealizadoDATA_REALIZACAO.AsVariant   := Null;
  sqlCompromissoRealizadoPESSOA_NOME.AsVariant       := Null;
  sqlCompromissoRealizado.ApplyUpdates(-1);
  sqlCompromissoVencido.Refresh;
  sqlCompromissoRealizado.Refresh;
end;

procedure TfrmGerenciadorAcao.popRetornarValorClick(Sender: TObject);
begin
  if not sqlCompromissoVencidoBOLETA_ID.IsNull then
  begin
    ShowMessage('Exclusão não permitida. Existe Boleto vinculado!!!');
    exit;
  end;

  if Application.MessageBox(Pchar('Confirma retorno do valor anterior?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlCompromissoVencido.Edit;
  sqlCompromissoVencidoVALOR_ATUAL.AsCurrency := sqlCompromissoVencidoVALOR_ANTERIOR.AsCurrency;
  sqlCompromissoVencidoATUALIZADO.AsString    := 'N';
  sqlCompromissoVencido.ApplyUpdates(-1);

  popRetornarValor.Enabled := False;
end;

procedure TfrmGerenciadorAcao.rdbCompromissosDiversosClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := True;
{  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_PeriodoLimitado;
  fmeCompromisso1.rdbCompromissosDiversosClick(Self);  }
end;

procedure TfrmGerenciadorAcao.rdbCompromissosMensaisClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := False;
{  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_Periodo;
  fmeCompromisso1.rdbCompromissosMensaisClick(self);     }
end;

procedure TfrmGerenciadorAcao.sqlAjusteProgramadoCalcFields(DataSet: TDataSet);
begin
//  sqlAjusteProgramadocalc_AnoMes.AsString := dtmLookup.FormatarAnoMes(sqlAjusteProgramadoANO_MES.AsString);
end;

procedure TfrmGerenciadorAcao.sqlCompromissoAgendadoAfterScroll(
  DataSet: TDataSet);
begin
  popAtivar.Checked := sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1';
  if popAtivar.Checked then
       popAtivar.Caption := 'Isentar Compromisso'
  else popAtivar.Caption := 'Reativat Compromisso';
  AtivarPopMenus;
end;

procedure TfrmGerenciadorAcao.sqlCompromissoAgendadoCalcFields(
  DataSet: TDataSet);
var
  viProgramado : string;
begin
{  sqlCompromissoAgendadocalc_AnoMesInicial.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoAgendadoANO_MES_INICIAL.AsString);
  if (not sqlCompromissoAgendadoANO_MES_FINAL.IsNull) and (sqlCompromissoAgendadoANO_MES_FINAL.AsString <> '') then
    sqlCompromissoAgendadocalc_AnoMesFinal.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoAgendadoANO_MES_FINAL.AsString);

  ExecutaSqlAuxiliar(' SELECT COMPROMISSO_REAJUSTAR, COMPROMISSO_SITUACAO, ANO_MES '+
                     ' FROM T_PROGRAMACAO_AJUSTE '+
                     ' WHERE COMPROMISSO_AGENDADO_ID = '+ sqlCompromissoAgendadoCOMPROMISSO_AGENDADO_ID.AsString+
                     '   AND SITUACAO = ''A''',0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    if dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_REAJUSTAR').AsString = 'S' then
      viProgramado := ' Reajustar valor em '+ dtmLookup.FormatarAnoMes(dtmControles.sqlAuxiliar.FieldByName('ANO_MES').AsString)
    else
      if dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_SITUACAO').AsString = '1' then
           viProgramado := ' Ativar Compromisso em '+ dtmLookup.FormatarAnoMes(dtmControles.sqlAuxiliar.FieldByName('ANO_MES').AsString)
      else viProgramado := ' Isentar Compromisso em '+ dtmLookup.FormatarAnoMes(dtmControles.sqlAuxiliar.FieldByName('ANO_MES').AsString);
    sqlCompromissoAgendadocalc_programado.AsString := viProgramado;
  end
  else sqlCompromissoAgendadocalc_programado.AsString := '';    }
end;

procedure TfrmGerenciadorAcao.sqlCompromissoRealizadoAfterScroll(
  DataSet: TDataSet);
begin
  popReativarCompromisso.Enabled := sqlCompromissoRealizadoSITUACAO.AsString = '3';
end;

procedure TfrmGerenciadorAcao.sqlCompromissoRealizadoCalcFields(
  DataSet: TDataSet);
begin
{  sqlCompromissoRealizadocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString);
  if sqlCompromissoRealizadoBOLETA_ID.AsInteger > 0 then
  begin
    sqlCompromissoRealizadocalc_TipoDocumento.AsString   := '1';
    sqlCompromissoRealizadocalc_NumeroDocumento.AsString := sqlCompromissoRealizadoBOLETA_ID.AsString;
  end
  else
  begin
    if sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger > 0 then
    begin
      sqlCompromissoRealizadocalc_TipoDocumento.AsString   := '2';
      sqlCompromissoRealizadocalc_NumeroDocumento.AsString := sqlCompromissoRealizadoRECIBO_NUMERO.AsString;
    end;
  end;  }
end;

procedure TfrmGerenciadorAcao.sqlCompromissoVencidoAfterScroll(
  DataSet: TDataSet);
begin
  popRetornarValor.Enabled := sqlCompromissoVencidoATUALIZADO.AsString = 'S';
//  fmeCompromisso1.btnEfetuarPagamento.Enabled := (sqlPesquisaSITUACAO.AsInteger in [1,3]) and (not sqlCompromissoVencido.IsEmpty);
  fmeCompromisso1.btnEfetuarPagamento.Enabled := (not sqlCompromissoVencido.IsEmpty);
  AtivarPopMenus;
end;

procedure TfrmGerenciadorAcao.sqlCompromissoVencidoCalcFields(DataSet: TDataSet);
begin
{  sqlCompromissoVencidocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoVencidoANO_MES_REFERENCIA.AsString);
  if sqlCompromissoVencidoBOLETA_ID.IsNull then
       sqlCompromissoVencidocalc_Travado.AsString := 'N'
  else sqlCompromissoVencidocalc_Travado.AsString := 'S';       }

end;

procedure TfrmGerenciadorAcao.sqlPesquisaAfterScroll(DataSet: TDataSet);
begin
//  lblPessoa.Caption := ' '+sqlPesquisaNOME.AsString;
end;

procedure TfrmGerenciadorAcao.sqlPesquisaCalcFields(DataSet: TDataSet);
begin
{  if sqlPesquisaBOLETO_EMAIL.AsString = 'S' then
  begin
    if sqlPesquisaPESSOA_GRUPO_ID.IsNull then
    begin
      if sqlPesquisaPESSOA_TERCEIRO_ID.AsInteger > 0 then
           sqlPesquisacalc_email.AsString := dtmControles.GetStr('SELECT EMAIL FROM T_PESSOA WHERE PESSOA_ID ='+ sqlPesquisaPESSOA_TERCEIRO_ID.AsString)
      else sqlPesquisacalc_email.AsString := sqlPesquisaEMAIL.AsString;
    end
    else sqlPesquisacalc_email.AsString := dtmControles.GetStr(' SELECT EMAIL FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+ sqlPesquisaPESSOA_GRUPO_ID.AsString);
  end;    }
end;

end.



