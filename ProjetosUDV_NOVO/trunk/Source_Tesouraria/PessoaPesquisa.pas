unit PessoaPesquisa;

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
  FrameCompromisso, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, DbxDevartInterBase;

type
  TfrmPessoaPesquisa = class(TForm)
    PanelBotoes: TPanel;
    PanelBotoesBasicos: TPanel;
    PanelBotaoFechar: TPanel;
    pgcPesquisa: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    cxLabel29: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    tabCompromissos: TcxTabSheet;
    tabMovimentacao: TcxTabSheet;
    cxGridPesquisaNome: TcxGridDBColumn;
    cxGridPesquisaColumn10: TcxGridDBColumn;
    cxGridPesquisaColumn11: TcxGridDBColumn;
    sqlPesquisa: TSimpleDataSet;
    dtsPesquisa: TDataSource;
    sqlPesquisaNOME: TStringField;
    sqlPesquisaCPF: TStringField;
    sqlPesquisaRG: TStringField;
    sqlPesquisaTELEFONES: TStringField;
    sqlPesquisaSITUACAO: TStringField;
    sqlPesquisaGRAU: TStringField;
    sbnLimparFiltro: TSpeedButton;
    cxGridPesquisaColumn14: TcxGridDBColumn;
    cxGridPesquisaColumn16: TcxGridDBColumn;
    sqlPesquisaPESSOA_GRUPO_ID: TFMTBCDField;
    sqlPesquisaPESSOA_ID: TFMTBCDField;
    splitFamilia: TcxSplitter;
    Panel1: TPanel;
    sqlCompromissoAgendado: TSimpleDataSet;
    dtsCompromissoAgendado: TDataSource;
    sqlCompromissoVencido: TSimpleDataSet;
    dtsCompromissoVencido: TDataSource;
    sqlCompromissoVencidocalc_referencia: TStringField;
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
    sqlCompromissoVencidoQTD_ADICIONAL: TFMTBCDField;
    sqlCompromissoVencidoATUALIZADO: TStringField;
    popRetornarValor: TMenuItem;
    sqlCompromissoVencidoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoVencidoVALOR_ANTERIOR: TFMTBCDField;
    N4: TMenuItem;
    popAtivar: TMenuItem;
    sqlCompromissoVencidocalc_travado: TStringField;
    popLancarCompromissoAVencer: TMenuItem;
    N5: TMenuItem;
    fmeCompromisso1: TfmeCompromisso;
    cxGroupBox2: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    sqlCompromissoRealizado: TSimpleDataSet;
    dtsCompromissoRealizado: TDataSource;
    Panel2: TPanel;
    cxGroupBox3: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxGroupBox4: TcxGroupBox;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxCheckBox1: TcxCheckBox;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxRadioButton6: TcxRadioButton;
    cxRadioButton7: TcxRadioButton;
    cxRadioButton8: TcxRadioButton;
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
    cxGridDBTableView3Column3: TcxGridDBColumn;
    popLancarCompromissoVencido: TMenuItem;
    sqlCompromissoAgendadoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoAgendadoCEDENTE_ID: TFMTBCDField;
    sqlCompromissoVencidoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoVencidoCEDENTE_ID: TFMTBCDField;
    sqlCompromissoAgendadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoVencidoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TFMTBCDField;
    cxGridDBTableView3Column4: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    sqlPesquisaEMAIL: TStringField;
    cxGridPesquisaObservacao: TcxGridDBColumn;
    sqlPesquisaOBSERVACAO: TStringField;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    sqlPesquisaBOLETO_EMAIL: TStringField;
    sqlPesquisaSELECIONADO: TStringField;
    sqlCompromissoVencidoSELECIONADO: TStringField;
    cxGridDBTableView3Column5: TcxGridDBColumn;
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
    sqlCompromissoAgendadocalc_programado: TStringField;
    tabAjusteProgramado: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGridDBTableView4Column3: TcxGridDBColumn;
    cxGridDBTableView4Column4: TcxGridDBColumn;
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
    lblInformacaoLancamento: TcxLabel;
    sqlCompromissoAgendadoCALC_VALOR: TCurrencyField;
    edtPesqNome: TcxTextEdit;
    lcxPesqGrupo: TcxLookupComboBox;
    icxPesqGrau: TcxImageComboBox;
    icxPesqSituacao: TcxImageComboBox;
    btnPesquisarRegistro: TcxButton;
    btnLimparPesquisa: TcxButton;
    cxBtnIncluir: TcxButton;
    cxBtnAlterar: TcxButton;
    cxBtnExcluir: TcxButton;
    cxBtnFechar: TcxButton;
    sqlCompromissoAgendadoRESERVA_ID: TFMTBCDField;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    sqlPesquisaCALC_CPF: TStringField;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    sqlPesquisaPESSOA_ENVIO_EMAIL: TStringField;
    pgcCompromissos: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tbcCompVencidos: TcxTabSheet;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableVencidos: TcxGridDBTableView;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBTableVencidosColumn4: TcxGridDBColumn;
    cxGridDBTableVencidosColumn2: TcxGridDBColumn;
    cxGridDBTableAtualizado: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBTableDiferenca: TcxGridDBColumn;
    cxGridDBTableQtdAdicional: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableVencidosColumn1: TcxGridDBColumn;
    cxGridDBTableVencidosColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column5: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column4: TcxGridDBColumn;
    cxGridDBTableView2Column7: TcxGridDBColumn;
    cxGridDBTableValor: TcxGridDBColumn;
    cxGridDBTableView2Column6: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridDBTableProgramacao: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    sqlPesquisaFATURA_TIPO: TStringField;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure cxBtnIncluirClick(Sender: TObject);
    procedure btnPesquisarRegistroClick(Sender: TObject);
    procedure sbnLimparFiltroClick(Sender: TObject);
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
    procedure cxGridDBTableVencidosColumn3CustomDrawCell(
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
    procedure popProgramacaoAjusteClick(Sender: TObject);
    procedure sqlAjusteProgramadoCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableVencidosColumn3HeaderClick(Sender: TObject);
    procedure cxBtnExcluirClick(Sender: TObject);
    procedure sqlCompromissoVencidoAfterRefresh(DataSet: TDataSet);
  private
    vlAbrindoForm, vlCarregarCompromissos, vlTravar, vlLiberarAlteracao : Boolean;
    vlPeriodoAtualS : string;
    vlPeriodoAtualI : Integer;

    procedure AtivarCompromissos;
    Procedure AtivarPopMenus;
    procedure LancarCompromissos(vpTipo : Integer);
  public
    { Public declarations }
  end;

var
  frmPessoaPesquisa: TfrmPessoaPesquisa;

implementation

uses Rotinas, Controles, Cadastro, PessoaUDV, Lookup, LancamentoAdiantado,
  GerenciadorRecebimento, ProgramacaoAjuste, Lookup_Contabil, LookupBoleto,
  LookupFinanceiro;

{$R *.dfm}

procedure TfrmPessoaPesquisa.popAlterarValor1Click(Sender: TObject);
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

procedure TfrmPessoaPesquisa.popAlterarValorAgendadoClick(Sender: TObject);
var
  viValorAtual : String;
  viValorNovo : Currency;
  viFlag : Boolean;

  procedure VerificarReajusteCompromisso;
  var
    viProgramarReajuste : Boolean;
    viValorCompromisso  : Currency;
  begin
    viValorCompromisso := dtmControles.GetFloat(' SELECT VALOR_ATUAL FROM T_lANCAMENTO_COMPROMISSO '+
                                                ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoAgendadoLANCAMENTO_COMPROMISSO_ID.AsString);

    if sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency >= viValorCompromisso then
      Exit;

    viProgramarReajuste := dtmControles.GetStr(' SELECT PROGRAMAR_REAJUSTE FROM T_CONTABIL_CONTA '+
                                               ' WHERE CONTABIL_CONTA_ID = '+sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsString) = 'S';
    if viProgramarReajuste then
    begin
      vgProgramacaoObrigatoria := True;
      popProgramacaoAjusteClick(self);
    end;
  end;

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
             begin
               VerificarReajusteCompromisso;
               exit;
             end;

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

  VerificarReajusteCompromisso;

end;

procedure TfrmPessoaPesquisa.popAtivarClick(Sender: TObject);
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

procedure TfrmPessoaPesquisa.AtivarCompromissos;
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
           '    AND ((SITUACAO_GERAL = ''1'') or (SITUACAO_GERAL IS NULL))';
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

  tabAjusteProgramado.TabVisible := sqlAjusteProgramado.RecordCount > 0;

  sqlCompromissoVencido.Active := False;
  sqlCompromissoVencido.DataSet.CommandText := viSql;
  sqlCompromissoVencido.Active := True;
  dtmLookup.MarcarDesmarcarCompromissos(sqlCompromissoVencido, False);
  AtivarPopMenus;
  Screen.Cursor := crDefault;
end;

procedure TfrmPessoaPesquisa.AtivarPopMenus;
begin
  popIsentarCompromisso.Enabled := (not sqlCompromissoVencido.IsEmpty) and (sqlCompromissoVencidoOBRIGATORIO.AsString = 'S');
  popExcluir1.Enabled           := (not sqlCompromissoVencido.IsEmpty) and ((sqlCompromissoVencidoOBRIGATORIO.AsString = 'N') or (sqlCompromissoAgendadoOBRIGATORIO.AsString = ''));
  popExcluir2.Enabled           := not sqlCompromissoVencido.IsEmpty;
  popAlterarValor1.Enabled      := not sqlCompromissoVencido.IsEmpty;
  popRetornarValor.Enabled      := (not sqlCompromissoVencido.IsEmpty) and (sqlCompromissoVencidoATUALIZADO.AsString = 'S')
                                   and (sqlCompromissoVencidoVALOR_ANTERIOR.AsCurrency > 0);
  popCancelarBoletaVinculada.Enabled := not sqlCompromissoVencidoBOLETA_ID.IsNull;

  popAlterarValorAgendado.Enabled     := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1');
  popExcluirAgendado.Enabled          := (not sqlCompromissoAgendado.IsEmpty) and ((sqlCompromissoAgendadoOBRIGATORIO.AsString = 'N') or (sqlCompromissoAgendadoOBRIGATORIO.AsString = ''));
  popAtivar.Enabled                   := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoOBRIGATORIO.AsString = 'S');
  popProgramacaoAjuste.Enabled        := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoOBRIGATORIO.AsString = 'S');
  popLancarCompromissoAVencer.Enabled := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1');
  popLancarCompromissoVencido.Enabled := (not sqlCompromissoAgendado.IsEmpty) and (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1')
                                          and (sqlCompromissoAgendadoPERIODO.AsString = '1');
end;

procedure TfrmPessoaPesquisa.btnConfirmarCompromissoClick(Sender: TObject);
begin
  fmeCompromisso1.btnConfirmarCompromissoClick(Self);

  // Seta todos os compromissos da pessoa com não atualizado.
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET ATUALIZADO = '+QuotedStr('N')+
                     ' WHERE PESSOA_ID = '+ sqlPesquisaPESSOA_ID.AsString,1);

  with dtmLookupContabil do
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

    if fmeCompromisso1.lcxReserva.EditValue = null then
         vgCompromissoVencido.ReservaId := 0
    else vgCompromissoVencido.ReservaId := fmeCompromisso1.lcxReserva.EditValue;

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
  sqlCompromissoVencido.Refresh

end;

procedure TfrmPessoaPesquisa.btnEfetuarPagamentoClick(Sender: TObject);
begin
  if (vgGrupoSelecionadoId = 0) or (sqlPesquisaPESSOA_GRUPO_ID.AsInteger <> vgGrupoSelecionadoId) then
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

  if sqlPesquisaSITUACAO.AsInteger in [2..5] then
    vgSocioAfastado := vgPessoaSelecionadaId;
  CadGerenciadorRecebimento(False);
end;

procedure TfrmPessoaPesquisa.btnLimparCompromissoClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := False;
  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_PeriodoLimitado;
  fmeCompromisso1.btnLimparCompromissoClick(self);
end;

procedure TfrmPessoaPesquisa.btnLimparPesquisaClick(Sender: TObject);
begin
  edtPesqNome.Clear;
  lcxPesqGrupo.EditValue    := null;
  icxPesqGrau.EditValue     := '-1';
  icxPesqSituacao.EditValue := '1';
  btnPesquisarRegistroClick(Self);
end;

procedure TfrmPessoaPesquisa.btnPesquisarRegistroClick(Sender: TObject);
var
  viPesquisa, viCondicao : String;
begin
  viPesquisa := ' SELECT P1.PESSOA_ID, P1.NOME, P1.CPF, P1.RG, P1.SELECIONADO, '+
                '        P1.TELEFONES, P1.SITUACAO, P1.GRAU, P1.PESSOA_GRUPO_ID, '+
                '        P1.EMAIL, P1.OBSERVACAO, P1.BOLETO_EMAIL, P1.PESSOA_TERCEIRO_ID, '+
                '        P1.FATURA_TIPO, '+
                '     CASE '+
                '       WHEN (P1.PESSOA_TERCEIRO_ID > 0) THEN '+
                '       (SELECT P2.NOME '+
                '       FROM T_PESSOA P2 '+
                '       WHERE P2.PESSOA_ID = P1.PESSOA_TERCEIRO_ID) '+
                '      ELSE '+
                '       (SELECT P2.NOME '+
                '       FROM T_PESSOA P2 '+
                '       WHERE P2.PESSOA_GRUPO_ID = P1.PESSOA_GRUPO_ID '+
                '        AND P2.EMAIL_GRUPO_PADRAO = ''S'' '+
                '         AND P2.NOME <> P1.NOME) '+
                '      END AS PESSOA_ENVIO_EMAIL '+
                '    FROM T_PESSOA P1 '+
                ' WHERE P1.CEDENTE_ID = '+IntToStr(vgCedenteAtivo);
  viCondicao := '';

  if vgPessoaSelecionadaId <> 0 then
    viCondicao := ' AND P1.PESSOA_ID = '+ IntToStr(vgPessoaSelecionadaId)
  else
  begin
    if edtPesqNome.Text <> '' then
      viCondicao := ' AND P1.NOME LIKE '+QuotedStr(edtPesqNome.text+'%') ;

    if lcxPesqGrupo.EditValue <> null then
      viCondicao := viCondicao + ' AND P1.PESSOA_GRUPO_ID = '+IntToStr(lcxPesqGrupo.EditValue);

    if icxPesqGrau.EditValue <> '-1' then
      viCondicao := viCondicao + ' AND P1.GRAU = '+QuotedStr(icxPesqGrau.EditValue);

    if icxPesqSituacao.EditValue <> '-1' then
      viCondicao := viCondicao + ' AND P1.SITUACAO = '+QuotedStr(icxPesqSituacao.EditValue);
  end;

  viPesquisa := viPesquisa + viCondicao + 'ORDER BY P1.NOME, P1.GRAU DESC ';
  sqlPesquisa.Active := False;
  sqlPesquisa.DataSet.CommandText := viPesquisa;
  sqlPesquisa.Active := True;

  tabCompromissos.TabVisible := sqlPesquisa.RecordCount > 0;
  tabMovimentacao.TabVisible := sqlPesquisa.RecordCount > 0;
  cxBtnAlterar.Enabled       := sqlPesquisa.RecordCount > 0;
//  cxBtnExcluir.Enabled       := sqlPesquisa.RecordCount > 0;

  if sqlPesquisa.IsEmpty then
    lblPessoa.Caption := '';

  if (not vlAbrindoForm) and (vgPessoaSelecionadaId = 0) then
    edtPesqNome.SetFocus;
end;

procedure TfrmPessoaPesquisa.popCancelarBoletaVinculadaClick(Sender: TObject);
begin
  if not dtmLookupFinanceiro.CancelarBoleto(sqlCompromissoVencidoBOLETA_ID.AsString) then
    exit;

  sqlCompromissoVencido.Refresh;
end;

procedure TfrmPessoaPesquisa.cxBtnAlterarClick(Sender: TObject);
begin
  vgNovoCadastro     := False;
  vgSelecionado      := True;
  vgPermiteAlteracao := sqlPesquisaSITUACAO.AsString = '0';
  vgPessoa.PessoaId := sqlPesquisaPESSOA_ID.AsInteger;
  CadPessoaUDV(True);
  sqlPesquisa.Refresh;
end;

procedure TfrmPessoaPesquisa.cxBtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão da Pessoa Selecionada?', 'Pergunta', MB_YESNO) = IDNO then
     exit;


end;

procedure TfrmPessoaPesquisa.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPessoaPesquisa.cxBtnIncluirClick(Sender: TObject);
begin
  vgNovoCadastro     := True;
  vgSelecionado      := False;
  vgPermiteAlteracao := True;
  vgPessoa.PessoaId := 0;
  CadPessoaUDV(True);
  sqlPesquisa.Refresh;
end;

procedure TfrmPessoaPesquisa.cxGridDBTableVencidosColumn3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{  if AViewInfo.RecordViewInfo.GridRecord.Values[9] = True then
    ACanvas.Font.Color := clRed;}
end;

procedure TfrmPessoaPesquisa.cxGridDBTableVencidosColumn3HeaderClick(
  Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarCompromissos(sqlCompromissoVencido, not sqlCompromissoVencidoSelecionar.AsBoolean);
end;

procedure TfrmPessoaPesquisa.cxGridDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[0] = '2' then
    ACanvas.Font.Color := clOlive;

end;

procedure TfrmPessoaPesquisa.cxGridPesquisaDblClick(Sender: TObject);
begin
//  pgcPesquisa.ActivePageIndex := 1;
//  pgcPesquisaChange(self);

  cxBtnAlterarClick(self);
end;

procedure TfrmPessoaPesquisa.edtPesqNomeEnter(Sender: TObject);
begin
  if not vlTravar then
  lcxPesqGrupo.EditValue := null;
end;

procedure TfrmPessoaPesquisa.edtPesqNomeKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPessoaPesquisa.fmeCompromisso1tabBalanceteChange(Sender: TObject);
begin
  fmeCompromisso1.tabBalanceteChange(Sender);

end;

procedure TfrmPessoaPesquisa.FormActivate(Sender: TObject);
begin
  if vgPessoaSelecionadaId > 0 then
  begin
    btnPesquisarRegistroClick(self);
    if pgcPesquisa.ActivePageIndex = 0 then
      pgcPesquisa.ActivePageIndex := 1;

    vlCarregarCompromissos := True;
    pgcPesquisaChange(self);
    vgPessoaSelecionadaId := 0;
  end;

  if pgcPesquisa.ActivePageIndex = 1 then
  begin
    if fmeCompromisso1.rdbCompromissosDiversos.Checked then
         rdbCompromissosDiversosClick(self)
    else rdbCompromissosMensaisClick(Self);
  end;

end;

procedure TfrmPessoaPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlPesquisa.Active              := False;
  sqlCompromissoAgendado.Active   := False;
  sqlCompromissoVencido.Active    := False;
  sqlCompromissoRealizado.Active  := False;
  sqlAjusteProgramado.Active      := False;

  Action            := caFree;
  frmPessoaPesquisa := nil;
end;

procedure TfrmPessoaPesquisa.FormCreate(Sender: TObject);
begin
  sqlPesquisa.Connection              := dtmControles.DB;
  sqlCompromissoAgendado.Connection   := dtmControles.DB;
  sqlCompromissoVencido.Connection    := dtmControles.DB;
  sqlCompromissoRealizado.Connection  := dtmControles.DB;
  sqlAjusteProgramado.Connection      := dtmControles.DB;

  dtmLookup.CarregarTabBalancete(fmeCompromisso1.tabBalancete);
  vlAbrindoForm := True;
  pgcPesquisa.ActivePageIndex := 0;
  btnPesquisarRegistroClick(self);
  pgcPesquisaChange(SELF);
  vlAbrindoForm   := False;
  vlPeriodoAtualS :=(copy(dtmControles.DataHoraBanco(4),4,2))+'/'+(copy(dtmControles.DataHoraBanco(4),7,4));
  vlCarregarCompromissos := True;
end;

procedure TfrmPessoaPesquisa.FormShow(Sender: TObject);
begin
  if pgcPesquisa.ActivePageIndex = 0 then
    edtPesqNome.SetFocus;

//  cxBtnIncluir.Enabled := vgSincronizarReuni = 'N';
  cxBtnExcluir.Enabled := vgSincronizarReuni = 'N';
end;

procedure TfrmPessoaPesquisa.icxPesqGrauPropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxPesqGrupoPropertiesEditValueChanged(Self);
end;

procedure TfrmPessoaPesquisa.icxPesqSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxPesqGrupoPropertiesEditValueChanged(Self);
end;

procedure TfrmPessoaPesquisa.popLancarCompromissoVencidoClick(Sender: TObject);
begin
  LancarCompromissos(2);
end;

procedure TfrmPessoaPesquisa.LancarCompromissos(vpTipo: Integer);
var
  viFlag : Boolean;
begin
  viFlag := False;
  vgLancamentoAdiantado.LancarTodosCompromissos := False;
  vgLancamentoAdiantado.LancamentoIniciado      := False;
  vgCompromissoVencido.NenhumaAlteracao         := True;
  repeat
    vgLancamentoAdiantado.Compromisso      := sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsInteger;
    vgLancamentoAdiantado.AnoMesInicial    := sqlCompromissoAgendadoANO_MES_INICIAL.AsString;
    vgLancamentoAdiantado.AnoMesFinal      := sqlCompromissoAgendadoANO_MES_FINAL.AsString;
    vgLancamentoAdiantado.Periodo          := sqlCompromissoAgendadoPERIODO.AsInteger;
    vgLancamentoAdiantado.Pessoa           := sqlPesquisaPESSOA_ID.AsInteger;
    vgLancamentoAdiantado.Valor            := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency;
    vgLancamentoAdiantado.Obrigatorio      := sqlCompromissoAgendadoOBRIGATORIO.AsString;
    vgLancamentoAdiantado.CentroCustoId    := sqlCompromissoAgendadoCENTRO_CUSTO_ID.AsInteger;
    vgLancamentoAdiantado.BalanceteGrupoId := sqlCompromissoAgendadoBALANCETE_GRUPO_ID.AsInteger;
    vgLancamentoAdiantado.Tipo                    := vpTipo;
    vgLancamentoAdiantado.LancamentoCompromissoId := sqlCompromissoAgendadoLANCAMENTO_COMPROMISSO_ID.AsInteger;
    vgLancamentoAdiantado.ReservaId               := sqlCompromissoAgendadoRESERVA_ID.AsInteger;

    if not vgLancamentoAdiantado.LancarTodosCompromissos then
    begin
      if vpTipo = 1 then
           vgLancamentoAdiantado.Caption       := 'Lançamento de compromisso adiantando'
      else vgLancamentoAdiantado.Caption       := 'Lançamento de compromisso vencido';
      ExibirFormulario(TfrmLancamentoAdiantado, frmLancamentoAdiantado, True);
    end
    else
    begin
      if sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1' then
      begin
        if (vgLancamentoAdiantado.AnoMesFinal = '') then
          vgCompromissoVencido.PeriodoFinal  := vgCompromissoVencido.PeriodoTodosFinal
        else
        begin
          vgCompromissoVencido.PeriodoFinal  := vgLancamentoAdiantado.AnoMesFinal;
          if vgLancamentoAdiantado.AnoMesFinal > vgCompromissoVencido.PeriodoTodosFinal then
               vgCompromissoVencido.PeriodoFinal  := vgCompromissoVencido.PeriodoTodosFinal
          else vgCompromissoVencido.PeriodoFinal  := vgLancamentoAdiantado.AnoMesFinal;
        end;

        vgCompromissoVencido.PeriodoInicial          := vgCompromissoVencido.PeriodoTodosInicial;
        vgCompromissoVencido.PeriodoTipo             := vgLancamentoAdiantado.Periodo;
        vgCompromissoVencido.ContabilContaId         := vgLancamentoAdiantado.Compromisso;
        vgCompromissoVencido.Valor                   := vgLancamentoAdiantado.Valor;
        vgCompromissoVencido.CentroCustoId           := vgLancamentoAdiantado.CentroCustoId;
        vgCompromissoVencido.BalanceteGrupoId        := vgLancamentoAdiantado.BalanceteGrupoId;
        vgCompromissoVencido.LancamentoCompromissoId := IntToStr(vgLancamentoAdiantado.LancamentoCompromissoId);
        vgCompromissoVencido.ReservaId               := vgLancamentoAdiantado.ReservaId;

        dtmLookup.AdicionarCompromisso(True, False, True, 'C');
      end;
    end;

    if (vgLancamentoAdiantado.LancarTodosCompromissos) then
    begin
      if vgLancamentoAdiantado.LancamentoIniciado then
        sqlCompromissoAgendado.Next
      else
      begin
         sqlCompromissoAgendado.First;
         vgCompromissoVencido.PeriodoTodosFinal   := vgCompromissoVencido.PeriodoFinal;
         vgCompromissoVencido.PeriodoTodosInicial := vgCompromissoVencido.PeriodoInicial;
         vgLancamentoAdiantado.LancamentoIniciado := True;
      end;

      if sqlCompromissoAgendado.Eof then
      begin
        if vgCompromissoVencido.NenhumaAlteracao then
             Application.MessageBox('Nenhuma alteração realizada!!!', 'Informação', MB_OK + MB_ICONWARNING)
        else
        begin
          sqlCompromissoVencido.Refresh;
          Application.MessageBox('Compromissos Fixos Lançados com Sucesso!!!', 'Informação', MB_OK + MB_ICONWARNING);
        end;
        viFlag := True
      end;
    end
    else
    begin
      viFlag := True;
      if vgLancamentoAdiantado.vgOK then
      begin
        sqlCompromissoVencido.Refresh;
        if vgCompromissoVencido.NenhumaAlteracao then
          Application.MessageBox('Nenhuma alteração realizada!!!', 'Informação', MB_OK + MB_ICONWARNING)
      end;
    end;
  until viFlag;
end;

procedure TfrmPessoaPesquisa.lcxPesqGrupoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if vlTravar then
    exit;

  vlTravar := True;
  edtPesqNome.Clear;
  btnPesquisarRegistroClick(self);
  vlTravar := False;
end;

procedure TfrmPessoaPesquisa.popProgramacaoAjusteClick(Sender: TObject);
begin
  vgProgramacaoAjuste.PessoaId              := sqlPesquisaPESSOA_ID.AsInteger;
  vgProgramacaoAjuste.CompromissoAgendadoId := sqlCompromissoAgendadoCOMPROMISSO_AGENDADO_ID.AsInteger;
  vgProgramacaoAjuste.ContabilContaId       := sqlCompromissoAgendadoCONTABIL_CONTA_ID.AsInteger;
  vgProgramacaoAjuste.ValorAnterior         := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency;
  vgProgramacaoAjuste.SituacaoAnterior      := sqlCompromissoAgendadoSITUACAO_LOCAL.AsString;
  ExibirFormulario(TfrmProgramacaoAjuste, frmProgramacaoAjuste, True);
  if vgProgramacaoAjuste.Confirmado then
    sqlCompromissoAgendado.Refresh;
end;

procedure TfrmPessoaPesquisa.pgcPesquisaChange(Sender: TObject);
begin
  case pgcPesquisa.ActivePageIndex of
   0 : begin
         if not vlAbrindoForm then
           edtPesqNome.SetFocus; 
         vlCarregarCompromissos := True;
         tabAjusteProgramado.TabVisible := False;
       end;
   1 : begin
         if vlCarregarCompromissos then
         begin
           AtivarCompromissos;
           btnLimparCompromissoClick(self);
           pgcCompromissos.ActivePageIndex := 0;
         end;
         vlCarregarCompromissos := False;

//         fmeCompromisso1.btnConfirmarCompromisso.Enabled := (sqlPesquisaSITUACAO.AsInteger in [1,3]);
         fmeCompromisso1.btnConfirmarCompromisso.Enabled := True; 
//         fmeCompromisso1.btnEfetuarPagamento.Enabled     := (sqlPesquisaSITUACAO.AsInteger in [1,3]);

         if (sqlPesquisaPESSOA_GRUPO_ID.AsInteger = vgGrupoSelecionadoId) and (not (sqlPesquisaPESSOA_GRUPO_ID.IsNull)) then
              fmeCompromisso1.btnEfetuarPagamento.Caption := 'Voltar...'
         else fmeCompromisso1.btnEfetuarPagamento.Caption := 'Clique para Efetuar Pagamento';
         sqlCompromissoVencidoAfterScroll(sqlCompromissoVencido);
       end;
   2: AtivarCompromissos;
  end;
end;

procedure TfrmPessoaPesquisa.popExcluir1Click(Sender: TObject);
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

procedure TfrmPessoaPesquisa.popExcluir2Click(Sender: TObject);
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
      'ATENÇÃO: COMPROMISSOS OBRIGATÓRIOS serão isentos. Os demais serão excluídos definitivamente!!!'),
      'Confirmação', MB_YESNO) = IDNO then
  begin
    LockWindowUpdate(0);   
    exit;
  end; 

  sqlCompromissoVencido.First;
  While not sqlCompromissoVencido.eof do
  begin
    if sqlCompromissoVencidoSelecionar.AsBoolean then
    begin
      if (sqlCompromissoVencidoOBRIGATORIO.AsString = 'S') and
         (sqlCompromissoVencidoANO_MES_REFERENCIA.AsInteger <= vgPeriodoAtual) then
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

procedure TfrmPessoaPesquisa.popExcluirAgendadoClick(Sender: TObject);
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

procedure TfrmPessoaPesquisa.popIsentarCompromissoClick(Sender: TObject);
begin
  if not sqlCompromissoVencidoBOLETA_ID.IsNull then
  begin
    ShowMessage('Operação não permitida. Existe Boleto vinculado!!!');
    exit;
  end;

  if Application.MessageBox(Pchar('Isentar Compromisso. Confima?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlCompromissoVencido.Edit;
  sqlCompromissoVencidoSITUACAO.AsString           := '3';
  sqlCompromissoVencidoANO_MES_REALIZADO.AsInteger := vgPeriodoAtual;
  sqlCompromissoVencidoDATA_REALIZACAO.AsString    := dtmControles.DataHoraBanco(4);
  sqlCompromissoVencidoPESSOA_NOME.AsString        := lblPessoa.Caption;
  sqlCompromissoVencidoSELECIONADO.AsString        := 'N';
  sqlCompromissoVencido.ApplyUpdates(-1);
  sqlCompromissoVencido.Refresh;
  sqlCompromissoRealizado.Refresh;
end;

procedure TfrmPessoaPesquisa.popLancarCompromissoAVencerClick(Sender: TObject);
begin
  LancarCompromissos(1);
end;

procedure TfrmPessoaPesquisa.popReativarCompromissoClick(Sender: TObject);
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

procedure TfrmPessoaPesquisa.popRetornarValorClick(Sender: TObject);
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

procedure TfrmPessoaPesquisa.rdbCompromissosDiversosClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := True;
  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_PeriodoLimitado;
  fmeCompromisso1.rdbCompromissosDiversosClick(Self);
end;

procedure TfrmPessoaPesquisa.rdbCompromissosMensaisClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := False;
  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_Periodo;
  fmeCompromisso1.rdbCompromissosMensaisClick(self);
end;

procedure TfrmPessoaPesquisa.sbnLimparFiltroClick(Sender: TObject);
begin
  lcxPesqGrupo.EditValue := null;
end;

procedure TfrmPessoaPesquisa.sqlAjusteProgramadoCalcFields(DataSet: TDataSet);
begin
  sqlAjusteProgramadocalc_AnoMes.AsString := dtmLookup.FormatarAnoMes(sqlAjusteProgramadoANO_MES.AsString);
end;

procedure TfrmPessoaPesquisa.sqlCompromissoAgendadoAfterScroll(
  DataSet: TDataSet);
begin
  popAtivar.Checked := sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1';
  if popAtivar.Checked then
       popAtivar.Caption := 'Isentar Compromisso'
  else popAtivar.Caption := 'Reativat Compromisso';
  AtivarPopMenus;
end;

procedure TfrmPessoaPesquisa.sqlCompromissoAgendadoCalcFields(
  DataSet: TDataSet);
var
  viProgramado : string;
begin
  sqlCompromissoAgendadocalc_AnoMesInicial.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoAgendadoANO_MES_INICIAL.AsString);
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
  else sqlCompromissoAgendadocalc_programado.AsString := '';

  if (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1') and
     ((sqlCompromissoAgendadoSITUACAO_GERAL.AsString = '1') or (sqlCompromissoAgendadoSITUACAO_GERAL.IsNull)) then
        sqlCompromissoAgendadoCALC_VALOR.AsCurrency := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency
   else sqlCompromissoAgendadoCALC_VALOR.AsCurrency := 0;
end;

procedure TfrmPessoaPesquisa.sqlCompromissoRealizadoAfterScroll(
  DataSet: TDataSet);
begin
  popReativarCompromisso.Enabled := sqlCompromissoRealizadoSITUACAO.AsString = '3';
end;

procedure TfrmPessoaPesquisa.sqlCompromissoRealizadoCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoRealizadocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString,'-');
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
  end;
end;

procedure TfrmPessoaPesquisa.sqlCompromissoVencidoAfterRefresh(
  DataSet: TDataSet);
begin
  sqlCompromissoVencidoAfterScroll(sqlCompromissoVencido);
end;

procedure TfrmPessoaPesquisa.sqlCompromissoVencidoAfterScroll(
  DataSet: TDataSet);
begin
  popRetornarValor.Enabled := sqlCompromissoVencidoATUALIZADO.AsString = 'S';
  fmeCompromisso1.btnEfetuarPagamento.Enabled := (not sqlCompromissoVencido.IsEmpty);

  if cxGridDBTableVencidos.DataController.Summary.FooterSummaryValues[0] <> null then
       tbcCompVencidos.Caption := 'Compromissos Vencidos ('+FormatFloat('R$, #0.00', cxGridDBTableVencidos.DataController.Summary.FooterSummaryValues[0])+')'
  else tbcCompVencidos.Caption := 'Compromissos Vencidos ('+FormatFloat('R$, #0.00', 0);
  AtivarPopMenus;
end;

procedure TfrmPessoaPesquisa.sqlCompromissoVencidoCalcFields(DataSet: TDataSet);
begin
  sqlCompromissoVencidocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoVencidoANO_MES_REFERENCIA.AsString);
  if sqlCompromissoVencidoBOLETA_ID.IsNull then
       sqlCompromissoVencidocalc_Travado.AsString := 'N'
  else sqlCompromissoVencidocalc_Travado.AsString := 'S';

end;

procedure TfrmPessoaPesquisa.sqlPesquisaAfterScroll(DataSet: TDataSet);
begin
  lblPessoa.Caption := ' '+sqlPesquisaNOME.AsString;

//  cxBtnIncluir.Enabled := (vgSincronizarReuni = 'N') or (sqlPesquisaSITUACAO.AsString = '0');
  cxBtnExcluir.Enabled := (vgSincronizarReuni = 'N') or (sqlPesquisaSITUACAO.AsString = '0');
end;

procedure TfrmPessoaPesquisa.sqlPesquisaCalcFields(DataSet: TDataSet);
begin
  sqlPesquisaCALC_CPF.AsString := RetornaCPFCNPJFormatado(sqlPesquisaCPF.AsString);
end;

end.









